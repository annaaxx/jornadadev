## Exercício 2 — Estrutura da Tabela Customizada ZA1 (Pets)

a. A estrutura típica da ZA1 é:

ZA1_FILIAL: Tipo Caractere, Tamanho 2 (Armazena o código da filial do registro).

ZA1_COD: Tipo Caractere, Tamanho 6 (Código identificador único do Pet).

ZA1_NOME: Tipo Caractere, Tamanho 40 (Nome do Pet).

ZA1_EPECIE: Tipo Caractere, Tamanho 20 (Espécie, ex: Cão, Gato, Ave).

ZA1_RACA: Tipo Caractere, Tamanho 30 (Raça do Pet).

ZA1_IDADE: Tipo Numérico, Tamanho 3 (Idade em anos).

b. Índice sugerido: ZA1_FILIAL + ZA1_COD (Chave Primária / Ordem 1).

Justificativa: Assim como em uma lista telefônica os nomes são organizados em ordem alfabética para podermos encontrar alguém rapidamente sem precisar ler o livro inteiro, o índice no banco de dados organiza a tabela fisicamente pela chave de busca. O Protheus exige busca rápida por código de registro dentro da filial ativa; sem esse índice, a cada consulta o banco precisaria varrer a tabela inteira (fazendo um Table Scan), deixando o sistema lento.

c. Na convenção do Protheus/AdvPL, as tabelas nativas do sistema usam letras padrão da TOTVS (ex: SA1 para Clientes, SB1 para Produtos). O prefixo Z é reservado exclusivamente para tabelas customizadas criadas pelos desenvolvedores/clientes (ex: ZA1, ZB1, ZZ1). Essa convenção garante que atualizações de versão ou pacotes da TOTVS nunca sobrescrevam as tabelas criadas pela sua empresa.

d. Os campos no Protheus utilizam a convenção NOMETABELA_NOME CAMPO pelos seguintes motivos:

Unicidade nas Consultas/SQL: Em rotinas que fazem junção (JOIN) de várias tabelas, ter o prefixo da tabela no nome do campo evita ambiguidade (evita que o sistema se confunda ao buscar um campo chamado NOME que existe tanto na tabela de Clientes quanto na de Pets).

Identificação Imediata no Código: Ao ler um código AdvPL e encontrar a variável de memória M->ZA1_NOME, qualquer desenvolvedor bate o olho e sabe exatamente a qual tabela aquele campo pertence.