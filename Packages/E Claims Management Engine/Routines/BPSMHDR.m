BPSMHDR ;BHAM ISC/FCS/DRS - MENUS HEADERS ;06/01/2004 
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 ;
 ;****** Send this routine with each new patch with **n** in piece
 ;****** 3 so the patch level can be displayed as part of the
 ;****** menu header.
 ;
 ; BPSQUIT,BPSRVON,BPSRVOF,BPSTOP,BPSVER,BPSPNM, and BPSSITE returned to calling routine
INIT ;EP -
 N BPSY,X
 I $G(XQY0)'="",$G(BPSTOP)="" S BPSTOP=XQY0
 S BPSY="",BPSY=$O(^DIC(9.4,"C","BPS",BPSY))
 S BPSVER=^DIC(9.4,BPSY,"VERSION"),BPSVER="V"_BPSVER K BPSY
 S X=$T(+2),X=$P(X,";;",2),X=$P(X,";",3),X=$P(X,"**",2),X=$P(X,",",$L(X,","))
 S:X]"" BPSVER=BPSVER
 S BPSPNM="Electronic Claims Management Engine (ECME)"
 I '$D(DUZ(2)) W !!,"Your SITE NAME is not set for the KERNEL.",!,"Please contact your System Support person.",!! S BPSQUIT=1 Q
 I '$D(DUZ(0)) W !!,"You do not have the DUZ(0) variable.",!,"Please contact your System Support person.",!! S BPSQUIT=1 Q
 I '$D(^XUSEC("BPSMENU",DUZ)) W !!,"You do not have the appropriate keys.",!,"Please contact your System Support person.",!! S BPSQUIT=1 Q
 S BPSSITE=$P(^DIC(4,DUZ(2),0),"^")
 I '$D(IORVON) S X="IORVON;IORVOFF" D ENDR^%ZISS
 I $G(IO) S Y=$O(^%ZIS(1,"C",IO,0)) I Y S Y=$P($G(^%ZIS(1,Y,"SUBTYPE")),U) I Y S X=$G(^%ZIS(2,Y,5)),BPSRVON=$P(X,U,4),BPSRVOF=$P(X,U,5)
 I $G(BPSRVON)="" S BPSRVON="""""",BPSRVOF=""""""
 Q
 ;
HDR ;EP - Screen header.
 I $D(XQSAV),XQY0'=XQSAV Q
 Q:$G(XQY0)=""
 I $G(BPSTOP)="" D INIT Q:$G(BPSQUIT)
 I '$D(IORVON) S X="IORVON;IORVOFF" D ENDR^%ZISS
 S X=$P(XQY0,U,2),BPSMT=$S($P(XQY0,U)="BPSMENU":"Main Menu",1:X)
 S BPSPNV=BPSPNM_" "_BPSVER
 NEW A,D,F,I,L,N,R,V
 S F=0
 W !
 S A=$X W IORVON,IORVOFF S D=$X S:D>A F=D-A ;compute length of revvideo
 S L=(80-$L(BPSPNV))\2-1,R=L+$L(BPSPNV)+1
 S D=$L(BPSPNV)+2,N=$L(BPSPNV)-1
 W @IOF,!,$$CTR($$REPEAT^XLFSTR("*",D)),!
 W ?L,"*",$$CTR(BPSPNV,N),?R,"*",!
 W ?L,"*",$$CTR($$LOC(),N),?R,"*",!
 W ?L,"*",?(L+(((R-L)-$L(BPSMT))\2)),IORVON,BPSMT,IORVOFF,?R+F,"*",!
 W $$CTR($$REPEAT^XLFSTR("*",D)),!
 K BPSMT,BPSPNV,BPSTOP,BPSPNM,BPSVER
 Q
 ;
 ;----------
CTR(X,Y) ;EP - Center X in a field Y wide.
 Q $J("",$S($D(Y):Y,1:IOM)-$L(X)\2)_X
 ;----------
LJRF(X,Y,Z) ;EP - left justify X in a field Y wide, right filling with Z.
 NEW L,M
 I $L(X)'<Y Q $E(X,1,Y-1)_Z
 S L=Y-$L(X)
 S $P(M,Z,L)=Z
 Q X_M
 ;----------
USR() ;EP - Return name of current user from ^VA(200.
 N RTN
 S RTN=$$GET1^DIQ(200,DUZ,.01)
 I RTN="" S RTN="DUZ UNDEFINED OR 0"
 Q RTN
 ;----------
LOC() ;EP - Return location name from file 4 based on DUZ(2).
 Q $S($G(DUZ(2)):$S($D(^DIC(4,DUZ(2),0)):$P(^(0),U),1:"UNKNOWN"),1:"DUZ(2) UNDEFINED OR 0")
