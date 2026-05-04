#Include "Protheus.ch"

User Function ZPEValid()
    Local lRet := .T.
    Local cMsg := ""

    If Empty(M->C5_CLIENTE)
        cMsg := "Cliente obrigatorio para continuar."
        ZLogPE(cMsg)
        MsgStop(cMsg)
        lRet := .F.
    EndIf

Return lRet

Static Function ZLogPE(cMsg)
    Default cMsg := ""

    ConOut(DToC(Date()) + " " + Time() + " - PE ZPEValid - " + cMsg)

Return
