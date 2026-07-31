/*/{Protheus.doc} Main
Exercício 5 - Tratamento de Erros em Harbour Puro (BEGIN SEQUENCE / RECOVER)
@author     Anna Julia
@since      30/07/2026
/*/
FUNCTION Main()
    LOCAL nA := 10, nB := 0, nRes
    LOCAL bErrorOld, oErroCapturado

    QOut("=== Inicio do Teste de Tratamento de Erros ===")

    // Redireciona o tratamento de erros do Harbour para o BEGIN SEQUENCE
    bErrorOld := ErrorBlock({ |oErr| Break(oErr) })

    BEGIN SEQUENCE
        // Provoca a divisao por zero
        nRes := nA / nB
        QOut("Resultado: " + Str(nRes))

    RECOVER WITH oErroCapturado
        // Bloco executado quando o erro e capturado
        IF ValType(oErroCapturado) == "O"
            QOut("Erro capturado com sucesso: " + AllTrim(oErroCapturado:Description))
        ELSE
            QOut("Erro capturado (operacao invalida na divisao por zero).")
        ENDIF
    END SEQUENCE

    // Restaura o bloco de erro padrao
    ErrorBlock(bErrorOld)

    QOut("O programa continua de pe!")
    QOut("=== Fim do Programa ===")

RETURN NIL