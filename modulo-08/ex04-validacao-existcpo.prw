#include "protheus.ch"

/*/{Protheus.doc} VALCLI001
    Função de validação de campo (X3_VALID) para o campo ZA1_CLIENT.
    Garante que o cliente e loja digitados existem na tabela SA1.
    @type  User Function
    @author Seu Nome
    @since  28/07/2026
    @version 1.0
/*/
USER FUNCTION VALCLI001()

    LOCAL cCliente := M->ZA1_CLIENT
    LOCAL cLoja    := M->ZA1_LOJA
    LOCAL lRet     := .T.

    // Garante validação apenas se o código do cliente foi preenchido
    IF !Empty(cCliente)
        
        // Testa se o registro (Filial + Cliente + Loja) existe na SA1 (Índice 1)
        IF !ExistCpo("SA1", xFilial("SA1") + cCliente + cLoja, 1)
            MsgAlert("Cliente nao cadastrado na SA1!", "Atencao")
            lRet := .F.
        ENDIF

    ENDIF

RETURN lRet