#Include "Protheus.ch"

User Function LABPED()
    Local aItens := {}
    Local nI     := 0
    Local nTotal := 0
    Local nDesc  := 0
    Local nLiq   := 0

    AAdd(aItens, {"PROD001", 10, 100.00})
    AAdd(aItens, {"PROD002",  5,  50.00})
    AAdd(aItens, {"PROD003",  2, 200.00})

    For nI := 1 To Len(aItens)
        nTotal += aItens[nI][2] * aItens[nI][3]
    Next

    nDesc := nTotal * 0.10
    nLiq  := nTotal - nDesc

    If nLiq <= 0
        MsgStop("Total liquido invalido.")
        Return .F.
    EndIf

    ConOut("Total bruto: " + cValToChar(nTotal))
    ConOut("Desconto: " + cValToChar(nDesc))
    ConOut("Total liquido: " + cValToChar(nLiq))

    // TODO: impedir desconto maior que 20% e identificar item de maior valor.

Return .T.
