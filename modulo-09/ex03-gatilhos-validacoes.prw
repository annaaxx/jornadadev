#include 'protheus.ch'

/*/{Protheus.doc} u_ex03Gatilhos
Configura Campos Virtuais, Inicializadores Padrao e Validacao Cruzada no SX3 (Exercicio 3)
@type       Function
@author     Anna Julia
@since      30/07/2026
/*/
User Function ex03Gatilhos()
    Local aArea := GetArea()

    Processa({|| ConfigVirtuais()}, "Configurando Campos Virtuais...")
    Processa({|| ConfigInicializadores()}, "Configurando Inicializadores Padrao...")
    Processa({|| ConfigValidacoes()}, "Configurando Validacao Cruzada...")

    RestArea(aArea)
    MsgInfo("Exercício 3: Campos virtuais, inicializadores e validacoes configurados!", "Sucesso")
Return


Campos Virtuais (Z2_NOME e Z2_ASSUNT)                               

Static Function ConfigVirtuais()
    DbSelectArea("SX3")
    SX3->(DbSetOrder(2)) // X3_CAMPO

    // 1. Z2_NOME -> Busca o nome do contato na SZ1
    If SX3->(DbSeek("Z2_NOME"))
        RecLock("SX3", .F.)
            SX3->X3_CONTEXT := "V"
            SX3->X3_RELACAO := 'Posicione("SZ1", 1, xFilial("SZ1") + M->Z2_CONTAT, "Z1_NOME")'
        SX3->(MsUnlock())
    EndIf

    // 2. Z2_ASSUNT -> Busca a descricao do tipo na SX5 (Tabela Z2)
    If SX3->(DbSeek("Z2_ASSUNT"))
        RecLock("SX3", .F.)
            SX3->X3_CONTEXT := "V"
            SX3->X3_RELACAO := 'Posicione("SX5", 1, xFilial("SX5") + "Z2" + M->Z2_TIPO, "X5_DESCRI")'
        SX3->(MsUnlock())
    EndIf
Return

Preenchimento Automatico (Inicializadores Padrao)                   

Static Function ConfigInicializadores()
    DbSelectArea("SX3")
    SX3->(DbSetOrder(2))

    // Data Atual (dDataBase)
    If SX3->(DbSeek("Z2_DATA"))
        RecLock("SX3", .F.)
            SX3->X3_INIPAD := "dDataBase"
        SX3->(MsUnlock())
    EndIf

    // Hora Atual na Inclusao
    If SX3->(DbSeek("Z2_HORA"))
        RecLock("SX3", .F.)
            SX3->X3_INIPAD := "Iif(INCLUI, Time(), SZ2->Z2_HORA)"
        SX3->(MsUnlock())
    EndIf

    // Usuario Logado
    If SX3->(DbSeek("Z2_USUAR"))
        RecLock("SX3", .F.)
            SX3->X3_INIPAD := "cNomUsr"
        SX3->(MsUnlock())
    EndIf
Return

Validacao Cruzada (ExistCpo)   

Static Function ConfigValidacoes()
    DbSelectArea("SX3")
    SX3->(DbSetOrder(2))

    // Valida se o contato existe na SZ1
    If SX3->(DbSeek("Z2_CONTAT"))
        RecLock("SX3", .F.)
            SX3->X3_VALID := 'ExistCpo("SZ1", xFilial("SZ1") + M->Z2_CONTAT, 1)'
        SX3->(MsUnlock())
    EndIf
Return