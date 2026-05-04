#Include "Protheus.ch"

User Function LABPROD(cProduto)
    Local aDiag := {}
    Local oJson := JsonObject():New()
    Local cJson := ""

    Default cProduto := "PROD001"

    DbSelectArea("SB1")
    SB1->(DbSetOrder(1))

    If Empty(cProduto)
        AAdd(aDiag, {"erro", "Produto nao informado."})
    ElseIf !SB1->(DbSeek(xFilial("SB1") + cProduto)) .Or. SB1->(Deleted())
        AAdd(aDiag, {"erro", "Produto nao encontrado."})
    Else
        If Empty(SB1->B1_DESC)
            AAdd(aDiag, {"erro", "Descricao nao preenchida."})
        EndIf

        If Empty(SB1->B1_UM)
            AAdd(aDiag, {"erro", "Unidade de medida nao preenchida."})
        EndIf

        If Empty(SB1->B1_TIPO)
            AAdd(aDiag, {"alerta", "Tipo do produto nao preenchido."})
        EndIf
    EndIf

    If Len(aDiag) == 0
        AAdd(aDiag, {"info", "Produto sem pendencias cadastrais."})
    EndIf

    oJson["produto"] := cProduto
    oJson["valido"]  := LABTemErro(aDiag) == .F.
    oJson["mensagens"] := LABDiagToText(aDiag)

    cJson := oJson:ToJson()
    ConOut(cJson)

Return cJson

Static Function LABTemErro(aDiag)
    Local nI := 0

    For nI := 1 To Len(aDiag)
        If aDiag[nI][1] == "erro"
            Return .T.
        EndIf
    Next

Return .F.

Static Function LABDiagToText(aDiag)
    Local cMsg := ""
    Local nI   := 0

    For nI := 1 To Len(aDiag)
        cMsg += IIf(Empty(cMsg), "", " | ")
        cMsg += aDiag[nI][1] + ": " + aDiag[nI][2]
    Next

Return cMsg
