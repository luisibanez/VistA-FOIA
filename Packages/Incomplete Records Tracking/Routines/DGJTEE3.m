DGJTEE3 ;ALB/MAF - ENTER/EDIT (CONT) LIST PROCESSOR SET UP VARIABLES CONT. ;SEP 5 1992@100
 ;;5.3;Registration;;Aug 13, 1993
DATA N DA K DIR("A"),DIR("B") S DIR(0)="393,.03" D ^DIR G Q:Y="^"!$D(DTOUT) S DGJTDT=Y
 I DGJTAIFN]"",$D(^DGPM(DGJTAIFN,0)),Y<+^DGPM(DGJTAIFN,0) S Y=+^DGPM(DGJTAIFN,0) X ^DD("DD") W !!?10,"Event Date must be after admission"," ",Y,! G DATA
 I DGJTAIFN]"" S X=$S($D(^DGPM(DGJTAIFN,0)):$P(^(0),"^",17),1:"") I $D(^DGPM(+X,0)),Y>+^DGPM(+X,0) S Y=+^DGPM(+X,0) X ^DD("DD") W !!?10,"Event date must not be after discharge date"," ",Y,! G DATA
 I DGJTYP=1 S VAIP("D")="L"
 I DGJTYP'=1 S VAIP("D")=$S($P(DGJTDT,".",2)]"":DGJTDT,1:DGJTDT_".2400")
 I DGJTSR1=1 D IN5^VADPT
 K DIR("A"),DIR("B") I $D(VAIP(5)) S:VAIP(5)]"" DIR("B")=$P(VAIP(5),"^",2)
 S DIR(0)="393,.05" D ^DIR G Q:X["^"!$D(DTOUT) S DGJTWD=+Y,DGJTWD1=$S($D(^SC(DGJTWD,42)):+^(42),1:0) K DIR("B")
 I $D(VAIP(8)) I VAIP(8)]"" S DIR("B")=$P(VAIP(8),"^",2)
 S DIR(0)="393,.07" D ^DIR G Q:X["^"!$D(DTOUT) S DGJTSP=+Y K DIR("B")
 I '$D(^DIC(42,+DGJTWD1,0)) S DGJTSV=$P(^SC(+DGJTWD,0),"^",8)
 I $D(^DIC(42,+DGJTWD1,0)) S DGJTSV=$P(^(0),"^",3)
 S:DGJTSV="" DGJTSV=0 S DGJTSV=$S(DGJTSV=0:12,$D(^DG(393.1,"AC",DGJTSV)):$O(^(DGJTSV,0)),1:"") I DGJTSV]"" S (DGJTSV,DIR("B"))=$P(^DG(393.1,+DGJTSV,0),"^",1)
 S DIR(0)="393,.08" D ^DIR G Q:X["^"!$D(DTOUT) S DGJTSV=+Y K DIR("B")
 I DGJTSR1=1 S X=$P(DGJTDEL,"^",2) D DOC S:X]"" DIR("B")=X
 S DIR(0)="393,.09" D ^DIR G Q:X["^"!$D(DTOUT) S DGJT1PH=+Y K DIR("B")
 S X="" I $P(DGJTDEL,"^",3)=0&($P(DGJTDEL,"^",10)="A") S:DGJTSR1=1 X=$P(DGJTDEL,"^",10)
 S X="" I $P(DGJTDEL,"^",3)=1 S:DGJTSR1=1 X=$P(DGJTDEL,"^",4)
 I $P(DGJTDEL,"^",3)=1!($P(DGJTDEL,"^",3)=0&($P(DGJTDEL,"^",10)="A")) D:DGJTSR1=1 DOC S:X]"" DIR("B")=X S DIR(0)="393,.1" D ^DIR G Q:X["^"!$D(DTOUT) I Y'=-1 S DGJT2PH=$S(Y]"":+Y,1:"@")
 S DIR("B")=$S(DGJT1PH]"":$P(^VA(200,DGJT1PH,0),"^",1),1:"")
 S DIR(0)="393,.12" D ^DIR G Q:X["^"!$D(DTOUT) S DGJTPR=+Y K DIR("B")
FILE K DD,DO S DGSENFLG="",DIC="^VAS(393,",DIC(0)="EL",X=DFN D FILE^DICN K DIC,DGSENFLG
 S DGJTEDT="1^"_+Y,DIE="^VAS(393,",DA=+Y
 I "^OP REPORT^DISCHARGE SUMMARY^INTERIM SUMMARY^"'[$P(^VAS(393.3,DGJTYP,0),"^",1) S DR="[DGJ ENTER IRT DEFICIENCY]" D ^DIE Q
 I "^OP REPORT^DISCHARGE SUMMARY^INTERIM SUMMARY^"[$P(^VAS(393.3,DGJTYP,0),"^",1) S DR="[DGJ ENTER IRT RECORD]"
 D ^DIE
 D INIT1^DGJTEE2 Q
Q I X="^"!($D(DTOUT)) S VALMBG=1,VALMBCK="R"
 Q
SCR S DGJTCT=0 F IFN=0:0 S IFN=$O(^VAS(393,"B",DFN,IFN)) Q:'IFN  I $D(^VAS(393,IFN,0)),$P(^VAS(393,IFN,0),"^",4)="" D SCR1
 Q
SCR1 S DGJTF=0 D DIVCK S DGJTADN=^VAS(393,IFN,0) Q:$P(DGJTDV,"^",1)'=$P(DGJTADN,"^",6)  S DGJTYP=$P(DGJTADN,"^",2) N CC,CM,CW,DC,DW,EC,EW,PC,PW,RV,SC,SN,SW,TC,TW D INCSP^DGJTEE2 I '$D(DGJTDLT) D STATCK^DGJTEE1 I $D(DGJFL1) K DGJFL1 Q
 D SETG1^DGJTEE1
 Q
DIVCK S X=$P(^VAS(393,IFN,0),"^",6) I X'=+DGJTDV S DGJTF=1
 S DGJTDEL=$S($D(^DG(40.8,+X,"DT")):^("DT"),1:DGJTDEL)
 S X=$S($P(DGJTDEL,"^",3)=0:$O(^DG(393.2,"B","SIGNED",0)),1:$O(^DG(393.2,"B","REVIEWED",0))) Q
DOC S DGJT=$S($D(^DGPM(+VAIP(1),0)):$P(^(0),"^",14),1:""),DGJT=$O(^DGPM("ATS",DFN,+DGJT,0)),DGJT=$O(^(+DGJT,0)),DGJT=$O(^(+DGJT,0)),DGJT=$S($D(^DGPM(+DGJT,0)):^(0),1:"") ;last treating specialty mvt
 D DOC1 S X=$S($D(^VA(200,+X,0)):$P(^(0),U),1:"") Q
DOC1 ;provider responsible
 S X=$S(X="A":$P(DGJT,"^",19),X="N":"",1:$P(DGJT,"^",8))
 Q
DT1 S DGJTADTP=+DGJTOA(DGJTCT),DGJTADTP=$S($D(^DGPM(DGJTADTP,0)):$P(^(0),"^",18),1:"") I DGJTADTP]"" S DGJTADTP=$S($D(^DG(405.2,+DGJTADTP,0)):$P(^(0),"^",1),1:"") Q
 Q
TMP ;
 K ^TMP("DGJRPT",$J)
 N VALMCNT,DGJCNT
 S X="",(VALMCNT,DGJCNT)=0,VALMBG=1
 S X=$$SETSTR^VALM1("No Deficiency was created for this Patient",X,1,50)
 D TMP^DGJTVW2
 Q
JUMP D FULL^VALM1 I $D(XQORNOD(0)),$P(XQORNOD(0),"^",4)]"" S X=$P(XQORNOD(0),"^",4) S X=$P(X,"=",2) I X]"" S DIC="^VAS(393.41,",DIC(0)="QEZ" D ^DIC G:Y<0 JMP S Y=+Y D JUMP1 Q
JMP S DIC="^VAS(393.41,",DIC(0)="AEMN",DIC("A")="Select Category you wish to move to: " D ^DIC K DIC
 I X["^" S VALMBG=1,VALMBCK="R" Q
JUMP1 I Y<0 G JUMP
 N DGJXCAT
 S DGJXCAT=+Y
 I '$D(DGJCAT(DGJXCAT)) W !!,"This Category does not contain any deficiencies." G JMP
 S VALMBG=DGJCAT(DGJXCAT) S VALMBCK="R" Q
 Q
