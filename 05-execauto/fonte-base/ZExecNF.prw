#Include "Protheus.ch"

User Function ZExecNF()
    Local aCab   := {}
    Local aItens := {}
    Local lOk    := .T.

    Private lMsErroAuto   := .F.
    Private lMsHelpAuto   := .T.
    Private lAutoErrNoFile := .T.

    AAdd(aCab, {"F1_TIPO"   , "N"      , Nil})
    AAdd(aCab, {"F1_FORMUL" , "S"      , Nil})
    AAdd(aCab, {"F1_DOC"    , "000001" , Nil})
    AAdd(aCab, {"F1_SERIE"  , "1"      , Nil})
    AAdd(aCab, {"F1_FORNECE", "000001" , Nil})
    AAdd(aCab, {"F1_LOJA"   , "01"     , Nil})

    AAdd(aItens, {})
    AAdd(aItens[1], {"D1_ITEM" , "0001"   , Nil})
    AAdd(aItens[1], {"D1_COD"  , "PROD001", Nil})
    AAdd(aItens[1], {"D1_QUANT", 10       , Nil})
    AAdd(aItens[1], {"D1_VUNIT", 100      , Nil})

    Begin Transaction
        MsExecAuto({|x, y| MATA103(x, y)}, aCab, aItens)

        If lMsErroAuto
            lOk := .F.
            DisarmTransaction()
            ZMostraErroAuto()
        EndIf
    End Transaction

Return lOk

Static Function ZMostraErroAuto()
    Local aErro := GetAutoGRLog()
    Local nI    := 0

    For nI := 1 To Len(aErro)
        ConOut("Erro ExecAuto: " + cValToChar(aErro[nI]))
    Next

Return
