#Include "Protheus.ch"

User Function ZValCli(cCodCli, cLoja)
    Local lRet   := .F.
    Local cAlias := "SA1"
    Local cChave := ""

    Default cCodCli := ""
    Default cLoja   := ""

    If Empty(cCodCli) .Or. Empty(cLoja)
        ConOut("Cliente ou loja nao informado.")
        Return .F.
    EndIf

    cChave := xFilial(cAlias) + cCodCli + cLoja

    DbSelectArea(cAlias)
    (cAlias)->(DbSetOrder(1))

    If (cAlias)->(DbSeek(cChave))
        lRet := !Empty((cAlias)->A1_NOME)
        ConOut("Cliente encontrado: " + AllTrim((cAlias)->A1_NOME))
    Else
        ConOut("Cliente nao encontrado: " + cCodCli + " / " + cLoja)
    EndIf

Return lRet
