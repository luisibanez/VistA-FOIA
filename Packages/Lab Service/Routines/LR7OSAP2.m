LR7OSAP2 ;ISL/RAB-Silent Routine for autopsy report;4/01/99  
 ;;5.2T9;LR;**1018**;Nov 17, 2004
 ;;5.2;LAB SERVICE;**230,256**;Sep 27, 1994
EN(LRDFN) ;
 N CCNT,GIOM,XPOS,LR,LRSS,X,I,LRAU,LRS,VERIFIED
 S XPOS=0,(LRS(5),LR("M"),CCNT)=1,LRSS="AU",GIOM=80
 D EN^LRUA,^LRAPU
 S X=$S($D(^LRO(69.2,+Y,0)):^(0),1:""),LRAU(3)=$P(X,"^",3),LRAU(4)=$P(X,"^",4)
 D LINE,LN
 S ^TMP("LRH",$J,"AUTOPSY")=GCNT,^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(28,CCNT,"---- AUTOPSY ----")
 S VERIFIED=$P($G(^LR(LRDFN,"AU")),U,15)
 I 'VERIFIED D  Q
 . D LN
 . S ^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(XPOS,CCNT,"Report not verified.")
 D ZZ,LINE
 I $D(^LR(LRDFN,81)) D 
 . D LN
 . S ^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(XPOS,CCNT,LRAU(3))
 . D F(81)
 I $D(^LR(LRDFN,82)) D 
 . D LN
 . S ^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(XPOS,CCNT,LRAU(4))
 . D F(82)
 I $O(^LR(LRDFN,84,0)) S I=0 F  S I=$O(^LR(LRDFN,84,I)) Q:'I  S X=+^(I,0) D
 . D LINE,LN
 . S ^TMP("LRC",$J,GCNT,0)="SUPPLEMENTARY REPORT DATE: "_$$FMTE^XLFDT(X,"1P")
 . D WRAP^LR7OSAP1("^LR("_LRDFN_",84,"_I_",1)",79)
 Q:'$D(^LR(LRDFN,"AW"))&('$D(^("AY")))&('$D(^("AWI")))
 D WT
 D LRAPT3
 Q:'$D(^XUSEC("LRLAB",DUZ))
 I $P($G(^LR(LRDFN,"AY",0)),"^",4) D
 . D HD
 . S I=0
 . F  S I=$O(^LR(LRDFN,"AY",I)) Q:'I  S X=^(I,0) D LN S ^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(XPOS,CCNT,$P(^LAB(61,+X,0),"^")) D D
 Q
LN ;Increment the counter
 S GCNT=GCNT+1,CCNT=1
 Q
LINE ;Fill in the global with bank lines
 N X
 D LN
 S X="",$P(X," ",GIOM)="",^TMP("LRC",$J,GCNT,0)=X
 Q
F(NODE) ;;
 D WRAP^LR7OSAP1("^LR("_LRDFN_","_NODE_")",79)
 Q
D ;
 N LRB,M,X
 S LRB=0
 F  S LRB=$O(^LR(LRDFN,"AY",I,1,LRB)) Q:'LRB  S X=^(LRB,0) D LN S ^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(5,CCNT,$P(^LAB(61.4,+X,0),"^"))
 S LRB=0
 F  S LRB=$O(^LR(LRDFN,"AY",I,3,LRB)) Q:'LRB  S X=^(LRB,0) D LN S ^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(5,CCNT,$P(^LAB(61.3,+X,0),"^"))
 S LRB=0
 F  S LRB=$O(^LR(LRDFN,"AY",I,4,LRB)) Q:'LRB  S X=^(LRB,0) D LN S ^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(5,CCNT,$P(^LAB(61.5,+X,0),"^"))
 S M=0
 F  S M=$O(^LR(LRDFN,"AY",I,2,M)) Q:'M  S X=^(M,0) D LN S ^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(5,CCNT,$P(^LAB(61.1,+X,0),"^")) D E
 Q
E ;
 N E
 S E=0
 F  S E=$O(^LR(LRDFN,"AY",I,2,M,1,E)) Q:'E  S X=^(E,0) D LN S ^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(7,CCNT,$P(^LAB(61.2,+X,0),"^"))
 Q
HD ;
 D LINE
 D LN
 S ^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(XPOS,CCNT,"Organ/tissue:")_$$S^LR7OS(33,CCNT,"SNOMED CODING")
 Q
WT ;
 N B,X,OUT
 I '$D(^LR(LRDFN,"AW")) D 
 . D LINE,LN
 . S ^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(20,CCNT,"No organ weights entered.")
 . D LINE
 I $D(^LR(LRDFN,"AW")) S X=^("AW") D 
 . S B(9)=$P(X,"^",9),B(1)=$P(X,"^",11,99)
 . D LINE,LN
 . S ^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(XPOS,CCNT,"Rt--Lung--Lt  Liver Spleen  RT--Kidney--Lt  Brain  Body Wt(lb)    Ht(in)")
 I $D(B) D
 . D LN
 . S OUT=$$S^LR7OS(XPOS,CCNT,$J($P(X,"^",3),4))_$$S^LR7OS(9,CCNT,$J($P(X,"^",4),4))_$$S^LR7OS(15,CCNT,$J($P(X,"^",5),5))_$$S^LR7OS(22,CCNT,$J($P(X,"^",6),5))_$$S^LR7OS(29,CCNT,$J($P(X,"^",7),4))_$$S^LR7OS(39,CCNT,$J($P(X,"^",8),4))
 . S OUT=OUT_$$S^LR7OS(45,CCNT,$J($P(X,"^",10),4))_$$S^LR7OS(55,CCNT,$P(X,"^",2))_$$S^LR7OS(68,CCNT,$P(X,"^"))
 . S ^TMP("LRC",$J,GCNT,0)=OUT
 D LINE,LN
 S ^TMP("LRC",$J,GCNT,0)=""
 I $D(B) S ^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(XPOS,CCNT,"Heart(gm)")
 I $D(^LR(LRDFN,"AV")) S X=^("AV"),B(2)=$P(X,"^",7,99),^(0)=^TMP("LRC",$J,GCNT,0)_$$S^LR7OS(12,CCNT,"TV(cm)  PV(cm)  MV(cm)  AV(cm)  RV(cm)  LV(cm)")
 D LN
 S ^TMP("LRC",$J,GCNT,0)=""
 I $D(B(9)) S ^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(XPOS,CCNT,$J(B(9),5))
 I $D(B(2)) D
 . S OUT=$$S^LR7OS(12,CCNT,$J($P(X,"^"),4))_$$S^LR7OS(20,CCNT,$J($P(X,"^",2),4))_$$S^LR7OS(28,CCNT,$J($P(X,"^",3),4))_$$S^LR7OS(36,CCNT,$J($P(X,"^",4),4))_$$S^LR7OS(44,CCNT,$J($P(X,"^",5),4))_$$S^LR7OS(52,CCNT,$J($P(X,"^",6),4))
 . S ^(0)=^TMP("LRC",$J,GCNT,0)_OUT
 . D LINE,LN
 . S ^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(XPOS,CCNT,"Cavities(ml): Rt--Pleural--Lt  Pericardial  Peritoneal")
 . D LN
 . S OUT=$$S^LR7OS(14,CCNT,$J($P(B(2),"^",2),4))_$$S^LR7OS(25,CCNT,$J($P(B(2),"^"),4))_$$S^LR7OS(33,CCNT,$J($P(B(2),"^",3),4))_$$S^LR7OS(45,CCNT,$J($P(B(2),"^",4),4))
 . S ^TMP("LRC",$J,GCNT,0)=OUT
 I $D(B(1)) F B=1:1:8 D 
 . I $P(B(1),"^",B) D 
 .. S X="25."_B
 .. D LN
 .. S ^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(XPOS,CCNT,$P(^DD(63,X,0),"^")_": "_$P(B(1),"^",B))
 I $D(^LR(LRDFN,"AWI")) S Y=^("AWI") F B=1:1:5 I $P(Y,"^",B) D LN S X=$S(B=1:25.9,1:25.9_(B-1)),^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(XPOS,CCNT,$P(^DD(63,X,0),"^")_": "_$P(Y,"^",B))
 Q
ZZ ;;
 D LN
 N OUT,X,LRLLOC,DA,A,B,C,LR,Y
 S OUT=$$S^LR7OS(XPOS,CCNT,"Acc #")_$$S^LR7OS(9,CCNT,"Date/time Died")_$$S^LR7OS(27,CCNT,"Age")_$$S^LR7OS(33,CCNT,"AUTOPSY DATA")_$$S^LR7OS(53,CCNT,"Date/time of Autopsy"),^TMP("LRC",$J,GCNT,0)=OUT
 S X=^LR(LRDFN,"AU"),LRLLOC=$P(X,"^",8),DA=LRDFN
 D D^LRAUAW
 S Y=LR(63,12)
 D D^LRU,LN
 S ^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(XPOS,CCNT,($P(X,"^",6)_" "_Y))_$$S^LR7OS(26,CCNT,$J($P(X,"^",9),3))_$$S^LR7OS(33,CCNT,PNM)
 S Y=+X
 D D^LRU
 I Y'[1700 S ^(0)=^TMP("LRC",$J,GCNT,0)_$$S^LR7OS(53,CCNT,Y)
 D LN
 S ^TMP("LRC",$J,GCNT,0)=""
 F X(1)=7,10 D
 . S Y=$P(X,"^",X(1)),Y=$S(Y="":Y,$D(^VA(200,Y,0)):$P(^(0),"^"),1:Y)
 . I Y]"" S ^TMP("LRC",$J,GCNT,0)=^TMP("LRC",$J,GCNT,0)_$S(X(1)=7:$$S^LR7OS(1,CCNT,"Resident: ")_Y,1:$$S^LR7OS(38,CCNT,"Senior: ")_Y)
 Q
