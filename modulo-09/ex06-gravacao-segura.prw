#include 'protheus.ch'

/*/{Protheus.doc} u_STTIP003SALVAR
Salva o registro de Contatos com validacao rigorosa e controle de transacao.
@type       Function
@author     Anna Julia
@since      30/07/2026
/*/
User Function STTIP003SALVAR(cCliente, cAssunto, cNome)
    Local lSucesso   := .T.
    Local oErro      := Nil
    Local bErrorOld  := Nil
    Default cCliente := ""
    Default cAssunto := ""
    Default cNome    := ""

    // Redireciona o tratamento de erros de runtime para o BEGIN SEQUENCE
    bErrorOld := ErrorBlock({|e| Break(e)})

    BEGIN SEQUENCE
        // 1. Validacao previa antes da abertura de transacao
        If Empty(cCliente)
            MsgStop("O campo Cliente (Z1_CLIENTE) é obrigatório e não pode ficar vazio!", "Validação")
            Break("Cliente Vazio")
        EndIf

        If Empty(cAssunto)
            MsgStop("O campo Assunto (Z1_ASSUNTO) é obrigatório e não pode ficar vazio!", "Validação")
            Break("Assunto Vazio")
        EndIf

        // 2. Inicio da Transacao no Banco de Dados
        BeginTran()

        DbSelectArea("SZ1")
        
        // 3. Bloqueio de Registro e Gravacao
        If RecLock("SZ1", .T.) // Inclusao
            SZ1->Z1_FILIAL  := xFilial("SZ1")
            SZ1->Z1_CODIGO  := u_ProxCodigoSZ1()
            SZ1->Z1_NOME    := cNome
            // Se houver algum erro grave de gravação aqui, o RECOVER sera acionado
            SZ1->(MsUnlock())
        Else
            Break("Nao foi possivel bloquear a tabela SZ1 para inclusao.")
        EndIf

        // 4. Se chegou ate aqui sem excecoes, confirma as alteracoes no banco
        CommitTran()
        MsgInfo("Contato gravado com sucesso!", "Sucesso")

    RECOVER WITH oErro
        lSucesso := .F.

        // Se a transacao tiver sido iniciada, desfaz qualquer alteracao pendente
        RollBackTran()

        // Notificacao amigavel ao usuario
        MsgAlert("Atenção: A gravação foi cancelada e nenhuma alteração foi salva no banco de dados.", "Operação Cancelada")

        // Registra o erro no log via biblioteca
        u_GRAVARLOG("STTIP003SALVAR", oErro)

    END SEQUENCE

    // Restaura o bloco de erros padrao
    ErrorBlock(bErrorOld)

Return lSucesso