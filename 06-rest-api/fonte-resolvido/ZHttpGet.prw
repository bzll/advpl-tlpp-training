#Include "Protheus.ch"

User Function ZHttpGet(cToken)
    Local cUrl      := "https://api.exemplo.com"
    Local oRest     := FWRest():New(cUrl)
    Local cResponse := ""

    Default cToken := ""

    oRest:SetPath("/clientes/000001")

    If !Empty(cToken)
        oRest:SetHeader("Authorization", "Bearer " + cToken)
    EndIf

    oRest:SetHeader("Accept", "application/json")
    oRest:Get()

    If oRest:GetHTTPCode() == 200
        cResponse := oRest:GetResult()
        ConOut("Resposta: " + cResponse)
    Else
        ConOut("Erro HTTP: " + cValToChar(oRest:GetHTTPCode()))
        ConOut("Retorno: " + oRest:GetResult())
    EndIf

Return cResponse
