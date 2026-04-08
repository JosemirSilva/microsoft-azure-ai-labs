# Guia passo a passo “em tela” — Lab 3 (Language Studio · sentimentos)

Use este arquivo como **roteiro linear** no browser. Os nomes exatos dos botões podem variar ligeiramente (idioma da UI ou atualização Microsoft); em caso de dúvida, siga primeiro as **video-aulas da DIO** e use a **pesquisa** dentro do Language Studio.

**Recurso de referência (já criado):** `ai-dio-language-dev-centralus` (resource group `rg-dio-aif-ml-dev-centralus`).

---

## Parte A — Confirmar o recurso (Portal Azure) — opcional

1. Abra [https://portal.azure.com](https://portal.azure.com) e inicie sessão.
2. Na barra superior, **Pesquisar recursos, serviços e documentos (G+/)** → escreva **`ai-dio-language-dev-centralus`** → abra o recurso.
3. No painel **Descrição geral**, confirme: **Estado** = ativo, **Tipo** = Language (ou Language service), **Localização** = Central US.
4. *(Opcional)* Procure um link do tipo **“Abrir no Language Studio”** / **“Open in Language Studio”** / **“Get started in Language Studio”** e clique — o browser pode abrir já com o recurso pré-selecionado.
5. **Não** abra **Chaves e ponto final** para tirar print do Lab se o objetivo for só evidência de configuração (evita expor chaves). Os prints de RG e Overview já estão em [`output/`](./output/).

---

## Parte B — Entrar no Language Studio

1. Abra uma janela anônima ou normal e vá a **[https://language.cognitive.azure.com/](https://language.cognitive.azure.com/)**.
2. Clique em **Iniciar sessão** / **Sign in** e use a **mesma conta** da assinatura Azure onde está o recurso.
3. Se aparecer **termos de utilização** ou confirmação de processamento de dados, leia e aceite se concordar (requisito para usar a demo).

---

## Parte C — Associar assinatura e recurso

1. Deverá surgir uma tela para **escolher a assinatura** (**Subscription**). Selecione a assinatura correta (ex.: “Azure subscription 1”).
2. Em seguida, **selecione o recurso** **Language** na lista — o seu **`ai-dio-language-dev-centralus`**.
3. Confirme com **Done** / **Concluído** / **Select resource** (conforme o texto do botão).
4. **Captura:** guarde como [`output/language-studio-home.png`](./output/language-studio-home.png) — deve mostrar o **tela principal** do Language Studio com o recurso já ligado (cabeçalho ou rodapé por vezes indica o nome do recurso).

Se **não** aparecer o recurso na lista: no Portal, confirme que a implantação está concluída e que a sua conta tem permissão de leitura no resource group.

---

## Parte D — Abrir a análise de sentimentos

1. Na **página inicial** do Language Studio, percorra os **cartões** ou o **menu lateral** em busca de funcionalidades de texto semelhantes a:
   - **“Sentiment and opinion mining”** / **Sentimento e mineração de opiniões**, ou  
   - **“Analyze sentiment”** / **Analisar sentimento**, ou  
   - **“Classify text”** com subtópico de sentimento.
2. Clique na opção que permita **experimentar** / **Experimente já** / **Try it out** com texto livre (demo interativa).
3. Se a UI pedir **confirmação** de que a demo consome quota do seu recurso, marque a caixa e continue (é o equivalente ao Vision Studio “I acknowledge…”).

> **Dica:** Se não encontrar à primeira, use a **caixa de pesquisa** no topo do site (se existir) ou o módulo Learn [Analyze text with Language Studio](https://learn.microsoft.com/training/modules/analyze-text-with-language-studio/) para ver capturas atualizadas.

---

## Parte E — Teste 1 — frase positiva (português)

1. Na área de **entrada de texto** / **Enter text** / caixa grande, cole uma frase **claramente positiva** em português. Exemplo (você pode alterar):  
   `O atendimento foi excelente e superou as minhas expectativas.`
2. Clique em **Run** / **Executar** / **Analyze** (ou ícone equivalente).
3. Observe o resultado: **sentimento** do documento e, se existir, **por frase** e **scores** / percentagens.
4. **Captura:** [`output/sentiment-positive.png`](./output/sentiment-positive.png) — deve incluir **texto introduzido** + **resultado** na mesma imagem (sem mostrar chaves).

---

## Parte F — Teste 2 — frase negativa (português)

1. Apague o texto anterior ou use o botão **Clear** / **Limpar** se existir.
2. Cole uma frase **negativa**, por exemplo:  
   `Estou muito insatisfeito com o atraso na entrega do pedido.`
3. Execute de novo a análise.
4. **Captura:** [`output/sentiment-negative.png`](./output/sentiment-negative.png).

---

## Parte G — Teste 3 — frase neutra (português)

1. Cole uma frase **neutra** (fato, horário, sem elogio nem reclamação), por exemplo:  
   `A loja funciona das 9h às 18h, de segunda a sexta.`
2. Execute a análise.
3. **Captura:** [`output/sentiment-neutral.png`](./output/sentiment-neutral.png).

---

## Parte H — Teste opcional — texto com sentimento misto

1. Cole um texto com **duas ideias opostas**, por exemplo:  
   `Adoro o produto, mas a embalagem chegou danificada.`
2. Execute e veja se o serviço separa **sentimento por frase** ou dá **misto** / **neutro** no documento.
3. **Captura:** [`output/sentiment-mixed.png`](./output/sentiment-mixed.png).

---

## Parte I — JSON (opcional)

1. Se existir separador **JSON** / **Result** / **View API response** ao lado do resultado visual, abra-o.
2. **Copie** o JSON (veja se não contém segredos — normalmente não) e guarde como [`output/sentiment-results.json`](./output/sentiment-results.json).
3. Se preferir, faça print do painel JSON em **`sentiment-results-json.png`** em vez de arquivo `.json`.

---

## Parte J — Speech Studio (quando a DIO / aulas pedirem)

1. Abra [Speech Studio](https://speech.microsoft.com/portal) (ou o link das aulas).
2. Inicie sessão, escolha recurso de **Speech** (você pode precisar criar um recurso **Speech** se ainda não existir — seguir o Learn “Explore Speech Studio”).
3. Documente com capturas `output/speech-<descricao>.png` e uma frase curta no [README](./README.md) na seção de extensão.

---

## Parte K — Fechar o lab no repositório

1. Confirme os arquivos em [`output/`](./output/) (nomes sugeridos em [`output/README.md`](./output/README.md)).
2. No [README.md](./README.md) principal do lab: marque **Estado** na tabela de evidências, preencha **Insights** com o que observou (ex.: frases curtas classificadas como neutras, limitações em ironia).
3. Na **raiz** do monorepo: `git add labs/language-studio-sentiment/` → `commit` → `push`.
4. Na **DIO**: **Entregar projeto** com o link do GitHub e descrição breve.

---

## Problemas rápidos na UI

| O que você vê | O que fazer |
|-----------|-------------|
| Pedido de recurso e lista vazia | Criar/implantar recurso Language no Portal; aguardar alguns minutos. |
| Erro de região ou funcionalidade indisponível | Ver documentação da funcionalidade para a sua região; ou criar recurso em outra região suportada (avaliar custo). |
| Tudo “neutro” | Testar frases mais explícitas emocionalmente; registrar nos Insights como limitação do modelo ou do texto. |
| Interface em outro idioma | Alterar idioma do browser ou da conta Microsoft, ou seguir posição dos botões com este guia em paralelo. |

---

*Última referência de fluxo: documentação Microsoft Learn e Language Studio. Ajuste os nomes de menu se a Microsoft renomear demos.*
