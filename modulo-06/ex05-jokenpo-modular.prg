FUNCTION Main()

    // Declaração de variáveis locais com escopo restrito à Main()
    LOCAL cJogadaUser := ""  // Armazena a jogada digitada pelo usuário ("P", "A" ou "T")
    LOCAL cJogadaCPU  := ""  // Armazena a jogada sorteada para o computador ("P", "A" ou "T")
    LOCAL cResultado  := ""  // Armazena a mensagem com o resultado ("VOCE VENCEU!", etc.)
    LOCAL cOpcao      := ""  // Armazena a resposta do usuário para continuar a partida (S/N)

    // Inicializa o gerador de números aleatórios do Harbour
    hb_RandomSeed()

    // Laço de repetição principal (mantém o jogo ativo até o jogador decidir sair)
    DO WHILE .T.

        // Envia comando ANSI para limpar o console sem perder o histórico do terminal
        OutStd( Chr(27) + "[2J" + Chr(27) + "[H" )

        // Exibição do cabeçalho do jogo
        OutStd("==========================================" + hb_eol())
        OutStd("            JOGO DO JOKENPO               " + hb_eol())
        OutStd("==========================================" + hb_eol())
        OutStd("[P] Pedra | [A] Papel | [T] Tesoura" + hb_eol())
        OutStd("==========================================" + hb_eol() + hb_eol())

        // Leitura da opção inserida pelo jogador
        OutStd("Sua jogada: ")
        ACCEPT TO cJogadaUser

        // Remove espaços antes/depois da string e converte o caractere para maiúsculo
        cJogadaUser := Upper(AllTrim(cJogadaUser))

        // Validação da jogada através da função dedicada ValidarJogada()
        IF .NOT. ValidarJogada(cJogadaUser)
            OutStd(hb_eol() + "Opcao invalida! Digite apenas P, A ou T." + hb_eol())
            OutStd("Pressione Enter para tentar de novo...")
            ACCEPT TO cOpcao
            LOOP // Reinicia o loop DO WHILE do início
        ENDIF

        // Chamada da função para sortear a jogada do computador
        cJogadaCPU := SortearJogadaCPU()

        // Exibição das escolhas formatadas com o nome por extenso
        OutStd(hb_eol() + "------------------------------------------" + hb_eol())
        OutStd("Voce escolheu : " + ConverterNome(cJogadaUser) + hb_eol())
        OutStd("CPU escolheu  : " + ConverterNome(cJogadaCPU) + hb_eol())
        OutStd("------------------------------------------" + hb_eol())

        // Chamada da função que avalia as regras e determina o vencedor
        cResultado := DefinirVencedor(cJogadaUser, cJogadaCPU)
        OutStd("RESULTADO     : " + cResultado + hb_eol())
        OutStd("------------------------------------------" + hb_eol() + hb_eol())

        // Confirmação para reiniciar a partida
        OutStd("Deseja jogar novamente? (S/N): ")
        ACCEPT TO cOpcao
        
        // Se a resposta não for "S", encerra o laço de repetição
        IF Upper(AllTrim(cOpcao)) != "S"
            OutStd(hb_eol() + "Valeu por jogar! Ate a proxima." + hb_eol())
            EXIT // Sai do loop DO WHILE e finaliza o programa
        ENDIF

    ENDDO

RETURN NIL

// FUNÇÕES AUXILIARES / MODULARES

// Sorteia aleatoriamente a escolha da CPU entre Pedra, Papel e Tesoura
FUNCTION SortearJogadaCPU()
    // Gera um número inteiro pseudoaleatório entre 1 e 3
    LOCAL nSorteio := hb_RandomInt(1, 3) 
    LOCAL cJogada  := ""

    // Mapeia o número sorteado para a letra correspondente
    DO CASE
        CASE nSorteio == 1
            cJogada := "P" // 1 = Pedra
        CASE nSorteio == 2
            cJogada := "A" // 2 = Papel
        CASE nSorteio == 3
            cJogada := "T" // 3 = Tesoura
    ENDCASE

RETURN cJogada


// Valida se o valor inserido pelo usuário contém exatamente um caractere permitido
FUNCTION ValidarJogada( cJogada )
    // Retorna .T. se a string estiver contida em "PAT" e possuir tamanho de 1 caractere
RETURN ( cJogada $ "PAT" .AND. Len(cJogada) == 1 )


// Aplica as regras de vitória do Jokenpô entre o jogador e a CPU
FUNCTION DefinirVencedor( cJogada1, cJogada2 )
    LOCAL cVencedor := ""

    // Caso de escolhas idênticas
    IF cJogada1 == cJogada2
        RETURN "EMPATE!"
    ENDIF

    // Avalia os cenários de vitória do jogador (cJogada1)
    DO CASE
        CASE cJogada1 == "P" .AND. cJogada2 == "T" // Pedra vence Tesoura
            cVencedor := "VOCE VENCEU!"

        CASE cJogada1 == "A" .AND. cJogada2 == "P" // Papel vence Pedra
            cVencedor := "VOCE VENCEU!"

        CASE cJogada1 == "T" .AND. cJogada2 == "A" // Tesoura vence Papel
            cVencedor := "VOCE VENCEU!"

        OTHERWISE // Qualquer outra combinação resulta em vitória da CPU
            cVencedor := "CPU VENCEU!"
    ENDCASE

RETURN cVencedor


// Converte os códigos "P", "A" e "T" em suas descrições por extenso
FUNCTION ConverterNome( cCodigo )
    IF cCodigo == "P" ; RETURN "Pedra"   ; ENDIF
    IF cCodigo == "A" ; RETURN "Papel"   ; ENDIF
    IF cCodigo == "T" ; RETURN "Tesoura" ; ENDIF
RETURN ""