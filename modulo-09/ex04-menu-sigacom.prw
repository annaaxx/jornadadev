#include 'protheus.ch'

/*/{Protheus.doc} u_STTIP004B
Rotina de Listagem Geral de Interações (SZ2) - Sem filtro por contato.
@type       Function
@author     Anna Julia
@since      30/07/2026
/*/
User Function STTIP004B()
    Local oBrowse

    Private cCadastro := "Listagem Geral de Interações"
    Private aRotina   := {}

    // Definicao das operacoes padrao no menu do browse
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
    
    // Diferenca da STTIP004: Nao aplica SetFilterDefault (exibe todas as interacoes)
    oBrowse:Activate()

Return