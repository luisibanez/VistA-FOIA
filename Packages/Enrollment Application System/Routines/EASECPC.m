EASECPC ;ALB/PHH,CKN,LBD - LTC Copayment Report; 29-AUG-2001
 ;;1.0;ENROLLMENT APPLICATION SYSTEM;**5,7,19,24,34,40**;Mar 15, 2001
 ;
 ; This routine prints a report of calculated LTC copayments for a veteran.
 ; It is called by menu option EASEC LTC COPAY PRINT
 ;
EN N DFN,EASRPT,EASADM,EASRDT,MAXRT,DGMTI,DGMTDT
 ; Select which report to print (1=Institutional (IP); 2=Non-Institutional (OP))
 S EASRPT=$$RPT Q:'EASRPT
 ; Select Patient
 S DFN=$$GETDFN Q:'DFN
 ; Get most recent LTC Copay Test for patient and set up LTC variables
 I '$$GETLTC(DFN) Q
 ; Get the LTC admission date (if EASRPT=1)
 I EASRPT=1 S EASADM=$$ADMDT Q:'EASADM
 ; Get start date for report
 S EASRDT=$$RPTDT Q:'EASRDT
 ; Run the report
 D QUE
 Q
RPT() ; Select which report to print
 ; Input:   None
 ; Output:  Y - Report Type (1=Institutional (IP); 2=Non-Institutional (OP); 0=Quit)
 N DIR,X,Y,DTOUT,DUOUT,DIRUT,DIROUT
 W !!,"Report of Calculated Long Term Care Copayments"
 W !,"=============================================="
 S DIR(0)="S^1:Institutional (Inpatient);2:Non-Institutional (Outpatient)"
 S DIR("A")="Enter 1 or 2"
 D ^DIR I 'Y!($D(DTOUT))!($D(DUOUT)) Q 0
 Q Y
GETDFN() ; Get the veteran's DFN
 N DIC,DTOUT,DUOUT,X,Y
 W !
 S DIC="^DPT(",DIC(0)="AEMZQ",DIC("S")="I $D(^DGMT(408.31,""AID"",3,+Y))"
 D ^DIC
 Q:$D(DTOUT)!($D(DUOUT)) 0
 Q:Y<0 0
 Q +Y
GETLTC(DFN) ; Get the most recent LTC copay test.  If no completed test on
 ; file, test status is exempt or LTC copay rates not defined, quit 0
 ; Input:   DFN - Patient file IEN
 ; Output:  DGMTI - LTC Copay Test IEN (file #408.31)
 ;          DGMTDT - LTC Copay Test Date
 ;          MAXRT - Maximum daily copay rates for OP and IP LTC
 ;          1=OK to continue; 0=Not OK to continue
 N LTC,STAT
 S LTC=$$LST^EASECU(DFN),DGMTI=+LTC
 I 'DGMTI W !!,"No LTC Copayment Test on file for this veteran!" Q 0
 S DGMTDT=$P(LTC,U,2),STAT=$P(LTC,U,3)
 ; Get the maximum daily copay rate for outpatient and inpatient LTC
 ; DBIA #3717
 S MAXRT=$$MAXRATE^IBAECU(DGMTDT)
 I '$P(MAXRT,U)!('$P(MAXRT,U,2)) W !!,"Copayment rates for LTC are not available at this time.",!! Q 0
 ; Check test status, if anything other than Non-Exempt don't continue
 D DIS^EASECU(DFN)
 I STAT="NON-EXEMPT" Q 1
 I STAT="" W !!,"The LTC Copayment Test is incomplete!" Q 0
 I STAT="EXEMPT" W !!,"This veteran is Exempt from LTC copayments!" Q 0
 W !!,"This LTC Copayment Test contains an invalid status!"
 Q 0
ADMDT() ; Get the LTC admission date (for IP report only)
 N DIR,X,Y,DTOUT,DUOUT,DIRUT,DIROUT
 W !
 S DIR(0)="D^::EX"
 S DIR("A")="Enter the LTC Admission Date"
 S DIR("?",1)="Enter the admission date for the current institutional"
 S DIR("?")="Long Term Care episode."
 D ^DIR I 'Y!($D(DTOUT))!($D(DUOUT)) Q 0
 Q Y
RPTDT() ; Get the start date for the report
 N DIR,X,Y,DTOUT,DUOUT,DIRUT,DIROUT,DAYS
RD W !
 S DIR(0)="D^::EMX"
 S DIR("A")="Enter the Report Start Date (Month/Year)"
 S DIR("?",1)="Enter the starting date for the report in the format month/year (e.g. 9/03)."
 S DIR("?",2)="The report will print 12 months of copayments starting with the"
 S DIR("?")="month and year entered."
 D ^DIR I 'Y!($D(DTOUT))!($D(DUOUT)) Q 0
 S DAYS=$$DOM^EASECPC1(Y)
 I (Y+DAYS)<$G(EASADM) W !!,*7,"Report Start Date cannot be before LTC Admission Date!" G RD
 Q Y+DAYS
 ;
QUE ; Get report device. Queue report if requested.
 N POP,ZTRTN,ZTDESC,ZTSAVE
 K IOP,%ZIS
 S %ZIS="MQ"
 W !
 D ^%ZIS I POP W !!,"Report Cancelled!" Q
 I $D(IO("Q")) D  Q
 .S ZTRTN="START^EASECPC1"
 .S ZTDESC="LTC Copay Calculation Report"
 .S (ZTSAVE("DFN"),ZTSAVE("DGMTI"),ZTSAVE("DGMTDT"),ZTSAVE("MAXRT"))=""
 .S (ZTSAVE("EASRPT"),ZTSAVE("EASRDT"))="",ZTSAVE("EASADM")=$G(EASADM)
 .D ^%ZTLOAD
 .W !!,"Report "_$S($D(ZTSK):"Queued!",1:"Cancelled!")
 .D HOME^%ZIS
 D START^EASECPC1,^%ZISC
 Q
