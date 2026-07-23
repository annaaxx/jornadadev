REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    //Cria a vari†vel 'aAgenda' e a inicializa como um Array VAZIO (chaves {})
    LOCAL aAgenda  := {}
    
    //Cria a vari†vel 'nPosicao' para guardar o n£mero da posiá∆o que a busca encontrar
    LOCAL nPosicao := 0

    HB_CDPSELECT("PT850")

    //Limpa qualquer texto antigo que estivesse no terminal
    Cls

    //Escreve o cabeáalho da nossa agenda na tela
    QOut("=== AGENDA DE CONTATOS ===")
    QOut("")

    //INSERINDO DADOS NA AGENDA
    //Chama a funá∆o AddContato passando a nossa agenda vazia, o nome e o telefone.
    //Ela vai criar o sub-array {"Alice", "11 99999-1111"} na posiá∆o 1 da agenda.
    AddContato(aAgenda, "Alice", "11 99999-1111")

    //Faz a mesma coisa para o Bob, criando a posiá∆o 2 na agenda.
    AddContato(aAgenda, "Bob",   "11 98888-2222")

    //LISTANDO OS CONTATOS
    //Chama a funá∆o ListarContatos enviando o array 'aAgenda' preenchido.
    //Ela vai percorrer cada item e mostrar formatado na tela.
    ListarContatos(aAgenda)

    QOut("") // Imprime uma linha em branco para espaáamento

    //BUSCANDO UM CONTATO
    //Chama a funá∆o BuscarPorNome procurando por "bob" (mesmo em min£sculo).
    //O resultado que a funá∆o devolver (o n£mero 2) ser† guardado em 'nPosicao'.
    nPosicao := BuscarPorNome(aAgenda, "bob")

    //Testamos se a busca encontrou alguÇm (se a posiá∆o for maior que 0)
    IF nPosicao > 0
        //Se achou, mostra o texto concatenado com o n£mero da posiá∆o convertida para texto
        QOut('Busca "bob": encontrado na posiá∆o ' + AllTrim(Str(nPosicao)))
    ELSE
        // Se a funá∆o tivesse devolvido 0, entraria aqui
        QOut('Busca "bob": contato n∆o encontrado!')
    ENDIF

    QOut("")

//Finaliza a funá∆o Main sem retornar nenhum valor espec°fico (NIL)
RETURN NIL

//FUNÄ«O 1: AddContato
//Recebe o array da agenda por parÉmetro, o nome e o telefone a cadastrar
FUNCTION AddContato(aLista, cNome, cFone)

    //AAdd() Ç uma funá∆o nativa do Harbour que adiciona um novo item ao final do Array.
    //Aqui, adicionei um SUB-ARRAY { cNome, cFone } dentro de 'aLista'.
    AAdd(aLista, { cNome, cFone })

RETURN NIL //Retorna vazio, pois s¢ precisava alterar o array

//FUNÄ«O 2: ListarContatos
//Recebe a agenda e exibe cada contato numerado
FUNCTION ListarContatos(aLista)

    //Declara a vari†vel do contador que vai controlar as voltas do laáo FOR
    LOCAL nI := 0

    //Len(aLista) descobre quantas pessoas est∆o cadastradas na agenda.
    //O FOR vai rodar de nI = 1 atÇ o total de pessoas (neste caso, 2).
    FOR nI := 1 TO Len(aLista)

        //Explicando os colchetes:
        //nI              --> O n£mero da pessoa atual (1 para Alice, 2 para Bob)
        //aLista[nI][1]   --> Pega o item 1 (Nome) da pessoa atual
        //aLista[nI][2]   --> Pega o item 2 (Telefone) da pessoa atual
        //PadR(..., 8)    --> Garante que o nome ocupe 8 espaáos para alinhar as colunas
        QOut(AllTrim(Str(nI)) + ". " + PadR(aLista[nI][1], 8) + " - " + aLista[nI][2])

    NEXT //Pula para o pr¢ximo n£mero de nI (pr¢xima pessoa)

RETURN NIL

//FUNÄ«O 3: BuscarPorNome
//Procura por um nome na agenda e retorna o n£mero da posiá∆o onde ele est†
FUNCTION BuscarPorNome(aLista, cNomeBusca)

    //Declara a vari†vel do contador do laáo
    LOCAL nI := 0

    //Inicia o laáo para verificar pessoa por pessoa da agenda
    FOR nI := 1 TO Len(aLista)

        //Comparaá∆o de textos padronizada:
        //Upper(Trim(aLista[nI][1])) --> Pega o nome da pessoa na agenda, remove espaáos e deixa em MAIÈSCULO
        //Upper(Trim(cNomeBusca))     --> Pega a palavra pesquisada, remove espaáos e deixa em MAIÈSCULO
        IF Upper(Trim(aLista[nI][1])) == Upper(Trim(cNomeBusca))
            
            //SE FOREM IGUAIS:
            //A palavra 'RETURN nI' faz duas coisas ao mesmo tempo:
            //1. Envia a posiá∆o atual (ex: 2) de volta para quem chamou a funá∆o.
            //2. ENCERRA a funá∆o na hora, sem precisar continuar o FOR atÇ o final!
            RETURN nI

        ENDIF

    NEXT

    //Se o laáo FOR rodar do comeáo ao fim e NUNCA entrar no IF acima, significa que a pessoa n∆o existe na agenda. Por isso, retornamos o n£mero 0 para indicar que n∆o foi encontrada.
RETURN 0