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

Return cJson

User Function ZReadJson(cPayload)
    Local oJson := JsonObject():New()

    Default cPayload := '{"codigo":"000001","loja":"01"}'

    oJson:FromJson(cPayload)

    If oJson:HasProperty("codigo")
        ConOut("Codigo: " + oJson["codigo"])
    EndIf

    If oJson:HasProperty("loja")
        ConOut("Loja: " + oJson["loja"])
    EndIf

Return oJson
