LRMIEDZ2 ;SLC/CJS/BA,AVAMC/REG - MICROBIOLOGY EDIT ROUTINE ;3/2/03  18:06
 ;;5.2;LAB SERVICE;**1030**;NOV 01, 1997
 ;;5.2;LAB SERVICE;**23,104,242,295**;Sep 27, 1994;Build 5
 ;from LRFAST,LRMIEDZ,LRVER
PAT S X=LRAN F I=0:0 R:'$D(LRAN) !!,"Accession #: ",X:DTIME Q:X=""!(X[U)  D
 .S LRANOK=1,LRCAPOK=1 D LRANX^LRMIU4 D:LRANOK PAT1 L:$G(LRANOK) -^LR(LRDFN,"MI",LRIDT)
 .K LRTS D:LRCAPOK&(LRANOK)&($P(LRPARAM,U,14)) ^LRCAPV1 K:LRANOK LRAN I 'LRANOK W !,"Enter the accession number" K LRAN
 Q
PAT1 S LRDFN=+^LRO(68,LRAA,1,LRAD,1,LRAN,0),LRIDT=9999999-^(3),LRCDT=+^(3),LREAL=$P(^(3),U,2),LRI=+$O(^(5,0)),LRSPEC=$S($D(^(LRI,0)):+^(0),1:"")
 I '$O(^LRO(68,LRAA,1,LRAD,1,LRAN,4,0)) W !,"No tests associated with this accession" D  S LRANOK=0 Q
 .Q:$P($G(^LRO(68,LRAA,1,LRAD,1,LRAN,.2))," ")=$P(^LRO(68,LRAA,0),U,11)
 .W !,"Verify with accession #: ",$G(^LRO(68,LRAA,1,LRAD,1,LRAN,.2))
 L +^LR(LRDFN,"MI",LRIDT):1 I '$T W !!?10,"Someone else is editing this accession ",!,$C(7) S LRANOK=0 Q
 I $D(^LR(LRDFN,"MI",LRIDT,0)) S (LRBG0,Y(0))=^(0)
 I '$D(^LR(LRDFN,"MI",LRIDT,0)) D BB
 ; S LRDPF=$P(^LR(LRDFN,0),U,2),DFN=$P(^(0),U,3),LRUNDO=0 D PT^LRX W !!,?5,PNM,"   SSN: ",SSN W:LRDPF=2 "  LOC: ",$S($L(LRWRD):LRWRD,1:$S($D(^LR(LRDFN,.1)):^(.1),1:"??"))
 ; ----- BEGIN IHS/OIT/MKK - LR*5.2*1030
 S LRDPF=$P(^LR(LRDFN,0),U,2),DFN=$P(^(0),U,3),LRUNDO=0
 D PT^LRX W !!,?5,PNM,"   HRCN: ",HRCN
 W:LRDPF=2 "  LOC: ",$S($L(LRWRD):LRWRD,1:$S($D(^LR(LRDFN,.1)):^(.1),1:"??"))
 ; ----- END IHS/OIT/MKK - LR*5.2*1030
 I $P(^LR(LRDFN,"MI",LRIDT,0),U,3) W !,"Final report has been verified by microbiology supervisor.",$C(7),!,"If you proceed in editing, this report will need to be reverified."
 F I=0:0 W !,?10,"OK" S %=1 D YN^DICN Q:%  W !,"Enter 'Y' or 'N':"
 I %=2!(%<0) S LRCAPOK=0 Q
 I $P(^LR(LRDFN,"MI",LRIDT,0),U,3)!$P(^LR(LRDFN,"MI",LRIDT,0),U,9) S LRUNDO=1 ;W:$P(^(0),U,9) !,"(This is an AMENDED report)",!
 F I=0:0 D EC^LRMIEDZ4 Q:$D(LRNPTP)  W:N=0 !,"NO TESTS ON WORKLIST" Q:N=0  S LRI=1 Q:N'>1  R !,"Choose: ",LRI:DTIME Q:LRI[U!(LRI="")  S LRI=+LRI I LRI>0,LRI'>N,LRI?1N.N Q
 I LRI[U!(+LRI'>0) S LRCAPOK=0 Q
 S LRTS=LRTS(LRI) D:LRUNDO UNDO^LRMIEDZ
 K DR S DA=LRIDT,DA(1)=LRDFN,DIE="^LR(LRDFN,""MI"","
 S LRSB=$S(LRTX(LRI)["11.5":1,LRTX(LRI)["23":11,LRTX(LRI)["19":8,LRTX(LRI)["15":5,LRTX(LRI)["34":16,1:"")
 S LRFIFO=LRTX(LRI)["FIFO",(LREND,LRSAME)=0 D:'LRFIFO TIME^LRMIEDZ3 I LREND K DR Q
 S LRSSC=$P(^LR(LRDFN,"MI",LRIDT,0),U,5)_U_$P(^(0),U,11)
 ; I LRTX(LRI)'["S DR=""[",LRSB X LRTX(LRI) D UPDATE^LRPXRM(LRDFN,"MI",LRIDT) D:'LREND EC3 K DR D:LRUNDO&$P($G(^LR(LRDFN,"MI",LRIDT,LRSB)),U)'="" VT^LRMIUT1 Q
 ; ----- BEGIN IHS/OIT/MKK - LR*5.2*1030
 I LRTX(LRI)'["S DR=""[",LRSB D  Q
 . X LRTX(LRI)
 . ; D UPDATE^LRPXRM(LRDFN,"MI",LRIDT) ; IHS/OIT/MKK - LR*5.2*1030 - RPMS Does NOT use Clinical Reminders
 . D:'LREND EC3
 . D:BLRLOG ^BLREVTQ("M","R","MICRO")
 . K DR
 . D:LRUNDO&$P($G(^LR(LRDFN,"MI",LRIDT,LRSB)),U)'="" VT^LRMIUT1
 . D TRIG
 ; ----- END IHS/OIT/MKK - LR*5.2*1030
 S (X,DR)=$P($P(LRTX(LRI),"[",2),"]",1) S:$L(X) X=+$O(^DIE("B",X,0)) I X<1,'$D(^DIE(+X,"DR",2,63.05)) W !,DR," template doesn't exist for Microbiology." K DR Q
 S J=1 F  S J=+$O(^DIE(X,"DR",J)) Q:J<1  S K=+$O(^DIE(X,"DR",J,0)),DR(J-1,K)=^DIE(X,"DR",J,K)
 ; S DR=DR(1,63.05) D ^DIE,UPDATE^LRPXRM(LRDFN,"MI",LRIDT),EC3 K DR
 S DR=DR(1,63.05) D ^DIE,EC3 K DR  ; IHS/OIT/MKK - LR*5.2*1030 - RPMS Does NOT use Clinical Reminders
 Q
BB I '$D(^LR(LRDFN,"MI",0)) S ^LR(LRDFN,"MI",0)="^63.05DA^"
 S ^LR(LRDFN,"MI",0)=$P(^LR(LRDFN,"MI",0),U,1,2)_U_LRIDT_U_(1+$P(^(0),U,4))
 S ^LR(LRDFN,"MI",LRIDT,0)=LRCDT_U_LREAL_"^^^"_LRSPEC_U_$P(^LRO(68,LRAA,0),U,11)_" "_$E(LRAD,2,3)_" "_LRAN_"^^UNKNOWN",(LRBG0,Y(0))=^(0)
 Q
EC3 S LRSSCN=$P(^LR(LRDFN,"MI",LRIDT,0),U,5)_U_$P(^(0),U,11) D:LRSSCN'=LRSSC UPDATE K LRSSCN,LRSSC S LRSAME=1 D TIME^LRMIEDZ3 D:'LREND STF^LRMIUT
 Q
UPDATE D CHECK K LRSSCOM,LRSSCOM1,LRSSCA,LRSSCAA,LRSSCAY,LRSSCAN,LRSSCOD,LRSSCON
 Q
CHECK ;
 S LRSSCA=$P(^LR(LRDFN,"MI",LRIDT,0),U,6),LRSSCAA=+$O(^LRO(68,"B",$P(LRSSCA," "),0))
 S X=$P(LRSSCA," ",2) D ^%DT S LRSSCAY=Y,LRSSCAN=$P(LRSSCA," ",3)
 S J=0 F I=0:0 S J=+$O(^LRO(68,LRSSCAA,1,LRSSCAY,1,LRSSCAN,5,J)) Q:J<1  I ^(J,0)=LRSSC S ^(0)=LRSSCN Q
 I J<1 Q
 S LRSSCOD=$P(^LRO(68,LRSSCAA,1,LRSSCAY,1,LRSSCAN,0),U,4),LRSSCON=^(.1)
 S J=0 F I=0:0 S J=+$O(^LRO(69,LRSSCOD,1,J)) Q:J<1  I $D(^(J,.1)),^(.1)=LRSSCON D ORDER Q
 Q
ORDER S $P(^LRO(69,LRSSCOD,1,J,0),U,3)=$P(LRSSCN,U,2)
 S K=0 F I=0:0 S K=+$O(^LRO(69,LRSSCOD,1,J,4,K)) Q:K<1  I ^(K,0)=LRSSC S ^(0)=LRSSCN Q
 Q
 ;
 ; ----- BEGIN IHS/OIT/MKK - LR*5.2*1030
 ;       Added per Appendix A RPMS E-Sig EnhancementV 5.2 Techinical Manual
TRIG ; EP
 I $$ADDON^BLRUTIL("LR*5.2*1013","BLRALAF",DUZ(2)) D ^BLRALAF
 ; ----- END IHS/OIT/MKK - LR*5.2*1030
