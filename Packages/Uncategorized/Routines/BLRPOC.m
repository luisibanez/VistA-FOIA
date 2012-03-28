BLRPOC ;IHS/MSC/PLS - EHR POC Component support ;JUL 06, 2010 3:14 PM
 ;;5.2;IHS LABORATORY;**1025,1026,1027,1028**;NOV 01, 1997;Build 46
 ; 
 Q
POCTSTS(DATA,DIV,LOC,USR,DFN) ;EP-
 D:$P($G(^BLRSITE($G(DUZ(2)),0)),"^",10) ENTRYAUD^BLRUTIL("POCTSTS^BLRPOC 0.0","DATA","DIV")
 ;
 S DIV=$G(DIV,$G(DUZ(2)))  ; default to user's current division
 N LP,TST,CNT
 S (CNT,LP)=0 F  S LP=$O(^BLRPOC(90479,DIV,1,LP)) Q:'LP  D
 .; If enforce restrict to location is 'yes', check if it passes the restriction
 .I $$GET1^DIQ(90479,DIV,.02,"I"),'$$LOCMATCH(LP,+$G(DIV),+$G(LOC)) Q
 .; If enforce restrict to user is 'yes', check if it passes the restriction
 .I $$GET1^DIQ(90479,DIV,.03,"I"),'$$USRMATCH(LP,+$G(DIV),+$G(USR)) Q
 .S CNT=CNT+1
 .;S TST=+^BLRPOC(90479,DIV,1,LP,0)
 .S TST=+$G(^BLRPOC(90479,DIV,1,LP,0)) ; LR*5.2*1026 - Naked Reference fix
 .I '$$CHKTST(TST) Q    ; Check test for any issues.
 .S DATA(CNT,"tst")=$$GETTST(TST,DFN)
 Q
 ;
GETTST(TST,DFN) ;EP-
 N TSTNM,COL,COLNM,SPEC,REFL,REFH,UNITS,CHKVAL
 S Y=DFN D ^AUPNPAT
 S TSTNM=$$GET1^DIQ(60,TST,.01)
 S COL=$$UNQCOL(TST)
 S COLNM=$$GET1^DIQ(62,COL,.01,"I")
 S SPEC=$$GET1^DIQ(62,COL,2,"I")
 S REFL=$$GET1^DIQ(60.01,SPEC_","_TST_",",1,"I")
 S REFL=$$REFRES(REFL)
 S REFH=$$GET1^DIQ(60.01,SPEC_","_TST_",",2,"I")
 S REFH=$$REFRES(REFH)
 S UNITS=$$GET1^DIQ(60.01,SPEC_","_TST_",",6,"I")
 ;S UNITS=$$GET1^DIQ(60.01,SPEC_","_TST_",",6,"I") I UNITS=+UNITS S UNITS=$P(^BLRUCUM(UNITS,0),U,3)
 D:$P($G(^BLRSITE($G(DUZ(2)),0)),"^",10) ENTRYAUD^BLRUTIL("GETTST^BLRPOC 9.0","DATA","DIV")
 Q TST_U_TSTNM_U_$$ISPANEL(TST)_U_COL_U_COLNM_U_REFL_U_REFH_U_UNITS
 ;
UNQCOL(IEN) ;EP - RETURN 1st COLLECTION SAMPLE
 N SMP
 S SMP=+$O(^LAB(60,IEN,3,0))
 ; Q +^LAB(60,IEN,3,SMP,0)
 Q +$G(^LAB(60,IEN,3,SMP,0)) ; LR*5.2*1026 - Naked Reference
 ;
