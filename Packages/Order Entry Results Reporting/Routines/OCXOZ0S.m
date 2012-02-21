OCXOZ0S ;SLC/RJS,CLA - Order Check Scan ;OCT 20,2005 at 22:40
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**32,221**;Dec 17,1997
 ;;  ;;ORDER CHECK EXPERT version 1.01 released OCT 29,1998
 ;
 ; ***************************************************************
 ; ** Warning: This routine is automatically generated by the   **
 ; ** Rule Compiler (^OCXOCMP) and ANY changes to this routine  **
 ; ** will be lost the next time the rule compiler executes.    **
 ; ***************************************************************
 ;
 Q
 ;
R48R2B ; Send Order Check, Notication messages and/or Execute code for  Rule #48 'SITE FLAGGED ORDER'  Relation #2 'NEW SITE FLAGGED ORDER AND OUTPATIENT'
 ;  Called from R48R2A+12^OCXOZ0R.
 ;
 Q:$G(OCXOERR)
 ;
 ;      Local Extrinsic Functions
 ; GETDATA( ---------> GET DATA FROM THE ACTIVE DATA FILE
 ; INT2DT( ----------> CONVERT DATE FROM OCX FORMAT TO READABLE FORMAT
 ; NEWRULE( ---------> NEW RULE MESSAGE
 ;
 Q:$D(OCXRULE("R48R2B"))
 ;
 N OCXNMSG,OCXCMSG,OCXPORD,OCXFORD,OCXDATA,OCXNUM,OCXDUZ,OCXQUIT,OCXLOGS,OCXLOGD
 S OCXCMSG=""
 S OCXNMSG="["_$$GETDATA(DFN,"58^128",147)_"] Order placed: "_$$GETDATA(DFN,"58^128",96)_" "_$$INT2DT($$GETDATA(DFN,"58^128",9),0)_"."
 ;
 Q:$G(OCXOERR)
 ;
 ; Send Notification
 ;
 S (OCXDUZ,OCXDATA)="",OCXNUM=0
 I ($G(OCXOSRC)="GENERIC HL7 MESSAGE ARRAY") D
 .S OCXDATA=$G(^TMP("OCXSWAP",$J,"OCXODATA","ORC",2))_"|"_$G(^TMP("OCXSWAP",$J,"OCXODATA","ORC",3))
 .S OCXDATA=$TR(OCXDATA,"^","@"),OCXNUM=+OCXDATA
 I ($G(OCXOSRC)="CPRS ORDER PROTOCOL") D
 .I $P($G(OCXORD),U,3) S OCXDUZ(+$P(OCXORD,U,3))=""
 .S OCXNUM=+$P(OCXORD,U,2)
 S:($G(OCXOSRC)="CPRS ORDER PRESCAN") OCXNUM=+$P(OCXPSD,"|",5)
 S OCXRULE("R48R2B")=""
 I $$NEWRULE(DFN,OCXNUM,48,2,61,OCXNMSG) D  I 1
 .D:($G(OCXTRACE)<5) EN^ORB3(61,DFN,OCXNUM,.OCXDUZ,OCXNMSG,.OCXDATA)
 Q
 ;
R49R1A ; Verify all Event/Elements of  Rule #49 'SITE FLAGGED RESULT'  Relation #1 'INPATIENT AND (SITE FLAGGED LAB RESULT OR SITE FLA...'
 ;  Called from EL127+6^OCXOZ0G, and EL59+5^OCXOZ0G, and EL102+5^OCXOZ0G, and EL109+5^OCXOZ0H.
 ;
 Q:$G(OCXOERR)
 ;
 ;      Local Extrinsic Functions
 ; MCE102( ---------->  Verify Event/Element: 'SITE FLAGGED FINAL IMAGING RESULT'
 ; MCE109( ---------->  Verify Event/Element: 'SITE FLAGGED FINAL CONSULT RESULT'
 ; MCE127( ---------->  Verify Event/Element: 'INPATIENT'
 ; MCE59( ----------->  Verify Event/Element: 'SITE FLAGGED FINAL LAB RESULT'
 ;
 Q:$G(^OCXS(860.2,49,"INACT"))
 ;
 I $$MCE127 D 
 .I $$MCE59 D R49R1B
 .I $$MCE102 D R49R1B
 .I $$MCE109 D R49R1B
 Q
 ;
R49R1B ; Send Order Check, Notication messages and/or Execute code for  Rule #49 'SITE FLAGGED RESULT'  Relation #1 'INPATIENT AND (SITE FLAGGED LAB RESULT OR SITE FLA...'
 ;  Called from R49R1A+14.
 ;
 Q:$G(OCXOERR)
 ;
 ;      Local Extrinsic Functions
 ; GETDATA( ---------> GET DATA FROM THE ACTIVE DATA FILE
 ; INT2DT( ----------> CONVERT DATE FROM OCX FORMAT TO READABLE FORMAT
 ; NEWRULE( ---------> NEW RULE MESSAGE
 ;
 Q:$D(OCXRULE("R49R1B"))
 ;
 N OCXNMSG,OCXCMSG,OCXPORD,OCXFORD,OCXDATA,OCXNUM,OCXDUZ,OCXQUIT,OCXLOGS,OCXLOGD
 S OCXCMSG=""
 S OCXNMSG="["_$$GETDATA(DFN,"59^102^109^127",147)_"] Result available: "_$$GETDATA(DFN,"59^102^109^127",96)_" "_$$INT2DT($$GETDATA(DFN,"59^102^109^127",9),0)_" "
 ;
 Q:$G(OCXOERR)
 ;
 ; Send Notification
 ;
 S (OCXDUZ,OCXDATA)="",OCXNUM=0
 I ($G(OCXOSRC)="GENERIC HL7 MESSAGE ARRAY") D
 .S OCXDATA=$G(^TMP("OCXSWAP",$J,"OCXODATA","ORC",2))_"|"_$G(^TMP("OCXSWAP",$J,"OCXODATA","ORC",3))
 .S OCXDATA=$TR(OCXDATA,"^","@"),OCXNUM=+OCXDATA
 I ($G(OCXOSRC)="CPRS ORDER PROTOCOL") D
 .I $P($G(OCXORD),U,3) S OCXDUZ(+$P(OCXORD,U,3))=""
 .S OCXNUM=+$P(OCXORD,U,2)
 S:($G(OCXOSRC)="CPRS ORDER PRESCAN") OCXNUM=+$P(OCXPSD,"|",5)
 S OCXRULE("R49R1B")=""
 I $$NEWRULE(DFN,OCXNUM,49,1,32,OCXNMSG) D  I 1
 .D:($G(OCXTRACE)<5) EN^ORB3(32,DFN,OCXNUM,.OCXDUZ,OCXNMSG,.OCXDATA)
 Q
 ;
CKSUM(STR) ;  Compiler Function: GENERATE STRING CHECKSUM
 ;
 N CKSUM,PTR,ASC S CKSUM=0
 S STR=$TR(STR,"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")
 F PTR=$L(STR):-1:1 S ASC=$A(STR,PTR)-42 I (ASC>0),(ASC<51) S CKSUM=CKSUM*2+ASC
 Q +CKSUM
 ;
GETDATA(DFN,OCXL,OCXDFI) ;     This Local Extrinsic Function returns runtime data
 ;
 N OCXE,VAL,PC S VAL=""
 F PC=1:1:$L(OCXL,U) S OCXE=$P(OCXL,U,PC) I OCXE S VAL=$G(^TMP("OCXCHK",$J,DFN,OCXE,OCXDFI)) Q:$L(VAL)
 Q VAL
 ;
INT2DT(OCXDT,OCXF) ;      This Local Extrinsic Function converts an OCX internal format
 ; date into an Externl Format (Human Readable) date.   'OCXF=SHORT FORMAT OCXF=LONG FORMAT
 ;
 Q:'$L($G(OCXDT)) "" S OCXF=+$G(OCXF)
 N OCXYR,OCXLPYR,OCXMON,OCXDAY,OCXHR,OCXMIN,OCXSEC,OCXCYR
 S (OCXYR,OCXLPYR,OCXMON,OCXDAY,OCXHR,OCXMIN,OCXSEC,OCXAP)=""
 S OCXSEC=$E(OCXDT#60+100,2,3),OCXDT=OCXDT\60
 S OCXMIN=$E(OCXDT#60+100,2,3),OCXDT=OCXDT\60
 S OCXHR=$E(OCXDT#24+100,2,3),OCXDT=OCXDT\24
 S OCXCYR=($H\1461)*4+1841+(($H#1461)\365)
 S OCXYR=(OCXDT\1461)*4+1841,OCXDT=OCXDT#1461
 S OCXLPYR=(OCXDT\365),OCXDT=OCXDT-(OCXLPYR*365),OCXYR=OCXYR+OCXLPYR
 S OCXCNT="031^059^090^120^151^181^212^243^273^304^334^365"
 S:(OCXLPYR=3) OCXCNT="031^060^091^121^152^182^213^244^274^305^335^366"
 F OCXMON=1:1:12 Q:(OCXDT<$P(OCXCNT,U,OCXMON))
 S OCXDAY=OCXDT-$P(OCXCNT,U,OCXMON-1)+1
 I OCXF S OCXMON=$P("January^February^March^April^May^June^July^August^September^October^November^December",U,OCXMON)
 E  S OCXMON=$E(OCXMON+100,2,3)
 S OCXAP=$S('OCXHR:"Midnight",(OCXHR=12):"Noon",(OCXHR<12):"AM",1:"PM")
 I OCXF S OCXHR=OCXHR#12 S:'OCXHR OCXHR=12
 Q:'OCXF $E(OCXMON+100,2,3)_"/"_$E(OCXDAY+100,2,3)_$S((OCXCYR=OCXYR):" "_OCXHR_":"_OCXMIN,1:"/"_$E(OCXYR,3,4))
 Q:(OCXHR+OCXMIN+OCXSEC) OCXMON_" "_OCXDAY_","_OCXYR_" at "_OCXHR_":"_OCXMIN_"."_OCXSEC_" "_OCXAP
 Q OCXMON_" "_OCXDAY_","_OCXYR
 ;
MCE102() ; Verify Event/Element: SITE FLAGGED FINAL IMAGING RESULT
 ;
 ;
 N OCXRES
 I $L(OCXDF(37)) S OCXRES(102,37)=OCXDF(37)
 Q:'(OCXDF(37)) 0 I $D(^TMP("OCXCHK",$J,OCXDF(37),102)) Q $G(^TMP("OCXCHK",$J,OCXDF(37),102))
 Q 0
 ;
MCE109() ; Verify Event/Element: SITE FLAGGED FINAL CONSULT RESULT
 ;
 ;
 N OCXRES
 I $L(OCXDF(37)) S OCXRES(109,37)=OCXDF(37)
 Q:'(OCXDF(37)) 0 I $D(^TMP("OCXCHK",$J,OCXDF(37),109)) Q $G(^TMP("OCXCHK",$J,OCXDF(37),109))
 Q 0
 ;
MCE127() ; Verify Event/Element: INPATIENT
 ;
 ;
 N OCXRES
 I $L(OCXDF(37)) S OCXRES(127,37)=OCXDF(37)
 Q:'(OCXDF(37)) 0 I $D(^TMP("OCXCHK",$J,OCXDF(37),127)) Q $G(^TMP("OCXCHK",$J,OCXDF(37),127))
 Q 0
 ;
MCE59() ; Verify Event/Element: SITE FLAGGED FINAL LAB RESULT
 ;
 ;
 N OCXRES
 I $L(OCXDF(37)) S OCXRES(59,37)=OCXDF(37)
 Q:'(OCXDF(37)) 0 I $D(^TMP("OCXCHK",$J,OCXDF(37),59)) Q $G(^TMP("OCXCHK",$J,OCXDF(37),59))
 Q 0
 ;
NEWRULE(OCXDFN,OCXORD,OCXRUL,OCXREL,OCXNOTF,OCXMESS) ; Has this rule already been triggered for this order number
 ;
 ;
 Q:'$G(OCXDFN) 0 Q:'$G(OCXRUL) 0
 Q:'$G(OCXREL) 0  Q:'$G(OCXNOTF) 0  Q:'$L($G(OCXMESS)) 0
 S OCXORD=+$G(OCXORD),OCXDFN=+OCXDFN
 ;
 N OCXNDX,OCXDATA,OCXDFI,OCXELE,OCXGR,OCXTIME,OCXCKSUM,OCXTSP,OCXTSPL
 ;
 S OCXTIME=(+$H)
 S OCXCKSUM=$$CKSUM(OCXMESS)
 ;
 S OCXTSP=($H*86400)+$P($H,",",2)
 S OCXTSPL=($G(^OCXD(860.7,"AT",OCXTIME,OCXDFN,OCXRUL,+OCXORD,OCXCKSUM))+$G(OCXTSPI,300))
 ;
 Q:(OCXTSPL>OCXTSP) 0
 ;
 K OCXDATA
 S OCXDATA(OCXDFN,0)=OCXDFN
 S OCXDATA("B",OCXDFN,OCXDFN)=""
 S OCXDATA("AT",OCXTIME,OCXDFN,OCXRUL,+OCXORD,OCXCKSUM)=OCXTSP
 ;
 S OCXGR="^OCXD(860.7"
 D SETAP(OCXGR_")",0,.OCXDATA,OCXDFN)
 ;
 K OCXDATA
 S OCXDATA(OCXRUL,0)=OCXRUL_U_(OCXTIME)_U_(+OCXORD)
 S OCXDATA(OCXRUL,"M")=OCXMESS
 S OCXDATA("B",OCXRUL,OCXRUL)=""
 S OCXGR=OCXGR_","_OCXDFN_",1"
 D SETAP(OCXGR_")","860.71P",.OCXDATA,OCXRUL)
 ;
 K OCXDATA
 S OCXDATA(OCXREL,0)=OCXREL
 S OCXDATA("B",OCXREL,OCXREL)=""
 S OCXGR=OCXGR_","_OCXRUL_",1"
 D SETAP(OCXGR_")","860.712",.OCXDATA,OCXREL)
 ;
 S OCXELE=0 F  S OCXELE=$O(^OCXS(860.2,OCXRUL,"C","C",OCXELE)) Q:'OCXELE  D
 .;
 .N OCXGR1
 .S OCXGR1=OCXGR_","_OCXREL_",1"
 .K OCXDATA
 .S OCXDATA(OCXELE,0)=OCXELE
 .S OCXDATA(OCXELE,"TIME")=OCXTIME
 .S OCXDATA(OCXELE,"LOG")=$G(OCXOLOG)
 .S OCXDATA("B",OCXELE,OCXELE)=""
 .K ^OCXD(860.7,OCXDFN,1,OCXRUL,1,OCXREL,1,OCXELE)
 .D SETAP(OCXGR1_")","860.7122P",.OCXDATA,OCXELE)
 .;
 .S OCXDFI=0 F  S OCXDFI=$O(^TMP("OCXCHK",$J,OCXDFN,OCXELE,OCXDFI)) Q:'OCXDFI  D
 ..N OCXGR2
 ..S OCXGR2=OCXGR1_","_OCXELE_",1"
 ..K OCXDATA
 ..S OCXDATA(OCXDFI,0)=OCXDFI
 ..S OCXDATA(OCXDFI,"VAL")=^TMP("OCXCHK",$J,OCXDFN,OCXELE,OCXDFI)
 ..S OCXDATA("B",OCXDFI,OCXDFI)=""
 ..D SETAP(OCXGR2_")","860.71223P",.OCXDATA,OCXDFI)
 ;
 Q 1
 ;
SETAP(ROOT,DD,DATA,DA) ;  Set Rule Event data
 M @ROOT=DATA
 I +$G(DD) S @ROOT@(0)="^"_($G(DD))_"^"_($P($G(@ROOT@(0)),U,3)+1)_"^"_$G(DA)
 I '$G(DD) S $P(@ROOT@(0),U,3,4)=($P($G(@ROOT@(0)),U,3)+1)_"^"_$G(DA)
 ;
 Q
 ;
 ;
