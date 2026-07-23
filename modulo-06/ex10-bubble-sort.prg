FUNCTION Main()

    // Declaração de variáveis
    LOCAL aNumeros := {}
    LOCAL cEntrada := ""
    LOCAL nValor   := 0
    LOCAL i        := 0
    LOCAL cOpcao   := ""

    DO WHILE .T.

        // Limpa a tela
        OutStd( Chr(27) + "[2J" + Chr(27) + "[H" )
        aNumeros := {}

        // Cabeçalho
        QOut("==========================================")
        QOut("       DESAFIO: BUBBLE SORT MANUAL        ")
        QOut("==========================================")
        QOut("")

        // Leitura dos 10 números
        FOR i := 1 TO 10
            QOut("Digite o " + hb_ntos(i) + "o numero: ")
            ACCEPT TO cEntrada
            
            nValor := Val(AllTrim(cEntrada))
            AAdd(aNumeros, nValor)
        NEXT

        // Limpa a tela antes de exibir os resultados
        OutStd( Chr(27) + "[2J" + Chr(27) + "[H" )

        QOut("==========================================")
        QOut("            RESULTADO DA ORDENACAO        ")
        QOut("==========================================")
        QOut("")

        // Exibe o array original (antes da ordenação)
        OutStd("Vetor original:  ")
        FOR i := 1 TO Len(aNumeros)
            OutStd(hb_ntos(aNumeros[i]) + iif(i < Len(aNumeros), ", ", ""))
        NEXT
        QOut("")

        // Chamada da nossa função manual de ordenação
        BubbleSort(aNumeros)

        // Exibe o array após passar pelo BubbleSort
        OutStd("Vetor ordenado : ")
        FOR i := 1 TO Len(aNumeros)
            OutStd(hb_ntos(aNumeros[i]) + iif(i < Len(aNumeros), ", ", ""))
        NEXT
        QOut("")
        QOut("==========================================")
        QOut("")

        // Pergunta para reiniciar
        QOut("Deseja testar com novos numeros? (S/N): ")
        ACCEPT TO cOpcao

        IF Upper(AllTrim(cOpcao)) != "S"
            QOut("")
            QOut("Ate logo!")
            EXIT
        ENDIF

    ENDDO

RETURN NIL

// FUNÇÃO BUBBLE SORT (Sem usar ASort)
FUNCTION BubbleSort(aVetor)

    LOCAL nTamanho := Len(aVetor)
    LOCAL nTemp    := 0
    LOCAL i        := 0
    LOCAL j        := 0

    // Loop externo: controla quantas passadas serão feitas no array
    FOR i := 1 TO nTamanho - 1

        // Loop interno: compara cada elemento vizinho
        FOR j := 1 TO nTamanho - i

            // Se o elemento atual for MAIOR que o próximo, troca de lugar!
            IF aVetor[j] > aVetor[j + 1]

                // Troca (Swap) usando variável temporária
                nTemp         := aVetor[j]
                aVetor[j]     := aVetor[j + 1]
                aVetor[j + 1] := nTemp

            ENDIF

        NEXT

    NEXT

RETURN NIL