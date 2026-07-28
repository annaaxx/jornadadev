# Exercício 2 — Completando a Tabela ZA1 (Adicionando o Dono do Pet)

## Passo 1: Acessar a Tabela ZA1 no Configurador

- Acessei o SIGACFG (Configurador do Protheus).
- Ir no menu: Bases de Dados > Dicionário > Base de Dados.
- Pesquisei e selecionei a tabela ZA1 (Cadastro de Pets) e cliquei em Alterar.

## Passo 2: Configurar os Campos no SX3 (Dicionário de Campos)

- Na aba Campos, adicionei os novos campos que ligam o Pet ao seu Dono (Cliente da SA1):
    - ZA1_CLIENT (Código do Cliente / Dono):
    - Tipo: Caractere | Tamanho: 6.
    - Título: Cliente | Descrição: Codigo do Cliente (Dono).
    - F3 (Consulta Padrao): SA1 (para permitir abrir a busca F3 de clientes).
    - ZA1_LOJA (Loja do Cliente):
    - Tipo: Caractere | Tamanho: 2.
    - Título: Loja | Descrição: Loja do Cliente.
    - ZA1_NOMCLI (Nome do Cliente — Campo Virtual):
    - Tipo: Caractere | Tamanho: 40.
    - Título: Nome Dono | Descrição: Nome do Dono do Pet.
 
- Relação (X3_RELACAO):
    - Snippet de código: POSICIONE("SA1", 1, xFilial("SA1") + M->ZA1_CLIENT + M->ZA1_LOJA, "A1_NOME")
(Essa fórmula busca automaticamente na tabela SA1 o nome do cliente baseado no código e loja digitados).

## Passo 3: Configurar os Índices no SIX (Dicionário de Índices)

- Fui na aba Índices da tabela ZA1 para configurar as chaves de busca rápida:
- Ordem 1 (Chave Primária):
    - Chave: ZA1_FILIAL + ZA1_COD
    - Descrição: Código do Pet.
    - Mostra Pesquisa (NickName): SIM.
    - Ordem 2 (Busca por Dono):
    - Chave: ZA1_FILIAL + ZA1_CLIENT + ZA1_LOJA
    - Descrição: Cliente + Loja.
    - Mostra Pesquisa (NickName): SIM.

## Passo 4: Confirmar e Salvar no Banco

- Salvei as alterações na tabela ZA1.

- Cliquei no botão de Atualizar / Salvar Dicionário de Dados.

- Abrindo a tela de Pets no SmartClient, e preenchendo o Cliente (ZA1_CLIENT) e a Loja (ZA1_LOJA), o campo Nome Dono (ZA1_NOMCLI) é preenchido automaticamente na tela via POSICIONE!