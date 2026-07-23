FUNCTION Main()

    // Carrega a biblioteca externa
    SET PROCEDURE TO matematica.prg

    OutStd("==========================================" + hb_eol())
    OutStd("     TESTE DA BIBLIOTECA MATEMATICA       " + hb_eol())
    OutStd("==========================================" + hb_eol())
    OutStd(hb_eol())

    // --- TESTE 1: FATORIAL ---
    OutStd("--> TESTE: Fatorial" + hb_eol())
    OutStd("Fatorial de 5: " + hb_ntos( FatorialN(5) ) + hb_eol())
    OutStd("Fatorial de 0: " + hb_ntos( FatorialN(0) ) + hb_eol())
    OutStd(hb_eol())

    // --- TESTE 2: NéMERO PRIMO ---
    OutStd("--> TESTE: E Primo?" + hb_eol())
    OutStd("7 e primo?  " + iif( EhPrimo(7), "SIM", "NAO" ) + hb_eol())
    OutStd("10 e primo? " + iif( EhPrimo(10), "SIM", "NAO" ) + hb_eol())
    OutStd(hb_eol())

    // --- TESTE 3: MDC ---
    OutStd("--> TESTE: MDC" + hb_eol())
    OutStd("MDC de 24 e 36: " + hb_ntos( MDC(24, 36) ) + hb_eol())
    OutStd(hb_eol())

    // --- TESTE 4: MMC ---
    OutStd("--> TESTE: MMC" + hb_eol())
    OutStd("MMC de 12 e 18: " + hb_ntos( MMC(12, 18) ) + hb_eol())
    OutStd(hb_eol())

    OutStd("==========================================" + hb_eol())
    OutStd(hb_eol())

RETURN NIL