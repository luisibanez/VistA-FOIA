PSBVDLU3	;BIRMINGHAM/TEJ-BCMA VDL UTILITIES 3 ;Mar 2004
	;;3.0;BAR CODE MED ADMIN;**13**;Mar 2004
	;
	;This routine file has been created to serve as a container
	;for Extrinsic Variables/Functions
	;
	; Reference/IA
	; EN^PSJBCMA/2828
	;
IVPTAB(PSBORTYP,PSBIVTYP,PSBINTSY,PSBCHMTY,PSBMROUT)	 ;
	;
	; This function will return
	; the value 1 (one) if the
	; specified order input will cause
	; the order to display on the "IVP/IVPB"
	; tab of the VDL BCMA Virtual Due List (VDL)
	; else return the value 0 (zero).
	;
	; Input Parameters:
	;
	;     PSBORTYP - Order type (e.g. "U","V")
	;     PSBIVTYP - IV Type (e.g. "P","S","C")
	;     PSBINTSY - Intermittent Syringe value
	;     PSBCHMTY - Chemo type (e.g. "P","S")
	;     PSBMROUT - Med Route value (e.g. "IVP","IV PUSH","IVPB")
	;
	; Output:
	;     1 - order will display on the "IVP/IVPB" Tab of BCMA VDL
	;     0 - order will NOT display on the "IVP/IVPB" Tab of BCMA VDL
	;    -1 - error processed
	;
	Q:'$D(PSBORTYP) "-1^Missing Parameter"
	I PSBORTYP="U"&(($G(PSBMROUT)="IV PUSH")!($G(PSBMROUT)="IVP")) Q 1
	I '(PSBORTYP="V") Q 0
	I $G(PSBIVTYP)="P" Q 1
	I $G(PSBIVTYP)="S",$G(PSBINTSY)=1 Q 1
	I $G(PSBIVTYP)="C",$G(PSBCHMTY)="P" Q 1
	I $G(PSBIVTYP)="C",$G(PSBCHMTY)="S",$G(PSBINTSY)=1 Q 1
	Q 0
	;
