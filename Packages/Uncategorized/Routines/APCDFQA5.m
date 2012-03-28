APCDFQA5 ; IHS/CMI/LAB - MAINTAIN CODE RANGES IN TABLE ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;
 I 'APCDSUB D ADD I 1
 E  D DEL
 D EOJ
 Q
 ;
ADD ; SECTION FOR ADDING CODES TO TABLE
 I '$D(APCDTABL) S APCDTABL(APCD("LOW"))=APCD("HI") G X1
 S APCDDONE=0
 S APCDVAL="" F  S APCDVAL=$O(APCDTABL(APCDVAL)) Q:APCDVAL=""   D GETCASE,ADDPROC Q:APCDDONE
 D:'APCDDONE SETRANGE
 K APCDDONE,APCDVAL,APCDCASE
X1 Q
 ;
ADDPROC ; CASE SPECIFIC ADD PROCESSING
 G @("ADD"_APCDCASE)
ADD2 ;;
ADD3 ;;
ADD4 ;;
 S APCDTABL(APCD("LOW"))=APCDTABL(APCDVAL)
 K APCDTABL(APCDVAL)
ADD6 ;;
ADD7 ;;
ADD9 ;;
ADD10 ;;
 S APCDDONE=1
 Q
ADD11 ;;
ADD12 ;;
 S APCD("LOW")=APCDVAL
ADD5 ;;
ADD8 ;;
 K APCDTABL(APCDVAL)
 Q
ADD1 ;;
 I $O(^ICD9("BA",APCD("HI")))=APCDVAL,$E(APCDVAL)=$E(APCD("HI"))!(APCDVAL&APCD("HI")) S APCDTABL(APCD("LOW"))=APCDTABL(APCDVAL) K APCDTABL(APCDVAL) S APCDDONE=1
 Q
ADD13 ;;
 I $O(^ICD9("BA",APCDTABL(APCDVAL)))=APCD("LOW"),$E(APCDVAL)=$E(APCD("LOW"))!(APCDVAL&APCD("LOW")) S APCD("LOW")=APCDVAL K APCDTABL(APCDVAL)
 ; continue
 Q
 ;
SETRANGE ;
 ;;
SET1 ;;
SET5 ;;
SET8 ;;
SET11 ;;
SET12 ;;
SET13 ;;
 S APCDTABL(APCD("LOW"))=APCD("HI")
 Q
 ;
DEL ; SECTION FOR DELETING CODES FROM TABLE
 I '$D(APCDTABL) G X2
 S APCDDONE=0
 S APCDVAL="" F  S APCDVAL=$O(APCDTABL(APCDVAL)) Q:APCDVAL=""  D GETCASE,DELPROC Q:APCDDONE
X2 Q
 ;
DELPROC ;CASE SPECIFIC DEL PROCESSING
 G @("DEL"_APCDCASE)
DEL2 ;;
 I APCD("HI")=APCDTABL(APCDVAL) K APCDTABL(APCDVAL)
 E  S APCDTABL($O(^ICD9("BA",APCD("HI"))))=APCDTABL(APCDVAL) K APCDTABL(APCDVAL)
 S APCDDONE=1
 Q
 ;
DEL3 ;;
DEL6 ;;
 S APCDTABL($O(^ICD9("BA",APCD("HI"))))=APCDTABL(APCDVAL) K APCDTABL(APCDVAL)
 S APCDDONE=1
 Q
 ;
DEL4 ;;
DEL5 ;;
DEL7 ;;
DEL8 ;;
 K APCDTABL(APCDVAL)
 I APCDCASE'=8,APCDCASE'=5 S APCDDONE=1
 Q
 ;
DEL10 ;;
DEL11 ;;
DEL12 ;;
 D @$S($E(APCDTABL(APCDVAL))?1N:"NUMBER",1:"LETTER")
 S APCDTABL(APCDVAL)=APCD("NEWHI")
 I APCDCASE=10 S APCDDONE=1
 Q
 ;
DEL9 ;;
 D @$S($E(APCDTABL(APCDVAL))?1N:"NUMBER",1:"LETTER")
 S APCDTABL($O(^ICD9("BA",APCD("HI"))))=APCDTABL(APCDVAL)
 S APCDTABL(APCDVAL)=APCD("NEWHI")
 S APCDDONE=1
 Q
 ;
DEL1 ;;
DEL13 ;;
 Q
 ;
GETCASE ; SUBROUTINE TO DETERMINE APCDCASE # FROM INPUT CODE RANGE
 S APCD("TLOW")=APCDVAL,APCD("THI")=APCDTABL(APCDVAL)
 D CASEA:APCD("TLOW")]APCD("LOW"),CASEB:APCD("LOW")=APCD("TLOW"),CASEC:APCD("LOW")]APCD("TLOW")
 K APCD("TLOW"),APCD("THI")
 Q
 ;
CASEA ;
 I APCD("HI")]APCD("TLOW") S APCDCASE=$S(APCD("THI")]APCD("HI"):3,APCD("HI")=APCD("THI"):4,1:5)
 E  S APCDCASE=$S(APCD("TLOW")]APCD("HI"):1,1:2)
 Q
 ;
CASEB ;
 S APCDCASE=$S(APCD("THI")]APCD("HI"):6,APCD("HI")=APCD("THI"):7,1:8)
 Q
 ;
CASEC ;
 I APCD("THI")]APCD("LOW") S APCDCASE=$S(APCD("THI")]APCD("HI"):9,APCD("HI")=APCD("THI"):10,1:11)
 E  S APCDCASE=$S(APCD("LOW")=APCD("THI"):12,1:13)
 Q
 ;
NUMBER ;
 S APCD("CODE")=APCD("LOW")-5 F  Q:APCD("LOW")]$O(^ICD9("BA",APCD("CODE")_" "))  S APCD("CODE")=APCD("CODE")-5
 S APCD("CODE")=$O(^ICD9("BA",APCD("CODE")_" ")) F  S APCD("NEWHI")=APCD("CODE"),APCD("CODE")=$O(^ICD9("BA",APCD("CODE"))) Q:APCD("CODE")=APCD("LOW")
 Q
 ;
LETTER ;
 S APCD("LET")=$E(APCD("LOW"))_" " F  S APCD("NEWHI")=$S($L(APCD("LET"))>2:APCD("LET"),1:APCD("LOW")),APCD("LET")=$O(^ICD9("BA",APCD("LET"))) Q:APCD("LET")=APCD("LOW")
 Q
EOJ ;
 K APCDCASE,APCDDONE,APCDNEXT,APCDONE,APCDVAL
 Q
 ;
