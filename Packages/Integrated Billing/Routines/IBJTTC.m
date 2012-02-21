IBJTTC ;ALB/ARH - TPI AR COMMENT HISTORY ; 06-MAR-1995
 ;;Version 2.0 ; INTEGRATED BILLING ;**39**; 21-MAR-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
 ; AR Profile of Comments:  This screen prints the following Comments:
 ;    Bill Comments (430,98)  - entered during auditing
 ;    For each COMMENT Transaction:
 ;           Brief Comment (433,5.02)
 ;           Transaction Comment (433,86)
 ;           Comment (433,41)
 ;
EN ; -- main entry point for IBJT AR COMMENT HISTORY
 D EN^VALM("IBJT AR COMMENT HISTORY")
 Q
 ;
HDR ; -- header code
 D HDR^IBJTU1(+IBIFN,+DFN,13)
 Q
 ;
INIT ; -- init variables and list array
 K ^TMP("IBJTTC",$J)
 I '$G(DFN)!'$G(IBIFN) S VALMQUIT="" G INITQ
 D BLD
INITQ Q
 ;
HELP ; -- help code
 S X="?" D DISP^XQORM1 W !!
 Q
 ;
EXIT ; -- exit code
 K ^TMP("IBJTTC",$J)
 D CLEAR^VALM1
 Q
 ;
BLD ;
 N X,IBCNT,IBI,IBX,IBD,IBRCT5,IBLN,IBSTR,IBK,IBJ,DIWL,DIWR,DIWF,COM
 ;
 S VALMCNT=0,IBLN=0
 ;
 ; Bill Comments (430,98)
 K COM,^UTILITY($J,"W") D BCOM^RCJIBFN2(IBIFN) I $D(COM)>10 D
 . S IBSTR="",IBD="AR BILL COMMENTS:" S IBSTR=$$SETLN(IBD,IBSTR,25,54),IBLN=$$SET(IBSTR,IBLN)
 . ;
 . S IBJ="" F  S IBJ=$O(COM(IBJ)) Q:'IBJ  S X=$G(COM(IBJ)) I X'="" S DIWL=1,DIWR=54,DIWF=""  D ^DIWP
 . ;
 . I $D(^UTILITY($J,"W")) S (IBK,IBCNT)=0 F  S IBK=$O(^UTILITY($J,"W",1,IBK)) Q:'IBK  D
 .. S IBD=$G(^UTILITY($J,"W",1,IBK,0)) S IBSTR=$$SETLN(IBD,IBSTR,25,54),IBLN=$$SET(IBSTR,IBLN),IBSTR=""
 . K ^UTILITY($J,"W")
 ;
 ; AR profile of comment transactions  (433: 5.02, 41, 86)
 K ^TMP("RCJIB",$J),^UTILITY($J,"W") D TRN^RCJIBFN2(IBIFN)
 I $D(^TMP("RCJIB",$J)) S IBI="" F  S IBI=$O(^TMP("RCJIB",$J,IBI)) Q:'IBI  D
 . S IBX=$G(^TMP("RCJIB",$J,IBI)) I $$STNO^RCJIBFN2(+$P(IBX,U,3))'["COMMENT" Q
 . S IBRCT5=$$N5^RCJIBFN1(IBI)
 . S IBSTR="",IBLN=$$SET(IBSTR,IBLN)
 . S IBD=$P(IBX,U,1) S IBSTR=$$SETLN(IBD,IBSTR,2,8)
 . S IBD=$$DATE(+$P(IBX,U,2)) S IBSTR=$$SETLN(IBD,IBSTR,14,8)
 . S IBD=$P(IBRCT5,U,1) S IBSTR=$$SETLN(IBD,IBSTR,25,30)
 . S IBD="FOLLOW-UP DT: "_$$DATE(+$P(IBRCT5,U,2)) S IBSTR=$$SETLN(IBD,IBSTR,57,22)
 . S IBLN=$$SET(IBSTR,IBLN),IBSTR=""
 . ;
 . ;   -- transaction comments (86)
 . S X=$P($G(^TMP("RCJIB",$J,IBI)),U,6) I X'="" S DIWL=1,DIWR=54,DIWF=""  D ^DIWP
 . ;
 . ;   -- comments  (86 & 41)
 . K COM D N7^RCJIBFN1(IBI) I $D(COM)>2 D
 .. S IBJ="" F  S IBJ=$O(COM(IBJ)) Q:'IBJ  S X=$G(COM(IBJ)) I X'="" S DIWL=1,DIWR=54,DIWF=""  D ^DIWP
 . ;
 . I $D(^UTILITY($J,"W")) S (IBK,IBCNT)=0 F  S IBK=$O(^UTILITY($J,"W",1,IBK)) Q:'IBK  D
 .. S IBD=$G(^UTILITY($J,"W",1,IBK,0)) S IBSTR=$$SETLN(IBD,IBSTR,25,54),IBLN=$$SET(IBSTR,IBLN),IBSTR=""
 . K ^UTILITY($J,"W")
 K ^TMP("RCJIB",$J),^UTILITY($J,"W")
 ;
 I IBLN=0 S IBLN=$$SET("",IBLN),IBLN=$$SET("No Comment Transactions Exist For This Account.",IBLN)
 S VALMCNT=IBLN
 Q
 ;
DATE(X) ; date in external format
 N Y S Y="" I +X S Y=$E(X,4,5)_"/"_$E(X,6,7)_"/"_$E(X,2,3)
 Q Y
 ;
SETLN(STR,IBX,COL,WD) ;
 S IBX=$$SETSTR^VALM1(STR,IBX,COL,WD)
 Q IBX
 ;
SET(STR,LN) ; set up TMP array with screen data
 S LN=LN+1 D SET^VALM10(LN,STR)
SETQ Q LN
