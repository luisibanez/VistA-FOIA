PXRMEUT ; SLC/PJH - General extract utilities ;10/31/2002
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;=======================================================================
ASK(ANS,TEXT,RTN,HLP) ;
 N X,Y
 K DIROUT,DIRUT,DTOUT,DUOUT
 S ANS=""
 S DIR(0)="YA0"
 S DIR("A")=TEXT
 S DIR("B")="N"
 S DIR("?")="Enter Y or N. For detailed help type ??"
 S DIR("??")=U_"D HELP^"_RTN_"(HLP)"
 W !
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 S ANS=$E(Y(0))
 Q
 ;
 ;=======================================================================
CALC(NEXT,START,END) ;Calculate period start and end dates
 ;Next is current run period
 N CMON,CYR,ETYPE,NMON,NYR,PERIOD,YEAR
 ;extract year and period (M1,M2,Q1,Q2,Y etc)
 I NEXT["/" S YEAR=$P(NEXT,"/",2),PERIOD=$P(NEXT,"/"),ETYPE=$E(PERIOD)
 I NEXT?4N S YEAR=NEXT,PERIOD="",ETYPE="Y"
 ;Two digit year
 S CYR=$E(YEAR,3,4),NYR=CYR
 ;If yearly use Jan 1st of current year and next
 I ETYPE="Y" D
 .S CMON="1",NMON="1",NYR=NYR+1
 ;If quarterly use start of first month of next quarter
 I ETYPE="Q" D
 .S CMON=$E(PERIOD,2,99),NMON=CMON*3+1 I NMON>12 S NYR=NYR+1,NMON=1
 .S CMON=CMON*3-2
 ;If monthly use start of next month
 I ETYPE="M" D
 .S CMON=$E(PERIOD,2,99),NMON=CMON+1 I NMON>12 S NYR=NYR+1,NMON=1
 ;Zero fill the month fields
 S CMON=$$RJ^XLFSTR(CMON,2,0),NMON=$$RJ^XLFSTR(NMON,2,0)
 ;Zero fill the year fields
 S CYR=$$RJ^XLFSTR(CYR,2,0),NYR=$$RJ^XLFSTR(NYR,2,0)
 ;Report start date is start of current period 
 S START=3_CYR_CMON_"01"
 ;Report end date is start of next period less one day
 S END=$$FMADD^XLFDT(3_NYR_NMON_"01",-1)
 Q
 ;
 ;=======================================================================
PERIOD(FREQ) ;Calculate next period
 N CMON,CUR,CYR,ETYPE,NEXT,PERIOD,YEAR
 ;Format current date YY/MM/DD
 S CUR=$$FMTE^XLFDT($$NOW^XLFDT,7)
 ;extract year and period
 S YEAR=$P(CUR,"/"),PERIOD=$P(CUR,"/",2)
 ;If yearly current year
 I FREQ="Y" D
 .S NEXT=YEAR
 ;If quarterly use current quarter
 I FREQ="Q" D
 .S NEXT="Q"_((PERIOD-1\3)+1)_"/"_YEAR
 ;If monthly use current month
 I FREQ="M" D
 .S NEXT="M"_PERIOD_"/"_YEAR
 Q NEXT
 ;
 ;=======================================================================
DATES(BDATE,EDATE,LIT) ;Get a past date range.
BEGIN ;Select the beginning date.
 N X,Y,DIR
 K DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="D^:"_DT_":EPTX"
 S DIR("A")="Enter "_LIT_" BEGINNING DATE"
 S DIR("?")="This must be a past date. For detailed help type ??"
 S DIR("??")=U_"D BHELP^PXRMEUT"
 W !
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 S BDATE=Y
 I $E(Y,6,7)="00" W $C(7),"  ?? Enter exact date" G BEGIN
 ;
END ;Select the ending date.
 S DIR(0)="DA^"_BDATE_":"_DT_":EPTX"
 S DIR("A")="Enter "_LIT_" ENDING DATE: "
 S DIR("?")="This must be a past date, but not before "_$$FMTE^XLFDT(BDATE,"D")_". For detailed help type ??"
 S DIR("??")=U_"D EHELP^PXRMEUT"
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT) Q
 I $D(DUOUT) G BEGIN
 S EDATE=Y
 I $E(Y,6,7)="00" W $C(7),"  ?? Enter exact date" G END
 K DIROUT,DIRUT,DTOUT,DUOUT
 Q
 ;
BHELP ;Write the beginning date help.
 N BDHTEXT,%DT
 S BDHTEXT(1)="This is the beginning date for the "_LIT_"."
 D HELP^PXRMEUT(.BDHTEXT)
 S %DT="P",%DT(0)=-DT
 D HELP^%DTC
 Q
 ;
EHELP ;Write the ending date help.
 N EDHTEXT,%DT
 S EDHTEXT(1)="This is the ending date for the "_LIT_"."
 D HELP^PXRMEUT(.EDHTEXT)
 S %DT="P",%DT(0)=-DT
 D HELP^%DTC
 Q
 ;
 ;=======================================================================
HELP(HTEXT) ;General help text routine. Write out the text in the HTEXT
 ;array.
 N DIWF,DIWL,DIWR,IC,X
 S DIWF="C70",DIWL=0,DIWR=70
 K ^UTILITY($J,"W")
 S IC=""
 F  S IC=$O(HTEXT(IC)) Q:IC=""  D
 . S X=HTEXT(IC)
 . D ^DIWP
 W !
 S IC=0
 F  S IC=$O(^UTILITY($J,"W",0,IC)) Q:IC=""  D
 . W !,^UTILITY($J,"W",0,IC,0)
 K ^UTILITY($J,"W")
 W !
 Q
 ;
 ;=======================================================================
MES(TEXT) ;General mail message
 N XMSUB
 K ^TMP("PXRMXMZ",$J)
 S XMSUB="CLINICAL REMINDER EXTRACT"
 S ^TMP("PXRMXMZ",$J,1,0)=TEXT
 D SEND^PXRMMSG(XMSUB)
 Q
