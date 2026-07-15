# Exercício 2 — Pseudocódigo

## a. Calcular a área de um retângulo (base × altura)

Algoritmo CalcularAreaRetangulo

Var
    base, altura, area: Real

Início 
    Escreva("Digite a base do retângulo:")
    Leia(base) 
    
    Escreva("Digite a altura do retângulo:")
    Leia(altura)
    
    // Processamento (Cálculo)
    area <- base * altura
    
    // Saída de dados
    Escreva("A área total do retângulo é: ", area)
Fim

## b. Verificar se um número é par ou ímpar

Algoritmo ParOuImpar

Var
    numero: Inteiro

Início 

    Escreva("Digite um número: ")
    Leia(número)

    Se (número resto 2 = 0) Então
        Escreva("O número que você digitou é PAR")
    Senão
        Escreva("O número que você digitou é PAR")
    FimSe

Fim

## c. Encontrar o maior entre três números

Algoritmo MaiorDeTres

Var
    n1, n2, n3, maior: Inteiro

Início 
    Escreva("Digite o primeiro número: ")
    Leia(n1)
    
    Escreva("Digite o segundo número: ")
    Leia(n2)
    
    Escreva("Digite o terceiro número: ")
    Leia(n3)
    
    // Testando se o n1 é o maior de todos
    Se (n1 >= n2) e (n1 >= n3) Então
        maior <- n1
    // Se não for o n1, testamos se o n2 é o maior
    Senão Se (n2 >= n3) Então
        maior <- n2
    // Se não for nem n1 nem n2, restou o n3
    Senão
        maior <- n3
    FimSe
    
    Escreva("O maior número digitado foi: ", maior)
Fim