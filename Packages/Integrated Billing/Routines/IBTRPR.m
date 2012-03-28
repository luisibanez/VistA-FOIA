IBTRPR	;ALB/AAS - CLAIMS TRACKING - PENDING WORK SCREEN ; 22-JUL-1993
	;;Version 2.0 ; INTEGRATED BILLING ;; 21-MAR-94
	;;Per VHA Directive 10-93-142, this routine should not be modified.
	;
%	;
EN	; -- main entry point for IBT EDIT PENDING REVIEW from menu's
	I '$D(DT) D DT^DICRW
	K XQORS,VALMQUIT,VALMEVL,IBTRN,IBTRV,IBTRC,IBTRD,DFN,IBCNS,IBFASTXT
	W !!,"Pending Reviews Option",!
	D DATE^IBTRPR0
	D SORT^IBTRPR0
	S IBTWHO="A" I IBSORT="A" D WHOSE^IBTRPR0
	S IBTPRT="B",VAUTD=1 I IBSORT="T" D TYPE^IBTRPR0
	I $D(VALMQUIT) G ENQ
	I '$G(IBTRPRF) S IBTRPRF=12
	D EN^VALM("IBT EDIT PENDING REVIEW")
ENQ	K IBFASTXT,VALMQUIT,IBSORT,IBTPBDT,IBTPEDT,DIR,DIRUT,DUOUT,X,Y,IBTRN,IBTRV,IBTRC,IBTRD,DFN,IBCNS,XQORS,IBTRPRF,IBQUIT,IBTWHO,IBTPRT,DIC,DR,DIE,DA,I,J
	K IBAMT,IBAPR,IBADG,IBDA,IBDGCR,IBDGCRU1,IBDV,IBETYP,IBETYPD,IBI,IBICD,IBLCNT,IBSEL,IBT,IBTEXT,IBTNOD,IBTSAV,VAUTD
	K IBAPEAL,IBCDFN,IBCNT,IBDEN,IBDENIAL,IBDENIAL,IBPARNT,IBPEN,IBPENAL,IBTCOD,IBTRDD,IBTRSV,IBTYPE,VAINDT,VA
	D KVAR^VADPT
	 K IBFASTXT,IBSCP,IBOTB,XQORS,VALMEVL,DFN,IBTRN,IBTRV,IBTRC,IBTRD,IBCNS,IBCDFN,VA,VAERR,VA200,IBCNT,IBI,IBTBDT,IBTEDT,IBUR,IBTRPRF,VAEL,VAIN,PRECERT,IBAMNT,IBDGCR,IBDGCRU1,IBETYP,IBETYPD,IBLCNT,IBTEXT,IBTRND,X,Y,Z,IBTMPNM
	Q
	;
HDR	; -- header code
	S VALMHDR(1)="List of PENDING WORK for: "_$$DAT1^IBOUTL(IBTPBDT,"2P")_"  to  "_$$DAT1^IBOUTL(IBTPEDT,"2P")
	S VALMHDR(2)=""
	Q
	;
INIT	; -- init variables and list array
	S U="^",VALMCNT=0,VALMBG=1
	K ^TMP("IBTRPR",$J),^TMP("IBTRPRDX",$J)
	K I,X,XQORNOD,DA,DR,DNM,DQ
	;
	; -- run the scheduled admissions list
	D ^IBTRKR2 W !!,"Building your work list..."
	D BLD
	Q
	;
BLD	; -- build list
	;  1.  build pending hospital reviews
	;  2.  build pending insurance reviews
	;
	K ^TMP("IBTRPR",$J),^TMP("IBTRPRDX",$J),^TMP("IBSRT",$J),^TMP("IBSRT1",$J)
	N IBI,J
	S (IBCNT,VALMCNT)=0,IBI=""
	I '$D(IBTPRT) S IBTRPT="B"
	I '$D(IBTWHO) S IBTWHO="A"
	I '$G(IBTRPRF) S IBTRPRF=12
	I IBTRPRF<10 S X=$S(IBTRPRF=1:"IBTRPR  HR MENU",IBTRPRF=2:"IBTRPR  IR MENU",1:"IBTRPR  MENU") D PROT(X)
	D:IBTRPRF[1 1^IBTRPR01
	D:IBTRPRF[2 2^IBTRPR01
	;
	; -- go through sorted list
	S IBDV="" F  S IBDV=$O(^TMP("IBSRT",$J,IBDV)) Q:IBDV=""  S TYPE="" F  S TYPE=$O(^TMP("IBSRT",$J,IBDV,TYPE)) Q:TYPE=""  D
	.S IBI="" F  S IBI=$O(^TMP("IBSRT",$J,IBDV,TYPE,IBI)) Q:IBI=""  S IBJ="" F  S IBJ=$O(^TMP("IBSRT",$J,IBDV,TYPE,IBI,IBJ)) Q:IBJ=""  D
	..S IBK="" F  S IBK=$O(^TMP("IBSRT",$J,IBDV,TYPE,IBI,IBJ,IBK)) Q:IBK=""  S IBL="" F  S IBL=$O(^TMP("IBSRT",$J,IBDV,TYPE,IBI,IBJ,IBK,IBL)) Q:IBL=""  D
	...S IBDATA=^TMP("IBSRT",$J,IBDV,TYPE,IBI,IBJ,IBK,IBL)
	...S IBTRN=+IBDATA,ENTRY=$P(IBDATA,"^",2)
	...S IBDATE=$P(IBDATA,"^",3),DFN=$P(IBDATA,"^",4),IBWARD=$P(IBDATA,"^",5)
	...S IBSTATUS=$P(IBDATA,"^",6),IBREV=$P(IBDATA,"^",7)
	...S IBASSIGN=$P(IBDATA,"^",9),IBNEXT=$P(IBDATA,"^",10)
	...S IBFLAG=$O(^TMP("IBSRT1",$J,DFN,"")),IBFLAG=$O(^TMP("IBSRT1",$J,DFN,IBFLAG)) I IBFLAG'="" S IBFLAG="+"
	...S FILE=$P(IBDATA,"^",8)
	...D PID^VADPT
	...S IBCNT=IBCNT+1 D BLD1^IBTRPR0
	...Q
	K ^TMP("IBSRT",$J),^TMP("IBSRT1",$J)
	Q
	;
HELP	; -- help code
	S X="?" D DISP^XQORM1 W !!
	Q
	;
EXIT	; -- exit code
	K ^TMP("IBTRPR",$J),^TMP("IBTRPRDX",$J)
	K I,J,X,Y,ENTRY,FILE,IBDATE,IBJ,IBNEXT,IBREV,IBSTATUS,IBTPEDT,IBTPBDT,IBTRC,IBTRN,IBTRV,TYPE,VA,VAERR,IBASSIGN,IBCNT,IBDATA,IBFLAG,IBK,IBL,IBSORT,IBWARD,IBTSORT
	D FULL^VALM1,CLEAN^VALM10
	Q
	;
PROT(X)	; -- set protocol menu
	N DIC,Y
	I $G(X)'="" S DIC=101,DIC(0)="N" D ^DIC
	I +Y S VALM("PROTOCOL")=+Y_";ORD(101,"
PROTQ	Q
