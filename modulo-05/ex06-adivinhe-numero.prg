REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    LOCAL nSecret     := 0
    LOCAL nTentativa  := 0
    LOCAL cTempPalpite:= ""
    LOCAL nPalpite    := 0
    LOCAL lAcertou    := .F. //Vari†vel l¢gica (booleana) para controlar a vit¢ria

    HB_CDPSELECT("PT850")

    Cls
    QOut("=========================================")
    QOut("==== JOGO: ADIVINHE O NÈMERO SECRETO ====")
    QOut("=========================================")
    QOut("Estou pensando em um n£mero entre 1 e 100...")
    QOut("Vocà tem exatamente 7 tentativas para adivinhar!")
    QOut("-----------------------------------------")
    QOut("")

    //A funá∆o HB_RandomInt(min, max) gera um n£mero aleat¢rio inteiro no intervalo
    nSecret := HB_RandomInt(1, 100)

    FOR nTentativa := 1 TO 7

        QOut("-> TENTATIVA " + AllTrim(Str(nTentativa)) + " de 7")
        ACCEPT "Qual Ç o seu palpite? " TO cTempPalpite
        nPalpite := VAL(cTempPalpite)

        //Verificaá∆o do palpite
        IF nPalpite == nSecret
            QOut("")
            QOut("PARABêNS! Vocà acertou na tentativa " + AllTrim(Str(nTentativa)) + "!")
            lAcertou := .T.
            EXIT //Interrompe o FOR imediatamente, pois o jogo acabou
        
        ELSEIF nPalpite < nSecret
            QOut("Errado! Dica: O n£mero secreto Ç MAIOR que " + AllTrim(Str(nPalpite)) + ".")
        
        ELSE
            QOut("Errado! Dica: O n£mero secreto Ç MENOR que " + AllTrim(Str(nPalpite)) + ".")
        
        ENDIF

        QOut("-----------------------------------------")
        QOut("")
        hb_idleSleep(0.5) 

    NEXT

    //Se o FOR terminou todas as 7 voltas e lAcertou continua FALSO, o jogador perdeu
    IF .NOT. lAcertou
        QOut("Suas tentativas acabaram!")
        QOut("GAME OVER! Vocà n∆o conseguiu adivinhar.")
        QOut("O n£mero secreto era: " + AllTrim(Str(nSecret)))
        QOut("=========================================")
        QOut("")
    ENDIF

RETURN NIL