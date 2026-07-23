FUNCTION Main()

    LOCAL aNumeros := {}
    LOCAL cEntrada := ""
    LOCAL nValor   := 0
    LOCAL nSoma    := 0
    LOCAL nMedia   := 0.0
    LOCAL nMenor   := 0
    LOCAL nMaior   := 0
    LOCAL i        := 0
    LOCAL cOpcao   := ""

    DO WHILE .T.

        // Limpa a tela
        OutStd( Chr(27) + "[2J" + Chr(27) + "[H" )
        aNumeros := {}
        nSoma    := 0

        // Cabeçalho
        QOut("==========================================")
        QOut("        ESTATISTICAS DE 10 NUMEROS        ")
        QOut("==========================================")
        QOut("")

        // Leitura dos 10 números em linhas separadas
        FOR i := 1 TO 10
            QOut("Digite o " + hb_ntos(i) + "o numero: ")
            ACCEPT TO cEntrada
            
            nValor := Val(AllTrim(cEntrada))
            AAdd(aNumeros, nValor)
            nSoma += nValor
        NEXT

        // Cálculo da Média
        nMedia := nSoma / Len(aNumeros)

        // Ordenação do array em ordem crescente
        ASort(aNumeros)

        nMenor := aNumeros[1]
        nMaior := aNumeros[Len(aNumeros)]

        // Exibição dos Resultados
        QOut("")
        QOut("==========================================")
        QOut("               RESULTADOS                 ")
        QOut("==========================================")
        
        // Exibe o array ordenado
        OutStd("Numeros em ordem crescente: ")
        FOR i := 1 TO Len(aNumeros)
            OutStd(hb_ntos(aNumeros[i]) + iif(i < Len(aNumeros), ", ", ""))
        NEXT
        QOut("")

        QOut("Soma total : " + hb_ntos(nSoma))
        QOut("Media      : " + Transform(nMedia, "@N 999,999.99"))
        QOut("Menor valor: " + hb_ntos(nMenor))
        QOut("Maior valor: " + hb_ntos(nMaior))
        QOut("==========================================")
        QOut("")

        // Pergunta para reiniciar
        QOut("Deseja executar novamente? (S/N): ")
        ACCEPT TO cOpcao

        IF Upper(AllTrim(cOpcao)) != "S"
            QOut("")
            QOut("Ate logo!")
            EXIT
        ENDIF

    ENDDO

RETURN NIL