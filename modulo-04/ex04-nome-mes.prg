REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    //Declarando vari†veis - string - usu†rio
    LOCAL cMes := ""  // Guarda o texto puro que o usu†rio vai digitar
    LOCAL nMes := 0   // Guarda o n£mero convertido ap¢s passarmos o texto pelo VAL()
    LOCAL cNomeMes := ""  // Guarda o texto com o nome do màs encontrado dentro do DO CASE

    HB_CDPSELECT("PT850")

    QOut("==== NOME DO M“S ====")
    QOut("")

    // Tudo que o usu†rio digita entra como STRING (Texto) dentro da vari†vel cTempMes
    ACCEPT "Digite o n£mero do màs (1 a 12): " TO cMes
  
    nMes := VAL(cMes)

    QOut("") 

    // O DO CASE avalia a vari†vel 'nMes' e vai descendo testando linha por linha.
    // Assim que ele encontra o n£mero correto, ele executa a linha de dentro e PULA para o ENDCASE.
    DO CASE
        CASE nMes == 1
            cNomeMes := "Janeiro"
        CASE nMes == 2
            cNomeMes := "Fevereiro"
        CASE nMes == 3
            cNomeMes := "Maráo"
        CASE nMes == 4
            cNomeMes := "Abril"
        CASE nMes == 5
            cNomeMes := "Maio"
        CASE nMes == 6
            cNomeMes := "Junho"
        CASE nMes == 7
            cNomeMes := "Julho"
        CASE nMes == 8
            cNomeMes := "Agosto"
        CASE nMes == 9
            cNomeMes := "Setembro"
        CASE nMes == 10
            cNomeMes := "Outubro"
        CASE nMes == 11
            cNomeMes := "Novembro"
        CASE nMes == 12
            cNomeMes := "Dezembro"
            
        OTHERWISE
            // O OTHERWISE Ç a nossa 'rede de seguranáa'. Se o usu†rio digitou 0, 15, ou -5,
            // nenhum CASE ali de cima vai ser verdadeiro. Ent∆o o programa cai direto aqui.
            cNomeMes := "Màs inv†lido"
    ENDCASE // Fim do bloco de seleá∆o m£ltipla

    // Usamos um IF simples para decidir como mostrar a resposta para o usu†rio
    IF cNomeMes == "Màs inv†lido"
        // Se a vari†vel guardou o texto de erro do OTHERWISE, mostra um aviso de erro
        QOut("Erro: " + cNomeMes)
    ELSE
        //Se continha um màs de 1 a 12 v†lido, exibe o nome do màs bonitinho
        QOut("O màs correspondente Ç: " + cNomeMes)
    ENDIF

    QOut("")
    QOut("=====================")

RETURN NIL