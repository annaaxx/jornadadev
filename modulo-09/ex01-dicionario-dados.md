# Exercício 1  Dicionário de Dados Completo (SZ1 e SZ2)



## 1. Mapeamento do Dicionário

### SX2 — Cadastro de Tabelas
- **SZ1**: Cadastro de Contatos | Modo: **Compartilhado**
- **SZ2**: Histórico de Interações | Modo: **Compartilhado**

---

### SX3 Campos das Tabelas

#### Tabela SZ1 (Contatos)
| Campo | Tipo | Tamanho | Decimal | Contexto | Descrição |
| :--- | :---: | :---: | :---: | :---: | :--- |
| `Z1_FILIAL` | C | 2 | 0 | Real | Filial do Sistema |
| `Z1_CODIGO` | C | 6 | 0 | Real | Código do Contato |
| `Z1_NOME` | C | 40 | 0 | Real | Nome do Contato |

#### Tabela SZ2 (Histórico de Interações)
| Campo | Tipo | Tamanho | Decimal | Contexto | Descrição |
| :--- | :---: | :---: | :---: | :---: | :--- |
| `Z2_FILIAL` | C | 2 | 0 | Real | Filial do Sistema |
| `Z2_CONTAT` | C | 6 | 0 | Real | Código do Contato |
| `Z2_SEQUEN` | C | 3 | 0 | Real | Sequência da Interação |
| `Z2_TIPO` | C | 1 | 0 | Real | Tipo de Interação |
| `Z2_DATA` | D | 8 | 0 | Real | Data da Interação |
| `Z2_OBS` | M | 80 | 0 | Real | Observação |

---

### SIX — Índices
- **SZ1 (Ordem 1):** `Z1_FILIAL + Z1_CODIGO` (Único)
- **SZ2 (Ordem 1):** `Z2_FILIAL + Z2_CONTAT + Z2_SEQUEN` (Único)

---

### SX5 — Tabela Genérica (Domínio Z2)
- **Tabela:** `Z2` — Tipos de Interação

| Chave | Descrição |
| :---: | :--- |
| **E** | E-mail |
| **L** | Ligação |
| **R** | Reunião |
| **V** | Visita |
| **W** | WhatsApp |