#include 'protheus.ch'

/*/{Protheus.doc} STTIP003
Rotina de Cadastro de Contatos (SZ1)
@type Function
@author     Anna Julia
@since 30/07/2026
/*/
User Function STTIP003()
    Local oBrowse
    Local aCores := {}

    // Regras de Legenda Exemplo:
    // Verde: Contato com codigo preenchido / Ativo
    AAdd(aCores, {"!Empty(Z1_CODIGO)", "ENABLE", "Contato Valido"})

    Private cCadastro := "Cadastro de Contatos"
    Private aRotina   := {}

    // Menu de operacoes padrao
    AAdd(aRotina, {"Pesquisar",  "AxPesqui",   0, 1})
    AAdd(aRotina, {"Visualizar", "AxVisual",   0, 2})
    AAdd(aRotina, {"Incluir",    "AxInclui",   0, 3})
    AAdd(aRotina, {"Alterar",    "AxAltera",   0, 4})
    AAdd(aRotina, {"Excluir",    "AxDeleta",   0, 5})
    // Botao Customizado acionando a rotina de Interacoes
    AAdd(aRotina, {"Interações", "u_STTIP004", 0, 6})

    DbSelectArea("SZ1")
    SZ1->(DbSetOrder(1))

    oBrowse := FWMBrowse():New()
    oBrowse:SetAlias("SZ1")
    oBrowse:SetDescription(cCadastro)
    oBrowse:SetColors(aCores)
    oBrowse:Activate()

Return