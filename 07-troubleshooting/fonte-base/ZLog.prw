#Include "Protheus.ch"

User Function ZLog(cMsg)
    Local cLinha := ""

    Default cMsg := ""

    cLinha := DToC(Date()) + " " + Time() + " - " + cMsg
    ConOut(cLinha)

Return
