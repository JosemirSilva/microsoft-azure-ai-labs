# How to DO — Lab Azure ML (AutoML + Online Endpoint)

Guia **passo a passo** de como este projeto foi viabilizado: ordem das ações, recursos Azure utilizados e decisões práticas. Complementa o [README](./README.md) e o [SDD](./SDD.md).

---

## 1. Pré-requisitos

- Conta **Microsoft Azure** com permissão para criar recursos (ex.: **Contributor** no resource group).
- Navegador atualizado para **Azure Portal** e **Azure Machine Learning Studio** (`ml.azure.com`).
- (Opcional) **Azure CLI** com extensão `ml` — o lab foi feito sobretudo pela UI.

---

## 2. Recursos Azure utilizados (inventário)

Estes componentes aparecem no **resource group** do projeto (ex.: `rg-dio-aif-ml-dev-centralus`). Nomes abaixo refletem **esta** execução do lab; adapta aos teus.

| Recurso | Nome de exemplo (este lab) | Função |
|---------|----------------------------|--------|
| **Resource group** | `rg-dio-aif-ml-dev-centralus` | Agrupa todos os recursos na região. |
| **Machine Learning workspace** | `mlw-dio-aif-dev-centralus-01` | Ponto central: dados, jobs, modelos, endpoints. |
| **Storage account** | `stdioaifmlcentralus01` | Blob default (`workspaceblobstore`), arquivos e artefatos. |
| **Key Vault** | `kv-dio-aif-dev-centralus` | Segredos do ecossistema do workspace (políticas de acesso definem o que vês no Portal). |
| **Application Insights** | `appi-dio-aif-ml-dev-centralus-01` | Telemetria associada ao workspace. |
| **Log Analytics** | *(workspace criado com o AML)* | Logs operacionais em alguns cenários. |
| **Compute — cluster de treino** | `cpu-automl-cluster` | VM **Standard_E4ds_v4**; min 0 / max 1 nó; idle 120 s. |
| **Data asset (tabular)** | `ds-automl-classification-v2` (v1) | CSV tabular com schema inferido — **utilizado no AutoML**. |
| **Experiência / job AutoML** | `automl-churn-dio-lab` / `automl-churn-dio-lab-001` | Classificação, alvo `churn`. |
| **Modelo registado** | `churn-xgboost-automl` (v1) | Artefato MLflow do melhor child run escolhido. |
| **Online endpoint (managed)** | `mlw-dio-aif-dev-centralus-rssjr` | URI REST para inferência em tempo real. |
| **Online deployment** | `churn-xgboost-automl-1` | Modelo + ambiente + SKU **Standard_D2a_v4**, 1 instância. |

**Repositório local (não é recurso Azure):**

- [`data/customer_churn.csv`](./data/customer_churn.csv) — dados sintéticos.
- [`endpoint.json`](./endpoint.json) — metadados públicos do endpoint (sem chaves).
- [`sample-request.json`](./sample-request.json) — exemplo de corpo JSON para inferência.

---

## 3. Passo a passo (ordem de execução)

### Fase A — Fundação

