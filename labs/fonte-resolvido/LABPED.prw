#Include "Protheus.ch"

User Function LABPED(nPercDesc)
    Local aItens      := {}
    Local nI          := 0
    Local nTotal      := 0
    Local nDesc       := 0
    Local nLiq        := 0
    Local nMaiorValor := 0
    Local cMaiorProd  := ""

    Default nPercDesc := 10

    If nPercDesc > 20
        MsgStop("Desconto maior que 20% nao permitido.")
        Return .F.
    EndIf

    AAdd(aItens, {"PROD001", 10, 100.00})
    AAdd(aItens, {"PROD002",  5,  50.00})
    AAdd(aItens, {"PROD003",  2, 200.00})

    nTotal := LABTotalItens(aItens, @cMaiorProd, @nMaiorValor)
    nDesc  := nTotal * (nPercDesc / 100)
    nLiq   := nTotal - nDesc

    If nLiq <= 0
        MsgStop("Total liquido invalido.")
        Return .F.
    EndIf

    ConOut("Total bruto: " + cValToChar(nTotal))
    ConOut("Desconto: " + cValToChar(nDesc))
    ConOut("Total liquido: " + cValToChar(nLiq))
    ConOut("Maior item: " + cMaiorProd + " = " + cValToChar(nMaiorValor))

Return .T.

Static Function LABTotalItens(aItens, cMaiorProd, nMaiorValor)
    Local nI     := 0
    Local nTotal := 0
    Local nItem  := 0

    For nI := 1 To Len(aItens)
        nItem  := aItens[nI][2] * aItens[nI][3]
        nTotal += nItem

        If nItem > nMaiorValor
            nMaiorValor := nItem
            cMaiorProd  := aItens[nI][1]
        EndIf
    Next

Return nTotal
