FUNCTION Main()
    
    // O Local é uma variável para você guardar alguma informacao ja definida. Esse LOCAL ou local nunca pode mudar o jeito da escrita. Já o cNome é o nome que eu vou dar para o "arquivo" da minha gaveta, poderia ser por exemplo cNomedoMeuAmor (seria dificil de entender, pois no codigo tem que ser algo claro, mas pode!) e o := é o sinal de atribuição, ou seja, eu estou atribuindo a informação "Maria" para a minha variável cNome. 

    // Entao se fossemos ler o codigo "LOCAL cNome := "Maria"" seria algo como "Eu tenho uma gaveta (LOCAL) chamada cNome e dentro dela eu guardei a informação Maria"
    LOCAL cNome := "Maria"
    // esse aqui seria: A mensagem que vai aparecer na tela é: Nome: Maria (QOut vai escrever o nome que está guardado na minha gaveta cNome)
    QOut("Nome: " + cNome)
RETURN NIL

//infos úteis: 
//c para Character (texto): cNome, cCidade
//n para Número: nIdade, nPreco
//d para Data: dAniversario, dVencimento
//l para Lógico (Verdadeiro ou Falso): lAtivo, lPago