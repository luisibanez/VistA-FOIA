AMQQCMPC ; IHS/CMI/THL - AUTO SEARCH TEMPLATE GENERATION FROM EN3^AMQQ ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;-----
RUN I AMQQEN31=+AMQQEN31 D DFN G EXIT
 D NAME
EXIT K Y,X,AMQQEN31,I,%
 Q
 ;
DOC F AMQQILIN=0:0 S AMQQILIN=$O(^UTILITY("AMQQ",$J,"LIST",AMQQILIN)) Q:'AMQQILIN  S AMQQLX=^(AMQQILIN) D PARSE
 S ^UTILITY("AMQQ",$J,"DOC",.0001)=" ---"
 S DIE="^DIBT("
 S DA=AMQQEN31
 I '$D(^DIBT(AMQQEN31,"%D",0)) S ^(0)="^^0^0^"
 F AMQQILIN=0:0 S AMQQILIN=$O(^UTILITY("AMQQ",$J,"DOC",AMQQILIN)) Q:'AMQQILIN  S DR="10///+"_^(AMQQILIN) D ^DIE
 K DIE,DA,DR,DIC
 Q
 ;
PARSE N Y,Z,%,I
 S Z=""
 F I=1:1 S Y=$P(AMQQLX,",",I) Q:$P(AMQQLX,",",I,99)=""  D TRANS I Y'="" S Z=Z_Y
 S ^UTILITY("AMQQ",$J,"DOC",AMQQILIN)=Z
 Q
 ;
TRANS I $E(Y)="@" S Y="" Q
 I Y?1"W ?"1.N S %=+$P(Y,"?",2),Y="",$P(Y," ",%-1)="" Q
 S Y=$TR(Y,"""","")
 I Y["   [SER" S Y=$P(Y,"   [SER")
 Q
 ;
DFN S AMQQDIBT=AMQQEN31+.1
 D MSG
 X AMQV(0)
 S AMQQEN3=AMQQTOT
 D DOC
 K ^DIBT(AMQQEN31,1)
 F %=0:0 S %=$O(^DIBT(AMQQDIBT,1,%)) Q:'%  S ^DIBT(AMQQEN31,1,%)=""
 K ^DIBT(AMQQDIBT,1)
 S ^DIBT(AMQQEN31,1,0)=AMQQEN3
 Q
 ;
NAME F  Q:'$D(^DIBT("B",AMQQEN31))  S DA=$O(^(AMQQEN31,"")),DIK="^DIBT(" D ^DIK K DIC,DIK,DA
 S X=AMQQEN31
 S DIC="^DIBT("
 S DIC(0)="L"
 S DIADD=1
 S DIC("DR")="2////"_DT_";3////"_DUZ(0)_";4////9000001;5////"_DUZ
 D FILE^DICN
 K DIC,DIADD
 I Y=-1 S AMQQQUIT="" Q
 S (AMQQEN31,AMQQDIBT)=+Y
 D MSG
 X AMQV(0)
 S ^DIBT(AMQQEN31,1,0)=AMQQTOT
 S AMQQEN3=AMQQEN31
 D DOC
 Q
 ;
MSG W !!,"I am about to conduct a search and save the results.",!
 W "Please be patient...",!!!
 H 3
 Q
 ;
