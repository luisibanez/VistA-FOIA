RAPMW1 ;HOIFO/SWM-Radiology Wait Time reports ;12/05/05 13:40
 ;;5.0;Radiology/Nuclear Medicine;**67**;Mar 16, 2005
 ; IA 10090 allows Read w/Fileman for entire file 4
 ; summary
 Q
STORSUM ;
 S RACOL=$S(RAWAITD'>30:1,RAWAITD'>60:2,RAWAITD'>90:3,RAWAITD'>120:4,1:5)
 S RACOL(RACOL)=RACOL(RACOL)+1
 S RATOTAL=RATOTAL+1
 S RATDAYS=RATDAYS+RAWAITD
 Q
WRTSUM ;
 S RAHD0="Summary",RAPG=1
 D SETHD
 D PRTS
 D FOOTS
 Q
SETHD ; Set up header & dev vars for identical parts of summary and detail reports
 S RAIOM=$S(RATYP="S":80,1:IOM),$P(RADASH,"-",46)=""
 S RAH1=RAHD0_" Radiology Outpatient Procedure Wait Time Report"
 ; Hdr Line 3 -- Facility, Station, VISN
 D GETS^DIQ(4,DUZ(2),".01;14*;99","E","RAR","RAMSG")
 K X
 S X(1)=RAR(4,DUZ(2)_",",.01,"E") ; Name of facility
 S X(2)=RAR(4,DUZ(2)_",",99,"E") ;  Station Number
 I $D(RAR(4.014)) D
 . S X(3)=RAR(4.014,"1,"_DUZ(2)_",",.01,"E") ; Association
 . S X(4)=RAR(4.014,"1,"_DUZ(2)_",",1,"E") ; Parent of Association
 . S X(5)=$S(X(3)="VISN":X(4),1:"") ; should be VISN number
 E  S X(5)=""
 ;
 S $P(X(6)," ",79)=""
 S $E(X(6),1,(10+$L(X(1))))="Facility: "_X(1)
 S $E(X(6),41,(50+$L(X(2))))="Station: "_X(2)
 S $E(X(6),60,(66+$L(X(5))))="VISN: "_X(5)
 S RAH3=X(6) ;Facility, Station, VISN
 ; Hdr Line 4 -- Division(s)
 K RAH4
 I '$D(^TMP($J,"RA D-TYPE")) S RAH4(1)="No division selected"
 E  D
 .S RA1=1,RADIV="" S RAH4(1)="Division(s): "
 .F  S RADIV=$O(^TMP($J,"RA D-TYPE",RADIV)) Q:RADIV=""  D
 ..S:$L(RAH4(RA1))+$L(RADIV)>RAIOM RA1=RA1+1,$P(RAH4(RA1)," ",14)=""
 ..S RAH4(RA1)=RAH4(RA1)_RADIV_$S($O(^TMP($J,"RA D-TYPE",RADIV))]"":", ",1:"")
 ..Q
 .Q
 ; Hdr line 5 -- Exam Date Range
 S RAH5="Exam Date Range: "_$$FMTE^XLFDT(RABDATE,"2D")_"-"_$$FMTE^XLFDT(RAEDATE,"2D")
 ; Hdr line 6 -- Imaging Type(s) selected
 K RAH6
 I '$D(^TMP($J,"RA I-TYPE")) S RAH6(1)=""
 E  D
 .S RA1=1,RAIT="" S RAH6(1)="Imaging Type(s): "
 .F  S RAIT=$O(^TMP($J,"RA I-TYPE",RAIT)) Q:RAIT=""  D
 ..S:($L(RAH6(RA1))+$L(RAIT)+2)>RAIOM RA1=RA1+1,$P(RAH6(RA1)," ",18)=""
 ..S RAH6(RA1)=RAH6(RA1)_RAIT_$S($O(^TMP($J,"RA I-TYPE",RAIT))]"":", ",1:"")
 ..Q
 .Q
 ;Hdr line 7 -- CPT and Proc names
 K RAH7 S RAH7(0)="CPT CODES and PROCEDURES: "
 I '$D(^TMP($J,"RA WAIT1")) S RAH7(1)=RAH7(0)_"All"
 E  D
 .S RA1=1,RA2="",RAH7(1)=RAH7(0)
 .F  S RA2=$O(^TMP($J,"RA WAIT1",RA2)) Q:RA2=""  D
 ..S RA1=RA1+1
 ..S RAH7(RA1)="     "_^TMP($J,"RA WAIT1",RA2)_"  "_RA2
 ..Q
 .Q
 ;Hdr line 8 -- Run Date/Time
 S RANOW=$$NOW^XLFDT,RANOW=$E(RANOW,1,12)
 S RAH8="Run Date/Time: "_$$FMTE^XLFDT(RANOW,"2P")
 Q
