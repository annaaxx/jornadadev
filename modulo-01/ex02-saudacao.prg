REQUEST HB_CODEPAGE_PT850

// � a porta de entrada (pra iniciar o programa)
FUNCTION Main()


    // limpar o c�digo (no sentido do terminal), tira tudo para "reiniciar" o c�digo
    CLEAR SCREEN

    HB_CDPSELECT("PT850")


    // QOut � a fun��o que escreve na tela, o que estiver entre aspas ser� escrito. E ele tem uma quebra de linha autom�tica, ou seja, ele pula uma linha depois de escrever.
    QOut("Nome: Anna J�lia")
    QOut("Cidade: Sorocaba")
    QOut("Pronta para aprender ADVPL!")
    QOut("") // Apenas pula uma linha

    // esse WAIT � uma fun��o que faz o programa esperar at� que o usu�rio pressione qualquer tecla para continuar. � �til para que o usu�rio possa ler a mensagem antes do programa encerrar.
    WAIT "Pressione qualquer tecla para sair..."

// o RETURN NIL � necess�rio para finalizar a fun��o Main, que � a porta de entrada do programa. Sem ele, o programa n�o saberia quando terminar. 
RETURN NIL