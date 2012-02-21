IBCECSA ;ALB/CXW - IB CLAIMS STATUS AWAITING RESOLUTION SCREEN ;28-JUL-1999
 ;;2.0;INTEGRATED BILLING;**137**;21-MAR-1994
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
EN ; -- main entry point for claims status awaiting resolution
 N IBSORT,IBSORT1,IBSORT2,IBDAYS
 D EN^VALM("IBCEM CSA LIST")
 Q
 ;
HDR ; -- header code
 S VALMSG="* Indicates CSA review in progress"
 Q
 ;
INIT ; -- init variables and list array
 N DIC,DIR,DIRUT,DIROUT,DTOUT,DUOUT,Y,X,IBFIRST
 K ^TMP("IBBIL",$J),^TMP("IBDIV",$J),VALMQUIT
 S VALMCNT=0
 ;
 S DIR(0)="NA^0:999",DIR("B")=0,DIR("A")="MINIMUM # OF DAYS MSGS WAITING TO BE RESOLVED: ",DIR("?")="Enter the minimum number of days you want a message to have been waiting to be resolved before it will be displayed on this screen."
 D ^DIR K DIR
 I $D(DTOUT)!$D(DUOUT) S VALMQUIT=1 G INITQ
 S IBDAYS=Y
 ;
 S IBFIRST=1
 F  S DIC="^VA(200,",DIC(0)="AEQM",DIC("A")=$S(IBFIRST:"",1:" Another ")_"AUTHORIZING BILLER: "_$S(IBFIRST:"ALL// ",1:"") D ^DIC K DIC Q:Y<0  D
 . I $D(^TMP("IBBIL",$J,+Y)) W !,"This biller has already been selected" Q
 . S ^TMP("IBBIL",$J,+Y)="",IBFIRST=0
 I $D(DTOUT)!$D(DUOUT) S VALMQUIT=1 G INITQ
 ;
 S IBFIRST=1
 F  S DIC="^DG(40.8,",DIC(0)="AEQMN",DIC("A")=$S(IBFIRST:"",1:" Another ")_"DIVISION: "_$S(IBFIRST:"ALL//",1:"") D ^DIC K DIC Q:Y<0  S ^TMP("IBDIV",$J,+Y)="",IBFIRST=0
 I $D(DTOUT)!$D(DUOUT) S VALMQUIT=1 G INITQ
 ;
 S DIR("A")="FIRST SORT BY: ",DIR("B")="ERROR CODE"
 S DIR("?")="Enter a code from the list to indicate the order in which to display the messages."
 S DIR(0)="SB^A:AUTHORIZING BILLER;B:BILL NUMBER;D:DIVISION;P:PAYER;N:NUMBER OF DAYS PENDING;E:ERROR CODE"
 D ^DIR K DIR
 I $D(DTOUT)!$D(DUOUT) S VALMQUIT=1 G INITQ
 S IBSORT1=Y
 ;
SEN S DIR("A")="SECONDARY SORT BY: ",DIR("B")=$S(IBSORT1'="A":"AUTHORIZING BILLER",1:"ERROR CODE")
 S DIR("?",1)="Enter a code from the list to indicate how the messages should be ordered if",DIR("?")=" there are duplicate messages for a"
 S DIR("?")=DIR("?")_$S(IBSORT1="A":"n authorizing biller",IBSORT1="B":" bill number",IBSORT1="D":" division",IBSORT1="P":" payer",IBSORT1="N":" # of days pending",1:"n error code")_"."
 S DIR(0)="SB^"
 S DIR(0)=DIR(0)_$S(IBSORT1'="A":"A:AUTHORIZING BILLER;",1:"")_$S(IBSORT1'="B":"B:BILL NUMBER;",1:"")_$S(IBSORT1'="D":"D:DIVISION;",1:"")_$S(IBSORT1'="P":"P:PAYER;",1:"")
 S DIR(0)=DIR(0)_$S(IBSORT1'="N":"N:NUMBER OF DAYS PENDING"_$S(IBSORT1'="E":";",1:""),1:"")_$S(IBSORT1'="E":"E:ERROR CODE",1:"")
 D ^DIR K DIR
 I $D(DTOUT)!$D(DUOUT) S VALMQUIT=1 G INITQ
 S IBSORT2=Y
 ;
 S DIR(0)="SA^R:REJECTS ONLY;B:BOTH INFORMATIONAL AND REJECTS",DIR("A")="(R)ejects only OR (B)oth informational and rejects?: "
 S DIR("?",1)="YOU MAY CHOOSE TO SEE JUST THOSE MESSAGES WE KNOW ARE REJECTS OR YOU MAY",DIR("?")="  CHOOSE TO SEE ALL MESSAGES MEETING YOUR SELECTION CRITERIA",DIR("B")="REJECTS ONLY" W !! D ^DIR K DIR
 I $D(DTOUT)!$D(DUOUT) S VALMQUIT=1 G INITQ
 S IBSEV=Y
 D BLD^IBCECSA1
INITQ Q
 ;
HELP ; -- help code
 S X="?" D DISP^XQORM1 W !!
 S VALMSG="* Indicates review in progress"
 Q
 ;
EXIT ; -- exit code
 K IBDAYS,IBSORT1,IBSORT2
 K ^TMP("IBCECSA",$J),^TMP("IBDIV",$J),^TMP("IBBIL",$J)
 K ^TMP("IBCECSB",$J),^TMP("IBCECSC",$J),^TMP("IBCECSD",$J)
 D CLEAN^VALM10
 Q
