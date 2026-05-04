#Include "Protheus.ch"

User Function ZPEValid()
    Local lRet := .T.
    Local cMsg := ""

    If Empty(M->C5_CLIENTE)
        cMsg := "Cliente obrigatorio para continuar."
        MsgStop(cMsg)
        lRet := .F.
    EndIf

    // TODO: incluir log/rastreabilidade quando a regra bloquear o processo.

Return lRet
