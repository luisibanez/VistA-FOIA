LRAPX ; IHS/DIR/AAB - AP CODING 8/13/95 16:57 ;
 ;;5.2;LR;**1002**;JUN 01, 1998
 ;;5.2;LAB SERVICE;**72**;Sep 27, 1994
 D ^LRAP G:'$D(Y) END D @LRSS,END Q
SP ;SNOMED coding, surg path
 S LR(2)=1,DR=".03;10",DR(2,63.12)=".01;S LR(8)=$P(^LAB(61,X,0),U,4);S:'LR(8) Y=4;2;4;I '$D(LR(1)) S Y=0;1;1.5;3",DR(3,63.16)=".01;I '$D(LR(1)) S Y=0;1",DR(3,63.82)=".01;S:'$P(^LAB(61.5,X,0),U,3) Y=0;.02" D ^LRAPDA,END Q
CY ;SNOMED coding, cytopath
 S LR(2)=1,DR=".03;10",DR(2,63.912)=".01;S LR(8)=$P(^LAB(61,X,0),U,4);S:'LR(8) Y=4;2;4;I '$D(LR(1)) S Y=0;1;1.5;3",DR(3,63.916)=".01;I '$D(LR(1)) S Y=0;1",DR(3,63.982)=".01;S:'$P(^LAB(61.5,X,0),U,3) Y=0;.02" D ^LRAPDA,END Q
 Q
EM ;SNOMED coding, EM
 S LR(2)=1,DR=".03;10",DR(2,63.212)=".01;S LR(8)=$P(^LAB(61,X,0),U,4);S:'LR(8) Y=4;2;4;I '$D(LR(1)) S Y=0;1;1.5;3",DR(3,63.216)=".01;I '$D(LR(1)) S Y=0;1",DR(3,63.282)=".01;S:'$P(^LAB(61.5,X,0),U,3) Y=0;.02" D ^LRAPDA,END Q
AU ;SNOMED coding, autopsy
 S LR(2)=1,DR="13;13.01///^S X=LRWHO;32",DR(2,63.2)=".01;I '$D(LR(1)) S Y=4;1;1.5;3;4",DR(3,63.21)=".01",DR(3,63.22)=".01;I '$D(LR(1)) S Y=0;1",DR(3,63.24)=".01;S:'$P(^LAB(61.5,X,0),U,3) Y=0;.02",DR(4,63.23)=".01" D ^LRAPDA,END Q
 ;
ISP ;ICD9CM coding, surg path
 S DR=".03;80" D ^LRAPDA,END Q
 ;
ICY ;ICD9CM coding, cytopath
 S DR=".03;80" D ^LRAPDA,END Q
 ;
IEM ;ICD9CM coding, EM
 S DR=".03;80" D ^LRAPDA,END Q
 ;
IAU ;ICD9CM coding, autopsy
 S DR=80 D ^LRAPDA,END Q
 ;
EN ;entry point for ICD9CM coding
 D ^LRAP G:'$D(Y) END D @("I"_LRSS),END Q
 ;
END D V^LRU Q