1. Criar **resource group** na região desejada (ex.: **Central US**).
2. Criar **Machine Learning** → recurso **workspace** no RG (Portal ou modelo ARM).
3. Abrir **Launch studio** / [ml.azure.com](https://ml.azure.com) e selecionar o workspace.

### Fase B — Dados

4. Preparar CSV com cabeçalho e coluna alvo (`churn` para classificação binária).
5. No Studio: **Data** → **Create** → definir tipo **Tabular** (dataset v1 API) / fluxo que **infere colunas** a partir do arquivo delimitado (vírgula, UTF-8).
6. Concluir o assistente (**Schema**, **Review**) e criar o asset (ex.: **`ds-automl-classification-v2`**).
7. **Evitar** depender apenas de **File (uri_file)** se o AutoML não listar **Target column** — foi o caso do primeiro asset `v1`; o `v2` tabular resolveu.

### Fase C — Compute de treino

8. **Manage** → **Compute** → **Compute clusters** → **New**.
9. Nome (ex.: `cpu-automl-cluster`), tier **Dedicated**, **CPU**, VM adequada (ex.: **Standard_E4ds_v4**), **min nodes 0**, **max nodes 1**, idle seconds antes de scale down (ex.: 120), SSH opcional desligado.
10. **Create** e aguardar estado válido para submit de jobs.

### Fase D — Automated ML

11. **Automated ML** → **New job**.
12. **Basic settings:** nome do job (ex.: `automl-churn-dio-lab-001`); criar experiência nova (ex.: `automl-churn-dio-lab`); descrição e tags opcionais (`project`, `dataset`).
13. **Task type & data:** **Classification**; selecionar **`ds-automl-classification-v2`**.
14. **Task settings:** **Target column** = `churn`; deep learning opcional **off**; **Primary metric** = **AUC weighted**; **Explain best model** se desejado; **Limits** (ex.: max trials 3, concurrent 1, max nodes 1, timeouts 45/15 min); validação **Automatic**; test data **None**.
15. **Compute:** cluster `cpu-automl-cluster`.
16. **Review** → **Submit**; acompanhar até **Completed**.

### Fase E — Melhor modelo e registo

17. **Models + child jobs** (ou equivalente): ordenar por **AUC weighted**; escolher pipeline (ex.: **MaxAbsScaler + XGBoostClassifier** em vez de ensemble com mesmo score, por simplicidade).
18. Abrir o child run → **Register model** → assistente **Register model from a job output**: tipo **MLflow**, output `mlflow_log_model_...` auto-selecionado → nome (ex.: `churn-xgboost-automl`) → **Register**.

### Fase F — Deploy em tempo real

19. No run ou em **Models**: **Deploy** → **Real-time endpoint**.
20. **Novo endpoint:** nome (ex.: `mlw-dio-aif-dev-centralus-rssjr`); autenticação **Key**.
21. **Deployment:** nome (ex.: `churn-xgboost-automl-1`); modelo **`churn-xgboost-automl:1`**; SKU inferência dentro da **quota** (ex.: **Standard_D2a_v4**, **1** instância — evitar 3 instâncias se o limite de vCPU for baixo).
22. Aguardar **Provisioning state: Succeeded** no endpoint e no deployment.

### Fase G — Teste e documentação

23. Studio → **Endpoints** → endpoint → separador **Test**: JSON com `input_data.columns` **sem** `churn` e `data` com **≥1 linha** (não usar `data: []`).
24. Separador **Consume:** copiar **REST URI** para [`endpoint.json`](./endpoint.json); chaves ficam **fora** do Git (`AZURE_ML_API_KEY` ou `.env` local).
25. Alinhar [`sample-request.json`](./sample-request.json) ao formato aceite pelo **Test**.
26. (Opcional) [`scripts/invoke_endpoint.ps1`](./scripts/invoke_endpoint.ps1) com variável de ambiente da chave.

---

## 4. Decisões e problemas comuns

| Situação | Decisão / solução |
|----------|-------------------|
| Target column obrigatório sem dropdown | Recriar dataset como **tabular** com schema inferido (`v2`). |
| Quota no deploy | Reduzir **instance count** e/ou escolher VM com menos vCPU. |
| Test falha (scoring script) | Corpo com `data` vazio; preencher linhas de features. |
| Key Vault “vazio” no Portal | Falta permissão **List/Get** nas access policies / RBAC; o vault integra-se com o workspace independentemente de veres a lista. |
| Chaves no Git | **Nunca** versionar; regenerar se expostas. |

---

## 5. Onde aprofundar

- [README do lab](./README.md) — visão geral, checklist, entrega DIO, GitHub.
- [SDD](./SDD.md) — decisões de design e métricas.
- [docs/architecture.md](../../docs/architecture.md) — diagrama lógico e componentes.

---

*Documento gerado para referência “How to DO”; alinha-se à execução documentada neste repositório (projeto DIO 1/5).*
