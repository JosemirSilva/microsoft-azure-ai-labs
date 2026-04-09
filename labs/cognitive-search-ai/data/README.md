# data/ — Mock de Coffee Reviews

Arquivos `.txt` gerados para simular avaliações reais de cafés brasileiros,
usados no Lab 4 para testar a ingestão, indexação e consulta no Azure AI Search.

## Distribuição

| Arquivo | Sentimento | Cidade |
|---------|------------|--------|
| review-001.txt | Positivo | São Paulo, SP |
| review-002.txt | Positivo | Rio de Janeiro, RJ |
| review-003.txt | Positivo | Curitiba, PR |
| review-004.txt | Positivo | Belo Horizonte, MG |
| review-005.txt | Negativo | Fortaleza, CE |
| review-006.txt | Negativo | Porto Alegre, RS |
| review-007.txt | Negativo | Brasília, DF |
| review-008.txt | Neutro | Recife, PE |
| review-009.txt | Misto | Florianópolis, SC |
| review-010.txt | Misto | Manaus, AM |

## Como usar

1. Fazer upload de todos os arquivos desta pasta para o container
   `coffeereviews` no Storage Account `stdioaifmlcentralus01`.
2. Executar o Import data wizard no Azure AI Search apontando para esse container.
3. As reviews cobrem sentimentos variados, cidades distintas e
   entidades nomeadas — ideal para testar filtros e buscas no Search Explorer.
