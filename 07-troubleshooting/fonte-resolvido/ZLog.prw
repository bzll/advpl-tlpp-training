#Include "Protheus.ch"

User Function ZLog(cMsg, cContexto)
    Local cLinha := ""

    Default cMsg      := ""
    Default cContexto := "GERAL"

    cLinha := DToC(Date()) + " " + Time() + " - " + cContexto + " - " + cMsg
    ConOut(cLinha)

Return cLinha
