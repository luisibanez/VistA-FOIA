LRMITRZ1 ;AVAMC/REG,SLC/BA- MICRO TREND SHEET CONTINUED ;4/10/89  11:28 ;
 ;;V~5.0~;LAB;;02/27/90 17:09
DQ ;dequeued from LRMITRZ
 K:$D(ZTSK) ^%ZTSK(ZTSK),ZTSK U IO K ^UTILITY($J),Z S (B,LRAO,LRSEQ)=0
 F I=0:0 S LRAO=$O(^LAB(62.06,"AO",LRAO)) Q:LRAO<.001  S J=$O(^LAB(62.06,"AO",LRAO,0)) I J>0,$D(^LAB(62.06,J,0)),$L($P(^(0),U,5)) S B=B+1,B(B)=J_U_$P(^(0),U,5) S LRBN=$P(^(0),U,2) I LRBN,$D(LRAP(LRBN)) S $P(B(B),U,3)=LRAP(LRBN)
 S O=B,B=0 F I=0:0 S B=$O(B(B)) Q:B=""  S LRZ=$P(B(B),U),LRZ(LRZ)=B
 I LRM("O")="N",LRM("S")="N",LRM("L")="N",LRM("D")="N",LRM("C")="N",LRM("P")="S" D MI,^LRMITRZ2 Q
 S LRDFN=0 F I=0:0 S LRDFN=$O(^LR(LRDFN)) Q:LRDFN<1  D MI
 D ^LRMITRZ2 W !
 Q
MI Q:'$D(^LR(LRDFN,0))  Q:$P(^LR(LRDFN,0),U,2)'=2  S LRIDT=LRTSAL F I=0:0 S LRIDT=$O(^LR(LRDFN,"MI",LRIDT)) Q:LRIDT=""!(($E(LRIDT,1,5)_"00")>LRATS)  D TYPE
 Q
TYPE Q:'$D(^LR(LRDFN,"MI",LRIDT,0))  S LRSSP=$S($L($P(^(0),U,5)):$P(^(0),U,5),1:"Unknown"),LRDOC=$S($L($P(^(0),U,7)):$P(^(0),U,7),1:"Unknown")
 S LRDAT=+^LR(LRDFN,"MI",LRIDT,0)
 I LRLOS S LROK=1 D LOS Q:'LROK
 S LRLLOC=$S($L($P(^LR(LRDFN,"MI",LRIDT,0),U,8)):$P(^(0),U,8),1:"Unknown"),LRCOL=$S($L($P(^(0),U,11)):$P(^(0),U,11),1:"Unknown")
 S LRPNM=$S($L($P(^LR(LRDFN,0),U,3)):$P(^LR(LRDFN,0),U,3),1:"Unknown")
 I LRDOC S X=LRDOC D DOC^LRX
 I LRSSP S LRSSP=$S($D(^LAB(61,LRSSP,0)):$P(^LAB(61,LRSSP,0),U),1:"Unknown")
 I LRPNM S LRPNM=$S($D(^DPT(LRPNM,0)):$P(^(0),U),1:"Unknown")
 I LRCOL S LRCOL=$S($D(^LAB(62,LRCOL,0)):$P(^(0),U),1:"Unknown")
 S LRSEQ=LRSEQ+1,^UTILITY($J,"M",LRDFN,"SSP",LRSSP,LRSEQ)="",^UTILITY($J,"M",LRDFN,"DOC",LRDOC,LRSEQ)="",^UTILITY($J,"M",LRDFN,"LOC",LRLLOC,LRSEQ)="",^UTILITY($J,"M",LRDFN,"PAT",LRPNM,LRSEQ)="",^UTILITY($J,"M",LRDFN,"COL",LRCOL,LRSEQ)=""
 Q:'$D(^LR(LRDFN,"MI",LRIDT,1))  Q:'+^(1)
 I $D(LRAP) D AP Q
 S LRBG=0 F I=0:0 S LRBG=$O(^LR(LRDFN,"MI",LRIDT,3,LRBG)) Q:LRBG=""  S LRBUG=+^LR(LRDFN,"MI",LRIDT,3,LRBG,0) D:'$D(LRSGL) NUM I $D(LRSGL) D:LRSGL=LRBUG NUM
 Q
