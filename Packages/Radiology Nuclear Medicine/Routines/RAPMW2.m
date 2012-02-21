RAPMW2 ;HOIFO/SWM-Radiology Wait Time reports ;12/05/05 13:41
 ;;5.0;Radiology/Nuclear Medicine;**67**;Mar 16, 2005
 ; IA 10063 allows check for Task Stop Request
 ; detail
 Q
STORDET ;
 S RAREC=""
 S RACNL=$E(RAXDT,4,5)_$E(RAXDT,6,7)_$E(RAXDT,2,3)_"-"_+RACN0 ;long CN
 S RA71REC=$G(^RAMIS(71,+$P(RACN0,U,2),0))
 S RAXMST=$P(RA72,U) ;exam status name
 S RACPT=$P($$NAMCODE^RACPTMSC($P(RA71REC,U,9),RAXDT),U) ;CPT code
 S RAPROCNM=$P(RA71REC,U) ;procedure name
 S RAPATNM=$$GET1^DIQ(2,RADFN,.01) S:RAPATNM="" RAPATNM=" " ;pt.name
 S RAPATNM=$E(RAPATNM,1,12) ;use 1st 12 chars of pat name
 S RAPATND=RAPATNM_"-"_RADFN ;patname-DFN
 S RADTORD=$P($P(RAOREC,U,16),".") ;date ordered
 ; store items to print in this order:
 ; pt. name, long case number, dt ordered, dt desired, exam dt, 
 ; no. days wait, exam status name, CPT code, proc name, img typ name
 S RAREC=RAPATNM_U_RACNL_U_$E(RADTORD,1,7)_U_$E(RADSDT,1,7)
 S RAREC=RAREC_U_$E(RAXDT,1,7)_U_RAWAITD_U_$E(RAXMST,1,11)_U_RACPT
 S RAREC=RAREC_U_$E(RAPROCNM,1,45)_U_$E(RAIMGTYP,1,3)_U_$S(RASAME2:"*",1:"")
 ; subscript 3 is the sort value
 ; subscripts 4-6 combined should be unique to a case, prevent over-
 ;    writing subscript 3 when >1 case has same sort value 
 ; subscript 4 is the exam date in Fileman notation
 ; subcript 5 is the patient name (1st 12 chars) and DFN
 ; subscript 6 is the "P" level ien of file 70
 I RASORT="CN" S ^TMP($J,"RA WAIT3",RACNL,RADTE,RAPATND,RACNISAV)=RAREC
 I RASORT="CPT" S ^TMP($J,"RA WAIT3",RACPT,RADTE,RAPATND,RACNISAV)=RAREC
 I RASORT="DD" S ^TMP($J,"RA WAIT3",RADSDT,RADTE,RAPATND,RACNISAV)=RAREC
 I RASORT="D" S ^TMP($J,"RA WAIT3",RAWAITD,RADTE,RAPATND,RACNISAV)=RAREC
 I RASORT="DO" S ^TMP($J,"RA WAIT3",RADTORD,RADTE,RAPATND,RACNISAV)=RAREC
 I RASORT="DR" S ^TMP($J,"RA WAIT3",RAXDT,RADTE,RAPATND,RACNISAV)=RAREC
 I RASORT="I" S ^TMP($J,"RA WAIT3",RAIMGTYP,RADTE,RAPATND,RACNISAV)=RAREC
 I RASORT="PN" S ^TMP($J,"RA WAIT3",RAPATNM,RADTE,RAPATND,RACNISAV)=RAREC
 I RASORT="PROC" S ^TMP($J,"RA WAIT3",RAPROCNM,RADTE,RAPATND,RACNISAV)=RAREC
 Q
WRTDET ;
 S RAHD0="Detail",RAPG=1
 D SETHD^RAPMW1
 D PRTD Q:RAXIT
 D FOOTD
 Q
HDDET ;
 W !!,"Sorted by: ",RASORTNM,?38,"Print only cases with minimum Days Wait of: ",RASINCE
 W !,"Total number of procedures registered during specified exam date range: ",RATOTAL
 Q
