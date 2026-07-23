FUNCTION Main()

    // Cria a variável aDias (Array) e inicializa com os 7 dias da semana
    // O Harbour utiliza índice baseado em 1 (aDias[1] = "Domingo", etc.)
    LOCAL aDias     := { "Domingo", "Segunda-feira", "Terca-feira", "Quarta-feira", "Quinta-feira", "Sexta-feira", "Sabado" }
    
    // Declara cEntrada para armazenar o texto bruto digitado pelo usuário
    LOCAL cEntrada  := ""
    
    // Declara nIndice para armazenar o valor convertido em número inteiro
    LOCAL nIndice   := 0
    
    // Declara cOpcao para capturar a resposta da pergunta de continuação (S/N)
    LOCAL cOpcao    := ""

    // Inicia um laço de repetição infinito (.T.) que só para com o comando EXIT
    DO WHILE .T.

        // Envia a sequência de escape ANSI para limpar a tela do terminal
        OutStd( Chr(27) + "[2J" + Chr(27) + "[H" )

        // Imprime o cabeçalho formatado na saída padrão do terminal
        OutStd("==========================================" + hb_eol())
        OutStd("      CONSULTA DE DIA DA SEMANA           " + hb_eol())
        OutStd("==========================================" + hb_eol() + hb_eol())

        // Solicita ao usuário a digitação do número correspondente ao dia
        OutStd("Digite um numero de 1 a 7: ")
        
        // Pausa o programa, captura a entrada do teclado e salva em cEntrada
        ACCEPT TO cEntrada

        // Remove os espaços com AllTrim() e converte o texto para número com Val()
        nIndice := Val(AllTrim(cEntrada))

        // Valida se o número digitado está fora do limite permitido (menor que 1 ou maior que 7)
        IF nIndice < 1 .OR. nIndice > 7
            // Se for inválido, exibe a mensagem de erro
            OutStd(hb_eol() + "Erro: Numero invalido! Por favor, digite um valor entre 1 e 7." + hb_eol())
        ELSE
            // Se for válido, busca a posição no vetor aDias[nIndice] e exibe na tela
            OutStd(hb_eol() + "O dia " + hb_ntos(nIndice) + " corresponde a: " + aDias[nIndice] + hb_eol())
        ENDIF

        // Exibe uma linha divisória para organizar a tela
        OutStd(hb_eol() + "------------------------------------------" + hb_eol())
        
        // Pergunta se o usuário deseja realizar uma nova consulta
        OutStd("Deseja consultar outro dia? (S/N): ")
        
        // Lê a opção do usuário
        ACCEPT TO cOpcao

        // Trata a entrada (limpa espaços e põe em maiúscula) e checa se é diferente de "S"
        IF Upper(AllTrim(cOpcao)) != "S"
            // Exibe mensagem de encerramento
            OutStd(hb_eol() + "Ate logo!" + hb_eol())
            
            // Encerra o laço DO WHILE
            EXIT
        ENDIF

    // Fim do bloco do laço principal
    ENDDO

RETURN NIL