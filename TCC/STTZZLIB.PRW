#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} STTZZLIB
Biblioteca de funções comuns e utilitários do sistema
TCC - Jornada DEV START
@author Anna Júlia Nardi
@since 03/08/2026
/*/
User Function STTZZLIB()
    // Apenas uma função de guarda para evitar execução direta acidental
    MsgInfo("Esta é a biblioteca de funções comuns (STTZZLIB).", "Aviso")
Return


/*/{Protheus.doc} U_SttMsgPadrao
Função genérica da biblioteca para exibir mensagens padronizadas no sistema
@param cTexto Caracter, mensagem a ser exibida
@param cTitulo Caracter, título da janela
/*/
User Function SttMsgPadrao(cTexto, cTitulo)
    Default cTitulo := "Sistema de Não Conformidades"
    Default cTexto  := "Operação realizada com sucesso."

    Aviso(cTitulo, cTexto, {"OK"})
Return


/*/{Protheus.doc} U_SttValVazio
Função genérica da biblioteca para validar se um campo está vazio
@param xValor Qualquer tipo, valor a ser testado
@return lRet Lógico, .T. se estiver vazio, .F. caso contrário
/*/
User Function SttValVazio(xValor)
    Local lRet := .F.

    If Empty(xValor)
        lRet := .T.
    EndIf

Return lRet