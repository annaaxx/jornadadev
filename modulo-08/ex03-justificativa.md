## Descrição da Inclusão dos Pets NÃO DEIXAR ESSE ARQUIVO PARA O GIT - APENAS CLASSROOM

Se estivesse com o SmartClient aberto rodar a rotina U_STTIP001, a janela do AxCadastro abriria exibindo a tabela ZA1 zerada e os botões padrão (Incluir, Alterar, Visualizar, Excluir). Ao clicar no botão Incluir, a tela do cadastro abre carregando a estrutura do dicionário de dados (SX3), permitindo incluir os registros de teste:

Pet 1:

Código (ZA1_COD): 000001
Nome (ZA1_NOME): Rex
Raça (ZA1_RACA): Labrador
Data Nasc. (ZA1_DTNASC): 10/05/2021
Cliente (ZA1_CLIENT): 000001 | Loja (ZA1_LOJA): 01
Nome Dono (ZA1_NOMCLI): (Preenchido automaticamente via POSICIONE no cliente 000001)

Pet 2:

Código (ZA1_COD): 000002
Nome (ZA1_NOME): Thor
Raça (ZA1_RACA): Puddle
Data Nasc. (ZA1_DTNASC): 15/08/2022
Cliente (ZA1_CLIENT): 000002 | Loja (ZA1_LOJA): 01
Nome Dono (ZA1_NOMCLI): (Preenchido automaticamente)

Pet 3:

Código (ZA1_COD): 000003
Nome (ZA1_NOME): Mel
Raça (ZA1_RACA): Vira-lata (SRD)
Data Nasc. (ZA1_DTNASC): 20/01/2023
Cliente (ZA1_CLIENT): 000001 | Loja (ZA1_LOJA): 01
Nome Dono (ZA1_NOMCLI): (Preenchido automaticamente)

O AxCadastro é uma função genérica do Protheus que lê o Dicionário de Dados da tabela informada (ZA1) no SX2/SX3 e desenha os campos na tela sozinho, tratando as ações de inclusão, alteração e exclusão sem precisar de linhas adicionais de código. 

