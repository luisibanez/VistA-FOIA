PRSATE0 ; HISC/REL-Edit Variable Tours ;5/30/95  14:37
 ;;4.0;PAID;;Sep 21, 1995
 S TOLD="" F K=1:1:14 S Z=$P($G(^PRST(458,PPI,"E",DFN,"D",K,0)),"^",2),$P(TOLD,"^",K)=Z I SRT="N",$P($G(^(0)),"^",3) S $P(TOLD,"^",K)=$P(^(0),"^",4)
 S ^PRST(458,PPI,"E",DFN,"T")=TOLD D DT^PRSATE2
 K DDSFILE,DA,DR,PRSAERR S DDSFILE=458,DDSFILE(1)=458.01,DA(1)=PPI,DA=DFN
 S DR="[PRSA TE EDIT]" D ^DDS K DS Q:$D(PRSAERR)
 S TNEW=$G(^PRST(458,PPI,"E",DFN,"T")) K ^PRST(458,PPI,"E",DFN,"T")
 I '$D(^PRST(458,PPI,"E",DFN,"D",0)) S ^(0)="^458.02^14^14"
 F DAY=1:1:14 S TD=$P(TNEW,"^",DAY) I TD>0 D S1
 Q
S1 ; Set Tour if necessary
 I TD=$P(TOLD,"^",DAY),$G(^PRST(457.1,+TD,1))=$G(^PRST(457.1,+$P(TOLD,"^",DAY),1)) Q
 I SRT'="N" S Y=$G(^PRST(457.1,TD,1)),TDH=$P(^(0),"^",6) D SET^PRSATE Q
 D NX^PRSATE Q
VS ; Validate tour segments
 S TRG=0 F K=1:3:19 Q:$P(Y,"^",K)=""  S Z=$P(Y,"^",K+2) S:'Z TRG=1 I Z D
 .S Z=$P($G(^PRST(457.2,Z,0)),"^",2) I Z="RG" S TRG=1 Q
 .I ZENT'[Z S STR="Tour Indicator contains type of time to which employee is not entitled."
 .Q
 Q
VAL ; Validate Tour
 S (ZENT,STR)="" K PRSAERR D OT^PRSATP
 S (HRS,TRS)=0 F DAY=1:1:14 S TD=$$GET^DDSVAL(DIE,.DA,DAY+200) S Z=$P($G(^PRST(457.1,+TD,0)),"^",6) S:Z HRS=HRS+Z S Y=$G(^(1)) D VS S:TRG TRS=TRS+1 I STR'="" G V1
 I FLX="C",TRS>9 S STR="Warning: Compressed Schedule has more than 9 Tours!" D HLP^DDSUTL(.STR)
 I NH'=HRS,NH'=112 S STR="Warning: Normal Hours are "_NH_"; Tour Hours are "_HRS D HLP^DDSUTL(.STR)
 Q
V1 S (DDSERROR,PRSAERR)=1 D HLP^DDSUTL(.STR) Q
