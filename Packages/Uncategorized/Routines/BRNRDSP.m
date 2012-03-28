BRNRDSP ; IHS/PHXAO/TMJ - ROI DISPLAY OF DISCLOSURE ; 
 ;;2.0;RELEASE OF INFO SYSTEM;;APR 10, 2003
 ;
START ;
 D GETREF
 Q:BRNQ
 ;
START2 ;EP To Display a Disclosure Record
 D BROWSE
 D XIT
 Q
 ;
GETREF ; GET DISCLOSURE
 S BRNQ=1
 W !
 S DIC="^BRNREF(",DIC(0)="AEMQ",DIC("A")="Select ROI DISCLOSURE by Patient or by Disclosure Date or #: "
 D DIC^BRNFMC
 Q:Y<1
 S BRNRIEN=+Y
 S BRNQ=0
 Q
 ;
BROWSE ;
 S XBRP="DISP^BRNRD1"
 S XBRC="",XBRX="XIT^BRNRD1",XBIOP=0 D ^XBDBQUE
 ;D VIEWR^XBLM("^BRNVLP")
 Q
XIT ;EP
 D ^BRNKILL
 K ^TMP("BRNRDSP",$J)
 Q
DISP ;EP
 D EN^VALM("BRN RECORD DISPLAY")
 D CLEAR^VALM1
 Q
HDR ; -- header code
 S VALMHDR(1)="User:  "_$P(^VA(200,DUZ,0),U)
 Q
 ;
INIT ; -- init variables and list array
 D EP^BRNRD(BRNRIEN)
 S VALMCNT=$O(^TMP("BRNRDSP",$J,""),-1)
 Q
 ;
HELP ; -- help code
 S X="?" D DISP^XQORM1 W !!
 Q
 ;
EXIT ; -- exit code
 Q
