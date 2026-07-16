FUNCTION Main()

    LOCAL cTextoLongo := "Harbour"
    LOCAL cTextoCurto := "Harb"

    QOut( "=== TESTANDO A DIFERENCA ENTRE = E == ===" )
    QOut( "" )
    QOut( "Texto Longo: '" + cTextoLongo + "'" )
    QOut( "Texto Curto: '" + cTextoCurto + "'" )
    QOut( "" )

    // Exemplo 1: Usando a igualdade simples (=)
    IF cTextoLongo = cTextoCurto
        QOut( "Com (=) : Eles sao IGUAIS! (Porque 'Harbour' comeca com 'Harb')" )
    ELSE
        QOut( "Com (=) : Eles sao DIFERENTES!" )
    ENDIF

    // Exemplo 2: Usando a igualdade estrita (==)
    IF cTextoLongo == cTextoCurto
        QOut( "Com (==): Eles sao IGUAIS!" )
    ELSE
        QOut( "Com (==): Eles sao DIFERENTES! (Porque nao sao exatamente identicos)" )
    ENDIF

RETURN NIL