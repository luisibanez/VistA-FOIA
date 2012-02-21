PRS8HR ;HISC/MRL,WCIOFO/JAH-DECOMPOSITION, HOURS ;02/01/06
 ;;4.0;PAID;**2,22,29,42,52,102**;Sep 21, 1995
 ;
 ;This routine is called by ^PRS8PP (premium pay calculator)
 ;=====================================================================
 ; ** indicates incompleted comments
 ;
 ;VARIABLE DEFINITION
 ;
 ; TYP   =  contains codes representing type of employee.
 ;          It's a composite code string w/ characters that
 ;          represent pay plan, duty basis, & normal hours.
 ;    CODE  REPRESENTS      CODE   REPRESENTS
 ;     D     daily            f     firefighter
 ;     W     wagegrade        P     part-time
 ;     N     nurse            d     doctor
 ;     B     baylor plan      dR    doctor/resident or intern
 ;     H     Nurse Hybrid     ""    *
 ;     I     intermittent
 ; VAL   =  Single char code represents employee's work status for
 ;          current 15 min increment.
 ; FLX   =  Flex tour indicator.
 ; TH(W) =  Tour Hours for week 1, TH(1) & week 2, TH(2)
 ; TH    =  Tour Hours
 ; HTP   =  PAYABLE hours worked today.
 ; HT    =  Hours worked today.
 ; AV    =  String w/ most normal types of time (see bottom of PRS8EX)
 ;          does NOT contain premium times or unscheduled time (OoEes4)
 ;====================================================================
 ;
 S AV="1235nHMLSWNARUXYVJFGD"
 ;
 ;   Loop thru each quarter hour segment of day.
 ;   Check for times in AV array.
 ;   Proceed w/ calculation if Overtime worked on Holiday.
 ;
 F M=1:1:96 D
 .  S VAL=$E(D,M)
 .;
 .;    If non premium type of time or (overtime on holiday)
 .;
 .  I AV[VAL!(VAL="O"&($E(DAY(DAY,"HOL"),M)=2)) D CALC
 Q
 ;
 ;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 ;
CALC ; --- Entry point for calculating placement of time
 ;
 ;     Set up variables for calculations and comparisons in this routine
 ;
 N HOLWKD,HOLEX,HOLWKEX
 D ^PRS8HRSV
 ;
 ;     IF intermittent employee on continuation of pay OR overtime on 
 ;     holiday THEN increment Pay Period tour hours and current weeks 
 ;     tour hours.
 ;
 I TYP["I",VAL["V"!(VAL="O"&(HOLWKD)) S TH=TH+1,TH(W)=TH(W)+1
 ;
 ;     IF part time doctor & total hours = 80 & type of
 ;     time is unscheduled, overtime, comptime THEN quit
 ;
 I TYP["d",TYP["P",TH=320,"4OosEe"[VAL Q
 ;
 ;     IF type of time is anything but (leave w/out pay, comp time) 
 ;     THEN increment total hrs(HT) & increment HTP if type of 
 ;     time not non pay or leave w/out pay.
 ;
 ; Update daily counter - *102 added non-pay back into daily count
 ;
 S HT=HT+1,HTP=HTP+1
 ;
 ;---------------------------------------------------------
 ;     IF entitled to VCS commission sales & normal time(1) ??(2,3)
 ;     & holiday excused set X to type of time=Piece Worker Hol excused.
 ;     Then IF part time set X to part time hours code.
 ;
 I $E(ENT,38),"123"[VAL,HOLEX S X=36 D CHK^PRS8HRSV D  Q:X
 .  I TYP["P" S X=32 D CHK^PRS8HRSV
 ;
 ;---------------------------------------------------------------
 ;
 ;     Don't mess w/ fire fighters
 ;
 Q:"Ff"[TYP
 ;
 S GO=0
 ;     IF compressed tour & parttime & tour hours are over 80
 ;     OR tour hours = 80 & it's overtime, comptime, or unscheduled reg.
 ;
 ; Checks for pay period
 I (TH>320&("OoseE4"[VAL))!(TH=320&("OoseE4"[VAL)) S GO=1
 ;
 ; Check for week
 I (TH(W)>160&("OoseE4"[VAL))!(TH(W)=160&("OosEe4"[VAL)) S GO=1
 ;
 ; Check for day
 I HT>32,"OoseE4"[VAL S GO=1
 ;
 ;     Following segment is concerned w/ variations of part time
 ;     employees (TYP["P"), & 1 baylor (TYP["B").
 ;-------------------------------------------------------------------
 ;
 ;     Doctor over 8 hours
 ;
 I TYP["Pd",HT>32 S GO=0 ; part-time doctors PT + PH must = NH
 ;
 ;     Worked holiday
 ;
 I TYP["P",HOLWKD S GO=0
 ;
 ;     Baylor plan & ct/ot/s
 ;
 I TYP["B","EeOos"[VAL S GO=1
 ;
 ;-------------------------------------------------------------------
 ;     GO set in cases where employee maybe eligible for OT
 ;     due to over > 8/day OR > 40/week.
 ;
 S X=0 I GO D TH^PRS8HRSV D OVER840^PRS8HROT Q
 ;
 ;-------------------------------------------------------------------
 ;-------------------------------------------------------------------
 ;     GO not set for compressed schedule of at least 80 hrs.
 ;     GO not set for non compressed schedule of over 40 hrs.
 ;     IF GO is set and we are evaluating normal hours or
 ;     HOLIDAY OVERTIME use NORMHRS to increment TIME
 ;     in week array.  THEN QUIT.
 ;
 S GO=1
 I FLX="C",NH>319 S GO=0
 I FLX'="C",NH(WK)>160,TYP'["Pd" S GO=0 ;IF pt-doctor don't set GO=0
 I GO,"1235nHMLSWNARUXYVJFGD"[VAL!(VAL="O"&(HOLWKD)) D NORMHRS^PRS8HROT Q
 ;
 ;--------------------------------------------------------------------
 ;   Check employees with Normal hours less than 80.
 ;
 I NH'>319 D TH^PRS8HRSV D  Q
 .I FLX="C" D  Q:X
 ..;
 ..;  for non PT employees TIME gets part time hours or unscheduled regular or overtime.
 ..I TYP'["P" S X=$S("OosEe4"'[VAL:32,TYP["P"&(TH'>320):9,"Ee"'[VAL:TOUR+19,1:7) D CHK^PRS8HRSV Q:X
 ..;
 ..; For PT employees review hours worked to determine X
 ..I TYP["P" D  Q:X
 ...I "OosEe4"'[VAL S X=32 ; All tour time = PT/PH
 ...;
 ...; Checks for CT
 ...I "Ee"[VAL D
 ....; <8/DAY & <40/WK & <80/PP = UN/US
 ....I HT'>32,TH(W)'>160,TH'>320 S X=9 Q
 ....S X=7 ; CE/CT
 ...;
 ...; Checks for all other types of time
 ...I "Oos4"[VAL D
 ....I TH>320!(TH(W)>160) S X=TOUR+19 Q  ; OA/OE
 ....I HT>32 S X=TOUR+15 Q  ; DA/DE
 ....S X=9 ; UN/US
 ...D CHK^PRS8HRSV
 .;
 .;     Under 8/day, 40/week, and not coded as overtime or comptime
 .;     or overtime on holiday.
 .;
 .; Checks for non-compressed employees
 .I HT'>32,TH(W)'>160,TH'>320,"OoseE"'[VAL!(VAL="O"&(HOLWKD)) S X=0 D  Q:X
 ..;
 ..;    Not intermittent, normal hours and not unscheduled reg. 
 ..;    TIME gets parttime hours.
 ..;
 ..I TYP'["I",AV[VAL,VAL'=4 S X=32 D CHK^PRS8HRSV Q
 ..;
 ..;    All else fails - TIME gets unscheduled regular.
 ..;
 ..S X=9 D CHK^PRS8HRSV Q
 .;
 .;     Part time doctor w/ unscheduled reg. TIME gets unscheduled reg.
 .; 
 .I TYP["P",TYP["d",VAL=4 S X=9 D CHK^PRS8HRSV Q
 .;
 .;     Over 8/day
 .;
 .; ### THE FOLLOWING CODE WAS SPLIT UP TO MAKE IT MORE LEGIBLE
 .;I HT>32 D G8^PRS8HRSV Q:"^16^17^18^"[("^"_X_"^")  I X!((HTP'>32)&(TH(WK)'<160)) S X=$S(VAL=4!("oseE"[VAL)!(VAL="O"&('HOLWKD)):9,1:32) D CHK^PRS8HRSV Q
 .I HT>32 D G8^PRS8HRSV Q:X
 .; ### REVIEW THE CHECK FOR PT HOURS.  WE MAY BE ABLE TO REMOVE
 .;Q:"^16^17^18^"[("^"_X_"^")
 .;I X!((TH'<320)&(TH(WK)'<160)) D
 .;. S X=$S(VAL=4!("oseE"[VAL)!(VAL="O"&('HOLWKD)):9,1:32)
 .;. D CHK^PRS8HRSV
 .; ### SHOULD WE REPLACE RA/RE W/ SOMETHING ELSE
 .;I TYP["P",TH(W)'>160,VAL="s" S:HT>32&($E(ENT,3)=1) X=TOUR+25 D CHK^PRS8HRSV S X=9 D CHK^PRS8HRSV Q
 .;
 .;     For all time left except comptime set TIME to appropriate OT
 .;     unless comptime has been worked earlier in the week making
 .;     the total hours less than 40, then TIME gets unscheduled reg.
 .;     COMPTIME OVER 8/DAY WILL BE CREDITED HERE
 .;
 .S X=$S("Ee"'[VAL:TOUR+19,(TH'>320)&(TH(W)'>160)&(HT'>32):9,1:7)
 .I TYP["P",VAL[4,TH'>320,TH(W)'>160,HT'>32 S X=9
 .D CHK^PRS8HRSV
 Q
 ;
 ;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 ; ### DELETE UNLESS EARLIER CHECK WAS RESTORED
CT2DAY() ;Determine if comptime eligible including 2 day tour.
 ;
 N TOUREC,TWODAY
 S (RTN,TWODAY)=0
 ;
 ;      IF time segment contains Scheduled or unscheduled comptime 
 ;      or overtime and there is some time in tour hours worked THEN
 ;      check if it's a 2 day tour. For 2 day tours some of time worked
 ;      won't be in HT variable since it occured on other day of two
 ;      day tour, it's not valid to simply check the HT variable for
 ;      8 hours of work. (patch PRS*4*22)
 ;
 I "OosEe4"[VAL,(HT>0),(NH>319) D
 .S TOUREC=$P($G(DAY(DAY,0)),"^",2)
 .I TOUREC>0 S TWODAY=$P($G(^PRST(457.1,TOUREC,0)),"^",5)
 .I TWODAY="Y" S RTN=1
 Q RTN
