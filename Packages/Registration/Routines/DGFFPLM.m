DGFFPLM ; ALB/SCK - FUGITIVE FELON PROGRAM LM INQUIRY ; 06-DEC-2002
 ;;5.3;Registration;**485**;Aug 13, 1993
EN ; -- main entry point for DGFFP PATIENT STATUS INQUIRY
 N DFN,VALMCNT
 ;
 D SEL^DGFFPLM1(.DFN)
 Q:DFN'>0
 D EN^VALM("DGFFP PATIENT STATUS INQUIRY")
 Q
 ;
HDR ; -- header code
 N VA,X
 ;
 D PID^VADPT
 S VALMHDR(1)=$E("Patient: "_$P($G(^DPT(DFN,0)),U),1,30)_" ("_VA("PID")_")"
 S VALMHDR(2)=$S($D(^DPT("AXFFP",1,DFN)):"Fugitive Flag Set",1:"")
 S VALMHDR(3)=$$LASTACT(DFN)
 Q
 ;
INIT ; -- init variables and list array
 N VALMBCK
 D BLD
 Q
 ;
BLD ; Build patient fugitive felon program screen
 D CLEAN^VALM10
 K ^TMP("DGFFPLM",$J)
 ;
 D HDR
 D EN^DGFFPLM1(DFN,"DGFFPLM",1,.VALMCNT)
 Q
 ;
HELP ; -- help code
 S X="?" D DISP^XQORM1 W !!
 Q
 ;
EXIT ; -- exit code
 D CLEAN^VALM10
 D CLEAR^VALM1
 K ^TMP("DGFFPLM",$J)
 Q
 ;
EXPND ; -- expand code
 Q
 ;
LASTACT(DFN) ;
 N DGDT,RSLT,DGCLN,DGCLNME
 ;
 S DGDT=$$NOW^XLFDT
 S DGDT=$O(^DPT(DFN,"S",DGDT),-1)
 I DGDT>0 D
 . S DGCLN=$P($G(^DPT(DFN,"S",DGDT,0)),U,1)
 . S DGCLNME=$$GET1^DIQ(44,DGCLN,.01)
 . S RSLT="Last Appointment: "_$$FMTE^XLFDT(DGDT,"1P")_"   Clinic: "_DGCLNME
 Q $G(RSLT)
 ;
PAT ; Entry point for DGFFP CHANGE PATIENT PROTOCOL
 ; Input  - None
 ; Output - DFN      Patient IEN
 ;          VALMBCK  R = Refresh screen
 ;
 N DGDFN
 S VALMBCK=""
 D FULL^VALM1
 ;
 ; Get new patient
 D SEL^DGFFPLM1(.DGDFN)
 ;
 I DGDFN>0 D
 . S DFN=DGDFN
 . D BLD^DGFFPLM
 S VALMBCK="R"
 Q
