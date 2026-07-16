FUNCTION Main()
    
    //Declarando as vari veis com seus tipos corretos
    LOCAL cNome       := ""
    LOCAL cTempNasc   := ""
    LOCAL dNasc       := CTOD("") // Inicia como uma data vazia
    LOCAL cTempPreco  := ""
    LOCAL nPreco      := 0.00     // Inicia como n£mero decimal
    
    LOCAL nDias       := 0
    LOCAL nIdade      := 0
    LOCAL nPercentual := 0.00
    LOCAL nDesconto   := 0.00
    LOCAL nTotal      := 0.00

    //Configura o sistema para aceitar datas no padrÆo brasileiro
    SET DATE BRITISH

    //Lendo os dados do usu rio
    QOut("=== SISTEMA DE VENDAS COM DESCONTO ===")
    ACCEPT "Digite o nome do cliente: " TO cNome
    ACCEPT "Digite a data de nascimento (DD/MM/AAAA): " TO cTempNasc
    ACCEPT "Digite o preco do produto: " TO cTempPreco

    //Convertendo os textos recebidos para os tipos corretos (Data e N£mero)
    dNasc  := CTOD(cTempNasc)
    nPreco := VAL(cTempPreco)

    //Calculando a Idade
    // Subtrair duas datas no Harbour devolve a diferen‡a em DIAS.
    // Dividimos por 365 para descobrir os anos.
    nDias  := Date() - dNasc
    nIdade := INT( nDias / 365 ) // INT() pega apenas a parte inteira (ex: 60 em vez de 60.4)

    //Verificando o Desconto (Se tiver mais de 60 anos)
    IF nIdade > 60
        nPercentual := 12.5
        nDesconto   := nPreco * 0.125  // 12.5% de desconto
    ELSE
        nPercentual := 0.0
        nDesconto   := 0.00
    ENDIF

    //Calcula o valor final
    nTotal := nPreco - nDesconto

    //Exibindo o Resumo Formatado
    QOut("")
    QOut("================ RESUMO ================")
    QOut("Cliente:    " + cNome)
    QOut("Idade:      " + Str(nIdade, 3, 0) + " anos")
    QOut("Preco:      R$ " + Str(nPreco, 10, 2))
    QOut("Desconto:   R$ " + Str(nDesconto, 10, 2) + " (" + Str(nPercentual, 4, 1) + "%)")
    QOut("Total:      R$ " + Str(nTotal, 10, 2))
    QOut("========================================")

RETURN NIL