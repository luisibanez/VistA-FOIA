SDCNP1 ;ALB/LDB - CANCEL APPOINTMENT (cont.) ; 14 MAR 88@13:00
 ;;5.3;Scheduling;**398,467**;Aug 13, 1993
 ;
 ;SD/467 - EWL Open Matched Entry with rebook
NOPE W !,*7,$S(CNT:CNT_" Appointment"_$S(CNT>1:"s",1:"")_" cancelled",1:"NOTHING CANCELLED")
 S SDCNT=CNT,SDA=1,SDCNT1=0 I CNT,$S('$D(^DPT(DFN,.35)):1,'$P(^(.35),U):1,1:0) S (SDA,X8)=0 D ASK G:X8="^" END
 ;no rebooking to take place; open EWL entries only if applicable
 I $D(DFN)>0 D EWL(DFN) ;SD/467
 I SDA,SDCNT W !,*7,"NO AUTO-REBOOKING --Patient has died."
 I 'SDA,SDCNT S A=DFN D LOOP1^SDCNP1A,LET
END K:'$D(DIROUT) DFN D END^SDCNP Q:$D(DIROUT)  G RD^SDCNP
ASK S (SDCTR,SDCTRL)=0,%=2 W !!,"DO YOU WISH TO REBOOK ANY APPOINTMENT(S) THAT YOU HAVE CANCELLED" D YN^DICN D:'% REASK G:'% ASK I %-1 S CNT=0 S:%<0 X8="^" D  Q
 .W !,"OK"
 W !!,"PLEASE NOTE THAT YOU MUST ENTER A DEVICE TO AUTO-REBOOK",!
ZIS S %ZIS("A")="DEVICE TO OUTPUT REBOOKED APPT(S). :",%ZIS="QN" D ^%ZIS I POP S X8="^" Q
 S L=0 F  S L=$O(^UTILITY($J,"SDCNP",L)) Q:'L  I $P(^(L),U,4)="*** JUST CANCELLED ***" S ^UTILITY($J,"SDCNP1",DFN,$P(^(L),"^",2),$P(^(L),"^"))=^(L)
 D SDLST
