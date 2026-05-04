#Include "Protheus.ch"

User Function ZJsonCli()
    Local oJson := JsonObject():New()
    Local cJson := ""

    oJson["codigo"] := "000001"
    oJson["loja"]   := "01"
    oJson["nome"]   := "Cliente Teste"
    oJson["ativo"]  := .T.

    cJson := oJson:ToJson()

    ConOut(cJson)

Return

User Function ZReadJson()
    Local cPayload := '{"codigo":"000001","loja":"01"}'
    Local oJson    := JsonObject():New()

    oJson:FromJson(cPayload)

    ConOut("Codigo: " + oJson["codigo"])
    ConOut("Loja: " + oJson["loja"])

Return
