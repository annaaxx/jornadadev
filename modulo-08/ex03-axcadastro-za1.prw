#include "protheus.ch"

/*/{Protheus.doc} STTIP001
    Rotina de Cadastro de Pets (ZA1) utilizando a função AxCadastro.
    @type   User Function
    @author Seu Nome
    @since  28/07/2026
    @version 1.0
/*/
USER FUNCTION STTIP001()

    LOCAL cTabela   := "ZA1"
    LOCAL cTitulo   := "Cadastro de Pets"
    LOCAL cVldExc   := ".T." // Validação antes da exclusão
    LOCAL cVldAlt   := ".T." // Validação antes da alteração

    // Variável PRIVATE exigida pelo padrão do Protheus/AxCadastro
    PRIVATE cCadastro := cTitulo

    // Seleciona a tabela e posiciona na Ordem 1 (ZA1_FILIAL + ZA1_COD)
    dbSelectArea(cTabela)
    dbSetOrder(1)

    // Chama a função padrão AxCadastro
    AxCadastro(cTabela, cTitulo, cVldExc, cVldAlt)

RETURN NIL