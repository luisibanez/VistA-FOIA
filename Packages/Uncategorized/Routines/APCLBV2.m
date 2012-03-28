APCLBV2 ; IHS/CMI/LAB - gather billable visits ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;SEARCH VISIT FILE FOR DATE RANGE AND GENERATE CLINIC COUNTS
 ;
 S APCLJOB=$J,APCLBT=$H
 K ^XTMP("APCLBV",APCLJOB,APCLBT)
 D XTMP^APCLOSUT("APCLBV","PCC - POTENTIALLY BILLABLE VISITS")
 S (APCLS,APCLSAVE)=APCLSD-.000001
 ;Set total visit counters
 S (APCLT1,APCLT2,APCLT3,APCLT4,APCLT5,APCLT6,APCLTOTV)=0
 D:$D(APCLPALL) ALL
 I '$D(APCLPALL) D @APCLPROC
 S APCLET=$H
 Q
ALL ;process ALL coverage reports
 S (APCLPROC,APCLRNUM)=1 D 1
 S (APCLPROC,APCLRNUM)=2 D 2
 S (APCLPROC,APCLRNUM)=3 D 3
 S (APCLPROC,APCLRNUM)=4 D 4
 S (APCLPROC,APCLRNUM)=5 D 5
 S (APCLPROC,APCLRNUM)=6 D 6
 Q
1 F X="03","04","30","31" S Y=$O(^AUTTBEN("C",X,"")) S APCLCOAR(Y)="" S APCLCOPN(Y)=$P(^AUTTBEN(Y,0),U)
 D V
 ;
 Q
V ;
 S APCLS=APCLSAVE
 F I=0:0 S APCLS=$O(^AUPNVSIT("B",APCLS)) Q:APCLS=""!($P(APCLS,".")>APCLED)  D V1
 Q
V1 ;
 S APCLVDFN="" F J=0:0 S APCLVDFN=$O(^AUPNVSIT("B",APCLS,APCLVDFN)) Q:APCLVDFN=""  S APCLVN0=^AUPNVSIT(APCLVDFN,0) D @(APCLPROC_"2")
 Q
12 S DFN=$P(APCLVN0,U,5) Q:DFN=""  Q:$$DEMO^APCLUTL(DFN,$G(APCLDEMO))
 Q:$P(APCLVN0,U,11)
 Q:'$D(^AUPNPAT(DFN,41,APCLSU,0))
 Q:'$D(^AUPNPAT(DFN,11))
 S APCLCOP=$P(^AUPNPAT(DFN,11),U,11) Q:APCLCOP=""
 Q:'$D(APCLCOAR(APCLCOP))
VC ;
 Q:$$DEMO^APCLUTL($P(APCLVN0,U,5),$G(APCLDEMO))
 Q:APCLSC'[$P(APCLVN0,U,7)
 Q:'$P(APCLVN0,U,9)
 I APCLCLN,$P(APCLVN0,U,8)'=APCLCLN Q
 Q:'$D(^AUPNVPOV("AD",APCLVDFN))
 Q:'$D(^AUPNVPRV("AD",APCLVDFN))
 Q:$P(APCLVN0,U,6)'=APCLSU
 S APCLPN=$P(^DPT(DFN,0),U)
 S ^XTMP("APCLBV",APCLJOB,APCLBT,APCLRNUM,APCLPN,DFN,APCLVDFN)=""
 I APCLRNUM=1 S APCLT1=APCLT1+1
 I APCLRNUM=2 S APCLT2=APCLT2+1
 I APCLRNUM=3 S APCLT3=APCLT3+1
 I APCLRNUM=4 S APCLT4=APCLT4+1
 I APCLRNUM=5 S APCLT5=APCLT5+1
 I APCLRNUM=6 S APCLT6=APCLT6+1
 S APCLTOTV=APCLTOTV+1
 Q
2 ;
 S APCLVAL=$S(APCLPROC=2:"A",1:"B")
 S APCLPROC=2
 D V
 Q
22 ;
 Q:$P(APCLVN0,U,11)
 S DFN=$P(APCLVN0,U,5) Q:DFN=""
 Q:'$D(^DPT(DFN,0))
 Q:'$D(^AUPNMCR(DFN,11))
 Q:'$D(^AUPNPAT(DFN,41,APCLSU,0))
 I $D(^DPT(DFN,.35)),$P(^(.35),U)]"",$P(^(.35),U)<$P(APCLS,".") Q
 K APCLGOT S APCLMDFN=0 F  S APCLMDFN=$O(^AUPNMCR(DFN,11,APCLMDFN)) Q:APCLMDFN'=+APCLMDFN!($D(APCLGOT))  D 23
 Q:'$D(APCLGOT)
 S APCLPN=$P(^DPT(DFN,0),U)
 D VC
 Q
 ;
