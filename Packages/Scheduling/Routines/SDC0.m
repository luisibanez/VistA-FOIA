SDC0 ;MAN/GRR,ALB/TMP/LDB - Continuation of SDC (cancel a clinic) ; 16 JUL 2003  1:27 pm
 ;;5.3;Scheduling;**303,330,379,398,467**;Aug 13, 1993
 ;
 ;SD/467 - open matched EWL entries with canceled appointments
 ;
CHKEND G:NOAP END
 S %=1,DTOUT=0 W !,"WANT TO AUTO-REBOOK APPOINTMENTS NOW" D YN^DICN I '% W !,"REPLY YES (Y) OR NO (N)" G CHKEND
 S ANS=$S('(%-1):"Y",1:"N") I %<0 W " NO" Q:'DTOUT
ASKL S SDLT1="",%=1,(SDLET,SDFORM)="" W !,"WANT LETTERS PRINTED NOW" D YN^DICN I '% W !,"REPLY YES (Y) OR NO (N)" G ASKL
 W:%<0 " NO" S ALS=$S('(%-1):"Y",1:"N") G:ALS'["Y" AOR
EN Q:($P(^SC(SC,0),"^",3)'="C")!($D(SDVAUTC(+SC)))  S SDIV=$P(^SC(SC,0),"^",15),SDIV=$S(SDIV:SDIV,1:$O(^DG(40.8,0))) I $D(SDLT),SDIV'=SDV1 Q
 K SDRE,SDIN I $D(SDLT)&($D(^SC(SC,"I"))) S SDIN=+^("I"),SDRE=+$P(^("I"),"^",2) I $D(SDIN),SDIN,SDIN'>SDBD&('$D(SDRE)!('SDRE)!(SDRE>SDED)) Q
 S:'SDLT1 SDLET=$S($D(^SC(SC,"LTR")):$P(^("LTR"),"^",3),1:"") S ALS=$S(SDLET:"Y",1:"N")
 I ALS="N"!(ANS="Y") S SDFFFF=1
 I ALS="N" W !,"NO LETTERS ARE ASSIGNED TO THE ",$P(^SC(SC,0),"^")," CLINIC" Q:$D(SDLT)
 I SDFORM="",$D(^DG(40.8,SDIV,"LTR")),^("LTR") S SDFORM=^("LTR")
 I $D(SDLT),(ALS'="N") D CHK Q
 Q:$D(SDLT)
AOR G:ANS'["Y"&(ALS'["Y") END
 I '$D(SDLT) S DGPGM="START^SDC0",DGVAR="SC^SI^CDATE^ALS^ANS^SDLET^SDTIME"_$S($D(SDIN):"^SDIN^SDRE",1:"")_"^SDFORM^SDV1^SDFFFF"
 I '$D(SDLT) D FZIS^DGUTQ G:POP END
START U IO I ANS'["Y"&('$D(SDLT)) D:ALS["Y" APP D END Q
BEG1 N SDFIRST
 I $D(SDLT) S SDAR=$S('VAUTC:"VAUTC",1:"^SC"),ANS="N",ALS="Y" D
 .F SC=0:0 S SC=$O(@(SDAR_"("_SC_")")) Q:SC'>0  D
 ..K SDOK1 D EN I $D(SDOK1),SDLET D
 ...F SD=(SDBD-.1):0 S SD=$O(^SC(SC,"S",SD)) S CDATE=SD Q:SD>(SDED+.999999)!(SD'>0)  D
 ....D DUP
 S SDFIRST=$S($G(SDFFFF)=1:0,1:1)
 I $D(SDLT),$D(^UTILITY("SDLT",$J)) D PR^SDC3,END Q
 Q:$D(SDLT)  D ^SDAUT1
 I MAX=0 W !,"AUTO-REBOOKING NOT ALLOWED FOR THIS CLINIC" G APP:ALS["Y",END
 F GDATE=CDATE:0 S GDATE=$O(^SC(SC,"S",GDATE)) Q:GDATE=""!(GDATE>(CDATE+1))  F L=0:0 S L=$O(^SC(SC,"S",GDATE,1,L)) Q:L=""  S A=^(L,0) I $D(^DPT(+A,"S",GDATE,0)),$P(^(0),"^",2)="C",$P(^(0),"^",14)=SDTIME D ^SDAUT2,^SDCCP
 D:ALS["Y" APP
END ;
 D:$G(SC)>0&($G(CDATE)>0) RESOLVE
 K %,%DT,%H,%I,%DT,%IS,%ZIS,A,ALS,ANS,BY,CDATE,CHAR,DA,DFN,DH,DHD,DIC,DIS,DO,DOW,FLDS,FR,GDATE,I,L,LET,MAX,NOAP,P,POP,SI,SL,SS,ST,SDSTRTDT,TO,X,Y,ADDR,B,CLIN,HX,L0,L1,L2,LL,PDAT,S,TIME,Z,D,ENDATE,J,SM,STIME,X1,X2,SDX1,SDX2,SDRE,SDRE1,SDIN,FSW
 K ^TMP("SDC0",$J),SDAP,SDAPNUM
 K SC,SD,Z0,Z5,DGPGM,DUPE,J2,MESS,NDATE,SDDIF,SDFORM,SDINP,SDFORM,SDLET,SDLT1,SDNODE,SDRT,SDSOH,SDST,SDV1,DGVAR,SD1,SD8,SD81,SDANS,SDCNT,SDERR,SDHTO,SDJ,SDTIME,SDZ,STARTDAY,SD82,SDOK,SDOK1,SDLE,SDZ,SDOK1,TST,W,^UTILITY("SD")
 K SDFFFF,DIW,DIWF,DIWL,DIWR,DIWT,DN,DUPE,J2,MESS,NDATE,SDADD,SDC,SDCL,SDDAT,SDDIF,SDFORM,SDHX,SDINP,SDIV,SDLET,SDNODE,SDRT,SDSOH,SDST,SDT0,TST,SDV1,^TMP($J,"BADADD") D CLOSE^DGUTQ Q
CHK K SDOK1 I $D(^SC(SC,"SL")) S SL=^("SL"),%=$P(SL,"^",6),SI=$S(%="":4,%<3:4,%:%,1:4) S SDOK1=1 K SL,% E  W $P(^SC(SC,0),"^")," does not have an appointment length indicated."
 Q
RESOLVE ;evaluate canceled and rebooked appointments with relation to EWL
 S GDATE=CDATE K ^TMP("SDWLREB",$J),^TMP($J,"SDWLPL")
 F  S GDATE=$O(^SC(SC,"S",GDATE)) Q:GDATE=""!(GDATE>(CDATE+1))  S L=0 F  S L=$O(^SC(SC,"S",GDATE,1,L)) Q:L=""  D
 .S DFN=+^SC(SC,"S",GDATE,1,L,0)
 .N RBFLG,SDTRB,SDCAN,SDREB S SDREB=0 D REBOOK^SDWLREB(DFN,GDATE,SC,.RBFLG,.SDTRB,.SDCAN) Q:SDCAN'=SDTIME
 .I $E(RBFLG,1,2)'="CC" Q  ;not canceled by clinic
 .I RBFLG="CCR" S SDREB=1 D DISREB^SDWLREB(DFN,SDTRB,SC)
 .D OPENEWL^SDWLREB(DFN,GDATE,SC,SDREB) K ^TMP($J,"APPT"),^TMP($J,"SDWLPL")
 I $D(^TMP("SDWLREB",$J)) D MESS^SDWLREB
 Q
 ;
DUP ;SCREEN FOR DUPLICATE PATIENTS - SD*5.3*379
 S SDAP="" F  S SDAP=$O(^SC(SC,"S",SD,SDAP)) Q:SDAP=""  D
 .S SDAPNUM="" F  S SDAPNUM=$O(^SC(SC,"S",SD,SDAP,SDAPNUM)) Q:SDAPNUM=""  D
 ..I $D(^SC(SC,"S",SD,SDAP,SDAPNUM,0)) D
 ...S A=$P(^SC(SC,"S",SD,SDAP,SDAPNUM,0),"^",1)
 ...I '$D(^TMP("SDC0",$J,SD,A)) S ^TMP("SDC0",$J,SD,A)="" D ^SDC3
 Q
APP I $G(SDFFFF)=1 S SDFIRST=0
 F GDATE=CDATE:0 S GDATE=$O(^SC(+SC,"S",GDATE)) Q:GDATE=""!(GDATE>(CDATE+1))  F L=0:0 S L=$O(^SC(+SC,"S",GDATE,1,L)) Q:L=""  S A=^(L,0) D CHECK
 I $D(^TMP($J,"BADADD")) D BADADD^SDLT K ^TMP($J,"BADADD")
 Q
CHK1 S (SDX,X)=GDATE D WRAPP^SDLT
 I $P(S,"^",2)'["A" D REST^SDLT Q
 S SDX=$P(S,"^",10) I '$D(^DPT(+A,"S",SDX,0)) D REST^SDLT Q
 W !!,"The cancelled appointment(s) were rescheduled as follows:",!
 S S=^DPT(+A,"S",SDX,0) D WRAPP^SDLT,REST^SDLT
 Q
CHECK I $$BADADR^DGUTL3(+A) S ^TMP($J,"BADADD",$P(^DPT(+A,0),"^"),+A)="" Q
 ;
 ;SCREEN FOR DUPLICATES - SD*5.3*379
 ;
 I $D(^TMP("SDC0",$J,GDATE,A)) Q
 S ^TMP("SDC0",$J,GDATE,A)=""
 I $S('$D(^DPT(+A,.35)):1,$P(^DPT(+A,.35),"^",1)']"":1,1:0),$D(^DPT(+A,"S",GDATE)),$P(^DPT(+A,"S",GDATE,0),"^",2)["C",$P(^(0),"^",14)=SDTIME!(SDTIME="*") S S=^DPT(+A,"S",GDATE,0) D ^SDLT,CHK1
