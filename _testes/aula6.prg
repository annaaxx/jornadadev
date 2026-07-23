FUNCTION Main()
    LOCAL nTotal := 0
    LOCAL aValores := { 10, 20, 30 }
    LOCAL nI

    FOR nI := 1 TO Len( aValores )
        nTotal += aValores[ nI ]        // <- clique na margem desta linha para o breakpoint 
    NEXT

    QOut( "Total: " + Str( nTotal ) )

RETURN NIL  