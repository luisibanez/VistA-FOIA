AFSLRTT1 ;IHS/OIRM/OKCRDC/JDM - PROGRAM TO RE-EXPORT TREASURY TAPE #2;  [ 09/27/2005  5:01 PM ]
 ;;3.0t1;1166 APPROVALS FOR PAYMENT;**19**;AUG 31, 2005
 ;Modified for Y2k compliance   12/24/98HJT
 ;Re-export U.S. treasury tape - part 2
 S (AFSL1,AFSLEMSG,AFSLFLG1,AFSL1A,AFSL2,AFSL3,AFSL4,AFSL5,AFSLSCH1,AFSLFYN,AFSLSEQ,AFSLSEQ1,AFSLCNT,AFSLAMT,AFSLVFU)=0
ASK ;fy and payment type prompts
 U IO(0)
 D ^XBCLS
 S DY=15,DX=16 X XY
 K DIR
 S DIR(0)="D"
 S DIR("A")="ENTER THE EXPORT DATE YOU WISH TO RE-EXPORT"
 S DIR("?")="^S DIC=""^AFSLAFP("",DIC(0)=""FEQ"",D=""B"",DZ=""??"" D DQ^DICQ"
 D ^DIR
 I $D(DUOUT)!$D(DTOUT)!$D(DIROUT) S AFSLEFLG=1 Q
 ;Begin Y2k fix
 ;Create a 4-digit year for lookup in ^AFSLAFP 12/24/98HJT
 S AFSLFY=$E(Y,1,3)+1700   ;Y2000
 ;S AFSLFY=$E(Y,2,3)
 ;End of Y2k fix
EDAT ;
 K DIR("?")
 S DIR(0)="DA",DIR("A")="Enter the Effective Date :" D ^DIR I $D(DUOUT) D ^XBCLS W !!,"NO ""^"" ALLOWED" G EDAT
 I $D(DTOUT)!$D(DUOUT) G ASK
 I $D(DIROUT) S AFSLEFLG=1 Q
 S AFSLPDT=$P(Y,".",1)
DEV K IOP
 U IO(0) S %ZIS("A")="PRINTER TO PRINT TAPE CONTENTS REPORT: ",%ZIS="" D ^%ZIS S AFSLDEV=IO,AFSLDSL=IOSL
 I POP S AFSLEFLG=1 Q
PRC ;loop thru payment type x-ref's
 L +^AFSLAFP:10 I '$T W !,"ANOTHER IS ENTERING DATA. YOU CANNOT PROCESS A TREASURY TAPE AT THIS TIME. TRY LATER." S AFSLEFLG=1 Q
 S AFSLFYN="",AFSLFYN=$O(^AFSLAFP("B",AFSLFY,AFSLFYN))
 S (AFSLEIN,AFSLEIN1)="",(AFSLCBC,AFSLFLG,AFSLCBA,AFSLCNT,AFSLIN)=0 S (AFSLCNT1,AFSLPG)=1
TREAS ;
 S DIE="^AFSLAFP(",DIE("NO^")="",DA=AFSLFYN,DR="2//" D ^DIE
 S AFSLSH11="0000"_$P(^AFSLAFP(AFSLFYN,2),U,1)
 D HDR^AFSLRTT2
 F AFSLX="E","G","H" D XREF
 D EXDAT
 I AFSLEMSG=0,AFSLFLG=1 D TRL^AFSLRTT2,FRD^AFSLRTT3 Q
 ;E  S AFSLEMSG=1
 S AFSLEMSG=1
 Q
XREF ;
 F J=0:0 S AFSLEIN=$O(^AFSLAFP(AFSLX,AFSLEIN)) Q:(AFSLEIN="")!(AFSLEMSG=1)  I $D(^AFSLAFP(AFSLX,AFSLEIN,AFSLFYN)) D SEIN0
 Q
