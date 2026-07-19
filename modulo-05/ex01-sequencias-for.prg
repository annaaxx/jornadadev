REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    LOCAL nI := 0

    HB_CDPSELECT("PT850")

    QOut("=== ITEM A: N£meros de 1 a 100 ===")
    QOut("")
    
    FOR nI := 1 TO 100 STEP 1
        QOut("N£mero: " + AllTrim(Str(nI))) 
        hb_idleSleep(0.1) 
    NEXT

    QOut("")
    QOut("--------------------------------------------------")

    QOut("=== ITEM B: N£meros de -50 a 50 ===")
    QOut("")
    
    FOR nI := -50 TO 50 STEP 1
        QOut("N£mero: " + AllTrim(Str(nI)))
        hb_idleSleep(0.05) 
    NEXT

    QOut("")
    QOut("--------------------------------------------------")

    QOut("=== ITEM C: N£meros de 80 a 5 ===")
    QOut("")
    
    FOR nI := 80 TO 5 STEP -1 
        QOut("N£mero: " + AllTrim(Str(nI)))
        hb_idleSleep(0.1)
    NEXT

    QOut("")

RETURN NIL