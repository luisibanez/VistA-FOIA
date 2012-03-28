AZXALKI1 ; IHS/PHXAO/TMJ - IDENTIFIERS FOR DISCLOSURE LOOKUP 2 ;
 ;;2.0;RELEASE OF INFORMATION;;FEB 21, 2002
 ;This Routine Displays Lookup for ^AZXAREC Global
 ;This routine is called from ^AZXAADD and uses different global
 ;references than ^AZXALKID
 ;
 ;At Lookup - Displays Date Initiated
 ;            Disclosure Number
 ;            Patient Name
 ;            Requesting Party
 ;            Purpose of Disclosure
 ;    If Requesting Party or Purpose are Null Displays UNKNOWN
 ;
START ; EXTERNAL ENTRY POINT - 
 ; PRINT DISPLAY OF RECORDS BEFORE ADDING NEW DISCLOSURE
 W !
 S AZXARDT=$$REFDTI^AZXARLU(AZXARIEN,"S") S AZXARDTP=$S(AZXARDT'="":AZXARDT,1:"UNKNOWN DATE INITIATED") W ?2,AZXARDTP
 W ?11,$P(^AZXAREC(AZXARIEN,0),U,2)," "
 S AZXAPAT=$P(^DPT(AZXADFN,0),U) W ?18,$E(AZXAPAT,1,15)," "
 S AZXARFAC=$$FACREF^AZXARLU(AZXARIEN) W ?50,$E($S(AZXARFAC'="":AZXARFAC,1:"UNKNOWN"),1,30)
 ;Returns either Date of Disclosure or Uknown Date
 S AZXASVDT=$$AVDOS^AZXARLU(AZXARIEN,"S") S AZXASVDTP=$S(AZXASVDT'="":AZXASVDT,1:"UNKNOWN DISCLOSURE DATE") W !,?18,AZXASVDTP
 ;
TEST ;
 ;S AZXAPURP=$P($G(^AZXAREC(AZXARIEN,0)),U,7) S AZXAPURPP=$S(AZXAPURP'="":AZXAPURP,1:"Purpose - NONE RECORDED") W ?50,$E(AZXAPURPP,1,30)
 W ?50,"Purpose:  ",$$VAL^XBDIQ1(1991075,AZXARIEN,.07)
 ;W !
 ;S AZXATYP=$P($G(^AZXAREC(AZXARIEN,0)),U,4) S AZXATYPP=$S(AZXATYP'="":AZXATYPP,1:"Type - NONE RECORDED") W ?50,$E(AZXATYPP,1,30)
 W !
 W ?18,"Status: ",$$VAL^XBDIQ1(1991075,AZXARIEN,.08)
 W ?50,"Type:  ",$$VAL^XBDIQ1(1991075,AZXARIEN,.04)
 W !
XIT ;Kill off Variables no longer needed
 K AZXAPAT,AZXAPTDFN,AZXAPURP,AZXAPURPP,AZXARFAC,AZXASVDT,AZXASVDTP,AZXARDT,AZXARDTP
 Q
 ;
 ;
