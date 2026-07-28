#include "protheus.ch"

/*/{Protheus.doc} STTIP002
    Rotina de Cadastro de Pets (ZA1) com mBrowse e Legendas Coloridas.
    @type   User Function
    @author Seu Nome
    @since  28/07/2026
    @version 2.0
/*/
USER FUNCTION STTIP002()

    LOCAL cTabela   := "ZA1"
    LOCAL cTitulo   := "Cadastro de Pets (Com Legendas)"
    LOCAL cFiltro   := ""
    LOCAL aColors   := {}

    // Variáveis PRIVATE exigidas pelo padrão de navegação do Protheus
    PRIVATE cCadastro := cTitulo
    PRIVATE aRotina   := MenuDef() // Define os botões do menu superior

    // Regras de Legenda Colorida (aColors):
    // 🔴 Vermelho: Nascidos há mais de 10 anos (3650 dias aprox.)
    // 🟡 Amarelo : Nascidos hoje (dDataBase)
    // 🟢 Verde   : Os demais (Regra padrão .T. sempre por último)
    aColors := { ;
        { "ZA1->ZA1_DTNASC <= (dDataBase - 3650)", "BR_RED"    }, ;
        { "ZA1->ZA1_DTNASC == dDataBase",          "BR_YELLOW" }, ;
        { ".T.",                                   "BR_GREEN"  }  ;
    }

    // Seleciona a tabela e posiciona no primeiro índice
    dbSelectArea(cTabela)
    dbSetOrder(1)

    // Executa o mBrowse passando o array aColors na 11ª posição
    mBrowse(6, 1, 22, 75, cTabela, , , , , , aColors, , , , , .F., , , cFiltro)

RETURN NIL


/*/{Protheus.doc} MenuDef
    Monta o menu superior aRotina, incluindo o botão de visualização da Legenda.
    @type   Static Function
    @author Seu Nome
    @since  28/07/2026
    @return aRotina, Array com os botões e operações
/*/
STATIC FUNCTION MenuDef()

    LOCAL aRotina := {}

    ADD OPTION aRotina TITLE "Pesquisar"  ACTION "AxPesqui"        OPERATION 1 ACCESS 0
    ADD OPTION aRotina TITLE "Visualizar" ACTION "AxVisual"        OPERATION 2 ACCESS 0
    ADD OPTION aRotina TITLE "Incluir"    ACTION "AxInclui"        OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE "Alterar"    ACTION "AxAltera"        OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE "Excluir"    ACTION "AxDeleta"        OPERATION 5 ACCESS 0
    ADD OPTION aRotina TITLE "Legenda"    ACTION "U_LEGED001()"    OPERATION 6 ACCESS 0

RETURN aRotina


/*/{Protheus.doc} LEGED001
    Função para exibir a janela explicativa de cores da Legenda.
    @type   User Function
    @author Seu Nome
    @since  28/07/2026
/*/
USER FUNCTION LEGED001()

    LOCAL aLegenda := { ;
        { "BR_RED",    "Pet Idoso (Nascimento há mais de 10 anos)" }, ;
        { "BR_YELLOW", "Pet Cadastrado Hoje"                        }, ;
        { "BR_GREEN",  "Demais Pets (Ativos/Jovens)"               }  ;
    }

    BrwLegenda("Legenda do Cadastro de Pets", "Status do Pet", aLegenda)

RETURN NIL