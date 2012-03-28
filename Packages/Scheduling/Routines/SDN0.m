SDN0 ;ALB/TMP - NO SHOW AUTO-REBOOK ; [ 09/13/2001  2:35 PM ]
 ;;5.3;Scheduling;;Aug 13, 1993
 ;IHS/ANMC/LJF 11/30/2000 changed $N to $O
 ;                        set BSDNO; used to prevent appt letter to be
 ;                          asked during event driver
 ;             12/01/2000 added code for user chosen letter
 ;
START U IO K ^UTILITY($J) I C="ALL" K C
 ;G:ANS'["Y" PLET
 I ANS'["Y" G PLET:$D(C),^SDN1
 I $D(C),$P(^SC(C,0),"^",3)="C",$S($P(^(0),"^",15)="":1,$P(^(0),"^",15)=SDV1:1,1:0) S SC=C D OVR G PLET
 G:$D(C) END
 ;F SDQ=0:0 S SDQ=$N(^SC(SDQ)) Q:SDQ'>0  I $P(^SC(SDQ,0),"^",3)="C",$S($P(^(0),"^",15)="":1,$P(^(0),"^",15)=SDV1:1,1:0),($N(^SC(SDQ,"S",SDT))\1)=SDT S SC=SDQ D OVR  ;IHS/ANMC/LJF 11/30/2000
 F SDQ=0:0 S SDQ=$O(^SC(SDQ)) Q:'SDQ  I $P(^SC(SDQ,0),"^",3)="C",$S($P(^(0),"^",15)="":1,$P(^(0),"^",15)=SDV1:1,1:0),($O(^SC(SDQ,"S",SDT))\1)=SDT S SC=SDQ D OVR   ;IHS/ANMC/LJF 11/30/2000 $N->$O
 ;G PLET
 G END:ALS="N",^SDN1
OVR S SL=$S($D(^SC(SC,"SL")):^("SL"),1:"") Q:'SL  S %=$P(SL,U,6),SI=$S(%="":4,%<3:4,%:%,1:4),%=$P(SL,U,3),STARTDAY=$S(%:%,1:8),SDSTRTDT=$S(DT>SDT:DT,1:SDT),STIME=$S($D(^SC(SC,"SDP")):$P(^("SDP"),U,3),1:"0800")
 S CDATE=SDT,SDNOSH="" D ^SDAUT1
 I MAX=0 W !,"AUTO-REBOOKING NOT ALLOWED FOR CLINIC ",$P(^SC(SC,0),"^",1) Q
 K FSW
 ;
 ;IHS/ANMC/LJF 11/30/2000 $N->$O;set of BSDNO
 ;F GDATE=CDATE:0 S GDATE=$N(^SC(SC,"S",GDATE)) Q:GDATE<0!(GDATE>(CDATE+1))  F L=0:0 S L=$N(^SC(SC,"S",GDATE,1,L)) Q:L<0  S A=^(L,0) I $D(^DPT(+A,"S",GDATE,0)),$P(^(0),"^",2)="N",$P(^(0),"^",14)=SDTIME D MAXCK D:'POP EN1^SDAUT2 D ^SDNP
 NEW BSDNO S BSDNO=1
 F GDATE=CDATE:0 S GDATE=$O(^SC(SC,"S",GDATE)) Q:('GDATE)!(GDATE>(CDATE+1))  F L=0:0 S L=$O(^SC(SC,"S",GDATE,1,L)) Q:'L  S A=^(L,0) I $D(^DPT(+A,"S",GDATE,0)),$P(^(0),"^",2)="N",$P(^(0),"^",14)=SDTIME D MAXCK D:'POP EN1^SDAUT2 D ^SDNP
 ;
 Q
PLET S SDC=SC,SDFORM="" I $D(^DG(40.8,SDV1,"LTR")),^("LTR") S SDFORM=^("LTR")
 S SDLET="" I $D(^SC(SC,"LTR")),^("LTR") S SDLET=+^("LTR")
 I $G(BSDLET) S SDLET=BSDLET K BSDLET  ;IHS/ANMC/LJF 12/01/2000
 I ALS["Y"&(SDLET) G ^SDN1
 W:ALS="Y"&('SDLET) !,$P(^SC(SC,0),"^")," DOES NOT HAVE A NO-SHOW LETTER ASSIGNED TO IT" G END
MAXCK S POP=0,SDC=SC,SDC=$S('$D(^SC(SC,"SL")):SC,$P(^("SL"),"^",5)']"":SC,1:$P(^("SL"),"^",5))
 ;K SDIS F I=0:0 S I=$N(^DPT(+A,"DE","B",SDC,I)) Q:I'>0!($D(SDIS))  I $D(^DPT(+A,"DE",I)) F I1=0:0 S I1=$N(^DPT(+A,"DE",I,1,I1)) Q:I1'>0  S SDD=$P(^(I1,0),"^",3)\1 I '(SDD-SDDT),$P(^(0),"^",4)["Exceeded" D SETM Q   ;IHS/ANMC/LJF 11/30/2000
 K SDIS F I=0:0 S I=$O(^DPT(+A,"DE","B",SDC,I)) Q:I'>0!($D(SDIS))  I $D(^DPT(+A,"DE",I)) F I1=0:0 S I1=$O(^DPT(+A,"DE",I,1,I1)) Q:I1'>0  S SDD=$P(^(I1,0),"^",3)\1 I '(SDD-SDDT),$P(^(0),"^",4)["Exceeded" D SETM Q  ;IHS/ANMC/LJF 11/30/2000 $N->$O
 Q
SETM S POP=1,(SDIS,NDATE,DUPE)="",MESS="No rebook - Max. # of consecutive no-shows ("_$S($D(^SC(SC,"SDP")):+^("SDP"),1:"")_") has been exceeded"
 Q
END K %,%DT,%I,%IS,A,A0,A1,A2,ALL,ALS,ANS,BY,CDATE,DA,DATEND,DFN,DH,DHD,DIC,DIS,DIV,DO,DOW,DUPE,F,F1,FLDS,FR,GDATE,I,I1,J,L,K,LET,MAX,MESS,NOAP,P,POP,S1,SC,SD,SD1,SD2,SDD,SDDT,SDMSG,SI,SL,SS,ST,SDSTRTDT,STARTDAY,TO,X,Y,ADDR,B,CLIN,HX,LL
 K DGPGM,DGVAR,Z,D,ENDATE,NDATE,J,SM,SM1,SDTIME,STIME,X1,X2,SDC,SDCT,SDIS,SDRE,SDRE1,SDIN,SDYES,SDT,SDTADE,SDTADB,SDPRT,SDMDT,SDCTR,SDCMAX,SDCONS,SDDIF,SDED,SDFORM,SDLET,SDLT1,SDNOSH,SDQ,SDSOH,SDSTAT,SDZSC,VAUTC,SDV1
 K %ZIS,PDAT,S,TIME,TST,Y1 D CLOSE^DGUTQ Q
