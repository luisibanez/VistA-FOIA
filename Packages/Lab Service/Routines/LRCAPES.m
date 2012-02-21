LRCAPES ;DALOI/FHS/KLL -MANUAL PCE CPT WORKLOAD CAPTURE ;5/1/99
 ;;5.2;LAB SERVICE;**274,259,349**;Sep 27, 1994
EN ;
 D EN^LRCAPES1
 Q
PG ;Page break
 N DIR,DIRUT,DUOUT,DTOUT
 S DIR(0)="E" D ^DIR
 I $G(DIRUT) S LREND=1 Q
 W @IOF
 Q
EX1 ;Parse the read entry
 N LRXY
 Q:'$L($G(LRX))  D
 . I LRX?5N,'$D(^TMP("LR",$J,"AK",LRX))#2 D  Q
 . . S LRXY=$$CPT^ICPTCOD(LRX,DT) Q:'$P(LRXY,U,7)
 . . S LRCNT=+$G(LRCNT)+1
 . . S ^TMP("LR",$J,"LRLST",LRCNT)=$P(LRXY,U)_"^^"_$P(LRXY,U,3)_U
 . S LRQ="^TMP(""LR"","_$J_",""AK"","_LRX_")"
 . F  S LRQ=$Q(@LRQ) Q:$QS(LRQ,4)'=LRX  D
 . . S LRCNT=+$G(LRCNT)+1
 . . S ^TMP("LR",$J,"LRLST",LRCNT)=$QS(LRQ,6)_U_@LRQ
 Q
END1 ;
 D END S LREND=1
 Q
END ;
 I $G(LRAA),$G(LRAD),$G(LRAN) L -^LRO(68,LRAA,1,LRAD,1,LRAN)
 K:'$G(LRESCPT) ^TMP("LR",$J,"AK")
 I $G(LRDEBUG) W !,"END ",! Q
 Q
HLP ;Help display for CPT selection
 N DIR,DIRUT,DUOUT,DTOUT,LREND,LRX,LRY
 W @IOF
 S LRX="^TMP(""LR"","_$J_",""AK"",0,1)"
 W $$CJ^XLFSTR("List or range e.g, 1,3,5-7,88300.",IOM)
 W $$CJ^XLFSTR("Select from the following or enter CPT separated by a comma",IOM),!
 F  S LRX=$Q(@LRX) Q:$QS(LRX,2)'=$J!($G(LREND))!($QS(LRX,1)'="LR")  D
 . S LRY=@LRX
 . W !?3,$QS(LRX,4),?6," = "_$QS(LRX,6)_"  "_$E($P(LRY,U,2),1,60),!
 . W:$P(LRY,U,4) ?8,$P(LRY,U,3)_" { NLT = "_$P(LRY,U,4)_" }",!
 . I $Y>(IOSL-6) S DIR(0)="E" D RD^LRCAPES1 I '$G(LREND)  W @IOF
 D LSTCPT($G(LRAA),$G(LRAD),$G(LRAN)) Q
 ;
