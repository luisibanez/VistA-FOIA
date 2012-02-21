PXRMETH ; SLC/PKR/PJH - Reminder Extract History ;03/19/2004
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;Main entry point for PXRM EXTRACT HISTORY
START(IEN) N VALMBCK,VALMCNT,VALMSG,X,XMZ,XQORM,XQORNOD
 ;Details of last run
 N DATA,NPERIOD,NSDATE,NTAS,PXRMVIEW
 S DATA=$G(^PXRM(810.2,IEN,0))
 ;S NPERIOD=$P(DATA,U,6),NSDATE=$P(DATA,U,7),NTASK=$P(DATA,U,8)
 S NPERIOD=$P(DATA,U,6),NSDATE=$P(DATA,U,7)
 ;Default view is in date created order
 S PXRMVIEW="D"
 S X="IORESET"
 D ENDR^%ZISS
 S VALMCNT=0
 D EN^VALM("PXRM EXTRACT HISTORY")
 Q
 ;
ENTRY ;Entry code
 D BLDLIST^PXRMETH1(IEN),XQORM
 Q
 ;
EXIT ;Exit code
 K ^TMP("PXRMETH",$J)
 K ^TMP("PXRMETHH",$J)
 D CLEAN^VALM10
 D FULL^VALM1
 S VALMBCK="Q"
 Q
 ;
HDR ; Header code
 N VIEW
 S VIEW=$S(PXRMVIEW="D":"Creation Date Order",1:"Extract Period Order")
 S VALMHDR(2)="          Extract Type: "_$P($G(^PXRM(810.2,IEN,0)),U)
 S VALMHDR(3)="   Next Extract Period: "_NPERIOD
 S VALMHDR(4)="      Scheduled to Run: "_NSDATE
 S VALMHDR(4)=$$LJ^XLFSTR(VALMHDR(4),45)_"    View: "_VIEW
 S VALMSG="+ Next Screen   - Prev Screen   ?? More Actions"
 Q
 ;
HLP ;Help code
 N ORU,ORUPRMT,SUB,XQORM
 S SUB="PXRMETHH"
 D EN^VALM("PXRM EXTRACT HELP")
 Q
 ;
INIT ;Init
 S VALMCNT=0
 Q
 ;
PEXIT ;PXRM EXCH MENU protocol exit code
 S VALMSG="+ Next Screen   - Prev Screen   ?? More Actions"
 D XQORM
 Q
 ;
XQORM S XQORM("#")=$O(^ORD(101,"B","PXRM EXTRACT HISTORY SELECT ENTRY",0))_U_"1:"_VALMCNT
 S XQORM("A")="Select Item: "
 Q
 ;
XSEL ;PXRM EXTRACT HISTORY SELECT ENTRY validation
 N SEL,PXRMSIEN
 S SEL=$P(XQORNOD(0),"=",2)
 ;Remove trailing ,
 I $E(SEL,$L(SEL))="," S SEL=$E(SEL,1,$L(SEL)-1)
 ;Invalid selection
 I SEL["," D  Q
 .W $C(7),!,"Only one item number allowed." H 2
 .S VALMBCK="R"
 I ('SEL)!(SEL>VALMCNT)!('$D(@VALMAR@("IDX",SEL))) D  Q
 .W $C(7),!,SEL_" is not a valid item number." H 2
 .S VALMBCK="R"
 ;
 ;Get the list ien.
 S PXRMSIEN=^TMP("PXRMETH",$J,"IDX",SEL,SEL)
 ;
 ;Full screen mode
 D FULL^VALM1
 ;
 ;Options
 N X,Y,DIR,OPTION K DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="SBM"_U_"ES:Extract Summary;"
 S DIR(0)=DIR(0)_"MT:Manual Transmission;"
 S DIR(0)=DIR(0)_"TH:Transmission History;"
 S DIR("A")="Select Action"
 S DIR("B")="ES"
 S DIR("?")="Select from the codes displayed. For detailed help type ??"
 S DIR("??")=U_"D HELP^PXRMETH(1)"
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) S VALMBCK="R" Q
 S OPTION=Y
 ;
 ;Display Extract Summary
 I OPTION="ES" D
 .D START^PXRMETT(PXRMSIEN)
 ;
 ;Transmission option
 I OPTION="MT" D
 .N ANS,DUOUT,DTOUT,RTN,TEXT
 .S TEXT="Transmit this extract to AAC : ",ANS="",RTN="PXRMETH"
 .D ASK^PXRMEUT(.ANS,TEXT,RTN,3) Q:$D(DUOUT)!$D(DTOUT)
 .I ANS="Y" D TRANS^PXRMETX(PXRMSIEN)
 ;
 ;Transmission History
 I OPTION="TH" D
 .D START^PXRMETHL(PXRMSIEN)
 ;
 S VALMBCK="R"
 Q
 ;
HELP(CALL) ;General help text routine.
 N HTEXT
 I CALL=1 D
 .S HTEXT(1)="Select ES to view the details of an extract or run a compliance"
 .S HTEXT(2)="report for the extract. Select MT to transmit extract details to the AAC."
 .S HTEXT(3)="Select TH to view the transmission history for an extract."
 ;
 D HELP^PXRMEUT(.HTEXT)
 Q
 ;
