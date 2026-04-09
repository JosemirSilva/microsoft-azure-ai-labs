# HOWTO — Lab 4: Azure AI Search

Referência técnica rápida por fases. Para o roteiro completo, veja [README.md](./README.md).

---

## Fase 1 — Upload de documentos

1. Acesse a conta de armazenamento **`stdioaifmlcentralus01`** no [Portal Azure](https://portal.azure.com).
2. Navegue até **Contêineres** → **`coffeereviews`**.
3. Clique em **Carregar** (*Upload*) e selecione os arquivos de *coffee reviews* (`.docx`, `.pdf` ou `.txt`, conforme as aulas).
4. Confirme que os arquivos aparecem na listagem do contêiner.

> Captura de tela sugerida: `storage-container-upload.png`

---

## Fase 2 — Criar recurso Azure AI Search

No portal Azure, dentro do *resource group* **`rg-dio-aif-ml-dev-centralus`**:

1. Clique em **Criar** → pesquise **Azure AI Search** (ou **Azure Cognitive Search**, conforme o portal).
2. Configure:
   - **Nome:** por exemplo `search-dio-aif-dev-centralus` *(deve ser globalmente único)*  
   - **Região:** Central US  
   - **Camada de preços:** *Free* (F) para laboratórios ou *Basic* (B) se *Free* não estiver disponível  
3. **Examinar + criar** → **Criar**.
4. Aguarde a **implantação** e abra o recurso.

> Captura de tela sugerida: `ai-search-resource-overview.png`

---

## Fase 3 — Importar dados e criar índice (assistente *Import data*)

Dentro do recurso Azure AI Search:

1. Abra **Import data** (*Import data*).
2. **Fonte de dados:** Azure Blob Storage  
   - Selecione `stdioaifmlcentralus01` / contêiner `coffeereviews`  
   - Modo de análise conforme o formato dos arquivos (padrão ou JSON, etc.)  
3. **Adicionar skills cognitivas** *(opcional, recomendado no lab):*  
   - Associe ao recurso **`ai-dio-vision-dev-centralus`**  
   - Habilite, conforme o assistente: *Extract key phrases*, *Detect sentiment*, *Detect language*, reconhecimento de entidades, OCR se necessário  
4. **Personalizar índice de destino:**  
   - Revise campos gerados  
   - Marque campos como *Retrievable*, *Searchable*, *Filterable* quando fizer sentido  
5. **Criar um indexador:**  
   - Nome sugerido: `coffeereviews-indexer`  
   - Agendamento: uma vez (*Once*)  
6. Envie (**Submit**) e aguarde a execução.

> Capturas de tela sugeridas: `import-data-datasource.png`, `import-data-skillset.png`

---

## Fase 4 — Verificar o indexador

1. No menu lateral do Azure AI Search, abra **Indexers** (*Indexadores*).
2. Aguarde o status **Success** (*Êxito*).
3. Verifique contagem de documentos, avisos (*warnings*) e erros.

> Captura de tela sugerida: `indexer-run-success.png`

---

## Fase 5 — Explorar no Search Explorer

1. No menu lateral, abra **Search Explorer**.
2. Execute as consultas da tabela no [README.md](./README.md).
3. Opcional: copie o JSON da resposta para evidência (`search-results.json`).

> Capturas de tela sugeridas: `search-explorer-query-all.png`, `search-explorer-query-filter.png`, `search-explorer-query-term.png`

---

## Git (raiz do repositório)

```bash
git add labs/cognitive-search-ai/
git commit -m "feat(lab4): <descreva o que foi feito>"
git push origin main
```
