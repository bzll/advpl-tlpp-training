#Include "Protheus.ch"

User Function LABCLI(cCodCli, cLoja)
    Local lRet := .F.

    Default cCodCli := "000001"
    Default cLoja   := "01"

    DbSelectArea("SA1")
    SA1->(DbSetOrder(1))

    If SA1->(DbSeek(xFilial("SA1") + cCodCli + cLoja))
        If !Empty(SA1->A1_NOME)
            ConOut("Cliente valido: " + AllTrim(SA1->A1_NOME))
            lRet := .T.
        Else
            ConOut("Cliente sem nome preenchido.")
        EndIf
    Else
        ConOut("Cliente nao encontrado.")
    EndIf

    // TODO: validar CNPJ/CPF e retornar mensagem junto com o status.

Return lRet
