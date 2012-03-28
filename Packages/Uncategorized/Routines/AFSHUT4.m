AFSHUT4 ; IHS/OIRM/DSD/JDM -AFSH PACKAGE SUBROUTINES (PRINTER SELECTION, ETC.) ;  [ 10/27/2004   4:20 PM ]
 ;;3.0T1;AO FINANCIAL DATA MGMT SYSTEM;**13**;FEB 02, 1999
 ;;MODIFIED FOR CACHE' COMPLIANCE ;ACR*2.1*9
PTRDEF ;EP -- DEFINE PRINTERS AVAILABLE TO PROGRAM
B0 I '$D(^AUTTTEL(DUZ(2),5)) S AFSERMSG="DEFAULT PRINTER PORT NOT DEFINED -- JOB ABORTED" S AFSJFLG=1 G JCANCEL
 S X=$P(^AUTTTEL(DUZ(2),5),"^",1),AFSDPRT=+X
 S AFSVPRT(X)=X,AFSQ=0
B2 S AFSQ=$O(^AUTTTEL(DUZ(2),6,AFSQ)) G B2B:+AFSQ=0
 S X=+$P(^AUTTTEL(DUZ(2),6,AFSQ,0),"^",1) S:X>0 AFSVPRT(X)=X
 G B2
B2B Q
PTRSEL ;EP  --  SELECT A DEFINED PRINTER
 I $D(AFSVPRT(AFSDPRT)) S AFSSPRT=AFSDPRT
B4A W !!,"What PRINTER do you want to USE : "_AFSSPRT_"// " D SBRS^AFSHPRT1
 I $D(DTOUT)!($D(DUOUT)) S AFSERMSG="PROGRAM AND/OR FUNCTION CANCELLED BY OPERATOR",AFSJFLG=1 G JCANCEL
 I $D(DLOUT) S Y=AFSDPRT
 I $D(DQOUT) D DSPVRT4^AFSHPRT1 G B4A
B4C I '$D(AFSVPRT(+Y)) W !!,*7,?10,"INVALID PRINTER NUMBER -- TRY AGAIN" G B4A
 S AFSSPTR=+Y,IOP=+Y D ^%ZIS I IO="" W !!,*7,"PRINTER NOT AVAILABLE -- TRY LATER" H 3 G B4A
 Q
JCANCEL U IO(0) W *7,!!,AFSERMSG,!,?10,"ENTER <RETURN> TO EXIT" S DX=$X+2,DY=$Y,%L=1,%F="A" D DAT1^AFSHCALL S AFSJFLG=1 Q
 Q
PARMCHK ;EP;          Subroutine moved from AFSTUT4 ACR*2.1*13.06 IM14144
 K AFSJFLG
 I '$D(AFSCCTR) S AFSERMSG="RECEIVING COMPUTER CENTER NOT DEFINED -- JOB ABORTED" G JCANCEL
 I '$D(AFSPKGNM) S AFSERMSG="APPLICATION DATA TYPE NOT DEFINED -- JOB ABORTED" G JCANCEL
 D USRCHK^AFSTUT3
 I $D(AFSJFLG) G JCANCEL
 I $L(AFSUXFPF)<2 S AFSERMSG="INVALID COMM. PARAMETER (UNIX FILENAME) -- JOB ABORTED" G JCANCEL
 ;S %SDIR="/usr/spool/"_AFSUXFPF_"data"  ;ACR*2.1*13.06 IM14144
 S %SDIR=$$ARMSDIR^ACRFSYS(1)         ;ACR*2.1*13.06 IM14144
 S %SDIR=%SDIR_AFSUXFPF_"data"        ;ACR*2.1*13.06 IM14144
 Q:AFSPKGNM?1"Z".E
 I $D(AFSHDTNM),$E(AFSHDTNM,1,3)="DHR" G CNVRT
 I AFSPKGNM="ACHS" G A7
 I AFSPKGNM="AEQ" S AFSHDTNM="tx" G A7 ;pdw
 I AFSPKGNM="AFSN" S AFSHDTNM="nu" G A7
 I AFSPKGNM="AFSL" S AFSHDTNM=$S(AFSLPK1=1:"lud",1:"lut") G A7
 I AFSPKGNM'="AFSH" S AFSHDTNM="ibm" G A7
 I AFSPKGNM="AFSH"&('$D(AFSHDTNM)) S AFSERMSG="FINANCE DATA TYPE NOT DEFINED -- JOB ABORTED" G JCANCEL
CNVRT S X=$S(AFSHDTNM="DHRB":"dhb",AFSHDTNM="DHRP":"dhp",AFSHDTNM="PERP":"perp",AFSHDTNM="CANP":"canp",AFSHDTNM="DHRC":"dhc",1:"")
 I X="" S AFSERMSG="FINANCE DATA TYPE IS INVALID -- JOB ABORTED" G JCANCEL
A4 S AFSHDTNM=X
 I '$D(^DIC(9.4,AFSPKGPT,0)) S AFSERMSG="PACKAGE FILE PROBLEM --  JOB ABORTED" G JCANCEL
A7 U IO(0) D ^XBCLS
 S AFSTXNAM=$P(^DIC(9.4,AFSPKGPT,0),"^",1)
 I AFSPKGNM="AFSH" S X=$E(AFSHDTNM,1,2),X=$S(X="dh":"DOCUMENT HISTORY RECORD (DHR)",X="pe":"PERSONNEL C.A.N. CORRECTION",X="ca":"REQUEST FOR C.A.N."),AFSTXNAM="FINANCE "_X
 S AFSTXNAM="FINANCE "_X G A9
A9 Q
