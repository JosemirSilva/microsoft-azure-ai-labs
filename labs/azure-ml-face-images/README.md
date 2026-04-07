# Lab 2 — Reconhecimento facial e imagens como dados (Vision Studio / Azure AI)

**Estado:** **Concluído** (evidências em [`output/`](./output/) e [`inputs/`](./inputs/)).

**Projeto 2/5** da trilha [Microsoft — Fundamentos de IA](https://web.dio.me/track/microsoft-fundamentos-de-ia) · Página do módulo na DIO: [track do curso](https://web.dio.me/track/a088cda7-a37f-451a-b392-46fa7e6ddc55).

> O desafio baseia-se no **Vision Studio** e leitura de texto em imagens. Neste repositório usámos também **Portrait processing** (Vision Studio) e **Document Intelligence Studio** (OCR/Read) no mesmo ecossistema **Azure AI**, com recurso dedicado (ex.: `ai-dio-vision-dev-centralus` / variantes por região).

Repositório monorepo: [README da trilha](../../README.md).

**Guia detalhado (provisionamento → evidências):** [HOWTO.md](./HOWTO.md)

---

## Objetivo

Explorar **deteção de rostos**, **leitura de texto (OCR)** e **metadados derivados de imagens** (atributos faciais, JSON, avisos de qualidade), transformando conteúdo visual em **dados estruturados** e documentando o processo.

---

## O que foi feito (resumo)

1. **Provisionamento** de recurso Azure AI (multi-serviço / visão) e associação ao **Vision Studio** e **Document Intelligence Studio**.
2. **Detect faces** — várias imagens de `inputs/` com múltiplos rostos, perfis, oclusão (rede); atributos de máscara / oclusão quando disponíveis.
3. **Portrait processing** — exemplo com imagem de baixa resolução/blur: JSON com pose, qualidade e aviso para remoção de fundo.
4. **OCR** — `propaganda1.jpg` analisada no Document Intelligence Studio; texto exportado para `ocr_propaganda1.txt` e captura em PNG.
5. Documentação e pastas **inputs** / **output** alinhadas à entrega DIO.

---

## Evidências no repositório

| Ficheiro | Descrição |
|----------|-----------|
| [`output/imagem1.png`](./output/imagem1.png) … [`imagem5.png`](./output/imagem5.png) | Vision Studio — **Detect faces** (diversos cenários). |
| [`output/imagem6-portrait-processing.png`](./output/imagem6-portrait-processing.png) | Vision Studio — **Portrait processing** (JSON + aviso de qualidade). |
| [`output/imagem7-document-intelligence-ocr-read.png`](./output/imagem7-document-intelligence-ocr-read.png) | Document Intelligence — **OCR/Read**. |
| [`output/ocr_propaganda1.txt`](./output/ocr_propaganda1.txt) | Texto reconhecido (entrega DIO — reconhecimento de texto). |
| [`inputs/`](./inputs/) | Imagens de entrada utilizadas (ver [direitos e uso](./inputs/README.md)). |

**Nota:** *Se no futuro quiseres reforçar ao de acordo exato com o link “Analyze images” do curso, podes acrescentar uma captura da demo **Analyze image** no Vision Studio em `output/` e atualizar esta tabela.*

---

## Estrutura exigida pela DIO

| Pasta / ficheiro | Função |
|------------------|--------|
| [`inputs/`](./inputs/) | Imagens utilizadas como entrada. |
| [`output/`](./output/) | Resultados (OCR, capturas de rostos, portrait, etc.). |
| **Este `README.md`** | Processo, evidências e insights. |

**Direitos e uso:** [`inputs/README.md`](./inputs/README.md).

---

## Pré-requisitos e links

- [Vision Studio](https://portal.vision.cognitive.azure.com/)
- [Document Intelligence Studio](https://documentintelligence.ai.azure.com/) (conforme portal atual)
- [Azure AI Vision — documentação](https://learn.microsoft.com/azure/ai-services/computer-vision/)

---

## Checklist de entrega (DIO)

- [x] Repositório GitHub atualizado (mono-repositório).
- [x] Pasta **`inputs`** com imagens usadas.
- [x] Pasta **`output`** com resultados, incluindo **reconhecimento de texto** (`ocr_propaganda1.txt` + captura).
- [x] **`README.md`** com processo e insights (este ficheiro).
- [ ] Entrega do link na plataforma DIO (**Entregar projeto**) — *ação manual sua após `git push`.*

---

## Insights e possibilidades

- **Rostos em grupo e oclusão:** com rede ou multidão, o serviço pode marcar várias faces ou “occlusão”; útil para discutir **fiabilidade** e **contexto**.
- **Portrait / qualidade:** imagens pequenas ou com *blur* geram `QUALITY_FOR_RECO` baixo e avisos — mostra que **pré-processamento** (resolução, foco) importa antes de pipelines como remoção de fundo.
- **OCR:** no exemplo da propaganda, o motor pode confundir sequências (“a dor” vs “at”) — relevante para **revisão humana** ou pós-processamento em produto.
- **Dados estruturados:** bounding boxes, parágrafos OCR e JSON de atributos podem alimentar bases de dados, Power BI ou modelos downstream — mesma ideia do “tabular” do Lab 1, com origem em **multimodal**.
- **Próximos passos:** REST/SDK das APIs, **Azure Functions** para automatizar upload → JSON, ou integração com **Azure ML** para treino com *features* extraídas de imagem.

---

## Relação com o Lab 1

| Lab 1 | Lab 2 |
|-------|--------|
| Azure **Machine Learning** (AutoML, endpoint) | **Vision Studio** + **Document Intelligence** |
| Dados **tabular** | **Imagem** → texto / metadados |

---

## Publicar no GitHub (comandos manuais)

Executar no **PowerShell** (ou terminal Git) na raiz do repositório local.

### 1. Ir para a pasta do projeto

```powershell
cd "c:\Users\josem\Documents\Dio-Lab\microsoft-ai-fundamentals"
```

### 2. Ver o que mudou

```powershell
git status
```

Confirmar que **não** aparecem `.env`, chaves ou ficheiros sensíveis.

### 3. Adicionar alterações do Lab 2 (e README raiz, se mudou)

```powershell
git add labs/azure-ml-face-images/
git add README.md
```

### 4. Criar o commit

```powershell
git commit -m "feat(lab2): evidências Vision Studio, Portrait, Document Intelligence OCR e documentação concluída"
```

*(Se o Git pedir nome/e-mail: `git config user.name "Seu Nome"` e `git config user.email "seu@email.com"`.)*

### 5. Enviar para o GitHub

Com ramo **main** (ou **master**, conforme o teu remoto):

```powershell
git push origin main
```

Se ainda **não existir** remoto:

1. Cria um repositório vazio no GitHub (sem README, se já tens um local).
2. Associa e faz o primeiro envio:

```powershell
git remote add origin https://github.com/SEU_USUARIO/microsoft-ai-fundamentals.git
git branch -M main
git push -u origin main
```

*(Substitui `SEU_USUARIO` e o nome do repo pelos teus valores reais.)*

### 6. Depois do push

1. Abre o repositório no browser e confirma que `labs/azure-ml-face-images/output/` mostra os PNG e o `ocr_propaganda1.txt`.
2. Na **DIO**, usa **Entregar projeto** e cola o **URL** do repositório (ou da pasta do lab, se a plataforma permitir apenas o link do GitHub).
