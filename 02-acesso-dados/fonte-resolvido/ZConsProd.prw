#Include "Protheus.ch"

User Function ZConsProd(cProduto)
    Local cAlias := "SB1"
    Local cChave := ""

    Default cProduto := ""

    If Empty(cProduto)
        MsgStop("Informe o codigo do produto.")
        Return .F.
    EndIf

    cChave := xFilial(cAlias) + cProduto

    DbSelectArea(cAlias)
    (cAlias)->(DbSetOrder(1))

    If (cAlias)->(DbSeek(cChave)) .And. !(cAlias)->(Deleted())
        MsgInfo("Produto: " + AllTrim((cAlias)->B1_DESC))
        Return .T.
    EndIf

    MsgAlert("Produto nao encontrado.")

Return .F.