23 ;
 Q:APCLVAL'[$P(^AUPNMCR(DFN,11,APCLMDFN,0),U,3)
 Q:$P(^AUPNMCR(DFN,11,APCLMDFN,0),U)>$P(APCLS,".")
 I $P(^AUPNMCR(DFN,11,APCLMDFN,0),U,2)]"",$P(^(0),U,2)<$P(APCLS,".") Q
 S APCLGOT=""
 Q
 ;
3 ;
 D 2
 Q
 ;
5 ;
 D V
 Q
52 ;
 Q:$P(APCLVN0,U,11)
 S DFN=$P(^AUPNVSIT(APCLVDFN,0),U,5) Q:DFN=""
 Q:'$D(^AUPNPRVT(DFN,11))
 Q:'$D(^AUPNPAT(DFN,41,APCLSU))
 I $D(^DPT(DFN,.35)),$P(^(.35),U)]"",$P(^(.35),U)<$P(APCLS,".") Q
 S APCLPN=$P(^DPT(DFN,0),U)
 K APCLGOT S APCLMDFN=0 F  S APCLMDFN=$O(^AUPNPRVT(DFN,11,APCLMDFN)) Q:APCLMDFN'=+APCLMDFN  D 53
 Q:'$D(APCLGOT)
 D VC
 Q
53 ;
 Q:$P(^AUPNPRVT(DFN,11,APCLMDFN,0),U)=""
 S APCLNAME=$P(^AUPNPRVT(DFN,11,APCLMDFN,0),U) Q:APCLNAME=""
 S APCLNAME=$P(^AUTNINS(APCLNAME,0),U) I APCLNAME["AHCCCS" Q
 Q:$P(^AUPNPRVT(DFN,11,APCLMDFN,0),U,6)=""
 Q:$P(^AUPNPRVT(DFN,11,APCLMDFN,0),U,6)>$P(APCLS,".")
 I $P(^AUPNPRVT(DFN,11,APCLMDFN,0),U,7)]"",$P(^(0),U,7)<$P(APCLS,".") Q
 S APCLGOT=""
 Q
 ;
4 ;
 D V
 Q
42 ;
 Q:$P(APCLVN0,U,11)
 S DFN=$P(^AUPNVSIT(APCLVDFN,0),U,5) Q:DFN=""
 Q:'$D(^AUPNPAT(DFN,41,APCLSU))
 I $D(^DPT(DFN,.35)),$P(^(.35),U)]"",$P(^(.35),U)<$P(APCLS,".") Q
 S APCLPN=$P(^DPT(DFN,0),U)
 K APCLGOT S APCLMDFN=0 S APCLMDFN=$O(^AUPNMCD("B",DFN,APCLMDFN)) Q:APCLMDFN'=+APCLMDFN!($D(APCLGOT))  D 43
 Q:'$D(APCLGOT)
 D VC
 Q
43 ;
 Q:'$D(^AUPNMCD(APCLMDFN,11))
 K APCLGOT S APCLNDFN=0 F  S APCLNDFN=$O(^AUPNMCD(APCLMDFN,11,APCLNDFN)) Q:APCLNDFN'=+APCLNDFN!($D(APCLGOT))  S APCLREC=^AUPNMCD(APCLMDFN,11,APCLNDFN,0) D 44
 Q
44 ;
 Q:APCLNDFN>$P(APCLS,".")
 I $P(APCLREC,U,2)]"",$P(APCLREC,U,2)<$P(APCLS,".") Q
 S APCLGOT=""
 Q
 ;
6 ;NON INDIANS
 D V
 Q
62 ;
 Q:$P(APCLVN0,U,11)
 S DFN=$P(^AUPNVSIT(APCLVDFN,0),U,5) Q:DFN=""
 Q:'$D(^AUPNPAT(DFN,41,APCLSU))
 I $D(^DPT(DFN,.35)),$P(^(.35),U)]"",$P(^(.35),U)<$P(APCLS,".") Q
 Q:'$D(^AUPNPAT(DFN,11))
 Q:$P(^AUPNPAT(DFN,11),U,11)=01
 Q:$P(^AUPNPAT(DFN,11),U,8)=""
 S APCLTRI=$P(^AUPNPAT(DFN,11),U,8)
 Q:'$D(^AUTTTRI(APCLTRI))
 S APCLTRIC=$P(^AUTTTRI(APCLTRI,0),U,2)
 Q:(+APCLTRIC&(APCLTRIC<969))
 D VC
 Q
