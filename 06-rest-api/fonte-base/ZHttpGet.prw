#Include "Protheus.ch"

User Function ZHttpGet()
    Local cUrl      := "https://api.exemplo.com/clientes/000001"
    Local oRest     := FWRest():New(cUrl)
    Local cResponse := ""

    oRest:SetPath("")
    oRest:Get()

    If oRest:GetHTTPCode() == 200
        cResponse := oRest:GetResult()
        ConOut("Resposta: " + cResponse)
    Else
        ConOut("Erro HTTP: " + cValToChar(oRest:GetHTTPCode()))
        ConOut("Retorno: " + oRest:GetResult())
    EndIf

    // TODO: incluir timeout, autenticacao e log de request/response.

Return
