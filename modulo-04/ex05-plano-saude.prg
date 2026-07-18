REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    //Variav‚is declaradas - string - usu rio
    LOCAL cIdade      := ""
    LOCAL cDependentes       := ""
    
    //Variav‚is declaradas - numeros inteiros
    LOCAL nIdade          := 0
    LOCAL nDependentes    := 0
    
    LOCAL nValorBase      := 0.00
    LOCAL nValorDepen      := 0.00
    LOCAL nValorTotal     := 0.00

    HB_CDPSELECT("PT850")

    QOut("==== SIMULADOR DE PLANO DE SAéDE ====")
    QOut("")

    //Perguntando a idade e convertendo para n£mero
    ACCEPT "Digite a idade do titular: " TO cIdade
    nIdade := VAL(cIdade)

    //Perguntando os dependentes e convertendo para n£mero
    ACCEPT "Digite a quantidade de dependentes: " TO cDependentes
    nDependentes := VAL(cDependentes)

    QOut("")

    // O Harbour lˆ de cima para baixo. O ELSEIF garante que nÆo precisamos testar o in¡cio da faixa.
    IF nIdade <= 25
        nValorBase := 180.00
    ELSEIF nIdade <= 40
        nValorBase := 260.00
    ELSEIF nIdade <= 60
        nValorBase := 380.00
    ELSE
        // Cai aqui se for acima de 60 anos
        nValorBase := 520.00
    ENDIF

    //Multiplicando cada dependente por R$ 90,00
    nValorDepen   := nDependentes * 90.00
    //Somando o valor do titular com o valor de todos os dependentes juntos
    nValorTotal := nValorBase + nValorDepen

    //Exibindo resultados
    QOut("=== RESUMO DA SIMULA€ÇO ===")
    QOut("Idade do Titular:   " + STR(nIdade, 3, 0) + " anos")
    QOut("N§ de Dependentes:  " + STR(nDependentes, 3, 0) + " pessoa(s)")
    QOut("---------------------------")
    QOut("Valor Base Titular: R$ " + STR(nValorBase, 10, 2))
    QOut("Total Dependentes:  R$ " + STR(nValorDepen, 10, 2))
    QOut("Valor Mensal Total: R$ " + STR(nValorTotal, 10, 2))
    QOut("===========================")
    QOut("")

RETURN NIL