#Include "Protheus.ch"

User Function ZListCli(cUF)
    Local cAlias := "SA1"
    Local nCount := 0

    Default cUF := ""

    DbSelectArea(cAlias)
    (cAlias)->(DbSetOrder(1))
    (cAlias)->(DbGoTop())

    While !(cAlias)->(Eof())
        If (cAlias)->A1_FILIAL == xFilial(cAlias) .And. ;
            !(cAlias)->(Deleted()) .And. ;
            (Empty(cUF) .Or. AllTrim((cAlias)->A1_EST) == AllTrim(cUF))

            ConOut("Cliente: " + AllTrim((cAlias)->A1_COD) + " - " + AllTrim((cAlias)->A1_NOME))
            nCount++
        EndIf

        (cAlias)->(DbSkip())
    EndDo

    ConOut("Total listado: " + cValToChar(nCount))

Return nCount
