#Include "Protheus.ch"
#Include "FWMVCDef.ch"

Static cTitulo := "Lab MVC ZZ1"

User Function LABMVC()
    Local oBrowse := FWMBrowse():New()

    oBrowse:SetAlias("ZZ1")
    oBrowse:SetDescription(cTitulo)
    oBrowse:Activate()

Return

Static Function MenuDef()
    Local aRotina := {}

    AAdd(aRotina, {"Visualizar", "VIEWDEF.LABMVC", 0, 2, 0, Nil})
    AAdd(aRotina, {"Incluir"   , "VIEWDEF.LABMVC", 0, 3, 0, Nil})
    AAdd(aRotina, {"Alterar"   , "VIEWDEF.LABMVC", 0, 4, 0, Nil})
    AAdd(aRotina, {"Excluir"   , "VIEWDEF.LABMVC", 0, 5, 0, Nil})

Return aRotina

Static Function ModelDef()
    Local oModel  := MPFormModel():New("LABMVCM")
    Local oStruct := FWFormStruct(1, "ZZ1")

    oModel:AddFields("ZZ1MASTER", Nil, oStruct)
    oModel:SetPrimaryKey({"ZZ1_FILIAL", "ZZ1_COD"})
    oModel:SetDescription(cTitulo)
    oModel:SetVldCommit({|oModel| LABVldCommit(oModel)})

Return oModel

Static Function ViewDef()
    Local oModel  := FWLoadModel("LABMVC")
    Local oView   := FWFormView():New()
    Local oStruct := FWFormStruct(2, "ZZ1")

    oView:SetModel(oModel)
    oView:AddField("VIEW_ZZ1", oStruct, "ZZ1MASTER")
    oView:CreateHorizontalBox("TELA", 100)
    oView:SetOwnerView("VIEW_ZZ1", "TELA")

Return oView

Static Function LABVldCommit(oModel)
    Local cNome := oModel:GetValue("ZZ1MASTER", "ZZ1_NOME")

    If Empty(cNome)
        Help(Nil, Nil, "VALIDACAO", Nil, "Nome obrigatorio.", 1, 0)
        Return .F.
    EndIf

    // TODO: adicionar legenda por status e bloquear status encerrado.

Return .T.
