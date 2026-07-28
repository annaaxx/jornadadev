## Exercício 1 — Conceitos Fundamentais (AdvPL / Protheus)

a. O AppServer é o motor do Protheus. Ele é o serviço responsável por executar as regras de negócio escritas em AdvPL/TL++, processar as requisições dos usuários e fazer a ponte de comunicação entre a interface gráfica (SmartClient/WebApp) e o banco de dados.

b. O RPO é o repositório onde ficam armazenados todos os códigos-fonte do Protheus após serem compilados. Ele guarda as rotinas padrão da TOTVS e as customizações em formato executável para que o AppServer possa interpretá-las na memória.

c. O SIGACFG é o módulo do Protheus voltado para a administração do sistema. Ele serve para gerenciar usuários, controlar permissões de acesso, configurar os dicionários de dados (tabelas, campos, telas) e ajustar os parâmetros gerais que definem o comportamento do ERP.

d. Um campo Real existe fisicamente como uma coluna no banco de dados e grava suas informações na tabela. Já um campo Virtual existe apenas na memória durante a exibição da tela; seu valor costuma ser calculado em tempo de execução via código ou gatilho, sem ocupar espaço no banco de dados.