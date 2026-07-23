FUNCTION Main()

    // Declaração do array dinâmico do carrinho e variáveis auxiliares
    LOCAL aCarrinho := {} // Matriz principal: {{ "Produto", preco }, ...}
    LOCAL cNome     := ""
    LOCAL cPreco    := ""
    LOCAL nPreco    := 0.0
    LOCAL nTotal    := 0.0
    LOCAL cOpcao    := ""
    LOCAL i         := 0

    DO WHILE .T.

        // Limpa a tela no início
        OutStd( Chr(27) + "[2J" + Chr(27) + "[H" )
        
        // Zera as variáveis para uma nova execução
        aCarrinho := {}
        nTotal    := 0.0

        // Cabeçalho do Carrinho
        QOut("==========================================")
        QOut("         MINI-CARRINHO DE COMPRAS         ")
        QOut("==========================================")
        QOut("")

        // Loop para adicionar produtos ao carrinho
        DO WHILE .T.
            QOut("--- Adicionar Item " + hb_ntos(Len(aCarrinho) + 1) + " ---")
            
            // Leitura do nome do produto
            QOut("Nome do produto: ")
            ACCEPT TO cNome
            cNome := AllTrim(cNome)

            // Se o usuário apertar Enter sem digitar nome, evita cadastrar item vazio
            IF Empty(cNome)
                QOut("Nome invalido! Tente novamente.")
                QOut("")
                LOOP
            ENDIF

            // Leitura e conversão do preço
            QOut("Preco (R$): ")
            ACCEPT TO cPreco
            nPreco := Val(AllTrim(cPreco))

            // Adiciona o item {nome, preco} ao carrinho
            AAdd(aCarrinho, { cNome, nPreco })

            QOut("")
            QOut("Deseja adicionar outro produto? (S/N): ")
            ACCEPT TO cOpcao

            // Se a resposta for diferente de 'S', encerra a inclusão de itens
            IF Upper(AllTrim(cOpcao)) != "S"
                EXIT
            ENDIF

            QOut("")
        ENDDO

        // Limpa a tela antes de exibir a nota final
        OutStd( Chr(27) + "[2J" + Chr(27) + "[H" )

        // Exibição do resumo das compras
        QOut("==========================================")
        QOut("            RESUMO DA COMPRA              ")
        QOut("==========================================")

        // Verifica se há itens no carrinho
        IF Len(aCarrinho) == 0
            QOut("Nenhum item foi adicionado ao carrinho.")
        ELSE
            // Percorre o array exibindo cada produto e somando o total
            FOR i := 1 TO Len(aCarrinho)
                cNome  := aCarrinho[i][1]
                nPreco := aCarrinho[i][2]
                nTotal += nPreco

                // Exibe no formato: 1. Camisa - R$ 49.90
                QOut(hb_ntos(i) + ". " + PadR(cNome, 25) + " R$ " + Transform(nPreco, "@N 999,999.99"))
            NEXT

            QOut("------------------------------------------")
            QOut("TOTAL A PAGAR: R$ " + Transform(nTotal, "@N 999,999.99"))
        ENDIF

        QOut("==========================================")
        QOut("")

        // Pergunta se deseja iniciar um novo carrinho
        QOut("Deseja criar um novo carrinho? (S/N): ")
        ACCEPT TO cOpcao

        IF Upper(AllTrim(cOpcao)) != "S"
            QOut("")
            QOut("Obrigado pela compra! Ate logo!")
            EXIT
        ENDIF

    ENDDO

RETURN NIL