AGUTILS ;IHS/ASDS/TPF - PAT REG UTILITY ROUTINE ; 3/25/2004 8:25:20 AM
 ;;7.1;PATIENT REGISTRATION;**1,2,4,5**;JAN 31, 2007
 ;
 Q
UPDTEMAL(PATDFN) ;EP - UPDATE HISTORICAL EMAIL ADDRESS
 N ADDREC
 K DIE,DIC,DR,DA,DIR
 S DA(1)=PATDFN
 S DIC="^AUPNPAT("_DA(1)_",82,"
 S DIC(0)="L"
 S X=""""_DT_""""
 D ^DIC
 I Y<0 D  Q
 .W !!,"HISTORICAL EMAIL ADDRESS COULD NOT BE UPDATED!!"
 .K DIE,DIC,DR,DA,DIR
 .S DIR(0)="E"
 .D ^DIR
 S ADDREC=+Y
 N AGEMAIL
 S AGEMAIL=$$GET1^DIQ(9000001,PATDFN_",",1802)
 K DIE,DIC,DR,DA,DIR
 S DA=ADDREC
 S DA(1)=PATDFN
 S DIE="^AUPNPAT("_DA(1)_",82,"
 S DR=".02///^S X=AGEMAIL;"
 D ^DIE
 K DIE,DIC,DR,DA,DIR
 ;
 Q
 ;FORCE MEANS USE //// TO FORCE THE DATA INTO THE NEW FIELDS
 ;THIS IS USED ONLY ON THE POST INSTALL TO ACCEPT BAD DATA ENTERED BY SITES
 ;USUALLY INTO THE CITY FIELD. iF FORCE="F" THEN FORCE
UPDTHADD(PATDFN,FORCE) ;EP - UPDATE HISTORICAL ADDRESS FROM FILE #2 ADRESS FIELDS
 S FORCE=$G(FORCE)
 I FORCE="F" Q:$O(^AUPNPAT(PATDFN,83,0))  ;F MEANS CALLED FROM POST INSTALL. QUIT IF THEY ALREADY HAVE AN HIST. ADDRESS. TAKES CARE OF BETA SITES
 N ADDREC
 K DIE,DIC,DR,DA,DIR
 S DA(1)=PATDFN
 S DIC="^AUPNPAT("_DA(1)_",83,"
 S DIC(0)="L"
 S X=""""_DT_""""
 D ^DIC
 I Y<0 D  Q
 .W !!,"HISTORICAL ADDRESS COULD NOT BE UPDATED!!"
 .K DIE,DIC,DR,DA,DIR
 .S DIR(0)="E"
 .D ^DIR
 S ADDREC=+Y
 ;
 ;get the current ADDRESS VALUES
 N AGSTR1,STREET2,STREET3,CITY,STATE,ZIP,HPHONE
 S AGSTR1=$$GET1^DIQ(2,PATDFN_",",.111)
 S AGSTR2=$$GET1^DIQ(2,PATDFN_",",.112)
 S AGSTR3=$$GET1^DIQ(2,PATDFN_",",.113)
 S AGCITY=$$GET1^DIQ(2,PATDFN_",",.114)
 S AGSTATE=$$GET1^DIQ(2,PATDFN_",",.115)
 I $G(AGSTATE)'="" I AGSTATE'=+AGSTATE S AGSTATE=$O(^DIC(5,"B",AGSTATE,""))
 S AGZIP=$$GET1^DIQ(2,PATDFN_",",.116)
 S AGHPHONE=$$GET1^DIQ(2,PATDFN_",",.131)
 ;
 K DIE,DIC,DR,DA,DIR
 S DA=ADDREC
 S DA(1)=PATDFN
 S DIE="^AUPNPAT("_DA(1)_",83,"
 ;I FORCE="F" S DR=".02////AGSTR1;"
 I FORCE="F" S DR=".02////"_AGSTR1_";"
 E  S DR=".02///^S X=AGSTR1;"
 ;I FORCE="F" S DR=DR_".03////AGSTR2;"
 I FORCE="F" S DR=DR_".03////"_AGSTR2_";"
 E  S DR=DR_".03///^S X=AGSTR2;"
 ;I FORCE="F" S DR=DR_".04////AGSTR3;"
 I FORCE="F" S DR=DR_".04////"_AGSTR3_";"
 E  S DR=DR_".04///^S X=AGSTR3;"
 ;I FORCE="F" S DR=DR_".05////AGCITY;"
 I FORCE="F" S DR=DR_".05////"_AGCITY_";"
 E  S DR=DR_".05///^S X=AGCITY;"
 ;I FORCE="F" S DR=DR_".06////AGSTATE;"
 I FORCE="F" S DR=DR_".06////"_AGSTATE_";"
 E  S DR=DR_".06///^S X=AGSTATE;"
 ;I FORCE="F" S DR=DR_".07////AGZIP;"
 I FORCE="F" S DR=DR_".07////"_AGZIP_";"
 E  S DR=DR_".07///^S X=AGZIP;"
 ;I FORCE="F" S DR=DR_".08////AGHPHONE"
 I FORCE="F" S DR=DR_".08////"_AGHPHONE_""
 E  S DR=DR_".08///^S X=AGHPHONE"
 D ^DIE
 K DIE,DIC,DR,DA,DIR
 Q
 ;
 ;SEND ALERT MESSAGE
