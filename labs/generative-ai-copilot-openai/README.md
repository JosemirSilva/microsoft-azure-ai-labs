# Lab 5 — Explorando IA Generativa com Copilot e OpenAI

**Estado:** **Concluído** — evidências em [`output/`](./output/) e *prompts* em [`prompts/`](./prompts/). Falta apenas **push** no GitHub e **Entregar projeto** na DIO (se ainda não fez).

**Projeto 5/5** da trilha [Microsoft — Fundamentos de IA](https://web.dio.me/track/microsoft-fundamentos-de-ia) · Desafio DIO: [Explorando os Recursos de IA Generativa com Copilot e OpenAI](https://web.dio.me/lab/explorando-os-recursos-de-ia-generativa-com-copilot-e-openai/learning/1a2619f1-4d92-435a-b010-3baef67cae55).

**Contexto da execução:** foi criado o recurso **Azure OpenAI** `aoai-dio-dev-eastus` (SKU **S0**, região efetiva **Central US** no portal — o nome do recurso contém *eastus*, mas a localização mostrada é *centralus*). Não houve **cota** disponível para implantar modelo (**0 TPM** / alocação zero em várias regiões testadas; erro **InvalidCapacity** ao tentar `gpt-4o-mini`). O **Chat playground** permaneceu em *Deployment needed*. O **Microsoft Copilot** foi usado como substituto para **texto**, **imagem** e **código**, com documentação em [`prompts/`](./prompts/).

> O desafio explora as funcionalidades do **Microsoft Copilot** e das ferramentas da **Azure OpenAI**, com ênfase nos **filtros de conteúdo** e nos recursos de **criação assistida por IA** — geração de texto, imagem e código.

Repositório monorepo: [README da trilha](../../README.md).

**Guias**

- [HOWTO.md](./HOWTO.md) — visão técnica por fases.

---

## Objetivo

Explorar na prática os recursos de IA Generativa disponíveis no **Microsoft Copilot** ([copilot.microsoft.com](https://copilot.microsoft.com)) e no **Azure OpenAI Studio** ([oai.azure.com](https://oai.azure.com)), documentando prompts aplicados, resultados obtidos e o comportamento dos **filtros de conteúdo** — gerando um repositório de referência para portfólio e entrega DIO.

---

## Arquitetura do lab

```
Microsoft Copilot (copilot.microsoft.com)
    ↓ geração de texto, imagem e código (executado neste lab)
Azure AI Foundry / Azure OpenAI (recurso + portal)
    ↓ cota / deployments / Chat playground (bloqueado por 0 TPM nesta assinatura)
Guardrails & content filters (documentação + evidências parciais)
Documentação de prompts → prompts/ · capturas → output/
```

---

## Entrega DIO (resumo)

| Requisito | Como cumprir neste repositório |
|-----------|--------------------------------|
| Repositório público com **README** detalhado | Este arquivo + [HOWTO.md](./HOWTO.md) |
| Exemplos de uso e prompts aplicados | Pasta [`prompts/`](./prompts/) |
| Anotações sobre aprendizados | Seção **Insights** neste README |
| Capturas de tela relevantes | Pasta [`output/`](./output/) |
| Enviar link + descrição | Botão **Entregar projeto** na plataforma DIO |

**Recursos oficiais (Microsoft Learn):**

- [Explore generative AI with Microsoft Copilot](https://learn.microsoft.com/en-us/training/modules/get-started-microsoft-copilot/)
- [Explore Azure OpenAI](https://learn.microsoft.com/en-us/training/modules/explore-azure-openai/)
- [Explore content filters in Azure OpenAI](https://learn.microsoft.com/en-us/training/modules/explore-azure-openai-content-filters/)

---

## Pré-requisitos

- Conta **Microsoft** para acesso ao Copilot.
- Conta **Azure** com recurso **Azure OpenAI** (aprovação e **cota regional** para *deploy* — ver [HOWTO.md](./HOWTO.md)). Este lab registra um cenário em que o recurso existe, mas a **cota de TPM** impediu criar *deployment*.
- Navegador atualizado.

**Segurança:** não faça *commit* de chaves de API, tokens nem capturas com o painel **Keys** em foco.

---

## Passo a passo resumido

### Parte 1 — Microsoft Copilot

1. Acesse [copilot.microsoft.com](https://copilot.microsoft.com) com conta Microsoft.
2. Testar geração de **texto** com prompts variados (ver [`prompts/`](./prompts/)).
3. Testar geração de **imagem** via *prompt* descritivo.
4. Testar geração de **código** (ex.: *script* Python simples).
5. Guardar evidências em [`output/`](./output/).

### Parte 2 — Azure OpenAI / Microsoft Foundry

1. Acesse o portal do recurso (ex.: [Azure AI Foundry](https://ai.azure.com/) / [oai.azure.com](https://oai.azure.com)) com a conta Azure.
2. Verificar **Overview**, **Quota** e tentativa de **Deploy** (modelo *gpt-4o-mini* ou equivalente).
3. Se houver cota: explorar **Chat playground**, **System message** e **Content filters / Guardrails**.
4. **Neste lab:** o *playground* ficou sem *deployment*; documente a tela **Model quota** (0 alocado) e o erro de capidade ao implantar.
5. Guarde evidências em [`output/`](./output/).

### Parte 3 — Documentar

1. Guardar os *prompts* usados em [`prompts/`](./prompts/).
2. Preencher a seção **Insights** neste README.
3. Na raiz do repositório: `git add` / `commit` / `push` e entregar na DIO.

---

## Evidências em `output/`

| Arquivo | Conteúdo | Estado |
|---------|-----------|--------|
| [`aoai-resource-group-openai-destaque.png`](./output/aoai-resource-group-openai-destaque.png) | *Resource group* `rg-dio-aif-ml-dev-centralus` com recurso **Azure OpenAI** `aoai-dio-dev-eastus` destacado. | Feito |
| [`aoai-resource-overview.png`](./output/aoai-resource-overview.png) | Recurso Azure OpenAI no Foundry — *Welcome*, endpoint, região **centralus**, SKU **S0** (chave mascarada). | Feito |
| [`aoai-quota-esgotada.png`](./output/aoai-quota-esgotada.png) | **Model quota** — alocação **0** TPM (ex.: modelo *4.1-mini* / Global Standard em várias regiões). | Feito |
| [`aoai-deploy-gpt4o-mini-invalid-capacity.png`](./output/aoai-deploy-gpt4o-mini-invalid-capacity.png) | Falha de *deploy* `gpt-4o-mini` — **InvalidCapacity** (*capacity 0*). | Feito |
| [`aoai-playground-no-deployment.png`](./output/aoai-playground-no-deployment.png) | **Chat playground** — *No deployment exists* / *Deployment needed*. | Feito |
| [`copilot-text-generation.png`](./output/copilot-text-generation.png) | Geração de texto no Microsoft Copilot (ex.: explicação de IA generativa para iniciantes). | Feito |
| [`copilot-image-generation.png`](./output/copilot-image-generation.png) | Geração de imagem no Copilot + *prompt* visível. | Feito |
| [`copilot-code-generation.png`](./output/copilot-code-generation.png) | Geração de código Python (CSV) no Copilot. | Feito |
| `aoai-content-filters.png` | Tela **Guardrails** / *Content filters* com categorias (*hate*, *violence*, etc.). | Pendente — sem captura neste lote |
| `copilot-content-filter-test.png` | Teste de moderação / filtro no Copilot. | Pendente — sem captura neste lote |

*Convenções e nomes adicionais:* [`output/README.md`](./output/README.md).  
Ilustração exportada do *prompt* de imagem: [`imagem-01-robo-cafe-cartoon.png`](./output/imagem-01-robo-cafe-cartoon.png).

---

## Prompts utilizados

Os *prompts* aplicados durante o lab estão documentados em [`prompts/`](./prompts/).

### Exemplos de prompts testados

| Categoria | Prompt | Ferramenta |
|-----------|--------|------------|
| Texto | "Explique como funciona a IA generativa para um iniciante" | Copilot |
| Texto | "Liste 5 casos de uso de IA generativa em empresas brasileiras" | Copilot |
| Imagem | "Um robô amigável tomando café em um escritório moderno, estilo cartoon" | Copilot |
| Código | "Escreva um script Python que lê um arquivo CSV e exibe as 5 primeiras linhas" | Copilot |
| Chat | "Você é um assistente especialista em Azure. Como funciona o Azure AI Search?" | Azure OpenAI *(não executado — sem deployment)* |
| Filtro | Teste com conteúdo sensível para verificar comportamento do filtro | Azure OpenAI / Copilot *(parcial — ver Pendente em evidências)* |

---

## Checklist de entrega (DIO)

- [x] Video-aulas assistidas (Copilot, Azure OpenAI, *content filters*) — *marque se aplicável*.
- [x] Microsoft Copilot testado — texto ([*prompts*](./prompts/)), imagem e código (evidências `copilot-*`).
- [x] Azure OpenAI / Foundry acessado — recurso, **Quota** e tentativa de *deploy* documentados.
- [ ] System prompt configurado no *playground* *(bloqueado: sem modelo implantado / 0 TPM)*.
- [ ] *Content filters* no portal com captura dedicada *(Pendente em `output/`)*.
- [x] Pasta **`output/`** com **mais de quatro** evidências (Copilot + cota + *playground*).
- [x] Pasta **`prompts/`** com *prompts* documentados.
- [x] **`README.md`** com **Insights** e contexto de cota.
- [ ] Repositório atualizado no GitHub; **Entregar projeto** na DIO.

---

## Insights e possibilidades

- **Cota e *deploy*:** ter recurso **Azure OpenAI** criado não garante TPM disponível. Com alocação **0** na página **Model quota** e erro **InvalidCapacity** ao definir capacidade **0 TPM**, o *Chat playground* não passa de “*create a deployment*” — é um resultado válido para documentar em portfólio.
- **Nome *vs.* região:** o recurso `aoai-dio-dev-eastus` pode aparecer com localização **Central US** no painel — reforça a importância de conferir **Overview** e **Quota** em vez de assumir o nome.
- **Copilot como plano B:** com o *playground* bloqueado, o **Copilot** permitiu cobrir **texto**, **imagem** e **código** com *prompts* reproduzíveis em [`prompts/`](./prompts/).
- **Copilot vs Azure OpenAI:** no OpenAI gerido no Azure há mais **controle** (RG, RBAC, *content filtering* de recurso, métricas); no Copilot a experiência é consumo imediato, com políticas da Microsoft na camada do produto.
- **System prompt:** não foi possível validar no *playground* sem *deployment*; o conceito permanece descrito no [HOWTO](./HOWTO.md) para quando houver cota.
- **Filtros de conteúdo:** categorias *hate*, *violence*, *sexual*, *self-harm* — integrar captura de **Guardrails** quando o acesso ao painel estiver estável.
- **Geração de imagem / código no Copilot:** boa aderência a *prompts* em PT-BR; revisão humana obrigatória para código de produção.
- **Integração com a trilha:** Lab 5 (geração) complementa Lab 4 (busca em documentos) e Lab 3 (NLP clássico) — arquiteturas reais costumam combinar vários serviços.

---

## Relação com os labs anteriores

| Lab | Foco | Tipo de IA |
|-----|------|------------|
| 1 — AutoML | Modelo supervisionado, predição | IA preditiva |
| 2 — Visão | Detecção facial, OCR | IA de percepção |
| 3 — Language | Análise de sentimentos, NLP | IA de linguagem |
| 4 — AI Search | Indexação e busca cognitiva | IA de conhecimento |
| 5 — Generativa | Geração de texto, imagem e código | IA generativa |

---

## Publicar alterações

Na **raiz** do repositório:

```bash
git add labs/generative-ai-copilot-openai/
git add README.md
git status
git commit -m "feat(lab5): IA Generativa Copilot e OpenAI — estrutura inicial"
git push origin main
```

*(Ajuste o nome do ramo se não for `main`.)*