SHOVDL(DFN,BDATE,OTDATE,PSBTAB)	;
	;
	; This function will find orders such as discontinued or expired infusing IV bags 
	; or discontinued or expired "given" patches.  Recognizing these types of orders
	; will allow these orders to be displayed on the VDL and permits the user to take 
	; action on them.  This routine determines if such orders exist for patient,
	; time, and "BCMA VDL tab."  This routine is an "extention" to the API EN^PSJBCMA.
	;
	; INPUT Parameters:
	;    DFN           (req)   Patient Internal File Number.
	;    BDATE         (opt)   Start searching for "order stop" after this date. 
	;    OTDATE        (opt)   Include One-Time orders from this date.
	;    PSBTAB        (opt)   "UDTAB" or "IVTAB" - expedites process if specific tab
	;                            is given.
	;
	; OUTPUT Values
	;    0               absolutely no orders to display on VDL
	;    1               displayable orders have been located.
	;
	;
	D EN^PSJBCMA(DFN,$G(BDATE),$G(OTDATE))
	; any active Patch orders to show on VDL?
	S PSBFLG=0
	I $G(^TMP("PSJ",$J,1,0))=-1 D
	.;  
	.; Check the indexice for given patches or infusing IVs
	.;
	.; Check APATCH
	.D:($G(PSBTAB)="UDTAB")!($G(PSBTAB)="")  Q:PSBFLG
	..S PSBGNODE="^PSB(53.79,"_"""APATCH"""_","_DFN_")" Q:'$D(PSBGNODE)
	..F  S PSBGNODE=$Q(@PSBGNODE) Q:PSBGNODE=""  Q:$QS(PSBGNODE,3)'=DFN  Q:PSBFLG  S PSBIEN=$QS(PSBGNODE,5),PSBFLG=$S($P(^PSB(53.79,PSBIEN,0),U,9)="G":1,1:0)
	.;
	.; Check AUID
	.;
	.D:(($G(PSBTAB)="IVTAB")!($G(PSBTAB)=""))&('PSBFLG)  Q:PSBFLG
	..S PSBGNODE="^PSB(53.79,"_"""AUID"""_","_DFN_")" Q:'$D(PSBGNODE)
	..F  S PSBGNODE=$Q(@PSBGNODE) Q:PSBGNODE=""  Q:$QS(PSBGNODE,3)'=DFN  Q:PSBFLG  S PSBIEN=$QS(PSBGNODE,6),PSBFLG=$S($P(^PSB(53.79,PSBIEN,0),U,9)="I":1,1:0)
	.;
	.;  NOTE: Infusing bags will not display if DCed more than 3 days ago!
	.;
	S:$G(^TMP("PSJ",$J,1,0))'=-1 PSBFLG=1
	;
	Q PSBFLG
	;
FNDACTV(RESULTS,PARAMS)	;   Utility to check and order for the latest " ? (parameter #3) " order activities per patient (parameter #1)
	; #parameter= # "^"piece
	;       #1 DFN - Patient's IEN          e.g. 1234               (required)
	;       #2 Order Number_Order Type      e.g. "1V"               "" = all orders
	;       #3 Search for Activity          e.g. "H"                "" = *unknown* activity
	;       #4 Search "back"time(hours)     e.g. 12                 "" = search back 3 admins   
	;                                                 NOTE:  ="FREQ"  This Function will use order's frequency.
	;                                                 1. If the order is a PRN, On Call or One-Time 
	;                                                 the look back a default of 72 hours.
	;                                                 2. if the order is a Continuous order key off
	;                                                 of the frequency as follows.
	;                                                      a.) if the frequency is <24 hours use the
	;                                                        default of 72 hours.
	;                                                      b.) if the frequency is >= 24 hour, look back
	;                                                        3.5 times the frequency
	;                                                 NOTE:  ["X#"    This Function will search back # of admins.
	;  
	;  Example call: D FNDACTV^PSBVDLU3(.results,"1234^1U^H^12")
	;
	;
	N PSBNOW,PSBDFN,PSBON,PSBCNT,PSBACT,PSBTMFRM,PSBX,PSBSET,PSBFRQ
	K RESULTS
	S PSBDFN=$P(PARAMS,U),PSBON=$P(PARAMS,U,2),PSBACT=$P(PARAMS,U,3),PSBTMFRM=$P(PARAMS,U,4)
	S RESULTS(0)=1
	I $G(PSBDFN)']"" S RESULTS(0)=1,RESULTS(1)="-1^ERROR - MISSING PARAMETER (DFN REQ.)" Q
	I $G(PSBTMFRM)="" S PSBX=3
	I $G(PSBTMFRM)["X" S PSBX=+($P(PSBTMFRM,"X",2)),PSBTMFRM=""
	I $G(PSBTMFRM)]"",$G(PSBTMFRM)'["FREQ" D NOW^%DTC S PSBNOW=% S PSBTMFRM=$$FMADD^XLFDT(PSBNOW,"",-1*PSBTMFRM),PSBSET=1 S RESULTS(1)="0^ None found after "_PSBTMFRM
	I $G(PSBX)="" S PSBX=9999999
	D:$G(PSBON)'=""
	.K ^TMP("PSJ",$J) D EN^PSJBCMA1(PSBDFN,PSBON)
	.;Maintain Time Frame and other order information
	.I $G(PSBTMFRM)["FREQ" D
	..S PSBFRQ=+$P(^TMP("PSJ",$J,4),"^",11) I PSBFRQ=0 S PSBFRQ=1440
	..I "P^OC^O^"[($P(^TMP("PSJ",$J,4),"^")_"^") S PSBTMFRM=72 Q
	..I (PSBFRQ/60)<24 S PSBTMFRM=72 Q
	..I (PSBFRQ/60)'<24 S PSBTMFRM=(PSBFRQ/60)*3.5
	.I '$G(PSBSET) D NOW^%DTC S PSBNOW=% S PSBTMFRM=$$FMADD^XLFDT(PSBNOW,"",-1*PSBTMFRM) S RESULTS(1)="0^ None found after "_PSBTMFRM
	.S I="",X=0 F  S I=$O(^PSB(53.79,"AORDX",PSBDFN,PSBON,I),-1)  Q:(I="")!(I<$S(PSBTMFRM]"":PSBTMFRM,1:-1))  D  Q:X
	..S Z=0,J="",PSBCNT=0 F  S J=$O(^PSB(53.79,"AORDX",PSBDFN,PSBON,I,J),-1)  Q:(J="")  S Z=Z+1 Q:Z>PSBX  D  Q:X
	...L +^PSB(53.79,J):1
	...I  L -^PSB(53.79,J)
	...E  Q
	...I ($P(^PSB(53.79,J,0),U,9)=PSBACT) S X=1 D
	....S PSBCNT=PSBCNT+1,RESULTS(PSBCNT)=$$GET1^DIQ(53.79,J_",",.02)
	....S PSBCNT=PSBCNT+1,RESULTS(PSBCNT)=$P(^TMP("PSJ",$J,2),U,2)_"^"_($$GET1^DIQ(53.79,J_",",.11))
	....S PSBCNT=PSBCNT+1,RESULTS(PSBCNT)=$$GET1^DIQ(53.79,J_",",.06,"I")
	....S PSBCNT=PSBCNT+1,RESULTS(PSBCNT)=$$GET1^DIQ(53.79,J_",",.13,"I")
	D:$G(PSBON)=""
	.S Z="",X=0 F  S Z=$O(^PSB(53.79,"AORDX",PSBDFN,Z),-1)  Q:(Z="")  S PSBON=Z D  Q:X
	..;Maintain Time Frame and other order information
	..K ^TMP("PSJ",$J) D EN^PSJBCMA1(PSBDFN,PSBON)
	..I $G(PSBTMFRM)["FREQ" D
	...S PSBFRQ=+$P(^TMP("PSJ",$J,4),"^",11) I PSBFRQ=0 S PSBFRQ=1440
	...I "P^OC^O^"[($P(^TMP("PSJ",$J,4),"^")_"^") S PSBTMFRM=72 Q
	...I (PSBFRQ/60)<24 S PSBTMFRM=72 Q
	...I (PSBFRQ/60)'<24 S PSBTMFRM=(PSBFRQ/60)*3.5
	..I '$G(PSBSET) D NOW^%DTC S PSBNOW=% S PSBTMFRM=$$FMADD^XLFDT(PSBNOW,"",-1*PSBTMFRM) S RESULTS(1)="0^ None found after "_PSBTMFRM
	..S I="" F  S I=$O(^PSB(53.79,"AORDX",PSBDFN,PSBON,I),-1)  Q:(I="")!(I<$S(PSBTMFRM]"":PSBTMFRM,1:-1))  D  Q:X
	...S ZZ=0,J="",PSBCNT=0 F  S J=$O(^PSB(53.79,"AORDX",PSBDFN,PSBON,I,J),-1)  Q:(J="")  S ZZ=ZZ+1 Q:ZZ>PSBX  D  Q:X
	....L +^PSB(53.79,J):1
	....I  L -^PSB(53.79,J)
	....E  Q
	....I ($P(^PSB(53.79,J,0),U,9)=PSBACT) S X=1 D
	.....S PSBCNT=PSBCNT+1,RESULTS(PSBCNT)=$$GET1^DIQ(53.79,J_",",.02)
	.....S PSBCNT=PSBCNT+1,RESULTS(PSBCNT)=$P(^TMP("PSJ",$J,2),U,2)_"^"_($$GET1^DIQ(53.79,J_",",.11))
	.....S PSBCNT=PSBCNT+1,RESULTS(PSBCNT)=$$GET1^DIQ(53.79,J_",",.06,"I")
	.....S PSBCNT=PSBCNT+1,RESULTS(PSBCNT)=$$GET1^DIQ(53.79,J_",",.13,"I")
	I $G(PSBCNT)>0 S RESULTS(0)=PSBCNT
	K ^TMP("PSJ",$J)
	Q
	;
