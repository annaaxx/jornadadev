#include "protheus.ch"

/*/{Protheus.doc} STTIP002
    Rotina de Cadastro de Pets (ZA1) com mBrowse, Legendas,
    Filtro do Mês Atual e Botões Customizados.
    @type   User Function
    @author Seu Nome
    @since  28/07/2026
    @version 3.0
/*/
USER FUNCTION STTIP002(lSemFiltro)

    LOCAL cTabela   := "ZA1"
    LOCAL cTitulo   := "Cadastro de Pets"
    LOCAL cFiltro   := ""
    LOCAL aColors   := {}

    // Parâmetro padrão: se não for passado, inicia COM filtro (.F.)
    DEFAULT lSemFiltro := .F.

    // Variáveis PRIVATE exigidas pelo padrão do Protheus
    PRIVATE cCadastro := cTitulo
    PRIVATE aRotina   := MenuDef()

    // Regra de Filtro Inicial: Pets nascidos no mês e ano atuais
    IF !lSemFiltro
        cFiltro := "Month(ZA1->ZA1_DTNASC) == Month(dDataBase) .AND. Year(ZA1->ZA1_DTNASC) == Year(dDataBase)"
        cCadastro += " (Filtro: Aniversariantes do Mês)"
    ELSE
        cFiltro := ""
        cCadastro += " (Todos os Registros)"
    ENDIF

    // Configuração de Legendas
    aColors := { ;
        { "ZA1->ZA1_DTNASC <= (dDataBase - 3650)", "BR_RED"    }, ; // Idosos (+10 anos)
        { "ZA1->ZA1_DTNASC == dDataBase",          "BR_YELLOW" }, ; // Hoje
        { ".T.",                                   "BR_GREEN"  }  ; // Demais
    }

    // Seleciona a tabela e posiciona no índice 1
    dbSelectArea(cTabela)
    dbSetOrder(1)

    // Executa a navegação do mBrowse
    mBrowse(6, 1, 22, 75, cTabela, , , , , , aColors, , , , , .F., , , cFiltro)

RETURN NIL


/*/{Protheus.doc} MenuDef
    Monta os botões do menu superior (aRotina).
/*/
STATIC FUNCTION MenuDef()

    LOCAL aRotina := {}

    ADD OPTION aRotina TITLE "Pesquisar"      ACTION "AxPesqui"        OPERATION 1 ACCESS 0
    ADD OPTION aRotina TITLE "Visualizar"     ACTION "AxVisual"        OPERATION 2 ACCESS 0
    ADD OPTION aRotina TITLE "Incluir"        ACTION "AxInclui"        OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE "Alterar"        ACTION "AxAltera"        OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE "Excluir"        ACTION "AxDeleta"        OPERATION 5 ACCESS 0
    ADD OPTION aRotina TITLE "Legenda"        ACTION "U_LEGED001()"    OPERATION 6 ACCESS 0
    ADD OPTION aRotina TITLE "Limpar Filtro"  ACTION "U_STCLRFIL()"    OPERATION 6 ACCESS 0
    ADD OPTION aRotina TITLE "Histórico"      ACTION "U_STHIST01()"    OPERATION 6 ACCESS 0

RETURN aRotina


/*/{Protheus.doc} STCLRFIL
    Função customizada para reabrir a rotina sem o filtro inicial.
/*/
USER FUNCTION STCLRFIL()
    // Reabre a função principal passando .T. para remover o filtro
    U_STTIP002(.T.)
RETURN NIL


/*/{Protheus.doc} STHIST01
    Função customizada para exibir o histórico/resumo do Pet posicionado na régua.
/*/
USER FUNCTION STHIST01()

    LOCAL cMensagem := ""

    // Monta a mensagem com os dados do registro posicionado no mBrowse
    cMensagem += "--- RESUMO DO PET ---" + CRLF + CRLF
    cMensagem += "Código: " + ZA1->ZA1_COD + CRLF
    cMensagem += "Nome: "   + AllTrim(ZA1->ZA1_NOME) + CRLF
    cMensagem += "Raça: "   + AllTrim(ZA1->ZA1_RACA) + CRLF
    cMensagem += "Data Nasc: " + DToC(ZA1->ZA1_DTNASC) + CRLF
    cMensagem += "Cliente/Dono: " + ZA1->ZA1_CLIENT + "/" + ZA1->ZA1_LOJA

    MsgInfo(cMensagem, "Histórico do Registro")

RETURN NIL


/*/{Protheus.doc} LEGED001
    Exibe a legenda de cores.
/*/
USER FUNCTION LEGED001()

    LOCAL aLegenda := { ;
        { "BR_RED",    "Pet Idoso (+10 anos)" }, ;
        { "BR_YELLOW", "Pet Nascido Hoje"     }, ;
        { "BR_GREEN",  "Demais Pets"          }  ;
    }

    BrwLegenda("Legenda do Cadastro de Pets", "Status do Pet", aLegenda)

RETURN NIL