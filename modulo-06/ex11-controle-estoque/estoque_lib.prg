// FUNÇÃO: Buscar Produto por Código
// Retorna o índice do produto no array, ou 0 se não encontrar
FUNCTION BuscarProduto(aEstoque, cCodigo)
    LOCAL i        := 0
    LOCAL nPosicao := 0

    cCodigo := Upper(AllTrim(cCodigo))

    FOR i := 1 TO Len(aEstoque)
        IF Upper(AllTrim(aEstoque[i][1])) == cCodigo
            nPosicao := i
            EXIT
        ENDIF
    NEXT

RETURN nPosicao

// FUNÇÃO: Cadastrar Produto
FUNCTION CadastrarProduto(aEstoque)
    LOCAL cCodigo := "", cNome := "", cQtd := "", cPreco := ""
    LOCAL nQtd := 0, nPreco := 0.0

    OutStd( Chr(27) + "[2J" + Chr(27) + "[H" )
    QOut("==========================================")
    QOut("            CADASTRAR PRODUTO             ")
    QOut("==========================================")
    QOut("")

    QOut("Codigo do produto: ")
    ACCEPT TO cCodigo
    cCodigo := Upper(AllTrim(cCodigo))

    IF Empty(cCodigo)
        QOut("Erro: Codigo invalido!")
        RETURN NIL
    ENDIF

    // Valida se código já existe
    IF BuscarProduto(aEstoque, cCodigo) > 0
        QOut("Erro: Ja existe um produto cadastrado com este codigo!")
        RETURN NIL
    ENDIF

    QOut("Nome do produto: ")
    ACCEPT TO cNome
    cNome := AllTrim(cNome)

    QOut("Quantidade inicial: ")
    ACCEPT TO cQtd
    nQtd := Val(AllTrim(cQtd))

    QOut("Preco unitario (R$): ")
    ACCEPT TO cPreco
    nPreco := Val(AllTrim(cPreco))

    // Estrutura do item: { codigo, nome, quantidade, preco_unitario }
    AAdd(aEstoque, { cCodigo, cNome, nQtd, nPreco })

    QOut("")
    QOut(">>> Produto cadastrado com sucesso! <<<")
RETURN NIL

// FUNÇÃO: Listar Produtos
FUNCTION ListarProdutos(aEstoque)
    LOCAL i := 0

    OutStd( Chr(27) + "[2J" + Chr(27) + "[H" )
    QOut("==========================================")
    QOut("           LISTAGEM DE PRODUTOS           ")
    QOut("==========================================")
    QOut("")

    IF Len(aEstoque) == 0
        QOut("Nenhum produto cadastrado.")
    ELSE
        FOR i := 1 TO Len(aEstoque)
            QOut("Cod: " + PadR(aEstoque[i][1], 8) + ;
                 " | Nome: " + PadR(aEstoque[i][2], 18) + ;
                 " | Qtd: " + Transform(aEstoque[i][3], "999,999") + ;
                 " | Preco: R$ " + Transform(aEstoque[i][4], "@N 999,999.99"))
        NEXT
    ENDIF
RETURN NIL

// FUNÇÃO: Entrada de Estoque
FUNCTION EntradaEstoque(aEstoque)
    LOCAL cCodigo := "", cQtd := "", nQtd := 0, nPos := 0

    OutStd( Chr(27) + "[2J" + Chr(27) + "[H" )
    QOut("==========================================")
    QOut("            ENTRADA DE ESTOQUE            ")
    QOut("==========================================")
    QOut("")

    QOut("Digite o codigo do produto: ")
    ACCEPT TO cCodigo

    nPos := BuscarProduto(aEstoque, cCodigo)

    IF nPos == 0
        QOut("Erro: Produto nao encontrado!")
        RETURN NIL
    ENDIF

    QOut("Produto localizado: " + aEstoque[nPos][2])
    QOut("Quantidade atual  : " + hb_ntos(aEstoque[nPos][3]))
    QOut("")
    QOut("Quantidade a ADICIONAR: ")
    ACCEPT TO cQtd
    nQtd := Val(AllTrim(cQtd))

    IF nQtd <= 0
        QOut("Erro: Quantidade invalida!")
        RETURN NIL
    ENDIF

    // Aumenta a quantidade
    aEstoque[nPos][3] += nQtd

    QOut("")
    QOut(">>> Entrada realizada! Nova quantidade: " + hb_ntos(aEstoque[nPos][3]) + " <<<")
RETURN NIL


//FUNÇÃO: Saída de Estoque
FUNCTION SaidaEstoque(aEstoque)
    LOCAL cCodigo := "", cQtd := "", nQtd := 0, nPos := 0

    OutStd( Chr(27) + "[2J" + Chr(27) + "[H" )
    QOut("==========================================")
    QOut("             SAIDA DE ESTOQUE             ")
    QOut("==========================================")
    QOut("")

    QOut("Digite o codigo do produto: ")
    ACCEPT TO cCodigo

    nPos := BuscarProduto(aEstoque, cCodigo)

    IF nPos == 0
        QOut("Erro: Produto nao encontrado!")
        RETURN NIL
    ENDIF

    QOut("Produto localizado: " + aEstoque[nPos][2])
    QOut("Quantidade atual  : " + hb_ntos(aEstoque[nPos][3]))
    QOut("")
    QOut("Quantidade a RETIRAR: ")
    ACCEPT TO cQtd
    nQtd := Val(AllTrim(cQtd))

    IF nQtd <= 0
        QOut("Erro: Quantidade invalida!")
        RETURN NIL
    ENDIF

    // Validação de estoque suficiente
    IF nQtd > aEstoque[nPos][3]
        QOut("Erro: Estoque insuficiente! Saldo atual: " + hb_ntos(aEstoque[nPos][3]))
        RETURN NIL
    ENDIF

    // Diminui a quantidade
    aEstoque[nPos][3] -= nQtd

    QOut("")
    QOut(">>> Saida realizada! Novo saldo: " + hb_ntos(aEstoque[nPos][3]) + " <<<")
RETURN NIL

// FUNÇÃO: Relatório Geral e Total do Estoque
FUNCTION RelatorioEstoque(aEstoque)
    LOCAL i          := 0
    LOCAL nSubTotal  := 0.0
    LOCAL nTotalGeral := 0.0

    OutStd( Chr(27) + "[2J" + Chr(27) + "[H" )
    QOut("=========================================================")
    QOut("            RELATORIO DE VALOR EM ESTOQUE                ")
    QOut("=========================================================")
    QOut("")

    IF Len(aEstoque) == 0
        QOut("Estoque vazio.")
    ELSE
        FOR i := 1 TO Len(aEstoque)
            nSubTotal := aEstoque[i][3] * aEstoque[i][4]
            nTotalGeral += nSubTotal

            QOut(PadR(aEstoque[i][1], 8) + " | " + ;
                 PadR(aEstoque[i][2], 18) + " | " + ;
                 "Qtd: " + Transform(aEstoque[i][3], "999,999") + " | " + ;
                 "Subtotal: R$ " + Transform(nSubTotal, "@N 999,999.99"))
        NEXT

        QOut("---------------------------------------------------------")
        QOut("VALOR TOTAL DO ESTOQUE: R$ " + Transform(nTotalGeral, "@N 999,999,999.99"))
    ENDIF
RETURN NIL