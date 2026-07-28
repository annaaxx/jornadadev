# Exercício 5 — A1_FILIAL e xFilial()

a. O Protheus é um sistema preparado para atender empresas que possuem múltiplas filiais (como matriz e filiais em cidades ou estados diferentes) usando o mesmo banco de dados. O campo de filial (como o `A1_FILIAL` na `SA1` ou o `ZA1_FILIAL` na `ZA1`) serve para identificar a qual filial pertence aquele registro específico. Ele é obrigatório em todas as tabelas porque é esse campo que garante o isolamento e o controle dos dados: permite que o sistema saiba exatamente se um cliente ou um pet é exclusivo da Filial 01, da Filial 02 ou se é compartilhado entre todas elas.

b1. A função `xFilial("NOMETABELA")` serve para descobrir e retornar dinamicamente o código correto da filial para a tabela informada, levando em consideração a filial onde o usuário está logado no momento e o modo de acesso da tabela.

b2. 
    Quebra de regra de compartilhamento: Se a tabela for compartilhada (onde o campo de filial no banco fica em branco `""`), colocar `"01"` manualmente faria o Protheus não encontrar o registro ou gravar o dado de forma errada no banco.

    Erros em multi-empresa/multi-filial: Se o usuário estivesse logado na Filial `"02"` e o código gravasse fixo `"01"`, o dado seria salvo na filial errada, gerando vazamento de dados entre filiais e falhas de segurança no sistema.