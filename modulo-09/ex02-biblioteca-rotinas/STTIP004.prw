#include 'protheus.ch'

/*/{Protheus.doc} STTIP004
Rotina de Interacoes (SZ2) filtrada pelo contato posicionado na SZ1
@type Function
@author     Anna Julia
@since 30/07/2026
/*/
User Function STTIP004()
    Local oBrowse
    Local cContatoSel := SZ1->Z1_CODIGO
    Local cNomeSel    := u_NomeCliente(cContatoSel)
    Local cFiltro     := ""

    If Empty(cContatoSel)
        MsgAlert("Selecione um contato valido na tabela antes de acessar as Interações.", "Atenção")
        Return
    EndIf

    // Construcao do filtro de navegacao
    cFiltro := "Z2_FILIAL == '" + xFilial("SZ2") + "' .And. Z2_CONTAT == '" + cContatoSel + "'"

    Private cCadastro := "Interações do Contato: " + AllTrim(cContatoSel) + " - " + cNomeSel
    Private aRotina   := {}

    AAdd(aRotina, {"Pesquisar",  "AxPesqui", 0, 1})
    AAdd(aRotina, {"Visualizar", "AxVisual", 0, 2})
    AAdd(aRotina, {"Incluir",    "AxInclui", 0, 3})
    AAdd(aRotina, {"Alterar",    "AxAltera", 0, 4})
    AAdd(aRotina, {"Excluir",    "AxDeleta", 0, 5})

    DbSelectArea("SZ2")
    SZ2->(DbSetOrder(1)) // Z2_FILIAL + Z2_CONTAT + Z2_SEQUEN

    oBrowse := FWMBrowse():New()
    oBrowse:SetAlias("SZ2")
    oBrowse:SetDescription(cCadastro)
    
    // Aplica o filtro estrito no Browse
    oBrowse:SetFilterDefault(cFiltro)
    oBrowse:Activate()

Return