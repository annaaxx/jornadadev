FUNCTION Main()

    // DECLARAÇÃO DAS VARIÁVEIS

    // Área do círculo
    LOCAL nPi          := 3.14159
    LOCAL nRaio        := 0
    LOCAL nAreaCirculo := 0
    LOCAL cTempRaio    := ""

    // os valores em "0" nas variáveis é porque o usuário irá digitar o valor do raio do círculo, e o programa irá calcular a área do círculo com base nesse valor. E em "" porque o usuário irá digitar o valor e vai ser armazenado temporariamente como string, e depois convertido para número com a função VAL().

    // Hipotenusa
    LOCAL nCatetoA     := 0
    LOCAL nCatetoB     := 0
    LOCAL nHipotenusa  := 0
    LOCAL cTempCatA    := ""
    LOCAL cTempCatB    := ""

    // IMC
    LOCAL nPeso        := 0
    LOCAL nAltura      := 0
    LOCAL nIMC         := 0
    LOCAL cTempPeso    := ""
    LOCAL cTempAlt     := ""

    // ÁREA DO CÍRCULO

    ACCEPT "Digite o raio do círculo: " TO cTempRaio 
    // O comando ACCEPT é usado para receber a entrada do usuário e armazená-la na variável cTempRaio. O valor digitado pelo usuário será uma string, então precisamos convertê-lo para um número usando a função VAL().

    nRaio := VAL(cTempRaio) 
    // A função VAL() é usada para converter a string armazenada em cTempRaio para um número, que será armazenado na variável nRaio. Isso é necessário porque o cálculo da área do círculo requer um valor numérico.

    nAreaCirculo := nPi * (nRaio ^ 2)
    // calculo 

    QOut("A area do circulo e: " + Str(nAreaCirculo,10,2))
    QOut("")
    // mostrando na tela o resultado do cálculo da área do círculo. A função Str() é usada para formatar o número nAreaCirculo como uma string com 10 caracteres de largura e 2 casas decimais.

    // HIPOTENUSA

    ACCEPT "Digite o valor do cateto A: " TO cTempCatA
    ACCEPT "Digite o valor do cateto B: " TO cTempCatB

    nCatetoA := VAL(cTempCatA)
    nCatetoB := VAL(cTempCatB)

    nHipotenusa := Sqrt((nCatetoA ^ 2) + (nCatetoB ^ 2))

    QOut("A hipotenusa e: " + Str(nHipotenusa,10,2))
    QOut("")

    // IMC

    ACCEPT "Digite seu peso (kg): " TO cTempPeso
    ACCEPT "Digite sua altura (m): " TO cTempAlt

    nPeso   := VAL(cTempPeso)
    nAltura := VAL(cTempAlt)

    nIMC := nPeso / (nAltura ^ 2)

    QOut("Seu IMC e: " + Str(nIMC,10,2))
    QOut("")

RETURN NIL