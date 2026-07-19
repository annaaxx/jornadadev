REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    LOCAL cTempNum := ""
    LOCAL nNumero  := 0
    
    LOCAL nTotal   := 0  //O acumulador (soma tudo)
    LOCAL nQtd     := 0  //O contador (conta as vezes)

    HB_CDPSELECT("PT850")

    QOut("==== MµQUINA DE SOMA ====")
    QOut("Digite os n£meros que deseja somar.")
    QOut("Para parar e ver os resultados, digite 0.")
    QOut("=========================")
    QOut("")

    //(WHILE)
    WHILE .T.

        ACCEPT "Digite um n£mero (ou 0 para parar): " TO cTempNum
        nNumero := VAL(cTempNum)

        //Condi‡Æo de Parada: Se for zero, sai IMEDIATAMENTE.
        //Como o EXIT acontece antes de somar e contar, o 0 nÆo altera os resultados
        IF nNumero == 0
            QOut("")
            QOut("-> Calculando resultados finais...")
            hb_idleSleep(0.8)
            EXIT
        ENDIF

        nTotal := nTotal + nNumero  // O acumulador recebe ele mesmo + o novo n£mero
        nQtd   := nQtd + 1          // O contador ganha mais 1 unidade de contagem

        QOut("Subtotal acumulado: " + AllTrim(Str(nTotal)))
        QOut("---------------------------------------")

    ENDDO 

    QOut("")
    QOut("======= RESULTADO =======")
    QOut("Soma Total dos Valores: " + AllTrim(Str(nTotal)))
    QOut("Quantidade de N£meros:  " + AllTrim(Str(nQtd)))
    QOut("=========================")
    QOut("")

RETURN NIL