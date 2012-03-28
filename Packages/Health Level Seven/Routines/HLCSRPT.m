HLCSRPT ;ISC-SF/RAH-TRANS LOG CONTROL & MISC ;06/23/99  11:10 AM [ 04/02/2003   8:38 AM ]
 ;;1.6;HEALTH LEVEL SEVEN;**1004**;APR 1, 2003
 ;;1.6;HEALTH LEVEL SEVEN;**19,50**;Oct 13, 1995
 ;
 Q
 ;
EN ; Entry Point
 I '$$TEST^DDBRT S IOP="HOME" D ^%ZIS I '$$TEST^DDBRT W !!," ===>> Screen Attributes NOT Defined. Use ^ZU or ^XUP before invoking.",!! D EXIT H 3 Q
 D SCREEN
 S HLCSNREC=BLDON_" ===>>>  NO MATCHING RECORDS  <<<=== "_BLDOFF
 S HLCSPTR=1,HLCSRNO=1
 S VERS22=""
 I 22=+$$VERSION^XPDUTL("DI")!($$PATCH^XPDUTL("DI*21.0*32")) S VERS22="YES"
 I VERS22'="YES" S ^TMP("DDBPF1Z",$J)="D SHOWMSG^HLCSRPT Q"
 S ^TMP($J,"LIST","MESSAGE TEXT")="^TMP($J,""MESSAGE"",HLCSRNO)"
 S ^TMP($J,"LIST","IEN RECORD #   MESSAGE ID #         Log Link   Msg:Evn IO Sndg Apl Rcvr Apl HDR")="^TMP(""TLOG"",$J)"
 ;
REEN ; Internal Re-entry Point
 W @IOF,! S HLCSHDR="Search Transmission Log" D HLCSBAR
 K DIR,OUT,DIC,STOP,Y W !!
 S DIR("A")="Selection"
 S DIR(0)="SO^M:Message Search;P:Pending Transmissions;E:Error Listing;Q:Quit (also uparrow, or <RETURN>)"
 D ^DIR G:$D(DIRUT)!(X="") EXIT S ACTION=X,ACTION=$TR(ACTION,"mpeq","MPEQ")
 K DIR,X,Y
 S (HLCSAL,HLCSLS,HLCSES)=0
 I ACTION="Q" G EXIT
 I "MPE"'[ACTION G ENEND
 I ACTION="P" S HLCSPS=1 D EN^HLCSRPT1 G REEN
 I ACTION="E" S HLCSERR=1 D EN^HLCSRPT2 G REEN
 I ACTION="M" D ADVSRCH^HLCSRPT3 G REEN
 ;
ENEND ;
 K DIR,OUT,DIC,STOP,X,Y,ACTION
 G REEN
 ;
GETTIME ;
 W @IOF,! S HLCSHDR="Start/Stop Time Selection" D HLCSBAR
GETSTART ;
 W !!,"  Enter START Date and Time. Date is required.",!
 S DIR(0)="D^::AEPSTX",DIR("?")="^D HELP^%DTC",DIR("B")="T"
 D ^DIR S:$D(DIRUT)!(X="") STOP=1 I $D(STOP) K DIR,X,Y Q
 I Y'["." S Y=Y_".000001"
 S HLCSST=Y K DIR,X,Y
GETEND ;
 W !!,"  Enter END Date and Time. Date is required.",!
 S DIR(0)="D^::AESTX",DIR("?")="^D HELP^%DTC",DIR("B")="NOW"
 D ^DIR S:$D(DIRUT)!(X="") STOP=1 I $D(STOP) K DIR,X,Y Q
 I Y'["." S Y=Y_".235959"
 S HLCSET=Y K DIR,X,Y
 Q
 ;
DISPLAY ; common display method
 ; clean-up here
 S HLCSPTR=$P(^TMP("TLOG",$J,1)," "),HLCSK=$O(^HLMA("C",HLCSPTR,0))
 S HLCSPTR=+$P($G(^HLMA(+HLCSK,0)),U)
 I VERS22'="YES" D DOCLIST^DDBR("^TMP($J,""LIST"")","NR")
 E  D BROWSE^DDBR("^TMP(""TLOG"",$J)","NA",HLCSTITL)
 Q
 ;
