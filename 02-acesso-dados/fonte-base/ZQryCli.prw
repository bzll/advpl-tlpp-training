#Include "Protheus.ch"

User Function ZQryCli()
    Local cQuery := ""
    Local cAlias := GetNextAlias()

    cQuery := " SELECT A1_COD, A1_LOJA, A1_NOME "
    cQuery += " FROM " + RetSQLName("SA1")
    cQuery += " WHERE D_E_L_E_T_ = ' ' "
    cQuery += " AND A1_FILIAL = '" + xFilial("SA1") + "' "

    TCQuery cQuery New Alias (cAlias)

    While !(cAlias)->(Eof())
        ConOut(AllTrim((cAlias)->A1_COD) + " - " + AllTrim((cAlias)->A1_NOME))
        (cAlias)->(DbSkip())
    EndDo

    (cAlias)->(DbCloseArea())

Return
