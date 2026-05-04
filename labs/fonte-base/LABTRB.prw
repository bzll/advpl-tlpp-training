#Include "Protheus.ch"

User Function LABTRB()
    Local aErros := {}

    Private lMsErroAuto := .T.

    // TODO: substituir simulacao pelo retorno real do ExecAuto.
    AAdd(aErros, "Produto PROD001 nao encontrado.")
    AAdd(aErros, "TES nao informada.")

    LABLogErro("Payload recebido incompleto.")
    LABMostraErros(aErros)

Return Len(aErros) == 0

Static Function LABMostraErros(aErros)
    Local nI := 0

    For nI := 1 To Len(aErros)
        ConOut("Erro tecnico: " + cValToChar(aErros[nI]))
    Next

Return

Static Function LABLogErro(cMsg)
    ConOut(DToC(Date()) + " " + Time() + " - " + cMsg)
Return
