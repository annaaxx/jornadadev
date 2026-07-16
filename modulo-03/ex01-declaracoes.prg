FUNCTION Main()

    LOCAL cNome     := "Fernando"
    LOCAL nSalario  := 2100.00
    LOCAL lAtivo    := .T.
    LOCAL dAdmissao := CTOD("07/15/2026") 
    LOCAL cCodigo   := "01 - T.I." 

    SET DATE BRITISH

    QOut("Nome do Funcionario: " + cNome)
    QOut("Salario Bruto: ", nSalario)
    QOut("Ativo? ", lAtivo)
    QOut("Data de Admissao: ", dAdmissao)
    QOut("Codigo do Departamento: " + cCodigo)

RETURN NIL