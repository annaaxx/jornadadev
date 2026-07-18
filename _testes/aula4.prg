FUNCTION Main()

    //Declarando as variáveis (estão em 0 quem irá recer os valores digitados pelo usuário e em "" as que irão receber os valores digitados pelo usuário porém por string e .T. as que irão receber valores booleanos que serão utilizados para controle de fluxo)
    LOCAL cOpcao       := ""
    LOCAL cTempQtd     := ""
    LOCAL nQuantidade  := 0
    LOCAL nPrecoUnit   := 0.00
    LOCAL nTotalBruto  := 0.00
    LOCAL nDesconto    := 0.00
    LOCAL nTotalFinal  := 0.00
    LOCAL lOpcaoValida := .T.

    //Exibindo o cardápio formatado na tela
    QOut( "=== LANCHONETE DEV ===" )
    QOut( "1 - Hamburguer .... R$ 18,00" )
    QOut( "2 - Batata frita .. R$ 12,00" )
    QOut( "3 - Refrigerante ... R$  7,00" )
    QOut( "0 - Sair" )
    QOut( "======================" )
    QOut( "" )

    //Lendo a opção do cliente com o ACCEPT
    ACCEPT "Escolha uma opcao: " TO cOpcao

    //Estrutura DO CASE para verificar o item escolhido e definir o preço unitário
    // DO CASE é uma estrutura de controle de fluxo que permite executar diferentes blocos de código com base no valor de uma expressão. Neste caso, a expressão é a variável cOpcao, que contém a opção escolhida pelo usuário.
    DO CASE
        CASE cOpcao == "1" // Se a opção escolhida for "1", o preço unitário é definido como 18.00 e uma mensagem é exibida informando que o usuário escolheu Hamburguer.
            nPrecoUnit := 18.00
            QOut( "Voce escolheu: Hamburguer" )  // Esta parte do código exibe uma mensagem informando ao usuário qual item ele escolheu, com base na opção digitada.

        CASE cOpcao == "2"
            nPrecoUnit := 12.00
            QOut( "Voce escolheu: Batata frita" )

        CASE cOpcao == "3"
            nPrecoUnit := 7.00
            QOut( "Voce escolheu: Refrigerante" )

        CASE cOpcao == "0"
            QOut( "Ate logo!" )
            lOpcaoValida := .F. // Define como falso para não pedir quantidade nem calcular nada

        OTHERWISE // OTHERWISE é usado para capturar qualquer caso que não tenha sido tratado pelos CASEs anteriores. Neste caso, se o usuário digitar uma opção inválida, será exibida uma mensagem de erro e a variável lOpcaoValida será definida como falsa para evitar que o programa continue com um item incorreto.
            QOut( "Opcao invalida!" )
            lOpcaoValida := .F. // Define como falso para não processar um item incorreto
    ENDCASE // ENDCASE é usado para indicar o final da estrutura DO CASE.

    //Incremento (Se a opção escolhida foi válida e diferente de Sair)
    IF lOpcaoValida
        QOut( "" )
        ACCEPT "Digite a quantidade desejada: " TO cTempQtd
        nQuantidade := VAL(cTempQtd)

        // Calcula o valor total sem desconto
        nTotalBruto := nPrecoUnit * nQuantidade

        // Estrutura IF para aplicar o desconto de 10% se passar de R$ 50,00
        IF nTotalBruto > 50.00
            nDesconto := nTotalBruto * 0.10 // 10% de desconto
            QOut( "Parabens! Voce ganhou 10% de desconto (Sua compra passou de R$ 50,00)" )
        ENDIF

        // Calcula o valor a pagar
        nTotalFinal := nTotalBruto - nDesconto

        // Exibe o resumo do pedido do cliente
        QOut( "" )
        QOut( "=== RESUMO DO PEDIDO ===" )
        QOut( "Total Bruto: R$ " + Str(nTotalBruto, 10, 2) )
        QOut( "Desconto:    R$ " + Str(nDesconto, 10, 2) )
        QOut( "Total Pagar: R$ " + Str(nTotalFinal, 10, 2) )
        QOut( "========================" )
    ENDIF

    QOut( "" )

RETURN NIL