EXTRACT(IEN) ;Run Extract/Transmission
 ;
 ;Reset screen mode
 W IORESET
 ;Refresh on exit
 S VALMBCK="R"
 ;
 ;Get details from parameter file
 N ANS,DATA,DUOUT,DTOUT,EDATE,FREQ,MODE
 N NAME,NEXT,RTN,REPL,STATUS,SNEXT,TEXT,XMIT
 S DATA=$G(^PXRM(810.2,IEN,0))
 ;Determine Extract Name and Frequency
 S NAME=$P(DATA,U),FREQ=$P(DATA,U,3),NEXT=$P(DATA,U,6),RTN="PXRMETX"
 ;Save next scheduled extract
 S SNEXT=NEXT
 ;Select extract period
EXSEL D SELECT(FREQ,.NEXT) Q:$D(DUOUT)!$D(DTOUT)
 ;Warn if period is still open
 D WARN(NEXT,.STATUS)
 ;Option to continue
 S TEXT="Are you sure you want to run a "_NAME_" extract for "_$TR(NEXT,"/"," ")_": "
 D ASK^PXRMEUT(.ANS,TEXT,RTN,1) Q:$D(DUOUT)!$D(DTOUT)  Q:ANS="N"
 ;Option to transmit
 S TEXT="Transmit extract results to AAC : "
 D ASK^PXRMEUT(.ANS,TEXT,RTN,3) Q:$D(DUOUT)!$D(DTOUT)  S XMIT=ANS
 ;Option to replace scheduled run
 S REPL=0
 I XMIT="Y",SNEXT=NEXT,STATUS="COMPLETE" D  Q:$D(DUOUT)!$D(DTOUT)
 .S TEXT="Does this extract replace the scheduled extract: "
 .D ASK^PXRMEUT(.ANS,TEXT,RTN,4) Q:$D(DUOUT)!$D(DTOUT)
 .I ANS="Y" S REPL=1
 ;
 ;Note that the manual extract does not update 810.2
 ;exept if the selected period is the same as the scheduled
 ;period AND this period is complete
 ;
 ;Default is to extract and transmit and not update 810.2
 S MODE=2 I XMIT="N" S MODE=3
 ;Update 810.2 if this extract is for current completed period
 I REPL S MODE=0 I XMIT="N" S MODE=1
 ;
 ;D RUN^PXRMETX(IEN,NEXT,MODE) Q
 ;
 ;Extract/transmission run
 N ZTDESC,ZTDTH,ZTIO,ZTRTN,ZTSAVE
 S ZTDESC="Reminder Extract "_NAME
 S ZTRTN="RUN^PXRMETX(IEN,NEXT,MODE)"
 S ZTSAVE("IEN")=""
 S ZTSAVE("MODE")=""
 S ZTSAVE("NEXT")=""
 ;S ZTSAVE("PATCREAT")=""
 S ZTIO=""
 ;
 ;Select and verify start date/time for task
 N DIR,DTOUT,DUOUT,MINDT,SDTIME,STIME,X,Y
 S MINDT=$$NOW^XLFDT
 W !,"Queue a "_ZTDESC_" for "_NEXT
 S DIR("A",1)="Enter the date and time you want the job to start."
 S DIR("A")="It must be on or after "_$$FMTE^XLFDT(MINDT,"5Z")_": "
 S DIR(0)="DAU"_U_MINDT_"::RSX"
 D ^DIR
 I $D(DTOUT)!$D(DUOUT) Q
 S SDTIME=Y
 ;
 ;Put the task into the queue.
 S ZTDTH=SDTIME
 D ^%ZTLOAD
 W !,"Task number ",ZTSK," queued." H 2
 ;
 S VALMBCK="Q"
 Q
 ;
SELECT(FREQ,SEL) ;Select extract period
 ;
 N BDATE,EDATE,DA,DIE,DIK,DIR,DR,FDATE,VALID,X
 ;Get the new name.
 F  D  Q:$D(DTOUT)!$D(DUOUT)  Q:SEL]""
 .S DIR("A")="Select EXTRACT PERIOD "
 .I FREQ="M" D
 ..S DIR("A")=DIR("A")_"(Mnn/yyyy)"
 ..S DIR(0)="F"_U_"7:8"_U_"K:'$$VALID^PXRMETH(FREQ,X) X"
 .I FREQ="Q" D
 ..S DIR("A")=DIR("A")_"(Qnn/yyyy)"
 ..S DIR(0)="F"_U_"7:7"_U_"K:'$$VALID^PXRMETH(FREQ,X) X"
 .I FREQ="Y" D
 ..S DIR("A")=DIR("A")_"(yyyy)"
 ..S DIR(0)="N"_U_"2000:2050"_U_"K:(X'?4N) X"
 .;Default is next period
 .S DIR("B")=NEXT
 .W ! D ^DIR Q:$D(DTOUT)!$D(DUOUT)
 .;Calculate beginning and end dates for period
 .S Y=$$UP^XLFSTR(Y) D CALC^PXRMEUT(Y,.BDATE,.EDATE)
 .;Abort if period has not started
 .I $$FMDIFF^XLFDT(BDATE,$$NOW^XLFDT)>0 D   Q
 ..S FDATE=$$FMTE^XLFDT(BDATE,5)
 ..W !,"ERROR -This period does not start until "_FDATE,*7
 .S SEL=Y
 Q
 ;
