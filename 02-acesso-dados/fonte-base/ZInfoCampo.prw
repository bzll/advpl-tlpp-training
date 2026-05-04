#Include "Protheus.ch"

User Function ZInfoCampo(cTabela, cCampo)
    Local cAlias := "SX3"
    Local cChave := ""

    Default cTabela := ""
    Default cCampo  := ""

    If Empty(cTabela) .Or. Empty(cCampo)
        MsgStop("Informe tabela e campo.")
        Return
    EndIf

    cChave := PadR(cTabela, 3) + PadR(cCampo, 10)

    DbSelectArea(cAlias)
    (cAlias)->(DbSetOrder(1))

    If (cAlias)->(DbSeek(cChave))
        ConOut("Campo: " + AllTrim((cAlias)->X3_CAMPO))
        ConOut("Titulo: " + AllTrim((cAlias)->X3_TITULO))
        ConOut("Tipo: " + AllTrim((cAlias)->X3_TIPO))
        ConOut("Picture: " + AllTrim((cAlias)->X3_PICTURE))
    Else
        ConOut("Campo nao encontrado no SX3.")
    EndIf

Return
