#Include "Protheus.ch"

User Function LABCLI(cCodCli, cLoja)
    Local aRet := {.F., ""}

    Default cCodCli := "000001"
    Default cLoja   := "01"

    DbSelectArea("SA1")
    SA1->(DbSetOrder(1))

    If Empty(cCodCli) .Or. Empty(cLoja)
        aRet := {.F., "Codigo e loja sao obrigatorios."}
    ElseIf !SA1->(DbSeek(xFilial("SA1") + cCodCli + cLoja)) .Or. SA1->(Deleted())
        aRet := {.F., "Cliente nao encontrado."}
    ElseIf Empty(SA1->A1_NOME)
        aRet := {.F., "Cliente sem nome preenchido."}
    ElseIf Empty(SA1->A1_CGC)
        aRet := {.F., "Cliente sem CNPJ/CPF preenchido."}
    Else
        aRet := {.T., "Cliente valido: " + AllTrim(SA1->A1_NOME)}
    EndIf

    ConOut(aRet[2])

Return aRet
