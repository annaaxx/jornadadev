# 🎓 TCC — Sistema de Controle de Não Conformidades de Fornecedores (ISO 9001)

Projeto final desenvolvido para a **Jornada DEV START**, com foco na modelagem, estruturação e lógica de desenvolvimento em Advanced Protheus (AdvPL).

## 👥 Integrantes do Grupo
* Anna Júlia Pavani Nardi

## ⚠️ Nota Importante sobre o Ambiente
Este projeto foi desenvolvido e estruturado **sem acesso direto a um ambiente Protheus ativo**. Portanto, a entrega contempla a modelagem completa do dicionário de dados, a documentação teórica das regras de negócio e a construção lógica integral dos fontes em AdvPL (`.PRW`), assegurando o rigor técnico e o cumprimento do núcleo mínimo exigido.

## 📋 Sobre o Sistema
O sistema tem como objetivo gerenciar o **Controle de Não Conformidades de Fornecedores** de acordo com as diretrizes da norma **ISO 9001**, permitindo o acompanhamento de desvios, validação de fornecedores cadastrados e controle rigoroso de tolerâncias.

## 🗄️ Dicionário de Dados (Tabela ZZ1)
Como a base não pôde ser criada fisicamente no Protheus, a estrutura do dicionário de dados da tabela principal (`ZZ1`) foi modelada da seguinte forma:

| Campo | Tipo | Tamanho | Decimal | Descrição / Regra |
| :--- | :--- | :--- | :--- | :--- |
| **ZZ1_FILIAL** | Caracter | 2 | 0 | Filial do sistema |
| **ZZ1_FORNEC** | Caracter | 6 | 0 | Código do Fornecedor (Validado na tabela `SA2`) |
| **ZZ1_TOLER** | Numérico | 3 | 0 | Tolerância da Não Conformidade (Permitido de 0 a 100) |
| **ZZ1_STATUS** | Caracter | 1 | 0 | Status do registro (1 = Ativo, 2 = Encerrado) |

## ⚙️ Regras de Negócio e Implementação (`STTZZ1.PRW`)

O arquivo principal da rotina contempla o **núcleo mínimo** obrigatório do projeto:

1. **Manutenção de Registros (`AxCadastro`):** Utilizado para a interface padrão de gerenciamento dos dados da tabela `ZZ1`.
2. **Validação de Fornecedor (`VldZZ1`):** Realiza uma busca na tabela `SA2` utilizando o comando `MsSeek` para garantir que o fornecedor informado realmente existe antes de permitir a continuidade do processo.
3. **Validação de Tolerância:** Restringe o preenchimento do campo de tolerância para aceitar estritamente valores numéricos compreendidos **entre 0 e 100**.
4. **Tratamento de Caminho Infeliz (`BEGIN SEQUENCE`):** A gravação dos dados é protegida por um bloco estruturado de tratamento de exceções. Caso ocorra qualquer falha inesperada durante a transação, o sistema intercepta o erro e exibe uma mensagem amigável ao usuário, garantindo a integridade lógica.

## 📦 Estrutura de Arquivos do Repositório

```text
TCC/
├── README.md                      <-- Documentação completa do projeto
├── STTZZ1.PRW                     <-- Código-fonte principal (Núcleo Mínimo)
├── STTZZ2.PRW                     <-- Código-fonte complementar (Opcional - Itens)
├── STTZZLIB.PRW                   <-- Biblioteca de funções utilitárias (Opcional)