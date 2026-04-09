# output/ — Lab 4: Azure AI Search

Esta pasta reúne as evidências práticas do Lab 4.

## Convenção de nomes

| Arquivo | Conteúdo |
|---------|----------|
| `resource-group-overview.png` | Lista de recursos do *resource group* (Search, Storage, etc.) |
| `storage-container-upload.png` | Contêiner `coffeereviews` com arquivos de *review* carregados |
| `ai-search-resource-overview.png` | Visão geral do recurso Azure AI Search |
| `import-data-datasource.png` | Assistente *Import data* — conexão com o Blob |
| `import-data-skillset.png` | *Apply AI enrichments* — *skills* selecionadas |
| `import-data-skillset-entities-modal.png` | Configuração *Extract entities* (pessoas, orgs, localidades) |
| `import-data-preview-mappings.png` | *Preview index fields* / mapeamento para o índice |
| `import-data-advanced-settings.png` | *Advanced settings* (semântica, agendamento) |
| `import-data-review-create.png` | *Review and create* antes de gerar índice/indexador |
| `indexer-run-success.png` | Indexador com status **Success** e documentos processados |
| `search-explorer-query-all.png` | Search Explorer — busca ampla com contagem |
| `search-explorer-query-filter.png` | Search Explorer — consulta semântica com `select` (ex.: campos enriquecidos) |
| `search-explorer-query-term.png` | Search Explorer — outra consulta semântica / projeção de campos |
| `search-query-examples.json` | *Payloads* das consultas semânticas + resumo dos resultados (`@odata.count`, ordem dos `title`) |

**Segurança:** nunca faça *commit* de capturas com chaves, tokens ou *connection strings* visíveis.
