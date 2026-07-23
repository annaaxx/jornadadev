REQUEST HB_CODEPAGE_PT850 

// Declaraá∆o da funá∆o principal (o gerente que orquestra o programa)
FUNCTION Main()

    // Declaraá∆o das vari†veis locais para guardar os valores numÇricos
    LOCAL nNum1        := 0.00
    LOCAL nNum2        := 0.00

    // Declaraá∆o da vari†vel para guardar a operaá∆o escolhida pelo usu†rio (+, -, *, etc.)
    LOCAL cOperacao    := ""

    // Declaraá∆o da vari†vel para guardar o resultado do c†lculo
    LOCAL nResultado   := 0.00

    // Declaraá∆o da vari†vel booleana de controle (comeáa verdadeira .T.)
    LOCAL lContaValida := .T.

    HB_CDPSELECT("PT850")

    // T°tulo
    QOut("==== CALCULADORA DEV ====")
    QOut("")

    // Chama a funá∆o LerNumero() para ler e converter o primeiro valor
    nNum1 := LerNumero("Digite o primeiro n£mero: ")

    // Pede para o usu†rio digitar qual operaá∆o matem†tica ele deseja
    ACCEPT "Escolha a operaá∆o (+, -, *, /, ^, R (Raiz Quadrada)): " TO cOperacao

    // Verifica se a operaá∆o N«O Ç Raiz Quadrada (tanto mai£scula quanto min£scula)
    IF Upper(cOperacao) != "R" .AND. cOperacao != "R (Raiz Quadrada)"
        // Se precisar do segundo n£mero, chama LerNumero() novamente
        nNum2 := LerNumero("Digite o segundo n£mero: ")
    ENDIF

    // Pula uma linha no console
    QOut("")

    // Chama a funá∆o Calcular() passando os n£meros, operador e a vari†vel @nResultado por referància.
    // Guarda na vari†vel 'lContaValida' o retorno booleano (.T. ou .F.)
    lContaValida := Calcular( nNum1, nNum2, cOperacao, @nResultado )

    // Chama o procedimento de exibiá∆o passando o resultado e o status da conta
    MostrarResultado( nResultado, lContaValida )

// Encerra a funá∆o Main()
RETURN NIL


//FUNÄ«O 1: Là a mensagem do console e converte o texto do usu†rio para N£mero
FUNCTION LerNumero( cMensagem )

    // Vari†vel local para receber o texto puro do teclado
    LOCAL cEntrada := ""

    // Vari†vel local para receber o valor convertido em n£mero
    LOCAL nValor   := 0

    // Exibe a mensagem de prompt e guarda o que foi digitado em cEntrada
    ACCEPT cMensagem TO cEntrada

    // Converte a string digitada para um n£mero real usando a funá∆o nativa VAL()
    nValor := VAL( cEntrada )

// Retorna o valor numÇrico para quem chamou a funá∆o
RETURN nValor

// FUNÄ«O 2: Executa a operaá∆o matem†tica
// Retorna .T. em caso de sucesso e .F. em erro (como divis∆o por zero)
FUNCTION Calcular( n1, n2, cOp, nResultado )

    // Vari†vel de controle do c†lculo (inicia como verdadeira .T.)
    LOCAL lSucesso := .T.

    // Estrutura condicional para testar a operaá∆o digitada
    DO CASE

        // Caso seja soma
        CASE cOp == "+"
            nResultado := n1 + n2

        // Caso seja subtraá∆o
        CASE cOp == "-"
            nResultado := n1 - n2

        // Caso seja multiplicaá∆o
        CASE cOp == "*"
            nResultado := n1 * n2

        // Caso seja divis∆o
        CASE cOp == "/"
            // Proteá∆o/Validaá∆o de divis∆o por zero!
            IF n2 == 0
                QOut("Erro: N∆o Ç poss°vel dividir por zero!")
                // Altera a vari†vel de sucesso para Falso
                lSucesso := .F.
            ELSE
                nResultado := n1 / n2
            ENDIF

        // Caso seja potenciaá∆o
        CASE cOp == "^"
            nResultado := n1 ^ n2

        // Caso seja Raiz Quadrada
        CASE Upper(cOp) == "R" .OR. cOp == "R (Raiz Quadrada)"
            nResultado := Sqrt(n1)

        // Se o operador digitado for inv†lido
        OTHERWISE 
            QOut("Erro: Operaá∆o inv†lida!")
            lSucesso := .F.

    // Fim do bloco DO CASE
    ENDCASE

// Retorna .T. (sucesso) ou .F. (erro) para a funá∆o Main()
RETURN lSucesso

// FUNÄ«O 3: Exibe o resultado final se a conta for v†lida
FUNCTION MostrarResultado( nResultado, lContaValida )

    // Testa se a vari†vel de controle recebida Ç verdadeira
    IF lContaValida
        // Exibe formatado com 12 d°gitos totais e 2 casas decimais
        QOut("Resultado final: " + STR(nResultado, 12, 2))
    ENDIF

    // Pula uma linha no console
    QOut("")

    // Exibe a linha de fechamento visual
    QOut("=========================")

// Finaliza o procedimento sem retornar valores
RETURN NIL