VENPCCK ; IHS/OIT/GIS - KNOWLEDGE BASE ;
 ;;2.6;PCC+;**1,3**;MAR 23, 2011
 ;
 ;
 ;
 ;
FETCH(DEFEF,DFN) ; EP-RETURN KNOWLEDGEBASE DATA
 I '$D(^DPT(+$G(DFN),0)) Q
 N KCIEN,IFLG,KIEN,HDR,IEN,STG,K,AGE,SEX,AGEFLAG,SEXFLAG,LAGFLAG,GESTFLAG,START,STOP,TMP,IX
 N CNT,TITLE,MOD,TOT,ARR,CAT,TIEN,DOM,ORD,KC,DORD,DIEN,%,LASTCNT,PECODE,AGEGRP
 S TMP=$NA(^TMP("VEN PRNT",$J,1))
 ; THERE ARE 2 POSSIBLE DRIVERS TO COLLECT KB ITEMS: LEGACY AND NEW.  THE DEFAULT DRIVER IS THE NEW ONE.
 I '$O(^VEN(7.41,DEFEF,19,0)) G LEGACY ; IF THE DOMAIN MULTIPLE DOES NOT EXIST, USE THE LEGACY DRIVER
NEW S DIEN=0 ; NEW GUIDELINES DRIVER
 F  S DIEN=$O(^VEN(7.41,DEFEF,19,DIEN)) Q:'DIEN  D  ; DOMAIN CONTEXT DRIVER (PREFERRED IF IT EXISTS)
 . S %=$G(^VEN(7.41,DEFEF,19,DIEN,0))
 . S DOM=+% I 'DOM Q
 . I '$P($G(^VEN(7.13,DOM,0)),U,7) Q  ; DOMAIN MUST BE ACTIVE
 . I $P($G(^VEN(7.13,DOM,0)),U)["NATL AG" Q  ; NEW DRIVER EXCLUDES PT ED GUIDELINES.  THESE ARE HANDLED SEPARATELY
 . S DORD=$P(%,U,2) I 'DORD S DORD=DIEN+100 ; EVERY DOMAIN MUST HAVE AN ORDER OR ONE WILL BE ASSIGNED
 . S KC=0
 . F  S KC=$O(^VEN(7.13,DOM,1,KC)) Q:'KC  D  ; CREATE THE ORDINAL ARRAY.
 .. S %=$G(^VEN(7.13,DOM,1,KC,0))
 .. S KCIEN=+% I 'KCIEN Q
 .. S ORD=$P(%,U,2)
 .. I 'ORD S ORD=100+KC ; MAKE SURE EVERY CAT HAS AN ORDER - EVEN IF ONE IS NOT OFFICIALLY ASSIGNED
 .. S ORD(DORD,ORD)=KCIEN
 .. Q
 . Q
 S DORD=0,CNT=0
SET F  S DORD=$O(ORD(DORD)) Q:'DORD  D
 . S ORD=0 F  S ORD=$O(ORD(DORD,ORD)) Q:'ORD  D  I CNT>99 Q
 .. S KCIEN=ORD(DORD,ORD)
 .. I 'KCIEN Q
 .. S LASTCNT=CNT
 .. D GETKBI(KCIEN,.CNT) ; TRAVERSE THE ARRAY TO RETRIEVE CATS
 .. Q
 . I LASTCNT'=CNT S CNT=CNT+1 S @TMP@("k"_CNT)="." ; PUT A SPACER LINE BETWEEN DOMAINS
 . Q
 Q
 ; 
LEGACY ; EP-IF THE DOMAIN CONTEXT IS NOT DEFINED, USE THE LEGACY DRIVER BEASED ON THE KB MULTIPLE IN THE TEMPLATE FILE
 ; FOR BACKWARD COMPATIBILITY ONLY.  THIS WILL BE PHASED OUT
 I '$O(^VEN(7.41,+$G(DEFEF),16,0)) Q  ; IF THERE ARE NO KB ITEMS ASOCIATED WITH THE CURRENT FORM QUIT
 N CNT,TIEN,KCIEN,CNT
 S TIEN=0,CNT=0
 F  S TIEN=$O(^VEN(7.41,DEFEF,16,TIEN)) Q:'TIEN  D  I CNT>99 Q  ; LEGACY DRIVER FROM VER 2.5
 . S KCIEN=$G(^VEN(7.41,+$G(DEFEF),16,TIEN,0))
 . I 'KCIEN Q
 . D GETKBI(KCIEN,.CNT) ; GET INFO ABOUT KNOWLEDGE CATEGORY
 . Q
 Q
 ; 
GETKBI(KCIEN,CNT) ; EP - GET KB ITEMS FROM A SPECIFIC CATEGORY
 N AGE
 S K=$G(^VEN(7.11,KCIEN,0)) I '$L(K) Q
 S CAT=$P(K,U) I '$L(CAT) Q
 S HDR=$P(K,U,9)
 S CNT=CNT+1 I CNT>100 Q
 S AGEFLAG=$P(K,U,5) ; SCREEN BY AGE
 I AGEFLAG S AGE=$$DAYS(DFN) I 'AGE Q
 S GESTFLAG=$P(K,U,6) ; SCREEN BY WKS GESTATION
 S LAGFLAG=$P(K,U,7) ; SCREEN BY TIME SINCE LAST
 S SEXFLAG=$P(K,U,8) ; SCREEN BY SEX
 I SEXFLAG S SEX=$P($G(^DPT(+$G(DFN),0)),U,2) I '$L(SEX) Q
 I $G(AGE) S PECODE=$P(K,U,13) I $L(PECODE) D
 . S Z=AGE,AGEGRP=$S(Z<62:"N",Z<366:"I",Z<1096:"T",Z<1827:"P",Z<4384:"S",Z<7686:"A",1:"")
 . I '$L(AGEGRP) Q
 . S HDR=HDR_"  ("_PECODE_"-"_AGEGRP_")"
 . Q
 S @TMP@("k"_CNT)=HDR ; SET THE HEADER NODE FOR THIS SET OF ITEMS
 S KIEN=0,TOT=0 K ARR
 F  S KIEN=$O(^VEN(7.12,"B",KCIEN,KIEN)) Q:'KIEN  D  I CNT>99 Q  ; CHECK EA. ENTRY IN THE KNOWLEDGE CATEGORY
 . S STG=$G(^VEN(7.12,KIEN,0)) I '$L(STG) Q
 . I $P(STG,U,11) Q  ; INACTIVE ITEM !!!
 . I AGEFLAG S START=$P(STG,U,5) I AGE<START Q
 . I AGEFLAG S STOP=$P(STG,U,6) I AGE>STOP Q
 . I SEXFLAG S %=$P(STG,U,10) I $L(%),%'=SEX Q
 . S TITLE=$P(STG,U,2) I '$L(TITLE) Q
 . I CAT["WCAG "!(CAT["WCEX ") D LAST(KCIEN,KIEN,DFN,.TITLE) ; FOR PT ED, APPEND LAST PT ED RESULTS TO TITLE
 . S MOD=$P(STG,U,12)
 . I $L(MOD) S TITLE=TITLE_" ("_MOD_")"
 . I MOD,($P($G(^VEN(7.12,KIEN,0)),U,16)!(CAT["WELL CHILD DEVEL")!(CAT["WCDA ")) D  Q
 .. S TOT=TOT+1
 .. S ARR(MOD,TOT)="__ "_TITLE
 .. S ARR(MOD,TOT,"IX")=KIEN
 .. Q
 . ; NO SECONDARY SORT REQUIRED
 . S CNT=CNT+1,TOT=TOT+1
 . S @TMP@("k"_CNT)="__ "_TITLE ; SET THE ITEM NODE
 . S @TMP@("k"_CNT,"IX")=KIEN ; ITEM IEN X-REF
 . Q
NOITEMS I 'TOT K @TMP@("k"_CNT) S CNT=CNT-1 Q  ; NO ITEMS FOUND IN THIS CATEGORY, SO DELETE IT
 I $D(ARR) D  ; SORT BY %ILE
 . S MOD=999
 . F  S MOD=$O(ARR(MOD),-1) Q:'MOD  S TOT=0 F  S TOT=$O(ARR(MOD,TOT)) Q:'TOT  D  I CNT>99 Q
 .. S CNT=CNT+1
 .. S @TMP@("k"_CNT)=ARR(MOD,TOT)
 .. S @TMP@("k"_CNT,"IX")=ARR(MOD,TOT,"IX")
 .. Q
 . K ARR
 . Q
KX Q
 ; 
LAST(KCIEN,KIEN,DFN,TITLE) ; EP - GET LAST RESULT AND APPEND TO RESULT
 N MAXIDT,LASTDT,LASTRES,TXT,%
 S MAXIDT=9999999-(DT-20000) ; GO BACK UP TO 2 YEARS
 S TXT=TITLE
 I $E(TXT,1,3)="__ " S TXT=$E(TXT,4,999)
 D LAST^VENPCCKX(KIEN,KCIEN,TXT,DFN,MAXIDT,.LASTDT,.LASTRES)
 I '$G(LASTDT) Q
 S %=$$FMTE^XLFDT(LASTDT,2) I '$L(%) Q
 I $L($G(LASTRES)) S %=%_" "_LASTRES
 S TITLE=TITLE_" ("_%_")"
 Q
 ; 
IMPORT ; EP-IMPORT KNOWLEGEBASE CONTENT FOR WELL CHILD CARE
 D PTED,NUTR,EXAM,DM
 Q
 ; 
NUTR ; EP-NUTRITION TOPICS
 N DIK,DA
 S DIK="^VEN(7.12,"
 S DA=0 F  S DA=$O(^VEN(7.12,"B",7,DA)) Q:'DA  D ^DIK ; CLEAN OUT THE TYPE
 D ^XBFMK
 N ARR,FILE,TYPE
 S FILE="TBLNUT.TXT",TYPE=7
 S ARR=$NA(^TMP("VEN KB",$J)) K @ARR
 D PE1(FILE) ; BUILD PRIMARY ARRAY
 D PASS2
 D FILE(TYPE)
 K @ARR
 D ^XBFMK
 Q
 ; 
PTED ; EP-PATIENT ED TOPICS
 N DIK,DA
 S DIK="^VEN(7.12,"
 S DA=0 F  S DA=$O(^VEN(7.12,"B",6,DA)) Q:'DA  D ^DIK ; CLEAN OUT THE TYPE
 D ^XBFMK
 N ARR,FILE,TYPE
 S FILE="TBLINJURYP.TXT",TYPE=6
 S ARR=$NA(^TMP("VEN KB",$J)) K @ARR
 D PE1(FILE) ; BUILD PRIMARY ARRAY
 D PASS2
 D FILE(TYPE)
 K @ARR
 D ^XBFMK
 Q
 ; 
PE1(FILE) ; EP - FIRST PASS FOR PATIENT ED AND NUTRITION TOPICS
 N PATH,POP,XCODE,SS,PCE,CNT,REC,TOT
 S PATH="C:\ITSC\kb\"
 S POP=$$OPN^VENPCCP(PATH,FILE,"R","F CNT=0:1 R REC(CNT) I $L(REC(CNT))<3 K REC(CNT) Q")
 S TOT=$L(REC(0),U) I TOT<3 Q
 F PCE=1:1:TOT D
 . S SS=$P(REC(0),U,PCE)
 . I $E(SS,1,3)="i  " Q
 . S CNT=0
 . F  S CNT=$O(REC(CNT)) Q:'CNT  D
 .. S XCODE=$P(REC(CNT),U,PCE)
 .. S @ARR@($E(SS,1,30),CNT)=XCODE_U_SS
 .. Q
 . Q
 Q
 ;
EXAM ; EP-IMPORT EXAM FILE INTO KNOWLEDGE BASE
 N DIK,DA
 S DIK="^VEN(7.12,"
 S DA=0 F  S DA=$O(^VEN(7.12,"B",2,DA)) Q:'DA  D ^DIK ; CLEAN OUT THE TYPE
 D ^XBFMK
 N ARR,FILE,TYPE
 S FILE="TBLEXAM.TXT",TYPE=2
 S ARR=$NA(^TMP("VEN KB",$J)) K @ARR
 D PASS1(FILE) ; BUILD PRIMARY ARRAY
 D PASS2
 D FILE(TYPE)
 K @ARR
 D ^XBFMK
 Q
 ; 
PASS1(FILE) ; EP - GENERATE A PRIMARY ARRAY FROM THE FILE
 N PATH,POP,VAL,SS,PCE,CNT,REC,TOT
 S PATH="C:\ITSC\kb\"
 S POP=$$OPN^VENPCCP(PATH,FILE,"R","F CNT=0:1 R REC(CNT) I $L(REC(CNT))<3 K REC(CNT) Q")
 S TOT=$L(REC(0),U) I TOT<3 Q
 F PCE=1:1:TOT D
 . S SS=$P(REC(0),U,PCE)
 . S CNT=0
 . F  S CNT=$O(REC(CNT)) Q:'CNT  D
 .. S VAL=$P(REC(CNT),U,PCE)
 .. S @ARR@(SS,CNT)=VAL
 .. Q
 . Q
 Q
 ;
PASS2  ; EP - BUILD SECONDARY ARRAY FOR NON-DEVEL ITEMS
 N SS,CNT,START,VAL,STOP
 S SS="" F  S SS=$O(@ARR@(SS)) Q:SS=""  D
 . I SS'="AGE",SS'="ID",SS'="test",SS'="test2",SS'="car seats"
 . E  K @ARR@(SS) Q
 . S CNT=0,START=0
 . F  Q:START  S CNT=$O(@ARR@(SS,CNT)) Q:'CNT  D
 .. S VAL=@ARR@(SS,CNT)
 .. I $L($P(VAL,U)) S START=CNT
 .. Q
 . I 'START Q
 . S CNT=999999,STOP=0
 . F  Q:STOP  S CNT=$O(@ARR@(SS,CNT),-1) Q:'CNT  D
 .. S VAL=@ARR@(SS,CNT)
 .. I $L($P(VAL,U)) S STOP=CNT
 .. Q
 . K @ARR@(SS)
 . S @ARR@(SS)=START_U_STOP_U_VAL
 . Q
 Q
 ; 
FILE(TYPE) ; EP-UPDATE VEN EHP KB ITEM FILE
 N DIC,DIE,X,Y,MN,DR,DA,TEXT,CODE,UNIT,STG,Z,SEXSCR,AGE1,AGE2,SEX,%,AX1,AX2,XCODE
 S STG=$G(^VEN(7.11,TYPE,0)) I '$L(STG) Q
 S MN=$P(STG,U,2) I '$L(MN) Q
 S UNIT=$P(STG,U,10) I '$L(UNIT) Q
 S SEXSCR=+$P(STG,U,8)
 S (DIE,DIC)="^VEN(7.12,",DIC(0)="L",DLAYGO=19707.12
 S DR=".02////^S X=TEXT;.03////^S X=CODE;.05////^S X=AGE1;.06////^S X=AGE2;.1////^S X=SEX;"
 S DR=DR_".13////^S X=AX1;.14////^S X=AX2;.04////^S X=XCODE"
 S TEXT="" F  S TEXT=$O(@ARR@(TEXT)) Q:'$L(TEXT)  D
 . S Z=$G(@ARR@(TEXT)) I '$L(Z) Q
 . S AGE1=$P(Z,U) I AGE1=1 S AGE1=0
 . S AX1=AGE1
 . I AGE1 S AGE1=$$TIME(AGE1,UNIT) I 'AGE1 Q
 . S (AX2,AGE2)=$P(Z,U,2)
 . S AGE2=$$TIME(AGE2,UNIT) I 'AGE2 Q
 . S SEX="" I SEXSCR,TYPE=2 S %=$P(Z,U,3) I %="F"!(%="M") S SEX=%
 . S XCODE=""
 . I TYPE=6 S XCODE=$P(Z,U,3),TEXT=$P(Z,U,4) ; PT ED FULL TOPIC NAME AND XCODE
 . I TYPE=7 S TEXT=$P(Z,U,4) ; NUTRITION FULL TOPIC NAME
 . S X="""`"_TYPE_""""
 . D ^DIC I Y=-1 Q
 . S DA=+Y
 . S CODE=MN_DA
 . L +^VEN(7.12,DA):0 I $T D ^DIE L -^VEN(7.12,DA)
 . Q
 Q
 ;
DM ; EP-DDST MILESTONES
 N ARR,FILE,TYPE,NAME
 F TYPE=1,3:1:5 S NAME=$P("Fine^^Gross^Lang^Social",U,TYPE) D
 . S ARR=$NA(^TMP("VEN KBX",$J)) K @ARR
 . S FILE="Tbl"_NAME_".txt"
 . D D1(FILE,TYPE)
 . S ARR=$NA(^TMP("VEN KB",$J)) K @ARR
 . S FILE="TblNo"_NAME_".txt"
 . D D1(FILE,TYPE)
 . K ^TMP("VEN KBX",$J)
 . D DFILE(TYPE)
 . K ^TMP("VEN KB",$J)
 . D ^XBFMK
 . Q
 Q
 ; 
D1(FILE,TYPE) ; EP - FIRST DEVELOPMENTAL PASS
 I $L($G(FILE)),$D(^VEN(7.11,+$G(TYPE),0))
 E  Q
 N DIK,DA
 S DIK="^VEN(7.12,"
 S DA=0 F  S DA=$O(^VEN(7.12,"B",TYPE,DA)) Q:'DA  D ^DIK ; CLEAN OUT THE TYPE
 D ^XBFMK
 N PATH,POP,PCT,XSTART,XSTOP,SS,PCE,CNT,REC,TOT,AGE,INACTIVE
 S PATH="C:\ITSC\kb\"
 S POP=$$OPN^VENPCCP(PATH,FILE,"R","F CNT=0:1 R REC(CNT) I $L(REC(CNT))<3 K REC(CNT) Q")
 S TOT=$L(REC(0),U) I TOT<3 Q
 F PCE=3:1:TOT D  ; IGNORE THE 1ST 2 FIELDS
 . S SS=$P(REC(0),U,PCE)
 . S CNT=0
 . F  S CNT=$O(REC(CNT)) Q:'CNT  D
 .. S PCT=$P(REC(CNT),U,PCE) I PCT="" Q  ; NULL = DON'T SHOW IT.  0 = INACTIVATE IT.
 .. S AGE=$P(REC(CNT),U,2) I AGE="" Q
 .. S XSTART=AGE S XSTOP=AGE+.5 I AGE>18 S XSTOP=XSTOP+.5
 .. S AGE=$$TIME(AGE,"M")
 .. S INACTIVE=($P($G(^TMP("VEN KBX",$J,SS,AGE)),U)=0)
 .. S @ARR@(SS,AGE)=PCT_U_INACTIVE_U_XSTART_U_XSTOP
 .. Q
 . Q
 Q
 ;
DFILE(TYPE) ; EP-FILE DEVELOPMENTAL DATA
 N DIC,DIE,X,Y,MN,DR,DA,TEXT,CODE,UNIT,STG,Z,SEXSCR,SEX,%,A1,A2,PCT,INACTIVE,%,XSTART,XSTOP
 S STG=$G(^VEN(7.11,TYPE,0)) I '$L(STG) Q
 S MN=$P(STG,U,2) I '$L(MN) Q
 S (DIE,DIC)="^VEN(7.12,",DIC(0)="L",DLAYGO=19707.12
 S DR=".02////^S X=TEXT;.03////^S X=CODE;.05////^S X=A1;.06////^S X=A2;.12////^S X=PCT;"
 S DR=DR_".11////^S X=INACTIVE;.13////^S X=XSTART;.14////^S X=XSTOP"
 S TEXT=""
 F  S TEXT=$O(@ARR@(TEXT)) Q:'$L(TEXT)  I TEXT'="AGE",TEXT'="ID"  S A1=0 F  S A1=$O(@ARR@(TEXT,A1)) Q:'A1  D
 . S X="""`"_TYPE_""""
 . D ^DIC I Y=-1 Q
 . S A2=$O(@ARR@(TEXT,A1))
 . I A2 S A2=A2-1
 . E  S A2=A1+15 I A1>550 S A2=A2+15
 . S %=$G(@ARR@(TEXT,A1))
 . S PCT=+%
 . S INACTIVE=$P(%,U,2)
 . S XSTART=$P(%,U,3) S XSTOP=$P(%,U,4)
 . S DA=+Y
 . S CODE=MN_DA
 . L +^VEN(7.12,DA):0 I $T D ^DIE L -^VEN(7.12,DA)
 . Q
 Q
 ; 
TIME(AGE,UNIT) ; EP - CONVERT TIME TO DAYS
 I $G(AGE)="" Q ""
 I 'AGE Q 0
 I '$L($G(UNIT)) Q ""
 I UNIT="D" Q AGE
 I UNIT="W" Q (AGE*7)
 I UNIT="M" Q ((AGE*30.5)\1)
 I UNIT="Y" Q ((AGE*365.35)\1)
 Q ""
 ;
TRIG(AGE,IEN,MODE) ; EP - TRIGGER DAYS FROM EXTERNAL AGE
 ; MODE = 1 START  ;  MODE = 2  STOP
 N CAT,CIEN,DAYS,STG,UNIT,START,STOP
 S STG=$G(^VEN(7.12,IEN,0)) I '$L(STG) Q ""
 S CIEN=+STG,START=$P(STG,U,5),STOP=$P(STG,U,6)
 S CAT=$P($G(^VEN(7.11,CIEN,0)),U) I '$L(CAT) Q ""
 I CAT["WELL CHILD DEVEL" Q $S(MODE=1:START,MODE=2:STOP,1:"") ; DONT TRIGGER AGE FOR DEVELOPMENT ITEMS
 S UNIT=$P(^VEN(7.11,CIEN,0),U,10) I '$L(UNIT) Q ""
 S DAYS=$$TIME(AGE,UNIT)
 Q DAYS ; ADD
 ;
DAYS(DFN) ; EP - GIVEN A DOB, RETURN THE AGE IN DAYS
 N DOB
 S DOB=$P($G(^DPT(+$G(DFN),0)),U,3)
 I '$G(DOB) Q ""
 Q $$FMDIFF^XLFDT(DT,DOB,1)
 ;
TAX(OUT,IN) ; EP - RPC: VEN PCC+ KB TAXONOMY
 S OUT="BMX ADO SS^VEN KB TAXONOMY^^~~~~~ITAX~VENPCCK~"  ; RETURN ALL TAXONOMIES
 Q
 ; 
ITAX(PARAM,IENS,MAX,OUT,TOT) ; EP - RETURN A LIST OF TEMPLATES ASSOCIATED WITH A KB GROUP
 N NAME,DA,STG,EX
 S EX=$C(68)_" DATA"_U
 S EX=EX_"BMXADOV1(IENS,DA)"
 S NAME=""
 F  S NAME=$O(^ATXAX("B",NAME)) Q:NAME=""  D
 . S DA=0
 . F  S DA=$O(^ATXAX("B",NAME,DA)) Q:'DA  D
 .. I $P($G(^ATXAX(DA,0)),U,15)'=80 Q  ; MUST BE AN ICD TAXONOMY
 .. X EX
 .. Q
 . Q
 Q ""
 ; 
FKBT(KGIEN,IENS,MAX,OUT,TOT) ; EP - RETURN A LIST OF TEMPLATES ASSOCIATED WITH A KB GROUP
 N MODE S MODE=1
 D FKBTX
 Q ""
 ; 
NKBT(KGIEN,IENS,MAX,OUT,TOT) ; EP - RETURN A LIST OF TEMPLATES THAT ARE NOT ASSOCIATED WITH A KB GROUP
 N MODE S MODE=0
 D FKBTX
 Q ""
 ; 
FKBTX ; EP - FILTERS
 N NAME,DA,STG,EX
 S EX=$C(68)_" DATA"_U
 S EX=EX_"BMXADOV1(IENS,DA)"
 I '$D(^VEN(7.11,+$D(KGIEN),0)) Q
 S NAME=""
 F  S NAME=$O(^VEN(7.41,"B",NAME)) Q:NAME=""  D
 . S DA=0
 . F  S DA=$O(^VEN(7.41,"B",NAME,DA)) Q:'DA  D
 .. I MODE,'$O(^VEN(7.41,DA,16,"B",KGIEN,0)) Q  ; FILTER OUT FORM IF IT IS NOT ASSOCIATED WITH THIS KB GROUP
 .. I 'MODE,$O(^VEN(7.41,DA,16,"B",KGIEN,0)) Q  ; FILTER OUT FORM IF IT IS NOT ASSOCIATED WITH THIS KB GROUP
 .. X EX
 .. Q
 . Q
 Q
 ;
KBT1(OUT,IN) ; EP - RPC: VEN PCC+ GET KB TEMPLATES
 I $G(IN)="" S OUT="" Q  ; INVALID KB GROUP
 S OUT="BMX ADO SS^VEN KB TEMPLATES^^~~~~~FKBT~VENPCCK~"_IN  ; RETURN ALL TEMPLATES ASSOC W KB GRP
 Q
 ; 
KBT2(OUT,IN) ; EP - RPC: VEN PCC+ GET NON KB TEMPLATES
 I $G(IN)="" S OUT="" Q  ; INVALID KB GROUP
 S OUT="BMX ADO SS^VEN KB TEMPLATES^^~~~~~NKBT~VENPCCK~"_IN  ; RETURN ALL TEMPLATES NOT ASSOC W KB GRP
 Q
 ; 
KBG(OUT,IN) ; EP - RPC: VEN PCC+ GET KB GROUPS
 S OUT="BMX ADO SS^VEN KB CATEGORY^^B~~~999999"
 Q
 ;
KBI(OUT,IN) ; EP-SUBMIT KB GROUP AND RETURN ALL THE ITEMS IN A TABLE
 S OUT=""
 I '$L(IN) Q
 N DIC,X,KGIEN,KIEN,DA
 S KGIEN=$O(^VEN(7.11,"B",IN,0))
 I 'KGIEN D  ; NEED TO ADD NEW GROUP
 . S DIC="^VEN(7.11,",DOC(0)="L"
 . S DLAYGO=19707.11 S X=IN
 . D ^DIC I Y=-1 Q
 . S KGIEN=+Y
 . Q
 D ^XBFMK
 I 'KGIEN Q
 S OUT="BMX ADO SS^VEN KB ITEM^^B~"_KGIEN_"~"_KGIEN_"~999999"
 Q
 ;
KBT3(OUT,IN) ; EP-ASSOCIATE KB GROUP WITH TEMPLATES
 N DIC,X,Y,DA,STG,PCE,KB
 S KB=+$G(IN) I '$D(^VEN(7.11,KB,0)) Q ""
 S DIC("P")="19707.4116P" S DIC(0)="L" S DLAYGO=19707.4116
 S STG=$P(IN,";",2)
 F PCE=1:1:$L(STG,",") D
 . S DA(1)=$P(STG,",",PCE)
 . S X="`"_KB
 . I '$D(^VEN(7.41,DA(1))) Q
 . S DIC="^VEN(7.41,"_DA(1)_",16,"
 . D ^DIC
 . Q
 S OUT="OK" D ^XBFMK
 Q
 ; 