ANSES ;IHS/OIRM/DSD/CSC - ENTER/EDIT STAFFING DATA; [ 02/25/98  10:32 AM ]
 ;;3.0;NURSING PATIENT ACUITY;;APR 01, 1996
 ;;ENTER/EDIT STAFFING DATA
EN N C,D,I,L,N,P,T,X,Y,Z
 F  D EN1 Q:$D(DTOUT)!$D(DUOUT)
EXIT K ANS,DTOUT,DUOUT,ANSDA,ANSDT,ANSP,ANSS,ANSSH,ANSSTR,ANSUN,ANT,ANSX
 Q
EN1 D HEAD,^ANSUD
 Q:$D(DTOUT)!$D(DUOUT)
 I '$D(ANSDT)!'$D(ANSSH)!'$D(ANSUN) S DUOUT="" Q
 F  D EN2 Q:$D(DTOUT)!$D(DUOUT)
 ;K DTOUT,DUOUT  ;CSC 10-97
 Q
EN2 S ANSDA=$O(^ANS("AU",ANSDT,ANSUN,ANSSH,0))
 I ANSDA,$D(^ANS(ANSDA,0)) S ANSSTR=^(0)
 I 'ANSDA S ANSDR=".02////"_ANSSH_";.03////"_ANSUN,ANSDA="" D SET
 Q:'ANSDA
 D:ANSDA DISP
 S DIR(0)="YO",DIR("A")="Edit this data"
 W !
 D DIR^ANSDIC
 Q:$D(DTOUT)!$D(DUOUT)
 I Y'=1 S DUOUT="" Q
 S DA=ANSDA,DIE="^ANS(",DR=".04RN Hours............;.05Non-RN Hours........"
 W !
 D DIE^ANSDIC
 D ^ANSES1
 Q
SET S DIC="^ANS(",DIC(0)="L",X=ANSDT,DIC("DR")=ANSDR
 D FILE^ANSDIC
 S ANSDA=+Y,ANSSTR=^ANS(ANSDA,0)
 Q
HEAD D ^ANSMENU
 S ANSX="NURSE STAFFING DATA"
 W !!,?80-$L(ANSX)/2,ANSX
 Q
SUBH S Y=ANSDT
 X ^DD("DD")
 W !!,?6,Y
 S Y="",ANSS=$P(ANSPAR,U,5)
 I $D(ANSSH) S X=$T(@ANSS),Y=$P($P(X,";;",ANSSH+1),U,2) W ?30,Y," Shift"
 I ANSUN,$D(^ANSD(59.1,ANSUN,0)) S Z=$P(^(0),U) W ?56,"Unit ",Z
 Q
DISP D HEAD,SUBH
 W !
 D ^ANSESD
 Q
2 ;;1^DAY;;2^NIGHT
3 ;;1^DAY;;2^EVENING;;3^NIGHT