 REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    LOCAL cNome := "Anna J£lia"
    LOCAL cCidade := "Sorocaba"
    LOCAL cCurso := "Harbour/ADVPL"

HB_CDPSELECT("PT850")

    CLEAR SCREEN

    QOut("================================")
    QOut("     FICHA DE APRESENTA€ÇO      ")
    QOut("================================")
    QOut("Nome: " + cNome)
    QOut("Cidade: " + cCidade)
    QOut("Curso: " + cCurso)
    QOut("================================")
    QOut("")

    WAIT "Pressione qualquer tecla para sair..."

RETURN NIL