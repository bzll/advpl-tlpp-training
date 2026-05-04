#Include "Protheus.ch"

User Function ZInfoCampo(cTabela, cCampo)
    Local cAlias := "SX3"
    Local cChave := ""
    Local lFound := .F.

    Default cTabela := ""
    Default cCampo  := ""

    cTabela := Upper(AllTrim(cTabela))
    cCampo  := Upper(AllTrim(cCampo))

    If Empty(cTabela) .Or. Empty(cCampo)
        MsgStop("Informe tabela e campo.")
        Return .F.
    EndIf

    cChave := PadR(cTabela, 3) + PadR(cCampo, 10)

    DbSelectArea(cAlias)
    (cAlias)->(DbSetOrder(1))

    lFound := (cAlias)->(DbSeek(cChave)) .And. !(cAlias)->(Deleted())

    If lFound
        ConOut("Campo: " + AllTrim((cAlias)->X3_CAMPO))
        ConOut("Titulo: " + AllTrim((cAlias)->X3_TITULO))
        ConOut("Tipo: " + AllTrim((cAlias)->X3_TIPO))
        ConOut("Tamanho: " + cValToChar((cAlias)->X3_TAMANHO))
        ConOut("Decimal: " + cValToChar((cAlias)->X3_DECIMAL))
        ConOut("Picture: " + AllTrim((cAlias)->X3_PICTURE))
        ConOut("Validacao: " + AllTrim((cAlias)->X3_VALID))
    Else
        ConOut("Campo nao encontrado no SX3.")
    EndIf

Return lFound
