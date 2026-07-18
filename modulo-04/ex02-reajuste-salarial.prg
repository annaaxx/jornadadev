REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    LOCAL cSalarioAtual := ""
    LOCAL nSalarioAtual := 0.00
    LOCAL nPercentual   := 0.00
    LOCAL nAumento      := 0.00
    LOCAL nNovoSalario  := 0.00

    HB_CDPSELECT("PT850")

    QOut("==== REAJUSTE SALARIAL ====")
    QOut("")

    ACCEPT "Qual ‚ o seu sal rio atual? R$ " TO cSalarioAtual
    QOut("")

    nSalarioAtual := VAL(cSalarioAtual)

    //Verificando as faixas e definindo APENAS a porcentagem
    IF nSalarioAtual < 1000
        nPercentual := 15
    ELSEIF nSalarioAtual <= 2000 // Repetimos a vari vel aqui
        nPercentual := 12
    ELSEIF nSalarioAtual <= 4000 // Repetimos a vari vel aqui
        nPercentual := 8
    ELSE                         // O ELSE fica sozinho, sem pergunta
        nPercentual := 5
    ENDIF

    //Fazendo as contas com a porcentagem que o IF descobriu
    nAumento     := nSalarioAtual * (nPercentual / 100)
    nNovoSalario := nSalarioAtual + nAumento

    //Exibindo os resultados formatados
    QOut("Sal rio Atual: R$ " + STR(nSalarioAtual, 10, 2))
    QOut("Percentual:       " + STR(nPercentual, 2, 0) + "%")
    QOut("Valor do Aumento: R$ " + STR(nAumento, 10, 2))
    QOut("Novo Sal rio:  R$ " + STR(nNovoSalario, 10, 2))
    QOut("")

RETURN NIL
