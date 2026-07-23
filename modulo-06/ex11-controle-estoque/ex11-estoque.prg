REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    LOCAL aEstoque := {} // Matriz: {{codigo, nome, quantidade, preco}, ...}
    LOCAL cOpcao   := ""
    LOCAL cPause   := ""

    HB_CDPSELECT("PT850")

    DO WHILE .T.

        // Limpa a tela
        OutStd( Chr(27) + "[2J" + Chr(27) + "[H" )

        // Menu Principal
        QOut("==========================================")
        QOut("        CONTROLE DE ESTOQUE (MEMORIA)     ")
        QOut("==========================================")
        QOut("1. Cadastrar produto")
        QOut("2. Listar produtos")
        QOut("3. Entrada de estoque")
        QOut("4. Saida de estoque")
        QOut("5. Buscar produto por codigo")
        QOut("6. Relatorio (Valor em estoque)")
        QOut("0. Sair")
        QOut("==========================================")
        QOut("Escolha uma opcao: ")
        ACCEPT TO cOpcao

        cOpcao := AllTrim(cOpcao)

        DO CASE
            CASE cOpcao == "1"
                CadastrarProduto(aEstoque)

            CASE cOpcao == "2"
                ListarProdutos(aEstoque)

            CASE cOpcao == "3"
                EntradaEstoque(aEstoque)

            CASE cOpcao == "4"
                SaidaEstoque(aEstoque)

            CASE cOpcao == "5"
                ExecutarBusca(aEstoque)

            CASE cOpcao == "6"
                RelatorioEstoque(aEstoque)

            CASE cOpcao == "0"
                QOut("")
                QOut("Saindo do sistema... Ate logo!")
                EXIT

            OTHERWISE
                QOut("")
                QOut("Opcao invalida! Tente novamente.")
        ENDCASE

        QOut("")
        QOut("Pressione Enter para continuar...")
        ACCEPT TO cPause

    ENDDO

RETURN NIL


// Helper para chamada da op‡Æo 5 do Menu
FUNCTION ExecutarBusca(aEstoque)
    LOCAL cCodigo := "", nPos := 0

    OutStd( Chr(27) + "[2J" + Chr(27) + "[H" )
    QOut("==========================================")
    QOut("            BUSCAR PRODUTO                ")
    QOut("==========================================")
    QOut("")

    QOut("Digite o codigo do produto: ")
    ACCEPT TO cCodigo

    nPos := BuscarProduto(aEstoque, cCodigo)

    IF nPos > 0
        QOut("")
        QOut(">>> Produto Encontrado na Posicao [" + hb_ntos(nPos) + "] <<<")
        QOut("Codigo: " + aEstoque[nPos][1])
        QOut("Nome  : " + aEstoque[nPos][2])
        QOut("Qtd   : " + hb_ntos(aEstoque[nPos][3]))
        QOut("Preco : R$ " + Transform(aEstoque[nPos][4], "@N 999,999.99"))
    ELSE
        QOut("")
        QOut("Produto nao foi encontrado.")
    ENDIF
RETURN NIL