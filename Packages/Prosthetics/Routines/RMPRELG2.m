RMPRELG2 ;PHX/RFM-DISPLAY ELIGIBILITY SECOND PAGE ;8/29/1994
 ;;3.0;PROSTHETICS;;Feb 09, 1996
 S VAIP("D")="L" D IN5^VADPT,SDE^VADPT,SDA^VADPT W @IOF
 W $E(RMPRNAM,1,20),?23,"SSN: ",$P(VADM(2),U,2),?42,"DOB: ",$P(VADM(3),U,2),?61,"CLAIM# ",RMPRCNUM
 W !!?20,"Last Movement Actions",! I VAIP(1)="" W !?5,"No Movements Recorded for this Patient",!! G CLI
 W "Trans. Type: ",$P(VAIP(2),U,2),?40,"Trans. Type: ",$P(VAIP(13,2),U,2),!,"Date: ",$P(VAIP(3),U,2),?40,"Date: ",$P(VAIP(13,1),U,2),!,"Type of Movement: ",?40,"Type of Movement: ",!,$P(VAIP(4),U,2),?40,$P(VAIP(13,3),U,2)
 W !,"Ward: ",$P(VAIP(5),U,2),?40,"Ward: ",$P(VAIP(13,4),U,2),!,"Physician: ",$E($P(VAIP(7),U,2),1,25),?40,"Physician: ",$E($P(VAIP(13,5),U,2),1,25)
 W !,"Diagnosis: ",$E(VAIP(9),1,28),?40,"Diagnosis: ",$E(VAIP(9),1,28)
CLI W !?20,"Clinic Enrollments" I '$D(^UTILITY("VAEN",$J)) W !!,"No Clinic Enrollments for this Patient" G APP
 S RO=0 F I=0:0 S RO=$O(^UTILITY("VAEN",$J,RO)) Q:RO'>0  D WRI
 G APP
WRI W:'$D(RMPRFLG) !,"Clinic",?40,"Enrollment Date",?60,"OPT or AC" S RMPRFLG=1 W !,$P(^UTILITY("VAEN",$J,RO,"E"),U,1),?40,$P(^UTILITY("VAEN",$J,RO,"E"),U,2),?63,$P(^UTILITY("VAEN",$J,RO,"E"),U,3) Q
APP W !!,?20,"Pending Appointments" I '$D(^UTILITY("VASD",$J)) W !!?5,"No Pending Appointments for this Patient" G VIEW
 S RO=0 F I=0:0 S RO=$O(^UTILITY("VASD",$J,RO)) Q:RO'>0  D WRI2
VIEW S RMPRCOMB=1,RNSK=1 D:$D(DFN) DIV4^RMPRSIT,^RMPRFO2
 G EXIT
WRI2 W:'$D(RMPRFLL) !,"Appt. Date",?20,"Clinic",?50,"Status",?60,"Type" S RMPRFLL=1
 W !,$P(^UTILITY("VASD",$J,RO,"E"),U,1),?20,$E($P(^UTILITY("VASD",$J,RO,"E"),U,2),1,29),?50,$P(^UTILITY("VASD",$J,RO,"E"),U,3),?60,$P(^UTILITY("VASD",$J,RO,"E"),U,4) Q
EXIT K ^UTILITY("VAEN",$J),RMPRIN,^UTILITY("VASD",$J),RVA,RMPRFF,VAIP,VASD,RO,RMPRFLL,RMPRFLG S FL=2 W ! G EXIT^RMPRELG1
