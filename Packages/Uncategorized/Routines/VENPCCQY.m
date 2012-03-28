VENPCCQY ; IHS/OIT/GIS - PRE INSTALL ;
 ;;2.6;PCC+;;NOV 12, 2007
 ;
 ;
 ;
 N GBL,DIC,DIE,DA,DR,DLAYGO,X,Y,Z,%,DIEN,MIEN,WIEN,AMPIEN,PSIEN,VIEN,TPL,DESC,ALLOWED,CDT,RTN,TAG
EF ; PCC+ EF TEMPLATE
 I $D(^VEN(7.41,"B","WELL CHILD EXAM (NATL)")) G IT
 S DIC="^VEN(7.41,",DIC(0)="L",DLAYGO=19707.41,X="WELL CHILD EXAM (NATL)"
 D ^DIC I Y=-1 G IT
 S %=$NA(^VEN(7.41,+Y))
 S @%@(0)="WELL CHILD EXAM (NATL)^25^wcm^^^^^^^^^0^^0^0^^^^^"
 S @%@(1)="20^50"
 S @%@(2)="^^^15^^75^0^0^0^^0^0^0"
 S @%@(5)="1^0^0^^^^^^^^^^^^0^27^^^^^0"
 S @%@(14)="30^30^40^^0^^0"
 S @%@(15)="60^0"
 S @%@(16,0)="^19707.4116P^^0"
 S @%@(19,0)="^19707.4119P^4^4"
 S @%@(19,1,0)="5^20"
 S @%@(19,2,0)="8^10"
 S @%@(19,3,0)="7^40"
 S @%@(19,4,0)="6^30"
 S @%@(19,"B",5,1)=""
 S @%@(19,"B",6,4)=""
 S @%@(19,"B",7,3)=""
 S @%@(19,"B",8,2)=""
IT ; INPUT TEMPLATE
 I $D(^DIE("B","APCD WC (ADD)")) G MN
 F X="APCD WC (ADD)","APCD WC (MOD)" D IT1
MN ; DATA ENTRY MNEMONIC
 I $D(^APCDTKW("B","WCE")) G HS
 S DIC="^APCDTKW(",DIC(0)="L",DLAYGO=9001001,X="WCE"
 D ^DIC I Y=-1 G HS
 S VIEN=9000010,TPL="[APCD WC]",DESC="WELL CHILD EXAM",ALLOWED="ALLOWED"
 S DA=+Y,DIE=DIC,DR=".03////^S X=VIEN;.04////^S X=TPL;.06////^S X=DESC;.07///^S X=ALLOWED;.08////^S X=1"
 L +^APCDTKW(DA):1 I  D ^DIE L -^APCDTKW(DA)
 S %=$NA(^APCDTKW(DA,21))
 S @%@(0)="^^1^1^3050930^",@%@(1,0)="For streamlined, comprehensive well child exam data entry"
HS ; ADD NEW HEALTH SUMMARY COMPONENTS
MT ; MEASUREMENT TYPE
 I $D(^AUTTMSR("B","ASQL")) G MP
 N ALIEN,AGIEN,AFIEN,APIEN,ASIEN,AIEN,ASQN,ASQD,AAIEN
 S Z="ASQL;62;ASQ - LANGUAGE^ASQG;61;ASQ - GROSS MOTOR^"
 S Z=Z_"ASQF;60;ASQ - FINE MOTOR^ASQP;64;ASQ - PROBLEM SOLVING^ASQS;63;ASQ - SOCIAL^"
 S Z=Z_"ASQM;66;ASQ QUESTIONNAIRE (MOS)^ASQA;65;ASQ - AUTISM SCREEN"
 S (DIC,DIE,DLAYGO)=9999999.07,DIC(0)="L",DR=".02////^S X=ASQD;.03////^S X=ASQN"
 F PCE=1:1:$L(Z,U) D
 . S Y=$P(Z,U,PCE),X=$P(Y,";"),ASQN=$P(Y,";",2),ASQD=$P(Y,";",3)
 . D ^DIC I Y=-1 Q
 . S DA=+Y
 . L +^AUTTMSR(DA):1 I  D ^DIE L -AUTTMSR(DA)
 . Q
