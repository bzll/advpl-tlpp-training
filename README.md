# Treinamento Tecnico ADVPL / TLPP

Este repositorio contem materiais para um treinamento tecnico de Protheus, ADVPL e TLPP voltado para times de TI, suporte, desenvolvimento, integracoes e sustentacao.

O objetivo e servir como roteiro pratico para leitura de codigo, manutencao de rotinas, criacao de pequenos fontes customizados, diagnostico de problemas e entendimento de recursos comuns do ecossistema Protheus.

## Conteudo abordado

- **Fundamentos do Protheus**: AppServer, DBAccess, SmartClient, RPO, dicionario de dados e tabelas padrao.
- **ADVPL basico e intermediario**: tipos de dados, funcoes, arrays, strings, validacoes e rotinas `User Function`.
- **Acesso a dados**: workareas, aliases, ordens, `DbSelectArea`, `DbSeek`, `DbSkip`, `RecLock`, `MsUnlock` e `TCQuery`.
- **Dicionario de dados**: SX2, SX3, SX5, SIX, campos, indices, validacoes e impacto no comportamento das rotinas.
- **Pontos de entrada**: customizacoes em rotinas padrao, boas praticas e cuidados de suporte.
- **TLPP e orientacao a objetos**: classes, metodos, namespaces, tipagem e organizacao por servicos.
- **MVC no Protheus**: `FWMBrowse`, `ModelDef`, `ViewDef`, `MenuDef`, validacoes e cadastro simples.
- **TReport**: `TReport`, `TRSection`, `TRCell`, totalizadores e relatorios de diagnostico.
- **ExecAuto**: montagem de arrays, `MsExecAuto`, transacao, `lMsErroAuto`, `GetAutoGRLog` e logs.
- **REST/API**: criacao de endpoints, consumo de APIs externas, JSON, status HTTP e seguranca.
- **Troubleshooting**: leitura de logs, tratamento de erros, performance, investigacao e documentacao de incidentes.
- **Laboratorios**: exercicios hands-on para consolidar os temas do treinamento.

## Estrutura do repositorio

```text
.
|-- 01-fundamentos/
|   |-- fonte-base/
|   `-- fonte-resolvido/
|-- 02-acesso-dados/
|   |-- fonte-base/
|   `-- fonte-resolvido/
|-- 03-mvc/
|   |-- fonte-base/
|   `-- fonte-resolvido/
|-- 04-treport/
|   |-- fonte-base/
|   `-- fonte-resolvido/
|-- 05-execauto/
|   |-- fonte-base/
|   `-- fonte-resolvido/
|-- 06-rest-api/
|   |-- fonte-base/
|   |-- fonte-resolvido/
|   `-- requests/
|-- 07-troubleshooting/
|   |-- fonte-base/
|   `-- fonte-resolvido/
|-- docs/
|-- labs/
|   |-- fonte-base/
|   `-- fonte-resolvido/
|-- setup/
|   `-- dicionario/
`-- treinamento_advpl_tlpp_slides_e_laboratorio.md
```

## Como usar

1. Comece pelo arquivo `treinamento_advpl_tlpp_slides_e_laboratorio.md`, que contem o roteiro completo com slides, exemplos e laboratorios.
2. Em cada modulo, use os arquivos de `fonte-base/` como ponto de partida para demonstracoes ou exercicios.
3. Desenvolva a solucao no ambiente Protheus/VS Code conforme a orientacao do treinamento.
4. Use `fonte-resolvido/` para guardar as solucoes finais ou exemplos completos.
5. Use `labs/fonte-base/` para os exercicios integrados e revisoes praticas.

## Modulos

| Modulo | Tema | Fontes base |
| --- | --- | --- |
| `01-fundamentos` | Sintaxe, variaveis, pontos de entrada e TLPP inicial | `ZTipos`, `ZValCli`, `ZPEValid`, `PedidoValidator` |
| `02-acesso-dados` | SA1, SB1, SX3, locks e queries | `ZConsProd`, `ZListCli`, `ZUpdCli`, `ZInfoCampo`, `ZQryCli` |
| `03-mvc` | Cadastro MVC simples | `ZMVC001` |
| `04-treport` | Relatorio de clientes | `ZTRCLI` |
| `05-execauto` | ExecAuto com tratamento de erro | `ZExecNF` |
| `06-rest-api` | Endpoint, consumo HTTP e JSON | `ZCliente`, `ZHttpGet`, `ZJsonCli` |
| `07-troubleshooting` | Logs, erros e performance | `ZLog`, `ZTry`, `ZPerfLoop` |
| `labs` | Exercicios praticos integrados | `LABCLI`, `LABPROD`, `LABPED`, `LABMVC`, `LABTRCLI`, `LABREST`, `LABTRB`, `LABPedidoService` |

## Convencoes

- Arquivos `.prw` contem fontes ADVPL.
- Arquivos `.tlpp` contem fontes TLPP.
- `fonte-base/` deve conter esqueletos, exemplos didaticos e pontos `TODO`.
- `fonte-resolvido/` deve conter versoes completas para comparacao apos o exercicio.
- `setup/dicionario/` deve documentar tabelas, campos e indices customizados necessarios.
- `06-rest-api/requests/` deve guardar exemplos de chamadas HTTP para teste dos endpoints.

## Pre-requisitos sugeridos

- Ambiente Protheus com AppServer, DBAccess e SmartClient configurados.
- VS Code com extensao ADVPL/TLPP configurada para o ambiente.
- Acesso ao SIGACFG/SIGAADV para validacao de dicionario, compilacao e testes.
- Massa minima de dados nas tabelas SA1, SB1, SC5, SC6 e tabelas customizadas usadas nos labs.

## Tabelas customizadas dos exemplos

Alguns exemplos usam tabelas customizadas didaticas:

- `ZZ1`: cadastro simples MVC.
- `ZZ2`: cabecalho conceitual de pedido customizado.
- `ZZ3`: itens conceituais de pedido customizado.

Consulte `setup/dicionario/README.md` antes de executar os exemplos MVC com tabelas customizadas.

## Observacoes

Os fontes deste repositorio sao materiais de treinamento. Antes de usar qualquer rotina em ambiente real, revise regras de negocio, indices, campos obrigatorios, permissoes, logs, tratamento de erro e impacto em performance.
