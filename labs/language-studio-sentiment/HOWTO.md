# HOWTO — Lab 3: Language Studio (análise de sentimentos)

Guia desde o **recurso Azure** até guardar evidências em [`output/`](./output/).

**Links úteis**

- [Language Studio](https://language.cognitive.azure.com/)
- [Analyze text with Language Studio (Learn)](https://learn.microsoft.com/training/modules/analyze-text-with-language-studio/)
- [Documentação — Azure AI Language](https://learn.microsoft.com/azure/ai-services/language-service/)

**Avisos**

- Não versionar **chaves**, connection strings nem `.env` com segredos.
- A UI do portal e do Language Studio evolui; se um menu não coincidir, use a pesquisa do portal ou o guia da DIO atual.

---

## Fase 1 — Recurso no Azure

1. [Portal Azure](https://portal.azure.com) → **Criar um recurso**.
2. Pesquisar por **Language** / **Azure AI Language Service** ou recurso **Azure AI services** (multi-serviço) conforme o curso.
3. Definir **assinatura**, **resource group** (você pode reutilizar um RG dos labs anteriores ou criar um para serviços de linguagem), **região**, **nome** e **camada de preços** (gratuito/F0 se disponível para testes; caso contrário S0 — atenção a custos).
4. **Rever + criar** → aguardar **Implantação concluída**.
5. Evidência opcional: captura da **Descrição geral** do recurso (sem abrir painel de chaves) → `output/resource-language-overview.png`.

---

## Fase 2 — Language Studio

1. Abrir [https://language.cognitive.azure.com/](https://language.cognitive.azure.com/).
2. Iniciar sessão; selecionar **assinatura** e **recurso** criados.
3. Localizar a funcionalidade de **análise de sentimentos** / **sentiment analysis** / **Analyze sentiment** (nome depende da versão e idioma da UI — seguir a trilha DIO).
4. Captura opcional da página inicial com recurso ligado → `output/language-studio-home.png`.

---

## Fase 3 — Testes com texto em português

1. Introduzir ou colar uma frase **positiva** (ex.: ver [README — exemplos](../README.md#frases-de-exemplo-português--pode-ajustar)).
2. Executar a análise; guardar a tela com entrada + resultado → `output/sentiment-positive.png`.
3. Repetir com frase **negativa** → `output/sentiment-negative.png`.
4. Repetir com frase **neutra** → `output/sentiment-neutral.png`.
5. Opcional: parágrafo com polaridades mistas → `output/sentiment-mixed.png`.
6. Se a interface permitir **copiar JSON** ou resposta bruta (sem tokens), guardar → `output/sentiment-results.json`.

**Dica:** mantenha as frases visíveis no mesmo print que o resultado, para o revisor perceber o contexto.

---

## Fase 4 — Speech Studio (opcional / enunciado DIO)

O desafio menciona também **Speech Studio**. Quando você cobrir essa parte nas aulas:

1. Abra o [Speech Studio](https://speech.microsoft.com/portal) (ou URL atual no Learn).
2. Documente em uma subseção do [README](../README.md) ou acrescente arquivos em `output/` com prefixo `speech-` (ex.: `speech-studio-overview.png`).

---

## Fase 5 — Git e entrega

1. Na raiz do monorepo: `git add labs/language-studio-sentiment/` e `README.md` se atualizado.
2. `git commit` / `git push`.
3. DIO → **Entregar projeto** com link do GitHub e descrição curta.

---

## Problemas frequentes

| Situação | O que tentar |
|----------|--------------|
| Language Studio não lista o recurso | Confirme que a implantação terminou e que você tem permissão (ex. *Contributor* no RG). |
| Funcionalidade desativada (cinza) ou indisponível | Verifique a região do recurso e o *SKU*; consulte a matriz de funcionalidades na documentação Microsoft. |
| Resultado “neutro” inesperado | Texto muito curto, só fatos, ou modelo conservador; experimente frases mais explícitas e registre nos **Insights**. |
