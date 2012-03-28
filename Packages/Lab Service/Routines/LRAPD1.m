LRAPD1 ;AVAMC/REG/WTY - AP DATA ENTRY ;9/25/00
 ;;5.2T9;LR;**41,91,248,1018**;Nov 17, 2004
 ;
SP ;gross desc/clinical hx, surg path
 S LRSOP="G",DR=".09///^S X=LRWHO;.012;.013;.014;.015;.016;.021//^S X=LR(""TR"");1;S:'LR(""FS"") Y=0;1.3",LR(6)=1,DR(2,63.812)=.01 D ^LRAPDA,END Q
MSP ;micro description/gross review, surg path
 S LRSOP="M",DR=".09///^S X=LRWHO;S:'LR(""FS"") Y=1;1.3;1;1.1;S:'LR(""DX"") Y=.02;1.4;.02;.03;S:'LRV Y=0;.14",(LR(7),LR(6))=1 D ^LRAPDA,END Q
BSP ;micro description/SNOMED coding
 S LRSOP="B",(LR(2),LR(7),LR(6))=1,DR=".09///^S X=LRWHO;S:'LR(""FS"") Y=1;1.3;1;1.1;S:'LR(""DX"") Y=.02;1.4;.02;.03;S:'LRV Y=10;.14;10"
 S DR(2,63.12)=".01;D T^LRAPD;S:'LR(8) Y=4;2;4;I '$D(LR(1)) S Y=0;1;1.5;3",DR(3,63.16)=".01;I '$D(LR(1)) S Y=0;1",DR(3,63.82)=".01;D R^LRAPD;.02" D ^LRAPDA,END Q
ASP ;micro description/ICD9CM coding
 S LRSOP="A",(LR(7),LR(6))=1,DR=".09///^S X=LRWHO;S:'LR(""FS"") Y=1;1.3;1;1.1;S:'LR(""DX"") Y=.02;1.4;.02;.03;S:'LRV Y=80;.14;80" D ^LRAPDA,END Q
SSP ;supplementary report
 S (LRSOP,LRSFLG)="S",DR=".09///^S X=LRWHO;.03;10"
 S (LR(2),LR(7),LR(6))=1
 S DR(2,63.12)=".01;D T^LRAPD;S:'LR(8) Y=4;2;4;I '$D(LR(1)) "
 S DR(2,63.12)=DR(2,63.12)_"S Y=0;1;1.5;3"
 S DR(3,63.16)=".01;I '$D(LR(1)) S Y=0;1"
 S DR(3,63.82)=".01;D R^LRAPD;.02"
 D ^LRAPDA,END
 K LRSFLG
 Q
PSP ;special studies
 S LRSOP="P",DR=".03;10",DR(2,63.12)="5;1.5",DR(3,63.82)=".01;D R^LRAPD;.02",LR(7)=1 D AK^LRAPDA,END Q
CY ;gross desc/clinic hx, cytopath
 S LRSOP="G",DR=".09///^S X=LRWHO;.012;.013;.014;.015;.016;.021//^S X=LR(""TR"");1",LR(6)=1,DR(2,63.902)=".01;.02" D ^LRAPDA,END Q
MCY ;micro desc/gross review, cytopath
 S LRSOP="M",DR=".09///^S X=LRWHO;1;1.1;S:'LR(""DX"") Y=.021;1.4;.021//^S X=LR(""TR"");.02;.03;.101;S:'LRV Y=0;.14",(LR(7),LR(6))=1 D ^LRAPDA,END Q
BCY ;micro desc/SNOMED coding, cytopath
 S LRSOP="B",DIC(0)="M",(LR(2),LR(7),LR(6))=1,DR=".09///^S X=LRWHO;1;1.1;S:'LR(""DX"") Y=.021;1.4;.021//^S X=LR(""TR"");.02;.03;.101;S:'LRV Y=10;.14;10"
 S DR(2,63.912)=".01;D T^LRAPD;S:'LR(8) Y=4;2;4;I '$D(LR(1)) S Y=0;1;1.5;3",DR(3,63.916)=".01;I '$D(LR(1)) S Y=0;1" S DR(3,63.982)=".01;D R^LRAPD;.02" D ^LRAPDA,END Q
