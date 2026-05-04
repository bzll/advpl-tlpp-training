#Include "Protheus.ch"

User Function ZUpdCli(cCodCli, cLoja, cObs)
    Local cAlias := "SA1"
    Local cChave := ""
    Local lOk    := .F.

    Default cCodCli := ""
    Default cLoja   := ""
    Default cObs    := ""

    If Empty(cCodCli) .Or. Empty(cLoja)
        MsgStop("Cliente e loja sao obrigatorios.")
        Return .F.
    EndIf

    cChave := xFilial(cAlias) + cCodCli + cLoja

    DbSelectArea(cAlias)
    (cAlias)->(DbSetOrder(1))

    If (cAlias)->(DbSeek(cChave))
        If RecLock(cAlias, .F.)
            (cAlias)->A1_XOBS := cObs
            MsUnlock()
            lOk := .T.
        Else
            MsgStop("Nao foi possivel bloquear o registro para alteracao.")
        EndIf
    Else
        MsgAlert("Cliente nao encontrado.")
    EndIf

Return lOk
