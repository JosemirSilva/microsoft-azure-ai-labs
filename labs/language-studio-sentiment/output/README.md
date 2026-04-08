# output

Capturas de ecrã, exports **JSON** (opcional) e outros artefactos da prática no **Language Studio** (e opcionalmente **Speech Studio**).

## Convenção de nomes sugerida

| Ficheiro | Uso |
|----------|-----|
| `resource-group-resources-language-listed.png` | **Resource group** — lista de recursos com **Language** `ai-dio-language-dev-centralus` (evidência de provisionamento no RG). |
| `resource-language-overview.png` | **Descrição geral** do recurso Language (API kind **TextAnalytics**, localização, endpoint — sem painel de chaves). |
| `language-studio-home.png` | **Language Studio** com recurso associado. |
| `sentiment-opinion-mining-01-config-run.png` | **1/3** — Configuração do *tryout* (texto PT, opinion mining). |
| `sentiment-opinion-mining-02-results.png` | **2/3** — Aba **Result**: documento positivo + **frase 1** com *target* / *assessment* detalhados. |
| `sentiment-opinion-mining-03-results-multiple-sentences.png` | **3/3** — Resultados com **mais frases** / vista expandida do mesmo texto. |
| `sentiment-positive.png` | Sentimento **positivo** (PT) + resultado (exemplo curto opcional). |
| `sentiment-negative.png` | Sentimento **negativo** (PT) + resultado. |
| `sentiment-neutral.png` | Sentimento **neutro** (PT) + resultado. |
| `sentiment-mixed.png` | Texto com polaridade **mista** (opcional, reforça portfólio). |
| `sentiment-results.json` | Resposta estruturada (sem credenciais). |

Prefixos alternativos se quiseres ordenação: `01-sentiment-positive.png`, `02-sentiment-negative.png`, etc.

## Nota sobre a DIO

O enunciado permite uma pasta **`/images`** no repositório; neste monorepo a função equivalente é **`output/`**, referenciada no [README principal do lab](../README.md).

Quando adicionares ficheiros, atualiza a tabela de evidências no `README.md` do lab (marca “concluído” ou linka cada ficheiro).
