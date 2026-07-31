# Exercício 3 — Gatilhos, Campos Virtuais e Validações Cruzadas

## 1. Mapeamento das Propriedades no SX3

### A. Campos Virtuais (`X3_RELACAO` e `X3_CONTEXT = 'V'`)
- **`Z2_NOME`**: `Posicione("SZ1", 1, xFilial("SZ1") + M->Z2_CONTAT, "Z1_NOME")`
  - *Objetivo:* Retorna o nome do contato selecionado automaticamente na tela.
- **`Z2_ASSUNT`**: `Posicione("SX5", 1, xFilial("SX5") + "Z2" + M->Z2_TIPO, "X5_DESCRI")`
  - *Objetivo:* Retorna a descrição legível do tipo de interação (Domínio Z2).

### B. Inicializadores Padrão / Preenchimento Automático (`X3_INIPAD`)
- **`Z2_DATA`**: `dDataBase` *(Data do sistema)*
- **`Z2_HORA`**: `Iif(INCLUI, Time(), SZ2->Z2_HORA)` *(Horário atual no momento da inclusão)*
- **`Z2_USUAR`**: `cNomUsr` *(Nome do usuário logado)*

### C. Validação Cruzada (`X3_VALID`)
- **Campo:** `Z2_CONTAT`
- **Fórmula:** `ExistCpo("SZ1", xFilial("SZ1") + M->Z2_CONTAT, 1)`
- **Efeito:** Impede o cadastro de interações vinculadas a contatos que não existem na tabela `SZ1`.