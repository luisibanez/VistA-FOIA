SROALTSP ;BIR/MAM - TRANSMITTED ASSESSMENTS (PRINTER) ;03/08/06
 ;;3.0; Surgery ;**32,50,142**;24 Jun 93
 K ^TMP("SRA",$J) S SRPAGE=0,(SRSOUT,SRDFN)=0 D HDR Q:SRSOUT
 F  S SRSD=$O(^SRF("AC",SRSD)) Q:'SRSD!(SRSD>SRED)!SRSOUT  S SRTN=0 F  S SRTN=$O(^SRF("AC",SRSD,SRTN)) Q:'SRTN!SRSOUT  S SR("RA")=$G(^SRF(SRTN,"RA")) I $P(SR("RA"),"^")="T",$D(^SRF(SRTN,0)),$$DIV^SROUTL0(SRTN) D UTL
 S SRSS="" F  S SRSS=$O(^TMP("SRA",$J,SRSS)) Q:SRSS=""!SRSOUT  D SS S SRTN=0 F  S SRTN=$O(^TMP("SRA",$J,SRSS,SRTN)) D:'SRTN LINE Q:'SRTN!SRSOUT  D SET
 I '$D(^TMP("SRA",$J)) W $$NODATA^SROUTL0()
 Q
UTL ; write to ^TMP("SRA",$J)
 I SRFLG,$P(^SRF(SRTN,0),"^",4)'=SRASP Q
 S SRSS=$P(^SRF(SRTN,0),"^",4),SRSS=$S(SRSS:$P(^SRO(137.45,SRSS,0),"^"),1:"SPECIALTY NOT ENTERED")
 S TYPE=$P(SR("RA"),"^",2) I SRSS="SPECIALTY NOT ENTERED",TYPE="C" S SRSS="N/A"
 S ^TMP("SRA",$J,SRSS,SRTN)=""
 Q
SET ; print assessments
 K SRCPTT S SRCPTT="NOT ENTERED"
 I $Y+5>IOSL D HDR I SRSOUT Q
 S SR("RA")=^SRF(SRTN,"RA"),SRAT="",Y=$E($P(SR("RA"),"^",4),1,7) I Y D D^DIQ S SRAT=Y
 S SRA(0)=^SRF(SRTN,0),DFN=$P(SRA(0),"^") N I D DEM^VADPT S SRANM=VADM(1),SRASSN=VA("PID") K VADM
 S SROPER=$P(^SRF(SRTN,"OP"),"^") I $O(^SRF(SRTN,13,0)) S SROTHER=0 F  S SROTHER=$O(^SRF(SRTN,13,SROTHER)) Q:'SROTHER  D OTHER
 S X=$P($G(^SRF(SRTN,"RA")),"^",2) I X="C" S SROPER="* "_SROPER
 K SROPS,MM,MMM S:$L(SROPER)<81 SROPS(1)=SROPER I $L(SROPER)>80 S SROPER=SROPER_"  " F M=1:1 D LOOP Q:MMM=""
 D TECH^SROPRIN
 S Y=$P(SRA(0),"^",9) D D^DIQ S SRDT=$P(Y,"@")
 S X=$P($G(^SRO(136,SRTN,0)),"^",2) I X S Y=$S(X:$P($$CPT^ICPTCOD(X),"^",2),1:"") D SSPRIN^SROCPT0 I $L(Y) S SRCPTT=Y
 W !,SRTN,?20,SRANM_" "_VA("PID"),?67,SRAT,?107,SRTECH,!,SRDT,?20,SROPS(1) S SRAO=1 F  S SRAO=$O(SROPS(SRAO)) Q:'SRAO  W !,?20,SROPS(SRAO)
 W !,?20,"CPT Code: "_SRCPTT
 W ! Q
OTHER ; other operations
 S SRLONG=1 I $L(SROPER)+$L($P(^SRF(SRTN,13,SROTHER,0),"^"))>165 S SRLONG=0,SROTHER=999,SROPERS=" ..."
 I SRLONG S SROPERS=$P(^SRF(SRTN,13,SROTHER,0),"^")
 S SROPER=SROPER_$S(SROPERS'=" ...":", "_SROPERS,1:SROPERS)
 Q
LOOP ; break procedures
 S SROPS(M)="" F LOOP=1:1 S MM=$P(SROPER," "),MMM=$P(SROPER," ",2,200) Q:MMM=""  Q:$L(SROPS(M))+$L(MM)'<44  S SROPS(M)=SROPS(M)_MM_" ",SROPER=MMM
 Q
HDR ; print heading
 I $D(ZTQUEUED) D ^SROSTOP I SRHALT S SRSOUT=1 Q
 S SRPAGE=SRPAGE+1 W:$Y @IOF W !,?52,"TRANSMITTED RISK ASSESSMENTS",?120,"PAGE "_SRPAGE,!,?(132-$L(SRINST)\2),SRINST,!,?58,"SURGERY SERVICE",?100,"DATE REVIEWED:"
 W !,?(132-$L(SRFRTO)\2),SRFRTO,?100,"REVIEWED BY:"
 W !!,"ASSESSMENT #",?20,"PATIENT",?67,"TRANSMISSION DATE",?107,"ANESTHESIA TECHNIQUE",!,"OPERATION DATE",?20,"PRINCIPAL OPERATIVE PROCEDURE",! F LINE=1:1:132 W "="
 Q
SS ;print surgical specialty
 I $Y+5>IOSL D HDR
 W !!,"** SURGICAL SPECIALTY: ",SRSS," **",!
 Q
LINE W ! F L=1:1:132 W "-"
 Q
