LRCAPR2 ;DALOI/PAC/FHS/JBM - WKLD REP GENERATOR-BUILD ;10/11/92 01:55
 ;;5.2T9;LR;**1018**;Nov 17, 2004
 ;;5.2;LAB SERVICE;**88,105,263,264**;Sep 27, 1994
 ; Reference to  ^DIC(4 Supported by Reference #10090
 ; Reference to  ^SC(  Supported by Reference #10040
 S:$D(ZTQUEUED) ZTREQ="@"
 K ^TMP("LR",$J) D DATE,^LRCAPR3
 K LRLDIV,LRDIV
 Q
DATE ;
 N LRNOP
 I LRTO<LRFR S X=LRFR,LRFR=LRTO,LRTO=X
 S LRST=LRFR-.000001
 F  S LRST=$O(^LRO(68,LRAA,1,LRST)) Q:'LRST!(LRST>LRTO)  D
 . S LRNT=0
 . F  S LRNT=$O(^LRO(68,LRAA,1,LRST,1,LRNT)) Q:'LRNT  D ACC
 Q
ACC ;
 S LRACCREC=$G(^LRO(68,LRAA,1,LRST,1,LRNT,0)) Q:LRACCREC=""  D
 . S LRDIV=+$P($G(^(.3)),U,2)
 S LRFIL=+$P(LRACCREC,U,2) Q:'LRFIL  Q:(LRFIL>67.3)&(LRFIL<67.9999)
 S LRLTYP=$P(LRACCREC,U,11)
 S LRPATOK=$$CHKPAT(LRIOPAT,LRLTYP,LRFIL) Q:'+LRPATOK
 S LRPTYP=$E(LRPATOK,2)
 S LRLC=+$P(LRACCREC,U,13)
ACC1 D  Q:$G(LRNOP)
 . S LRNOP=1
 . I '$G(LRLOC),'$G(LRLDIV) S LRNOP=0 Q
 . I $G(LRDIV),'$G(LRLDIV) S LRNOP=0 Q
 . I $G(LRDIV),$G(LRLDIV),$D(LRLDIV(LRDIV)) S LRNOP=0 Q
 . I '$G(LRLC),'$G(LRLOC),$G(LRFIL)=62.3 S LRNOP=0 Q
 . I $G(LRLC),'$G(LRLOC) S LRNOP=0 Q
 . I $G(LRLC),$G(LRLOC),$D(LRLOC(LRLC)) S LRNOP=0
 . I $G(LRCNTL) S LRNOP=0
 D
 . I 'LRLC S LRLC="*MISSING LOC* ["_LRFIL_"]" Q
 . I +LRLC S LRLC=$P($G(^SC(+LRLC,0)),U) I $L(LRLC) S LRLC=LRLC_" ["_LRFIL_"]"
 . I LRLDIV,LRDIV,$D(^DIC(4,LRDIV,0))#2 S LRLC=$P(^(0),U)_" ["_LRFIL_"]" Q
 S LRAANO=$S($D(^LRO(68,LRAA,1,LRST,1,LRNT,.2)):^(.2),1:"NO ACCN")
 S LRSTCS=$G(^LRO(68,LRAA,1,LRST,1,LRNT,5,1,0)) Q:'LRSTCS
 I LRSP Q:'$P(LRSTCS,U)  Q:'$D(LRSP($P(LRSTCS,U)))
 I LRCOL Q:'$P(LRSTCS,U,2)  Q:'$D(LRCOL($P(LRSTCS,U,2)))
 S LRTST=0
 F  S LRTST=$O(^LRO(68,LRAA,1,LRST,1,LRNT,4,LRTST)) Q:'LRTST  D TEST
 Q
TEST ;
 I LRTSTS,'$D(LRTSTS(LRTST)) Q
 Q:'$D(^LRO(68,LRAA,1,LRST,1,LRNT,4,LRTST,0))#2  S LRNX=^(0) Q:'$P(LRNX,U,5)
 S LRNX5=$P(LRNX,U,5),LRNX5D=$P(LRNX5,"."),LRURG=$P(LRNX,U,2)
 I $G(LRSTAT) Q:LRURG=""  Q:'$D(LRSTAT(LRURG))#2
 S LRURGNAM=$S(LRURG="":"",$D(LRSTAT(LRURG))#2:LRSTAT(LRURG),1:"")
 S LRTEST=$$TST(LRTST)
 S LRNX5=$S($L(LRTOV,".")=1:$P(LRNX5,"."),1:LRNX5)
 S LRCPN=0 D LRCC
 Q 
LRCC ;
 S LRCPN=$O(^LRO(68,LRAA,1,LRST,1,LRNT,4,LRTST,1,LRCPN)) Q:'LRCPN  S LRNODE=$G(^(LRCPN,0)) G:'LRNODE LRCC
 I LRSITSEL,'$D(LRSITSEL(+$P(LRNODE,U,8))) G LRCC
 I LRCAPS,'$D(LRCAPS(+LRNODE)) G LRCC
 S LRCAPNAM=$$WKLDNAME^LRCAPU(+LRNODE)
 I (LRRTYP=2)&('LRCAPFLG) G LRCC
 I (LRRTYP=3)&(LRCAPFLG) G LRCC
 S:(LRCAPFLG)&($E(LRTEST)'="+") LRTEST="+"_LRTEST
 S LRCP=LRCAPNUM G:'LRCP LRCC
 S LRDOT="."_$P(LRCP,".",2)
 S LRTESTCP=$E(LRTEST_"       ",1,8)_" ["_LRCP_"]"
 I LRCPSX,'$D(LRCPSX(LRDOT)) G LRCC
 S LRMACN=+$O(^LAB(64.2,"F",LRDOT,0))
 S LRMAC=$S($L($G(^LAB(64.2,LRMACN,0))):$P(^(0),U),1:"ERROR"_LRMACN)
 S:'$D(^TMP("LR",$J,"TST/TOT")) ^("TST/TOT")=0  S ^("TST/TOT")=^("TST/TOT")+1
 S:'$D(^TMP("LR",$J,"TST",LRTEST)) ^(LRTEST)=0 S ^(LRTEST)=^(LRTEST)+1
 S:'$D(^TMP("LR",$J,"TST",LRTEST,LRLC)) ^(LRLC)=0 S ^(LRLC)=^(LRLC)+1
 S:'$D(^TMP("LR",$J,"TST",LRTEST,LRLC,LRCP)) ^(LRCP)=0 S ^(LRCP)=^(LRCP)+1,J=^(LRCP)
 S ^TMP("LR",$J,"TST",LRTEST,LRLC,LRCP,LRAANO,(J+1))=LRNX5_U_LRMAC_U_LRURGNAM
 S:'$D(^TMP("LR",$J,"TST/LOC",LRLC)) ^(LRLC)=0 S ^(LRLC)=^(LRLC)+1
 S:'$D(^TMP("LR",$J,"TST/LRM",LRMAC)) ^(LRMAC)=0 S ^(LRMAC)=^(LRMAC)+1
 S:'$D(^TMP("LR",$J,"TST/LRM",LRMAC,LRTESTCP)) ^(LRTESTCP)=0 S ^(LRTESTCP)=^(LRTESTCP)+1
 I $G(LRCTL),$G(LRCNTL) D
 . S:'$D(^TMP("LR",$J,"TST/CTL",LRMAC)) ^(LRMAC)=0 S ^(LRMAC)=^(LRMAC)+1
 . S:'$D(^TMP("LR",$J,"TST/CTL",LRMAC,LRTESTCP)) ^(LRTESTCP)=0 S ^(LRTESTCP)=^(LRTESTCP)+1
 I LRURGNAM'="" D
 . S:'$D(^TMP("LR",$J,"TST/URG",LRPTYP,LRURGNAM)) ^(LRURGNAM)=0 S ^(LRURGNAM)=^(LRURGNAM)+1
 . S:'$D(^TMP("LR",$J,"TST/URG",LRPTYP,LRURGNAM,LRTEST)) ^(LRTEST)=0 S ^(LRTEST)=^(LRTEST)+1
 . S:'$D(^TMP("LR",$J,"TST/URG","A",LRURGNAM)) ^(LRURGNAM)=0 S ^(LRURGNAM)=^(LRURGNAM)+1
 . S:'$D(^TMP("LR",$J,"TST/URG","A",LRURGNAM,LRTEST)) ^(LRTEST)=0 S ^(LRTEST)=^(LRTEST)+1
 S:'$D(^TMP("LR",$J,"DATE",LRNX5D)) ^(LRNX5D)=0 S ^(LRNX5D)=^(LRNX5D)+1
 S:'$D(^TMP("LR",$J,"DATE",LRNX5D,LRTESTCP)) ^(LRTESTCP)=0 S ^(LRTESTCP)=^(LRTESTCP)+1
 S:'$D(^TMP("LR",$J,"DAY",LRNX5D)) ^(LRNX5D)=0 S ^(LRNX5D)=^(LRNX5D)+1
 S:'$D(^TMP("LR",$J,"DAY",LRNX5D,LRMAC)) ^(LRMAC)=0 S ^(LRMAC)=^(LRMAC)+1
 S:'$D(^TMP("LR",$J,"DAY",LRNX5D,LRMAC,LRTESTCP)) ^(LRTESTCP)=0 S ^(LRTESTCP)=^(LRTESTCP)+1,J=^(LRTESTCP)
 G LRCC
 Q
TST(X) ; this returns the print test name otherwise the test name.
 N LRDA
 ;tests are truncated if greater than 7 chars long
 S LRDA=$G(X) Q:'LRDA "Unknown"
 Q:'$D(^LAB(60,LRDA,0))#2 "Unknown"
 Q:$P($G(^LAB(60,LRDA,.1)),U)'="" $P($G(^(.1)),U)
 Q $S($L($P(^LAB(60,LRDA,0),U))>7:$E($P(^LAB(60,LRDA,0),U),1,6)_"*",1:$P(^LAB(60,LRDA,0),U))
CHKPAT(LRIOPAT,LRLTYP,LRFIL) ; return flag indicating if this record is for
 ; a patient type selected for this report and if so, what type.
 S LRCNTL=$S(LRFIL=62.3:1,1:0)
 ; I LRIOPAT["A" Q "1A"  ;All Patients
 I ("ORW"[LRLTYP)&((LRFIL=2))&((LRIOPAT["I")) Q "1I" ;       Inpatient
 I ("ORW"'[LRLTYP)&((LRFIL=2))&((LRIOPAT["O")) Q "1O" ;    Outpatient
 I LRFIL'=2,LRIOPAT["R" Q "1R" ;     Other
 Q 0
