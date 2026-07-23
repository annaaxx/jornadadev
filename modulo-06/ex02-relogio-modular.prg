REQUEST HB_CODEPAGE_PT850

FUNCTION Main() // Fun‡Æo principal (o maestro/gerente)

    LOCAL nI := 0 // Vari vel para controlar o loop

    // Cria a vari vel 'cHoraBruta' como texto vazio para receber o retorno de ObterHora()
    LOCAL cHoraBruta := "" 

    // Cria a vari vel 'cHoraTexto' como texto vazio para receber o retorno de FormatarHora()
    LOCAL cHoraTexto := ""

    HB_CDPSELECT("PT850")

    // Inicia o la‡o 'FOR', fazendo a vari vel 'nI' contar de 1 at‚ 30 (repetindo 30 vezes)
    FOR nI := 1 TO 30

        // Limpa todo o conte£do do terminal a cada repeti‡Æo
        Cls // Limpa a tela a cada segundo para atualizar a hora no mesmo lugar

        // Exibe o t¡tulo superior do rel¢gio na tela
        QOut("======= RELàGIO MODULAR =======") // T¡tulo

        // Pula uma linha no console para dar espa‡amento visual
        QOut("")

        // Chama 'ObterHora()', pega o valor retornado ("HH:MM:SS") e guarda em 'cHoraBruta'
        cHoraBruta := ObterHora()

        // Passa 'cHoraBruta' para 'FormatarHora()', pega o texto formatado e guarda em 'cHoraTexto'
        cHoraTexto := FormatarHora( cHoraBruta )

        // Passa o texto formatado para 'ExibirHora()' para ser impresso na tela
        ExibirHora( cHoraTexto )

        // Congela a execu‡Æo do programa por 1 segundo antes de ir para a pr¢xima volta do loop
        hb_idleSleep( 1 )

    // Indica o fim do bloco do la‡o 'FOR' e incrementa 'nI'
    NEXT

// Finaliza a fun‡Æo Main() retornando o valor nulo (NIL)
RETURN NIL


// Declara‡Æo da fun‡Æo respons vel por buscar a hora do computador
FUNCTION ObterHora() // Primeira fun‡Æo, obtendo a hora 

    // Retorna a string de hora do sistema obtida pela fun‡Æo nativa Time()
    RETURN Time()


// Declara‡Æo da fun‡Æo que recebe a hora bruta pelo parƒmetro 'cHora'
FUNCTION FormatarHora( cHora ) // Segunda fun‡Æo, formatando a hora para HH:MM:SS

    // Declara a vari vel local 'cHoraFormatada' iniciando como texto vazio
    LOCAL cHoraFormatada := ""
    
    // Concatena (junta) o texto fixo com o valor da vari vel 'cHora' recebida
    cHoraFormatada := "Hor rio Atual: [ " + cHora + " ]" 

// Retorna a frase completa j  montada para quem chamou a fun‡Æo
RETURN cHoraFormatada // Retorna o valor da hora formatada


// Declara‡Æo do procedimento que recebe a hora formatada pelo parƒmetro 'cHoraFormatada'
FUNCTION ExibirHora( cHoraFormatada ) // Terceira fun‡Æo, exibe o texto no console

    // Imprime na tela o texto formatado recebido
    QOut( cHoraFormatada )

// Finaliza a execu‡Æo sem retornar nenhum valor (atuando como procedimento)
RETURN NIL