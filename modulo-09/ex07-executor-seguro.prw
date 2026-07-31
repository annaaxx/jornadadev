#include 'protheus.ch'

/*/{Protheus.doc} u_VALEXCSZ1
Desafio 7a: Impede a exclusao de um Contato (SZ1) se houver Interacoes (SZ2) vinculadas.
@type       Function
@author     Anna Julia
@since      30/07/2026
@return     Logical, .T. se puder excluir, .F. se bloqueado.
/*/
User Function VALEXCSZ1()
    Local lPodeExcluir := .T.
    Local cCodigoCont  := SZ1->Z1_CODIGO

    // ExistCpo verifica se EXISTE o registro na SZ2.
    // Para a EXCLUSÃO, queremos que NÃO exista registro vinculado na SZ2.
    If ExistCpo("SZ2", xFilial("SZ2") + cCodigoCont, 1)
        MsgStop("Não é possível excluir este contato pois existem interações vinculadas na tabela SZ2!", "Bloqueio de Exclusão")
        lPodeExcluir := .F.
    EndIf

Return lPodeExcluir


/*/{Protheus.doc} u_EXECUTARSEGURO
Desafio 7b: Executor seguro generico que executa blocos de codigo em ambiente protegido.
@type       Function
@author     Anna Julia
@since      30/07/2026
@param      bBloco,    CodeBlock, Bloco de código a ser executado.
@param      cMsgErro,  Character, Mensagem amigável para o usuário em caso de falha.
@return     Logical,   .T. se executou com sucesso, .F. em caso de erro.
/*/
User Function EXECUTARSEGURO(bBloco, cMsgErro)
    Local lSucesso  := .T.
    Local oErro     := Nil
    Local bErrorOld := Nil
    Default bBloco   := {|| Nil}
    Default cMsgErro := "Ocorreu uma falha na execução da operação."

    // Redireciona os erros para o bloco protegido
    bErrorOld := ErrorBlock({|e| Break(e)})

    BEGIN SEQUENCE
        // Avalia e executa o bloco de codigo passado por parametro
        Eval(bBloco)

    RECOVER WITH oErro
        lSucesso := .F.

        // Exibe a mensagem amigavel definida pelo chamador
        MsgAlert(cMsgErro, "Atenção - Erro na Execução")

        // Registra o erro no log utilizando a biblioteca
        u_GRAVARLOG("U_EXECUTARSEGURO", oErro)

    END SEQUENCE

    // Restaura o tratamento de erros padrao
    ErrorBlock(bErrorOld)

Return lSucesso