## Exercício 4 — Criando um Campo Customizado na SA1 (A1_XAPELID)

### Passo 1: Abrir a Tabela SA1 no Configurador

- Acessar o SIGACFG.

- Ir no menu: Bases de Dados > Dicionário > Base de Dados.

- No painel de tabelas, pesquise pela tabela SA1 (Cadastro de Clientes).

- Cliquei duas vezes nela ou selecione e cliquei em Alterar para abrir a estrutura.

### Passo 2: Configurar o Novo Campo (A1_XAPELID)

- Ir para a aba Campos e clique no botão Incluir (ícone de soma).

- Preencha as propriedades do campo:

- Nome do Campo: A1_XAPELID 

- Tipo: Caractere.

- Tamanho: 30.

- Título: Apelido.

- Descrição: Apelido do Cliente.

- Na aba Pastas (Folder):

  - Selecionei em qual pasta da tela de Clientes o campo deve aparecer (por exemplo: Pasta Cadastrais ou Outros).

- Na aba Propriedades:

  - Marquei a opção Usado como Sim e Altera como Sim (para garantir que o campo fique visível e editável).

### Passo 3: Salvar e Aplicar no Dicionário

- Cliquei em Confirmar para salvar as configurações do campo.

- Cliquei no botão de Salvar/Atualizar a estrutura da tabela SA1.

- O Configurador vai aplicar a alteração no dicionário (SX3).

### Passo 4: Ver o Campo no SmartClient (Módulo Faturamento / Compras)

- Sair do Configurador e abra o SmartClient.

- Fiz login no módulo Faturamento (SIGAFAT) ou Gestão de Estoque/Compras.

- Abri a tela de Cadastro de Clientes (rotina MATA030).

- Cliquei em Incluir ou Alterar em qualquer cliente.

- Ir até a pasta onde configurei o campo (ex: aba Cadastrais ou Outros).

- O campo Apelido (A1_XAPELID) estará lá desenhado e pronto para receber dados!