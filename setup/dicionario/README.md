# Dicionario de Dados

Alguns exemplos usam tabelas customizadas para fins didaticos. Crie ou valide essas estruturas no SIGACFG antes de executar os fontes MVC e os labs relacionados.

## ZZ1 - Cadastro Exemplo MVC

Tabela usada em `03-mvc/fonte-base/ZMVC001.prw` e `labs/fonte-base/LABMVC.prw`.

Campos sugeridos:

| Campo | Tipo | Tamanho | Observacao |
| --- | --- | --- | --- |
| `ZZ1_FILIAL` | Character | Conforme filial | Filial da tabela |
| `ZZ1_COD` | Character | 6 | Codigo do registro |
| `ZZ1_NOME` | Character | 40 | Nome obrigatorio |
| `ZZ1_STATUS` | Character | 1 | Status didatico, exemplo `1` ativo e `2` encerrado |

Indice sugerido:

```text
ZZ1_FILIAL + ZZ1_COD
```

## ZZ2 / ZZ3 - Pedido Conceitual MVC

Estrutura citada no treinamento para explicar cabecalho e grid.

`ZZ2` representa o cabecalho:

| Campo | Tipo | Tamanho | Observacao |
| --- | --- | --- | --- |
| `ZZ2_FILIAL` | Character | Conforme filial | Filial da tabela |
| `ZZ2_COD` | Character | 6 | Codigo do pedido |
| `ZZ2_CLIENT` | Character | 6 | Cliente |
| `ZZ2_LOJA` | Character | 2 | Loja |
| `ZZ2_TOTAL` | Numeric | 14,2 | Total do pedido |

`ZZ3` representa os itens:

| Campo | Tipo | Tamanho | Observacao |
| --- | --- | --- | --- |
| `ZZ3_FILIAL` | Character | Conforme filial | Filial da tabela |
| `ZZ3_PEDIDO` | Character | 6 | Codigo do pedido pai |
| `ZZ3_ITEM` | Character | 4 | Item |
| `ZZ3_PRODUT` | Character | 15 | Produto |
| `ZZ3_QTD` | Numeric | 12,2 | Quantidade |
| `ZZ3_VUNIT` | Numeric | 14,2 | Valor unitario |

Indice sugerido para `ZZ3`:

```text
ZZ3_FILIAL + ZZ3_PEDIDO + ZZ3_ITEM
```

## Cuidados

- Ajuste tamanhos, pictures e validacoes conforme o padrao do ambiente.
- Valide se os campos existem no SX3 antes de compilar os exemplos.
- Em ambientes reais, documente tambem gatilhos, validacoes e inicializadores padrao.
