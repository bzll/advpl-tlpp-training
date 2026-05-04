#Include "Protheus.ch"

User Function ZTry()
    Local lOk := .T.

    Begin Sequence
        U_ZProcessa()
    Recover
        lOk := .F.
        ConOut("Erro na execucao da rotina ZProcessa")
    End Sequence

Return lOk

Static Function ZValidaPedido(cCliente, nTotal)
    If Empty(cCliente)
        Return {.F., "Cliente obrigatorio."}
    EndIf

    If nTotal <= 0
        Return {.F., "Total do pedido deve ser maior que zero."}
    EndIf

Return {.T., "OK"}
