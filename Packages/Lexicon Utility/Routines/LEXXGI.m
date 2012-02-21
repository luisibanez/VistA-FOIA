LEXXGI ; ISL/KER - Global Import (Needs ^LEXM) ; 04/07/2004
 ;;2.0;LEXICON UTILITY;**4,25,26,27,28,29**;Sep 23, 1996
 ;
 ; External References
 ;   DBIA 10103  $$NOW^XLFDT
 ;   DBIA 10086  HOME^%ZIS
 ;   DBIA 10063  ^%ZTLOAD
 ;   DBIA 10103  $$FMDIFF^XLFDT
 ;   DBIA 10103  $$FMTE^XLFDT
 ;   DBIA 10141  BMES^XPDUTL
 ;   DBIA 10141  MES^XPDUTL
 ;   DBIA 10101  EN^XQOR
 ;   DBIA 10103  $$DT^XLFDT
 ;                  
EN ; Update Lexicon Data
 S:$D(ZTQUEUED) ZTREQ="@"
 D IMP Q
TASK ; Que Lexicon Update w/ Taskman
 N Y,ZTRTN,ZTDESC,ZTIO,ZTDTH,ZTSK
 S ZTRTN="EN^LEXXGI",ZTDESC="Importing Updated Lexicon Data"
 S ZTIO="",ZTDTH=$H D ^%ZTLOAD,HOME^%ZIS
 Q
IMP ; Import
 N LEXBEG,LEXELP,LEXEND,LEXMSG,LEXOK,LEXFL
 ;   ^LEXM Not Found
 D:'$D(^LEXM) NF Q:'$D(^LEXM)
 ;   Invalid ^LEXM
 S LEXOK=0 S:$O(^LEXM(0))>0 LEXOK=1 D:'LEXOK IG Q:'LEXOK
 ;   Begin Import
 S LEXBEG=$$HACK D IMPORT D KLEXM
 ;   End Import
 S LEXEND=$$HACK,LEXELP=$$ELAP(LEXBEG,LEXEND)
 S:LEXELP="" LEXELP="00:00:00"
 D PB("   Data Updated ")
 D PB(("        Started:   "_$TR($$FMTE^XLFDT(LEXBEG),"@"," ")))
 D TL(("        Finished:  "_$TR($$FMTE^XLFDT(LEXEND),"@"," ")))
 D TL(("        Elapsed:   "_LEXELP))
 ;
 ; Triggering the Protocols is now being done in the post-install
 ; to accomodate re-indexing files
 ; 
 ;   Notify/Trigger Protocols
 ; D NOTIFY
 ;
 Q
IMPORT ; Import by File
 N LEXHDR,LEXBLD,LEXDAT,LEXFI,LEXFIC,LEXHDRS,LEXLOG
 S (LEXFI,LEXFIC)=0,LEXHDR=0,LEXBLD=$G(^LEXM(0,"BUILD"))
 S LEXDAT=$P($G(^LEXM(757.9,0,"VRRV")),"^",2)
 S:+LEXDAT'>0 LEXDAT=$P($G(^LEXM(0,"VRRVDT")),"^",1)
 S:+LEXDAT'>0 LEXDAT=$$DT^XLFDT D:LEXOK HDR
 F  S LEXFI=$O(^LEXM(LEXFI)) Q:+LEXFI=0  D FILES
 I +($G(LEXDAT))>0,$L(LEXBLD) S LEXLOG=$$LOG^LEXXGI2(LEXDAT,LEXBLD)
 Q