ALERTMSG(XMDUZ,XMY,XMSUB,XMTEXT) ;EP
 D ^XMD
 I $G(XMMG)'="" W !,XMMG H 2
 Q
WRAP(X,DIWL,DIWF) ;EP - WRAP TEXT #DEV DISPLAY
 K ^UTILITY($J,"W")
 D ^DIWP
 D ^DIWW
 Q
 ;IS MANDATORY SEQUENCING TURNED ON?
 ;FIELD ^AGFAC(D0,21)= (#2101) MANDATORY SEQUENCING IN REGISTRATION PARAMETER FILE
SEQMAN(FAC) ;EP - IS MANDATORY SEQUENCING TURNED ON?
 Q $P($G(^AGFAC(FAC,21)),U)
 ;DOES THE PATIENT HAVE A SEQUENCE SET UP?
PATSEQ(DFN) ;EP
 Q $D(^AUPNICP("C",DFN))
 ;DOES THE USER NEED TO SEQUENCE?
NEEDTOSQ(DFN,FAC) ;EP - DOES THE USER NEED TO SEQUENCE?
 N TRUE
 S TRUE=$$SEQMAN(FAC)&('$$PATSEQ(DFN))
 Q TRUE
 ;INPUT TRANSFORM FOR E-MAIL FIELDS. CHECK FOR VALID E-MAIL ADDRESS
EMAIL ;EP - CHECK FOR VALID E-MAIL ADDRESS
 N HOST,NAME
 ;CHECK FOR .EXT SHOULD BE 2 OR THREE CHARS AT THE END AFTER "."
 S EXTENT=$P(X,".",$L(X,"."))
 I $L(X)<3 K X Q            ;MINIMUM IS X@X
 I $L(X)>65 K X Q           ;TOTAL LENGTH CANNOT EXCEED 65
 I X'[("@") K X Q      ;GENERAL PATTERN OF 'XXXX@XXXX'
 I $L(X,"@")'=2 K X Q   ;MUST HAVE JUST ONE "@"
 S HOST=$P(X,"@",2)
 S NAME=$P(X,"@")
 ;NAME MUST END IN ALPHA OR NUMERIC
 I '($E(NAME,$L(NAME))?1A)&'($E(NAME,$L(NAME))?1N) K X Q
 ;HOST MUST BEGIN WITH ALPHA OR NUMERIC
 I '($E(HOST)?1A)&'($E(HOST)?1N) K X Q
 I HOST'[(".") K X Q
 ;THE FOLLOWING CHARACTER PAIRS ARE NOT ALLOWED
 I X[(".-") K X Q
 I X[("-.") K X Q
 I X[("-.") K X Q
 I X[("--") K X Q
 I X[("..") K X Q
 I X[("._") K X Q
 I X[("-_") K X Q
 I X[("_.") K X Q
 I X[("_-") K X Q
 I X[("__") K X Q
 ;THE FOLLOWING CHARACTERS ARE NOT ALLOWED
 I X[(",") K X Q
 I X[(";") K X Q
 I X[(":") K X Q
 I X[("(") K X Q
 I X[(")") K X Q
 I X[("=") K X Q
 I X[("+") K X Q
 I X[("!") K X Q
 I X[("<") K X Q
 I X[(">") K X Q
 I X[("?") K X Q
 I X[("/") K X Q
 I X[("\") K X Q
 Q
VALPHONE ;EP - CHECK FOR VALID PHONE ENTRY
 N GOOD,EXT
 S GOOD=0
 S REGPH=X
 I REGPH[("EXT") S REGPH=$TR($P(REGPH,"EXT")," ") I $TR($P(X,"EXT",2)," ")="" S X=REGPH
 I REGPH[("ext") S REGPH=$TR($P(REGPH,"ext")," ") I $TR($P(X,"ext",2)," ")="" S X=REGPH
 S GOOD=REGPH?4N I GOOD Q  ;extension only
 S GOOD=REGPH?3N1"-"4N I GOOD Q
 S GOOD=REGPH?3N1"-"3N1"-"4N I GOOD Q
 S GOOD=REGPH?1"("3N1")"3N1"-"4N I GOOD Q
 S GOOD=REGPH?1"("3N1")"3N1"."4N I GOOD Q
 S GOOD=REGPH?3N1"."4N I GOOD Q
 S GOOD=REGPH?3N1"."3N1"."4N I GOOD Q
 S GOOD=REGPH?3N1"."3N1"."4N I GOOD Q
 ;NO PROPER PATTERN FOUND
 K X
 Q
VERIF ;EP - DO VERIFIED BY LINE
 I $P($G(^AUPNPAT(DFN,0)),U,12)'="",$P($G(^AUPNPAT(DFN,0)),U,3)'="" D
 . W !,"Last edited by: ",$P($G(^VA(200,$P($G(^AUPNPAT(DFN,0)),U,12),0)),U)," on ",$$FMTE^XLFDT($P($G(^AUPNPAT(DFN,0)),U,3),1)
 Q
VERIF2 ;EP - DO VERIFIED BY LINE FOR INSURANCE SUMMARY SCREEN
 I $P($G(CATREC),U,9)'="" D
 . W !,"Last edited by: ",$P($G(^VA(200,$P(CATREC,U,9),0)),U)," on ",$$FMTE^XLFDT($P(CATREC,U,10),1)
 Q
 ;RTNTAG - TAG IN AGINS TO CALL. SPECIFIC TO TYPE OF INSURER
 ;AGINS - STANDARD AGINS ARRAY
UPDTSEL(AGINS,COMPIEN,INSIEN) ;EP - UPDATE SELECTION
 ;S SEL=0 K AGINS ;S RTN=RTNTAG_"^AGINS(DFN)" D @RTN
 D ^AGINS
 Q:$G(COMPIEN)="" ""  ;ERROR UNREPORTED BY GIMC 11/8/2005
 ;I $G(AGANS) D
 ;.;S AGSELECT=$G(AGINSNN(AGANS))  ;RESET BACK TO THE NOW UPDATED AGINSNN( ENTRY
 ;.;I AGSELECT="" S AGSELECT=$G(AGINSNN(AGANS,1))  ;MEDICARE
 ;.S AGSELECT=$G(AGINS(AGANS))
 ;E  S AGSELECT=$$FINDNEW(.AGINSSN,COMPIEN)  ;IF AGANS NOT DEFINED THEN THIS IS A NEW ENTRY
 ;E  S AGSELECT=$$FINDNEW(.AGINS,COMPIEN) 
 S AGSELECT=$$FINDNEW(.AGINSNN,COMPIEN,INSIEN)
 Q AGSELECT
 ;FIND NEW ENTRY IN AGINSSN BASED ON THE IEN VARIABLES
 ;FINDNEW(AGINSSN,COMPIEN) ;EP
 ;N REC,FOUND
 ;S REC="",FOUND=0,RETURN=""
 ;F  S REC=$O(AGINSNN(REC)) Q:REC=""  D  Q:FOUND
 ;.I $P($G(AGINSNN(REC)),U,11)=COMPIEN S FOUND=1,RETURN=AGINSNN(REC)
 ;.;IF ENTRY IS MEDICARE THEN AGINSNN(1,1) OR AGINSNN(1,2) MAY EXIST
 ;Q RETURN
FINDNEW(AGINSNN,COMPIEN,INSIEN) ;EP - AG*7.1*1 IM18549 ORIGINALLY REPORTED AS
 ;A PROBLEM WITH PRIVATE INSURANCE. THIS COULD HAVE BEEN A PROBLEM WITH ANY OF THE INS. GUIVEN THE
 ;RIGHT CONDITIONS.
 N REC,FOUND
 S REC="AGINSNN(0)",FOUND=0,RETURN=""
 F  S REC=$Q(@REC) Q:REC=""  D  Q:FOUND
 .I $P($G(@REC),U,4)'="G" D
 ..I $P($G(@REC),U,11)=COMPIEN,($P($G(@REC),U,2)=INSIEN) S FOUND=1,RETURN=@REC
 .I $P($G(@REC),U,4)="G" D
 ..I $P($G(@REC),U,11)=COMPIEN,($P($G(@REC),U,2)=INSGLO_INSIEN) S FOUND=1,RETURN=@REC
 .;I $G(INSIEN)'="" I $P($G(AGINSNN(REC)),U,2)'=INSIEN S FOUND=0, RETURN=""
 Q RETURN
 ;DISPLAYS PROGRAMMER INFORMATION ON SCREEN. THIS IS FOR USE IN
 ;EDIT SCREEN ONLY AT THIS TIME
PROGVIEW(DUZ,SUBS) ;EP - DISPLAYS PROGRAMMER INFORMATION ON SCREEN
 Q:'$D(^XUSEC("AGZPROG",DUZ))
 S SUBS=$G(SUBS)
 N AGPIECE,INDENT
 W !,"|--------------------PROGRAMMER INFORMATION VIEW-------------------------------|"
 W !,"|ED SCR RTN=",$G(ROUTID),?25,"DFN=",$G(DFN),?79,"|"
 W !,"|ED CHK SCR=",$G(AG("PG")),?25,"AUPNPAT=",$G(AUPNPAT),?79,"|"
 W !,"|"
 S INDENT=0
 I SUBS D
 .F AGPIECE=1:1 Q:$P(SUBS,",",AGPIECE)=""  D
 ..W ?INDENT,"SUB"_AGPIECE_"=",$P(SUBS,",",AGPIECE)
 ..S INDENT=INDENT+25
 W ?79,"|"
 W !,"|------------------------------------------------------------------------------|"
 W !
 Q
 ;CREATE AN "EDIT" LINE SHOWING USER HOW MANY SPACES TO ENTER FOR
 ;A FREE TEXT FIELD
NOTELINE(FIELDNUM,FILENUM,D0,LENGTH) ;EP -
 ;SAMPLE CALL
 ;W $$NOTELINE^AGUTILS(106,9000041.0101,1_","_5571_",",45)
 N STRING,LABEL,DATALEN
 S LABELLEN=$L($P($G(^DD(FILENUM,FIELDNUM,0)),U))
 S DATALEN=$L($$GET1^DIQ(FILENUM,D0,FIELDNUM,"E"))
 I DATALEN>19 Q ""  ;DON'T EVEN TRY. IF ITS GRETAER THAN 19 THE "Replace" FUNCTION KICKS IN
 I DATALEN'=0 S DATALEN=DATALEN+2     ;IF DATA PRESENT ADD 2 FOR "//"
 S TOTINDEN=DATALEN+LABELLEN+2   ;ADD TWO FOR COLON AND SPACE
 S $P(SPACER," ",TOTINDEN+1)=""
 S $P(STRING,"-",LENGTH+1)=""
 Q SPACER_"|"_STRING_"|"
 ;CENTER TEXT
CENTER(X) ;EP - CENTER TEXT
 S CENTER=IOM/2
 W ?CENTER-($L(X)/2),X
 Q
 ;CHECK IF 1111 FIELD CONTAINS "NON-INDIAN"
ISNONIND(DFN) ;EP - CHECK IF 1111 FIELD CONTAINS "NON-INDIAN"
 N PTR
 S PTR=$P($G(^AUPNPAT(DFN,11)),U,11)
 Q:PTR="" 1
 Q $P($G(^AUTTBEN(PTR,0)),U)[("NON-INDIAN")
 ;ARE THERE ACTIVE POLICY MEMBERS ASSOCIATED WITH THIS POLICY HOLDER?
 ;ADDED TO STRENGTHEN CHANGES MADE BECAUSE OF
 ;BEGIN IM16640
ACTPOLME(PH) ;EP - ARE THERE ACTIVE POLICY MEMBERS ASSOCIATED WITH THIS POLICY HOLDER?
 N PHPTR,POLMEM,PRVT0,PRVTINS,ACTIVE
 S POLMEM=""
 S ACTIVE=0
 F  S POLMEM=$O(^AUPNPRVT("C",PH,POLMEM)) Q:POLMEM=""!(ACTIVE)  D
 .S PRVTINS=""
 .F  S PRVTINS=$O(^AUPNPRVT("C",PH,POLMEM,PRVTINS)) Q:PRVTINS=""!(ACTIVE)  D
 ..S PRVT11=$G(^AUPNPRVT(POLMEM,11,PRVTINS,0))
 ..S POLHOLD0=$G(^AUPN3PPH(PH,0))
 ..S MEM=$P(POLHOLD0,U,2)
 ..Q:MEM=POLMEM  ;IGNORE POLICY HOLDER
 ..S EFFDATE=$P(PRVT11,U,6)
 ..S ENDDATE=$P(PRVT11,U,7)
 ..Q:'$$ISACTIVE(EFFDATE,ENDDATE)
 ..;IF NOT POLICY HOLDER AND POLICY ACTIVE THEN RETURN TRUE
 ..S ACTIVE=1
 Q ACTIVE
ISACTIVE(EFFDT,ENDDT) ;EP - DETERMINE WHETHER THE POLICY IS ACTIVE AS OF TODAY
 N OPENEND
 I EFFDT="",(ENDDT="") Q 0  ;NO DATES CONSIDERED INACTIVE
 S ENDDT=ENDDT  ;TRUE IF END DATE IS AT COB OF END DATE - ANSWER FROM
 ;ADRIAN IS IT IS IN FORCE FOR ALL OF TODAY
 S OPENEND=ENDDT=""
 I OPENEND I DT=EFFDT!(DT>EFFDT) Q 1
 I DT=EFFDT!(DT=ENDDT) Q 1
 I DT>EFFDT&(DT<ENDDT) Q 1
 Q 0
 ;RETURNS TRUE IF THERE ARE NO ACTIVE POLICY MEMBERS BESIDES POLICY HOLDER
NOPOLMEM(PH) ;EP - RETURNS TRUE IF THERE ARE NO ACTIVE POLICY MEMBERS BESIDES POLICY HOLDER
 N PHPTR,POLMEM,PRVT0,PRVTINS,ACTIVE
 S POLMEM=""
 S ACTIVE=0
 F  S POLMEM=$O(^AUPNPRVT("C",PH,POLMEM)) Q:POLMEM=""!(ACTIVE)  D
 .S PRVTINS=""
 .F  S PRVTINS=$O(^AUPNPRVT("C",PH,POLMEM,PRVTINS)) Q:PRVTINS=""!(ACTIVE)  D
 ..S PRVT11=$G(^AUPNPRVT(POLMEM,11,PRVTINS,0))
 ..S POLHOLD0=$G(^AUPN3PPH(PH,0))
 ..S MEM=$P(POLHOLD0,U,2)
 ..Q:MEM=POLMEM  ;IGNORE POLICY HOLDER
 ..S EFFDATE=$P(PRVT11,U,6)
 ..S ENDDATE=$P(PRVT11,U,7)
 ..Q:'$$ISACTIVE(EFFDATE,ENDDATE)
 ..;IF NOT POLICY HOLDER AND POLICY ACTIVE THEN RETURN TRUE
 ..S ACTIVE=1
 Q 'ACTIVE
 ;RETURNS THE "DATE ESTABLISHED" OR "DATE OF LAST REG. UPDATE" FOR DISPLAY ON EDIT SCREENS
DTEST(AGDFN) ;EP - RETURNS THE "DATE ESTABLISHED" OR "DATE OF LAST REG. UPDATE" FOR DISPLAY
 Q:'AGDFN ""
 S Y=$P($G(^AUPNPAT(AGDFN,0)),U,3)   ;DATE OF LAST REG. UPDATE
 D DD^%DT
 Q:Y'="" "(upd:"_Y_")"
 S Y=$P($G(^AUPNPAT(AGDFN,0)),U,2)
 D DD^%DT
 Q:Y'="" "(est:"_Y_")"
 Q "(est:unknown)"
 ;
 ;FIND SINGLE PATIENTS WITH 'SPOUSES EMPLOYER"
SPOUSE ;EP
 K EMPL S EMP="" F  S EMP=$O(^AUPNPAT("AG",EMP)) Q:'EMP  D
 .S DFN="" F  S DFN=$O(^AUPNPAT("AG",EMP,DFN)) Q:'DFN  D
 ..Q:$P($G(^DPT(DFN,.35)),U)  Q:$P($G(^AUPNPAT(DFN,41,DUZ(2),0)),U,3)
 ..S MS=$$GET1^DIQ(2,DFN_",",.05,"E") Q:MS="MARRIED"
 ..S SPEMP=$$GET1^DIQ(9000001,DFN_",",.22,"E") S HRN=$P($G(^AUPNPAT(DFN,41,DUZ(2),0)),U,2)
 ..S EMPL(SPEMP)=$G(EMPL(SPEMP))+1 S EMPL(SPEMP,HRN)=""
 Q
 ;NEW SUBROUTINE IHS/SD/TPF AG*7.1*1 ITEM 18
 ;IS PATIENT A MINOR <18
ISMINOR(DFN) ;EP - CHECK IF PATIENT IS A MINOR <18
 Q:'DFN 1
 S D0=DFN
 X $P($G(^DD(2,.033,0)),U,5,299)  ;GET AGE
 Q X<$G(AGOPT("AGE OF MINOR"))  ;HARD CODED PER SANDRI LAHI
 ;BEGIN NEW CODE IHS/SD/TPF 5/2/2006 AG*7.1*2 PAGE 12 ITEM 3
AGE(AGPATDFN) ;EP - RETURN AGE
 S D0=DFN X $P($G(^DD(2,.033,0)),U,5,299)
 Q X
TESTAPI ;EP -
 S X=$$F111^AGAPIPAT(5571,"TEST NEW ADDRESS")
 Q
 ;END NEW CODE
UPPER(STR) ;EP - CHANGE LOWER TO UPPER
 Q $TR(STR,"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")
 ;SUBROUTINE COPIED FROM AGED51 (WRITTEN BY GEORGE HUGGINS)
USED(DFN,AGINSPTR,AGP,AGDA,AGMCDDA) ;EP - Is this Eligibility date record used in a 3P Bill or Claim?
 ;;@;*7
 ;;@;IORVON
 ;;WARNING :
 ;;@;IORVOFF
 ;;          You have selected an Eligibility Date Record that is used
 ;;          by
 ;;@;AGBILL
 ;;          in 3PB. Modifying or deleting this Eligibility
 ;;          Date Record will degrade the integrity of your database
 ;;          and could adversely effect revenue recovery through 3PB!!
 ;;###
 ;
 NEW AGBILL,AGDUZ2,AGUSED,AG13,Y
 S (AGBILL,AGDUZ2,AGUSED)=0
 ;Check all Pt's bills.
 F  S AGDUZ2=$O(^ABMDBILL(AGDUZ2)) Q:'AGDUZ2  D  Q:AGUSED
 . F  S AGBILL=$O(^ABMDBILL(AGDUZ2,"D",DFN,AGBILL)) Q:'AGBILL  D  Q:AGUSED
 .. I $P(^ABMDBILL(AGDUZ2,AGBILL,0),U,4)="X" Q  ;Cancelled.
 .. S AG13=0
 .. F  S AG13=$O(^ABMDBILL(AGDUZ2,AGBILL,13,AG13)) Q:'AG13  D  Q:AGUSED
 ... ;Same multiple?
 ... ;Q:'($P(^ABMDBILL(AGDUZ2,AGBILL,13,AG13,0),U,AGP)=AGDA)
 ... Q:'($P($G(^ABMDBILL(AGDUZ2,AGBILL,13,AG13,0)),U,AGP)=AGDA)  ;IM21932 ZERO NODE MISSING FOR INSURER
 ... ;If MCD, same IEN?
 ... I AGP=7,'($P(^ABMDBILL(AGDUZ2,AGBILL,13,AG13,0),U,6)=AGMCDDA) Q
 ... S AGUSED=$P(^ABMDBILL(AGDUZ2,AGBILL,0),U)_" ("_$P(^DIC(4,AGDUZ2,0),U)_")" ; Bill number (Site).
 ...Q
 ..Q
 .Q
 I AGUSED Q "Bill # "_AGUSED
 ;
 S (AGBILL,AGDUZ2,AGUSED)=0
 ;Check all Pt's claims.
 F  S AGDUZ2=$O(^ABMDCLM(AGDUZ2)) Q:'AGDUZ2  D  Q:AGUSED
 . F  S AGBILL=$O(^ABMDCLM(AGDUZ2,"B",DFN,AGBILL)) Q:'AGBILL  D  Q:AGUSED
 .. S AG13=0
 .. F  S AG13=$O(^ABMDCLM(AGDUZ2,AGBILL,13,AG13)) Q:'AG13  D  Q:AGUSED
 ... ;Same multiple?
 ... ;Q:'($P(^ABMDCLM(AGDUZ2,AGBILL,13,AG13,0),U,AGP)=AGDA)
 ... Q:'($P($G(^ABMDCLM(AGDUZ2,AGBILL,13,AG13,0)),U,AGP)=AGDA)  ;IM21932 ZERO NODE MISSING FOR INSURER
 ... ;If MCD, same IEN?
 ... I AGP=7,'($P(^ABMDCLM(AGDUZ2,AGBILL,13,AG13,0),U,6)=AGMCDDA) Q
 ... S AGUSED=AGBILL_" ("_$P(^DIC(4,AGDUZ2,0),U)_")" ;Claim number (Site).
 ...Q
 ..Q
 .Q
 I AGUSED Q "Claim # "_AGUSED
 Q ""
 ;
 ; MEDICARE MULTIPLE (NJ6,0), [0;4]
 ; RAILROAD MULTIPLE (NJ6,0), [0;5]
 ; MEDICAID ELIG POINTER (*P9000004'), [0;6]
 ; MEDICAID MULTIPLE (NJ4,0), [0;7]
 ; PRIVATE INSURANCE MULTIPLE (NJ6,0), [0;8]