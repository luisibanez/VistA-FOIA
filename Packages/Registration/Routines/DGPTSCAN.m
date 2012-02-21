DGPTSCAN ;ALB/MTC - SPECIAL ACTION SCAN PROCESS ; 1 MAR 91
 ;;5.3;Registration;**29,64,114,189**;Aug 13, 1993
 ;;MAS 5.1
CHK501 ;--
 D INIT G ENQ:DGOUT
 G ENQ:'$D(^DGPT(DGPTF,"M",+DGMOV,0))
 S DGREC=^(0)
 F DGI=5:1:9 I $P(DGREC,U,DGI) S DGPTIT($P(DGREC,U,DGI)_";ICD9(")=""
 S DGHOLD=$S($D(^DGPT(DGPTF,"M",+DGMOV,300)):^(300),1:"")
 D SCAN
 I '$D(DGBPC),DGHOLD']"" G CHK5Q
 S DIE="^DGPT(",DA=DGPTF,DR="[DGPT 501 CLEANUP]"
 D ^DIE
 ;;
 ;;ADDED FOR GAF ENHANCEMENT 6/2/98
 ;;Gathers GAF Score, GAF Date, GAF Provider and sends to
 ;;Mental Health package
 N DGGAFSC,DGGAFDT,DGGAFPR,DGDFN
 S DGGAFSC=$P(DGHOLD,"^",6),DGDFN=$P(^DGPT(DGPTF,0),"^")
 S DGGAFDT=$P(^DGPT(DGPTF,0),"^",2)\1
 S DGGAFPR=$P($G(^DGPT(DGPTF,"M",+DGMOV,"P")),"^",5) ;Provider
 D UPD^YSGAF(DGDFN,DGGAFSC,DGGAFDT,DGGAFPR,"I")
 ;;END GAF ENHANCEMENTS
 ;;
CHK5Q K DA,DR,DGHOLD,DGBPC,DGPTIT,DIE,DGREC,DGI,DGSCDT,DGSTART,DGTREC,DGOUT
 Q
 ;
CHK401 ;-- 
 D INIT G ENQ:DGOUT
 G ENQ:'$D(^DGPT(DGPTF,"S",+DGSUR,0))
 S DGREC=^(0)
 F DGI=8:1:12 I $P(DGREC,U,DGI) S DGPTIT($P(DGREC,U,DGI)_";ICD0(")=""
 S DGHOLD=$S($D(^DGPT(DGPTF,"S",+DGSUR,300)):^(300),1:"")
 D SCAN
 I '$D(DGBPC),DGHOLD']"" G CHK4Q
 S DIE="^DGPT(",DA=DGPTF,DR="[DGPT 401 CLEANUP]"
 D ^DIE
CHK4Q K DA,DR,DGHOLD,DGBPC,DGPTIT,DIE,DGREC,DGI,DGSCDT,DGSTART,DGTREC,DGOUT
 Q
 ;
CHK701 ;-- will get data from flagchk then stuff into 701 (300 node)
 G CHK7Q:'$D(^DGPT(DGPTF,70)) S DGREC=^(70)
 F DGI=10,16:1:24 I $P(DGREC,U,DGI) S DGPTIT($P(DGREC,U,DGI)_";ICD9(")=""
 D DC,SCAN,ANYPSY,FLAGCHK
 S DGREC=$S($D(^DGPT(DGPTF,300)):^(300),1:""),DR="",DA=DGPTF,DIE="^DGPT("
 D GETNUM
 F DGII=2:1:DGFNUM S DR=DR_$S($P(DG701,U,DGII)]""&($P(DG701,U,DGII)'=$P(DGREC,U,DGII)):"300.0"_DGII_"////"_$P(DG701,U,DGII)_";",'$D(DGBPC(DGII))&($P(DGREC,U,DGII)]"")&($P(DG701,U,DGII)']""):"300.0"_DGII_"////@;",1:"")
CHK7J I DR]"" D ^DIE
CHK7Q ;
 K DGII,DA,DR,DIE,DG701,DGI,DGT,DGREC,DGFNUM,DGSCDT,DGSTART,DGTREC,DGOUT
 Q