FILES ; File Data
 N LEXCF,LEXCHG,LEXCHGS,LEXCNT,LEXCNT,LEXFIL,LEXI,LEXIEN,LEXL,LEXLC
 N LEXMUMPS,LEXNM,LEXRT,LEXS,LEXTOT,LEXTXT,LEXIGL,LEXIGI,LEXIGF,LEXIGT
 N LEXIGD,LEXIGO,LEXBEG,LEXEND,LEXELP,LEXFB
 S LEXFB=$G(^LEXM(+LEXFI,0,"BUILD")),LEXIGO=0,LEXBEG=$$HACK D BEG^LEXXGI2
 S (LEXCNT,LEXLC,LEXI)=0,LEXL=68,LEXFIC=LEXFIC+1 D:LEXOK FHDR(LEXFI)
 S LEXTOT=+($G(^LEXM(LEXFI,0))) G:LEXTOT=0 ABRT
 S LEXNM=$G(^LEXM(LEXFI,0,"NM"))
 I $L(LEXNM),$$UP(LEXNM)'["FILE" S LEXNM=LEXNM_" FILE"
 S:$L(LEXNM) LEXNM=$$MIX(LEXNM) S LEXCHG=$G(^LEXM(LEXFI,0))
 S LEXTXT="   "_LEXNM,LEXTXT=LEXTXT_$J("",(40-$L(LEXTXT)))_LEXFI
 D:LEXFIC=1 PB(LEXTXT) D:LEXFIC'=1 TL(LEXTXT)
 S LEXS=+(LEXTOT\LEXL) S:LEXS=0 LEXS=1 W:+($O(^LEXM(LEXFI,0)))>0 !,"   "
 F  S LEXI=$O(^LEXM(LEXFI,LEXI)) Q:+LEXI=0  D
 . S LEXCNT=LEXCNT+1,LEXMUMPS=$G(^LEXM(LEXFI,LEXI))
 . I LEXCNT'<LEXS S LEXLC=LEXLC+1 W:LEXLC'>LEXL "." S LEXCNT=0
 . S LEXRT=$P(LEXMUMPS,"^",2),LEXFIL=""
 . S:LEXMUMPS["^LEX("!(LEXMUMPS["^LEXT(")!(LEXMUMPS["^LEXC(") LEXFIL=+($P(LEXRT,"(",2)),LEXFL(+($P(LEXRT,"(",2)))=""
 . S:LEXMUMPS["^ICD9(" LEXFIL=80,LEXFL(80)=""
 . S:LEXMUMPS["^ICD0(" LEXFIL=80.1,LEXFL(80.1)=""
 . S:LEXMUMPS["^ICPT(" LEXFIL=81,LEXFL(81)=""
 . S:LEXMUMPS["^DIC(81.3" LEXFIL=81.3,LEXFL(81.3)=""
 . S:LEXMUMPS["^DIC(81.2" LEXFIL=81.2,LEXFL(81.2)=""
 . S:LEXMUMPS["^LEX("!(LEXMUMPS["^LEXT(")!(LEXMUMPS["^LEXC(") LEXFIL=+($P(LEXRT,"(",2))
 . S:LEXMUMPS["^ICD9(" LEXFIL=80 S:LEXMUMPS["^ICD0(" LEXFIL=80.1
 . S:LEXMUMPS["^ICPT(" LEXFIL=81 S:LEXMUMPS["^DIC(81.3" LEXFIL=81.3
 . S:+LEXFIL>0 LEXSCHG(+LEXFIL,0)=""
 . S LEXCF=+($P(LEXMUMPS,"LEXC(757.9,""AFIL"",",2))
 . S:$P(LEXCF,".",1)'="757"&("^80^80.1^81^81.3^"'[("^"_LEXCF_"^")) LEXCF=""
 . S LEXIEN=+($P(LEXMUMPS,("LEXC(757.9,""AFIL"","_+LEXCF_","),2))
 . S:+LEXIEN>0&(+LEXCF)>0&("^80^80.1^81^81.3)"[LEXCF)&(+LEXFIL=757.9)&(LEXMUMPS["LEXC(757.9") LEXSCHG(+LEXFIL,LEXIEN)=LEXCF,LEXSCHG(757.9,"B",+LEXCF,LEXIEN)=""
 . I $L(LEXMUMPS) D
 . . S:$L(LEXCF) LEXCHGS(LEXCF)="" X LEXMUMPS S LEXIGO=1
 I +($G(LEXIGO))>0 D
 . S LEXEND=$$HACK S LEXELP=$$ELAP(LEXBEG,LEXEND)
 . S:LEXELP="" LEXELP="00:00:00" D END^LEXXGI2
ABRT ; Abort File
 K ^LEXM(+LEXFI)
 Q
HDR ; Header - Full
 N LEXCRE,LEXL1 S LEXL1=""
 S LEXCRE=$G(^LEXM(0,"CREATED"))
 S LEXCRE=$S(+LEXCRE>0:($$MIX($$FMTE^XLFDT(LEXCRE))),1:"")
 S:$L($P(LEXCRE,"@",2)) LEXCRE=$P(LEXCRE,"@",1)_" at "_$P(LEXCRE,"@",2)
 S LEXL1=" Updating files "
 S:$L($G(LEXCRE))&($L($G(LEXL1))) LEXL1=$G(LEXL1)_"using export global created "_$G(LEXCRE)
 D PB(LEXL1)
 Q
FHDR(X) ; Header
 N LEXB,LEXFI,LEXFID,LEXNM,LEXVR,LEXRV,LEXDT,LEXL1,LEXL2 S (LEXL1,LEXL2)="",LEXFI=+($G(X)),LEXFID=$P(LEXFI,".",1)
 Q:+LEXFID'>0  Q:$D(LEXHDRS(+LEXFID))  S LEXHDRS(LEXFID)=""
 S:+LEXFI=81!(+LEXFI=81.3) LEXHDRS(81)="",LEXHDRS(81.3)=""
 S:LEXFID=80 LEXNM="ICD-9-CM" S:LEXFID=81 LEXNM="CPT-4/HCPSC" S:LEXFID=757 LEXNM="Lexicon"
 S LEXB=$G(^LEXM(LEXFI,0,"BUILD"))
 S LEXVR=$G(^LEXM(LEXFI,0,"VR")),LEXRV=$G(^LEXM(LEXFI,0,"VRRV"))
 S LEXDT=$$MIX($$FMTE^XLFDT($P(LEXRV,"^",2))),LEXRV=$P(LEXRV,"^",1)
 S LEXL1="Updating "_LEXNM S:$L(LEXB) LEXL1=LEXL1_" with patch/build "_LEXB
 S:$L(LEXVR) LEXL2=" To version "_LEXVR
 S:$L(LEXVR)&($L(LEXRV)) LEXL2=LEXL2_" revision "_LEXRV
 S:$L(LEXVR)&($L(LEXRV))&($L(LEXDT)) LEXL2=LEXL2_" dated "_LEXDT
 S:$L(LEXL1) LEXL1=" "_LEXL1 S:$L(LEXL2) LEXL2=" "_LEXL2
 D BL D:$L(LEXL1) TL(LEXL1) D:$L(LEXL2) TL(LEXL2),BL
 Q
NOTIFY ; Notify by Protocol - LEXICAL SERVICES UPDATE
 N X,LEXT,LEXI,LEX1,LEX2,LEX3,LEXN,LEXP,LEXUP
 S LEXUP="" S:$D(LEXSCHG(757.9,"B",80))!($D(LEXSCHG(757.9,"B",80.1))) LEXUP=$G(LEXUP)_"ICD"
 S:$D(LEXSCHG(757.9,"B",81))!($D(LEXSCHG(757.9,"B",81.3))) LEXUP=$G(LEXUP)_"/CPT"
 S:$E(LEXUP,1)="/" LEXUP=$E(LEXUP,2,$L(LEXUP)) S:$L(LEXUP) LEXUP=LEXUP_" "
 S LEXP=+($O(^ORD(101,"B","LEXICAL SERVICES UPDATE",0))) Q:LEXP=0
 S X=LEXP_";ORD(101," D EN^XQOR
 S X="Lexical Files Updated"
 S LEXI=0 F  S LEXI=$O(LEXFL(LEXI)) Q:+LEXI=0  S LEXT=$G(LEXT)_", "_LEXI
 S:$E($G(LEXT),1,2)=", " LEXT=$E($G(LEXT),3,$L($G(LEXT)))
 S LEX3=$G(LEXT),LEX1=$P($G(LEXT),", ",1,($L($G(LEXT),", ")-1))
 S LEX2=$P($G(LEXT),", ",$L($G(LEXT),", "))
 S LEXT="File"_$S(LEX3[", ":"s",1:"")_" "_LEX1
 S:$L(LEX2)&($L(LEXT)) LEXT=LEXT_$S($L(LEX1):" and ",1:"")_LEX2
 S:$L(LEXT) LEXT=LEXT_$S($L(LEX1):" were ",1:" was ")_"updated" S:$L(LEX3) X=LEXT D BL,TL(X)
 S X="Protocol 'LEXICAL SERVICES UPDATE' was invoked" D TL(X)
 S X="Subscribing applications were notified of the "_LEXUP_"update" D TL(X),BL
 Q
NF ; Import Global Not Found
 D PB("Import Global ^LEXM not found, consult the installation instructions")
 D TL("to install this global")
 Q
IG ; Invalid Import Global
 D PB("Invalid Import Global ^LEXM, please consult the installation")
 D TL("instructions to reload this global")
 Q
BL ; Blank Line
 N X S X="" W:'$D(XPDNM) ! D:$D(XPDNM) MES^XPDUTL(X) Q
PB(X) ; Preceeding Blank Line
 S X=$G(X) Q:'$L(X)  W:'$D(XPDNM) !!,X D:$D(XPDNM) BMES^XPDUTL(X) Q
TL(X) ; Text Line
 S X=$G(X) Q:'$L(X)  W:'$D(XPDNM) !,X D:$D(XPDNM) MES^XPDUTL(X) Q
HACK(X) ; Time Hack
 S X=$$NOW^XLFDT Q X
ELAP(X1,X2) ; Elapsed Time (start,end)
 N X S X=$$FMDIFF^XLFDT(+($G(X2)),+($G(X1)),3)
 S:X="" X="00:00:00" S X=$TR(X," ","0") S X1=X Q X1
 Q
CHECKSUM ; ^LEXM Checksum for Environment Check
 W !!,"Running checksum routine on the ^LEXM import global, please wait"
 N LEXCHK,LEXNDS,LEXVER S LEXCHK=+($G(^LEXM(0,"CHECKSUM")))
 S LEXNDS=+($G(^LEXM(0,"NODES"))),LEXVER=+($$VER(LEXCHK,LEXNDS))
 W ! W:LEXVER>0 "  ok",!
 D:LEXVER=0 ET("Import global ^LEXM is missing.  Please obtain a copy of ^LEXM before"),ET("continuing.")
 D:LEXVER=-1 ET("Unable to verify checksum for import global ^LEXM (possibly corrupt). "),ET("Please obtain a new copy of ^LEXM before continuing.")
 D:LEXVER=-2 ET("Import global ^LEXM failed checksum.  Please obtain a new copy of ^LEXM"),ET("before continuing.")
 I LEXVER=-3 D
 . D ET("Import global ^LEXM failed checksum.  Additionally, your copy of the import")
 . D ET("global ^LEXM is not complete (the number of global nodes exported and the")
 . D ET("number of global nodes received do not match).  Please obtain a new copy of")
 . D ET("^LEXM before continuing.")
 D:$D(LEXE)&('$D(XPDNM)) ED
 Q
VER(X1,X2) ; Verify ^LEXM Global
 Q:'$D(^LEXM) 0
 N LEXC,LEXCHK,LEXCNT,LEXD,LEXE,LEXGCS,LEXL,LEXLC,LEXN,LEXNC
 N LEXNDX,LEXP,LEXS,LEXT
 S LEXCHK=+($G(X1)),LEXNDS=+($G(X2)) Q:LEXCHK'>0!(LEXNDS'>0) -1
 S LEXL=68,(LEXCNT,LEXLC)=0,LEXS=+(LEXNDS\LEXL)
 S:LEXS=0 LEXS=1 W:+($O(^LEXM(0)))>0 !
 S (LEXC,LEXN)="^LEXM",(LEXNC,LEXGCS)=0
 F  S LEXN=$Q(@LEXN) Q:LEXN=""!(LEXN'[LEXC)  D
 . Q:LEXN="^LEXM(0,""CHECKSUM"")"  Q:LEXN="^LEXM(0,""NODES"")"
 . S LEXCNT=LEXCNT+1
 . I LEXCNT'<LEXS S LEXLC=LEXLC+1 W:LEXLC'>LEXL "." S LEXCNT=0
 . S LEXNC=LEXNC+1,LEXD=@LEXN,LEXT=LEXN_"="_LEXD,LEXE=$L(LEXT)
 . F LEXP=1:1:LEXE S LEXGCS=$A(LEXT,LEXP)*LEXP+LEXGCS
 Q:LEXNC'=LEXNDS -3 Q:LEXGCS'=LEXCHK -2 Q 1
KLEXM ; Kill Import Global
 N LEX S LEX=0 F  S LEX=$O(^LEXM(LEX)) Q:+LEX=0  K ^LEMM(LEX)
 K ^LEXM(0)
 Q
ET(X) ; Error Text (save)
 N LEXI S LEXI=+($G(LEXE(0))),LEXI=LEXI+1,LEXE(LEXI)=$G(X),LEXE(0)=LEXI Q
ED ; Error Text (display)
 N LEXI S LEXI=0 F  S LEXI=$O(LEXE(LEXI)) Q:+LEXI=0  W !,LEXE(LEXI)
 W ! K LEXE Q
MIX(X) ; Mixed Case
 S X=$G(X) N LEXTXT,LEXI S LEXTXT=""
 F LEXI=1:1:$L(X," ") S LEXTXT=LEXTXT_" "_$$UP($E($P(X," ",LEXI),1))_$$LO($E($P(X," ",LEXI),2,$L($P(X," ",LEXI))))
 F  Q:$E(LEXTXT,1)'=" "  S LEXTXT=$E(LEXTXT,2,$L(LEXTXT))
 S:$E(LEXTXT,1,3)="Cpt" LEXTXT="CPT"_$E(LEXTXT,4,$L(LEXTXT))
 S:$E(LEXTXT,1,3)="Icd" LEXTXT="ICD"_$E(LEXTXT,4,$L(LEXTXT))
 S X=LEXTXT Q X
UP(X) ; Uppercase
 Q $TR(X,"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")
LO(X) ; Lowercase
 Q $TR(X,"ABCDEFGHIJKLMNOPQRSTUVWXYZ","abcdefghijklmnopqrstuvwxyz")