MP ; MEASUREMENT PANEL
 S AMPIEN=$O(^APCHSMPN("B","ASQ DEVELOPMENT SCORES",0)) I AMPIEN G CMP
 S DIC="^APCHSMPN(",DIC(0)="L",DLAYGO=9001017,X="ASQ DEVELOPMENT SCORES"
 D ^DIC I Y=-1 Q
 S (AMPIEN,DA)=+Y,GBL=$NA(^APCHSMPN(DA,1)) K @GBL
 S @GBL@(0)="^9001017.01AI^5^6"
 F X="5^30^3^ASQ","10^26^13^COMMUNICATION","20^25^11^GROSS MOTOR","30^24^10^FINE MOTOR","40^28^10^PROB SOLV","50^27^10^PERS-SOCIAL" S @GBL@(+X,0)=X
CMP ; WELL CHILD COMPONENT
 I $D(^APCHSCMP("B","WELL CHILD EXAM")) G TYPE
 S DIC="^APCHSCMP(",DIC(0)="L",DLAYGO=9001016,X="WELL CHILD EXAM" D ^DIC I Y=-1 Q
 S DIE=DIC,(WIEN,DA)=+Y,DR="1////^S X=TAG;2///NO",TAG="WCE;APCHS6B"
 L +^APCHSCMP(DA):1 I  D ^DIE L -^APCHSCMP(DA)
TYPE ; HEALTH SUMMARY TYPE
 I $D(^APCHSCTL("B","WELL CHILD EXAM")) G XRT
 S MIEN=$O(^APCHSCMP("B","MEASUREMENT PANELS",0)) I 'MIEN Q
 S DIEN=$O(^APCHSCMP("B","DEMOGRAPHIC DATA",0)) I 'DIEN Q
 S WIEN=$O(^APCHSCMP("B","WELL CHILD EXAM",0)) I 'WIEN Q
 S PSIEN=$O(^APCHSMPN("B","PEDIATRIC STD",0)) I 'PSIEN Q
 S DIC="^APCHSCTL(",DIC(0)="L",DLAYGO=9001015,X="WELL CHILD EXAM"
 D ^DIC I Y=-1 Q
 S DA=+Y,GBL=$NA(^APCHSCTL(DA)) F %=1,2,3 K @GBL@(%)
 S @GBL@(1,0)="^9001015.01IA^30^3"
 S @GBL@(1,5,0)="5^"_DIEN
 S @GBL@(1,20,0)="20^"_MIEN_"^5^2Y"
 S @GBL@(1,30,0)="30^"_WIEN
 S @GBL@(1,"B",5,5)=""
 S @GBL@(1,"B",20,20)=""
 S @GBL@(1,"B",30,30)=""
 S @GBL@(2)="^Y"
 S @GBL@(3,0)="^9001015.02IA^2^2"
 S @GBL@(3,1,0)="1^"_PSIEN
 I $G(AMPIEN) S @GBL@(3,2,0)="2^"_AMPIEN
 S @GBL@(3,"AB",1,1)=""
 I $G(AMPIEN) S @GBL@(3,"AB",2,2)=""
XRT ; MAKE SURE EXTERNAL ROUTINES ARE PRESENT
 N ZL,ZR,ZS,X
 S ZL=$C(90,76,32),ZS=$C(90,83,32),ZR=$C(90,82,32)
 I '$L($T(WCE^APCHS6B)) S X=ZL_"VENPCCQA "_ZR_"VENPCCQA+1 "_ZR_"VENPCCQA "_ZS_"APCHS6B "_ZL_"VENPCCQY" X X
 I '$L($T(DATA^APCDTWC)) S X=ZL_"VENPCCQB "_ZR_"VENPCCQB+1 "_ZR_"VENPCCQB "_ZS_"APCDTWC "_ZL_"VENPCCQY" X X
 I '$L($T(VWC^APCDTWC1)) S X=ZL_"VENPCCQC "_ZR_"VENPCCQC+1 "_ZR_"VENPCCQC "_ZS_"APCDTWC1 "_ZL_"VENPCCQY" X X
 I '$L($T(EXAM^APCDTWC2)) S X=ZL_"VENPCCQD "_ZR_"VENPCCQD+1 "_ZR_"VENPCCQD "_ZS_"APCDTWC2 "_ZL_"VENPCCQY" X X
 W !!?5,"**** PRE-INIT PROCEDURES HAVE BEEN SUCCESSFULLY COMPLETED ****",!! H 2
 Q
 ;
IT1 S DIC="^DIE(",DIC(0)="L",DLAYGO=.402
 D ^DIC I Y=-1 G MN
 S %=$NA(^DIE(+Y))
 S $P(@%@(0),U,2)=3061010
 S $P(@%@(0),U,4)=9000010
 S @%@("%D",0)="^^1^1^3051227^^^"
 S @%@("%D",1,0)="Well child exam comprehensive data entry"
 S @%@("ROU")="^APCDTWC"
 Q
 ; 
