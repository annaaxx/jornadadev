REQUEST HB_CODEPAGE_PT850 // configurando acentuaá∆o

FUNCTION Main()

    // Vari†veis declaradas (string - usu†rio)
    LOCAL cNumero1   := ""
    LOCAL cOperacao   := ""
    LOCAL cNumero2   := ""

    //Vari†veis para os c†lculos (De String para N£meros convertidos)
    LOCAL nNum1       := 0.00
    LOCAL nNum2       := 0.00
    LOCAL nResultado  := 0.00

    //Vari†vel de controle para saber se tudo deu certo
    LOCAL lContaValida := .T.

    HB_CDPSELECT("PT850")

    QOut("==== CALCULADORA DEV ====")
    QOut("")

    //Pegamos o primeiro n£mero
    ACCEPT "Digite o primeiro n£mero: " TO cNumero1
    nNum1 := VAL(cNumero1)

    //Pegamos a operaá∆o desejada
    ACCEPT "Escolha a operaá∆o (+, -, *, /, ^, R (Raiz Quadrada)): " TO cOperacao

    //SE a operaá∆o n∆o for Raiz Quadrada ("R"), precisamos do segundo n£mero
    IF cOperacao != "R (Raiz Quadrada)" .AND. cOperacao != "r"
        ACCEPT "Digite o segundo n£mero: " TO cNumero2
        nNum2 := VAL(cNumero2)
    ENDIF

    QOut("")

    // Estrutura DO CASE Ç serve para quando vocà precisa testar uma £nica vari†vel contra v†rios valores espec°ficos e fixos.

    DO CASE
        CASE cOperacao == "+"
            nResultado := nNum1 + nNum2

        CASE cOperacao == "-"
            nResultado := nNum1 - nNum2

        CASE cOperacao == "*"
            nResultado := nNum1 * nNum2

        CASE cOperacao == "/"
            //Proteá∆o para n∆o quebrar o programa dividindo por zero
            IF nNum2 == 0
                QOut("Erro: N∆o Ç poss°vel dividir por zero!")
                lContaValida := .F.
            ELSE
                nResultado := nNum1 / nNum2
            ENDIF

        CASE cOperacao == "^"
            nResultado := nNum1 ^ nNum2

        CASE cOperacao == "R (Raiz Quadrada)" .OR. cOperacao == "r"
            nResultado := Sqrt(nNum1)

        OTHERWISE 
            QOut("Erro: Operaá∆o inv†lida!")
            lContaValida := .F.
    ENDCASE

    //Se a conta for v†lida, exibe o resultado final
    IF lContaValida
        QOut("Resultado final: " + STR(nResultado, 12, 2))
    ENDIF

    QOut("")
    QOut("=========================")

RETURN NIL