ISPANEL(IEN) ;EP- Returns boolean flag indicating if test is a panel test
 Q ('+$G(^LAB(60,IEN,.2))&+$O(^LAB(60,IEN,2,0)))
 ;
SAVE(DATA,DFN,ARY) ;EP-
 N RES,ZTQUEUED,PNLINPNL,LRTIEN,LRTRES,LRTFLG,LRFLOC,LRFNODE,LRLCSIEN,LRFDEFSP,LRSPEC0,LRDEFSP
 N LRCOM,LRCMT,LRTSEQ,BLRDH,BLRGUI,BLRLOG,BLRPCC,BLRSTOP,BLRQSITE,BLRSTOP,BPCACC,BPCCOM,LRAA,LRARY,LRBLOOD,LRCCOM,LRAHEAD
 N LRDFN,LRDPF,LRDTO,LREAL,LREND,LRGCOM,LRI,LRIDIV,LRJ,LRLABKY,LRLBLBP,LRLLOC,LRLWC,LRNATURE,LRORDR,LRORDTIM
 N LRORDTST,LROUTINE,LRPARAM,LRPCEVSO,LRPLASMA,LRPOVREQ,LRPR,LRSAMP,LRSERUM,LRSPEC,LRSS,LRUNKNOW,LRURG
 N LRURINE,LRUSI,LRVF,LRVIDO,LRVIDOF,LRWLO,LRWLC,RET,LRNT,PNM,LRVF,LROLDIV,LRNG2,LRNG3,LRNG4,LRNG5
 N LRACC,LRAN,LRCDT,%,LRIDT,LRINI,LRODT,LROLLOC,LROT,LRPRAC,LRSB,LRSN,LRTST,XQY,XQY0
 ;
 D:$P($G(^BLRSITE($G(DUZ(2)),0)),"^",10) ENTRYAUD^BLRUTIL("SAVE^BLRPOC 0.0","ARY")
 ;
 S LRNOLABL="" ; SUPPRESS LABEL PRINTING
 I $G(^LAB(69.9,1,"RO"))=""  S RES="0^Rollover has never been run.  Please Contact National Lab User Support," G END     ; LR*5.2*1027 - no rollover issue
 I $P($G(^LAB(69.9,1,"RO")),U,2) S RES="0^Accessioning is currently running, please wait a few minutes and try again." G END     ; LR*5.2*1027 - direct reference issue
 S RES=0,ZTQUEUED=1,BLRGUI=1,BPCACC=""
 S XQY=$O(^DIC(19,"B","CIAV VUECENTRIC",""))
 S XQY0=$G(^DIC(19,XQY,0))
 S ARY("CM")="WC"
 S LRORDTST=+$G(ARY("ORDTST"))
 D ^LRPARAM
 S $P(LRPARAM,U,4)=0  ; Force to NO LABELS
 S LROUTINE=$P(^LAB(69.9,1,3),"^",2)
 ;
 S LRSAMP=+$G(ARY("COL"))
 S LRSPEC=+$P(^LAB(62,LRSAMP,0),U,2)
 S LRDFN=$$GETPAT(DFN)
 I 'LRDFN D  G END
 .S RES="0^Failed to find patient in Lab Data File"
 S LRDPF=2  ; LRDFN represents a patient
 S PNM=$$GET1^DIQ(2,DFN,.01)
 S LROT(LRSAMP,LRSPEC,1)=+$G(ARY("ORDTST"))
 S LRTST=+$G(ARY("ORDTST"))_U_+$G(ARY("URG"))
 S LRLWC="WC"
 S LRPRAC=+$G(ARY("PRV"))
 S LROLLOC=+$G(ARY("LOC"))
 S LRLLOC=$$GET1^DIQ(44,+LROLLOC,1)
 S LRCDT=$G(ARY("CD"))_"^" ; has 2 pieces due to way data is filed in ^LRORDST
 S LRODT=$P(LRCDT,".")
 S LRORDTIM=$P(+LRCDT,".",2)
 ; S LRNATURE=$G(ARY("NOO"))
 S LRNATURE=$G(ARY("NOO"))_"^99ORN"    ; BEGIN IHS/MSC/BF - LR*5.2*1026
 S LRURG=+$G(ARY("URG"))
 S BPCCOM=""
 S LRORDR=""
 ;S LRORDR="P" ;making software error, due to the ,1) node not being defined.
 D NOW^%DTC S LRNT=%
 ;
 D ORDER^LROW2
 D ^LRORDST  ; Create order and accession
 N LRSPEC,LRSAMP
 D ^LRWLST   ; Accession setup
 S LRTST=+$G(ARY("ORDTST"))
 ;
 D:$P($G(^BLRSITE($G(DUZ(2)),0)),"^",10) ENTRYAUD^BLRUTIL("SAVE^BLRPOC 4.0","ARY")
 ; Using test data passed in, build data to be placed into LRSB array.
 S LRTSEQ=0 F  S LRTSEQ=$O(ARY("TST",LRTSEQ)) Q:'LRTSEQ  D
 .; Get the individual test ien
 .S LRTIEN=+$G(ARY("TST",LRTSEQ)) Q:'LRTIEN
 .S LRTRES=$P($G(ARY("RES",LRTSEQ)),"^")
 .S LRTFLG=$P($G(ARY("RES",LRTSEQ)),"^",2)
 .; Get location data from file 60, field 5, then second piece for subscript in data array.
 .S LRFLOC=$$GET1^DIQ(60,LRTIEN,5,"E")
 .S LRFNODE=$P(LRFLOC,";",2)
 .S LRDEFSP=$$GET1^DIQ(62,+$G(ARY("COL")),2,"I")
 .; Use pointer to TOPOGRAPHY FIELD file to locate appropriate SITE/SPECIMEN from LAB TEST file(#60)
 .S LRSPEC0=$G(^LAB(60,LRTIEN,1,LRDEFSP,0)),LRSPEC0=$TR(LRSPEC0,"^","!")
 .S LRNG4=$P(LRSPEC0,"!",4),LRNG4=$$REFRES(LRNG4),$P(LRSPEC0,"!",4)=LRNG4
 .S LRNG5=$P(LRSPEC0,"!",5),LRNG5=$$REFRES(LRNG5),$P(LRSPEC0,"!",5)=LRNG5
 .S LRNG2=$P(LRSPEC0,"!",2),LRNG2=$$REFRES(LRNG2),$P(LRSPEC0,"!",2)=LRNG2
 .S LRNG3=$P(LRSPEC0,"!",3),LRNG3=$$REFRES(LRNG3),$P(LRSPEC0,"!",3)=LRNG3
 .;[LR*5.2*1028]Added next 1 line
 .;S UCUM=$P(LRSPEC0,"!",7) I UCUM=+UCUM S UCUM=$P(^BLRUCUM(UCUM,0),U,3),$P(LRSPEC0,"!",7)=UCUM
 .D:$P($G(^BLRSITE($G(DUZ(2)),0)),"^",10) ENTRYAUD^BLRUTIL("SAVE^BLRPOC 4.5")
 .D BLDARY(LRFNODE,LRSPEC0,LRTRES,LRTFLG)
 ;
 D:$P($G(^BLRSITE($G(DUZ(2)),0)),"^",10) ENTRYAUD^BLRUTIL("SAVE^BLRPOC 5.0")
 ;
 ; Merge array into LSRB as it is done in LRVRPOC
 M LRSB=LRARY
 S LRAA=$P($G(^LAB(60,+$G(ARY("ORDTST")),8,$G(DUZ(2)),0)),U,2)
 I LRAA="" S RES="0^No Accession area defined for this test." G END
 ;S LRAD=DT
 S LRAN=$P(LRACC," ",3)
 ;
 ; Call test function as done in LRVRPOC
 I LRLLOC="" S RES="0^Unable to resolve location. Please insure your location has an abbreviation set up." D END Q
 D TEST^LRVR1
 ;
 D:$P($G(^BLRSITE($G(DUZ(2)),0)),"^",10) ENTRYAUD^BLRUTIL("SAVE^BLRPOC 7.0","LRSB")
 ;
 ; File result data with ref ranges in ^LR
 F LRSB=1:0 S LRSB=$O(LRSB(LRSB)) Q:LRSB<1  S:LRSB(LRSB)'="" ^LR(LRDFN,LRSS,LRIDT,LRSB)=LRSB(LRSB)
 S (LRUSI,LRINI)=$$GET1^DIQ(200,$G(DUZ),1,"E")
 ;
 ; File comments w/ test results
 S LRCOM=0 F  S LRCOM=$O(ARY("CMT",LRCOM)) Q:'LRCOM  D
 .S LRCMT=$G(ARY("CMT",LRCOM))
 .D FILECOM^LRVR4(LRDFN,LRIDT,LRCMT)
 ; File Sign/Symptom
 S FDA(69.03,$O(^LRO(69,LRODT,1,LRSN,2,"B",+ARY("ORDTST"),0))_","_LRSN_","_LRODT_",",9999999.1)=$P($G(ARY("SYMP")),U,1)
 ;S FDA(69.03,$O(^LRO(69,LRODT,1,LRSN,2,"B",+ARY("ORDTST"),0))_","_LRSN_","_LRODT_",",9999999.2)=$P($G(ARY("SYMP")),U,2)
 D FILE^DIE(,"FDA","ERR") K FDA
 S $P(^LRO(69,LRODT,1,LRSN,2,$O(^LRO(69,LRODT,1,LRSN,2,"B",+ARY("ORDTST"),0)),9999999),U,2)=$P($G(ARY("SYMP")),U,2)
 ; Verify entry
 D EXP^LRVER1
 S LRVF=1
 D V11^LRVER3
 S RES="1^Filed"
END S DATA=RES
 D CLEAN^LRVRPOCU
 K ARY
 Q
PNLTSTS(DATA,TST,DFN) ;EP - Return "tst" list of tests within panel. If panel
 ;  is within a panel, those tests will not be returned.
 ;  Loop thru LAB TEST INCLUDED IN PANEL field of File 60 and call $$GETTST to collect test info
 N LP,CNT,PTST
 S (CNT,LP)=0 F  S LP=$O(^LAB(60,TST,2,LP)) Q:'LP  D
 .S CNT=CNT+1
 .;S PTST=+^LAB(60,TST,2,LP,0)
 .S PTST=+$G(^LAB(60,TST,2,LP,0)) ; LR*5.2*1026 - Naked Reference
 .S DATA(CNT,"tst")=$$GETTST(PTST,DFN)
 Q
 ; Returns validated status
 ; Input: TSTIEN - Lab Test Pointer to File 60
 ;        COLIEN - Collection Sample Pointer to File 62
 ;        RESULT - Result value to be validated
 ; Output: DATA - 0=not valid; 1=valid
VALIDATE(DATA,TSTIEN,COLIEN,RES,DFN) ; EP
 D:$P($G(^BLRSITE($G(DUZ(2)),0)),"^",10) ENTRYAUD^BLRUTIL("VALIDATE^BLRPOC 0.0")
 N LRFLOC,LRFIEN,LRDAT,LRNG2,LRNG3,LRNG4,LRNG5,LRFLG,LRERR,LRVER,AGE,SSN,AUPNDAYS,AUPNDOB,AUPNDOD,AUPNPAT,AUPNSEX,SEX,DEFSPEC
 S Y=DFN D ^AUPNPAT
 S LRFLG=""
 S LRFLOC=$$GET1^DIQ(60,TSTIEN,5,"E")
 I LRFLOC="" S DATA=0,DATA(1)="Test information not found." Q
 S LRFIEN=$P(LRFLOC,";",2)
 I RES["?" D  Q
 .D HELP^DIE(63.04,,LRFIEN,"A","LRVER")
 .S DATA(0)=0 D VALERR(.DATA,.LRVER)
 D CHK^DIE(63.04,LRFIEN,"HE",RES,.LRDAT,"LRERR")
 ;I LRDAT="^" S DATA=0_U_$G(LRERR("DIERR",1,"TEXT",1)) Q
 I LRDAT="^" S DATA(0)=0 D VALERR(.DATA,.LRERR) Q
 S DEFSPEC=$$GET1^DIQ(62,COLIEN,2,"I")
 I '$G(DEFSPEC) S DATA(0)=0,DATA(1)="No default specimen for IEN number "_COLIEN_" in the Collection Sample file. A default specimen must be defined for this entry to use Point of Care lab entry." Q
 S LRSPEC0=$G(^LAB(60,TSTIEN,1,$$GET1^DIQ(62,COLIEN,2,"I"),0))
 S LRNG4=$P(LRSPEC0,U,4),LRNG4=$$REFRES(LRNG4)
 S LRNG5=$P(LRSPEC0,U,5),LRNG5=$$REFRES(LRNG5)
 S LRNG2=$P(LRSPEC0,U,2),LRNG2=$$REFRES(LRNG2)
 S LRNG3=$P(LRSPEC0,U,3),LRNG3=$$REFRES(LRNG3)
 I $L(LRNG4)&(RES<LRNG4) S LRFLG="L*" G VRET Q
 I $L(LRNG5)&(RES>LRNG5) S LRFLG="H*" G VRET Q
 I $L(LRNG2)&(RES<LRNG2) S LRFLG="L" G VRET Q
 I $L(LRNG3)&(RES>LRNG3) S LRFLG="H"
VRET S DATA(0)=1_U_$S(LRFLG="H":"1:H",LRFLG="H*":"2:H",LRFLG="L":"1:L",LRFLG="L*":"2:L",1:0)_U_$G(LRDAT(0))_U_$G(LRDAT)
 D:+$P($G(^BLRSITE($G(DUZ(2)),0)),U,10) ENTRYAUD^BLRUTIL("VRET^BLRPOC 9.0","DATA")
 Q
VALERR(DATA,ERRARY) ; EP
 N HLP
 S HLP=0 F  S HLP=$O(ERRARY("DIHELP",HLP)) Q:'HLP  D
 .S DATA(HLP)=$G(ERRARY("DIHELP",HLP))
 Q
 ; Return LRDFN for given patient
GUINIT(DATA,USR) ; EP
 S DATA=$$GET1^DIQ(200,USR,1,"E")
 Q
GETPAT(DFN) ;EP
 N LRDFN
 S LRDFN=$G(^DPT(DFN,"LR"))
 S:'LRDFN LRDFN=$$NEWPAT(DFN)
 Q +LRDFN
 ; Create LRDFN for given patient
NEWPAT(DFN) ;EP
 N LRDPF,X,LRDFN,LRDPAF
 S LRDPF="2^DPT(",X="^"_$P(LRDPF,"^",2)_DFN_",""LR"")"
 S LRDFN=$O(^LR("A"),-1) I 'LRDFN S LRDFN=1
 L +^LR(0):99
 D E2^LRDPA
 L -^LR(0)
 S:LRDFN<1 LRDFN=0
 Q LRDFN
 ;
TEST ; EP
 S ARY("CD")=$$NOW^XLFDT()
 S ARY("ORDTST")="111^INSULIN",ARY("TST",1)="111^INSULIN"
 S ARY("COL")="139^BLOOD",ARY("LOC")="5^CHART REVIEW"
 S ARY("PRV")="1^USER,DEMO",ARY("NOO")="1^WRITTEN"
 S ARY("URG")="9^ROUTINE",ARY("RES",1)="5.1"
 S ARY("SYMP")="HYPERTENSION^990",ARY("COM",1)="TEST LINE 1"
 S ARY("COM",2)="TEST LINE 2",ARY("COM",3)="TEST LINE 3"
 D SAVE(.RET,10,.ARY)
 Q
 ;
 ; Resolve reference range in event that range is a $S statement.
REFRES(VAL) ; EP
 N CHKVAL,REFVAL
 S REFVAL=""
 S X="S CHKVAL="_VAL D ^DIM
 I $G(X)'="" D
 .X X S REFVAL=CHKVAL
 K X
 Q REFVAL
URGLST(DATA) ; EP
 N IEN,TST,CNT
 S (TST,CNT)=0 F  S TST=$O(^LAB(62.05,"B",TST)) Q:TST=""  D
 .S IEN=0 F  S IEN=$O(^LAB(62.05,"B",TST,IEN)) Q:'IEN  D
 ..S CNT=CNT+1
 ..S DATA(CNT)=IEN_U_TST
 Q
NOOLST(DATA) ; EP
 N IEN,ORD,CNT,DEF
 ; Get default nature of order from file 69.9 (field 150.1)
 S DEF=$$GET1^DIQ(69.9,1,150.1,"I")
 I 'DEF S DEF=$O(^ORD(100.02,"B","WRITTEN",""))
 S (ORD,CNT)=0 F  S ORD=$O(^ORD(100.02,"B",ORD)) Q:ORD=""  D
 .S IEN=0 F  S IEN=$O(^ORD(100.02,"B",ORD,IEN)) Q:'IEN  D
 ..; ---- BEGIN IHS/MSC/BF - LR*5.2*1026
 ..; USE SCREEN LOGIC AS IT IS USED IN THE LRFAST OPTION.
 ..I '$P(^ORD(100.02,IEN,0),"^",4),'$P(^ORD(100.02,IEN,0),"^",3),('$P(^ORD(100.02,IEN,0),"^",6)),"XB"[$P(^ORD(100.02,IEN,0),"^",5) D
 ...S CNT=CNT+1
 ...S DATA(CNT)=IEN_U_ORD_U_$S(IEN=DEF:1,1:"")
 ..; ---- END IHS/MSC/BF - LR*5.2*1026
 Q
LABDESC(DATA,DIV) ; EP
 N CC,CNT,COMIEN
 S DIV=$G(DIV,$G(DUZ(2)))  ; default to user's current division
 S (CC,CNT)=0 F  S CC=$O(^BLRPOC(90479,DIV,4,CC)) Q:'CC  D
 .S CNT=CNT+1
 .;S COMIEN=+^BLRPOC(90479,DIV,4,CC,0)
 .S COMIEN=+$G(^BLRPOC(90479,DIV,4,CC,0))   ; LR*5.2*1026 - Naked Reference
 .S DATA(CNT)=$$GETCOM(COMIEN)
 Q
GETCOM(COMIEN) ; EP
 N LDNAME,LDEXP
 S LDNAME=$$GET1^DIQ(62.5,COMIEN,.01,"E")
 S LDEXP=$$GET1^DIQ(62.5,COMIEN,1,"E")
 Q COMIEN_U_LDNAME_U_LDEXP
 ;
BLDARY(LOC,SPEC0,RES,FLG) ; EP
 S LRARY(LOC)=$S(RES="":"pending",1:RES)
 I RES="pending" Q
 I $D(FLG) S $P(LRARY(LOC),U,2)=FLG
 S $P(LRARY(LOC),U,3)="!!!"
 S $P(LRARY(LOC),U,4)=$G(DUZ)
 I $D(SPEC0) S $P(LRARY(LOC),U,5)=SPEC0
 S $P(LRARY(LOC),U,9)=DUZ(2)
 Q
 ;
CHKTST(TEST) ; EP
 N LRLOOP,LRITMIEN,PNLINPNL,SAMP,COLNM,SPEC,BADPTR
 NEW SUBNOACC,SUBNOCOL  ; IHS Lab Patch 1026
 ;
 I $P(^LAB(60,TEST,0),U,3)'="B" Q 0         ; If type is "Both", don't allow entry
 I $P(^LAB(60,TEST,0),U,4)'="CH" Q 0        ; If not "CH" subscript, don't allow entry
 I '$D(^LAB(60,TEST,8,$G(DUZ(2)))) Q 0      ; If no accession area defined for this test at this site, don't process
 I '+$O(^LAB(60,TEST,3,0)) Q 0              ; If no collection sample, don't return entry. -- LR*5.2*.1026
 S (SUBNOACC,SUBNOCOL)=0                    ; COSMIC test's ATOMIC subtests Accession number &/or a Collection Sample Flags
 ;
 ; If test is a panel, and has a panel within that panel, don't allow entry
 S (PNLINPNL,BADPTR)=0
 I $$ISPANEL(TEST) D
 .S LRLOOP=0 F  S LRLOOP=$O(^LAB(60,TEST,2,LRLOOP)) Q:'LRLOOP!(PNLINPNL)!(BADPTR)!(SUBNOACC)!(SUBNOCOL)  D  ; LR*5.2*1026 -- Check subtests as well
 ..S LRITMIEN=$$GET1^DIQ(60.02,LRLOOP_","_TEST,.01,"I")
 ..I $$ISPANEL(LRITMIEN) S PNLINPNL=1 Q
 ..I $$BADPTR(LRITMIEN) S BADPTR=1 Q
 .. I '$D(^LAB(60,LRITMIEN,8,$G(DUZ(2)))) S SUBNOACC=1  Q  ; LR*5.2*1026 -- Check the subtests as well
 .. I '+$O(^LAB(60,LRITMIEN,3,0)) S SUBNOCOL=1  Q
 I PNLINPNL!(BADPTR)!(SUBNOACC)!(SUBNOCOL) Q 0   ; LR*5.2*1026
 ;
 Q 1
 ;
 ;Check if test has bad pointer to ^DD executable logic.
BADPTR(IEN) ; EP
 ; I '$D(^DD(63.04,$P($$GET1^DIQ(60,IEN,5,"E"),";",2))) Q 1  ; IHS/MSC/BF - LR*5.2*1026 -- Make sure $P returns numeric
 ; BEGIN - LR*5.2*1027 - Valid check for existance of invalid IEN
 NEW WOT
 S WOT=+$P($$GET1^DIQ(60,IEN,5,"E"),";",2)
 Q:WOT<1 1
 ; END - LR*5.2*1027
 I '$D(^DD(63.04,$P($$GET1^DIQ(60,IEN,5,"E"),";",2))) Q 1  ; IHS/MSC/BF - LR*5.2*1026 -- Make sure $P returns numeric
 ; 
 Q 0     ; IHS/MSC/BF - LR*5.2*1026
 ;
 ; Check if supplied location is valid for this test
 ; INPUT LIEN - Lab test ien from BLR BEHO LAB POC file
 ;       DIV  - Division
 ;       LOC  - Location passed in from LAB POC component
LOCMATCH(LIEN,DIV,LOC) ; EP
 I $D(^BLRPOC(90479,DIV,1,LIEN,3,"B",LOC))!('$D(^BLRPOC(90479,DIV,1,LIEN,3,"B"))) Q 1
 Q 0
 ;
 ;Check to see if supplied user is valid for the test
 ; INPUT LIEN - Lab test ien from BLR BEHO LAB POC file
 ;       DIV  - Divsion
 ;       USR  - User number from file 200
USRMATCH(LIEN,DIV,USR) ; EP
 I $D(^BLRPOC(90479,DIV,1,LIEN,4,"B",USR))!('$D(^BLRPOC(90479,DIV,1,LIEN,4,"B"))) Q 1
 Q 0
 ;
 ; Clean up environment
CVARS ; EP
 K ARY,BLRDH,BLRGUI,BLRLOG,BLRPCC,BLRSTOP,BLRQSITE,BLRSTOP,BPCACC,BPCCOM,LRAA,LRARY,LRBLOOD,LRCCOM,LRAHEAD
 K LRDFN,LRDPF,LRDTO,LREAL,LREND,LRGCOM,LRI,LRIDIV,LRJ,LRLABKY,LRLBLBP,LRLLOC,LRLWC,LRNATURE,LRORDR,LRORDTIM
 K LRORDTST,LROUTINE,LRPARAM,LRPCEVSO,LRPLASMA,LRPOVREQ,LRPR,LRSAMP,LRSERUM,LRSPEC,LRSS,LRUNKNOW,LRURG
 K LRURINE,LRUSI,LRVF,LRVIDO,LRVIDOF,LRWLO,LRWLC,RET
 Q
