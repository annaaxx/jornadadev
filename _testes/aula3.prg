REQUEST HB_CODEPAGE_UTF8

FUNCTION Main()

    LOCAL nA
    LOCAL nB
    LOCAL cA
    LOCAL cB

    hb_cdpSelect("UTF8")

    ACCEPT "Digite o primeiro n£mero: " TO cA
    ACCEPT "Digite o segundo n£mero: " TO cB

    nA := Val(cA)
    nB := Val(cB)

    QOut("")
    QOut("===== RESULTADOS =====")
    QOut("Soma: " + Str(nA + nB, 10, 2))
    QOut("Subtracao: " + Str(nA - nB, 10, 2))
    QOut("Multiplicacao: " + Str(nA * nB, 10, 2))

    IF nB <> 0
        QOut("Divisao: " + Str(nA / nB, 10, 2))
    ELSE
        QOut("Nao e poss¡vel dividir por zero.")
    ENDIF

RETURN NIL