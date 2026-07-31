#include 'protheus.ch'

/*/{Protheus.doc} u_CriaDicionario
@type       Function
@author     Anna Julia
@since      30/07/2026
@description Rotina automatizada para criacao e atualizacao das tabelas SZ1, SZ2,
             indices no SIX e tabela generica Z2 no SX5 via codigo ADVPL.
/*/
User Function CriaDicionario()
    Local aArea := GetArea()
    
    // Processamento das tabelas de dicionario
    Processa({|| PopulaSX5()}, "Atualizando SX5 (Tabela Generica Z2)...")
    Processa({|| PopulaSX2()}, "Atualizando SX2 (Cadastro de Tabelas)...")
    Processa({|| PopulaSX3()}, "Atualizando SX3 (Campos das Tabelas)...")
    Processa({|| PopulaSIX()}, "Atualizando SIX (Indices das Tabelas)...")
    
    RestArea(aArea)
    MsgInfo("Dicionario de Dados (SZ1, SZ2, SIX, SX5) atualizado com sucesso!", "Sucesso")
Return


Funcao: PopulaSX5                                                   
Descricao: Cadastra o dominio Z2 na tabela SX5 com os tipos de interacao (E, L, R, V, W).                            

Static Function PopulaSX5()
    Local aItens := {}
    Local nI     := 0
    
    AAdd(aItens, {"E", "E-MAIL"})
    AAdd(aItens, {"L", "LIGACAO"})
    AAdd(aItens, {"R", "REUNIAO"})
    AAdd(aItens, {"V", "VISITA"})
    AAdd(aItens, {"W", "WHATSAPP"})
    
    DbSelectArea("SX5")
    SX5->(DbSetOrder(1)) // X5_FILIAL + X5_TABELA + X5_CHAVE
    
    For nI := 1 To Len(aItens)
        If !SX5->(DbSeek(xFilial("SX5") + "Z2" + aItens[nI][1]))
            RecLock("SX5", .T.)
                SX5->X5_FILIAL  := xFilial("SX5")
                SX5->X5_TABELA  := "Z2"
                SX5->X5_CHAVE   := aItens[nI][1]
                SX5->X5_DESCRI  := aItens[nI][2]
            SX5->(MsUnlock())
        EndIf
    Next nI
Return


Funcao: PopulaSX2                                                   
Descricao: Configura as tabelas SZ1 e SZ2 no modo Compartilhado.     

Static Function PopulaSX2()
    Local aTabelas := {}
    Local nI       := 0
    
    AAdd(aTabelas, {"SZ1", "Cadastro de Contatos", "C"})
    AAdd(aTabelas, {"SZ2", "Historico de Interacoes", "C"})
    
    DbSelectArea("SX2")
    SX2->(DbSetOrder(1)) // X2_CHAVE
    
    For nI := 1 To Len(aTabelas)
        If !SX2->(DbSeek(aTabelas[nI][1]))
            RecLock("SX2", .T.)
                SX2->X2_CHAVE   := aTabelas[nI][1]
                SX2->X2_NOME    := aTabelas[nI][2]
                SX2->X2_MODO    := aTabelas[nI][3]
                SX2->X2_MODOUN  := aTabelas[nI][3]
            SX2->(MsUnlock())
        EndIf
    Next nI
Return


Funcao: PopulaSX3                                                   
Descricao: Cadastra os campos das tabelas SZ1 e SZ2 no SX3.   

Static Function PopulaSX3()
    Local aCampos := {}
    Local nI      := 0
    
    // SZ1 - Contatos
    AAdd(aCampos, {"Z1_FILIAL", "C", 2,  0, "Filial",  "Filial do Sistema",    "R", "SZ1", "01"})
    AAdd(aCampos, {"Z1_CODIGO", "C", 6,  0, "Codigo",  "Codigo do Contato",    "R", "SZ1", "02"})
    AAdd(aCampos, {"Z1_NOME",   "C", 40, 0, "Nome",    "Nome do Contato",      "R", "SZ1", "03"})
    
    // SZ2 - Interacoes
    AAdd(aCampos, {"Z2_FILIAL", "C", 2,  0, "Filial",  "Filial do Sistema",    "R", "SZ2", "01"})
    AAdd(aCampos, {"Z2_CONTAT", "C", 6,  0, "Contato", "Codigo do Contato",    "R", "SZ2", "02"})
    AAdd(aCampos, {"Z2_SEQUEN", "C", 3,  0, "Sequencia","Sequencia Interacao",  "R", "SZ2", "03"})
    AAdd(aCampos, {"Z2_TIPO",   "C", 1,  0, "Tipo",    "Tipo de Interacao",    "R", "SZ2", "04"})
    AAdd(aCampos, {"Z2_DATA",   "D", 8,  0, "Data",    "Data da Interacao",    "R", "SZ2", "05"})
    AAdd(aCampos, {"Z2_OBS",    "M", 80, 0, "Observacao","Observacao Interacao","R", "SZ2", "06"})
    
    DbSelectArea("SX3")
    SX3->(DbSetOrder(2)) // X3_CAMPO
    
    For nI := 1 To Len(aCampos)
        If !SX3->(DbSeek(aCampos[nI][1]))
            RecLock("SX3", .T.)
                SX3->X3_CAMPO   := aCampos[nI][1]
                SX3->X3_TIPO    := aCampos[nI][2]
                SX3->X3_TAMANHO := aCampos[nI][3]
                SX3->X3_DECIMAL := aCampos[nI][4]
                SX3->X3_TITULO  := aCampos[nI][5]
                SX3->X3_DESCRIC := aCampos[nI][6]
                SX3->X3_CONTEXT := aCampos[nI][7]
                SX3->X3_ARQUIVO := aCampos[nI][8]
                SX3->X3_ORDEM   := aCampos[nI][9]
            SX3->(MsUnlock())
        EndIf
    Next nI
Return

Funcao: PopulaSIX                                                   
Descricao: Configura os indices das tabelas SZ1 e SZ2 no SIX.

Static Function PopulaSIX()
    Local aIndices := {}
    Local nI       := 0
    
    AAdd(aIndices, {"SZ1", "1", "Z1_FILIAL+Z1_CODIGO",           "Codigo",    "U"})
    AAdd(aIndices, {"SZ2", "1", "Z2_FILIAL+Z2_CONTAT+Z2_SEQUEN", "Seq.Contat", "U"})
    
    DbSelectArea("SIX")
    SIX->(DbSetOrder(1)) // INDICE + ORDEM
    
    For nI := 1 To Len(aIndices)
        If !SIX->(DbSeek(aIndices[nI][1] + aIndices[nI][2]))
            RecLock("SIX", .T.)
                SIX->INDICE     := aIndices[nI][1]
                SIX->ORDEM      := aIndices[nI][2]
                SIX->CHAVE      := aIndices[nI][3]
                SIX->DESCRICAO  := aIndices[nI][4]
                SIX->PROPRI     := aIndices[nI][5]
            SIX->(MsUnlock())
        EndIf
    Next nI
Return