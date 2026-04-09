# HOWTO — Lab 5: IA Generativa com Copilot e OpenAI

Referência técnica rápida. Para o roteiro completo, ver [README.md](./README.md).

---

## Parte 1 — Microsoft Copilot

### Acesso

- URL: [copilot.microsoft.com](https://copilot.microsoft.com)
- *Login:* conta Microsoft pessoal ou corporativa

### Testar geração de texto

1. Digite um *prompt* na caixa de chat.
2. Observe a resposta gerada, as fontes citadas e as sugestões de seguimento.
3. Faça perguntas de acompanhamento (*follow-up*) para explorar o contexto.

### Testar geração de imagem

1. Digite um *prompt* descritivo (ex.: "Um gato astronauta a flutuar no espaço, estilo aquarela").
2. O Copilot recorre a modelos de geração de imagem (família DALL·E / equivalentes, conforme a região e o produto).
3. Guarde a imagem gerada para evidência em [`output/`](./output/).

### Testar geração de código

1. Peça um *script* simples (ex.: "Escreva um script Python que faz um pedido HTTP e mostra o código de estado").
2. Copie o código e valide a estrutura (revisão humana recomendada).

---

## Parte 2 — Azure OpenAI Studio

### Acesso

- URL: [oai.azure.com](https://oai.azure.com)
- Requer: assinatura Azure com recurso **Azure OpenAI** aprovado

> **Atenção:** o Azure OpenAI pode exigir pedido de acesso à Microsoft.  
> Se não tiver acesso, documente a limitação e concentre as evidências no **Copilot** — a DIO valoriza documentação clara em ambos os cenários.

### Chat Playground

1. Selecione um modelo (ex.: **gpt-4o** ou **gpt-35-turbo**, conforme disponível).
2. Configure a **System message** (ex.: "És um assistente especialista em Azure AI.").
3. Envie mensagens e observe as respostas.

### Content Filters

1. No menu lateral: **Content filters** (*Content filtering* / políticas associadas ao recurso).
2. Observar as categorias: **Hate**, **Violence**, **Sexual**, **Self-harm**.
3. Cada categoria costuma ter níveis de severidade (ex.: *low*, *medium*, *high*, conforme a UI).
4. Teste um *prompt* que possa acionar moderação e documente o comportamento (sem expor conteúdo ilegal ou dados sensíveis).

---

## Parte 3 — Documentar prompts

Guarde cada *prompt* testado em [`prompts/`](./prompts/) seguindo a convenção:

```
prompts/
├── texto-01-explicacao-ia-generativa.md
├── texto-02-casos-de-uso-empresas.md
├── imagem-01-robo-escritorio.md
├── codigo-01-script-python-csv.md
└── chat-01-sistema-azure-expert.md
```

---

## Comandos Git (raiz do repositório)

```bash
git add labs/generative-ai-copilot-openai/
git commit -m "feat(lab5): <descreva o que foi feito>"
git push origin main
```
