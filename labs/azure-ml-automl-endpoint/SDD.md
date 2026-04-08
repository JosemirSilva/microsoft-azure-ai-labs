# Solution Design Document – Azure ML Automated ML

## 1. Objetivo da Solução

Criar um modelo de Machine Learning utilizando Automated ML no Azure Machine Learning e disponibilizá-lo por meio de um endpoint online para inferência em tempo real.

**Contexto académico:** projeto **1/5** da trilha [Microsoft — Fundamentos de IA (DIO)](https://web.dio.me/track/microsoft-fundamentos-de-ia).

## 2. Visão Geral da Arquitetura

- Azure Machine Learning Workspace
- Dataset registado (tabular)
- Experimento de Automated ML
- Modelo registado no registry
- Online Endpoint (Managed)
- Consumo via requisição HTTP (JSON)

Diagrama de referência: [docs/architecture.md](../../docs/architecture.md).

### Workspace provisionado (Portal Azure)

| Campo | Valor |
|--------|--------|
| Nome do workspace | `mlw-dio-aif-dev-centralus-01` |
| Resource group | `rg-dio-aif-ml-dev-centralus` |
| Região | Central US |
| Estado de provisionamento | Succeeded |
| Storage (associado) | `stdioaifmlcentralus01` |
| Key Vault (associado) | `kv-dio-aif-dev-centralus` |
| Application Insights (associado) | `appi-dio-aif-ml-dev-centralus-01` |

Evidência (portfólio): [assets/screenshots/01-workspace-overview.png](./assets/screenshots/01-workspace-overview.png), [assets/screenshots/studio/01-home-dashboard.png](./assets/screenshots/studio/01-home-dashboard.png), [assets/screenshots/workspace/](./assets/screenshots/workspace/).

## 3. Dataset

- **Origem (repositório):** [data/customer_churn.csv](./data/customer_churn.csv) — CSV sintético, vírgula, sem dados pessoais.
- **Origem (Azure ML — utilizado no AutoML):** **`ds-automl-classification-v2`**, **versão 1**, tipo **Table (mltable)** com dataset v1 API **Tabular**; arquivo `customer_churn.csv` no **workspaceblobstore**. Descrição: *Lab ML DIO*.
- **Nota:** Foi criado primeiro `ds-automl-classification-v1` (File); o preview falhou para AutoML; a solução foi registar **v2** como tabular com schema inferido.
- **Tipo de problema:** classificação binária.
- **Variável alvo:** `churn` (0 ou 1).
- **Preditores:** `age`, `income`, `credit_score`, `has_credit_card`, `num_products`, `is_active_member`.

Evidências: [assets/screenshots/02-dataset-registered.png](./assets/screenshots/02-dataset-registered.png), [assets/screenshots/storage/01-customer-churn-blobstore.png](./assets/screenshots/storage/01-customer-churn-blobstore.png).

## 4. Estratégia de Treinamento

- **Tipo de experimento:** Automated ML
- **Nome do job:** `automl-churn-dio-lab-001`
- **Experiência:** `automl-churn-dio-lab`
- **Métrica principal:** **AUC weighted**
- **Critério de seleção:** melhor run por AUC no resumo do job; entre empates (XGBoost vs. VotingEnsemble), preferência pelo pipeline **MaxAbsScaler + XGBoostClassifier** por simplicidade e tempo de trial.

**Configuração do job:**

- **Task type:** Classification · **Target:** `churn` · **Deep learning:** desligado · **Explain best model:** ligado · **Use all supported models:** ligado · **Ensemble stacking:** desligado.
- **Validação:** Automatic (Studio) · **Test data:** None.
- **Limits:** max trials **3**, max concurrent trials **1**, max nodes **1**, experiment timeout **45** min, iteration timeout **15** min, early termination desligado.
- **Tags (job):** `project: dio`, `dataset: v2`.

**Compute (treino):**

- **Cluster:** `cpu-automl-cluster` · **VM:** `Standard_E4ds_v4` (4 vCPU, 32 GB RAM) · min **0** / max **1** nó · idle **120** s.

Evidências: [assets/screenshots/03-compute-treino.png](./assets/screenshots/03-compute-treino.png).

**Child run escolhido para registo:** `willing_oxygen_r5dwc5jm`.

## 5. Avaliação do Modelo

- **Métricas analisadas:** **AUC weighted** (primária); Explainability ativada no job.
- **Resultado obtido (melhor pipeline escolhido):** **AUC weighted = 0,99714** no resumo do Studio para **MaxAbsScaler + XGBoostClassifier**.
- **Modelo registado:** **`churn-xgboost-automl`**, versão **1** (`churn-xgboost-automl:1`).
- **Justificativa:** mesmo AUC que VotingEnsemble na lista de child runs; XGBoost com menor duração de trial no quadro apresentado e pipeline mais simples de explicar no portfólio.

**Limitação:** dados **sintéticos** e amostra pequena (~120 linhas) — métricas elevadas não garantem performance em produção; servem para demonstração didática.

## 6. Deploy e Endpoint

- **Tipo:** Online **Managed**
- **Nome do endpoint:** `mlw-dio-aif-dev-centralus-rssjr`
- **REST scoring URI:** ver [endpoint.json](./endpoint.json) — campo `scoring_uri`
- **Deployment:** `churn-xgboost-automl-1` · **SKU:** Standard_D2a_v4 · **Instâncias:** 1
- **Autenticação:** **Key** (`Authorization: Bearer <chave>`); chaves **não** versionadas no Git
- **Formato de entrada:** ver [sample-request.json](./sample-request.json) — `input_data` com `columns` (sem `churn`) e `data` (≥1 linha)

## 7. Testes

- **Payload:** [sample-request.json](./sample-request.json)
- **Resultado observado (Studio — Test):** resposta JSON **`[0]`** para a linha de exemplo (classe predita; **0** = sem churn no encoding utilizado).
- Evidência: [assets/screenshots/10-teste-inferencia.png](./assets/screenshots/10-teste-inferencia.png).

## 8. Riscos e Considerações

- **Limitações:** dataset sintético; poucas linhas; risco de **overfitting** aparente; não substitui avaliação com dados reais nem teste holdout dedicado.
- **Melhorias futuras:** mais dados reais ou com ruído controlado; mais trials AutoML; monitorização no endpoint; Microsoft Entra ID em vez de só chave; pipeline MLOvOps (Azure DevOps / GitHub Actions).

## 9. Aprendizados

- **Conceitos:** Automated ML, registo de modelos MLflow, Managed Online Endpoint, contrato JSON de inferência.
- **Desafios:** asset File vs. tabular para coluna alvo; quota de vCPU no deploy (ajuste de instâncias); corpo de pedido vazio no Test; gestão de segredos para GitHub.
