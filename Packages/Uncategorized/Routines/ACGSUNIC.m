ACGSUNIC ;IHS/OIRM/DSD/THL,AEF - UNICOR COST REPORT; [ 03/27/2000   2:22 PM ]
 ;;2.0t1;CONTRACT INFORMATION SYSTEM;;FEB 16, 2000
 ;;PRINT UNICOR COST REPORT
EN D EN1
EXIT K ACGQUIT,ACG,ACG2,ACG4,ACG4X,ACG13,ACG26,ACG36,ACGBEGIN,ACGEND,ACG5,ACGBEG,ACGFY,ACGQT,ACGION,ACGX,ACGT
 Q
EN1 K ACGQUIT
 D QT^ACGSCPAR
 I $D(ACGQUIT) K ACGQUIT Q
 I ACG4=236 D CO^ACGSCPAR Q:$D(ACGQUIT)  I 1
 E  S (ACG4,ACG4X)=ACG4
ZIS S ZTRTN="EN2^ACGSUNIC",ZTDESC="CIS QT UNICOR REPORT",ZTSAVE("ACG*")=""
 D ^ACGSZIS
 Q:$D(ACGQUIT)
EN2 I '$D(ZTQUEUED) S (ACGIOP,IOP)=ION D ^%ZIS I POP S ACGQUIT="" Q
 U IO
 I ACG4X=88 F ACG4=102,121,161,235,239,241:1:249,284,285 K ACGQUIT D R1
 G:ACG4X=88 DONE
R1 G:$D(ACGQUIT) DONE
 D ENX
 W:$D(IOF) @IOF
 D:ACG4X'=88 DONE
 Q
DONE D DONE^ACGSZIS
 Q
ENX K ACG
 S ACGBEG=ACGBEGIN,ACGT=0
 F  S ACGBEG=$O(^ACGS("T",ACGBEG)) Q:'ACGBEG!(ACGBEG>ACGEND)  S ACG=0 F  S ACG=$O(^ACGS("T",ACGBEG,ACG)) Q:'ACG  D
 .S ACG5=$P(^ACGS(ACG,"DT"),U,5),ACG1=+^("DT"),ACG2=$P(^("DT"),U,2),ACG26=$P(^("DT1"),U,5),ACG36=$S($D(^("DT2")):$P(^("DT2"),U),1:"")
 .Q:'ACG1!(ACG1=15)!(ACG1=17)
 .Q:"UNICOR"'=$E(ACG5,1,6)&(ACG5'["FEDERAL PRISON")&(ACG5'["Federal Prison")
 .Q:ACG26<100000
 .I ACG4X=88,ACG4'=$E(ACG2,1,3) Q
 .I ACG4'=99,ACG4'=236,ACG4'=$E(ACG2,1,3) Q
 .S ACG(ACG2)=ACG26,ACGT=ACGT+ACG26
 D EN3
 I $D(IOST),$E(IOST,1,2)="C-" D HOLD^ACGSMENU
 Q
EN3 S ACGX="QUARTERLY UNICOR REPORT"
 D RDATE^ACGSICR
 W !!?5,"Contract awards ($100,000 and above) for products and services",!?5,"obtained from Federal Prison Industries (UNICOR)",!!?5,"CONTRACT NO.",?41,"TOTAL DOLLARS AWARDED",!?5,"---------------",?41,"---------------------"
 S ACG=""
 F  S ACG=$O(ACG(ACG)) Q:ACG=""  S ACGX=ACG(ACG) D
 .W !?5,ACG,?41,$J($FN(ACGX,"P,",0),16)
 W !?41,"---------------------",!?30,"TOTALS",?41,$J($FN(ACGT,"P,",0),16)
 Q
