#Include "Protheus.ch"

User Function ZConsProd(cProduto)
    Local cAlias := "SB1"
    Local cChave := ""

    Default cProduto := ""

    If Empty(cProduto)
        MsgStop("Informe o codigo do produto.")
        Return
    EndIf

    cChave := xFilial(cAlias) + cProduto

    DbSelectArea(cAlias)
    (cAlias)->(DbSetOrder(1))

    If (cAlias)->(DbSeek(cChave))
        MsgInfo("Produto: " + AllTrim((cAlias)->B1_DESC))
    Else
        MsgAlert("Produto nao encontrado.")
    EndIf

Return
