# output

Guarde aqui os **resultados** do processamento no **Vision Studio**, **Document Intelligence Studio** ou serviços equivalentes em Azure AI (e exports associados).

## Sugestão de conteúdo (entrega DIO)

O enunciado pede os **resultados de reconhecimento de texto** nas imagens; o título do módulo inclui **reconhecimento facial**. Recomenda-se:

| Tipo | Exemplo de arquivo |
|------|---------------------|
| Texto (OCR) | `ocr_<nome-da-imagem>.txt` ou `.json` com o texto detectado |
| Rostos | `faces_<nome-da-imagem>.json` com caixas / atributos exportados (se a UI permitir copiar) |
| Resumo | `analise_<nome>.md` com insights em texto |

Se o Vision Studio só permitir **captura de tela**, pode duplicar os prints em [`assets/screenshots/`](../assets/screenshots/) e no `README.md` principal mencionar que o `output/` contém exports equivalentes quando disponíveis.

## Alguns arquivos nesta pasta

| Arquivo | Conteúdo |
|----------|-----------|
| `imagem1.png` … `imagem5.png` | Capturas da demo **Detect faces** no Vision Studio. |
| `imagem6-portrait-processing.png` | Demo **Portrait processing**: rosto detectado, painel JSON (pose, blur, máscara, qualidade) e aviso de rosto pouco adequado a remoção de fundo — evidência de “imagem → dados” e limites de qualidade. |
| `imagem7-document-intelligence-ocr-read.png` | **Document Intelligence Studio** → OCR/Read (`propaganda1.jpg`): texto extraído com regiões na imagem; recurso `ai-dio-vision-dev-centralus`. |
| `ocr_propaganda1.txt` | Texto reconhecido (parágrafos da aba **Content**), correspondente à mesma propaganda. |
