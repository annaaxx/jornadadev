# Descrição do Teste para Entrega (Sem Ambiente)

- Simulação de Teste:

Na inclusão/alteração de um Pet na tela do AxCadastro (STTIP001), o usuário digita o código de cliente 999999 e a loja 01 (um cliente que não existe no cadastro da SA1). Ao tentar sair do campo ZA1_CLIENT (apertando Tab ou Enter), o Protheus executa automaticamente a fórmula do X3_VALID (U_VALCLI001()). A função dispara a mensagem de alerta na tela: "Cliente não cadastrado na SA1!". O cursor permanece retido no campo ZA1_CLIENT e o sistema impede o avanço até que seja informado um código de cliente válido que exista na SA1.