# Lab 4 — Azure Cognitive Search: AI Search para indexação e consulta de dados

**Estado:** **Em execução** — complete [`output/`](./output/), preencha **Insights** e marque o checklist antes de entregar na DIO.

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
  - **Novo** recurso **Azure AI Search** a criar (veja [HOWTO.md](./HOWTO.md)).
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
| `storage-container-upload.png` | Portal — contêiner `coffeereviews` **com** os arquivos de *review* carregados. | |
| `ai-search-resource-overview.png` | Visão geral do recurso Azure AI Search (endpoint, camada, região), sem chaves. | |
| `import-data-datasource.png` | Assistente **Import data** — etapa da fonte de dados (Blob). | |
| `import-data-skillset.png` | Assistente — *skillset* cognitivo configurado. | |
| `indexer-run-success.png` | Indexador concluído com sucesso (status, contagem, sem erros críticos). | |
| `search-explorer-query-all.png` | Search Explorer — `search=*&$count=true` com JSON de resultado. | |
| `search-explorer-query-filter.png` | Consulta com `$filter` (ex.: sentimento negativo ou localidade). | |
| `search-explorer-query-term.png` | Busca por termo (ex.: cidade presente nas *reviews*). | |
| `search-results.json` *(opcional)* | Cópia do JSON de uma consulta (sem credenciais). | |

Convenções detalhadas: [`output/README.md`](./output/README.md).

---

## Consultas úteis (Search Explorer)

> Os nomes de campos (`sentiment`, `keyPhrases`, etc.) dependem do esquema gerado no assistente — ajuste conforme o seu índice.

| Objetivo | Consulta (exemplo) |
|----------|-------------------|
| Todos os documentos | `search=*&$count=true` |
| *Reviews* negativas | `search=*&$filter=sentiment eq 'negative'` |
| *Reviews* positivas | `search=*&$filter=sentiment eq 'positive'` |
| Busca por cidade | `search=Chicago&$count=true` |
| Destacar frases-chave | `search=*&$select=keyphrases&$count=true` |
| Ordenar por data de modificação | `search=*&$orderby=metadata_storage_last_modified desc` |

---

## Checklist de entrega (DIO)

- [ ] Video-aulas assistidas.
- [ ] Recurso **Azure AI Search** criado e configurado.
- [ ] *Upload* dos documentos no contêiner `coffeereviews`.
- [ ] Indexador executado com sucesso (sem erros críticos).
- [ ] Consultas realizadas no Search Explorer.
- [ ] Pasta **`output/`** com **pelo menos três** evidências (*upload*, indexador, consulta).
- [ ] **`README.md`** com **Insights** preenchidos.
- [ ] Repositório atualizado no GitHub; **Entregar projeto** na DIO.

---

## Insights e possibilidades

_Preencha após os testes reais._

- **Enriquecimento cognitivo:** o que as *skills* extraíram automaticamente (frases-chave, sentimento, entidades, localizações).
- **Qualidade do índice:** precisão das consultas, falsos positivos, campos mais úteis.
- **$filter** vs. busca em texto completo: quando usar cada um.
- **Escalabilidade:** diferenças entre camadas (*Free* vs. *Basic* vs. *Standard*) e impacto em volume e latência.
- **Casos de uso:** e-commerce (*reviews*), RH (*currículos*), jurídico (contratos).
- **Integração com labs anteriores:** AI Search (Lab 4) + Language Studio (Lab 3) + dados tabulares AutoML (Lab 1).

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