LST S B=0 F  S B=$O(^UTILITY($J,"SDCNP2",DFN,B)) Q:'B  W !!,$J($S(B\1=B:"("_$J(B,2)_") ",1:""),5) S AT=$S($P(^(B),"^",2)'?.N:1,1:0),Y=$P($P(^(B),"^"),".") D DT^SDM0 S X=$P(^(B),"^") X ^DD("FUNC",2,1) W " ",$J(X,8) S Z1(B)="" D MORE Q:SDCTRL
 D WH
 I B>0 G:SDCTRL&(A8']"") NOPE1 G:SDCTRL DEL
 Q
SDLST S L1=0 S Z5=0 F  S Z5=$O(^UTILITY($J,"SDCNP1",DFN,Z5)) Q:'Z5  F Z6=0:0 S Z7=Z6,Z6=$O(^UTILITY($J,"SDCNP1",DFN,Z5,Z6)) I Z6="" S L1=L1+1,^UTILITY($J,"SDCNP2",DFN,L1)=Z7_"^"_Z5_"^"_$P(^(Z7),"^",3,6) Q
 Q
MORE S SDCTR=SDCTR+2 I AT W ?41,$P(^UTILITY($J,"SDCNP2",B),"^",2) G OVR
 S S5=^UTILITY($J,"SDCNP2",DFN,B) W " (",$P(S5,"^",6)," MINUTES)  ",$S($D(^SC($P(S5,"^",2),0)):$P(^(0),"^",1),1:"DELETED CLINIC"),$P(S5,"^",3) S M1=$P(^SC($P(S5,"^",2),"SDP"),"^",4) W !,?41,"Max days for rebooking= ",M1
OVR I SDCTR>20,$O(^UTILITY($J,"SDCNP2",B))>0 S (SDCTRL,SDCTR)=0 W *7 D WH W:'SDCTRL @IOF
 Q
WH W !!,"SELECT APPOINTMENT(S) TO BE REBOOKED" W:B>0 " OR HIT RETURN TO CONTINUE DISPLAY" R ": ",A8:DTIME I '$T!(A8="^") S SDCTRL=1,A8="",X8="^" Q
 I A8["?" X SDMSG G WH
DEL S SDERR=0 F J=1:1 S SDDH=$P(A8,",",J) Q:SDDH']""  D MTCH
 I SDERR G LST
DEL1 S SDERR=0 F J=1:1 S SDDH=$P(A8,",",J) Q:SDDH']""  S SDDI=$P(SDDH,"-"),SDDM=$P(SDDH,"-",2) D CKK^SDCNP1A Q:SDERR  D CKK2^SDCNP1A Q:SDERR  F Z9=SDDI:1:$S(SDDM:SDDM,1:SDDI) D:SDDI REBK I 'SDDI S SDERR=1 Q
 G:SDERR LST Q:A8["^"!(A8="")  S SDERR=0 D ^SDCNP1A Q:X8="^"
 D:MAX QUE
 D NOPE1
 Q 
LET S %=2 W !!,"DO YOU WISH TO PRINT LETTERS FOR THE CANCELLED APPOINTMENT(S)" D YN^DICN S ANS="Y" D:'% REASK G:'% LET Q:(%-1)
 I $$BADADR^DGUTL3(+DFN) D  Q  ;display, don't print BAI list
 . W *7,!,"** THIS PATIENT HAS BEEN FLAGGED WITH A BAD ADDRESS INDICATOR, NO LETTER"
 . W !,"WILL BE PRINTED."
 . S DIR(0)="E" D ^DIR K DIR(0)
QUE2 S DGPGM="SDLET^SDCNP1A",DGVAR="SDCL#^DUZ^DFN^DT^A^SDWH" D ZIS^DGUTQ D:POP CLOSE^DGUTQ Q:POP  D SDLET^SDCNP1A Q
QUE I IO'=IO(0) S DGPGM="^SDCNP2",DGVAR="SDCL#^NDATE^A^GDATE^DT^DUZ",IOP=IO,X="NOW" D Q1^DGUTQ Q
 U IO I IO=IO(0),$E(IOST,1,2)="C-" S SDIO=1 D ^SDCNP2 Q
NOPE1 W @IOF,!,*7,$S(SDCNT1:SDCNT1_" Appointment"_$S(SDCNT1>1:"s",1:"")_" rebooked",1:"NOTHING REBOOKED") Q
REBK K ^UTILITY($J,"SDCNP") S ^UTILITY($J,"SDCNP2","REBK",DFN,Z9)=^UTILITY($J,"SDCNP2",DFN,Z9)
 Q
 F A9=SDDI,SDDM Q:'SDDM&(SDDI-A9)  I '$D(Z1(A9)) S SDERR=1 W !,*7,"There is no appointment number ",A9
 Q
REASK W !,"ANSWER (Y)ES OR (N)O" Q
CLRK S $P(^DPT(DFN,"S",S,0),"^",19)=$P(SDNODE,"^",7),$P(^DPT(DFN,"S",S,0),"^",18)=$P(SDNODE,"^",6) Q
MTCH Q:SDDH?1N.N!(SDDH?1.N1"-".N)  S SDERR=1 X SDMSG
 Q
EWL(DFN) ;
 I '$D(^UTILITY($J,"SDCNP1")) I '$D(^UTILITY($J,"SDCNP")) Q
 ;call to EWL to open and optionally close EWL entry with rebooked appointment
 N SDFRB,SDT,SC,SDREB K ^TMP("SDWLREB",$J),^TMP($J,"SDWPL"),^TMP($J,"APPT")
 I $D(^UTILITY($J,"SDCNP1")) S SDFRB="^UTILITY($J,""SDCNP1"")"  D REB I $D(^TMP("SDWLREB",$J)) D MESS^SDWLREB Q
 E  S SDFRB="^UTILITY($J,""SDCNP"")" D CAN I $D(^TMP("SDWLREB",$J)) D MESS^SDWLREB
 Q
REB I $D(^UTILITY($J,"SDCNP1")) F  S SDFRB=$Q(@SDFRB) Q:SDFRB'["SDCNP1"  S SDT=$P(@SDFRB,U),SC=$P(@SDFRB,U,2),SDREB=0 D
 .;N NN F NN=1:1 Q:'$D(^UTILITY($J,"SDCNP","REBK",DFN,NN))  I $P($G(^UTILITY($J,"SDCNP2","REBK",DFN,NN)),U)=SDT S SDREB=1 Q
 .N RBFLG,SDTRB D REBOOK^SDWLREB(DFN,SDT,SC,.RBFLG,.SDTRB)
 .I $E(RBFLG,1,2)'="CC" Q  ;not canceled by clinic
 .I RBFLG="CCR" S SDREB=1 D DISREB^SDWLREB(DFN,SDTRB,SC)
 .D OPENEWL^SDWLREB(DFN,SDT,SC,SDREB) K ^TMP($J,"APPT"),^TMP($J,"SDWLPL")
 Q
CAN I $D(^UTILITY($J,"SDCNP")) F  S SDFRB=$Q(@SDFRB) Q:SDFRB'["SDCNP"  I @SDFRB["CANCELLED" S SDT=$P(@SDFRB,U),SC=$P(@SDFRB,U,2),SDREB=0 D
 .N RBFLG,SDTRB D REBOOK^SDWLREB(DFN,SDT,SC,.RBFLG,.SDTRB)
 .I $E(RBFLG,1,2)'="CC" Q  ;not canceled by clinic
 .I RBFLG="CCR" S SDREB=1 D DISREB^SDWLREB(DFN,SDTRB,SC)
 .D OPENEWL^SDWLREB(DFN,SDT,SC,SDREB) K ^TMP($J,"APPT"),^TMP($J,"SDWLPL")
 Q
