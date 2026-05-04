#Include "Protheus.ch"
#Include "RPTDef.ch"

User Function LABTRCLI()
    Local oReport := LABReportDef()

    oReport:PrintDialog()

Return

Static Function LABReportDef()
    Local oReport  := Nil
    Local oSection := Nil

    oReport := TReport():New("LABTRCLI", "Diagnostico de Clientes", Nil, {|oReport| LABPrint(oReport)})
    oReport:SetLandscape()

    oSection := TRSection():New(oReport, "Clientes", {"SA1"})

    TRCell():New(oSection, "A1_COD" , "SA1", "Codigo"   , PesqPict("SA1", "A1_COD") , 10)
    TRCell():New(oSection, "A1_LOJA", "SA1", "Loja"     , PesqPict("SA1", "A1_LOJA"), 4)
    TRCell():New(oSection, "A1_NOME", "SA1", "Nome"     , PesqPict("SA1", "A1_NOME"), 40)
    TRCell():New(oSection, "A1_MUN" , "SA1", "Municipio", PesqPict("SA1", "A1_MUN") , 30)
    TRCell():New(oSection, "A1_EST" , "SA1", "UF"       , PesqPict("SA1", "A1_EST") , 2)

Return oReport

Static Function LABPrint(oReport)
    Local oSection := oReport:Section(1)

    DbSelectArea("SA1")
    SA1->(DbSetOrder(1))
    SA1->(DbGoTop())

    While !SA1->(Eof())
        If !SA1->(Deleted())
            oSection:Init()
            oSection:Cell("A1_COD"):SetValue(SA1->A1_COD)
            oSection:Cell("A1_LOJA"):SetValue(SA1->A1_LOJA)
            oSection:Cell("A1_NOME"):SetValue(SA1->A1_NOME)
            oSection:Cell("A1_MUN"):SetValue(SA1->A1_MUN)
            oSection:Cell("A1_EST"):SetValue(SA1->A1_EST)
            oSection:PrintLine()
            oSection:Finish()
        EndIf

        SA1->(DbSkip())
    EndDo

    // TODO: adicionar totalizador e filtro por UF.

Return