FLAGCHK ;-- build 701 from 501 responses, kill flags if necessary
 S DG701="",DGOUT=0
 F DGI=0:0 S DGI=$O(^DGPT(DGPTF,"M","AM",DGI)) Q:DGI'>0  F DGJ=0:0 S DGJ=$O(^DGPT(DGPTF,"M","AM",DGI,DGJ)) Q:DGJ'>0  I $D(^DGPT(DGPTF,"M",DGJ,300)) S DGHOLD=^(300) D FL1
 S DGNDIS=$S('$D(^DGPT(DGPTF,70)):0,1:+^(70))
 I DGNDIS'>0,$D(^DGPT(DGPTF,"M",1,300)) S DGHOLD=^(300) D FL1
FLAGQ K DGI,DGNDIS
 Q
FL1 ;
 D GETNUM
 F DGII=2:1:DGFNUM I $P(DGHOLD,U,DGII)]"",$P(DG701,U,DGII)']"" S $P(DG701,U,DGII)=$P(DGHOLD,U,DGII) K DGBPC(DGII)
FL1Q K DGII,DGHOLD,DGK,DGFNUM
 Q
 ;
SCAN ;-- process DGPTIT array
 K DGBPC
 D ISPSY
 G:'$D(DGPTIT) SCANQ
 S DGI="" F DGJ=0:0 S DGI=$O(DGPTIT(DGI)) Q:DGI=""  F DGK=0:0 S DGK=$O(^DIC(45.89,"ASPL",DGI,DGK)) Q:'DGK  D S1
SCANQ ;
 K DGSPEC,DGI,DGJ,DGK
 Q
 ;
S1 ;-- check inactive dates, set flag array
 G S1Q:'$D(^DIC(45.89,DGK,0)) S X=^(0)
 I $P(X,U,3)]"",$D(DGSCDT) G S1Q:DGSCDT>$P(X,U,3)
 S Y=+X
 G S1Q:'$D(^DIC(45.88,Y,0)) S X=^(0)
 I $P(X,U,3)]"",$D(DGSCDT) G S1Q:DGSCDT>$P(X,U,3)
 I $P(X,U,2)]"" S X=$P(X,U,2) F DGII=1:1 S Y=$P(X,",",DGII) Q:'Y  D FLGFIL
S1Q ;
 K X,Y,DGII
 Q
 ;
DC ;-- find discharge date
 S DGSCDT=$S('$D(^DGPT(DGPTF,70)):DT,^(70):+^(70),1:DT)
 Q
 ;
ENQ ;
 K DG701,DGSTART,DGI,DGOUT,DGREC,DGBPC,DGPTIT,DGTREC,DGSCDT
 Q
 ;
GETNUM ;-- returns the number of additional questions/flags
 S DGFNUM=7
 Q
 ;
INIT ;-- init routine
 S DGOUT=0,(DGTREC,DGHOLD)=""
 ;-- DGSTART should be set to 2910930 for national release
 S DGSTART=2910930
 D DC
 D LO^DGUTL,HOME^%ZIS
 K DGPTIT
INITQ ;
 Q
 ;
ANYPSY ;-- will go through all movements check for PSYCH specialty
 N DGMOV
 K DGPSY
 I '$D(^DGPT(DGPTF,"M")) G ANYQ
 F DGMOV=0:0 S DGMOV=$O(^DGPT(DGPTF,"M",DGMOV)) Q:'DGMOV  D ISPSY I $D(DGSPEC) S DGPSY=""
 I '$D(DGPSY) K DGBPC(5),DGBPC(6),DGBPC(7)
ANYQ ;
 K DGSPEC
 Q
ISPSY ;-- check if losing specialty is in psych range set flag.
 ;-- if psych then $D(DGSPEC)
 K DGSPEC
 I '$D(DGMOV) S DGSPEC="" G ISPSYQ
 I $D(DGMOV) S DGSPEC=$P(^DGPT(DGPTF,"M",DGMOV,0),U,2) I '$P($G(^DIC(42.4,+DGSPEC,0)),U,4) K DGSPEC
ISPSYQ Q
 ;
FLGFIL ;-- fill DGBPC with correct flag.
 I '$D(DGSPEC),Y>4,Y<8 G FLGFILQ
 S DGBPC(Y)=""
FLGFILQ ;
 Q
 ;
ANYSC(PTF) ;-- will go through all movements check for sc treatment
 ;  INPUT - ptf record ien to check
 ;  OUTPUT- 1 sc treatment, 0 no sc treatment
 N DGMOV,RESULT
 S RESULT=0
 I '$D(^DGPT(PTF,"M")) G ANYSCQ
 S DGMOV=0 F  S DGMOV=$O(^DGPT(PTF,"M",DGMOV)) Q:'DGMOV  I $P(^(DGMOV,0),U,18)=1 S RESULT=1 Q
ANYSCQ ;
 Q RESULT
 ;