TLIST ;Extract Totals
 N IND,PXRMSIEN,VALMY
 D EN^VALM2(XQORNOD(0))
 ;If there is no list quit.
 I '$D(VALMY) Q
 ;PXRMDONE is newed in PXRMLPM
 S PXRMDONE=0
 S IND=""
 F  S IND=$O(VALMY(IND)) Q:(+IND=0)!(PXRMDONE)  D
 .;Get the ien.
 .S PXRMSIEN=^TMP("PXRMETH",$J,"IDX",IND,IND)
 .D START^PXRMETT(PXRMSIEN)
 ;
 S VALMBCK="R"
 Q
 ;
TRANS ;Run Transmission
 N IND,PXRMXIEN,VALMY
 D EN^VALM2(XQORNOD(0))
 ;If there is no list quit.
 I '$D(VALMY) Q
 S PXRMDONE=0
 S IND=""
 F  S IND=$O(VALMY(IND)) Q:(+IND=0)!(PXRMDONE)  D
 .;Get the ien.
 .S PXRMXIEN=^TMP("PXRMETH",$J,"IDX",IND,IND)
 .;Transmit extract summary
 .N ANS,DUOUT,DTOUT,RTN,TEXT
 .S TEXT="Transmit this extract to AAC : ",ANS="",RTN="PXRMETH"
 .D ASK^PXRMEUT(.ANS,TEXT,RTN,3) Q:$D(DUOUT)!$D(DTOUT)
 .I ANS="Y" D TRANS^PXRMETX(PXRMXIEN)
 ;
 ;Rebuild workfile
 D BLDLIST^PXRMETH1(IEN)
 ;Refresh
 S VALMBCK="R"
 Q
 ;
TRHIST ;Transmission History
 N IND,PXRMSIEN,VALMY
 D EN^VALM2(XQORNOD(0))
 ;If there is no list quit.
 I '$D(VALMY) Q
 ;PXRMDONE is newed in PXRMLPM
 S PXRMDONE=0
 S IND=""
 F  S IND=$O(VALMY(IND)) Q:(+IND=0)!(PXRMDONE)  D
 .;Get the ien.
 .S PXRMSIEN=^TMP("PXRMETH",$J,"IDX",IND,IND)
 .D START^PXRMETHL(PXRMSIEN)
 ;
 S VALMBCK="R"
 Q
 ;
VALID(FREQ,INP) ;Validate Period input
 W !
 N PERIOD,YEAR
 ;Convert to upper case
 S INP=$$UP^XLFSTR(INP)
 ;General format
 I $E(INP)'=FREQ D EN^DDIOL("Format should be "_FREQ_"nn/yyyy") Q 0
 S PERIOD=$P(INP,"/"),YEAR=$P(INP,"/",2)
 S PERIOD=$P(PERIOD,FREQ,2)
 ;All runs
 I (YEAR<2000)!(YEAR>2050) D EN^DDIOL("Year should be in range 2000-2050") Q 0
 ;Quarterly run
 I FREQ="Q",(PERIOD>4)!(PERIOD<1) D EN^DDIOL("Quarter should be in range 1-4") Q 0
 ;Monthly run
 I FREQ="M",(PERIOD>12)!(PERIOD<1) D EN^DDIOL("Month should be in range 1-12") Q 0
 ;Otherwise
 Q 1
 ;
VIEW ;Select view
 ;
 W IORESET
 ;
 S VALMBCK="R"
 ;
 N X,Y,CODE,DIR
 K DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="S"_U_"D:Sort by Creation Date;"
 S DIR(0)=DIR(0)_"P:Sort by Extract Period;"
 S DIR("A")="TYPE OF VIEW"
 S DIR("B")=$S(PXRMVIEW="P":"D",1:"P")
 S DIR("?")="Select from the codes displayed. For detailed help type ??"
 ;BOOKMARK - HELP NEEDS MOVING
 S DIR("??")=U_"D HELP^PXRMSEL2(3)"
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 ;Change display type
 S PXRMVIEW=Y
 ;
 ;Rebuild Workfile
 D BLDLIST^PXRMETH1(IEN),HDR
 Q
 ;
WARN(NEXT,STATUS) ;Warn if period is not completed
 N BDATE,EDATE,FDATE
 ;Calculate beginning and end dates for period
 D CALC^PXRMEUT(NEXT,.BDATE,.EDATE)
 ;No warning if period end date is a prior date
 I $$FMDIFF^XLFDT($$NOW^XLFDT,EDATE)>0 S STATUS="COMPLETE" Q
 ;Else Format date
 S FDATE=$$FMTE^XLFDT(EDATE,5),STATUS="INCOMPLETE"
 ;And Warn that period end date is a future date
 W !!,"WARNING -This period is not complete until "_FDATE
 Q