SEIN0 ;
 S AFSLSCH1="" F I=1:1 S AFSLSCH1=$O(^AFSLAFP(AFSLX,AFSLEIN,AFSLFYN,AFSLSCH1)) D:AFSLSCH1="" GSET Q:(AFSLSCH1="")!(AFSLEMSG=1)  D CHK D:AFSLFLG1 SEIN1 S AFSLFLG1=0
 Q
 I '$D(^AFSLAFP("M",AFSLBN,AFSLFYN,AFSLSCH1)) D TNUM
SEIN1 S AFSLEIN1="" F L=0:0 S AFSLEIN1=$O(^AFSLAFP(AFSLX,AFSLEIN,AFSLFYN,AFSLSCH1,AFSLEIN1)) Q:(AFSLEIN1="")!(AFSLEMSG=1)  D DCHK^AFSLRTT2 Q:AFSLEMSG=1  D SEIN2
 Q
EXDAT ;set export date for schedule
 S AFSLSC12="" F V=0:0 S AFSLSC12=$O(AFSLSCH1(AFSLSC12)) Q:AFSLSC12=""  S DIE="^AFSLAFP(AFSLFYN,1,",DA(1)=AFSLFYN,DA=AFSLSC12,DR="5///TODAY" D ^DIE L -^AFSLAFP ;UNLOCK 1166 PAYMENTS FILE
 Q
