# Exercício 4 — Refinamento sucessivo

## Nível 1

1. **Registrar os itens da compra** (Entrada)
2. **Calcular o subtotal** (Processamento inicial)
3. **Aplicar desconto de fidelidade, se houver** (Decisão e cálculo)
4. **Exibir o total a pagar** (Saída)

## Nível 2
### 1. Registrar os itens da compra

* Iniciar o subtotal acumulado com o valor $0$.
* Repetir para cada produto que passar pelo leitor:
* Ler o preço do item.
* Ler a quantidade daquele item.
* Multiplicar o preço pela quantidade para achar o valor do item.
* Somar esse valor ao subtotal acumulado.
* Até que não haja mais produtos para registrar (fim da compra).

### 2. Calcular o subtotal

* Guardar o valor final acumulado no passo anterior na variável `subtotal`.

### 3. Aplicar desconto de fidelidade, se houver

* Perguntar ao cliente: *"Possui cartão fidelidade? (Sim/Não)"*.
* Ler a resposta do cliente.
* **Se** a resposta for "Sim" **Então**:
* Calcular o valor do desconto: `desconto <- subtotal * 0.05` (5% de desconto).
* Calcular o total: `total_pagar <- subtotal - desconto`.

* **Senão** (se não tiver o cartão):
* Definir o valor do desconto como $0$.
* Calcular o total: `total_pagar <- subtotal`.

* **FimSe**

### 4. Exibir o total a pagar

* Mostrar na tela do caixa:
* O valor bruto (`subtotal`).
* O valor que foi descontado (`desconto`).
* O valor final que o cliente deve pagar (`total_pagar`).
* Finalizar a venda.