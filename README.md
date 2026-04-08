# Microsoft — Fundamentos de IA (DIO)

Repositório único para os projetos práticos da trilha **[Microsoft - Fundamentos de IA](https://web.dio.me/track/microsoft-fundamentos-de-ia)** na [Digital Innovation One (DIO)](https://www.dio.me/). Cada módulo do curso corresponde a uma **subpasta em `labs/`** — um só GitHub, histórico e portfólio centralizados.

## Progresso na trilha

| # | Projeto (DIO) | Pasta | Estado |
|---|---------------|-------|--------|
| 1 | [Trabalhando com Machine Learning na Prática no Azure ML](labs/azure-ml-automl-endpoint/README.md) | [`labs/azure-ml-automl-endpoint/`](labs/azure-ml-automl-endpoint/) | **Concluído** |
| 2 | [Reconhecimento facial e imagens como dados (Vision Studio)](labs/azure-ml-face-images/README.md) | [`labs/azure-ml-face-images/`](labs/azure-ml-face-images/) | **Concluído** |
| 3 | [Análise de sentimentos — Language Studio](labs/language-studio-sentiment/README.md) | [`labs/language-studio-sentiment/`](labs/language-studio-sentiment/) | **Concluído** |
| 4 | Azure Cognitive Search: Utilizando AI Search para indexação e consulta de Dados | `labs/cognitive-search-ai/` | Não iniciado |
| 5 | Explorando os Recursos de IA Generativa com Copilot e OpenAI | `labs/generative-ai-copilot-openai/` | Não iniciado |

Quando iniciares um novo projeto, cria **`labs/<nome-curto-do-projeto>/`** com o seu próprio `README.md`, artefatos e (se fizer sentido) `SDD.md`.

## Estrutura atual do repositório

```
microsoft-ai-fundamentals/   ← no GitHub pode chamar-se microsoft-azure-ai-labs
├── README.md
├── .gitignore
├── .env.example
├── docs/
│   └── architecture.md
└── labs/
    ├── azure-ml-automl-endpoint/    ← Lab 1
    ├── azure-ml-face-images/      ← Lab 2
    ├── language-studio-sentiment/   ← Lab 3 — Language Studio (sentimento)
    │   ├── README.md, HOWTO.md
    │   └── output/
    ├── cognitive-search-ai/        ← Lab 4 (a criar)
    └── generative-ai-copilot-openai/  ← Lab 5 (a criar)
```

## Entrega DIO

- **Projeto 1:** README + [`endpoint.json`](labs/azure-ml-automl-endpoint/endpoint.json) — ver [lab 1](labs/azure-ml-automl-endpoint/README.md).
- **Projeto 2:** pastas **`inputs`** e **`output`**, **README** — ver [lab 2](labs/azure-ml-face-images/README.md).
- **Projeto 3:** **README** detalhado + artefatos (ex. **`output/`** com capturas) — ver [lab 3](labs/language-studio-sentiment/README.md).

## Publicar no GitHub (resumo)

1. Crie um repositório **vazio** no GitHub (sem README se for fazer push de um projeto já local).
2. Na pasta do projeto, se ainda não for um repo Git:

   ```powershell
   cd "c:\Users\josem\Documents\Dio-Lab\microsoft-ai-fundamentals"
   git init
   git add .
   git commit -m "Projeto 1/5: Azure ML AutoML + Managed Online Endpoint (DIO Fundamentos de IA)"
   git branch -M main
   git remote add origin https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git
   git push -u origin main
   ```

3. Confira no GitHub que nenhum arquivo contém **chaves** (revise `endpoint.json`, `*.md`, scripts).

## Requisitos e segurança

- Conta **Azure** com quota para compute e endpoints (custos variam por região e SKU).
- **Nunca** commites chaves de API, tokens nem `.env` com segredos. O [`.gitignore`](.gitignore) ignora `.env` e extensões comuns de credenciais.

## Documentação por lab

- [Lab 1 — Automated ML + Online Endpoint](labs/azure-ml-automl-endpoint/README.md) · [HOWTO](labs/azure-ml-automl-endpoint/HOWTO.md) · [SDD](labs/azure-ml-automl-endpoint/SDD.md)
- [Lab 2 — Vision Studio (facial / OCR / análise)](labs/azure-ml-face-images/README.md) · [HOWTO](labs/azure-ml-face-images/HOWTO.md)
- [Lab 3 — Language Studio (análise de sentimentos)](labs/language-studio-sentiment/README.md) · [HOWTO](labs/language-studio-sentiment/HOWTO.md) · [Guia em tela](labs/language-studio-sentiment/GUIA-PASSO-A-PASSO-TELA.md)
