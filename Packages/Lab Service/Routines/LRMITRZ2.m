LRMITRZ2 ;AVAMC/REG,SLC/BA- MICRO TREND SHEET CONTINUED ; 2/19/87  8:14 AM ;
 ;;V~5.0~;LAB;;02/27/90 17:09
 ;from LRMITRZ1
XREF S LRDFN=0 F LRPAT=0:1 S LRDFN=$O(^UTILITY($J,"M",LRDFN)) Q:LRDFN=""!(LRDFN<1)  D CHECK
 S ^UTILITY($J,0)=LRPAT_U_"PATIENTS"
 F X=0:0 S X=$O(^UTILITY($J,"BG",X)) Q:X=""  S LRND=^LAB(61.2,X,0),^UTILITY($J,"B",$S($L($P(LRND,U,3)):$P(LRND,U,3),1:" ")_$E($P(LRND,U),1,28),X)=""
 D ^LRMITRZ3
 Q
CHECK S LRTYPE="SSP",LRBA="BAS" D TYPE
 I LRM("L")'="N" S LRTYPE="LOC",LRBA="BAL" D TYPE
 I LRM("D")'="N" S LRTYPE="DOC",LRBA="BAD" D TYPE
 I LRM("P")'="N" S LRTYPE="PAT",LRBA="BAP" D TYPE
 I LRM("C")'="N" S LRTYPE="COL",LRBA="BAC" D TYPE
 Q
TYPE S LRST=0 F I=0:0 S LRST=$O(^UTILITY($J,"M",LRDFN,LRTYPE,LRST)) Q:LRST=""  D SEQ
 Q
SEQ S LRT=$E(LRTYPE,1)_"T" S:'$D(^UTILITY($J,LRT,LRST)) ^UTILITY($J,LRT,LRST)=0 S ^UTILITY($J,LRT,LRST)=^UTILITY($J,LRT,LRST)+1
 S LRSEQ=0 F I=0:0 S LRSEQ=$O(^UTILITY($J,"M",LRDFN,LRTYPE,LRST,LRSEQ)) Q:LRSEQ=""  D BG
 Q
BG S LRBG=0 F I=0:0 S LRBG=$O(^UTILITY($J,LRSEQ,LRBG)) Q:LRBG=""  S:'$D(^UTILITY($J,"BG",LRBG)) ^(LRBG)=0 S LRT=$E(LRTYPE,1)_"TB" S:'$D(^UTILITY($J,LRT,LRST,LRBG)) ^(LRBG)=0 D NUM
 Q
NUM S LRNUM=0 F I=0:0 S LRNUM=$O(^UTILITY($J,LRSEQ,LRBG,LRNUM)) Q:LRNUM=""  S:LRTYPE="SSP" ^UTILITY($J,"BG",LRBG)=^UTILITY($J,"BG",LRBG)+1 S LRT=$E(LRTYPE,1)_"TB",^UTILITY($J,LRT,LRST,LRBG)=^UTILITY($J,LRT,LRST,LRBG)+1 D AB
 Q
AB S LRND=0 F I=0:0 S LRND=$O(^UTILITY($J,LRSEQ,LRBG,LRNUM,LRND)) Q:LRND=""  S C=1,LRYY=$P(^(LRND),U),S=$S(LRYY="S":1,1:0) S:'$D(^UTILITY($J,LRBA,LRBG,LRND)) ^(LRND)=0 S LRT=$E(LRTYPE,1)_"BA" D S
 Q
S S:'$D(^UTILITY($J,LRT,LRST,LRBG,LRND)) ^(LRND)=0 S LRNO=^UTILITY($J,LRBA,LRBG,LRND),^UTILITY($J,LRBA,LRBG,LRND)=+LRNO+C_U_($P(LRNO,U,2)+S)
 S LRNO=^UTILITY($J,LRT,LRST,LRBG,LRND),^UTILITY($J,LRT,LRST,LRBG,LRND)=+LRNO+C_U_($P(LRNO,U,2)+S)
 Q
