#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} STTZZ2
Rotina opcional de Itens/Detalhes das Não Conformidades (ZZ2)
TCC - Jornada DEV START
@author Anna Júlia Nardi
@since 03/08/2026
/*/
User Function STTZZ2()
    Local cTitulo := "Itens de Nao Conformidades - ZZ2"
    Local cAlias  := "ZZ2"

    // Chamada da rotina padrão para manutenção dos registros da tabela ZZ2
    AxCadastro(cAlias, cTitulo, "U_VldZZ2()")

Return


/*/{Protheus.doc} VldZZ2
Validação opcional para os registros da ZZ2
@return lRet Lógico indicando se passou (.T.) ou falhou (.F.)
/*/
User Function VldZZ2()
    Local lRet      := .T.
    Local cDescricao := M->ZZ2_DESC // Exemplo de campo de descrição do item

    // Exemplo de validação simples: garantir que a descrição não está vazia
    If Empty(cDescricao)
        Aviso("Atencao", "A descricao do item da não conformidade nao pode ser vazia.", {"OK"})
        lRet := .F.
    EndIf

Return lRet