LSTCPT(LRAA,LRAD,LRAN) ; Show loaded CPT codes if any
 Q:$S('$G(LRAA):1,'$G(LRAD):1,'$G(LRAN):1,1:0)
 N LRSTR
 S LRSTR=$G(^LRO(68,LRAA,1,LRAD,1,LRAN,"PCE")) Q:'LRSTR
 N DA,DIC,DIR,DIRUT,DIR,DR,ERR,DUOUT,IEN,LRDA,LRENC,LREND,LRP,S,X,Y
 S DIR(0)="Y",DIR("A")=" Would you like to see PCE CPT Information"
 S DIR("B")="No" D ^DIR Q:$G(DIRUT)!($G(Y)'=1)
 ;List filed CPT CODES
 W @IOF
 F LRP=1:1 S IEN=$P(LRSTR,";",LRP) Q:IEN=""  D
 . D GETCPT^PXAPIOE(IEN,"LRENC","ERR")
 S (LRDA,LREND)=0 F  S LRDA=$O(LRENC(LRDA)) Q:'LRDA!($G(LREND))  D
 . I $Y>(IOSL-6) D PG W @IOF Q:$G(LREND)
 . S S=0,DA=LRDA,DR="0:99",DIC="^AUPNVCPT(" D EN^DIQ
 Q
WLN ;Interactive entry point
 D KVA^VADPT
 K DIC,DIR
 K LREND,LRUID,DIC,DIR,LRVBY
 K ^TMP("LR",$J,"LRLST")
 K LRAA,LRACC,LRAD,LRAN,LRDFN,LRDPF,LRIDT
 K LRRB,LRSS,LRTIME,LRTREA,LRUID,LRWRD,PNM,SEX,SSN,AGE
 S (LRAA,LRACC,LRAD,LRNOP,LRAN,LREND)=0,LRVBY=1,LRUID=""
 S:'$G(LRPRO) LRPRO=DUZ
 I '$G(LRESCPT) S LRVBY=$$SELBY^LRWU4("Select Accession By")
 D:LRVBY=1 ^LRVERA D:LRVBY=2 UID^LRVERA
 I 'LRVBY!(LRAA<1) D END S LREND=1 Q
 S LRDFN=+$$GET1^DIQ(68.02,+$G(LRAN)_","_+$G(LRAD)_","_+$G(LRAA)_",",.01)
 I 'LRDFN D END S LRNOP=1 D  Q
 . W !?5,"This accession is corrupt",!
LCK ;
 L +^LRO(68,LRAA,1,LRAD,1,LRAN):10 I '$T D  Q
 . W !?5,"Someone else is editing this accession",!
 . S LRNOP=1
 D PT^LRX
 S LRUID=$$GET1^DIQ(68.02,LRAN_","_LRAD_","_LRAA_",",16)
 S LRLLOCX=$$GET1^DIQ(68.02,LRAN_","_LRAD_","_LRAA_",",6)
 S LRSPECID="Acc #: "_$$GET1^DIQ(68.02,LRAN_","_LRAD_","_LRAA_",",15,"E")
 S:$L($G(LRUID)) LRSPECID=LRSPECID_"  UID: "_LRUID
 S LREDT=$$GET1^DIQ(68.02,LRAN_","_LRAD_","_LRAA_",",9,"I")
 I LREDT'?7N.E D  Q
 . W !?5,"This accession does not have a Collection Date/Time",!
 . W !?10,"CAN NOT PROCEED",!
 . S LRNOP="6^Not Accessioned"
 I '$G(LRIDT) S LRIDT=+$$GET1^DIQ(68.02,LRAN_","_LRAD_","_LRAA_",",13.5,"I")
 S LRCDT="Collection Date: "_$$FMTE^XLFDT(LREDT,1)
 I '$L($G(LRSS)) S LRSS=$$GET1^DIQ(68,LRAA_",",.02,"I")
 S LRDSSLOC=+$$GET1^DIQ(68,LRAA_",",.8,"I")
 S LRDSSLOC=$S($G(LRDSSLOC):LRDSSLOC,1:LRDLOC)
 D DEM^LRCAPES1
PRO ;Get provider,patient/location information
 S LREND=0
 D
 . N LRPRONM,DIR,DIRUT,DUOUT,X,Y
 . S LRPRONM=$$GET1^DIQ(200,+$G(LRPRO),.01,"I")
 . I $L(LRPRONM),$D(^VA(200,"AK.PROVIDER",LRPRONM,+$G(LRPRO)))#2,$$GET^XUA4A72(+$G(LRPRO),DT)>0 S DIR("B")=LRPRONM
 . S DIR("A")="Releasing Pathologist"
 . S LRPRO=0,DIR(0)="PO^200:ENMZ"
 . S DIR("S")="I $D(^VA(200,""AK.PROVIDER"",$P(^(0),U),+Y)),$$GET^XUA4A72(+Y,DT)>0"
 . D ^DIR
 . I Y>1 S LRPRO=+Y
 I '$G(LRPRO) D  D END1 Q
 . W !?5,"No Active Provider Selected",!
 . S LRNOP=1
 I '$D(^LRO(68,LRAA,1,LRAD,1,LRAN,0))#2 D  D END1 G WLN
 . W !?5,"The accession is corrupt - missing zero node",!
 . S LRNOP="7^Corrupt Accession"
LOC ;Reporting Location
 S LRNODE0=^LRO(68,LRAA,1,LRAD,1,LRAN,0)
 S LRNOP=0
 S (LRLLOCX,LRLLOC)=$$GET1^DIQ(68.02,LRAN_","_LRAD_","_LRAA_",",6)
 I $L(LRLLOC) S LRLLOC=+$$FIND1^DIC(44,"","OM",LRLLOC)
ASKLOC ;Check to see of outpatient location
 I '$D(^SC(+$G(LRLLOC),0))#2 D
 . N DIR,X,Y
 . S LRLLOC=""
 . S DIR(0)="PO^44:AEZNMO",DIR("A")=" Ordering Location "
 . D ^DIR
 . I +Y<1 Q
 . S LRLLOC=+Y
 I '$G(LRLLOC) D END1 Q
 S LRDSSID=+$$GET1^DIQ(44,+LRLLOC,8,"I") ;I 'LRDSSID S LRNOP="2^No Stop Code Number" Q
 S LRNINS=$$GET1^DIQ(44,+LRLLOC,3,"I")
 S LRNINS=$S(LRNINS:LRNINS,1:DUZ(2))
 Q
ES() ;Entry point for front end application.
 N DFN,LRESCPT,LRDFN,LRLLOC,LRLLOCX,LRNINS,LRTST,LRENCDT,LRDUZ
 K LRES,LRESCPT
 S LRES=1
ASK ; Option entry point - Check and setup PCE reporting variables
 D EN^LRCAPES1
 N X,Y,T1
 S LREND=0
 D ^LRPARAM Q:$G(LREND)
 K ^TMP("LRPXAPI",$J),^TMP("LR",$J,"LRLST")
 S ^TMP("LR",$J,"LRLST")=$$FMADD^XLFDT(DT,2)_U_DT_U_"LAB ES CPT"
 S:'$G(LRPKG) LRPKG=$O(^DIC(9.4,"B","LR",0))
 S:'$G(LRPKG) LRPKG=$O(^DIC(9.4,"B","LAB SERVICE",0))
PKG ;Check to see if Lab Package is installed
 I '$G(LRPKG) D  D WKL Q
 . W !?5,"LAB SERVICE PACKAGE is not loaded",!
PCE ;Check to see if PCE is turned on
 S X="PXAI" X ^%ZOSF("TEST") I '$T D:'$G(LRES)  D WKL Q
 . W !?5,"PCE Is not installed",!
 S LRPCEON=$$PKGON^VSIT("PX")
 I '$G(LRES),'LRPCEON D  D WKL Q
 . W !?5,"PCE is not turned on",!
 S LRDLOC=+$$GET1^DIQ(69.9,"1,",.8,"I")
OOS ;Check to see if the LRDLOC is an OOS location
 I $G(LRES),$P($G(^SC(LRDLOC,0)),U)'["LAB DIV " D  D WKL Q
 . W !?5,"DEFAULT LAB OOS LOCATION is not defined correctly",!
 S LRESCPT=1
 D:'$G(^TMP("LR",$J,"AK",0,1))'=DUZ_U_DT EN
 I $G(LRES) Q $G(LRESCPT)
LOOP ;
 Q:$G(LREND)
 F  D WLN Q:$G(LREND)  I '$G(LRNOP) D CPTEN Q:$G(LREND)
 D CLEAN Q
CPTEN ;Entry point from CPT API call
WKL S (LRNOP,LREND)=0 D READ^LRCAPES1
 D DIS^LRCAPES1
 I '$O(^TMP("LR",$J,"LRLST",0)) D END Q
LOAD ;Setup ^TMP("LRPXAPI" to load CPT workload
 K LRXCPT,LRXTST,^TMP("LRPXAPI",$J)
 S LRDUZ=LRPRO
 I '$G(LRESCPT) S LRNOP="3^PCE Workload Capture Not Setup"
 I $G(LRNOP) D  D SENDWKL Q
 . I '$D(LRQUIET) W !,$$CJ^XLFSTR("PCE Wkld Abort "_$P(LRNOP,U,2),IOM)
 I $G(LRESCPT),'$G(LRNOP) D
 . N AFTER812,D,D0,DDER,DI,DIC,DIG,DIH,DISL,DIV
 . N I,LRACC,LRCNT,LRI,LRPCEN,PXALOOK,PXASUB,PXJ,PXJJ
 . N SDT1,SPEL,SUBL,TYPEI,X,XPARSYS
 . S LRTST=0
 . F  S LRTST=$O(^TMP("LR",$J,"LRLST",LRTST)) Q:LRTST<1  D
 . . S (LRNLTN,CPT)=+$G(^TMP("LR",$J,"LRLST",LRTST)),LRTSTP=$P(^(LRTST),U,2,99)
 . . D SET^LRCAPPH1
SENDWKL ; Store LMIP workload
 D SEND^LRCAPES1
 L -^LRO(68,LRAA,1,LRAD,1,LRAN)
 S LRNOP=0
 Q
CLEAN ;Final Cleanup
 K AFTER812,AGE,CPT,D,D0,DOB,DDER,DFN,DI,DIC,DIG,DIH,DIR,DIRUT
 K DISL,DIRUT,DIU,DUOUT,DIV,DQ
 K I,J,LRACC,LRCNT,LRI,POP,PXALOOK,PXASUB,PXJ,PXJJ
 K SDT1,SPEL,SUBL,T1,TYPEI,X,XPARSYS
 K ANS,CLN,CNT,FPRI,LRAA,LRAD,LRAN,LRANSX,LRANSY,LRCDT,LRCNT
 K LRDFN,LRDPF,LRDLOC,LRDSSID,LRDSSLOC,LRDUZ,LREDT,LREND,LRES,LRESCPT
 K LRIDT,LRIDIV,LRLLOC,LRLLOCX,LRLST,LRNINS,LRNLT,LRNLTN,LRNODE0,LRNOP,LROK
 K LRPCEN,LRPCENON,LRPCEVSO,LRPKG,LRPRAC,LRPRO,LRRB,LRQ,LRSS,LRTREA,LRTST,LRURG
 K LRSPECID,LRTSTP,LRUID,LRVBY
 K LRVSITN,LRWRD,LRX,LRXCPT,LRXTST
 K NODE,NODE0,PNM,SEX,SDFLAG,SSN,VA,X1,X2,X3
 K ^TMP("LRMOD",$J)
 K ^TMP("LR",$J,"AK"),^TMP("LR",$J,"LRLST")
 K ^TMP("LRPXAPI",$J)
 D KVAR^VADPT
 Q
CPT(LRAA,LRAD,LRAN,LRPRO) ;AP Release entry point
 ;LRAA=accession area, LRAD=accession date, LRAN=accession number
 ;LRPRO=provider
 N X,Y,I,LRI,LREDT,LRCDT,LRIDT,LRLLOCX,LRSPECID,DIC,LRNOP,LREND
 S (LRLLOCX,LRLLOC)=$$GET1^DIQ(68.02,LRAN_","_LRAD_","_LRAA_",",6)
 S DIC=44,DIC(0)="ONM",X=LRLLOC D ^DIC
 I Y>1 S LRLLOC=+Y
 I Y<1 D  Q:$G(LREND)
 . S DIC(0)="AEZNM" D ^DIC
 . I Y<1 S LRNOP="4^Not an outpatient location",LREND=1 Q
 . S LRLLOC=+Y
 ;KLL - set LRDSSLOC to LRDLOC, instead of LRLLOC to resolve location
 ;      problem occurring in PCE
 ;TAC - use accession area OOS location if one exists
 S LRDSSLOC=+$$GET1^DIQ(68,LRAA_",",.8,"I")
 S LRDSSLOC=$S($G(LRDSSLOC):LRDSSLOC,1:+$G(LRDLOC))
 ;I "CMZ"'[$$GET1^DIQ(44,+LRLLOC,2,"I") S LRNOP="4^Not an outpatient location"
 S LRDSSID=+$$GET1^DIQ(44,+LRLLOC,8,"I") ;I 'LRDSSID,'$G(LRNOP) S LRNOP="5^No Stop Code Number"
 S LRNINS=$$GET1^DIQ(44,+LRLLOC,3,"I")
 S LRNINS=$S(LRNINS:LRNINS,1:DUZ(2))
 I '$G(LRIDT) S LRIDT=+$$GET1^DIQ(68.02,LRAN_","_LRAD_","_LRAA_",",13.5,"I")
 S LRUID=$$GET1^DIQ(68.02,LRAN_","_LRAD_","_LRAA_",",16)
 S LRLLOCX=$$GET1^DIQ(68.02,LRAN_","_LRAD_","_LRAA_",",6)
 S LRSPECID="Acc #: "_$$GET1^DIQ(68.02,LRAN_","_LRAD_","_LRAA_",",15,"E")
 S:$L($G(LRUID)) LRSPECID=LRSPECID_"  UID: "_LRUID
 S LREDT=$$GET1^DIQ(68.02,LRAN_","_LRAD_","_LRAA_",",9,"I")
 I 'LREDT S LREDT=$$NOW^XLFDT
 S LRCDT="Collection Date: "_$$FMTE^XLFDT(LREDT,1)
 I '$G(LRESCPT) D  Q
 . D EN^DDIOL("CPT workload is not activated","","!?20")
 I $S('$G(LRAA):1,'$G(LRAD):1,'$G(LRAN):1,'$G(LRPRO):1,1:0) Q
 I +$G(^LRO(68,LRAA,1,LRAD,1,LRAN,0))'=LRDFN Q
 D CPTEN
 Q
