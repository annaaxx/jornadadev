/*
 * Harbour 3.0.0 (Rev. 16951)
 * MinGW GNU C 4.5.2 (32-bit)
 * Generated C source from "aula6.prg"
 */

#include "hbvmpub.h"
#include "hbinit.h"


HB_FUNC( MAIN );
HB_FUNC_EXTERN( LEN );
HB_FUNC_EXTERN( QOUT );
HB_FUNC_EXTERN( STR );
HB_FUNC_EXTERN( __DBGENTRY );
HB_FUNC_INITLINES();


HB_INIT_SYMBOLS_BEGIN( hb_vm_SymbolInit_AULA6 )
{ "MAIN", {HB_FS_PUBLIC | HB_FS_FIRST | HB_FS_LOCAL}, {HB_FUNCNAME( MAIN )}, NULL },
{ "LEN", {HB_FS_PUBLIC}, {HB_FUNCNAME( LEN )}, NULL },
{ "QOUT", {HB_FS_PUBLIC}, {HB_FUNCNAME( QOUT )}, NULL },
{ "STR", {HB_FS_PUBLIC}, {HB_FUNCNAME( STR )}, NULL },
{ "__DBGENTRY", {HB_FS_PUBLIC}, {HB_FUNCNAME( __DBGENTRY )}, NULL },
{ "(_INITLINES)", {HB_FS_INITEXIT | HB_FS_LOCAL}, {hb_INITLINES}, NULL }
HB_INIT_SYMBOLS_EX_END( hb_vm_SymbolInit_AULA6, "aula6.prg", 0x0, 0x0003 )

#if defined( HB_PRAGMA_STARTUP )
   #pragma startup hb_vm_SymbolInit_AULA6
#elif defined( HB_DATASEG_STARTUP )
   #define HB_DATASEG_BODY    HB_DATASEG_FUNC( hb_vm_SymbolInit_AULA6 )
   #include "hbiniseg.h"
#endif

HB_FUNC( MAIN )
{
	static const HB_BYTE pcode[] =
	{
		13,3,0,51,97,117,108,97,54,46,112,114,103,58,
		77,65,73,78,0,36,2,0,37,1,0,78,84,79,
		84,65,76,0,121,80,1,36,3,0,37,2,0,65,
		86,65,76,79,82,69,83,0,92,10,92,20,92,30,
		4,3,0,80,2,36,4,0,37,3,0,78,73,0,
		36,6,0,122,165,80,3,25,20,36,7,0,96,1,
		0,95,2,95,3,1,135,36,6,0,175,3,0,176,
		1,0,95,2,12,1,15,28,230,36,10,0,176,2,
		0,106,8,84,111,116,97,108,58,32,0,176,3,0,
		95,1,12,1,72,20,1,36,12,0,100,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_INITLINES()
{
	static const HB_BYTE pcode[] =
	{
		51,97,117,108,97,54,46,112,114,103,58,40,95,73,
		78,73,84,76,73,78,69,83,41,0,106,10,97,117,
		108,97,54,46,112,114,103,0,121,106,3,220,20,0,
		4,3,0,4,1,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

