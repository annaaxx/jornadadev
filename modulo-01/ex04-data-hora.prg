FUNCTION Main()

    LOCAL cNome := "Anna J£lia"
    LOCAL cCidade := "Sorocaba"
    LOCAL cCurso := "Harbour/ADVPL"
    LOCAL cData := Dtoc(Date()) // Dtoc ‚ uma fun‡ao que converte a data do sistema para o formato de texto (Character), ou seja, transforma a data em uma string. A fun‡ao Date() retorna a data atual do sistema, e Dtoc(Date()) converte essa data para o formato de texto.
    LOCAL cHora := Time() // Time() uma fun‡ao que retorna a hora atual do sistema no formato de texto (Character), ou seja, transforma a hora em uma string.


    CLEAR SCREEN

    QOut("================================")
    QOut("     FICHA DE APRESENTA€ÇO      ")
    QOut("================================")
    QOut("Nome: " + cNome)
    QOut("Cidade: " + cCidade)
    QOut("Curso: " + cCurso)
    QOut("Data: " + cData)
    QOut("Hora: " + cHora)
    QOut("================================")
    QOut("")

    WAIT "Pressione qualquer tecla para sair..."

RETURN NIL