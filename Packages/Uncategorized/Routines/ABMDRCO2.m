ABMDRCO2 ; IHS/ASDST/DMJ - CO VISITS REPORT (PRINT) ;
 ;;2.6;IHS 3P BILLING SYSTEM;;NOV 12, 2009
 ;Original;TMD;02/07/96 12:22 PM
 ;
INIT G END:'$D(^TMP("ABMDRCO",ABMD("$J"))) S ABMD("TOT")=0,ABMD("STOP")=""
 S ABMD("FAC")=$P(^DIC(4,DUZ(2),0),"^")
 S ABMD("BDT")=$$SDT^ABMDUTL(ABMD("BDT"))
 S ABMD("EDT")=$$SDT^ABMDUTL(ABMD("EDT"))
 S ABMD("CHMP")=$O(^AUTNINS("B","CHAMPUS",0))
 ;
MAIN I $D(ABMD("TOP")) S ABMD("II")="O" D PRINT,TOTAL^ABMDRCO3 Q:ABMD("STOP")="^"
 I $D(ABMD("TIP")) S ABMD("II")="I" D PRINT,TOTAL^ABMDRCO3 Q:ABMD("STOP")="^"
 I $D(ABMD("TDEN")) S ABMD("II")="D" D PRINT,TOTAL^ABMDRCO3
 Q
 ;
END K:$D(ABMD("$J")) ^TMP("ABMDRCO",ABMD("$J"))
 K ABMD,ABMDSTOP
 Q
 ;
PRINT ;
 D HEAD^ABMDRCO3 S ABMD("BEN")=0
P1 S ABMD("BEN")=$O(^TMP("ABMDRCO",ABMD("$J"),ABMD("II"),ABMD("BEN"))) Q:ABMD("BEN")=""  S ABMD("NAME")=0
P2 S ABMD("NAME")=$O(^TMP("ABMDRCO",ABMD("$J"),ABMD("II"),ABMD("BEN"),ABMD("NAME"))) G P1:ABMD("NAME")="" S (ABMD("DFN"),ABMD("SUB"))=0
P3 S ABMD("DFN")=$O(^TMP("ABMDRCO",ABMD("$J"),ABMD("II"),ABMD("BEN"),ABMD("NAME"),ABMD("DFN"))) I ABMD("DFN")="" W:ABMD("II")'="I" ?114,ABMD("SUB") G P2
 ;
 S ABMD("VDT")=0
P4 S ABMD("VDT")=$O(^TMP("ABMDRCO",ABMD("$J"),ABMD("II"),ABMD("BEN"),ABMD("NAME"),ABMD("DFN"),ABMD("VDT"))) G P3:ABMD("VDT")="" S ABMD("VDFN")=0
P5 S ABMD("VDFN")=$O(^TMP("ABMDRCO",ABMD("$J"),ABMD("II"),ABMD("BEN"),ABMD("NAME"),ABMD("DFN"),ABMD("VDT"),ABMD("VDFN"))) G P4:ABMD("VDFN")="" S ABMD("STR")=^(ABMD("VDFN"))
 S ABMD("HRCN")=$P(ABMD("STR"),"^") S:ABMD("II")="I" ABMD("DSCH")=$P(ABMD("STR"),"^",2)
 S ABMD("BENP")=$P(^AUTTBEN(ABMD("BEN"),0),"^",2) I ABMD("BENP")="03",'$D(ABMD("COFLG")) S ABMD("COFLG")=""
 I ABMD("BENP")'="03",$D(ABMD("COFLG")) D TOTAL^ABMDRCO3 K ABMD("COFLG") D HEAD^ABMDRCO3
 S ABMD("BENP")=$S(ABMD("BENP")="03":"CO",ABMD("BENP")="04":"DEP",ABMD("BENP")="30":"RET",1:"RETD")
 S ABMD("SSN")=$P(^DPT(ABMD("DFN"),0),"^",9)
 S:ABMD("SSN")'="" ABMD("SSN")=$E(ABMD("SSN"),1,3)_"-"_$E(ABMD("SSN"),4,5)_"-"_$E(ABMD("SSN"),6,9)
 ;
WRITE ;print line
 D PAGE^ABMDRCO3:$Y>(IOSL-4) Q:ABMD("STOP")="^"  ;check for end of page
 W:ABMD("SUB")=0 !,$E(ABMD("NAME"),1,20),?23,$J(ABMD("HRCN"),6),?33,ABMD("SSN"),?48,ABMD("BENP")
 I ABMD("II")'="I",(ABMD("SUB")'=0) W !
 D PRVTINS^ABMDRCO3
 W ?97,$$SDT^ABMDUTL(ABMD("VDT"))
 I ABMD("II")'="I" S ABMD("TOT")=ABMD("TOT")+1,ABMD("SUB")=ABMD("SUB")+1 G P5
 W ?110,$$SDT^ABMDUTL(ABMD("DSCH"))
 S X1=ABMD("DSCH"),X2=ABMD("VDT") D ^%DTC S:X=0 X=1 W ?123,X
 S ABMD("TOT")=ABMD("TOT")+X G P5
 D HEAD^ABMDRCO3