FORMAT ; Format a report line
 S HLCSY=""
 S HLCSRNO=HLCSJ,SPACE20="                    "
 I VERS22'="YES" D
 . S HLCSRNO=HLCSRNO_SPACE20 S HLCSRNO=$E(HLCSRNO,1,14) S HLCSY=HLCSRNO_" "
 . S HLCSMID=$P(HLCSX,U,2),HLCSMX=HLCSMID,HLCSPTR=$P(HLCSX,U,1)
 . S HLCSMID=HLCSMID_SPACE20 S HLCSMID=$E(HLCSMID,1,20)
 . S HLCSY=HLCSY_HLCSMID_" "
 I VERS22="YES" D
 . S HLCSMID=$P(HLCSX,U,2),HLCSMX=HLCSMID,HLCSPTR=$P(HLCSX,U,1)
 . S HLCSMID="$.%$CREF$^TMP($J,""MESSAGE"","_HLCSRNO_")$CREF$^"_HLCSMX_"$.%"
 . S Y=$L(HLCSMX),X=$E(SPACE20,1,20-Y) S HLCSMID=HLCSMID_X K X,Y
 . S HLCSY=HLCSMID_" "
 . S HLCSDTE=$P(HLCSX,U,1)
 . S HLCSDTE=$P(^HL(772,HLCSDTE,0),U,1)
 . S YR=$E(HLCSDTE,2,3),MO=$E(HLCSDTE,4,5),DAY=$E(HLCSDTE,6,7)
 . S HLCSDTE=MO_DAY_YR_"."_$P(HLCSDTE,".",2)
 . S HLCSDTE=HLCSDTE_SPACE20,HLCSDTE=$E(HLCSDTE,1,14)
 . S HLCSY=HLCSY_HLCSDTE_" "
 S HLCSY=HLCSY_$E(HLCSLNK_SPACE20,1,10)_" "
 S HLCSY=HLCSY_HLCSEVN_" "
 S HLCSTYP=$P(HLCSX,U,3) S:HLCSTYP="O" HLCSTYP="OT" S:HLCSTYP="I" HLCSTYP="IN"
 S HLCSY=HLCSY_$E(HLCSTYP_SPACE20,1,2)_" "
 S HLCSSRVR=$P(HLCSX,U,11) I HLCSSRVR'="",($D(^HL(771,HLCSSRVR,0))) S HLCSSRVR=$P(^HL(771,HLCSSRVR,0),U,1)
 S HLCSY=HLCSY_$E(HLCSSRVR_SPACE20,1,8)_" "
 S HLCSCLNT=$P(HLCSX,U,12) I HLCSCLNT'="",($D(^HL(771,HLCSCLNT,0))) S HLCSCLNT=$P(^HL(771,HLCSCLNT,0),U,1)
 S HLCSY=HLCSY_$E(HLCSCLNT_SPACE20,1,8)
 S HLCSLN=HLCSLN+1
 I VERS22'="YES" S HLCSY=HLCSY_" " I $D(^HLMA(HLCSJ,"MSH",1,0)) S HLCSY=HLCSY_^HLMA(HLCSJ,"MSH",1,0)
 S ^TMP("TLOG",$J,HLCSLN)=HLCSY
 I VERS22="YES" S ^TMP($J,"MESSAGE",HLCSJ)="$XC$^D SHOWMSG^HLCSRPT1("_HLCSJ_","_HLCSPTR_")$XC$^MESSAGE"
 Q
 ;
HLCSBAR ; Center Title on Top Line of Screen
 W RVON,?(80-$L(HLCSHDR)\2),HLCSHDR,$E(SPACE,$X,77),RVOFF,!
 Q
 ;
