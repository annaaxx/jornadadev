# Exercício 1 — AxCadastro × mBrowse


a. `AxCadastro`: Usaria para cadastros simples de uma única tabela (tabelas operacionais e secundárias), onde só preciso das operações básicas (incluir, alterar, visualizar e excluir) sem firulas. Exemplo: Cadastro básico de Espécies de Pets (`ZA2`) ou Cadastro de Bairros.

`mBrowse`: Usaria para rotinas principais que exigem uma navegação mais rica para o usuário, com botões personalizados, regras de negócio na tela inicial ou identificação visual por cores. Exemplo: Cadastro de Pets (`ZA1`) ou Tela de Pedidos de Venda, onde preciso de botões para emitir relatórios, filtros e legendas de status.

b. 
    1. Legendas Coloridas (`aColors`): Permite colocar uma coluna visual de status com cores (ex: verde para ativo, vermelho para bloqueado).
    2. Menu Customizado (`aRotina`): Permite adicionar botões com funções próprias do sistema (ex: botão "Imprimir Carteirinha" ou "Faturar").
    3. Filtros Iniciais na Tela: Permite aplicar um filtro padrão na navegação (via `SetFilter`) para exibir apenas os registros que pertencem àquele contexto.

c. O Protheus valida as regras das legendas de cima para baixo, em ordem sequencial. Como a expressão `".T."` significa "Verdadeiro" (sempre passa), se ela for colocada no topo, o sistema vai aceitar logo no primeiro teste, pintar todas as linhas com essa cor e ignorar todas as regras específicas que estiverem abaixo. Ela deve ficar por último para funcionar como a cor padrão para o que não se encaixou nas regras anteriores.

d. 
    Campo Virtual (`X3_RELACAO`): O dado não é gravado na tabela. Toda vez que a tela se abre, o Protheus roda a fórmula do `X3_RELACAO` para consultar no banco e mostrar o nome na memória em tempo de execução.
    Gatilho (`SX7`): O dado é gravado fisicamente no banco. Quando o usuário digita o código do cliente e sai do campo, o gatilho consulta o nome, preenche o campo de destino na tela e salva essa informação no banco ao confirmar a inclusão.