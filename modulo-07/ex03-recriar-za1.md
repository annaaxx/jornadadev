## Exercício 3 — Criando a Tabela ZA1 no Configurador (Passo a Passo)

### Passo 1: Entrar no Configurador 

1. Abrir o SmartClient e acessar o módulo *SIGACFG* (Configurador).
2. Ir no menu: *Bases de Dados > Dicionário > Base de Dados*.
3. Clicar na opção *Dicionário de Dados* para abrir o gerenciador de tabelas.

### Passo 2: Cadastrar a Tabela no SX2 (Tabelas)

1. Na lista de tabelas, clicar em *Incluir*.

2. Preencher os campos da tabela:

* *Tabela:* `ZA1` (Prestar atenção para usar a letra *Z*, pois é a convenção para tabelas customizadas).

* *Descrição:* Cadastro de Pets.

* *Modo de Acesso:* Exclusivo ou Compartilhado (conforme a empresa).

3. O Protheus já gera automaticamente o campo obrigatório `ZA1_FILIAL`.

### Passo 3: Criar os Campos no SX3 (Campos da Tabela)

Agora, seleciono a tabela `ZA1` e vamos na aba *Campos* para incluir um por um:

1. *`ZA1_FILIAL`*: Já criado automaticamente pelo sistema.

2. *`ZA1_COD`*:

* *Campo:* `ZA1_COD` | *Tipo:* Caractere | *Tamanho:* 6.
* *Título:* Código.


3. *`ZA1_NOME`*:

* *Campo:* `ZA1_NOME` | *Tipo:* Caractere | *Tamanho:* 40.
* *Título:* Nome do Pet.

4. *`ZA1_RACA`*:

* *Campo:* `ZA1_RACA` | *Tipo:* Caractere | *Tamanho:* 30.
* *Título:* Raca do Pet.

5. *`ZA1_DTNASC`*:

* *Campo:* `ZA1_DTNASC` | *Tipo:* Data | *Tamanho:* 8.
* *Título:* Dt. Nasc.

### Passo 4: Atualizar o Banco 

Depois de salvar a estrutura no Configurador, a tabela existe no *Dicionário de Dados*(arquivos `.dtc` / tabelas `SX2`/`SX3`), mas *ainda não existe fisicamente no Banco de Dados (SQL)*.

Para forçar o Protheus a criar a tabela no banco:

1. Abrir a rotina de *Fórmulas* no Configurador

2. Ao acessar ou disparar a rotina de fórmulas/atualização, o *framework* do Protheus lê o dicionário, percebe que a tabela `ZA1` ainda não existe no SQL e executa o comando `CREATE TABLE ZA1...` no banco de dados automaticamente.

### Passo 5: Conferir a Estrutura Final no MPSDU

1. Fechei o SIGACFG e abri o utilitário *MPSDU* (ferramenta de banco do Protheus).

2. Fiz o login com o driver correto (ex: `CTREE` ou `TOPCONNECT/SQL`).

3. Vou *File > Open* e busquei pela tabela *ZA1*.

4. Clicar na aba *Structure* (Estrutura):

* Confirmando se todos os campos (`ZA1_FILIAL`, `ZA1_COD`, `ZA1_NOME`, `ZA1_RACA`, `ZA1_DTNASC`) aparecem na lista com seus respectivos tipos e tamanhos.

5. Se a tabela abrir sem erros e mostrar a estrutura correta, a `ZA1` está 100% pronta para ser usada nos programas AdvPL!