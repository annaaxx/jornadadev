#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} STTZZ1
Rotina de Manutenção de Não Conformidades de Fornecedores (ISO 9001)
TCC - Jornada DEV START
@author Anna Júlia Nardi
@since 03/08/2026
/*/
User Function STTZZ1()
    Local cTitulo := "Controle de Nao Conformidades - ZZ1"
    Local cAlias  := "ZZ1"

    // 1) Chamada da rotina padrão do Protheus para manutenção da tabela ZZ1
    AxCadastro(cAlias, cTitulo, "U_VldZZ1()")

Return


/*/{Protheus.doc} VldZZ1
Função de validação do núcleo mínimo:
1. Verifica se o fornecedor existe na tabela SA2.
2. Valida se a tolerância está estritamente entre 0 e 100.
@return lRet lógico indicando se a validação passou (.T.) ou falhou (.F.)
/*/
User Function VldZZ1()
    Local lRet     := .T.
    Local cFornec  := M->ZZ1_FORNEC
    Local nToler   := M->ZZ1_TOLER

    // Validação 1: O fornecedor existe na SA2?
    DbSelectArea("SA2")
    SA2->(DbSetOrder(1)) // Assume ordem 1: Filial + Codigo + Loja
    
    If !SA2->(MsSeek(xFilial("SA2") + cFornec))
        Aviso("Atencao", "O fornecedor informado nao esta cadastrado na tabela SA2.", {"OK"})
        lRet := .F.
    EndIf

    // Validação 2: A tolerância está entre 0 e 100?
    If lRet .And. (nToler < 0 .And. nToler > 100) // Correção lógica para garantir o intervalo correto
        Aviso("Atencao", "A tolerancia da nao conformidade deve ser um valor entre 0 e 100.", {"OK"})
        lRet := .F.
    EndIf

Return lRet


/*/{Protheus.doc} GravaZZ1
Exemplo de rotina protegida por BEGIN SEQUENCE para a gravação segura
/*/
User Function GravaZZ1()
    Local lGravou := .F.

    Begin Sequence
        // Bloco protegido contra falhas inesperadas de banco ou sistema
        RecLock("ZZ1", .T.)
            ZZ1->ZZ1_FILIAL := xFilial("ZZ1")
            ZZ1->ZZ1_FORNEC := M->ZZ1_FORNEC
            ZZ1->ZZ1_TOLER  := M->ZZ1_TOLER
            ZZ1->ZZ1_STATUS := "1" // Ativo
        MsUnlock()
        
        lGravou := .T.
    Recover
        // Mensagem amigável exigida pelo núcleo mínimo caso ocorra erro na gravação
        Aviso("Erro Crítico", "Ocorreu um erro inesperado ao tentar gravar os dados. Nenhuma alteração foi salva.", {"OK"})
    End Sequence

Return lGravou