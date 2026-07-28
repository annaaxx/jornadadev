# Descrição do Teste para Entrega (Sem Ambiente)

- Simulação da Tela do mBrowse com Legendas Coloridas:

- Mapeamento de Cores no Browse:

Pet 1 (Rex): Data de Nascimento 10/05/2012 (Mais de 10 anos em relação a hoje). O sistema avalia a primeira regra (ZA1_DTNASC <= dDataBase - 3650) como verdadeira e exibe a bolinha vermelha.

Pet 2 (Thor): Data de Nascimento preenchida com a data de hoje (dDataBase). O sistema avalia a segunda regra (ZA1_DTNASC == dDataBase) e exibe a bolinha amarela.

Pet 3 (Mel): Data de Nascimento 20/01/2023 (Pet jovem/adulto). Não se encaixa nas duas primeiras regras, caindo no coringa (.T.) e exibindo a bolinha verde.

Ação do Botão Legenda: Ao clicar na opção "Legenda" do menu superior, o Protheus abre uma janela pop-up exibindo a descrição oficial de cada cor informada no array da função BrwLegenda().