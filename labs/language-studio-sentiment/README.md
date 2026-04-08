# Lab 3 — Análise de sentimentos com Language Studio (Azure AI)

**Estado:** **Concluído** — evidências em [`output/`](./output/), insights documentados, pronto para entrega na DIO.

**Projeto 3/5** da trilha [Microsoft — Fundamentos de IA](https://web.dio.me/track/microsoft-fundamentos-de-ia) · Desafio DIO: [Análise de sentimentos com Language Studio no Azure AI](https://web.dio.me/lab/analise-de-sentimentos-com-language-studio-no-azure-ai/learning/f6884c74-e7aa-4700-a84b-a3446e0b6d8d?back=/track/microsoft-fundamentos-de-ia).

> O desafio abrange **Azure Speech Studio** e **Language Studio**, com foco em **voz** e **linguagem natural**. Este lab documenta sobretudo a parte de **análise de sentimentos** no **Language Studio**; podes estender o repositório com notas ou evidências de **Speech Studio** quando seguires as video-aulas.

Repositório monorepo: [README da trilha](../../README.md).

**Guias**

- [HOWTO.md](./HOWTO.md) — visão técnica por fases (referência rápida).
- **[GUIA-PASSO-A-PASSO-TELA.md](./GUIA-PASSO-A-PASSO-TELA.md)** — roteiro **manual ecrã a ecrã** (Language Studio, testes PT, capturas, Speech opcional).

---

## Objetivo

Praticar o **Language Studio** para analisar o **sentimento** (e sentimentos por frase, quando disponível) em texto — incluindo **frases em português** com polaridade **positiva**, **negativa** e **neutra** — e documentar o fluxo técnico e os insights para portfólio e entrega DIO.

---

## Entrega DIO (resumo)

Conforme o enunciado:

| Requisito | Como cumprir neste repo |
|-----------|-------------------------|
| Repositório público com **README detalhado** | Este ficheiro + [HOWTO.md](./HOWTO.md) |
| Ficheiros relevantes à experiência | Pasta [`output/`](./output/) (prints, JSON opcional) |
| Opcional: capturas em **`/images`** | A DIO sugere `/images`; aqui usamos **`output/`** (mesmo papel — organização clara); podes duplicar em `assets/screenshots/` se preferires |
| Entregar link + descrição | Botão **Entregar projeto** na plataforma DIO |

**Recursos oficiais (Microsoft Learn):**

- [Explore Speech Studio — laboratório](https://learn.microsoft.com/training/modules/get-started-azure-speech/)
- [Analyze text with Language Studio — laboratório](https://learn.microsoft.com/training/modules/analyze-text-with-language-studio/)

---

## Pré-requisitos

- Conta **Microsoft Azure** (pode reutilizar a subscrição dos Labs 1 e 2).
- Permissão para criar um recurso **Azure AI Language** ou recurso multi-serviço **Azure AI services** / **Cognitive Services** com capacidades de **análise de texto**, conforme o assistente do portal nas aulas.
- Navegador atualizado; acesso ao **[Language Studio](https://language.cognitive.azure.com/)** (início de sessão com a conta Azure).

**Segurança:** não commits de **chaves** de API, tokens nem capturas com painel "Keys" em foco.

---

## Passo a passo resumido (o que fazer)

1. **Criar recurso** no Azure compatível com **Language** / análise de texto (nome, resource group, região, escalão — ver [HOWTO.md](./HOWTO.md)).
2. Abrir o **[Language Studio](https://language.cognitive.azure.com/)**, associar **subscrição** e **recurso**; aceitar termos se solicitado.
3. Abrir a área de **análise de texto** / **sentiment** (nome exato varia com a versão do produto — sigas as aulas DIO).
4. Testar **várias frases em português**:
   - tom **positivo** (ex.: elogio, satisfação);
   - tom **negativo** (ex.: reclamação, frustração);
   - tom **neutro** (ex.: facto objetivo, sem carga emocional forte).
5. Opcional: exemplo **misto** (texto com mais do que uma frase e polaridades diferentes) — ver nomes sugeridos em [`output/README.md`](./output/README.md).
6. Guardar **capturas de ecrã** e/ou **JSON** exportado em [`output/`](./output/) com os nomes acordados na tabela abaixo.
7. Preencher neste README a secção **Insights** com conclusões reais (limiar de confiança, idioma, limitações).
8. `git add` / `commit` / `push` a partir da **raiz** do repositório; entregar o link na DIO.

---

## Evidências em `output/`

| Ficheiro | Conteúdo | Estado |
|----------|----------|--------|
| [`resource-group-resources-language-listed.png`](./output/resource-group-resources-language-listed.png) | Portal Azure — resource group **`rg-dio-aif-ml-dev-centralus`**, separador **Recursos**, recurso **Language** `ai-dio-language-dev-centralus` visível na lista. | Guardado |
| [`resource-language-overview.png`](./output/resource-language-overview.png) | Portal Azure — **Descrição geral** do recurso `ai-dio-language-dev-centralus` (tipo Language, **TextAnalytics**, escalão Free, endpoint público). | Guardado |
| [`sentiment-opinion-mining-01-config-run.png`](./output/sentiment-opinion-mining-01-config-run.png) | **1/3** — *Sentiment and opinion mining tryout*: configuração (PT-BR, recurso **F0**, texto Bootcamp DIO/Azure, **Opinion mining** ON). | Guardado |
| [`sentiment-opinion-mining-02-results.png`](./output/sentiment-opinion-mining-02-results.png) | **2/3** — separador **Result**: **Document sentiment** (positivo, 99%), **Sentence 1** com *target* "experiência" e *assessment* "incrível", métricas de opinião. | Guardado |
| [`sentiment-opinion-mining-03-results-multiple-sentences.png`](./output/sentiment-opinion-mining-03-results-multiple-sentences.png) | **3/3** — mesma análise: vista com **várias frases** / expansão (ex. frase neutra com scores, mais anotações no texto). | Guardado |
| `language-studio-home.png` | Language Studio — página inicial (opcional se já couber nas capturas acima). | Opcional — não gerado |
| `sentiment-positive.png` | Exemplo curto **positivo** (opcional, reforço DIO). | Opcional — não gerado |
| `sentiment-negative.png` | Frase **negativa** em PT + resultado. | Opcional — não gerado |
| `sentiment-neutral.png` | Frase **neutra** em PT + resultado. | Opcional — não gerado |
| `sentiment-mixed.png` | Texto com **sentimento misto** (várias frases ou polaridades). | Opcional — não gerado |
| `sentiment-results.json` | Export ou cópia estruturada do JSON devolvido pela API/UI (sem credenciais). | Opcional — não gerado |

Lista detalhada e convenções: [`output/README.md`](./output/README.md).

### Frases de exemplo (português) — pode ajustar

Use como ponto de partida; escreva as tuas variantes nas aulas.

| Polaridade | Exemplo de frase |
|------------|------------------|
| Positiva | "O atendimento foi excelente e superou as minhas expectativas." |
| Negativa | "Estou muito insatisfeito com o atraso na entrega do pedido." |
| Neutra | "A loja funciona das 9h às 18h, de segunda a sexta." |
| Misto | "Adoro o produto, mas a embalagem chegou danificada." |

---

## Checklist de entrega (DIO)

- [x] Video-aulas assistidas (incluindo Speech Studio, se o desafio o exigir integralmente).
- [x] Recurso Azure configurado e Language Studio acessível.
- [x] Pasta **`output/`** com pelo menos três capturas — `sentiment-opinion-mining-01`, `02` e `03` salvas.
- [x] **`README.md`** com processo, tabela de evidências atualizada e **Insights** preenchidos.
- [ ] Repositório atualizado no GitHub; **Entregar projeto** na DIO com link e descrição breve.

---

## Insights e possibilidades

### Resultados observados

- **Alta confiança em PT-BR:** o modelo retornou 99% de confiança para sentimento positivo em texto sobre o Bootcamp DIO/Azure — o serviço reconhece vocabulário técnico e educacional em português sem configuração extra.

- **Opinion Mining vai além do sentimento geral:** além de classificar o documento como positivo, o modelo identificou o *target* "experiência" com o *assessment* "incrível" — útil para saber *sobre o quê* o usuário está satisfeito ou insatisfeito, não apenas *se* está.

- **Análise por frase:** em textos com múltiplas sentenças, cada frase recebe seu próprio score independente, permitindo detectar polaridades mistas dentro do mesmo documento.

- **Escalão Free (F0):** suficiente para prototipagem e labs; para produção com volume alto, avaliar o tier S com SLA garantido.

### Limitações identificadas

- Sarcasmo e ironia tendem a ser classificados como positivos se as palavras individuais forem positivas — o modelo analisa léxico, não intenção pragmática.
- Textos muito curtos (1–2 palavras) retornam scores menos confiantes.

### Casos de uso reais

- Triagem automática de chamados de suporte ao cliente
- Análise de reviews de produtos em e-commerce
- Monitoramento de menções em redes sociais
- Pipeline completo: **Speech Studio → transcrição → Language Studio → sentimento** (extensão natural deste lab)

---

## Relação com os labs anteriores

| Lab | Foco |
|-----|------|
| 1 — AutoML | Dados **estruturados**, modelo supervisionado, endpoint ML |
| 2 — Visão | **Imagem** → texto e metadados |
| 3 — Language | **Texto** → sentimento e análise linguística |

---

## Publicar alterações (lembrança)

Na **raiz** do repositório:

```bash
git add labs/language-studio-sentiment/
git add README.md
git status
git commit -m "feat(lab3): Language Studio — análise de sentimentos (docs e estrutura)"
git push origin main
```

*(Ajusta o nome do ramo se não for `main`.)*
