FUNCTION Main()

    //Criando as vari veis para guardar as notas que o usu rio digitar (como texto)
    LOCAL cNota1 := ""
    LOCAL cNota2 := ""
    LOCAL cNota3 := ""
    LOCAL cNota4 := ""

    //Criando as vari veis para as notas em formato de n£mero
    LOCAL nNota1     := 0.00
    LOCAL nNota2     := 0.00
    LOCAL nNota3     := 0.00
    LOCAL nNota4     := 0.00

    //Criamos a vari vel para guardar o resultado final da m‚dia
    LOCAL nMedia := 0.00

    QOut( "=== CALCULADORA DE MEDIA PONDERADA ===" )
    QOut( "" )

    //Ir  pedimos as 4 notas ao usu rio (elas entram como texto nas vari veis 'cNota')
    ACCEPT "Digite a nota do 1 Bimestre: " TO cNota1
    ACCEPT "Digite a nota do 2 Bimestre: " TO cNota2
    ACCEPT "Digite a nota do 3 Bimestre: " TO cNota3
    ACCEPT "Digite a nota do 4 Bimestre: " TO cNota4

    //Convertemos todos os textos para n£meros decimais usando VAL()
    nNota1 := VAL(cNota1)
    nNota2 := VAL(cNota2)
    nNota3 := VAL(cNota3)
    nNota4 := VAL(cNota4)

    //Fazer o c lculo da m‚dia:
    nMedia := ( (nNota1 * 1) + (nNota2 * 2) + (nNota3 * 3) + (nNota4 * 4) ) / 10

    QOut( "" )
    //Mostrando o resultado final formatado com 2 casas decimais usando Str(valor, tamanho, decimais)
    QOut( "A media ponderada do aluno e: " + Str(nMedia, 10, 2) )
    QOut( "" )

RETURN NIL