AP S LRBG=0 F I=0:0 S LRBG=$O(^LR(LRDFN,"MI",LRIDT,3,LRBG)) Q:LRBG=""  S LROK=1 D APCHK I LROK S LRBUG=+^LR(LRDFN,"MI",LRIDT,3,LRBG,0) D:'$D(LRSGL) NUM I $D(LRSGL) D:LRSGL=LRBUG NUM
 Q
APCHK S LRBN=0 F I=0:0 S LRBN=$O(LRAP(LRBN)) Q:LRBN=""  S:'$D(^LR(LRDFN,"MI",LRIDT,3,LRBG,LRBN)) LROK=0 Q:'LROK  I $L(^(LRBN)) S LROK=$S($L($P(^(LRBN),U,2)):$P(^(LRBN),U,2)=LRAP(LRBN),1:$P(^(LRBN),U)=LRAP(LRBN)) Q
 Q
NUM S LRNUM=1 I $D(^UTILITY($J,LRSEQ,LRBUG,LRNUM)) F I=0:0 S I=$O(^UTILITY($J,LRSEQ,LRBUG,I)) Q:I=""  S LRNUM=I+1
 S S=2 F I=0:0 S S=$O(^LR(LRDFN,"MI",LRIDT,3,LRBG,S)) Q:S=""!(S'<3)  I $D(^LAB(62.06,"AI",S)) D AB
 Q
AB S P=+$E(S_"0",5,6)
 I P>0,$L($P(^LAB(62.06,"AI",S),U,2)) S R=^LR(LRDFN,"MI",LRIDT,3,LRBG,S) I $L($P(R,U)) D GETSENS Q:R=""  S LRAB=$P(^LAB(62.06,"AI",S),U),^UTILITY($J,LRSEQ,LRBUG,LRNUM,LRAB)=R
 Q
LOS S DFN=$S($P(^LR(LRDFN,0),U,2)=2:$P(^(0),U,3),1:"") Q:'DFN  S LRADMS=+$O(^DPT(DFN,"DA","AA",0)) S:LRADMS<1 LROK=0 Q:'LROK  S LRADMS=+$O(^(LRADMS,0)) S:LRADMS<1 LROK=0 Q:'LROK  S LRADMD=$P(^DPT(DFN,"DA",LRADMS,0),U)
 I $D(^DPT(DFN,"DA",LRADMS,1)) S LRDCHD=$P(^(1),U) I LRDCHD<LRDAT S LROK=0 Q
 ;S DFN=$S($P(^LR(LRDFN,0),"^",2)=2:$P(^(0),"^",3),1:"") Q:'DFN  S X=$O(^DGPM("APID",DFN,0)) I X S X=$O(^DGPM("APID",DFN,X,X)) I X,$D(^DGPM(X,0)),$P(^(0),"^",14) S X=$P(^(0),"^",14) S X=$S($D(^DGPM(X,0)):^(0),1:"") ;MAS
 ;S:'X LROK=0 Q:'X  S LRADMD=+X I $P(X,"^",17) S LRDCHD=$P(X,"^",17) I LRDCHD<LRDAT S LROK=0 Q ;MAS
 S X1=LRDAT,X2=LRADMD D ^%DTC I X<LRLOS S LROK=0
 Q
GETSENS ;Subroutine to set variable R to "S","R" or null sensitivity
 S R=$S($L($P(R,U,2)):$P(R,U,2),1:$P(R,U)) Q:R="R"
 I R["S" S R="S" Q
 I R="I" S R="R" Q
 S R=""
 Q
