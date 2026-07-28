#include "protheus.ch"

/*/{Protheus.doc} STTIP002
    Rotina de Cadastro de Pets (ZA1) utilizando a função mBrowse.
    @type   User Function
    @author Seu Nome
    @since  28/07/2026
    @version 1.0
/*/
USER FUNCTION STTIP002()

    LOCAL cTabela   := "ZA1"
    LOCAL cTitulo   := "Cadastro de Pets (mBrowse)"
    LOCAL cFiltro   := ""

    // Variáveis PRIVATE exigidas pelo padrão de navegação do Protheus
    PRIVATE cCadastro := cTitulo
    PRIVATE aRotina   := MenuDef() // Define os botões do menu superior

    // Seleciona a tabela e posiciona no primeiro índice
    dbSelectArea(cTabela)
    dbSetOrder(1)

    // Executa a navegação via mBrowse
    // Parâmetros: mBrowse( nTop, nLeft, nBottom, nRight, cAlias, aFixe, cFun, nPick, aColors, cFilter, ... )
    mBrowse(6, 1, 22, 75, cTabela, , , , , , , , , , , , , , cFiltro)

RETURN NIL


/*/{Protheus.doc} MenuDef
    Função estática responsável por montar o array aRotina com os botões do Browse.
    @type   Static Function
    @author Seu Nome
    @since  28/07/2026
    @return aRotina, Array com os botões e operações
/*/
STATIC FUNCTION MenuDef()

    LOCAL aRotina := {}

    // Estrutura de cada item do menu: { "Descrição", "Função do Protheus", Reservado, Ação/Operação }
    ADD OPTION aRotina TITLE "Pesquisar"  ACTION "AxPesqui"        OPERATION 1 ACCESS 0
    ADD OPTION aRotina TITLE "Visualizar" ACTION "AxVisual"        OPERATION 2 ACCESS 0
    ADD OPTION aRotina TITLE "Incluir"    ACTION "AxInclui"        OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE "Alterar"    ACTION "AxAltera"        OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE "Excluir"    ACTION "AxDeleta"        OPERATION 5 ACCESS 0

RETURN aRotina