HD ;
 W:$E(IOST,1,2)="C-" @IOF W !?(RAIOM-$L(RAH1)\2),RAH1
 W !,"Page: ",RAPG,!
 W !,RAH3
 S I=0 F  S I=$O(RAH4(I)) Q:'I  W !,RAH4(I)
 W !,RAH5
 S I=0 F  S I=$O(RAH6(I)) Q:'I  W !,RAH6(I)
 S I=0 F  S I=$O(RAH7(I)) Q:'I  W !,RAH7(I)
 W !,RAH8
 Q
HDSUM ;
 W !!,"Total number of procedures registered during specified exam date range: ",RATOTAL,!
 Q
COLHDS ;
 W !,"Days",?13,"<=30",?23,"31-60",?35,"61-90",?46,"91-120",?58,">120"
 W !,"Wait",?13,"Days",?24,"Days",?36,"Days",?47,"Days",?58,"Days"
 W !,"-----",?13,"----",?24,"----",?36,"----",?47,"----",?58,"----"
 Q
PRTS ;
 I RAPG=1 D HD,HDSUM,COLHDS S RAPG=RAPG+1
 W !,"#",?11,$J(RACOL(1),6),?22,$J(RACOL(2),6)
 W ?34,$J(RACOL(3),6),?45,$J(RACOL(4),6),?56,$J(RACOL(5),6)
 I RATOTAL>0 D
 .W !,"%",?11,$J(RACOL(1)/RATOTAL*100,6,1)
 .W ?22,$J(RACOL(2)/RATOTAL*100,6,1)
 .W ?34,$J(RACOL(3)/RATOTAL*100,6,1)
 .W ?45,$J(RACOL(4)/RATOTAL*100,6,1)
 .W ?56,$J(RACOL(5)/RATOTAL*100,6,1)
 W !!,"Number of procedures cancelled and re-ordered on the same day =",RASAME
 W:RATOTAL>0 !,"Average number of days wait = ",$J(RATDAYS/RATOTAL,5,1)
 Q
FOOTS ;
 I IO=IO(0) D
 .I $E(IOST,1,2)="C-" R !,"Press RETURN to continue, ""^"" to exit:",RAKEY:DTIME
 .Q
 I RANEG W !!?3,"(There ",$S(RANEG=1:"is",1:"are")," ",RANEG," case",$S(RANEG=1:"",1:"s")," with negative days wait included in the first column.)",!
 F I=1:1:8 W !?4,$P($T(FOOTS2+I),";;",2)
 Q
FOOTS2 ;
 ;;1. Cancelled, "No Credit" and inpatient cases are excluded from this report.
 ;;
 ;;2. Columns represent # of days wait from the Registered date (the date/
 ;;   time entered at the "Imaging Exam Date/Time:" prompt) backwards to the
 ;;   Date Desired for the ordered procedure.  The calculation is based on
 ;;   the number of different days and not rounded off by hours.  The "31-60"
 ;;   column represents those orders that were registered 31 days or more but
 ;;   less than 61 days after the Date Desired.
