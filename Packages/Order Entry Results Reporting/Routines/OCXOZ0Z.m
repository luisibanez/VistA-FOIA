OCXOZ0Z ;SLC/RJS,CLA - Order Check Scan ;APR 17,2009 at 14:23
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**32,221,243**;Dec 17,1997;Build 242
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
R62R1A ; Verify all Event/Elements of  Rule #62 'FOOD/DRUG INTERACTION'  Relation #1 'INPATIENT FOOD DRUG REACTION'
 ;  Called from EL84+5^OCXOZ0I.
 ;
 Q:$G(OCXOERR)
 ;
 ;      Local Extrinsic Functions
 ; MCE84( ----------->  Verify Event/Element: 'INPATIENT FOOD-DRUG REACTION'
 ;
 Q:$G(^OCXS(860.2,62,"INACT"))
 ;
 I $$MCE84 D R62R1B
 Q
 ;
R62R1B ; Send Order Check, Notication messages and/or Execute code for  Rule #62 'FOOD/DRUG INTERACTION'  Relation #1 'INPATIENT FOOD DRUG REACTION'
 ;  Called from R62R1A+10.
 ;
 Q:$G(OCXOERR)
 ;
 ;      Local Extrinsic Functions
 ; GETDATA( ---------> GET DATA FROM THE ACTIVE DATA FILE
 ; NEWRULE( ---------> NEW RULE MESSAGE
 ;
 Q:$D(OCXRULE("R62R1B"))
 ;
 N OCXNMSG,OCXCMSG,OCXPORD,OCXFORD,OCXDATA,OCXNUM,OCXDUZ,OCXQUIT,OCXLOGS,OCXLOGD
 S OCXCMSG=""
 S OCXNMSG="["_$$GETDATA(DFN,"84^",147)_"] "_$$GETDATA(DFN,"84^",82)_" ordered - adjust diet accordingly."
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
 S OCXRULE("R62R1B")=""
 I $$NEWRULE(DFN,OCXNUM,62,1,55,OCXNMSG) D  I 1
 .D:($G(OCXTRACE)<5) EN^ORB3(55,DFN,OCXNUM,.OCXDUZ,OCXNMSG,.OCXDATA)
 Q
 ;
R63R1A ; Verify all Event/Elements of  Rule #63 'GLUCOPHAGE - CONTRAST MEDIA'  Relation #1 'IF PROC USES NON-BARIUM MEDIA AND PATIENT TAKING G...'
 ;  Called from EL91+5^OCXOZ0I, and EL106+5^OCXOZ0I.
 ;
 Q:$G(OCXOERR)
 ;
 ;      Local Extrinsic Functions
 ; MCE106( ---------->  Verify Event/Element: 'RADIOLOGY PROCEDURE CONTAINS NON-BARIUM CONTRAST MEDIA'
 ; MCE91( ----------->  Verify Event/Element: 'PATIENT WITH GLUCOPHAGE MED'
 ;
 Q:$G(^OCXS(860.2,63,"INACT"))
 ;
 I $$MCE106 D 
 .I $$MCE91 D R63R1B
 Q
 ;
R63R1B ; Send Order Check, Notication messages and/or Execute code for  Rule #63 'GLUCOPHAGE - CONTRAST MEDIA'  Relation #1 'IF PROC USES NON-BARIUM MEDIA AND PATIENT TAKING G...'
 ;  Called from R63R1A+12.
 ;
 Q:$G(OCXOERR)
 ;
 Q:$D(OCXRULE("R63R1B"))
 ;
 N OCXNMSG,OCXCMSG,OCXPORD,OCXFORD,OCXDATA,OCXNUM,OCXDUZ,OCXQUIT,OCXLOGS,OCXLOGD
 I ($G(OCXOSRC)="CPRS ORDER PRESCAN") S OCXCMSG=(+OCXPSD)_"^23^^Procedure uses intravenous contrast media and patient is taking metformin." I 1
 E  S OCXCMSG="Procedure uses intravenous contrast media and patient is taking metformin."
 S OCXNMSG=""
 ;
 Q:$G(OCXOERR)
 ;
 ; Send Order Check Message
 ;
 S OCXOCMSG($O(OCXOCMSG(999999),-1)+1)=OCXCMSG
 Q
 ;
R65R1A ; Verify all Event/Elements of  Rule #65 'POLYPHARMACY'  Relation #1 'POLYPHARMACY'
 ;  Called from EL95+5^OCXOZ0I.
 ;
 Q:$G(OCXOERR)
 ;
 ;      Local Extrinsic Functions
 ; MCE95( ----------->  Verify Event/Element: 'POLYPHARMACY'
 ;
 Q:$G(^OCXS(860.2,65,"INACT"))
 ;
 I $$MCE95 D R65R1B
 Q
 ;
R65R1B ; Send Order Check, Notication messages and/or Execute code for  Rule #65 'POLYPHARMACY'  Relation #1 'POLYPHARMACY'
 ;  Called from R65R1A+10.
 ;
 Q:$G(OCXOERR)
 ;
 ;      Local Extrinsic Functions
 ; GETDATA( ---------> GET DATA FROM THE ACTIVE DATA FILE
 ;
 Q:$D(OCXRULE("R65R1B"))
 ;
 N OCXNMSG,OCXCMSG,OCXPORD,OCXFORD,OCXDATA,OCXNUM,OCXDUZ,OCXQUIT,OCXLOGS,OCXLOGD
 I ($G(OCXOSRC)="CPRS ORDER PRESCAN") S OCXCMSG=(+OCXPSD)_"^26^^Potential polypharmacy - patient currently receiving "_$$GETDATA(DFN,"95^",109)_" medications." I 1
 E  S OCXCMSG="Potential polypharmacy - patient currently receiving "_$$GETDATA(DFN,"95^",109)_" medications."
 S OCXNMSG=""
 ;
 Q:$G(OCXOERR)
 ;
 ; Send Order Check Message
 ;
 S OCXOCMSG($O(OCXOCMSG(999999),-1)+1)=OCXCMSG
 Q
 ;
R66R1A ; Verify all Event/Elements of  Rule #66 'LAB RESULTS'  Relation #1 'HL7 LAB RESULTS'
 ;  Called from EL5+6^OCXOZ0H.
 ;
 Q:$G(OCXOERR)
 ;
 ;      Local Extrinsic Functions
 ; MCE5( ------------>  Verify Event/Element: 'HL7 FINAL LAB RESULT'
 ;
 Q:$G(^OCXS(860.2,66,"INACT"))
 ;
 I $$MCE5 D R66R1B^OCXOZ10
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
MCE106() ; Verify Event/Element: RADIOLOGY PROCEDURE CONTAINS NON-BARIUM CONTRAST MEDIA
 ;
 ;  OCXDF(37) -> PATIENT IEN data field
 ;
 N OCXRES
 S OCXDF(37)=$G(DFN) I $L(OCXDF(37)) S OCXRES(106,37)=OCXDF(37)
 Q:'(OCXDF(37)) 0 I $D(^TMP("OCXCHK",$J,OCXDF(37),106)) Q $G(^TMP("OCXCHK",$J,OCXDF(37),106))
 Q 0
 ;
MCE5() ; Verify Event/Element: HL7 FINAL LAB RESULT
 ;
 ;
 N OCXRES
 I $L(OCXDF(37)) S OCXRES(5,37)=OCXDF(37)
 Q:'(OCXDF(37)) 0 I $D(^TMP("OCXCHK",$J,OCXDF(37),5)) Q $G(^TMP("OCXCHK",$J,OCXDF(37),5))
 Q 0
 ;
MCE84() ; Verify Event/Element: INPATIENT FOOD-DRUG REACTION
 ;
 ;
 N OCXRES
 I $L(OCXDF(37)) S OCXRES(84,37)=OCXDF(37)
 Q:'(OCXDF(37)) 0 I $D(^TMP("OCXCHK",$J,OCXDF(37),84)) Q $G(^TMP("OCXCHK",$J,OCXDF(37),84))
 Q 0
 ;
MCE91() ; Verify Event/Element: PATIENT WITH GLUCOPHAGE MED
 ;
 ;  OCXDF(103) -> PATIENT CURRENTLY ON GLUCOPHAGE data field
 ;  OCXDF(37) -> PATIENT IEN data field
 ;
 N OCXRES
 S OCXDF(37)=$G(DFN) I $L(OCXDF(37)) S OCXRES(91,37)=OCXDF(37)
 Q:'(OCXDF(37)) 0 I $D(^TMP("OCXCHK",$J,OCXDF(37),91)) Q $G(^TMP("OCXCHK",$J,OCXDF(37),91))
 S OCXRES(91)=0,OCXDF(103)=$P($$TAKEMED^ORKPS(OCXDF(37),"^GLUCOPHAGE^METFORMIN^AVANDAMET^METAGLIP"),"^",1) I $L(OCXDF(103)) S OCXRES(91,103)=OCXDF(103) I (OCXDF(103))
 E  Q 0
 S OCXRES(91)=11 M ^TMP("OCXCHK",$J,OCXDF(37),91)=OCXRES(91)
 Q +OCXRES(91)
 ;
MCE95() ; Verify Event/Element: POLYPHARMACY
 ;
 ;  OCXDF(37) -> PATIENT IEN data field
 ;
 N OCXRES
 S OCXDF(37)=$G(DFN) I $L(OCXDF(37)) S OCXRES(95,37)=OCXDF(37)
 Q:'(OCXDF(37)) 0 I $D(^TMP("OCXCHK",$J,OCXDF(37),95)) Q $G(^TMP("OCXCHK",$J,OCXDF(37),95))
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