EXIT ;
 K DIR,OUT,DIC,STOP,I,X,Y,ACTION,DIRUT,DTOUT,DUOUT
 K HLCSHDR,HLCSLN,HLCSI,HLCSJ,HLCSY,HLCSX,HLCSRNO
 K HLCSLINK,HLCSLNK,HLCSEVNT,HLCSEVN,HLCSMID,HLCSTYP,HLCSSRVR,HLCSCLNT
 K RVON,RVOFF,CEOP,BLDON,BLDOFF,SPACE,SPACE20
 K HLCSTEVN,HLCSTEV1,HLCSTEV2,HLCSEVN1,HLCSEVN2
 K HLCSTLNK,HLCSDTP,HLCSDTE,HLCSET,HLCSN,HLCSNREC,HLCSST
 K HLCSTITL,HLCSPTR,HLCSK,SPACE25,SPACE30,SPACE80
 K HLCSAL,HLCSLS,HLCSES,HLCSES1,HLCSES2,HLCSIO,HLCSPS
 K YR,MO,DAY,VERS22,XXY,XXZ,YY1,YY2,Y1Y2,HLCSMX
 K ^TMP($J,"LIST"),^TMP("DDBPF1Z",$J),^TMP("TLOG",$J)
 K ^TMP($J,"MESSAGE")
 Q
 ;
SHOWMSG ; Enable switching to specific message (used by PF1Z).
 ; If VERS22 installed, won't get here.
 W @IOF
 S DIR(0)="F:AE",DIR("A")="Enter Record Number: "
 D ^DIR Q:$D(DIRUT)
 I Y=-1!(X="") Q
 S HLCSRNO=X I '$D(^HLMA(HLCSRNO,0)) D  Q
 . W !!,BLDON,"  ==>  NO SUCH RECORD NUMBER <== ",BLDOFF H 3
 S HLCSPTR=$P(^HLMA(HLCSRNO,0),"^",1)
 S XXY=HLCSRNO,XXZ=HLCSPTR D SHOWMSG^HLCSRPT1(XXY,XXZ)
 D SWITCH
 Q
SWITCH ; per interim DBIA, until VA Fileman v22.0 released.
 N DDBLN,DDBZ,DIC,DIR,X,Y,DIRUT,DIROUT,DUOUT,DILN
 S DILN=DDBRSA(DDBRSA,"DDBSRL")-2
 S:$G(DDBLST)="" DDBLST="^TMP(""DDBLST"",$J)" S DDBLN=$S($D(@DDBLST@("A",DDBSA)):^(DDBSA),1:$O(@DDBLST@(" "),-1)+1)
 I $D(@DDBLST) D
 .I $O(@DDBLST@(" "),-1)=1,$G(@DDBLST@(1,"DDBSA"))=DDBSA Q
 .S DDBZ=$G(@DDBLST@("A",DDBSA),0)
 .S Y=2
 .D SAVEDDB^DDBR2(DDBLST,DDBLN),USAVEDDB^DDBR2(DDBLST,+Y)
 .S DIROUT=1
 N DDBLNA
 I $G(DDBLNA,-1)=-1 G PS
 I $G(DDBLNA(6))=DDBSA G PS  ;if current doc re-selected
 I $G(DDBLNA(6))]"",$D(@DDBLST@("APSA",DDBSA)) G PS  ;on list
 D:DDBLNA>0 SAVEDDB^DDBR2(DDBLST,DDBLN),WP^DDBR2(.DDBLNA)
PS D PSR^DDBR0(1)
 Q
 ;
HELP ;
 W !,"DATE AND TIME ARE BOTH REQUIRED"
 Q
 ;
SCREEN ;screen I/O parameteters
 S SPACE80=" "
 F I=1:1:80 S SPACE80=SPACE80_" "
 S SPACE=SPACE80
 S SPACE20=$E(SPACE,1,20),SPACE25=$E(SPACE,1,25),SPACE30=$E(SPACE,1,30)
 S X="IORVON;IORVOFF;IOINHI;IOINLOW" D ENDR^%ZISS
 S RVON=IORVON,RVOFF=IORVOFF,BLDON=IOINHI,BLDOFF=IOINLOW
 D KILL^%ZISS
 Q
