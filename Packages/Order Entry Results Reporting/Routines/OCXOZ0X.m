OCXOZ0X ;SLC/RJS,CLA - Order Check Scan ;OCT 20,2005 at 22:40
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
R61R1A ; Verify all Event/Elements of  Rule #61 'CREATININE CLEARANCE ESTIMATION'  Relation #1 'IF CREAT CLEAR AND ( CREATININE CLEARANCE DATE OR ...'
 ;  Called from EL73+5^OCXOZ0H, and EL96+5^OCXOZ0H, and EL97+5^OCXOZ0H.
 ;
 Q:$G(OCXOERR)
 ;
 ;      Local Extrinsic Functions
 ; MCE73( ----------->  Verify Event/Element: 'CREATININE CLEARANCE ESTIMATE'
 ; MCE96( ----------->  Verify Event/Element: 'CREATININE CLEARANCE DATE/TIME'
 ; MCE97( ----------->  Verify Event/Element: 'RENAL RESULTS'
 ;
 Q:$G(^OCXS(860.2,61,"INACT"))
 ;
 I $$MCE73 D 
 .I $$MCE96 D R61R1B
 .I $$MCE97 D R61R1B
 Q
 ;
R61R1B ; Send Order Check, Notication messages and/or Execute code for  Rule #61 'CREATININE CLEARANCE ESTIMATION'  Relation #1 'IF CREAT CLEAR AND ( CREATININE CLEARANCE DATE OR ...'
 ;  Called from R61R1A+13.
 ;
 Q:$G(OCXOERR)
 ;
 ;      Local Extrinsic Functions
 ; GETDATA( ---------> GET DATA FROM THE ACTIVE DATA FILE
 ;
 Q:$D(OCXRULE("R61R1B"))
 ;
 N OCXNMSG,OCXCMSG,OCXPORD,OCXFORD,OCXDATA,OCXNUM,OCXDUZ,OCXQUIT,OCXLOGS,OCXLOGD
 I ($G(OCXOSRC)="CPRS ORDER PRESCAN") S OCXCMSG=(+OCXPSD)_"^1^^Est. CrCl: "_$$GETDATA(DFN,"73^96^97",76)_" ("_$$GETDATA(DFN,"73^96^97",64)_")  [Est. CrCl based on modified Cockcroft-Gault equation using Adjusted Body Weight (if ht > 60 in.)]" I 1
 E  S OCXCMSG="Est. CrCl: "_$$GETDATA(DFN,"73^96^97",76)_" ("_$$GETDATA(DFN,"73^96^97",64)_")  [Est. CrCl based on modified Cockcroft-Gault equation using Adjusted Body Weight (if ht > 60 in.)]"
 S OCXNMSG=""
 ;
 Q:$G(OCXOERR)
 ;
 ; Send Order Check Message
 ;
 S OCXOCMSG($O(OCXOCMSG(999999),-1)+1)=OCXCMSG
 Q
 ;
CRCL(DFN) ;  Compiler Function: CREATININE CLEARANCE (ESTIMATED/CALCULATED)
 ;
 N HT,AGE,SEX,SCR,SCRD,CRCL,LRWKLD,RSLT,ORW,ORH,PSCR
 N HTGT60,ABW,IBW,BWRATIO,BWDIFF,LOWBW,ADJBW
 S RSLT="0^<Unavailable>"
 S PSCR="^^^^^^0"
 D VITAL^ORQQVI("WEIGHT","WT",DFN,.ORW,0,"",$$NOW^XLFDT)
 Q:'$D(ORW) RSLT
 S ABW=$P(ORW(1),U,3) Q:+$G(ABW)<1 RSLT
 S ABW=ABW/2.2  ;ABW (actual body weight) in kg
 D VITAL^ORQQVI("HEIGHT","HT",DFN,.ORH,0,"",$$NOW^XLFDT)
 Q:'$D(ORH) RSLT
 S HT=$P(ORH(1),U,3) Q:+$G(HT)<1 RSLT
 S AGE=$$AGE^ORQPTQ4(DFN) Q:'AGE RSLT
 S SEX=$P($$SEX^ORQPTQ4(DFN),U,1) Q:'$L(SEX) RSLT
 S OCXTL="" Q:'$$TERMLKUP^ORB31(.OCXTL,"SERUM CREATININE") RSLT
 S OCXTLS="" Q:'$$TERMLKUP^ORB31(.OCXTLS,"SERUM SPECIMEN") RSLT
 S SCR="",OCXT=0 F  S OCXT=$O(OCXTL(OCXT)) Q:'OCXT  D
 .S OCXTS=0 F  S OCXTS=$O(OCXTLS(OCXTS)) Q:'OCXTS  D
 ..S SCR=$$LOCL^ORQQLR1(DFN,$P(OCXTL(OCXT),U),$P(OCXTLS(OCXTS),U))
 ..I $P(SCR,U,7)>$P(PSCR,U,7) S PSCR=SCR
 S SCR=PSCR,SCRV=$P(SCR,U,3) Q:+$G(SCRV)<.01 RSLT
 S SCRD=$P(SCR,U,7) Q:'$L(SCRD) RSLT
 ;
 S HTGT60=$S(HT>60:(HT-60)*2.3,1:0)  ;if ht > 60 inches
 I HTGT60>0 D
 .S IBW=$S(SEX="M":50+HTGT60,1:45.5+HTGT60)  ;Ideal Body Weight
 .S BWRATIO=(ABW/IBW)  ;body weight ratio
 .S BWDIFF=$S(ABW>IBW:ABW-IBW,1:0)
 .S LOWBW=$S(IBW<ABW:IBW,1:ABW)
 .I BWRATIO>1.3,(BWDIFF>0) S ADJBW=((0.3*BWDIFF)+IBW)
 .E  S ADJBW=LOWBW
 I +$G(ADJBW)<1 D
 .S ADJBW=ABW
 S CRCL=(((140-AGE)*ADJBW)/(SCRV*72))
 ;
 S:SEX="M" RSLT=SCRD_U_$J(CRCL,1,1)
 S:SEX="F" RSLT=SCRD_U_$J((CRCL*.85),1,1)
 Q RSLT
 ;
DT2INT(OCXDT) ;      This Local Extrinsic Function converts a date into an integer
 ; By taking the Years, Months, Days, Hours and Minutes converting
 ; Them into Seconds and then adding them all together into one big integer
 ;
 Q:'$L($G(OCXDT)) ""
 N OCXDIFF,OCXVAL S (OCXDIFF,OCXVAL)=0
 ;
 I $L(OCXDT),'OCXDT,(OCXDT[" at ") D  ; EXTERNAL EXPERT SYSTEM FORMAT 1 TO EXTERNAL FORMAT
 .N OCXHR,OCXMIN,OCXTIME
 .S OCXTIME=$P($P(OCXDT," at ",2),".",1),OCXHR=$P(OCXTIME,":",1),OCXMIN=$P(OCXTIME,":",2)
 .S:(OCXDT["Midnight") OCXHR=00
 .S:(OCXDT["PM") OCXHR=OCXHR+12
 .S OCXDT=$P(OCXDT," at ")_"@"_$E(OCXHR+100,2,3)_$E(OCXMIN+100,2,3)
 ;
 I $L(OCXDT),(OCXDT?1.2N1"/"1.2N.1" ".2N.1":".2N) D  ; EXTERNAL EXPERT SYSTEM FORMAT 2 TO EXTERNAL FORMAT
 .N OCXMON
 .S OCXMON=$P("January^February^March^April^May^June^July^August^September^October^November^December",U,$P(OCXDT,"/",1))
 .I $L($P(OCXDT," ",2)) S OCXDT=OCXMON_" "_$P($P(OCXDT," ",1),"/",2)_"@"_$TR($P(OCXDT," ",2),":","")
 .E  S OCXDT=OCXMON_" "_$P($P(OCXDT," ",1),"/",2)
 ;
 I $L(OCXDT),(OCXDT?1.2N1"/"1.2N1"/"1.2N.1" ".2N.1":".2N) D  ; EXTERNAL EXPERT SYSTEM FORMAT 3 TO EXTERNAL FORMAT
 .N OCXMON
 .S OCXMON=$P("January^February^March^April^May^June^July^August^September^October^November^December",U,$P(OCXDT,"/",1))
 .I $L($P(OCXDT," ",2)) S OCXDT=OCXMON_" "_$P($P(OCXDT," ",1),"/",2)_","_$P($P(OCXDT," ",1),"/",3)_"@"_$TR($P(OCXDT," ",2),":","")
 .E  S OCXDT=OCXMON_" "_$P($P(OCXDT," ",1),"/",2)_", "_$P($P(OCXDT," ",1),"/",3)
 ;
 I $L(OCXDT),'OCXDT D  ; EXTERNAL FORMAT TO INTERNAL FILEMAN FORMAT
 .I (OCXDT["@0000") S OCXDT=$P(OCXDT,"@",1),OCXDIFF=1
 .N %DT,X,Y S X=OCXDT,%DT="" S:(OCXDT["@")!(OCXDT="N") %DT="T" D ^%DT S OCXDT=+Y
 ;
 I ($L(OCXDT\1)>7) S OCXDT=$$HL7TFM^XLFDT(OCXDT)  ; HL7 FORMAT TO INTERNAL FILEMAN FORMAT
 ;
 I ($L(OCXDT\1)=7) S OCXDT=$$FMTH^XLFDT(+OCXDT)   ; INTERNAL FILEMAN FORMAT TO $H FORMAT
 ;
 I (OCXDT?5N1","1.5N) S OCXVAL=(OCXDT*86400)+$P(OCXDT,",",2)     ;  $H FORMAT TO EXPERT SYSTEM INTERNAL FORMAT
 ;
 Q OCXVAL
 ;
FLAB(DFN,OCXLIST,OCXSPEC) ;  Compiler Function: FORMATTED LAB RESULTS
 ;
 Q:'$G(DFN) "<Patient Not Specified>"
 Q:'$L($G(OCXLIST)) "<Lab Tests Not Specified>"
 N OCXLAB,OCXOUT,OCXPC,OCXSL,SPEC S OCXOUT="",SPEC=""
 I $L($G(OCXSPEC)) S OCXSL=$$TERMLKUP(OCXSPEC,.OCXSL)
 F OCXPC=1:1:$L(OCXLIST,U) S OCXLAB=$P(OCXLIST,U,OCXPC) I $L(OCXLAB) D
 .N OCXX,OCXY,X,Y,DIC,TEST,SPEC,OCXTL,OCXA,OCXR
 .S OCXTL="" Q:'$$TERMLKUP(OCXLAB,.OCXTL)
 .S OCXX="",TEST=0 F  S TEST=$O(OCXTL(TEST)) Q:'TEST  D
 ..I $L($G(OCXSL)) D
 ...S SPEC=0 F  S SPEC=$O(OCXSL(SPEC)) Q:'SPEC  D
 ....S OCXX=$$LOCL^ORQQLR1(DFN,TEST,SPEC) I $L(OCXX) D
 .....S OCXA($P(OCXX,U,7))=OCXX
 ..I '$L($G(OCXSL)) S OCXX=$$LOCL^ORQQLR1(DFN,TEST,"")
 ..Q:'$L(OCXX)
 .I $D(OCXA) S OCXR="",OCXR=$O(OCXA(OCXR),-1),OCXX=OCXA(OCXR)
 .I $L(OCXX) D
 ..S OCXY=$P(OCXX,U,2)_": "_$P(OCXX,U,3)_" "_$P(OCXX,U,4)
 ..S OCXY=OCXY_" "_$S($L($P(OCXX,U,5)):"["_$P(OCXX,U,5)_"]",1:"")
 ..I $L($P(OCXX,U,7)) S OCXY=OCXY_" "_$$FMTE^XLFDT($P(OCXX,U,7),"2P")
 .S:$L(OCXOUT) OCXOUT=OCXOUT_"   " S OCXOUT=OCXOUT_$G(OCXY)
 Q:'$L(OCXOUT) "<Results Not Found>" Q OCXOUT
 ;
GETDATA(DFN,OCXL,OCXDFI) ;     This Local Extrinsic Function returns runtime data
 ;
 N OCXE,VAL,PC S VAL=""
 F PC=1:1:$L(OCXL,U) S OCXE=$P(OCXL,U,PC) I OCXE S VAL=$G(^TMP("OCXCHK",$J,DFN,OCXE,OCXDFI)) Q:$L(VAL)
 Q VAL
 ;
MCE73() ; Verify Event/Element: CREATININE CLEARANCE ESTIMATE
 ;
 ;  OCXDF(37) -> PATIENT IEN data field
 ;
 N OCXRES
 S OCXDF(37)=$G(DFN) I $L(OCXDF(37)) S OCXRES(73,37)=OCXDF(37)
 Q:'(OCXDF(37)) 0 I $D(^TMP("OCXCHK",$J,OCXDF(37),73)) Q $G(^TMP("OCXCHK",$J,OCXDF(37),73))
 Q 0
 ;
MCE96() ; Verify Event/Element: CREATININE CLEARANCE DATE/TIME
 ;
 ;  OCXDF(76) -> CREATININE CLEARANCE (ESTIM) VALUE data field
 ;  OCXDF(64) -> FORMATTED RENAL LAB RESULTS data field
 ;  OCXDF(77) -> CREATININE CLEARANCE (ESTIM) DATE data field
 ;  OCXDF(37) -> PATIENT IEN data field
 ;
 N OCXRES
 S OCXDF(37)=$G(DFN) I $L(OCXDF(37)) S OCXRES(96,37)=OCXDF(37)
 Q:'(OCXDF(37)) 0 I $D(^TMP("OCXCHK",$J,OCXDF(37),96)) Q $G(^TMP("OCXCHK",$J,OCXDF(37),96))
 S OCXRES(96)=0,OCXDF(77)=$$DT2INT($P($$CRCL(OCXDF(37)),"^",1)) I $L(OCXDF(77)) S OCXRES(96,77)=OCXDF(77) I (OCXDF(77)>$$DT2INT(0))
 E  Q 0
 S OCXDF(64)=$$FLAB(OCXDF(37),"SERUM CREATININE^SERUM UREA NITROGEN","SERUM SPECIMEN"),OCXDF(76)=$P($$CRCL(OCXDF(37)),"^",2),OCXRES(96)=11 M ^TMP("OCXCHK",$J,OCXDF(37),96)=OCXRES(96)
 Q +OCXRES(96)
 ;
MCE97() ; Verify Event/Element: RENAL RESULTS
 ;
 ;  OCXDF(76) -> CREATININE CLEARANCE (ESTIM) VALUE data field
 ;  OCXDF(64) -> FORMATTED RENAL LAB RESULTS data field
 ;  OCXDF(37) -> PATIENT IEN data field
 ;
 N OCXRES
 S OCXDF(37)=$G(DFN) I $L(OCXDF(37)) S OCXRES(97,37)=OCXDF(37)
 Q:'(OCXDF(37)) 0 I $D(^TMP("OCXCHK",$J,OCXDF(37),97)) Q $G(^TMP("OCXCHK",$J,OCXDF(37),97))
 S OCXRES(97)=0,OCXDF(64)=$$FLAB(OCXDF(37),"SERUM CREATININE^SERUM UREA NITROGEN","SERUM SPECIMEN") I '(OCXDF(64)="<Results Not Found>")
 E  Q 0
 S OCXDF(76)=$P($$CRCL(OCXDF(37)),"^",2),OCXRES(97)=11 M ^TMP("OCXCHK",$J,OCXDF(37),97)=OCXRES(97)
 Q +OCXRES(97)
 ;
TERMLKUP(OCXTERM,OCXLIST) ;
 Q $$TERM^OCXOZ01(OCXTERM,.OCXLIST)
 ;
