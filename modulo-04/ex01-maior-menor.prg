REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

// Declarando as variav?is

    LOCAL cNumero1 := ""
    LOCAL cNumero2 := ""

    LOCAL nNumero1 := 0
    LOCAL nNumero2 := 0

    HB_CDPSELECT("PT850")  // Ativa a acentua??o correta para o terminal CP 850

    QOut("==== MAIOR E MENOR NéMERO ====")
    QOut("")

// Pedindo ao  usu?rio para digitar dois n?meros

    ACCEPT "Digite o primeiro n£mero: " TO cNumero1
    ACCEPT "Digite o segundo n£mero: " TO cNumero2

// Convertendo os n?meros (string) que o usu?rio escolheu, para n?meros (inteiros) 

    nNumero1 := VAL(cNumero1)
    nNumero2 := VAL(cNumero2)
    
    QOut("")

// L?gica para comparar os n?meros e exibir o maior e o menor

    IF nNumero1 == nNumero2
        QOut("Os dois n£mero sÆo iguais!")
    ELSE
        // Entra aqui se forem diferentes, e faz uma nova pergunta
        IF nNumero1 > nNumero2
            QOut("O maior n£mero ‚: " + STR(nNumero1, 10, 2))
            QOut("O menor n£mero ‚: " + STR(nNumero2, 10, 2))
        ELSE
            QOut("O maior n£mero ‚: " + STR(nNumero2, 10, 2))
            QOut("O menor n£mero ‚: " + STR(nNumero1, 10, 2))
        ENDIF // <-- Este fecha o IF de dentro (nNumero1 > nNumero2)
        
    ENDIF // <-- Este fecha o IF de fora (nNumero1 == nNumero2)

    QOut("")
    QOut("Fim do programa!")
    QOut("=====================")
    QOut("")

RETURN NIL