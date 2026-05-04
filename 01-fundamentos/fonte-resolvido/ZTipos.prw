#Include "Protheus.ch"

User Function ZTipos()
    Local cNome    := "Produto Teste"
    Local nPreco   := 125.50
    Local dEmissao := Date()
    Local lAtivo   := .T.
    Local aItens   := {}
    Local nI       := 0
    Local nTotal   := 0

    AAdd(aItens, {"PROD001", 2, 100.00})
    AAdd(aItens, {"PROD002", 1, 25.50})

    For nI := 1 To Len(aItens)
        nTotal += aItens[nI][2] * aItens[nI][3]
    Next

    ConOut("Nome: " + cNome)
    ConOut("Preco: " + cValToChar(nPreco))
    ConOut("Data: " + DToC(dEmissao))
    ConOut("Ativo: " + IIf(lAtivo, "Sim", "Nao"))
    ConOut("Qtd. Itens: " + cValToChar(Len(aItens)))
    ConOut("Total dos itens: " + cValToChar(nTotal))

Return
