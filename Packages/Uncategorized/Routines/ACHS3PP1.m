ACHS3PP1 ; IHS/ITSC/PMF - COMPILE CHS THIRD PARTY PAYMENT REPORT - INDIVIDUAL PAT ;  [ 10/16/2001   8:16 AM ]
 ;;3.1;CONTRACT HEALTH MGMT SYSTEM;;JUN 11, 2001
 ;
 ;
 ;TPF  ;THIS IS A REWRITE OF ACHSPPA
 ;
GETPAT ;
 S ACHSFAC=DUZ(2),ACHSPAT=""
 F  S ACHSPAT=$O(ACHSPAT(ACHSPAT)) Q:ACHSPAT=""  D
 .I '$D(^ACHSF("AC",ACHSPAT)) S ^TMP("ACHS3PP",$J,ACHSPAT,0)="" Q
 .D GETDIEN
 K ACHSDOCR,X,Y,Z
 ;
 D ^ACHS3PP2   ;GO LOOP THRU IND. PAT ^TMP GLOBAL CREATED HERE
 Q
 ;
GETDIEN ;
 S ACHSDIEN=""
 F  S ACHSDIEN=$O(^ACHSF("AC",ACHSPAT,ACHSFAC,ACHSDIEN)) Q:ACHSDIEN=""  D
 .I '$D(^TMP("ACHS3PP",$J,ACHSPAT)) S ^TMP("ACHS3PP",$J,ACHSPAT,0)=""
 .Q:'$D(^ACHSF(ACHSFAC,"D",ACHSDIEN,0))!'$D(^ACHSF(ACHSFAC,"D",ACHSDIEN,"PA"))
 .S ACHSDOCR=$G(^ACHSF(ACHSFAC,"D",ACHSDIEN,0))
 .Q:ACHSDOCR=""!($P(ACHSDOCR,U,9)'>0)   ;IGNORE 0 TOTAL AMOUNT OBLIGATED
 .D GETFY
 Q
 ;
GETFY ;
 S ACHSFY1=$P(ACHSDOCR,U,14)
 I ACHSFY1="",'$D(^TMP("ACHS3PP",$J,ACHSPAT)) S ^TMP("ACHS3PP",$J,ACHSPAT,0)=""
 Q:ACHSFY1=""
 Q:ACHSFY1'=$E(ACHSFY,4)
 S ACHSSERV=$P(ACHSDOCR,U,4)
 Q:'(ACHSSER=4)&(ACHSSERV'=ACHSSER)
GETIDT ;GET TRANSACTION RECORD INFORMATION
 S ACHSIDT=$P(ACHSDOCR,U,2)
 S ACHSOBL=$P(ACHSDOCR,U,9)
 S ACHSHRN=$P(ACHSDOCR,U,21)
 K Z
 S ACHSTRAN=0
 F  S ACHSTRAN=$O(^ACHSF(ACHSFAC,"D",ACHSDIEN,"T",ACHSTRAN)) Q:'ACHSTRAN  D
 .S X=$G(^ACHSF(ACHSFAC,"D",ACHSDIEN,"T",ACHSTRAN,0)) Q:X=""
 .S Y=$P(X,U,2)   ;GET TRANSACTION TYPE  
 .;IGNORE INITIAL AND CANCELLATION TYPES
 .I Y'="I",Y'="C" S Z("I")=$G(Z("I"))+$P(X,U,4),Z("3")=$G(Z("3"))+$P(X,U,8)
 .Q:'$D(Z)  ;QUIT IF NO PAYMENT OR THIRD PARTY PAYMENT AMOUNTS
 ;
 S:$P($G(^AUTTLOC(ACHSFAC,0)),U,4)'="" ACHSAREA=$P($G(^AUTTLOC(ACHSFAC,0)),U,4)
 S ACHSDOC=$P(ACHSDOCR,U,14)_"-"_$P($G(^AUTTAREA(ACHSAREA,0)),U,3)_$E($P($G(^AUTTLOC(ACHSFAC,0)),U,17),2,3)_"-"_$P(ACHSDOCR,U)
 S ^TMP("ACHS3PP",$J,ACHSPAT,ACHSDOC)=ACHSIDT_U_ACHSOBL_U_Z("3")_U_Z("I")_U_ACHSSERV_U_ACHSHRN
 Q
 ;