LRAPT3 ;COPIED FROM ^LRAPT3
 ;;
 N A,C,X,T,F
 S (F,A)=0
 F  S A=$O(^LR(LRDFN,"AY",A)) Q:'A  I $D(^(A,0)) S T=+^(0),T(1)=$P($G(^LAB(61,T,0)),"^"),C=0 F  S C=$O(^LR(LRDFN,"AY",A,5,C)) Q:'C  S X=^(C,0) D SP(X) S F=1
 Q:'$D(^XUSEC("LRLAB",DUZ))
 D LN
 S A=0
 F  S A=$O(^LR(LRDFN,80,A)) Q:'A  S X=+^(A,0),X=$G(^ICD9(X,0)) D LN S ^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(1,CCNT,"ICD code: "_$P(X,"^")) D
 . S X=$P(X,"^",3)
 . D:LRS(5) C^LRUA
 . S ^(0)=^TMP("LRC",$J,GCNT,0)_$$S^LR7OS(20,CCNT,X)
 Q
SP(NODE) ;
 N Y,E,X,A1,B
 S Y=$P(NODE,"^",2),E=$P(NODE,"^",3),X=$P(NODE,"^")_":",A1=$P($P(LRAU("S"),X,2),";",1)
 D D^LRU
 S T(2)=Y
 I 'F D LINE,LN S ^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(1,CCNT,T(1))
 D LN S ^TMP("LRC",$J,GCNT,0)=$$S^LR7OS(1,CCNT,A1_" "_E_" Date: "_T(2))
 D WRAP^LR7OSAP1("^LR("_LRDFN_",""AY"","_A_",5,"_C_",1)",80)
 Q
OUT ;Show output
 Q:'$D(^TMP("LRC",$J))
 N I
 S I=0
 F  S I=$O(^TMP("LRC",$J,I)) Q:'I  W !,^(I,0)
 Q
