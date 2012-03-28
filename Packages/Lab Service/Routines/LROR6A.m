LROR6A ; IHS/DIR/AAB - EDIT UNRELEASED LAB ORDERS FOR OE/RR 9/11/89 16:55 ;  [ 07/22/2002  1:30 PM ]
 ;;5.2T9;LR;**1002,1003,1013,1018**;Nov 17, 2004
 ;;5.2;LAB SERVICE;**24,100,128,186**;Sep 27, 1994
EDITUR ;FROM LROR6
 S X=ORPK,LRTST=+X,LROOST=$P(X,"^",2),LROSAMP=$P(X,"^",3),LROSPEC=$P(X,"^",4),LROXZ=$P(X,"^",5),LROURG=$P(X,"^",6),LRORD=$P(X,"^",7),LROCNT=$P(X,"^",8)
 S LREND=0,LRASK=0,LROST="",LRSAMP="",LRSPEC="",LRURG="",LRTSTNM=$P(^LAB(60,LRTST,0),U,1)
 D TYPE S:LREND LRZX(1)=LROXZ,LREND=0
 D INIT^LRXO00
 S LRPREV=$S($D(LROOST):LROOST,1:"") I LRPREV S Y=LRPREV X ^DD("DD") S LRPREV=Y
 I LRZX(1)["I" D ^LRORDIM S LROST=$S($D(LRCDT):LRCDT,1:LROOST) S:'$D(LRCDT) LRZX(1)=LROXZ K LRCDT,LRPREV I LRZX(1)'="I" D
 .;W !!,"Invalid time selected this will be returned to ",$S(LRZX(1)["L":"Lab Collect",LRZX(1)["W":"Ward Collect",1:"Send Patient") H 2
 .W !!,"Invalid time selected this will be returned to ",$S(LRZX(1)["L":"Lab Collect",LRZX(1)["W":"Ward/Clinic Collect",1:"Send Patient") H 2  ;IHS/DIR TUC/AAB 5/4/98
 I LRZX(1)'="I" D EN^LRXO5 D:LREND  S:LREND LROST=LROOST,LREND=0 K LRPREV
 .Q:LRZX(1)'="LC"!(LROXZ="LC")
 .S LRZX(1)=LROXZ
 .;W !!,"Invalid time selected this will be returned to ",$S(LRZX(1)["W":"Ward Collect",1:"Send Patient") H 2
 .W !!,"Invalid time selected this will be returned to ",$S(LRZX(1)["W":"Ward/Clinic Collect",1:"Send Patient") H 2  ;IHS/DIR TUC/AAB 5/4/98
 D SAMP K DIC,LRCS,LRUNQ,N1,LRCSN
 D URG S:LREND LRURG=LROURG,LREND=0
 I $D(^XUTL("OR",$J,"COM",LROOST,LROXZ,LRSAMP,LRSPEC,LROCNT)),$O(^(LROCNT,0)) D RCOM S LRFLG=1
 I '$D(LRFLG) S LRSX=LROCNT D RCOM^LRXO2
 K LRFLG D SET^LROR6B
 ;BEGIN IHS MODIFICATIONS LR*5.2*1018
 ;RESTORE CALLS TO ORX
 D RETURN^ORX  ;IHS/DIR TUC/AAB 06/15/98
 K LROCNT,LROXZ,LROOST,LROURG,LROSAMP,LROSPEC,LRCNT,LRSPEC,LRSAMP,LRSX,LRZX,LREK,LRURG,LROST,LRTST,LRTSTNM,LRCS,LRCSN,LRPRAM,LROUTINE Q
TYPE ;
 ;W !!," (S)END patient to lab",!," (W)ARD collect & deliver",!," (L)AB blood team" I $P($G(^LAB(69.9,1,7,DUZ(2),0)),U,6) W !," (I)MMEDIATE LAB COLLECT"
 ;W !,"Select: "_$S(LROXZ["LC":"LAB",LROXZ["WC":"WARD",LROXZ["I":"IMMEDIATE",1:"SEND")_"//" R X:DTIME I X["^"!(X="")!('$T) S LREND=1 Q
 W !!," (S)END patient to lab",!," (W)ARD/CLINIC collect & deliver",!," (L)AB blood team" I $P($G(^LAB(69.9,1,7,DUZ(2),0)),U,6) W !," (I)MMEDIATE LAB COLLECT"  ;IHS/DIR TUC/AAB 5/4/98
 W !,"Select: "_$S(LROXZ["LC":"LAB",LROXZ["WC":"WARD/CLINIC",LROXZ["I":"IMMEDIATE",1:"SEND")_"//" R X:DTIME I X["^"!(X="")!('$T) S LREND=1 Q  ;IHS/DIR TUC/AAB 5/4/98
 S LRCTYPE="SsWwLl" I $P($G(^LAB(69.9,1,7,DUZ(2),0)),U,6) S LRCTYPE=LRCTYPE_"Ii"
 ;I LRCTYPE'[X W !,"Enter 'S' for SEND TO LAB",!?6,"'W' for WARD COLLECT",!?6,"'L' for LAB BLOOD TEAM." W:LRCTYPE["I" !?6,"'I' for Immediate Collect",!?6,"'^' to Exit." G TYPE
 I LRCTYPE'[X W !,"Enter 'S' for SEND TO LAB",!?6,"'W' for WARD/CLINIC COLLECT",!?6,"'L' for LAB BLOOD TEAM." W:LRCTYPE["I" !?6,"'I' for Immediate Collect",!?6,"'^' to Exit." G TYPE  ;IHS/DIR TUC/AAB 5/4/98
 S LRZX(1)=$S(X["W":"WC",X["w":"WC",X["S":"SP",X["s":"SP",X["I":"I",X["i":"I",1:"LC")
 I LRZX(1)="LC"!(LRZX(1)="I"),'$P(^LAB(60,LRTST,0),"^",9) W !!,$C(7),"**"_$P(LRTSTNM,"^")_" cannot be ordered for ROUTINE LAB COLLECT or IMMEDIATE COLLECT.**" G TYPE
 K LRCTYPE Q
URG ;Edit Urgency
 S H=+$P(^LAB(60,LRTST,0),"^",16),H(0)=$P(^(0),"^",18)
 S DIC="^LAB(62.05,",DIC(0)="AEQZ" S DIC("A")="URGENCY: " S:'$D(DIC("B")) DIC("B")=$S($D(LROURG):LROURG,1:$P(^LAB(69.9,1,3),"^",2))
 S DIC("S")="I '$P(^(0),""^"",3),Y'<"_H S:LRZX(1)="LC" DIC("S")=DIC("S")_" I $P(^(0),""^"",2)" W ! D ^DIC I Y<1 S LREND=1 Q
 S X=+Y K DIC,H S LRURG=X
 Q
SAMP ;Edit Collection sample and specimen
 S LRUNQ=$P(^LAB(60,LRTST,0),"^",8),(J,N1)=$O(^(3,0)),LRCSN=1
 I "ILC"[LRZX(1) S LRSAMP=$P(^LAB(60,LRTST,0),"^",9) W !,"Lab will collect ",$P(^LAB(62,LRSAMP,0),"^"),"    ",$P(^(0),"^",3) G SPEC
 I N1 S LRCS(1)=+^LAB(60,LRTST,3,N1,0)
 I N1&(LRUNQ) S X=$P(^LAB(62,LRCS(1),0),"^") W !,"The Sample Is "_X_"   "_$P(^(0),"^",3) S LRSAMP=LROSAMP G SPEC
 I N1 F  S J=$O(^LAB(60,LRTST,3,J)) Q:J<1  S LRCSN=LRCSN+1,LRCS(LRCSN)=+^(J,0)
 I LRCSN>1 G SAMP2
SAMP1 I LRCSN<2 S DIC="^LAB(62,",DIC(0)="EMOQ",D="B" W !,"COLLECTION SAMPLE: "_$P(^LAB(62,LROSAMP,0),"^")_"//" R X:DTIME D IX^DIC:X["?" G SAMP1:X["?" I X["^"!(X="")!('$T) S LRSAMP=LROSAMP G SPEC
 I LRCSN<2 D ^DIC K DIC G SAMP1:'($D(DUOUT)!$D(DTOUT))&(Y<0) I $D(DTOUT)!$D(DUOUT) S:X="^^" DIROUT=1 S LRSAMP=LROSAMP G SAMP1
 S LRSAMP=+Y G SPEC
SAMP2 I LRCSN>1 W !,"COLLECTION SAMPLE:" F I=1:1:LRCSN W !,I," ",$P(^LAB(62,LRCS(I),0),"^"),"   ",$P(^(0),"^",3)
 W !,"Choose one: "_$P(^LAB(62,LROSAMP,0),"^")_"//" R X:DTIME G SAMP2:X["?" I X["^"!(X="")!('$T) S LRSAMP=LROSAMP G SPEC
 I '$D(LRCS(X)) W $C(7),!,"Type number 1-",LRCSN,! H 1 G SAMP2
 S LRSAMP=$P(LRCS(X),"^") W " "_$P(^LAB(62,LRSAMP,0),"^")_$P(^(0),"^",3) G SPEC
 Q
SPEC ;
 I $P(^LAB(62,LRSAMP,0),"^",2)'="" S LRSPEC=+$P(^(0),"^",2) Q
SPEC1 S DIC="^LAB(61,",DIC(0)="EMOQ",D="E" W !!,"SITE SPECIMEN: "_$P(^LAB(61,LROSPEC,0),"^")_"//" R X:DTIME D IX^DIC:X["?" G SPEC1:X["?" I X["^"!(X="")!('$T) S LRSPEC=LROSPEC Q
 D ^DIC
 K DIC G SPEC1:'($D(DUOUT)!$D(DTOUT))&(Y<0) I $D(DTOUT)!$D(DUOUT) S:X="^^" DIROUT=1 S LRSPEC=LROSPEC Q
 S LRSPEC=+Y
 Q
RCOM ;Edit comment
 W !!,"This is the existing comment "
 S I=0 F  S I=$O(^XUTL("OR",$J,"COM",LROOST,LROXZ,LRSAMP,LRSPEC,LROCNT,I)) Q:I<1  S TEXT=^(I) W TEXT,!
 K TEXT W !,"Do you want to change the comment for this order? " S %=2 D YN^DICN G:%=0 RCOM
 I %'=1,((LROST'=LROOST)!(LRZX(1)'=LROXZ)) M ^XUTL("OR",$J,"COM",LROST,LRZX(1),LRSAMP,LRSPEC,LROCNT)=^XUTL("OR",$J,"COM",LROOST,LROXZ,LRSAMP,LRSPEC,LROCNT) Q
 S LRSX=LROCNT K ^XUTL("OR",$J,"COM",LROOST,LROXZ,LRSAMP,LRSPEC,LRSX) D RCOM^LRXO2
 Q
