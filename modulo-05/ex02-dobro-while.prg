REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    LOCAL cTempNum := ""  // Guarda o texto bruto digitado pelo usu†rio
    LOCAL nNumero  := 0   // Guarda o n£mero convertido em inteiro
    LOCAL nDobro   := 0   // Guarda o resultado do c†lculo do dobro

    HB_CDPSELECT("PT850")

    QOut("==== PROGRAMA DO DOBRO ====")
    QOut("Digite n£meros positivos para ver o dobro.")
    QOut("Para parar, digite 0 ou um n£mero negativo.")
    QOut("===========================")
    QOut("")

    //(WHILE)
    //.T. significa VERDADEIRO (True). Como verdadeiro sempre Ç verdadeiro,
    //este loop vai rodar para sempre, a menos que encontre o comando EXIT.
    WHILE .T.

        //Pede o n£mero ao usu†rio
        ACCEPT "Digite um n£mero: " TO cTempNum
        nNumero := VAL(cTempNum)

        //Verificaá∆o da condiá∆o de parada (Se for zero ou menor)
        IF nNumero <= 0
            QOut("")
            QOut("-> Valor zero ou negativo detectado!")
            QOut("-> Encerrando o programa...")
            hb_idleSleep(1) //Pausa de 1 segundo para o usu†rio ler a mensagem
            EXIT //O comando EXIT quebra o WHILE imediatamente e pula para depois do ENDDO
        ENDIF

        //Se o programa n∆o entrou no IF acima, ele continua aqui embaixo:
        nDobro := nNumero * 2

        //Exibe o resultado usando o seu estilo preferido com "+"
        QOut("O dobro de " + AllTrim(Str(nNumero)) + " Ç " + AllTrim(Str(nDobro)))
        QOut("---------------------------------------")
        QOut("")

    ENDDO //Fim do bloco WHILE

    QOut("Programa finalizado com sucesso!")
    QOut("")

RETURN NIL