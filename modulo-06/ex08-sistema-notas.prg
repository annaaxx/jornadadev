FUNCTION Main()

    LOCAL aAlunos    := {} 
    LOCAL cQtdAlunos := "" 
    LOCAL nQtdAlunos := 0  
    LOCAL cNome      := "" 
    LOCAL cNota      := "" 
    LOCAL n1 := 0, n2 := 0, n3 := 0, n4 := 0
    LOCAL nMedia     := 0.0
    LOCAL i          := 0
    LOCAL cOpcao     := ""

    DO WHILE .T.

        // Limpa a tela no início
        OutStd( Chr(27) + "[2J" + Chr(27) + "[H" )
        aAlunos := {}

        QOut("==========================================")
        QOut("            SISTEMA DE NOTAS              ")
        QOut("==========================================")
        QOut("")

        QOut("Quantos alunos deseja cadastrar? ")
        ACCEPT TO cQtdAlunos
        nQtdAlunos := Val(AllTrim(cQtdAlunos))

        IF nQtdAlunos <= 0
            QOut("")
            QOut("Erro: Digite uma quantidade valida de alunos!")
            QOut("Pressione Enter para tentar novamente...")
            ACCEPT TO cOpcao
            LOOP
        ENDIF

        // LEITURA DOS ALUNOS
        FOR i := 1 TO nQtdAlunos
            QOut("")
            QOut("--- Dados do Aluno " + hb_ntos(i) + " de " + hb_ntos(nQtdAlunos) + " ---")
            
            QOut("Nome: ")
            ACCEPT TO cNome
            cNome := AllTrim(cNome)

            QOut("Nota 1: ")
            ACCEPT TO cNota
            n1 := Val(AllTrim(cNota))

            QOut("Nota 2: ")
            ACCEPT TO cNota
            n2 := Val(AllTrim(cNota))

            QOut("Nota 3: ")
            ACCEPT TO cNota
            n3 := Val(AllTrim(cNota))

            QOut("Nota 4: ")
            ACCEPT TO cNota
            n4 := Val(AllTrim(cNota))

            // Adiciona o aluno no array multidimensional
            AAdd(aAlunos, { cNome, n1, n2, n3, n4 })
        NEXT

        // LIMPA A TELA ANTES DE MOSTRAR O RELATÓRIO
        // Isso impede que as perguntas do cadastro fiquem misturadas com o resultado
        OutStd( Chr(27) + "[2J" + Chr(27) + "[H" )

        QOut("==========================================")
        QOut("            RELATORIO DE NOTAS            ")
        QOut("==========================================")

        // EXIBIÇÃO APENAS DOS RESULTADOS
        FOR i := 1 TO Len(aAlunos)
            cNome  := aAlunos[i][1]
            nMedia := ( aAlunos[i][2] + aAlunos[i][3] + aAlunos[i][4] + aAlunos[i][5] ) / 4

            QOut("")
            QOut("Aluno : " + cNome)
            QOut("Media : " + Transform(nMedia, "@N 99.99"))

            IF nMedia >= 7.0
                QOut("Status: APROVADO")
            ELSE
                QOut("Status: REPROVADO")
            ENDIF
        NEXT

        QOut("")
        QOut("==========================================")
        QOut("Deseja cadastrar outra turma? (S/N): ")
        ACCEPT TO cOpcao

        IF Upper(AllTrim(cOpcao)) != "S"
            QOut("")
            QOut("Ate logo!")
            EXIT
        ENDIF

    ENDDO

RETURN NIL