REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    LOCAL cNome     := ""
    LOCAL cDisc     := ""
    
    LOCAL cTempNota1 := ""
    LOCAL cTempNota2 := ""
    LOCAL nNota1    := 0.00
    LOCAL nNota2    := 0.00
    LOCAL nMedia    := 0.00

    HB_CDPSELECT("PT850")

    QOut("==== CADASTRO DE ALUNO COM VALIDA€ÇO ====")
    QOut("")

    WHILE .T.
        ACCEPT "Digite o nome do aluno: " TO cNome
        
        //Len(Trim()) mede o tamanho do texto tirando espa‡os extras
        IF Len(Trim(cNome)) > 0
            EXIT //Nome v lido, sai do loop
        ENDIF
        
        QOut("Erro: O nome do aluno nÆo pode ser deixado em branco!")
        QOut("--------------------------------------------------")
    ENDDO

    QOut("")


    WHILE .T.
        ACCEPT "Digite a disciplina (ex: MAT, POR): " TO cDisc
        
        //Verifica se tem 3 caracteres E se ‚ igual … versÆo Upper() dela mesma
        IF Len(Trim(cDisc)) == 3 .AND. cDisc == Upper(cDisc)
            EXIT //Disciplina v lida, sai do loop
        ENDIF
        
        QOut("Erro: Use exatamente 3 letras MAIéSCULAS!")
        QOut("--------------------------------------------------")
    ENDDO

    QOut("")

    WHILE .T.
        ACCEPT "Digite a primeira nota (0 a 10): " TO cTempNota1
        nNota1 := VAL(cTempNota1)
        
        IF nNota1 >= 0 .AND. nNota1 <= 10
            EXIT //Nota v lida
        ENDIF
        
        QOut("Erro: A nota precisa estar entre 0.00 e 10.00!")
        QOut("--------------------------------------------------")
    ENDDO

    QOut("")

    WHILE .T.
        ACCEPT "Digite a segunda nota (0 a 10): " TO cTempNota2
        nNota2 := VAL(cTempNota2)
        
        IF nNota2 >= 0 .AND. nNota2 <= 10
            EXIT //Nota v lida
        ENDIF
        
        QOut("Erro: A nota precisa estar entre 0.00 e 10.00!")
        QOut("--------------------------------------------------")
    ENDDO

    nMedia := (nNota1 + nNota2) / 2

    QOut("")
    QOut("========= BOLETIM FINAL =========")
    QOut("Aluno:      " + Trim(cNome))
    QOut("Disciplina: " + cDisc)
    QOut("---------------------------------")
    QOut("Nota 1:     " + STR(nNota1, 5, 2))
    QOut("Nota 2:     " + STR(nNota2, 5, 2))
    QOut("M‚dia:      " + STR(nMedia, 5, 2))
    QOut("=================================")
    QOut("")

RETURN NIL