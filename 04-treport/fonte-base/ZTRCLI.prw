#Include "Protheus.ch"
#Include "RPTDef.ch"

User Function ZTRCLI()
    Local oReport := ReportDef()

    oReport:PrintDialog()

Return

Static Function ReportDef()
    Local oReport  := Nil
    Local oSection := Nil

    oReport := TReport():New("ZTRCLI", "Relatorio de Clientes", Nil, {|oReport| PrintReport(oReport)})
    oReport:SetLandscape()

    oSection := TRSection():New(oReport, "Clientes", {"SA1"})

    TRCell():New(oSection, "A1_COD" , "SA1", "Codigo" , PesqPict("SA1", "A1_COD") , TamSX3("A1_COD")[1])
    TRCell():New(oSection, "A1_LOJA", "SA1", "Loja"   , PesqPict("SA1", "A1_LOJA"), TamSX3("A1_LOJA")[1])
    TRCell():New(oSection, "A1_NOME", "SA1", "Nome"   , PesqPict("SA1", "A1_NOME"), 40)
    TRCell():New(oSection, "A1_MUN" , "SA1", "Cidade" , PesqPict("SA1", "A1_MUN") , 30)
    TRCell():New(oSection, "A1_EST" , "SA1", "UF"     , PesqPict("SA1", "A1_EST") , 2)

    // TODO: adicionar totalizador de quantidade de clientes.

Return oReport

Static Function PrintReport(oReport)
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

Return
