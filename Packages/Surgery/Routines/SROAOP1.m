SROAOP1 ;BIR/MAM - SET OPERATION INFO ;03/08/06
 ;;3.0; Surgery ;**38,47,63,81,88,95,97,125,142**;24 Jun 93
 K SRA,SRAO F I=0,200,"OP" S SRA(I)=$G(^SRF(SRTN,I))
 S SRDOC="Surgeon: "_$P(^VA(200,$P(^SRF(SRTN,.1),"^",4),0),"^") F I=3,4,5 S SRAO(I)=""
 K SROPS S SROPER=$P(SRA("OP"),"^")
 S SRAO(2)="^26"
 S:$L(SROPER)<52 SROPS(1)=SROPER K M,MM,MMM I $L(SROPER)>51 S SROPER=SROPER_"  " F M=1:1 D LOOP Q:MMM=""
 S X=$P(SRA(0),"^",4) S:X X=$P(^SRO(137.45,X,0),"^",1) S SRAO(1)=X_"^.04"
 S X=$P(SRA(0),"^",3) S:X'="" X=$S(X="J":"MAJOR",1:"MINOR") S SRAO(12)=X_"^.03"
 S SRHDR(.5)=SRDOC,SRPAGE="PAGE: 1 OF 2" D HDR^SROAUTL
 S X=$P($G(^SRO(136,SRTN,0)),"^",3) S:X X=$$ICDDX^ICDCODE(X,$P($G(^SRF(SRTN,0)),"^",9)),X=$P(X,"^",2)_"   "_$P(X,"^",4)
 W "Postop Diagnosis Code (ICD9): ",$S(X'="":X,1:"NOT ENTERED"),!
 W !," 1. Surgical Specialty: ",?28,$P(SRAO(1),"^"),!," 2. Principal Operation: ",?28,SROPS(1) I $D(SROPS(2)) W !,?28,SROPS(2) I $D(SROPS(3)) W !,?28,SROPS(3) I $D(SROPS(4)) W !,?28,SROPS(4)
 N SRPROC,SRL S SRL=52 D CPTS W !," 3. CPT Codes (view only):" I SRPROC(1)="" S SRPROC(1)="NOT ENTERED"
 F I=1:1 Q:'$D(SRPROC(I))  W:I=1 ?28,SRPROC(I) W:I'=1 !,?28,SRPROC(I)
 W !," 4. Other Procedures:" W:$O(^SRF(SRTN,13,0)) ?28,"***INFORMATION ENTERED***"
 W !," 5. Concurrent Procedure:" S CON=$P($G(^SRF(SRTN,"CON")),"^") I CON,'($P($G(^SRF(CON,30)),"^")!($P($G(^SRF(CON,31)),"^",8))) W ?28,"***INFORMATION ENTERED***"
 S X=$P(SRA(200),"^",52),SRAO(6)=X_"^214",NYUK=$P(SRA(0),"^",10) D EMERG S SRAO(7)=SHEMP_"^.035"
 S Y=$P($G(^SRF(SRTN,"1.0")),"^",8),C=$P(^DD(130,1.09,0),"^",2) D:Y'="" Y^DIQ S SRAO(8)=Y_"^1.09"
 S Y=$P($G(^SRF(SRTN,1.1)),"^",3),C=$P(^DD(130,1.13,0),"^",2) D:Y'="" Y^DIQ S SRAO(9)=Y_"^1.13"
 D TECH^SROPRIN S SRAO(10)=SRTECH
 S X=$P(SRA(200),"^",54),SRAO(11)=X_"^340" K SRA(.2)
 W !," 6. PGY of Primary Surgeon:",?28,$P(SRAO(6),"^"),!," 7. Surgical Priority:",?28,$P(SRAO(7),"^"),!," 8. Wound Classification: ",?28,$P(SRAO(8),"^")
 W !," 9. ASA Classification:",?28,$P(SRAO(9),"^")
 W !,"10. Principal Anesthesia Technique: ",$P(SRAO(10),"^")
 W !,"11. RBC Units Transfused:",?28,$P(SRAO(11),"^")
 W !,"12. Major or Minor:",?28,$P(SRAO(12),"^"),! F LINE=1:1:80 W "-"
 Q
YN S SHEMP=$S(NYUK="NS":"NS",NYUK="N":"NO",NYUK="Y":"YES",1:"")
 Q
LOOP ; break procedures
 S SROPS(M)="" F LOOP=1:1 S MM=$P(SROPER," "),MMM=$P(SROPER," ",2,200) Q:MMM=""  Q:$L(SROPS(M))+$L(MM)'<52  S SROPS(M)=SROPS(M)_MM_" ",SROPER=MMM
 Q
EMERG ; surgical priority
 I NYUK="" S SHEMP="" Q
 S Y=NYUK,C=$P(^DD(130,.035,0),"^",2) D Y^DIQ S SHEMP=Y
 Q
CPTS ; put CPT codes in array for display
 N SRDA,K,X,XX,Y K SRPROC S K=1,Y=$P($G(^SRO(136,SRTN,0)),"^",2),Y=$S(Y:$P($$CPT^ICPTCOD(Y),"^",2),1:"")
 I $L(Y) D SSPRIN^SROCPT0
 S SRPROC(K)=$S($L(Y):Y,1:"")
 S SRDA=0 F  S SRDA=$O(^SRO(136,SRTN,3,SRDA)) Q:'SRDA  D
 .S Y=$P($G(^SRO(136,SRTN,3,SRDA,0)),"^"),Y=$S(Y:$P($$CPT^ICPTCOD(Y),"^",2),1:"")
 .I $L(Y) D SSOTH^SROCPT0
 .I $L(Y)+$L(SRPROC(K))'>SRL S SRPROC(K)=SRPROC(K)_", "_Y Q
 .S K=K+1,SRPROC(K)=Y
 Q
DISP ; display CPT code info
 N SRFIRST,SRMO,SRMOD S SRPAGE="" D HDR^SROAUTL S SRFIRST=0,SRW="NOT ENTERED"
 S Y=$P($G(^SRO(136,SRTN,0)),"^",2) I Y S Y=$P($$CPT^ICPTCOD(Y),"^",2) D DES^SROCPT0
 W "Principal CPT Code: "_SRW I $G(SRDES(1))'="" F I=1:1 Q:$L(SRDES(I))'>1  W !,?5,SRDES(I)
 I $O(^SRO(136,SRTN,1,0)) W !,?3,"Modifier: " D
 .S SRMOD=0 F  S SRMOD=$O(^SRO(136,SRTN,1,SRMOD)) Q:'SRMOD  D
 ..S SRMO=$P(^SRO(136,SRTN,1,SRMOD,0),"^")
 ..W:SRFIRST !,?13 W $P($$MOD^ICPTMOD(SRMO,"I"),"^",2),"-",$P($$MOD^ICPTMOD(SRMO,"I"),"^",3)
 ..S SRFIRST=1
 K SRDES W !
OTH S SROTH=0 F  S SROTH=$O(^SRO(136,SRTN,3,SROTH)) Q:'SROTH  D  K SRDES W !
 .S Y=$P($G(^SRO(136,SRTN,3,SROTH,0)),"^"),Y=$S(Y:$P($$CPT^ICPTCOD(Y),"^",2),1:"") D DES^SROCPT0
 .W !,"Other CPT Code:     "_SRW I $G(SRDES(1))'="" F I=1:1 Q:$L(SRDES(I))'>1  W !,?5,SRDES(I)
 .I $O(^SRO(136,SRTN,3,SROTH,1,0)) S SRFIRST=0 W !,?3,"Modifier: " D
 ..S SRMOD=0 F  S SRMOD=$O(^SRO(136,SRTN,3,SROTH,1,SRMOD)) Q:'SRMOD  D
 ...S SRMO=$P(^SRO(136,SRTN,3,SROTH,1,SRMOD,0),"^")
 ...W:SRFIRST !,?13 W $P($$MOD^ICPTMOD(SRMO,"I"),"^",2),"-",$P($$MOD^ICPTMOD(SRMO,"I"),"^",3)
 ...S SRFIRST=1
PRESS K DIR S DIR(0)="FOA",DIR("A")="Press ENTER to continue." D ^DIR K DIR
 Q
