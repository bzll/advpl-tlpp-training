#Include "Protheus.ch"
#Include "FWMVCDef.ch"

Static cTitulo := "Cadastro Exemplo MVC"

User Function ZMVC001()
    Local oBrowse := FWMBrowse():New()

    oBrowse:SetAlias("ZZ1")
    oBrowse:SetDescription(cTitulo)
    oBrowse:Activate()

Return

Static Function MenuDef()
    Local aRotina := {}

    AAdd(aRotina, {"Visualizar", "VIEWDEF.ZMVC001", 0, 2, 0, Nil})
    AAdd(aRotina, {"Incluir"   , "VIEWDEF.ZMVC001", 0, 3, 0, Nil})
    AAdd(aRotina, {"Alterar"   , "VIEWDEF.ZMVC001", 0, 4, 0, Nil})
    AAdd(aRotina, {"Excluir"   , "VIEWDEF.ZMVC001", 0, 5, 0, Nil})

Return aRotina

Static Function ModelDef()
    Local oModel  := MPFormModel():New("ZZ1MODEL")
    Local oStruct := FWFormStruct(1, "ZZ1")

    oModel:AddFields("ZZ1MASTER", Nil, oStruct)
    oModel:SetPrimaryKey({"ZZ1_FILIAL", "ZZ1_COD"})
    oModel:SetDescription(cTitulo)
    oModel:SetVldCommit({|oModel| ZValCommit(oModel)})

Return oModel

Static Function ViewDef()
    Local oModel  := FWLoadModel("ZMVC001")
    Local oView   := FWFormView():New()
    Local oStruct := FWFormStruct(2, "ZZ1")

    oView:SetModel(oModel)
    oView:AddField("VIEW_ZZ1", oStruct, "ZZ1MASTER")
    oView:CreateHorizontalBox("TELA", 100)
    oView:SetOwnerView("VIEW_ZZ1", "TELA")

Return oView

Static Function ZValCommit(oModel)
    Local lRet  := .T.
    Local cNome := oModel:GetValue("ZZ1MASTER", "ZZ1_NOME")

    If Empty(cNome)
        Help(Nil, Nil, "VALIDACAO", Nil, "Nome obrigatorio.", 1, 0)
        lRet := .F.
    EndIf

    // TODO: bloquear alteracao quando ZZ1_STATUS estiver encerrado.

Return lRet
