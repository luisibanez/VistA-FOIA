BLRAL4 ;DAOU/ALA-ListMan program for signed labs 
 ;;5.2T9;LR;**1018**;Nov 17, 2004
 ;;5.2t6;LR;**1013,1015**;Nov 18, 2002
 ;; ;
EN ;EP
 ; -- main entry point for BLRA LAB RESULT SIGN LIST
 D EN^VALM("BLRA LAB RESULT SIGN LIST")
 Q
 ;
HDR ; -- header code
 S VALMHDR(1)=" "
 S VALMHDR(2)=" "
 Q
 ;
INIT ; -- init variables and list array
 D CLEAN^VALM10    ;Clears screen before display of list
 ;
 S BLRALINE=0
 S BLRADT=""
 F  S BLRADT=$O(^TMP("BLRASIGN",$J,BLRADT)) Q:'BLRADT  D
 . S BLRAP=""
 . F  S BLRAP=$O(^TMP("BLRASIGN",$J,BLRADT,BLRAP)) Q:'BLRAP  D
 .. ;----- BEGIN IHS MODIFICATIONS LR*5.2*1018
 .. S BLRSS=""
 .. F  S BLRSS=$O(^TMP("BLRASIGN",$J,BLRADT,BLRAP,BLRSS)) Q:BLRSS=""  D
 ... ;----- END IHS MODIFICATIONS
 ... S BLRALINE=BLRALINE+1,BLRALVAR=""
 ... ;S BLRADATA=$G(^TMP("BLRASIGN",$J,BLRADT,BLRAP))
 ... ;----- BEGIN IHS MODIFICATIONS LR*5.2*1018
 ... S BLRADATA=$G(^TMP("BLRASIGN",$J,BLRADT,BLRAP,BLRSS))
 ... ;----- END IHS MODIFICATIONS
 ... S BLRALVAR=$$SETFLD^VALM1($P(BLRADATA,U,1),BLRALVAR,"ACCESSION")
 ... S BLRALVAR=$$SETFLD^VALM1($P(BLRADATA,U,2),BLRALVAR,"PATIENT")
 ... S BLRALVAR=$$SETFLD^VALM1($P(BLRADATA,U,3),BLRALVAR,"LAB DATE")
 ... S BLRALVAR=$$SETFLD^VALM1($P(BLRADATA,U,4),BLRALVAR,"RESPONSIBLE")
 ... S BLRALVAR=$$SETFLD^VALM1($P(BLRADATA,U,5),BLRALVAR,"SIGNING")
 ... S BLRALVAR=$$SETFLD^VALM1($P(BLRADATA,U,6),BLRALVAR,"DATE/TIME SIGNED")
 ... D SET^VALM10(BLRALINE,BLRALVAR)
 ;
 S VALMCNT=BLRALINE   ;IF LINE CNTER IS NULL THEN THERE WERE NO RESULTS
 I BLRALINE=0 S VALMSG="No Signed Lab Results Found"
 Q
 ;
HELP ; -- help code
 S X="?" D DISP^XQORM1 W !!
 Q
 ;
EXIT ; -- exit code
 Q
 ;
EXPND ; -- expand code
 Q
 ;