ACY ;micro desc/ICD9CM coding
 S (LR(7),LR(6))=1,DR=".09///^S X=LRWHO;1;1.1;S:'LR(""DX"") Y=.021;1.4;.021//^S X=LR(""TR"");.02;.03;.101;S:'LRV Y=80;.14;80" D ^LRAPDA,END Q
SCY ;supplementary report
 S LRSFLG="S"
 S DR=".09///^S X=LRWHO;.03;10"
 S (LR(2),LR(7),LR(6))=1
 S DR(2,63.912)=".01;D T^LRAPD;S:'LR(8) Y=4;2;4;I '$D(LR(1)) "
 S DR(2,63.912)=DR(2,63.912)_"S Y=0;1;1.5;3"
 S DR(3,63.916)=".01;I '$D(LR(1)) S Y=0;1"
 S DR(3,63.982)=".01;D R^LRAPD;.02"
 D ^LRAPDA,END
 K LRSFLG
 Q
PCY ;special studies
 S DR=".03;10",DR(2,63.912)="5;1.5",DR(3,63.982)=".01;D R^LRAPD;.02",LR(7)=1 D AK^LRAPDA,END Q
EM ;gross desc/clinical hx, EM
 S LRSOP="G",DR=".09///^S X=LRWHO;.012;.013;.014;.015;.016;.021//^S X=LR(""TR"");1",LR(6)=1,DR(2,63.202)=.01 D ^LRAPDA,END Q
MEM ;micro desc/gross review, EM
 S LRSOP="M",DR=".09///^S X=LRWHO;1;1.1;S:'LR(""DX"") Y=.021;1.4;.021//^S X=LR(""TR"");.02;.03;S:'LRV Y=0;.14",(LR(7),LR(6))=1 D ^LRAPDA,END Q
BEM ;micro desc/SNOMED coding
 S LRSOP="B",(LR(2),LR(7),LR(6))=1,DR=".09///^S X=LRWHO;1;1.1;S:'LR(""DX"") Y=.021;1.4;.021//^S X=LR(""TR"");.02;.03;S:'LRV Y=10;.14;10"
 S DR(2,63.212)=".01;D T^LRAPD;S:'LR(8) Y=4;2;4;I '$D(LR(1)) S Y=0;1;1.5;3",DR(3,63.216)=".01;I '$D(LR(1)) S Y=0;1",DR(3,63.282)=".01;D R^LRAPD;.02" D ^LRAPDA,END Q
AEM ;micro desc/ICD9CM coding
 S (LR(7),LR(6))=1,DR=".09///^S X=LRWHO;1;1.1;S:'LR(""DX"") Y=.021;1.4;.021//^S X=LR(""TR"");.02;.03;S:'LRV Y=80;.14;80" D ^LRAPDA,END Q
SEM ;supplementary report
 S LRSFLG="S"
 S DR=".09///^S X=LRWHO;.03;10"
 S (LR(2),LR(7),LR(6))=1
 S DR(2,63.212)=".01;D T^LRAPD;S:'LR(8) Y=4;2;4;I '$D(LR(1)) "
 S DR(2,63.212)=DR(2,63.212)_"S Y=0;1;1.5;3"
 S DR(3,63.216)=".01;I '$D(LR(1)) S Y=0;1"
 S DR(3,63.282)=".01;D R^LRAPD;.02"
 D ^LRAPDA,END
 K LRSFLG
 Q
PEM ;special studies
P S DR=".03;10",DR(2,63.212)=5,LR(7)=1 D AK^LRAPDA,END Q
 ;
END D V^LRU Q
