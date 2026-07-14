// Ç a porta de entrada (pra iniciar o programa)
FUNCTION Main()

    // limpar o c¢digo (no sentido do terminal), tira tudo para "reiniciar" o c¢digo
    CLEAR SCREEN

    // QOut Ç a funá∆o que escreve na tela, o que estiver entre aspas ser† escrito. E ele tem uma quebra de linha autom†tica, ou seja, ele pula uma linha depois de escrever.
    QOut("Nome: Anna J£lia")
    QOut("Cidade: Sorocaba")
    QOut("Pronta para aprender ADVPL!")
    QOut("") // Apenas pula uma linha

    // esse WAIT Ç uma funá∆o que faz o programa esperar atÇ que o usu†rio pressione qualquer tecla para continuar. ê £til para que o usu†rio possa ler a mensagem antes do programa encerrar.
    WAIT "Pressione qualquer tecla para sair..."

// o RETURN NIL Ç necess†rio para finalizar a funá∆o Main, que Ç a porta de entrada do programa. Sem ele, o programa n∆o saberia quando terminar. 
RETURN NIL