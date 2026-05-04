#Include "Protheus.ch"

User Function ZPerfLoop()
    Local aItens := {}
    Local nI     := 0
    Local nFound := 0

    AAdd(aItens, {"PROD001"})
    AAdd(aItens, {"PROD002"})
    AAdd(aItens, {"PROD003"})

    DbSelectArea("SB1")
    SB1->(DbSetOrder(1))

    For nI := 1 To Len(aItens)
        If SB1->(DbSeek(xFilial("SB1") + aItens[nI][1])) .And. !SB1->(Deleted())
            ConOut("Produto localizado: " + AllTrim(SB1->B1_DESC))
            nFound++
        Else
            ConOut("Produto nao localizado: " + aItens[nI][1])
        EndIf
    Next

    ConOut("Produtos localizados: " + cValToChar(nFound))

Return nFound
