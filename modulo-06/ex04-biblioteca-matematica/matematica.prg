// BIBLIOTECA DE FUNÇÕES MATEMÁTICAS

// 1. FATORIAL: Calcula o fatorial de N
FUNCTION FatorialN( nN )
    LOCAL nFat := 1
    LOCAL nI   := 0

    IF nN < 0
        RETURN 0
    ENDIF

    FOR nI := 1 TO nN
        nFat := nFat * nI
    NEXT

RETURN Int( nFat )


// 2. É PRIMO: Retorna .T. se N for primo e .F. caso contrário
FUNCTION EhPrimo( nN )
    LOCAL lPrimo := .T.
    LOCAL nI     := 0

    IF nN <= 1
        RETURN .F.
    ENDIF

    FOR nI := 2 TO ( nN - 1 )
        IF nN % nI == 0
            lPrimo := .F.
            EXIT
        ENDIF
    NEXT

RETURN lPrimo


// 3. MÁXIMO DIVISOR COMUM (MDC)
FUNCTION MDC( nA, nB )
    LOCAL nResto := 0

    WHILE nB != 0
        nResto := nA % nB
        nA     := nB
        nB     := nResto
    ENDDO

RETURN Int( nA ) // Força o retorno sem casas decimais


// 4. MÍNIMO MÚLTIPLO COMUM (MMC)
FUNCTION MMC( nA, nB )
    LOCAL nResultado := 0

    IF nA == 0 .OR. nB == 0
        RETURN 0
    ENDIF

    nResultado := ( nA * nB ) / MDC( nA, nB )

RETURN Int( nResultado ) // Força o retorno sem casas decimais