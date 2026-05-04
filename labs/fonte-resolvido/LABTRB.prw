#Include "Protheus.ch"

User Function LABTRB()
    Local aErros := {}
    Local cMsg   := ""

    Private lMsErroAuto := .T.

    aErros := LABCapturaAuto()

    If Len(aErros) > 0
        LABLogErro("Falha no ExecAuto. Total de erros: " + cValToChar(Len(aErros)))
        LABMostraErros(aErros)
        cMsg := "Nao foi possivel concluir a inclusao. Verifique produto, fornecedor, TES e campos obrigatorios."
        MsgAlert(cMsg)
        Return .F.
    EndIf

    LABLogErro("ExecAuto sem pendencias.")

Return .T.

Static Function LABCapturaAuto()
    Local aErros := {}
    Local aLog   := GetAutoGRLog()
    Local nI     := 0

    If Len(aLog) > 0
        For nI := 1 To Len(aLog)
            AAdd(aErros, cValToChar(aLog[nI]))
        Next
    ElseIf lMsErroAuto
        AAdd(aErros, "ExecAuto retornou erro, mas GetAutoGRLog esta vazio.")
    EndIf

Return aErros

Static Function LABMostraErros(aErros)
    Local nI := 0

    For nI := 1 To Len(aErros)
        LABLogErro("Erro tecnico: " + cValToChar(aErros[nI]))
    Next

Return

Static Function LABLogErro(cMsg)
    ConOut(DToC(Date()) + " " + Time() + " - LABTRB - " + cMsg)
Return