SEIN2 Q:('$D(^AFSLAFP(AFSLFYN,1,AFSLSCH1,1,AFSLEIN1,0)))!($P(^(0),U,27)["D")  S AFSLTT=^(0)
 S:$D(^AFSLAFP(AFSLFYN,1,AFSLSCH1,1,AFSLEIN1,1)) AFSLTT5=^(1)
 S:$D(^AFSLAFP(AFSLFYN,1,AFSLSCH1,1,AFSLEIN1,1)) AFSLTT=AFSLTT_$P(^AFSLAFP(AFSLFYN,1,AFSLSCH1,1,AFSLEIN1,1),U,21)
 S X=$P(AFSLTT,U,11)
 S X2="2",X3=10
 D COMMA^%DTC
 S AFSLTT9=$E(X,1,9)
 S AFSLTT9=$J(AFSLTT9,10)
 D PDT
 S AFSLCBC=AFSLCBC+1,AFSLCBA=AFSLCBA+$P(AFSLTT,U,11)
 D GSET1
 Q
GSET1 ;module to generate line item payment data
 S AFSLTT1A=$S(AFSLX="E":$P(AFSLTT,U,10),1:$P(AFSLTT,U,24))
 S AFSLTT2=$S(AFSLX="E":$P(^AUTTVNDR(AFSLTT1A,11),U,1),1:$P(^VA(200,AFSLTT1A,1),U,9))
 S AFSLTT(AFSLTT2,AFSLCNT1,3,AFSLCBC,0)=$P(AFSLTT,U,20)_"  "_"$"_AFSLTT9_"  "_$P(AFSLTT,U,14) S AFSLLG=$L(AFSLTT(AFSLTT2,AFSLCNT1,3,AFSLCBC,0)),AFSLLG=55-AFSLLG
 S AFSLTT(AFSLTT2,AFSLCNT1,3,AFSLCBC,0)=AFSLTT(AFSLTT2,AFSLCNT1,3,AFSLCBC,0)_$J("",AFSLLG)
 ;I AFSLVFU=1,AFSLX["E" S AFSLCBAV=-$P(AFSLTT,U,11) S AFSLCBAV=$P(^AUTTVNDR(AFSLTT1A,11),U,7)-AFSLCBAV S DIE=9999999.11,DA=AFSLTT1A,DR="1107///^S X=AFSLCBAV" D ^DIE
 D:AFSLCBC=12 GSET
 Q
GSET ;module to generate record total data
 Q:AFSLCBC=0
 S AFSLCBA=AFSLCBA*100,AFSLCBA=$E(AFSLOO,1,8-$L(AFSLCBA))_AFSLCBA,AFSLCBA=$J(AFSLCBA,8)
 S AFSLTT(AFSLTT2,AFSLCNT1,0)=AFSLSH11_"2"
 S AFSLTT(AFSLTT2,AFSLCNT1,0)=AFSLTT(AFSLTT2,AFSLCNT1,0)_AFSLTT2_$J("",12-$L(AFSLTT2))_"0"_AFSLCBA_"IHS"_$J("",7)_"B"
 ;S AFSLTT4=$S(AFSLX="E":$P(^AUTTVNDR(AFSLTT1A,0),U,1),1:$P(^VA(200,AFSLTT1A,0),U,1)),AFSLTT4=AFSLTT4_$J("",35-$L(AFSLTT4))  ;ACR*2.1*19.02 IM16848
 S AFSLTT4=$S(AFSLX="E":$P(^AUTTVNDR(AFSLTT1A,0),U,1),1:$$NAME2^ACRFUTL1(AFSLTT1A))  ;ACR*2.1*19.02 IM16848
 S AFSLTT4=AFSLTT4_$J("",35-$L(AFSLTT4))  ;ACR*2.1*19.02 IM16848
 S AFSLTT(AFSLTT2,AFSLCNT1,0)=AFSLTT(AFSLTT2,AFSLCNT1,0)_AFSLTT4
 I AFSLX["E" D VADR^AFSLTT4
 I AFSLX'["E" D EADR^AFSLTT4
 S AFSLTT(AFSLTT2,AFSLCNT1,2)=AFSLTT(AFSLTT2,AFSLCNT1,2)_$J("",67)_$S(AFSLCBC<10:"0"_AFSLCBC,1:AFSLCBC)
 S AFSLCNT=AFSLCNT+1,AFSLAMT=AFSLAMT+AFSLCBA,AFSLCBC=0,AFSLCBA=0
 D PRC^AFSLRTT2 K AFSLTT S AFSLCNT1=AFSLCNT1+1
 Q
CHK ;checks for certification date,open/close,export date
 I $D(^AFSLAFP(AFSLFYN,1,AFSLSCH1,0)) S AFSLSCH3=^(0)
 E  Q
 I $D(^AFSLAFP(AFSLFYN,1,AFSLSCH1,2)) S AFSLSCH2=^(2)
 E  Q
 I '$D(^AFSLAFP("ME",AFSLFYN,$P(^AFSLAFP(AFSLFYN,1,AFSLSCH1,0),U,1))) Q
 S AFSLFLG=1,AFSLFLG1=1,AFSLSCH=$P(AFSLSCH3,U,1),AFSLSCH1(AFSLSCH1)=AFSLSCH1
 S AFSLOO="0000000000"
 Q
TNUM ;
 S X=AFSLBN
 S DIE="^AFSLAFP("_AFSLFYN_",1,"
 S DA(1)=AFSLFYN
 S DA=AFSLSCH1
 S DR="10////"_AFSLSH11
 D ^DIE
 Q
PDT ;
 S DIE="^AFSLAFP("_AFSLFYN_",1,"_AFSLSCH1_",1,",DA(2)=AFSLFYN
 S DA(1)=AFSLSCH1,DA=AFSLEIN1,DR="19////"_AFSLPDT
 D ^DIE
 S AFSLDNUM=$P(^AFSLAFP(AFSLFYN,1,AFSLSCH1,1,AFSLEIN1,1),U,16),AFSLDFYN=$P(^(1),U,15),AFSLPDNM=$P(^(1),U,7)
 S DIE="^AFSLODOC("_AFSLDFYN_",1,"_AFSLDNUM_",1,"
 S DA(2)=AFSLDFYN
 S DA(1)=AFSLDNUM
 S DA=AFSLPDNM
 S DR="1////"_AFSLPDT
 D ^DIE
 Q