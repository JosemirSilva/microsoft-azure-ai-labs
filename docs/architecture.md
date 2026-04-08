# Arquitetura — Azure ML (AutoML + Online Endpoint)

Visão de alto nível do fluxo implementado neste lab. Ao documentar o seu workspace, atualize os nomes dos recursos conforme o ambiente real.

```mermaid
flowchart LR
  subgraph workspace [Azure_ML_Workspace]
    DS[Dataset_registrado]
    CC[Compute_cluster_treino]
    AML[AutoML_job]
    REG[Model_registry]
    EP[Managed_Online_Endpoint]
  end
  User[Usuario_ou_App] -->|HTTPS_JSON| EP
  DS --> AML
  CC --> AML
  AML --> REG
  REG --> EP
```

## Componentes

| Componente | Função |
|------------|--------|
| Workspace | Ponto central para dados, experimentos, modelos e endpoints. |
| Dataset | Dados tabulares versionados usados pelo AutoML. |
| Compute cluster | Infraestrutura elástica para treinar múltiplos trials do AutoML. |
| AutoML job | Orquestra busca de algoritmos e hiperparâmetros. |
| Model registry | Armazena o artefato do melhor run com versionamento. |
| Online endpoint | Hospeda o modelo para inferência síncrona via REST. |

Para detalhes de design e decisões do seu run, consulte o [SDD do lab](../labs/azure-ml-automl-endpoint/SDD.md). Lista de recursos no **resource group** (captura de tela): seção **Recursos Azure no resource group** no [README do lab](../labs/azure-ml-automl-endpoint/README.md).
