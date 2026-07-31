#include 'protheus.ch'

/*/{Protheus.doc} NomeCliente
Retorna o nome do contato formatado a partir do codigo.
@type Function
@author     Anna Julia
@since 30/07/2026
/*/
User Function NomeCliente(cCodigo)
    Local cNome  := ""
    Local aArea  := GetArea()
    Default cCodigo := ""

    DbSelectArea("SZ1")
    SZ1->(DbSetOrder(1)) // Z1_FILIAL + Z1_CODIGO
    If SZ1->(DbSeek(xFilial("SZ1") + cCodigo))
        cNome := AllTrim(SZ1->Z1_NOME)
    EndIf

    RestArea(aArea)
Return cNome

/*/{Protheus.doc} ProxCodigoSZ1
Gera o proximo codigo sequencial disponivel para a tabela SZ1.
@type Function
@author     Anna Julia
@since 30/07/2026
/*/
User Function ProxCodigoSZ1()
    Local cCodigo := ""
    Local aArea   := GetArea()

    cCodigo := GETSXENUM("SZ1", "Z1_CODIGO")
    CONFIRMSX8()

    RestArea(aArea)
Return cCodigo

/*/{Protheus.doc} ProxSequenSZ2
Calcula a proxima sequencia de interacao para um determinado contato.
@type Function
@author     Anna Julia
@since 30/07/2026
/*/
User Function ProxSequenSZ2(cContato)
    Local cSequen := "001"
    Local aArea   := GetArea()
    Default cContato := ""

    DbSelectArea("SZ2")
    SZ2->(DbSetOrder(1)) // Z2_FILIAL + Z2_CONTAT + Z2_SEQUEN
    
    // Posiciona na ultima sequencia do contato fornecido
    If SZ2->(DbSeek(xFilial("SZ2") + cContato + "999", .T.))
        SZ2->(DbSkip(-1))
        If SZ2->Z2_FILIAL == xFilial("SZ2") .And. SZ2->Z2_CONTAT == cContato
            cSequen := Soma1(SZ2->Z2_SEQUEN)
        EndIf
    EndIf

    RestArea(aArea)
Return cSequen

/*/{Protheus.doc} DescTipoInteracao
Retorna a descricao legivel do tipo de interacao (Domínio SX5/Z2).
@type Function
@author     Anna Julia
@since 30/07/2026
/*/
User Function DescTipoInteracao(cTipo)
    Local cDesc := ""
    Default cTipo := ""

    Do Case
        Case cTipo == "E" ; cDesc := "E-mail"
        Case cTipo == "L" ; cDesc := "Ligação"
        Case cTipo == "R" ; cDesc := "Reunião"
        Case cTipo == "V" ; cDesc := "Visita"
        Case cTipo == "W" ; cDesc := "WhatsApp"
        Otherwise       ; cDesc := "Não Informado"
    EndCase

Return cDesc