COLHDD ;
 I RAPG>1 W @IOF,!,"Page: ",RAPG
 S RAPG=RAPG+1
 W !!?28,"Date",?38,"Date",?48,"Date",?57,"Days",?63,"Exam",?76,"CPT",?128,"Img"
 W !,"Patient Name",?14,"Case #",?28,"Ordered",?38,"Desired",?48,"Register",?57,"Wait",?63,"Status",?76,"Code",?82,"Name of Procedure",?128,"Type"
 W !,$E(RADASH,1,12),?14,$E(RADASH,1,12),?28,$E(RADASH,1,8),?38,$E(RADASH,1,8),?48,$E(RADASH,1,8),?57,$E(RADASH,1,4),?63,$E(RADASH,1,11),?76,$E(RADASH,1,5),?82,RADASH,?128,$E(RADASH,1,4)
 I $D(ZTQUEUED) D STOPCHK^RAUTL9 S:$G(ZTSTOP)=1 RAXIT=1 ;user stopped task
 Q
PRTD ;
 I RATYP="B",IO=IO(0) D
 .I $E(IOST,1,2)="C-" R !,"Press RETURN to continue, ""^"" to exit:",RAKEY:DTIME
 N X
 D HD^RAPMW1,HDDET,COLHDD
 S RA0="",RAXIT=0
 F  S RA0=$O(^TMP($J,"RA WAIT3",RA0)) Q:RA0=""  Q:RAXIT  S RA1=0 D
 .F  S RA1=$O(^TMP($J,"RA WAIT3",RA0,RA1)) Q:'RA1  Q:RAXIT  S RA2=0 D
 ..F  S RA2=$O(^TMP($J,"RA WAIT3",RA0,RA1,RA2)) Q:RA2=""  Q:RAXIT  S RA3=0 D
 ...F  S RA3=$O(^TMP($J,"RA WAIT3",RA0,RA1,RA2,RA3)) Q:'RA3  Q:RAXIT  S X=^(RA3) D
 ....D CKLINE Q:RAXIT
 ....W !,$P(X,U),?14,$P(X,U,2),?28,$$FMTE^XLFDT($P(X,U,3),2),?38,$$FMTE^XLFDT($P(X,U,4),2),?48,$$FMTE^XLFDT($P(X,U,5),2),$P(X,U,11),?57,$J($P(X,U,6),4),?63,$P(X,U,7),?76,$P(X,U,8),?82,$P(X,U,9),?128,$P(X,U,10)
 ....Q
 ...Q
 ..Q
 .Q
 Q
CKLINE ;
 I ($Y+5)>IOSL D
 . S RAXIT=$$S^%ZTLOAD("This task was in routine RAPMW2 when it was stopped.") I RAXIT S ZTSTOP=1 Q  ;IA10063
 . I IO=IO(0) D
 .. I $E(IOST,1,2)="C-" R !,"Press RETURN to continue, ""^"" to exit:",RAKEY:DTIME S:RAKEY="^" RAXIT=1
 ..Q
 .Q:RAXIT
 .D COLHDD
 .Q
 Q
FOOTD ;
 I IO=IO(0) D
 .I $E(IOST,1,2)="C-" R !,"Press RETURN to continue, ""^"" to exit:",RAKEY:DTIME
 .Q
 I RANEG W !!?3,"(There ",$S(RANEG=1:"is",1:"are")," ",RANEG," case",$S(RANEG=1:"",1:"s")," with negative days wait included in the listing.)",!
 F I=1:1:16 W !?4,$P($T(FOOTD2+I),";;",2)
 Q
FILTER1 ;
 S RABAD=0
 I '$D(^RADPT(RADFN,"DT",RADTI)) S RABAD=1 Q  ;no exam data
 ;division
 S RASELDIV=$P($G(^RADPT(RADFN,"DT",RADTI,0)),U,3)
 S RACHKDIV=$P($G(^DIC(4,+RASELDIV,0)),U)
 I RACHKDIV'="",'$D(^TMP($J,"RA D-TYPE",RACHKDIV)) S RABAD=1 Q
 ;imaging type
 S RAITYP=$P($G(^RADPT(RADFN,"DT",RADTI,0)),U,2)
 S RAIMGTYP=$P($G(^RA(79.2,+RAITYP,0)),U)
 I RANX="I",RAIMGTYP'="",'$D(^TMP($J,"RA I-TYPE",RAIMGTYP)) S RABAD=1 Q
 I RAIMGTYP="" S RAIMGTYP="(unk)"
 Q
