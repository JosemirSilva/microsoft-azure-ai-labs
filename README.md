# Microsoft — Fundamentos de IA (DIO)

Repositório único para os projetos práticos da trilha **[Microsoft - Fundamentos de IA](https://web.dio.me/track/microsoft-fundamentos-de-ia)** na [Digital Innovation One (DIO)](https://www.dio.me/). Cada módulo do curso corresponde a uma **subpasta em `labs/`** — um só GitHub, histórico e portfólio centralizados.

## Progresso na trilha (1/5)

| # | Projeto (DIO) | Pasta sugerida | Estado |
|---|---------------|----------------|--------|
| 1 | [Trabalhando com Machine Learning na Prática no Azure ML](labs/azure-ml-automl-endpoint/README.md) | [`labs/azure-ml-automl-endpoint/`](labs/azure-ml-automl-endpoint/) | **Concluído** |
| 2 | Reconhecimento Facial e transformação de imagens em Dados no Azure ML | _a criar_ (ex.: `labs/azure-ml-face-images/`) | Não iniciado |
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
    └── azure-ml-automl-endpoint/   ← projeto 1 — AutoML + Online Endpoint
        ├── README.md
        ├── SDD.md
        ├── endpoint.json         ← metadados públicos do endpoint (sem chaves)
        ├── sample-request.json
        ├── data/
        ├── scripts/
        └── assets/screenshots/
```

## Entrega DIO (projeto 1)

Conforme as instruções do curso: repositório no GitHub com **README** explicando o passo a passo e **ficheiro JSON do endpoint** — ver [`labs/azure-ml-automl-endpoint/endpoint.json`](labs/azure-ml-automl-endpoint/endpoint.json) e o [README do lab](labs/azure-ml-automl-endpoint/README.md).

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

- [Lab 1 — Automated ML + Online Endpoint (README completo)](labs/azure-ml-automl-endpoint/README.md)
- [Lab 1 — HOWTO (passo a passo e recursos)](labs/azure-ml-automl-endpoint/HOWTO.md)
- [Lab 1 — Solution Design Document (SDD)](labs/azure-ml-automl-endpoint/SDD.md)
