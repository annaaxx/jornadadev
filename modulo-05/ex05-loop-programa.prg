REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    LOCAL cNome      := ""
    LOCAL cDisc      := ""
    LOCAL cTempNota1 := ""
    LOCAL cTempNota2 := ""
    LOCAL nNota1     := 0.00
    LOCAL nNota2     := 0.00
    LOCAL nMedia     := 0.00
    
    //Vari vel nova para controlar o menu final
    LOCAL cResposta  := "" 

    HB_CDPSELECT("PT850")

    WHILE .T.

        Cls //Limpa a tela a cada novo aluno para deixar o visual limpo!

        QOut("==== SISTEMA DE CADASTRO DE ALUNOS ====")
        QOut("")

        //Valida‡Æo do Nome
        WHILE .T.
            ACCEPT "Digite o nome do aluno: " TO cNome
            IF Len(Trim(cNome)) > 0
                EXIT 
            ENDIF
            QOut("Erro: O nome do aluno nÆo pode ser deixado em branco!")
            QOut("--------------------------------------------------")
        ENDDO

        QOut("")

        //Valida‡Æo da Disciplina
        WHILE .T.
            ACCEPT "Digite a disciplina (ex: MAT, POR): " TO cDisc
            IF Len(Trim(cDisc)) == 3 .AND. cDisc == Upper(cDisc)
                EXIT 
            ENDIF
            QOut("Erro: Use exatamente 3 letras MAIéSCULAS!")
            QOut("--------------------------------------------------")
        ENDDO

        QOut("")

        //Valida‡Æo da Nota 1
        WHILE .T.
            ACCEPT "Digite a primeira nota (0 a 10): " TO cTempNota1
            nNota1 := VAL(cTempNota1)
            IF nNota1 >= 0 .AND. nNota1 <= 10
                EXIT 
            ENDIF
            QOut("Erro: A nota precisa estar entre 0.00 e 10.00!")
            QOut("--------------------------------------------------")
        ENDDO

        QOut("")

        //Valida‡Æo da Nota 2
        WHILE .T.
            ACCEPT "Digite a segunda nota (0 a 10): " TO cTempNota2
            nNota2 := VAL(cTempNota2)
            IF nNota2 >= 0 .AND. nNota2 <= 10
                EXIT 
            ENDIF
            QOut("Erro: A nota precisa estar entre 0.00 e 10.00!")
            QOut("--------------------------------------------------")
        ENDDO

        //C lculos e Boletim
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

        WHILE .T.
            ACCEPT "Deseja calcular outro aluno? (S/N): " TO cResposta
            
            //Convertemos para mai£sculo para aceitar 's' ou 'S' / 'n' ou 'N'
            cResposta := Upper(Trim(cResposta))

            IF cResposta == "S"
                //Sai apenas do loop da pergunta. 
                //Como o loop principal continua, ele volta para o in¡cio e reseta as telas.
                EXIT 
            ELSEIF cResposta == "N"
                QOut("")
                QOut("Encerrando o sistema. At‚ logo!")
                hb_idleSleep(1)
                
                //ATEN€ÇO: Este EXIT quebra o loop principal! 
                //Ele sai de TODOS os loops e finaliza o programa.
                BREAK 
            ELSE
                QOut("Op‡Æo inv lida! Digite apenas 'S' para Sim ou 'N' para NÆo.")
                QOut("--------------------------------------------------")
            ENDIF
        ENDDO 
        
        //Se o usu rio digitou 'N', o comando BREAK ali de cima nos joga para fora do loop principal.
        //Se digitou 'S', o loop principal continua rodando normalmente.

    ENDDO 

    QOut("")

RETURN NIL