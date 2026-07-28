# Descrição do Teste para Entrega (Sem Ambiente)

- Simulação de Execução:

-- Filtro Ativo na Abertura:

Ao executar U_STTIP002, o parâmetro lSemFiltro assume o padrão .F..

A variável cFiltro aplica a expressão que compara o mês e o ano da data de nascimento (ZA1_DTNASC) com a data atual do sistema (dDataBase). A tela exibe no título a indicação "(Filtro: Aniversariantes do Mês)" e lista apenas os pets cadastrados no mês/ano correntes.

-- Remoção do Filtro (Botão "Limpar Filtro"):

Ao clicar na opção "Limpar Filtro" no menu, o Protheus chama a User Function U_STCLRFIL().

Essa função re-executa a rotina U_STTIP002(.T.) passando o parâmetro para ignorar o filtro. O mBrowse é atualizado com o título "(Todos os Registros)", exibindo a totalidade dos pets da tabela ZA1.

-- Exibição do Histórico (Botão "Histórico"):

Ao posicionar sobre qualquer registro no browse e clicar no botão "Histórico", a função U_STHIST01() é acionada. Uma caixa de diálogo MsgInfo é exibida formatada com o código (ZA1_COD), nome (ZA1_NOME), raça (ZA1_RACA), data de nascimento e o cliente vinculado ao registro posicionado.