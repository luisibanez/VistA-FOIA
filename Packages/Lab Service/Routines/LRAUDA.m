LRAUDA ;AVAMC/REG/WTY - AUTOPSY PATH DATA ENTRY ;9/25/00
 ;;5.2T9;LR;**72,248,1018**;Nov 17, 2004
 ;
L S LRDICS="AU" D ^LRAP Q
 ;
P ;autopsy protocol
 D L G:'$D(Y) END S DR="13;13.01///^S X=LRWHO;32.1;32.2;32.3;99",LRSOP="P",LR(6)=1 D ^LRAPDA,END Q
 ;
PAD ;provisional anatomic diagnoses
 D L G:'$D(Y) END S DR="13.01///^S X=LRWHO;32.2;32.3;14.9",LRSOP="P",LR(6)=1 D ^LRAPDA,END Q
 ;
S ;special studies
 D L G:'$D(Y) END S DR="32",DR(2,63.2)=".01;5" D ^LRAPDA,END Q
 ;
B ;autopsy report/SNOMED coding
 D L G:'$D(Y) END S LR(2)=1,DR="13;13.01///^S X=LRWHO;32.1;32.2;32.3;99;32",DR(2,63.2)=".01;I '$D(LR(1)) S Y=4;1;1.5;3;4"
 S DR(3,63.21)=".01",DR(3,63.22)=".01;I '$D(LR(1)) S Y=0;1",DR(3,63.24)=".01;S:'$P(^LAB(61.5,X,0),U,3) Y=0;.02",DR(4,63.23)=".01",LRSOP="B" D ^LRAPDA,END Q
 ;
A ;Autopsy report/ICD9CM coding
 D L G:'$D(Y) END S DR="13;13.01///^S X=LRWHO;32.1;32.2;32.3;99;80",LRSOP="A" D ^LRAPDA,END Q
 ;
R ;Autopsy supplementary report
 D L G:'$D(Y) END
 S LRSOP="R",LRSFLG="S"
 D ^LRAPDA,END
 K LRSFLG
 Q
 ;
I ;ICD9CM coding
 D L G:'$D(Y) END S DR=80,LRSOP="I" D ^LRAPDA,END Q
 ;
F ;Final anatomic dx date
 D L G:'$D(Y) END S DR="13.1;83.1;83.2" D ^LRAPDA,END Q
 ;
END D V^LRU Q
