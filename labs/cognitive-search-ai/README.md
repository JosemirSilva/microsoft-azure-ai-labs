# Lab 4 — Azure Cognitive Search: AI Search para indexação e consulta de dados

**Estado:** **Concluído** — evidências em [`output/`](./output/); falta apenas **push** no GitHub e **Entregar projeto** na DIO (se ainda não fez).

**Projeto 4/5** da trilha [Microsoft — Fundamentos de IA](https://web.dio.me/track/microsoft-fundamentos-de-ia) · Desafio DIO: [Azure Cognitive Search: utilizando AI Search para indexação e consulta de dados](https://web.dio.me/lab/azure-cognitive-search-utilizando-ai-search-para-indexacao-e-consulta-de-dados/learning/719d6530-4d08-40c7-bb11-9524091868c0).

> O desafio cobre três frentes principais: **ingestão de conteúdo**, **criação de índices inteligentes** e **exploração/consulta** dos dados organizados, usando o **Azure AI Search** integrado ao **Azure Blob Storage** e aos **Azure AI Services** (skills cognitivas).

Repositório monorepo: [README da trilha](../../README.md).

**Guias**

- [HOWTO.md](./HOWTO.md) — visão técnica por fases (referência rápida).

---

## Objetivo

Praticar o **Azure AI Search** para ingerir documentos não estruturados (avaliações de café / *coffee reviews*), enriquecê-los com *skills* cognitivas (extração de frases-chave, sentimento, entidades, OCR quando aplicável) e explorá-los no **Search Explorer** — documentando o fluxo e os *insights* para portfólio e entrega na DIO.

---

## Arquitetura do lab

```
Azure Blob Storage (coffeereviews)
        ↓  ingestão
Azure AI Search — Indexador
        ↓  enriquecimento
Azure AI Services (skills cognitivas)
        ↓  índice enriquecido
Search Explorer (consultas)
```

---

## Entrega DIO (resumo)

| Requisito | Como cumprir neste repositório |
|-----------|--------------------------------|
| Repositório público com **README** detalhado | Este arquivo + [HOWTO.md](./HOWTO.md) |
| Arquivos relevantes à experiência | Pasta [`output/`](./output/) (capturas de tela, JSON de consulta opcional) |
| Opcional: capturas em **`/images`** | Aqui usamos **`output/`** com a mesma finalidade |
| Enviar link + descrição | Botão **Entregar projeto** na plataforma DIO |

**Recurso oficial (Microsoft Learn):**

- [Explore an Azure AI Search index (UI)](https://learn.microsoft.com/azure/search/search-get-started-portal)

---

## Pré-requisitos

- Conta **Microsoft Azure** (reutilize a **assinatura** dos Labs 1–3).
- **Resource group** `rg-dio-aif-ml-dev-centralus` com:
  - **Storage Account** `stdioaifmlcentralus01` + contêiner **`coffeereviews`** (já criado; faça o *upload* dos *reviews* conforme as aulas).
  - Recurso **Azure AI Services** multi-serviço `ai-dio-vision-dev-centralus` (necessário para *skills* cognitivas no assistente de importação).
  - Recurso **Azure AI Search** `search-dio-aif-dev-centralus` (camada **Free**, região **Central US**) — ver evidência em [`output/ai-search-resource-overview.png`](./output/ai-search-resource-overview.png).
- Navegador atualizado com acesso ao [Portal Azure](https://portal.azure.com).

**Segurança:** não faça *commit* de chaves de API, *connection strings* nem capturas com o painel **Keys** visível.

---

## Passo a passo resumido

1. Enviar os arquivos de *coffee reviews* para o contêiner **`coffeereviews`** na conta **`stdioaifmlcentralus01`**.
2. Criar o recurso **Azure AI Search** no *resource group* `rg-dio-aif-ml-dev-centralus` (região **Central US**, camada **Free** ou **Basic**, conforme disponibilidade).
3. No portal do Azure AI Search, usar o assistente **Import data**:
   - **Fonte de dados:** Azure Blob Storage → contêiner `coffeereviews`.
   - ***Skillset* cognitivo:** vincular ao recurso `ai-dio-vision-dev-centralus`.
   - Habilidades sugeridas: frases-chave, sentimento, idioma, entidades; OCR se o material incluir imagens escaneadas (siga as video-aulas).
4. Executar o **indexador** e aguardar conclusão (status, contagem de documentos, erros *warnings*).
5. No **Search Explorer**, testar consultas (exemplos abaixo).
6. Salvar evidências em [`output/`](./output/) (capturas + JSON opcional).
7. Preencher a seção **Insights** neste README.
8. Na raiz do repositório: `git add` / `commit` / `push` e entregar na DIO.

---

## Evidências em `output/`

_Atualize a coluna **Estado** quando cada arquivo existir no repositório._

| Arquivo sugerido | Conteúdo esperado | Estado |
|------------------|-------------------|--------|
| `resource-group-overview.png` | Portal — *resource group* `rg-dio-aif-ml-dev-centralus` listando **Search service**, **Storage account** e demais recursos do lab. | Feito |
| `storage-container-upload.png` | Portal — contêiner `coffeereviews` **com** os arquivos de *review* carregados (`review-001.txt` … `review-010.txt`). | Guardado |
| `ai-search-resource-overview.png` | Visão geral do recurso Azure AI Search (endpoint, camada, região), sem chaves. | Guardado |
| `import-data-datasource.png` | **Import data** — *Connect to your data* (Blob `coffeereviews`, *parsing* Text, identidade gerenciada). | Guardado |
| `import-data-skillset.png` | **Import data** — *Apply AI enrichments* (ex.: *Extract phrases*, *Extract entities*, recurso gratuito Foundry Tools). | Guardado |
| `import-data-skillset-entities-modal.png` | Detalhe da habilidade *Extract entities* (Pessoas, Organizações, Localizações). | Feito |
| `import-data-preview-mappings.png` | *Preview index fields* (`content`, `keyPhrases`, `persons`, `locations`, metadados do Blob). | Feito |
| `import-data-advanced-settings.png` | *Advanced settings* (ex.: ranqueador semântico, agendamento *Once*). | Feito |
| `import-data-review-create.png` | *Review and create* (resumo antes de **Create**; prefixo de objetos `search-1775701292472`). | Feito |
| `indexer-run-success.png` | **Indexers** Índice executado com **Success**, **10/10** documentos, 0 erros. | Guardado |
| `search-explorer-query-all.png` | Search Explorer — busca semântica `search=*`, `count`, idioma `en-us`, JSON com `@odata.count`: 10. | Guardado |
| `search-explorer-query-filter.png` | Search Explorer — semântica, `queryLanguage` **pt-br**, `select` em `title`, `keyPhrases`, `locations`, `persons` (ex.: `review-007.txt`). | Guardado |
| `search-explorer-query-term.png` | Search Explorer — semântica **pt-br**, `select` em `title`, `keyPhrases`, `locations` (mesmo índice, projeção distinta). | Guardado |
| `search-results.json` | Cópia do JSON bruto de uma consulta (sem credenciais). | Opcional — não gerado |

Convenções detalhadas: [`output/README.md`](./output/README.md).

---

## Consultas úteis (Search Explorer)

> No **JSON query editor**, use `queryType`: `"semantic"` e o `semanticConfiguration` gerado pelo assistente (`search-1775701292472-semantic-configuration`). Campos enriquecidos neste índice: `keyPhrases`, `persons`, `locations`, `organizations`. Índice: **`search-1775701292472`**.
>
> Cópia estruturada dos exemplos abaixo: [`output/search-query-examples.json`](./output/search-query-examples.json).

### 1 — Inventário completo (10 documentos)

**Objetivo:** retornar todos os *reviews* com `@odata.count: 10` e corpo completo (`content` + frases-chave e entidades por documento).

```json
{
  "search": "*",
  "count": true,
  "queryType": "semantic",
  "semanticConfiguration": "search-1775701292472-semantic-configuration",
  "captions": "extractive",
  "answers": "extractive|count-3",
  "queryLanguage": "pt-br"
}
```

**Resultado observado:** `@odata.count` **10**; ordem dos arquivos na resposta: `review-001.txt` … `review-010.txt`. Útil para validar ingestão e extração (ex.: “atendimento excepcional” em `review-002`, “Frustração” / “fila demorada” em `review-005` e `review-007`).

### 2 — Busca por termo no texto (“atendimento”)

**Objetivo:** localizar *reviews* que falam de atendimento; projetar só campos enriquecidos.

```json
{
  "search": "atendimento",
  "count": true,
  "queryType": "semantic",
  "semanticConfiguration": "search-1775701292472-semantic-configuration",
  "select": "title, keyPhrases, locations, persons",
  "captions": "extractive",
  "queryLanguage": "pt-br"
}
```

**Resultado observado:** `@odata.count` **2** — `review-007.txt` (atendimento abaixo do básico; maior `@search.rerankerScore` na prática do que o segundo) e `review-002.txt` (“atendimento excepcional”). `@search.captions` pode vir vazio dependendo do documento; os campos do `select` trazem o contexto.

### 3 — Consulta em linguagem natural (frustração / fila / demora)

**Objetivo:** combinar termos como numa pergunta; ranqueamento semântico prioriza *reviews* negativos relacionados.

```json
{
  "search": "frustração fila demora",
  "count": true,
  "queryType": "semantic",
  "semanticConfiguration": "search-1775701292472-semantic-configuration",
  "select": "title, keyPhrases, locations",
  "captions": "extractive",
  "queryLanguage": "pt-br"
}
```

**Resultado observado:** `@odata.count` **3** — ordem típica de relevância: `review-007.txt`, `review-005.txt`, `review-010.txt` (filas / frustração / experiência mista). Confirma que `keyPhrases` alinhadas (“Frustração”, “fila demorada”, “fila”) sustentam a busca semântica em PT-BR.

### Outras ideias (API REST / sintaxe clássica)

| Objetivo | Nota |
|----------|------|
| Busca por cidade no texto | `search`: `"Curitiba"` ou `"Brasília"` com o mesmo bloco semântico + `select` desejado |
| OData `$filter` por polaridade | Só após incluir campo de sentimento no índice (*skill* ou campo derivado) |
| Ordenação por data do Blob | `orderby=metadata_storage_last_modified desc` em consultas **simples** (`queryType` não semântico), se o campo estiver recuperável |

---

## Checklist de entrega (DIO)

_Use esta lista como guia; marque no Git ou na DIO conforme for concluindo._

### Infraestrutura e dados

- [x] Video-aulas assistidas (conceitos: ingestão, índice, *skillset*, consulta).
- [x] *Resource group* `rg-dio-aif-ml-dev-centralus` com **Search service** e **Storage** prontos — evidência: [`output/resource-group-overview.png`](./output/resource-group-overview.png).
- [x] Recurso **Azure AI Search** `search-dio-aif-dev-centralus` criado (ex.: camada **Free**, **Central US**) — evidência: [`output/ai-search-resource-overview.png`](./output/ai-search-resource-overview.png).
- [x] Arquivos de *mock* em [`data/`](./data/) enviados ao contêiner **`coffeereviews`** na conta **`stdioaifmlcentralus01`** — evidência: [`output/storage-container-upload.png`](./output/storage-container-upload.png).
- [x] Assistente **Import data** concluído — evidências: [`import-data-datasource.png`](./output/import-data-datasource.png), [`import-data-skillset.png`](./output/import-data-skillset.png), [`import-data-preview-mappings.png`](./output/import-data-preview-mappings.png), [`import-data-advanced-settings.png`](./output/import-data-advanced-settings.png), [`import-data-review-create.png`](./output/import-data-review-create.png); detalhe de entidades: [`import-data-skillset-entities-modal.png`](./output/import-data-skillset-entities-modal.png).

### Indexação e consulta

- [x] **Indexador** executou com sucesso (**10/10** documentos) — [`output/indexer-run-success.png`](./output/indexer-run-success.png).
- [x] **Search Explorer**: busca ampla com contagem — [`output/search-explorer-query-all.png`](./output/search-explorer-query-all.png).
- [x] **Search Explorer**: consultas semânticas em **pt-br** com `select` em campos enriquecidos — [`output/search-explorer-query-filter.png`](./output/search-explorer-query-filter.png), [`output/search-explorer-query-term.png`](./output/search-explorer-query-term.png).
- [x] Referência de consultas em [`output/search-query-examples.json`](./output/search-query-examples.json) *(opcional: exportar JSON bruto completo do Search Explorer para arquivo próprio)*.

### Documentação e entrega

- [x] Pasta **`output/`** com evidências do Blob, assistente **Import data**, indexador (**10/10**) e **Search Explorer** — ver tabela de evidências.
- [x] Seção **Insights** (neste README) com aprendizados do pipeline — ajuste o texto se quiser personalizar a entrega.
- [x] `git add` / `commit` / `push` na raiz do repositório.
- [ ] **Entregar projeto** na DIO (link do GitHub + descrição).

---

## Insights e possibilidades

### Resultados observados

- **Indexação 100% bem-sucedida:** todos os 10 documentos `.txt` foram
  indexados sem erros, com extração automática de `keyPhrases`, `persons`,
  `locations` e `organizations` via Azure AI Skills.

- **Semantic Search supera busca léxica:** a configuração de Semantic Ranker
  (redes neurais) retornou resultados relevantes mesmo sem correspondência
  exata de termos — busca por "Frustração" retornou reviews negativas de
  Brasília, Fortaleza e Manaus com scores de relevância distintos (3.98,
  2.74 e 2.46).

- **keyPhrases capturam contexto real:** o modelo extraiu automaticamente
  termos como "preço abusivo", "fila demorada", "espuma rala", "quinze
  minutos", "café coado artesanal" e "Hario V60" — frases que representam
  a experiência do cliente sem nenhuma configuração manual.

- **locations e persons funcionam como filtros naturais:** cidades como
  Brasília, Fortaleza, Manaus, São Paulo e Fortaleza foram detectadas e
  indexadas automaticamente, permitindo buscas geográficas sem campos
  estruturados.

- **Ranking semântico ordena por relevância real:** review-007.txt (score
  3.98) foi a mais relevante para "Frustração" por concentrar mais termos
  negativos; review-010.txt (score 2.46) é uma review mista — o ranker
  a posicionou corretamente em terceiro.

- **Managed Identity + RBAC:** a autenticação entre Azure AI Search e
  Azure Blob Storage foi feita via Managed Identity com role
  `Storage Blob Data Reader` — padrão recomendado para produção,
  sem necessidade de expor connection strings.

### Limitações identificadas

- Busca por termos exatos como "insatisfeito" retornou 0 resultados quando
  o texto usava sinônimos ("decepção", "frustração") — o Semantic Search
  mitiga isso, mas não elimina completamente.
- O tier Free limita a 50 MB de storage e 10.000 documentos — suficiente
  para labs, inadequado para produção com grandes volumes.
- `@search.captions` retornou vazio (`""`) nos testes — pode indicar que
  os documentos `.txt` são curtos demais para geração de captions
  extractivas significativas.

### Casos de uso reais

- **E-commerce:** indexar reviews de produtos e buscar por sentimento,
  produto ou localidade sem estruturar os dados manualmente.
- **RH:** indexar currículos e buscar por habilidades, cidades e
  experiências específicas.
- **Jurídico:** indexar contratos e localizar cláusulas por tema,
  parte envolvida ou data.
- **Suporte ao cliente:** indexar tickets e identificar padrões de
  reclamação por região ou produto.
- **Pipeline completo DIO:** AI Search (Lab 4) + Language Studio
  sentimento (Lab 3) + AutoML (Lab 1) formam um pipeline de
  inteligência end-to-end sobre dados não estruturados.

---

## Relação com os labs anteriores

| Lab | Foco | Tipo de dado |
|-----|------|----------------|
| 1 — AutoML | Modelo supervisionado, endpoint ML | Estruturado (tabular) |
| 2 — Visão | Detecção facial, OCR | Imagem |
| 3 — Language | Sentimento, NLP | Texto |
| 4 — AI Search | Indexação, busca cognitiva | Documentos não estruturados |

---

## Publicar alterações

Na **raiz** do repositório:

```bash
git add labs/cognitive-search-ai/
git add README.md
git status
git commit -m "feat(lab4): Azure AI Search — indexação e consulta (estrutura inicial)"
git push origin main
```

*(Ajuste o nome do ramo se não for `main`.)*
