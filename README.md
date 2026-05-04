# Treinamento Técnico ADVPL / TLPP

Este repositório contém materiais para o treinamento de Protheus/ADVPL/TLPP voltado para times de TI (suporte, desenvolvimento, troubleshooting). A ementa, inspirada por materiais do Terminal de Informação (TDN) e da TOTVS, abrange diversos temas e práticas comuns no universo Protheus.

## Conteúdo abordado

- **Fundamentos do Protheus**: arquitetura (AppServer, DBAccess e SmartClient), estrutura de ambientes (SIGACFG, SIGAADV, etc.), conceito de RPO e dicionário de dados (SXs), tabelas padrão (por exemplo, SC5, SC6, SA1, SB1).
- **Fundamentos de ADVPL**: sintaxe básica, tipos de dados, estruturas de controle (IF, DO CASE, WHILE, FOR), funções e procedures, manipulação de arrays e strings.
- **Acesso a dados**: workareas, aliases e ordens, comandos como `DbSelectArea`, `DbSeek` e `DbSkip`, uso de índices e boas práticas de performance em acesso a dados.
- **Dicionário de dados (SX3, SX2, etc.)**: estrutura do dicionário, campos, validações, triggers e o impacto no comportamento do sistema.
- **Pontos de entrada (customizações)**: conceito, tipos (Before, After, Validação), identificação e uso, exemplos reais em módulos como MATA103 (pedidos de venda).
- **TLPP / Programação orientada a objetos**: classes, métodos e propriedades, namespaces, diferenças entre ADVPL e TLPP, organização de código e boas práticas.
- **ExecAuto e automação de rotinas**: conceito de MsExecAuto, estrutura de chamadas automáticas, tratamento de erros e casos de uso (ex.: entrada de nota fiscal com MATA103).
- **Integrações (REST / APIs)**: criação de APIs no Protheus, consumo de APIs externas, autenticação (token, OAuth), serialização JSON e integrações reais (ex.: ServiceNow, bancos).
- **Tratamento de erros e logs**: uso de `TRY/CATCH`, funções de log no Protheus, estratégia de debug (console, logs, análises) e troubleshooting.
- **Performance e boas práticas**: otimização de queries, evitar loops desnecessários, uso de índices e boas práticas de escrita de código.
- **Debug e troubleshooting**: leitura de logs do AppServer, identificação de erros comuns, debug de rotinas críticas, análise de problemas em produção, estratégias de rollback e correção.
- **MVC, TReport e frameworks internos**: criação de rotinas MVC (modelos 1/3/X), componentes como `FWForm`, `FWMBrowse`, validação e grid; uso de `TReport`, `TRSection`, `TRCell` e `TRFunction` para gerar relatórios formatados.
- **Glossário de funções e classes mais usadas**: `AllTrim`, `DbSeek`, `DbSelectArea`, `RecLock`, `MsUnlock`, `xFilial`, `RetSQLName`, `FWGetArea`, `MsExecAuto`, `JsonObject`, etc.
- **Laboratórios e exercícios**: atividades hands‑on para consolidar o aprendizado, incluindo construção de rotinas, uso de MVC, criação de relatórios, chamadas REST e técnicas de debug.

## Estrutura do repositório

No estado inicial, este repositório contém apenas este arquivo `README.md`. Os materiais (códigos de exemplo, slides, labs) podem ser adicionados em diretórios apropriados, por exemplo:

- `src/` – códigos fonte de exemplos em ADVPL/TLPP.
- `labs/` – roteiros de exercícios práticos.
- `docs/` – material de apoio, slides e documentação complementar.

## Como subir para o GitHub

Para criar um repositório no GitHub com este conteúdo, siga estes passos na sua máquina local:

1. Clone o repositório vazio no GitHub (ou crie um novo repositório chamado `advpl-tlpp-training`).
2. Adicione este conteúdo ao repositório local:

   ```bash
   git clone https://github.com/seu_usuario/advpl-tlpp-training.git
   cd advpl-tlpp-training
   # copie os arquivos deste diretório para o repositório clonado
   cp -r /caminho/do/repositorio_local/* .
   git add .
   git commit -m "Initial commit"
   git push origin main
   ```

3. Caso já exista um repositório com o mesmo nome, basta substituir a URL do `git clone` acima.

Os usuários podem contribuir, sugerir melhorias e compartilhar os exercícios e práticas propostos.
