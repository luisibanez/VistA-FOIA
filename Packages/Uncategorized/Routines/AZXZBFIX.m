AZXZBFIX ;07/27/92  JOHN H. LYNCH [ 05/01/95   1:25 PM ]
 ;FIXES A RANGE OF CROSS-REFERENCES
 ;THE GLOBAL, THE CROSS-REFERENCE AND
 ;THE RANGE OF INTERNAL ENTRY NUMBERS
 ;ARE SPECIFIED BY THE PROGRAMMER.�
 
MAIN ;MAIN PROGRAM CONTROL
 ;SET LOCAL VARIABLES
 D ^XBKSET          ; SET KERNEL PARAMETERS
 S YN="N"           ; DEFAULT TO "N" -NO
 
 W @IOF             ; CLEAR SCREEN
 W !!,"This program will ask for a ^GLOBAL(, a CROSS-REFERENCE,"
 W !,"and a RANGE of internal entry numbers to re-cross-reference."
 W !!,"? = HELP"
 W !,"^ = BACK UP TO PREVIOUS PROMPT"
GBLENTRY R !!,"ENTER GLOBAL TO RE-CROSS-REFERENCE //",GLOBAL
 I GLOBAL?1.3"?" W !!,"ENTER GLOBAL IN THIS FORMAT:  ^GLOBAL(",! G GBLENTRY
 I GLOBAL="^" D KILLVARS Q
REFENTRY R !!,"ENTER THE CROSS-REFERENCE LETTER(S) //",REFER
 I REFER?1.3"?" W !!,"ENTER CROSS-REFERENCE IN THIS FORMAT: AC",! G REFENTRY 
 I REFER="^" G GBLENTRY
INTENTRY R !!,"ENTER INTERNAL ENTRY NUMBER RANGE TO RE-CROSS-REFERENCE //",INUM
 I INUM?1.3"?" W !!,"ENTER RANGE FOR INTERNAL ENTRY NUMBER IN THE FOLLOWING FORMAT: 10:100",! G INTENTRY
 I INUM="^" G REFENTRY
 
FLDENTRY R !!,"ENTER FIELD NUMBER OF CROSS-REFERENCE TO RE-CROSS-REFERENCE //",FIELD
 I FIELD?1.3"?" W !!,"ENTER FIELD NUMBER FOR THE CROSS-REFERENCE IN THIS FORMAT:  EX.  .01",! G FLDENTRY
 I FIELD="^" G INTENTRY
 
 ;LAST CHANCE TO EDIT
 W @IOF             ; CLEAR SCREEN
 W !!,"GLOBAL                      =",GLOBAL
 W !,"CROSS-REFERENCE             =",REFER
 W !,"RANGE TO RE-CROSS-REFERENCE =",INUM
 W !,"FIELD OF CROSS-REFERENCE    =",FIELD
 R !!,"ARE THESE PARAMETERS ALL CORRECT? N//",YN
 I '"Yy"[YN W @IOF G GBLENTRY
 
 ;SET VARIABLES FOR ROUTINE "EN^DIK" TO USE
 S DIK=GLOBAL
 S DIK(1)=FIELD_"^"_REFER
 S LNUM=$P(INUM,":",1)
 S UNUM=$P(INUM,":",2)
 
 ;CALL "EN^DIK" USING INTERNAL ENTRY NUMBER RANGE
 F DA=LNUM:1:UNUM D EN^DIK
 D KILLVARS
 Q
 
KILLVARS ;KILL ALL LOCAL VARIABLES
 ;K DIK,DIK(1),LNUM,UNUM,DA,GLOBAL,REFER,INUM,YN
 Q
