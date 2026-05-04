#Include "Protheus.ch"

User Function LABPROD(cProduto)
    Local aErros := {}

    Default cProduto := "PROD001"

    DbSelectArea("SB1")
    SB1->(DbSetOrder(1))

    If !SB1->(DbSeek(xFilial("SB1") + cProduto))
        AAdd(aErros, "Produto nao encontrado.")
    Else
        If Empty(SB1->B1_DESC)
            AAdd(aErros, "Descricao nao preenchida.")
        EndIf

        If Empty(SB1->B1_UM)
            AAdd(aErros, "Unidade de medida nao preenchida.")
        EndIf

        If Empty(SB1->B1_TIPO)
            AAdd(aErros, "Tipo do produto nao preenchido.")
        EndIf
    EndIf

    If Len(aErros) > 0
        AEval(aErros, {|cErro| ConOut(cErro)})
    Else
        ConOut("Produto sem pendencias cadastrais.")
    EndIf

    // TODO: transformar retorno em JSON com severidade.

Return Len(aErros) == 0
