# HOWTO — Lab 2: Vision Studio (do recurso às evidências)

Guia prático desde o **provisionamento em Azure** até fechar a entrega com **evidências** (`inputs/`, `output/`, `assets/screenshots/`, texto no `README.md`).

**Links oficiais**

- [Vision Studio](https://portal.vision.cognitive.azure.com/)
- [Content Understanding Studio](https://contentunderstanding.ai.azure.com/) (opcional)
- [Azure AI Vision — documentação](https://learn.microsoft.com/azure/ai-services/computer-vision/)
- No Learn, pesquise por: **Detect faces in Vision Studio**, **Read text in Vision Studio**, **Analyze images in Vision Studio**.

**Avisos**

- **Não** coloque chaves de API, segredos ou capturas com **Keys** visíveis no repositório.
- A interface do **portal Azure** e do **Vision Studio** mudam com o tempo; os nomes dos menus podem variar ligeiramente — use a pesquisa do portal se não encontrar um item exato.

---

## Fase 1 — Provisionamento do recurso Azure

### 1.1. Grupo de recursos

1. Entre no [Portal Azure](https://portal.azure.com) com a mesma conta/assinatura que usou no Lab 1 (se aplicável).
2. Opcional: reutilize o **resource group** do Lab 1 ou crie um novo dedicado a IA (ex. `rg-dio-aif-vision-<região>`).

### 1.2. Criar o recurso de serviços de IA

1. **Criar um recurso** → pesquise por **Azure AI services** ou **Cognitive Services** (recurso multi-serviço que agrupa capacidades de visão).
2. Selecione **Azure AI services** (ou equivalente multi-serviço indicado pela Microsoft para Vision).
3. Preencha:
   - **Assinatura** e **resource group**
   - **Região:** escolha uma região onde os serviços de visão estejam disponíveis (e alinhada com políticas de **Face API**, se for usar detecção de rostos — consulte [documentação Face](https://learn.microsoft.com/azure/ai-services/computer-vision/intro-to-spatial-analysis-public-preview) e restrições da sua assinatura).
   - **Nome** único do recurso.
   - **Camada de preços:** para estudo, use a camada **gratuita (F0)** se existir e couber na quota; caso contrário, **S0** (pago ao consumo — mantenha o lab curto e apague o recurso depois se quiser evitar custos).
4. **Rever + criar** → **Criar** e aguarde a implantação.

### 1.3. Confirmar o recurso (sem expor segredos)

1. Abra o recurso criado no portal.
2. Verifique **Endpoint** e região (pode anotar para uso técnico futuro — **não** commite chaves).
3. Opcional para evidência “de infra”: um print da **Descrição geral** do recurso mostrando **nome**, **região** e **resource group** — **corte qualquer painel de chaves** antes de guardar. Guarde em `assets/screenshots/` (ex. `01-recurso-azure-ai-overview.png`).

### 1.4. Custos e limpeza

- Após o lab, pode **eliminar o resource group** de teste ou apenas o recurso de IA se já não precisar.
- Revise **Cost Management** na assinatura se usou camada paga.

---

## Fase 2 — Primeiro acesso ao Vision Studio

1. Abra [https://portal.vision.cognitive.azure.com/](https://portal.vision.cognitive.azure.com/).
2. Inicie sessão com a conta Azure associada à assinatura do recurso.
3. Quando pedido, **selecione a assinatura** e o **recurso** que criou na Fase 1.
4. Aceite termos / confirmações se aparecerem (leia o resumo; é um ambiente de demonstração ligado ao seu recurso).

**Evidência sugerida:** print da página inicial do Vision Studio **com o recurso já selecionado** (sem dados sensíveis) → `assets/screenshots/02-vision-studio-inicio.png`.

---

## Fase 3 — “Detect faces” (detecção de rostos)

1. No Vision Studio, abra a funcionalidade **Face** / **Detect faces** (nome pode ser “Detectar rostos” ou similar conforme idioma).
2. Carregue uma imagem de [`inputs/`](./inputs/) com rostos visíveis (ex.: equipa com várias pessoas ou uma imagem “difícil” com rede à frente).
3. Observe:
   - número de rostos detectados
   - caixas (bounding boxes) nos rostos
   - atributos disponíveis na sua versão (idade estimada, máscara, etc., conforme política e região)
4. **Evidências**
   - Captura de tela com o resultado na interface → `assets/screenshots/03-detect-faces-<nome-curto>.png`.
   - Em [`output/`](./output/): se puder copiar texto/JSON da análise, guarde como `faces_<nome-do-arquivo-original>.txt` (ou `.json`). Se não houver export, indique no `README.md` que o resultado está **só** no print (válido para a DIO desde que fique claro).

---

## Fase 4 — “Read” (reconhecimento de texto / OCR)

1. Abra **Read** / **Read text** / **Extrair texto** (OCR).
2. Use uma imagem com **texto legível** no equipamento (ex.: patrocinador, números, “BANCO DO BRASIL”, etc.).
3. Confira linhas, palavras e confiança (se mostrada).
4. **Evidências**
   - Print → `assets/screenshots/04-read-ocr-<nome-curto>.png`.
   - Em `output/`: arquivo **`ocr_<nome>.txt`** (copiar o texto reconhecido) ou resumo em Markdown. Este passo cobre explicitamente o pedido da DIO sobre **resultados de reconhecimento de texto**.

---

## Fase 5 — “Analyze image” / análise de imagem

1. Abra **Analyze** / **Analyze image** / **Image analysis** (etiquetas, objetos, descrição ou funcionalidades da versão atual).
2. Carregue 1–2 imagens de `inputs/` (podem ser as mesmas ou outras).
3. Anote **2–3 etiquetas ou objetos** que o serviço identificou e se fazem sentido no contexto (ex.: “person”, “sports”, “text”).
4. **Evidências**
   - Print → `assets/screenshots/05-analyze-<nome-curto>.png`.
   - Opcional em `output/`: `analise_<nome>.md` com bullets dos resultados.

---

## Fase 6 — Fechar evidências no repositório

### 6.1. Estrutura mínima

| Local | Conteúdo |
|--------|-----------|
| [`inputs/`](./inputs/) | Imagens usadas (já com nota de direitos em `inputs/README.md`). |
| [`output/`](./output/) | Pelo menos **OCR** em arquivo de texto (e opcionalmente resumos de faces/análise). |
| [`assets/screenshots/`](./assets/screenshots/) | Prints **sem chaves** cobrindo recurso (opcional), Vision Studio, Face, Read, Analyze. |
| [`README.md`](./README.md) | Processo em palavras suas + seção **Insights** preenchida + referências às imagens (`![](./assets/screenshots/...)`). |

### 6.2. Como referenciar prints no README

Exemplo (ajuste os nomes dos arquivos):

```markdown
### Evidências

| Etapa | Captura |
|-------|---------|
| OCR | ![Read](./assets/screenshots/04-read-ocr-exemplo.png) |
| Rostos | ![Faces](./assets/screenshots/03-detect-faces-equipa.png) |
```

### 6.3. Git

```bash
git add labs/azure-ml-face-images/
git status   # confirme que não há .env nem arquivos com chaves
git commit -m "Lab 2: Vision Studio — inputs, output de OCR e evidências"
git push
```

---

## Fase 7 — Entrega na DIO

1. Confirme o [checklist no README](README.md#checklist-de-entrega-dio).
2. Cole o **URL do repositório** GitHub no botão **Entregar projeto** na DIO.

---

## Problemas frequentes

| Sintoma | O que fazer |
|---------|-------------|
| Não consigo selecionar o recurso no Vision Studio | Confirme que o recurso está **provisionado**, na mesma assinatura, e que tem permissões de **Leitor** ou superior. |
| Face não disponível ou erro de política/região | Verifique [disponibilidade e requisitos da Face API](https://learn.microsoft.com/azure/ai-services/computer-vision/overview-identity); mude de região ou tipo de recurso conforme documentação atual. |
| OCR falha ou texto incompleto | Use imagem com maior resolução ou contraste; texto muito oblíquo ou cortado piora o resultado (bom para mencionar nos **insights**). |
| WebP não carrega | Converta para **JPEG** ou **PNG** e volte a testar. |

---

Quando terminar, volte ao [README do lab](README.md) e preencha **Insights e possibilidades** com exemplos reais do que observou (privacidade, qualidade do OCR, limitações das poses, etc.).
