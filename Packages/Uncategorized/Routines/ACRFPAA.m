ACRFPAA ;IHS/OIRM/DSD/THL,AEF - PRINT ADVICE OF ALLOWANCE; [ 11/01/2001   9:44 AM ]
 ;;2.1;ADMIN RESOURCE MGT SYSTEM;;NOV 05, 2001
 ;;ROUTINE TO PRINT ADVICE OF ALLOWANCE
EN D EN1
EXIT K ^TMP("SSA",$J),ACRO1,ACRO2,ACRO3,ACRO4,ACRQ1,ACRO1,ACRI1,ACRD1,ACRQ2,ACRO2,ACRI2,ACRD2,ACRQ3,ACRO3,ACRI3,ACRD3,ACRQ4,ACRO4,ACRI4,ACRD4,ACRGTOT,ACRQ1,ACRQ2,ACRQ3,ACRQ4,ACRTI,ACRI1,ACRI2,ACRI3,ACRI4,ACRTD,ACRD1,ACRD2
 K ACRD3,ACRD4,ACRFY,ACRSSANO,ACRTOT,ACRREC,ACRNREC,ACRSSA,ACRREC,ACRNREC,ACRTOT,ACRRTOT,ACRNTOT,ACRSSA,ACRX,ACRI,ACRALW,ACRAMDNO,ACRTODAY,ACRTO,ACRSTRET,ACRCITY,ACRSTATE,ACRZIP,ACRAPP,ACRAPPNO,ACRAPT,ACRBA,ACRBANO
 W @IOF
 Q
EN1 S ACRX="HEADQUARTERS FINANCE"
 W !?80-$L(ACRX)\2,ACRX
 W !
 F ACRI=1:1:79 W "-"
 W !,"TO:"
 W ?40,"ALLOWANCE"
 W ?52,"AMENDMENT"
 W ?63,"DATE"
 W !,"DIRECTOR"
 W ?40,$E(ACRFY,2),"-",ACRALW
 W ?56,ACRAMDNO
 W ?63,ACRTODAY
 W !,ACRTO
 W ?40
 F ACRI=1:1:39 W "-"
 W !,ACRSTRET
 W ?40,"ALLOTMENT NO."
 W !,ACRCITY,", ",ACRSTATE,"  ",ACRZIP
 W ?42,ACRALW
 W !?40
 F ACRI=1:1:39 W "-"
 W !?40,"APPROPRIATION SYMBOL"
 W !?42,ACRAPP
 W !?40
 F ACRI=1:1:39 W "-"
 W !?40,"ACTIVITY"
 W ?65,"ACC'T POINT"
 W !?40,ACRBA
 W ?67,ACRAPT
 W !
 F ACRI=1:1:79 W "-"
 W !?19,"FIRST"
 W ?32,"SECOND"
 W ?45,"THIRD"
 W ?59,"FOURTH"
 W !?19,"QUARTER"
 W ?32,"QUARTER"
 W ?45,"QUARTER"
 W ?59,"QUARTER"
 W ?71,"TOTAL"
 W !
 F ACRI=1:1:79 W "-"
 W !,"ORIGINAL"
 S ACRTO=ACRO1+ACRO2+ACRO3+ACRO4,ACRQ1=ACRO1+ACRI1+ACRD1,ACRQ2=ACRO2+ACRI2+ACRD2,ACRQ3=ACRO3+ACRI3+ACRD3,ACRQ4=ACRO4+ACRI4+ACRD4,ACRGTOT=ACRQ1+ACRQ2+ACRQ3+ACRQ4,ACRTI=ACRI1+ACRI2+ACRI3+ACRI4,ACRTD=ACRD1+ACRD2+ACRD3+ACRD4
 W !,"ALLOWANCE"
 W ?15,$J(ACRO1,11)
 W ?28,$J(ACRO2,11)
 W ?41,$J(ACRO3,11)
 W ?54,$J(ACRO4,11)
 W ?67,$J(ACRTO,11)
 W !
 F ACRI=1:1:79 W "-"
 W !!,"INCREASE"
 W ?15,$J(ACRI1,11)
 W ?28,$J(ACRI2,11)
 W ?41,$J(ACRI3,11)
 W ?54,$J(ACRI4,11)
 W ?67,$J(ACRTI,11)
 W !
 F ACRI=1:1:79 W "-"
 W !!,"DECREASE"
 W ?15,$J(ACRD1,11)
 W ?28,$J(ACRD2,11)
 W ?41,$J(ACRD3,11)
 W ?54,$J(ACRD4,11)
 W ?67,$J(ACRTD,11)
 W !
 F ACRI=1:1:79 W "-"
 W !!,"QUARTER"
 W ?15,$J(ACRQ1,11)
 W ?28,$J(ACRQ2,11)
 W ?41,$J(ACRQ3,11)
 W ?54,$J(ACRQ4,11)
 W ?67,$J(ACRGTOT,11)
 W !
 F ACRI=1:1:79 W "-"
 W !,"CURRENT DISTRIBUTION:"
 S ACRPRT=$S(ACRGREF["ALW":"^ACRFALT",ACRGREF["ALC":"^ACRFALC",1:"^ACRFLOC")
 N DXS,DIP,DC,D0,DN
 S D0=ACRZDA
 D @ACRPRT
 W !!,"DISTRIBUTION"
 W ?37,"RECURRING"
 W ?50,"NON-RECURRG"
 W ?68,"TOTAL"
 W !,"-----------------------------"
 W ?35,"-----------"
 W ?50,"-----------"
 W ?65,"-----------"
 S (ACRSSANO,ACRGTOT,ACRRTOT,ACRNTOT)=0
 F  S ACRSSANO=$O(^TMP("SSA",$J,"TOT",ACRSSANO)) Q:'ACRSSANO  D
 .D SET
 .D WRITE
 S ACRGTOT=ACRRTOT+ACRNTOT
 W !,"-----------------------------"
 W ?35,"-----------"
 W ?50,"-----------"
 W ?65,"-----------"
 W !,"TOTAL ALLOWANCES"
 W ?35,$J(ACRRTOT,11)
 W ?50,$J(ACRNTOT,11)
 W ?65,$J(ACRGTOT,11)
 W !
 F ACRI=1:1:79 W "-"
 W !,"CERTIFIED-DIVISION OF FINANCE-PHS"
 W ?40,"SIGNATURE"
 W !!?40,"CARL FITZPATRICK"
 W !?40
 F ACRI=1:1:39 W "-"
 W !?40,"Director, Division of Resource Mgt"
 W !?40,"Indian Health Service"
 Q
SET S (ACRTOT,ACRREC,ACRNREC)=0
 S ACRSSA=$P(^AUTTSSA(ACRSSANO,0),U,2)
 S ACRX=^TMP("SSA",$J,"TOT",ACRSSANO)
 S ACRREC=$P(ACRX,U)
 S ACRNREC=$P(ACRX,U,2)
 S ACRTOT=ACRREC+ACRNREC
 S ACRRTOT=ACRRTOT+ACRREC
 S ACRNTOT=ACRNTOT+ACRNREC
 Q
WRITE W !,ACRSSA
 W ?35,$J(ACRREC,11)
 W ?50,$J(ACRNREC,11)
 W ?65,$J(ACRTOT,11)
 Q
