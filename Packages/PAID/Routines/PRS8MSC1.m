PRS8MSC1 ;HISC/DAD,WCIOFO/MGD,SAB-MISC TIME CARD ADJUST(contd) ;5/08/01
 ;;4.0;PAID;**56,68**;Sep 21, 1995
 ; The following code deals with the charging of administrative
 ; nonduty days for full time doctors (Title 38) who have not
 ; performed any work during the administrative work week.
 ;
 ; This routine is called from PRS8MSC0.
 ;
AUTOLVCH(WEEK,ANNLV,LWOP,NONPAY,HOLIDAY,RESANLV,DAYSWK) ;
 ; The following variables only contain the number of regularly
 ; scheduled work days that were charged to leave.  Nonduty days that
 ; are surrounded by approved types of leave are NOT included in these
 ; counts.
 ;
 ;    WEEK - Week 1 or 2.
 ;   ANNLV - Work days charged to Annual Leave.
 ;    LWOP - Work days charged to Leave Without Pay.
 ;  NONPAY - Work days charged to Non Pay.
 ; HOLIDAY - The number of Holidays that occurred during the week.
 ; RESANLV - Work days charged to Restored Annual Leave.
 ;  DAYSWK - The number of days the employee is scheduled to work during
 ;            the week.
 ;
 ; The following variables contain work days that were charged to
 ; leave plus administrative non-duty days that were charged to leave
 ; because they were encapsulated by administrative work days that
 ; were posted with an approved type of leave.  The NP array that
 ; was defined in PRS8MISC contains the total number of Non Pay days,
 ; both Non-Duty days and Duty days, charged to the employee for the 
 ; week.
 ;
 N ELWOP,ENONPAY,ERESANLV
 S ELWOP=$P(WK(WEEK),U,3)    ; Total days charged to Leave Without Pay.
 S ENONPAY=NP(WEEK)          ; Total days charged to Non Pay.
 S ERESANLV=$P(WK(WEEK),U,6) ; Total days charged to Restored Annual
 ;                              Leave.
 ;
 ; Adjust DAYSWK for full time doctors with no administrative 
 ; nonduty days in their tour.
 ;
 S DAYSWK=$S(DAYSWK>5:5,1:DAYSWK)
 ;
 ; Adjust Daily employees leave charges if they have taken
 ; the whole week off.  This routine can update the global WK() array, 
 ; which contains time & leave totals for the decomp.
 ;
 ; Patch PRS*4*56 added the necessary logic to handle Daily
 ; employees who work a compressed schedule.
 ;
 ; IF a daily employee has as many days of annual leave (AN/AL) 
 ; posted as they are scheduled to work AND is not being charged 
 ; leave without pay (WD/WP) THEN ADD annual leave, less any holidays,
 ; to fill the week.
 ;
 I ANNLV>0,(ANNLV+HOLIDAY'<DAYSWK) D  Q
 .S $P(WK(WEEK),U,1)=7-HOLIDAY-ENONPAY
 ;
 ; IF a daily employee has as many days of Nonpay (NO/NP) posted
 ; as they are scheduled to work THEN ADD Nonpay less any holidays,
 ; to fill the week. 
 ;
 I NONPAY>0,(NONPAY+HOLIDAY'<DAYSWK) D  Q
 .S $P(WK(WEEK),U,4)=7-HOLIDAY
 ;
 ; IF a daily employee has as many days of restored annual leave 
 ; (RT/RL) posted as they are scheduled to work AND is not being
 ; charged leave without pay (WD/WP) THEN ADD restored annual leave,
 ; less any holidays, to fill the week. 
 ;
 I RESANLV>0,(RESANLV+HOLIDAY'<DAYSWK) D  Q
 .S $P(WK(WEEK),U,6)=7-HOLIDAY-ENONPAY
 ;
 ; IF a daily employee has as many days of leave without pay (WD/WP)
 ; posted as they are scheduled to work THEN ADD leave without pay
 ; less any holidays, to fill the week. 
 ;
 I LWOP>0,(LWOP+HOLIDAY'<DAYSWK) D  Q
 .S $P(WK(WEEK),U,3)=7-HOLIDAY-ENONPAY
 ;
 ; IF a daily employee has as many days of approved leave, in any 
 ; combination, as they are scheduled to work THEN charge the rest
 ; of the week, less any holidays, as annual leave.
 ;
 I $S(ANNLV:1,RESANLV:1,LWOP:1,NONPAY:1,1:0) D
 .I ANNLV+RESANLV+LWOP+NONPAY+HOLIDAY'<DAYSWK D
 ..S $P(WK(WEEK),U,1)=7-ERESANLV-ELWOP-ENONPAY-HOLIDAY
 Q
