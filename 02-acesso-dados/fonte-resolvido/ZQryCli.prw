#Include "Protheus.ch"

User Function ZQryCli(cUF)
    Local cQuery := ""
    Local cAlias := GetNextAlias()
    Local nCount := 0

    Default cUF := ""

    cQuery := " SELECT A1_COD, A1_LOJA, A1_NOME, A1_EST "
    cQuery += " FROM " + RetSQLName("SA1")
    cQuery += " WHERE D_E_L_E_T_ = ' ' "
    cQuery += " AND A1_FILIAL = '" + xFilial("SA1") + "' "

    If !Empty(cUF)
        cQuery += " AND A1_EST = '" + StrTran(Upper(AllTrim(cUF)), "'", "") + "' "
    EndIf

    TCQuery cQuery New Alias (cAlias)

    While !(cAlias)->(Eof())
        ConOut(AllTrim((cAlias)->A1_COD) + "/" + AllTrim((cAlias)->A1_LOJA) + " - " + AllTrim((cAlias)->A1_NOME))
        nCount++
        (cAlias)->(DbSkip())
    EndDo

    (cAlias)->(DbCloseArea())

Return nCount