FILTER2 ;
 S RABAD=0
 S RACN0=$G(^RADPT(RADFN,"DT",RADTI,"P",RACNI,0))
 I RACN0="" S RABAD=1 Q  ;no case level data
 ; CATEGORY OF EXAM is inpatient
 I $P(RACN0,U,4)="I" S RABAD=1 Q
 ; exam's credit method is 2 (no credit)
 I $P(RACN0,U,26)=2 S RABAD=1 Q
 ; exam status is cancelled
 I $P(RACN0,U,3)="" S RABAD=1 Q  ;no exam status
 S RA72=^RA(72,+$P(RACN0,U,3),0) ;file 72 node 0
 I $P(RA72,U,3)=0 S RABAD=1 Q  ;skip cancelled exam
 ; skip case if its proc isn't among user-selected procs
 I RANX="P",'$D(^TMP($J,"RA WAIT2",$P(RACN0,U,2))) S RABAD=1 Q
 S RACNISAV=RACNI ; save orig. before it's changed due printset
 I RANX="I" D
 .; for printset, skip remaining cases by setting a high RACNI
 .I $P(RACN0,U,25)>1 S RACNI=99999
 Q
CALC ;
 S RASAME2=0 ;=1 if exm's order was cancelled & reordered same day
 S RAORIEN=$P(RACN0,U,11)
 S RAOREC=$G(^RAO(75.1,+RAORIEN,0))
 I RAOREC="" S ^TMP($J,"RA WAIT NO ORD",RADFN,RADTI,RACNI)=RAORIEN Q
 S RAXDT=9999999.9999-RADTI ; exam date FM format
 S RADSDT=$P(RAOREC,U,21) ; Date Desired
 I RADSDT="" S ^TMP($J,"RA WAIT NO DSR DT",RADFN,RADTI,RACNI)=RAORIEN Q
 S RAWAITD=$$FMDIFF^XLFDT(RAXDT,RADSDT) ;Wait days btw exm & desired dt
 S:RAWAITD<0 RANEG=RANEG+1
 D STORSUM^RAPMW1 ;store summary counts for Summary, Detail, Both
 S RA16=$P(RAOREC,U,16) ; request entered dt/tm
 ; count if same proc cancelled and reordered same day
 S RA1=$E(RA16,1,7)
 ; loop start w Last Activity same date as order's entry date
 F  S RA1=$O(^RAO(75.1,"AO",RA1)) Q:'RA1  Q:RA1>RA16  D
 .S RA2=0  F  S RA2=$O(^RAO(75.1,"AO",RA1,RA2)) Q:'RA2  Q:RA2=RAORIEN  D
 ..S RA3=^RAO(75.1,RA2,0) ;skip exm's order
 ..; other order is discontinued,same patient,same ordered procedure
 ..I $P(RA3,U,5)=1,$P(RA3,U,1)=RADFN,$P(RA3,U,2)=$P(RAOREC,U,2) S RASAME=RASAME+1,RASAME2=1
 ..Q
 .Q
 ; store detail rows for Detail,Both IF days wait at least = RASINCE
 I "B^D"[RATYP,((RAWAITD<0)!(RAWAITD'<RASINCE)) D STORDET
 Q
FOOTD2 ;
 ;;1. Cancelled, "No Credit" and inpatient cases are excluded from this report.
 ;;
 ;;2. The "Days Wait" represent # of days from the Registered date (the date/time entered at the "Imaging Exam Date/Time:" prompt)
 ;;   backwards to the Date Desired for the ordered procedure.  The calculation is based on the number of different days and 
 ;;   not rounded off by hours.
 ;;
 ;;3. If the user did not select a specific Procedure Name or CPT Code, then the cases from a printset (group of cases that 
 ;;   share the same report) will have only the first case printed.  However, the cases from an examset (group of cases that
 ;;   have separate reports) will all be listed.
 ;;
 ;;4. CPT Code is not available for parent and broad procedures in the header section.  CPT Code of the parent order's first 
 ;;   case will be printed in the line by line section.
 ;;
 ;;5. Date/Time Registered is the "Imaging Exam Date/Time" entered by the user during Registration.
 ;;
 ;;6. "*" under the "Date Register" column denotes the request was cancelled and re-ordered on the same day that it was cancelled.
