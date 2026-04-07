# Microsoft — Fundamentos de IA (DIO)

Repositório único para os projetos práticos da trilha **[Microsoft - Fundamentos de IA](https://web.dio.me/track/microsoft-fundamentos-de-ia)** na [Digital Innovation One (DIO)](https://www.dio.me/). Cada módulo do curso corresponde a uma **subpasta em `labs/`** — um só GitHub, histórico e portfólio centralizados.

## Progresso na trilha

| # | Projeto (DIO) | Pasta | Estado |
|---|---------------|-------|--------|
| 1 | [Trabalhando com Machine Learning na Prática no Azure ML](labs/azure-ml-automl-endpoint/README.md) | [`labs/azure-ml-automl-endpoint/`](labs/azure-ml-automl-endpoint/) | **Concluído** |
| 2 | [Reconhecimento facial e imagens como dados (Vision Studio)](labs/azure-ml-face-images/README.md) | [`labs/azure-ml-face-images/`](labs/azure-ml-face-images/) | **Concluído** |
| 3 | Análise de Sentimentos com Language Studio no Azure AI | _a criar_ | Não iniciado |
| 4 | Azure Cognitive Search: Utilizando AI Search para indexação e consulta de Dados | _a criar_ | Não iniciado |
| 5 | Explorando os Recursos de IA Generativa com Copilot e OpenAI | _a criar_ | Não iniciado |

Quando iniciares um novo projeto, cria **`labs/<nome-curto-do-projeto>/`** com o seu próprio `README.md`, artefatos e (se fizer sentido) `SDD.md`.

## Estrutura atual do repositório

```
microsoft-ai-fundamentals/
├── README.md                 ← este ficheiro (visão da trilha)
├── .gitignore
├── .env.example
├── docs/
│   └── architecture.md       ← referência (ex.: projeto 1)
└── labs/
    ├── azure-ml-automl-endpoint/   ← projeto 1 — AutoML + Online Endpoint
    │   ├── README.md, SDD.md, HOWTO.md, endpoint.json, …
    └── azure-ml-face-images/       ← projeto 2 — Vision Studio (inputs / output)
        ├── README.md
        ├── inputs/
        ├── output/
        └── assets/screenshots/
```

## Entrega DIO

- **Projeto 1:** README + [`endpoint.json`](labs/azure-ml-automl-endpoint/endpoint.json) — ver [lab 1](labs/azure-ml-automl-endpoint/README.md).
- **Projeto 2:** pastas **`inputs`** e **`output`**, **README** com processo e insights — ver [lab 2](labs/azure-ml-face-images/README.md).

## Publicar no GitHub (resumo)

1. Cria um repositório **vazio** no GitHub (sem README se vais fazer push de um projeto já local).
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

3. Confirma no GitHub que nenhum ficheiro contém **chaves** (revisa `endpoint.json`, `*.md`, scripts).

## Requisitos e segurança

- Conta **Azure** com quota para compute e endpoints (custos variam por região e SKU).
- **Nunca** commites chaves de API, tokens nem `.env` com segredos. O [`.gitignore`](.gitignore) ignora `.env` e extensões comuns de credenciais.

## Documentação por lab

- [Lab 1 — Automated ML + Online Endpoint](labs/azure-ml-automl-endpoint/README.md) · [HOWTO](labs/azure-ml-automl-endpoint/HOWTO.md) · [SDD](labs/azure-ml-automl-endpoint/SDD.md)
- [Lab 2 — Vision Studio (facial / OCR / análise)](labs/azure-ml-face-images/README.md) · [HOWTO passo a passo](labs/azure-ml-face-images/HOWTO.md)
