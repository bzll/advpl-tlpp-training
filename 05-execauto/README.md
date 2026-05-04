# 05 – ExecAuto

## Objetivo

Mostrar como automatizar rotinas no Protheus através do `ExecAuto` (ou `MsExecAuto`), abordando a criação de automações, parametrização, execução e tratamento de erros, visando reduzir esforços repetitivos e manter a integridade dos processos.

## Estrutura do diretório

- **fonte‑base/**: exemplos de chamadas `ExecAuto` para serem parametrizados.
- **fonte‑resolvido/**: automações completas com tratamento de retorno e logs.

## Checklist de validação

- [ ] Criar um `ExecAuto` para uma rotina padrão (ex.: `MATA103`) com parâmetros obrigatórios.
- [ ] Executar a automação e validar o retorno via `GetAutoGRLog`.
- [ ] Implementar tratamento de erros e logs de execução.
- [ ] Documentar os parâmetros utilizados e seus impactos.
