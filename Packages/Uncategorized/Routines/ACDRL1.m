ACDRL1 ;IHS/ADC/EDE/KML - PROCESS RECORD LIST;
 ;;4.1;CHEMICAL DEPENDENCY MIS;;MAY 11, 1998
 ;
 ;
 ;
START ;
 S (ACDBT,ACDBTH)=$H,ACDJOB=$J,ACDRCNT=0
 I $D(ACDRDTR),ACDPTVS="P" S X1=ACDBD,X2=-1 D C^%DTC S ACDSD=X
 D @ACDPTVS,END
 Q
 ;
V ; Run by visit date
 S X1=ACDBD,X2=-1 D C^%DTC S ACDSD=X
 S ACDODAT=ACDSD_".9999" F  S ACDODAT=$O(^ACDVIS("B",ACDODAT)) Q:ACDODAT=""!((ACDODAT\1)>ACDED)  D V1
 Q
 ;
P ;
 S ACDR=0 F  S ACDR=$O(^ACDVIS("D",ACDR)) Q:ACDR'=+ACDR  I '$P(^DPT(ACDR,0),U,19) S DFN=ACDR D PROC
 Q
 ;
 ;
END ;
 S ACDET=$H
 D EOJ
 Q
EOJ ;
 Q
V1 ;
 S ACDR="" F  S ACDR=$O(^ACDVIS("B",ACDODAT,ACDR)) Q:ACDR'=+ACDR  I $D(^ACDVIS(ACDR,0)) S ACDR0=^ACDVIS(ACDR,0),DFN=$P(ACDR0,U,5) D PROC,EOJ
 Q
PROC ;
 I ACDPTVS="P",DFN="" Q
 D SCREENS
 Q:$D(ACDSKIP)
 K ACDSRT,ACDPRNT S ACDCRIT=ACDSORT,ACDX=0 X:$D(^ACDTITEM(ACDSORT,5)) ^ACDTITEM(ACDSORT,5) I $G(ACDPRNT)="" D
 . ;I ACDPTVS="V" S Y=$P($P(ACDR0,U),".") D DD^%DT S ACDPRNT=Y Q
 . ;S ACDPRNT=$P(^DPT(DFN,0),U)
 . S ACDPRNT="--"
 . Q
 S ACDSRT=ACDPRNT
 I '$D(ACDRDTR) S ^TMP("ACDRL",ACDJOB,ACDBTH,"DATA HITS",ACDSRT,ACDR)="",ACDRCNT=ACDRCNT+1
 I $D(ACDRDTR) S ^TMP("ACDRL",ACDJOB,ACDBTH,"DATA HITS",ACDSRT,DFN)="",ACDRCNT=ACDRCNT+1
 Q:'$G(DFN)
 Q:$D(^TMP("ACDRL",ACDJOB,ACDBTH,"PATIENTS",DFN))
 S ^TMP("ACDRL",ACDJOB,ACDBTH,"PATIENTS",DFN)="",ACDPTCT=ACDPTCT+1
 Q
SCREENS ;
 K ACDSKIP
 S ACDI=0 F  S ACDI=$O(^ACDRPTD(ACDRPT,11,ACDI)) Q:ACDI'=+ACDI!($D(ACDSKIP))  D
 .I '$P(^ACDTITEM(ACDI,0),U,8) D SINGLE Q
 .D MULT
 .Q
 Q
SINGLE ;
 K X,ACDSPEC S X="",ACDX=0
 X:$D(^ACDTITEM(ACDI,1)) ^(1)
 I X="" S ACDSKIP="" Q
 I '$D(ACDSPEC),'$D(^ACDRPTD(ACDRPT,11,ACDI,11,"B",X)) S ACDSKIP="" Q
 Q
MULT ;
 K ACDFOUN,ACDSKIP,ACDSPEC,X S ACDX=0,X=""
 X:$D(^ACDTITEM(ACDI,1)) ^(1)
 I $O(X(""))="" S ACDSKIP="" Q
 I '$D(ACDSPEC) S Y="" F  S Y=$O(X(Y)) Q:Y=""  I $D(^ACDRPTD(ACDRPT,11,ACDI,11,"B",Y)) S ACDFOUN="" Q
 I $D(ACDSPEC),$D(X) S ACDFOUN=1 Q
 S:'$D(ACDFOUN) ACDSKIP=""
 Q
XIT ;EP - CALLED FROM ACDRL
 K ACD,ACDA,ACDACE,ACDANS,ACDBD,ACDBDD,ACDBT,ACDBTH,ACDC,ACDCAND,ACDCNT,ACDCRIT,ACDCTYP,ACDCUT,ACDD,ACDDA,ACDDASH,ACDDFET,ACDDISP,ACDDONE,ACDED,ACDEDD,ACDEN1,ACDEP1,ACDEP2,ACDET,ACDFIEL,ACDFILE,ACDFLG,ACDFOUN,ACDFRST
 K ACDG,ACDGBD,ACDGBE,ACDGBS,ACDGDB,ACDGDE,ACDGDS,ACDH,ACDHDR,ACDHEAD,ACDHIGH,ACDI,ACDJD,ACDJOB,ACDL,ACDLENG,ACDLHDR,ACDLINE,ACDM,ACDMIFN,ACDNAME,ACDNFIFN,ACDNODE,ACDODAT,ACDPACK,ACDPCNT,ACDPG,ACDPRNM,ACDPRNT,ACDPTCT,ACDPTVS
 K ACDQ,ACDQFLG,ACDQMAN,ACDQUIT,ACDR,ACDRAR,ACDRCNT,ACDRDTR,ACDREC,ACDRIEN,ACDRPT,ACDRREC,ACDS,ACDSAVE,ACDSD,ACDSEL,ACDSKIP,ACDSORT,ACDSORV,ACDSORX,ACDSPAG,ACDSPEC,ACDSRT,ACDSRTR
 K ACDSRTV,ACDTCW,ACDTEST,ACDTEXT,ACDTITL,ACDTL,ACDTMP,ACDTS,ACDTX,ACDX,ACDXREF,ACDY,ACDSCNT
 K AMQQTAX
 D KILL^AUPNPAT
 K C,D,D0,D1,DA,%,%1,%D,%E,%H,%W,%X,%Y,A,DD,DDH,DFN,DI,DIADD,DIC,DICR,DIE,DIFLD,DIG,DIH,DIK,DINUM,DIQ,DIR,DIRUT,DISYS,DIU,DIV,DIW,DIWF,DIWL,DIWR,DIY,DK,DL,DLAYGO,DO,DQ,DR,F,F1,F2,H,I,J,K,L,M,P,POP,S,TS,V,X,X1,X2,Y,Z
XIT1 ;EP
 K X,X1,X2,IO("Q"),%,Y,POP,DIRUT,ZTSK,ZTQUEUED,H,S,TS,M,ZTIO,DUOUT,DIR,DTOUT,V,Z,I,DIC,DIK,DIADD,DLAYGO,DA,DR,DIE,DIU,AMQQTAX,DINUM,ACDPACK,ACDEP1,ACDEP2,D,ACDLENG,ACDLHDR,ACDSAVE
 Q
