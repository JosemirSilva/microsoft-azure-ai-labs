# Prompt: Geração de código — script Python para leitura de CSV

## Ferramenta

Microsoft Copilot ([copilot.microsoft.com](https://copilot.microsoft.com))

## Prompt utilizado

```
Escreva um script Python completo que:
1. Leia um arquivo CSV chamado "dados.csv"
2. Exiba as 5 primeiras linhas formatadas como tabela no terminal
3. Mostre o total de linhas e colunas do arquivo
4. Calcule e exiba a média de todas as colunas numéricas
5. Salve um relatório resumido em um arquivo "relatorio.txt"

Use apenas bibliotecas nativas do Python ou pandas.
Adicione comentários explicando cada etapa do código.
```

## Resultado obtido

Código gerado pelo Copilot (revisar e testar localmente antes de usar em produção):

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Script: analise_csv.py

O que este script faz:
1) Lê um arquivo CSV chamado "dados.csv"
2) Exibe as 5 primeiras linhas formatadas como tabela no terminal
3) Mostra o total de linhas e colunas do arquivo
4) Calcula e exibe a média de todas as colunas numéricas
5) Salva um relatório resumido em "relatorio.txt"

Requisitos:
- Python 3
- pandas (permitido pelo enunciado)
"""

import sys
from pathlib import Path

import pandas as pd


def main() -> int:
    # Define o caminho do arquivo CSV de entrada
    csv_path = Path("dados.csv")

    # Verifica se o arquivo existe antes de tentar ler
    if not csv_path.exists():
        print('Erro: arquivo "dados.csv" não encontrado no diretório atual.')
        return 1

    try:
        # Lê o CSV usando pandas (por padrão, separador é vírgula)
        df = pd.read_csv(csv_path)
    except Exception as e:
        # Captura erros comuns (arquivo corrompido, encoding, separador errado, etc.)
        print(f'Erro ao ler "dados.csv": {e}')
        return 1

    # 2) Exibe as 5 primeiras linhas como "tabela" no terminal
    # to_string() imprime em formato tabular alinhado (bom para terminal)
    print("\n=== 5 primeiras linhas ===")
    if df.empty:
        print("(Arquivo vazio: não há linhas para exibir.)")
    else:
        print(df.head(5).to_string(index=False))

    # 3) Mostra o total de linhas e colunas
    linhas, colunas = df.shape
    print("\n=== Dimensões do arquivo ===")
    print(f"Total de linhas: {linhas}")
    print(f"Total de colunas: {colunas}")

    # 4) Calcula a média de todas as colunas numéricas
    # select_dtypes inclui apenas colunas numéricas (int, float, etc.)
    df_numerico = df.select_dtypes(include="number")

    print("\n=== Médias das colunas numéricas ===")
    if df_numerico.shape[1] == 0:
        print("(Nenhuma coluna numérica encontrada.)")
        medias = pd.Series(dtype="float64")
    else:
        # mean() calcula a média por coluna; numeric_only é redundante aqui, mas seguro
        medias = df_numerico.mean(numeric_only=True)
        for nome_coluna, media in medias.items():
            print(f"{nome_coluna}: {media}")

    # 5) Salva um relatório resumido em "relatorio.txt"
    relatorio_path = Path("relatorio.txt")

    # Monta o texto do relatório com as informações principais
    relatorio_linhas = []
    relatorio_linhas.append("RELATÓRIO RESUMIDO - dados.csv")
    relatorio_linhas.append("")
    relatorio_linhas.append(f"Total de linhas: {linhas}")
    relatorio_linhas.append(f"Total de colunas: {colunas}")
    relatorio_linhas.append("")
    relatorio_linhas.append("Médias das colunas numéricas:")

    if medias.empty:
        relatorio_linhas.append("  (Nenhuma coluna numérica encontrada.)")
    else:
        for nome_coluna, media in medias.items():
            relatorio_linhas.append(f"  - {nome_coluna}: {media}")

    relatorio_linhas.append("")
    relatorio_linhas.append("Amostra (5 primeiras linhas):")
    if df.empty:
        relatorio_linhas.append("  (Arquivo vazio.)")
    else:
        # Inclui a amostra no relatório também, mantendo formato tabular
        relatorio_linhas.append(df.head(5).to_string(index=False))

    try:
        # Escreve o relatório no arquivo de saída
        relatorio_path.write_text("\n".join(relatorio_linhas), encoding="utf-8")
        print(f'\nRelatório salvo com sucesso em "{relatorio_path}".')
    except Exception as e:
        print(f'Erro ao salvar "{relatorio_path}": {e}')
        return 1

    return 0


if __name__ == "__main__":
    # Executa o script e retorna um código de saída apropriado
    raise SystemExit(main())
```

_Evidência (captura de tela):_ [`copilot-code-generation.png`](../output/copilot-code-generation.png).

## Observações

**Resultado esperado (critérios):** script com `pandas` e/ou `csv`; leitura com tratamento de erro; primeiras linhas formatadas; estatísticas básicas; exportação do relatório; comentários em português.

**O que observar**

- Execução “de primeira” depende do arquivo `dados.csv` no diretório atual e de `pip install pandas`.  
- Qualidade dos comentários e da *docstring*.  
- Tratamento de erros (arquivo ausente, CSV inválido, sem colunas numéricas).  
- Possibilidade de refinar com *follow-up* no Copilot.  
- Comparar pedidos em **PT-BR** *vs.* inglês, se testar ambos.

**Nota:** `import sys` pode ficar por gerar sem uso — removível após revisão; validar sempre com `dados.csv` real e `pip install pandas`.
