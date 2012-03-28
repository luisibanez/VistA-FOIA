AZAXCAD ;IHS/PHXAO/AEF - CAD/STATIN STUDY DATA EXTRACT
 ;;1.0;ANNE'S SPECIAL ROUTINES;;MAR 23, 2004
 ;;
DESC ;----- PROGRAM DESCRIPTION
 ;;
 ;;     This routine loops through the VISIT file for the specified
 ;;     date range and finds all patients who have a heart related
 ;;     diagnosis and who are taking statin drugs.
 ;;
 ;;$$END
EN ;----- MAIN ENTRY POINT
 ;
 N AZAXD,AZAXDTS,AZAXI,AZAXP,AZAXPDTS,AZAXY
 ;
 K ^TMP("AZAX",$J)
 ;
 D TXT
 ;
 D DATES("VISIT DATE",.AZAXY)
 Q:'AZAXY
 S AZAXDTS=AZAXY
 ;
 D DATES("DISPENSED DATE",.AZAXY)
 Q:'AZAXY
 S AZAXPDTS=AZAXY
 ;
 D BLD(.AZAXI,.AZAXP,.AZAXD)
 ;
 D LOOP1(AZAXDTS,.AZAXI,.AZAXP)
 ;
 D LOOP2(AZAXPDTS,.AZAXD)
 ;
 D FILE
 ;
 ;K ^TMP("AZAX",$J)
 ;
 Q
LOOP1(AZAXDTS,AZAXI,AZAXP) ;
 ;----- LOOP THROUGH VISIT FILE AND FIND ALL PATIENTS WITH HEART DX
 ;
 ;      INCOMING:
 ;      AZAXDTS  =  DATE RANGE IN BEG^END FORMAT
 ;      AZAXI    =  ARRAY OF ICD DIAGNOSIS CODES TO BE SEARCHED FOR
 ;      AZAXP    =  ARRAY OF ICD PROCEDURE CODES TO BE SEARCHED FOR
 ;
 N AZAXBEG,AZAXDFN,AZAXDT,AZAXEND,AZAXICD0,AZAXICNA,AZAXVSD0
 ;    
 S AZAXBEG=$P(AZAXDTS,U)
 S AZAXEND=$P(AZAXDTS,U,2)
 S AZAXDT=AZAXBEG-1
 ;
 F  S AZAXDT=$O(^AUPNVSIT("B",AZAXDT)) Q:'AZAXDT  Q:AZAXDT>AZAXEND  D
 . S AZAXVSD0=0
 . F  S AZAXVSD0=$O(^AUPNVSIT("B",AZAXDT,AZAXVSD0)) Q:'AZAXVSD0  D
 . . S AZAXDFN=$P($G(^AUPNVSIT(AZAXVSD0,0)),U,5)
 . . S AZAXICD0=$P($G(^AUPNVSIT(AZAXVSD0,11)),U,7) ;CODED CHIEF COMPLAINT
 . . S AZAXICNA=$$ICD^AZAXCADU(AZAXICD0)
 . . I $P(AZAXICNA,".")]"",$D(AZAXI($P(AZAXICNA,"."))) D SET1(AZAXVSD0,AZAXDFN,AZAXICNA)
 . . D POV(AZAXVSD0,AZAXDFN,.AZAXI)  ;CHECK PURPOSE OF VISITS
 . . D PROC(AZAXVSD0,AZAXDFN,.AZAXP) ;CHECK PROCEDURES
 . . D MED(AZAXVSD0,.AZAXD)          ;CHECK V MEDICATIONS FILE
 ;
 Q
POV(AZAXVSD0,AZAXDFN,AZAXI) ;
 ;----- CHECK V POV FILE FOR PURPOSE OF VISITS
 ;
 ;      INCOMING:
 ;      AZAXDFN   =  PATIENT IEN
 ;      AZAXI     =  ARRAY CONTAINING ICD DIAGNOSIS CODES  
 ;      AZAXVSD0  =  VISIT IEN
 ;
 N AZAXD0,AZAXICD0,AZAXICDNA
 ;
 S AZAXD0=0
 F  S AZAXD0=$O(^AUPNVPOV("AD",AZAXVSD0,AZAXD0)) Q:'AZAXD0  D
 . S AZAXICD0=$P($G(^AUPNVPOV(AZAXD0,0)),U)
 . S AZAXICNA=$$ICD^AZAXCADU(AZAXICD0)
 . Q:$P(AZAXICNA,".")']""
 . Q:'$D(AZAXI($P(AZAXICNA,".")))
 . D SET1(AZAXVSD0,AZAXDFN,AZAXICNA)
 Q
PROC(AZAXVSD0,AZAXDFN,AZAXP) ;
 ;----- CHECK V PROCEDURE FILE FOR PROCEDURES
 ;
 ;      INCOMING:
 ;      AZAXDFN   =  PATIENT IEN
 ;      AZAXP     =  ARRAY CONTAINING ICD PROCEDURE CODES
 ;      AZAXVSD0  =  VISIT IEN
 ;
 N AZAXD0,AZAXICD0,AZAXICNA
 ;
 S AZAXD0=0
 F  S AZAXD0=$O(^AUPNVPRC("AD",AZAXVSD0,AZAXD0)) Q:'AZAXD0  D
 . S AZAXICD0=$P($G(^AUPNVPRC(AZAXD0,0)),U)
 . S AZAXICNA=$$PICD^AZAXCADU(AZAXICD0)
 . Q:AZAXICNA']""
 . Q:'$D(AZAXP(AZAXICNA))
 . D SET1(AZAXVSD0,AZAXDFN,AZAXICNA)
 Q
MED(AZAXVSD0,AZAXD) ;
 ;----- CHECK V MEDICATION FILE FOR DRUGS
 ;
 ;      INCOMING:
 ;      AZAXVSD0  =  VISIT IEN
 ;      
 S AZAXVMD0=0
 F  S AZAXVMD0=$O(^AUPNMED("AD",AZAXVSD0,AZAXVMD0)) Q:'AZAXVMD0  D
 . S AZAXDATA=$G(^AUPNVMED(AZAXVMD0,0))
 . S AZAXDGNA=$$DRUG^AZAXCADU($P(AZAXDATA,U))
 . Q:AZAXDGNA']""
 . Q:'$D(AZAXD($P(AZAXDGNA," ")))
 . D SET6(AZAXVSD0)
 Q
 . S AZAXDFN=$P(AZAXDATA,U,2)
 . S AZAXDSP=$$VSDT^AZAXCADU($P(AZAXDATA,U,3))
 . ;
 . S Z=""
 . S $P(Z,U)=$$UID^AZAXCADU(AZAXDFN)              ;1-UNIQUE PATIENT ID
 . S $P(Z,U,2)=AZAXDGNA                           ;2-DRUG NAME
 . S $P(Z,U,3)=$$SLDATE^AZAXCADU($P(AZAXDSP,".")) ;3-DISPENSED DATE
 . S $P(Z,U,4)=$P(AZAXDATA,U,7)                   ;4-DAYS SUPPLIED
 . S $P(Z,U,5)=$$NDC^AZAXCADU($P(AZAXDATA,U))     ;5-NDC
 . S $P(Z,U,6)=$P(AZAXDATA,U,6)                   ;6-QUANTITY
 . S $P(Z,U,7)=$P(AZAXDATA,U,5)                   ;7-SIG
 . ;
 . Q:'AZAXDFN
 . Q:'AZAXVMD0
 . Q:'AZAXDSP
 . ;
 . S ^TMP("AZAX",$J,$$SITE^AZAXCADU,AZAXDFN,"VMED",AZAXVMD0,AZAXDSP,0)=Z
 Q
LOOP2(AZAXPDTS,AZAXD) ;
 ;----- LOOP THROUGH PRESCRIPTION FILE AND FIND ALL PATIENTS IN LOOP1
 ;      WHO ARE PRESCRIBED THE SPECIFIED DRUGS
 ;      
 ;      INCOMING:
 ;      AZAXPDTS  =  DISPENSED DATE RANGE IN BEG^END FORMAT
 ;      AZAXD     =  ARRAY OF DRUG NAMES TO BE SEARCHED
 ;
 ;      VARIABLES USED IN THIS SUBROUTINE:
 ;      AZAXDFN   =  PATIENT IEN
 ;      AZAXDGD0  =  DRUG IEN
 ;      AZAXDGNA  =  DRUG NAME
 ;      AZAXPSD1  =  PRESCRIPTION PROFILE IEN FROM PHARMACY PATIENT FILE
 ;      AZAXRXD0  =  PRESCRIPTION IEN
 ;
 N AZAXDFN,AZAXPSD1,AZAXRXD0
 ;      
 Q:'$D(^TMP("AZAX",$J,"X"))
 ;
 S AZAXDFN=0
 F  S AZAXDFN=$O(^TMP("AZAX",$J,"X",$$SITE^AZAXCADU,AZAXDFN)) Q:'AZAXDFN  D
 . S AZAXPSD1=0
 . F  S AZAXPSD1=$O(^PS(55,AZAXDFN,"P",AZAXPSD1)) Q:'AZAXPSD1  D
 . . S AZAXRXD0=$G(^PS(55,AZAXDFN,"P",AZAXPSD1,0))
 . . Q:'AZAXRXD0
 . . D INITIAL(AZAXRXD0,AZAXPDTS)
 . . D REFILLS(AZAXRXD0,AZAXPDTS)
 . . D PARTIAL(AZAXRXD0,AZAXPDTS)
 ;
 Q
INITIAL(AZAXRXD0,AZAXPDTS) ;
 ;----- PROCESS INITIAL PRESCRIPTION
 ;
 N AZAXDGD0,AZAXDGNA,AZAXDSP
 ;
 S AZAXDSP=$P($G(^PSRX(AZAXRXD0,2)),U,5)
 Q:AZAXDSP<$P(AZAXPDTS,U)
 Q:AZAXDSP>$P(AZAXPDTS,U,2)
 ;
 S AZAXDGD0=$P($G(^PSRX(AZAXRXD0,0)),U,6)
 Q:'AZAXDGD0
 ;
 S AZAXDGNA=$$DRUG^AZAXCADU(AZAXDGD0)
 Q:AZAXDGNA']""
 Q:'$D(AZAXD($P(AZAXDGNA," ")))
 ;
 D SET2(AZAXRXD0)
 Q
REFILLS(AZAXD0,AZAXPDTS) ;
 ;----- LOOP THROUGH PRESCRIPTION REFILLS
 ;
 ;      AZAXD0  =  PRESCRIPTION FILE IEN
 ;
 N AZAXD1,AZAXDSP
 ;      
 S AZAXD1=0
 F  S AZAXD1=$O(^PSRX(AZAXD0,1,AZAXD1)) Q:'AZAXD1  D
 . S AZAXDSP=$P($G(^PSRX(AZAXD0,1,AZAXD1,0)),U,19)
 . Q:AZAXDSP<$P(AZAXPDTS,U)
 . Q:AZAXDSP>$P(AZAXPDTS,U,2)
 . D SET3(AZAXD0,AZAXD1)
 Q
PARTIAL(AZAXD0,AZAXPDTS) ;
 ;----- LOOP THROUGH PARTIAL PRESCRIPTION FILLS
 ;
 ;      AZAXD0  =  PRESCRIPTION FILE IEN
 ;
 N AZAXD1,AZAXDSP
 ;
 S AZAXD1=0
 F  S AZAXD1=$O(^PSRX(AZAXD0,"P",AZAXD1)) Q:'AZAXD1  D
 . S AZAXDSP=$P($G(^PSRX(AZAXD0,"P",AZAXD1,0)),U,13)
 . Q:AZAXDSP<$P(AZAXPDTS,U)
 . Q:AZAXDSP>$P(AZAXPDTS,U,2)
 . D SET4(AZAXD0,AZAXD1)
 Q
SET1(AZAXVSD0,AZAXDFN,AZAXICNA) ;
 ;----- SET ICD DX DATA INTO ^TMP GLOBAL
 ;
 ;      NOTE:  The actual ICD name is being used to set this global
 ;      since the ICD code could either be a diagnosis or
 ;      procedure code.  Using the IEN could cause problems
 ;      as 2 different files are involved, i.e., the
 ;      ICD DIAGNOSIS and the ICD OPERATION/PROCEDURE, could
 ;      possibly share the same IEN for a diagnosis and procedure.
 ;
 ;      INCOMING:
 ;      AZAXDFN   =  PATIENT IEN
 ;      AZAXVSD0  =  VISIT IEN
 ;      AZAXICNA  =  ICD CODE NAME (DX OR PROCEDURE)
 ;
 N AZAXVSDT,Z
 ;
 S AZAXVSDT=$$VISDT^AZAXCADU(AZAXVSD0)
 S AZAXVSDT=$P(AZAXVSDT,".")
 S $P(Z,U)=$$UID^AZAXCADU(AZAXDFN)             ;1-UNIQUE PATIENT ID
 S $P(Z,U,2)=$$SEX^AZAXCADU(AZAXDFN)           ;2-SEX
 S $P(Z,U,3)=$$AGE^AZAXCADU(AZAXDFN)           ;3-AGE
 S $P(Z,U,4)=AZAXICNA                          ;4-ICD CODE
 S $P(Z,U,5)=$$LOC^AZAXCADU(AZAXVSD0)          ;5-LOCATION
 S $P(Z,U,6)=$$SLDATE^AZAXCADU(AZAXVSDT)       ;6-VISIT DATE
 ;
 Q:'AZAXDFN
 Q:'AZAXVSD0
 Q:AZAXICNA']""
 ;
 S ^TMP("AZAX",$J,"X",$$SITE^AZAXCADU,AZAXDFN,AZAXVSD0,AZAXICNA,0)=Z
 Q
SET2(AZAXD0) ;
 ;----- SET RX DATA INTO ^TMP GLOBAL
 ;
 ;      INCOMING:
 ;      AZAXD0  =  PRESCRIPTION FILE IEN
 ;
 N AZAXDATA,AZAXDFN,AZAXDSP,Z
 ;     
 S Z=""
 S AZAXDATA=$G(^PSRX(AZAXD0,0))
 S AZAXDFN=$P(AZAXDATA,U,2)
 S $P(Z,U)=$$UID^AZAXCADU(AZAXDFN)             ;1-UNIQUE PATIENT ID
 S $P(Z,U,2)=$$DRUG^AZAXCADU($P(AZAXDATA,U,6)) ;2-DRUG NAME
 S $P(Z,U,4)=$P(AZAXDATA,U,8)                  ;4-DAYS SUPPLIED
 S $P(Z,U,6)=$P(AZAXDATA,U,7)                  ;6-QUANTITY
 S $P(Z,U,7)=$P(AZAXDATA,U,10)                 ;7-SIG
 S AZAXDATA=$G(^PSRX(AZAXD0,2))
 S AZAXDSP=$P(AZAXDATA,U,5)
 S $P(Z,U,3)=$$SLDATE^AZAXCADU(AZAXDSP)        ;3-DISPENSED DATE
 S $P(Z,U,5)=$P(AZAXDATA,U,7)                  ;5-NDC
 ;
 Q:'AZAXDFN
 Q:'AZAXD0
 Q:'AZAXDSP
 ;
 S ^TMP("AZAX",$J,$$SITE^AZAXCADU,AZAXDFN,"DRUG",AZAXD0,AZAXDSP,0)=Z
 S ^TMP("AZAX",$J,"DRUG",0)=$G(^TMP("AZAX",$J,"DRUG",0))+1
 ;
 D SET5(AZAXDFN)
 ;
 Q
SET3(AZAXD0,AZAXD1) ;
 ;----- SET RX REFILL DATA INTO ^TMP GLOBAL
 ;
 ;      INCOMING:
 ;      AZAXD0  =  PRESCRIPTION FILE IEN
 ;      AZAXD1  =  REFILL IEN
 ;      
 N AZAXDATA,AZAXDFN,AZAXDSP,Z
 ;
 S Z=""
 S AZAXDATA=$G(^PSRX(AZAXD0,0))
 S AZAXDFN=$P(AZAXDATA,U,2)
 S $P(Z,U)=$$UID^AZAXCADU(AZAXDFN)             ;1-UNIQUE PATIENT ID
 S $P(Z,U,2)=$$DRUG^AZAXCADU($P(AZAXDATA,U,6)) ;2-DRUG NAME
 S $P(Z,U,7)=$P(AZAXDATA,U,10)                 ;7-SIG
 S AZAXDATA=$G(^PSRX(AZAXD0,1,AZAXD1,0))
 S AZAXDSP=$P(AZAXDATA,U,19)
 S $P(Z,U,3)=$$SLDATE^AZAXCADU(AZAXDSP)        ;3-DISPENSED DATE
 S $P(Z,U,4)=$P(AZAXDATA,U,10)                 ;4-DAYS SUPPLY
 S $P(Z,U,5)=$P(AZAXDATA,U,13)                 ;5-NDC
 S $P(Z,U,6)=$P(AZAXDATA,U,4)                  ;6-QTY
 ;
 Q:'AZAXDFN
 Q:'AZAXD0
 Q:'AZAXDSP
 ;
 S ^TMP("AZAX",$J,$$SITE^AZAXCADU,AZAXDFN,"DRUG",AZAXD0,AZAXDSP,0)=Z
 S ^TMP("AZAX",$J,"DRUG",0)=$G(^TMP("AZAX",$J,"DRUG",0))+1
 ;
 D SET5(AZAXDFN)
 ;
 Q
SET4(AZAXD0,AZAXD1) ;
 ;---- SET RX PARTIAL FILL DATA INTO ^TMP GLOBAL
 ;
 ;     INCOMING:
 ;     AZAXD0  =  PRESCRIPTION FILE IEN
 ;     AZAXD1  =  PARTIAL FILL IEN
 ;
 N AZAXDATA,AZAXDFN,AZAXDSP,Z
 ;
 S Z=""
 S AZAXDATA=$G(^PSRX(AZAXD0,0))
 S AZAXDFN=$P(AZAXDATA,U,2)
 S $P(Z,U)=$$UID^AZAXCADU(AZAXDFN)             ;1-UNIQUE PATIENT ID
 S $P(Z,U,2)=$$DRUG^AZAXCADU($P(AZAXDATA,U,6)) ;2-DRUG NAME
 S $P(Z,U,7)=$P(AZAXDATA,U,10)                 ;7-SIG
 S AZAXDATA=$G(^PSRX(AZAXD0,"P",AZAXD1,0))
 S AZAXDSP=$P(AZAXDATA,U,13)
 S $P(Z,U,3)=$$SLDATE^AZAXCADU(AZAXDSP)        ;3-DISPENSED DATE
 S $P(Z,U,4)=$P(AZAXDATA,U,10)                 ;4-DAYS SUPPLY
 S $P(Z,U,5)=$P(AZAXDATA,U,12)                 ;5-NDC
 S $P(Z,U,6)=$P(AZAXDATA,U,4)                  ;6-QTY
 ;
 Q:'AZAXDFN
 Q:'AZAXD0
 Q:'AZAXDSP
 ;
 S ^TMP("AZAX",$J,$$SITE^AZAXCADU,AZAXDFN,"DRUG",AZAXD0,AZAXDSP,0)=Z
 S ^TMP("AZAX",$J,"DRUG",0)=$G(^TMP("AZAX",$J,"DRUG",0))+1
 ;
 D SET5(AZAXDFN)
 ;
 Q
SET5(AZAXDFN) ;
 ;----- SETS ^TMP GLOBAL FOR PATIENTS WHO HAVE BOTH THE ICD AND THE DRUG
 ;
 ;      INCOMING:
 ;      AZAXDFN  =  PATIENT IEN
 ;
 N AZAXICNA,AZAXVD0,Z
 ;
 S AZAXVD0=0
 F  S AZAXVD0=$O(^TMP("AZAX",$J,"X",$$SITE^AZAXCADU,AZAXDFN,AZAXVD0)) Q:'AZAXVD0  D
 . S AZAXICNA=""
 . F  S AZAXICNA=$O(^TMP("AZAX",$J,"X",$$SITE^AZAXCADU,AZAXDFN,AZAXVD0,AZAXICNA)) Q:AZAXICNA']""  D
 . . S Z=$G(^TMP("AZAX",$J,"X",$$SITE^AZAXCADU,AZAXDFN,AZAXVD0,AZAXICNA,0))
 . . S ^TMP("AZAX",$J,$$SITE^AZAXCADU,AZAXDFN,"ICDS",AZAXVD0,AZAXICNA,0)=Z
 . . S ^TMP("AZAX",$J,"ICDS",0)=$G(^TMP("AZAX",$J,"ICDS",0))+1
 Q
SET6(AZAXVMD0) ;
 ;----- SET V MEDICATION DATA INTO ^TMP GLOBAL
 ;
 ;      INPUT:
 ;      AZAXVMD0  =  V MEDICATION FILE IEN
 ;
 N AZAXDATA,AZAXDFN,AZAXDSP,Z
 ;
 S AZAXDATA=$G(^AUPNVMED(AZAXVMD0,0))
 S AZAXDFN=$P(AZAXDATA,U,2)
 S AZAXDSP=$$VSDT^AZAXCADU($P(AZAXDATA,U,3))
 ;
 S Z=""
 S $P(Z,U)=$$UID^AZAXCADU(AZAXDFN)              ;1-UNIQUE PATIENT ID
 S $P(Z,U,2)=$$DRUG^AZAXCADU($P(AZAXDATA,U))    ;2-DRUG NAME
 S $P(Z,U,3)=$$SLDATE^AZAXCADU($P(AZAXDSP,".")) ;3-DISPENSED DATE
 S $P(Z,U,4)=$P(AZAXDATA,U,7)                   ;4-DAYS SUPPLIED
 S $P(Z,U,5)=$$NDC^AZAXCADU($P(AZAXDATA,U))     ;5-NDC
 S $P(Z,U,6)=$P(AZAXDATA,U,6)                   ;6-QUANTITY
 S $P(Z,U,7)=$P(AZAXDATA,U,5)                   ;7-SIG
 ;
 Q:'AZAXDFN
 Q:'AZAXVMD0
 Q:'AZAXDSP
 ;
 S ^TMP("AZAX",$J,$$SITE^AZAXCADU,AZAXDFN,"VMED",AZAXVMD0,AZAXDSP,0)=Z
 Q
FILE ;
 ;----- WRITE ^TMP GLOBAL TO DATA FILES
 ;
 N AZAXTYPE
 ;
 F AZAXTYPE="DRUG","ICDS" D PUT(AZAXTYPE)
 ;
 Q
PUT(AZAXTYPE) ;
 ;----- WRITE DATA FROM ^TMP FILE TO DATA FILE
 ;
 N %FILE,AZAXD0,AZAXD1,AZAXD2,AZAXD3,AZAXFILE,AZAXOUT,AZAXPATH,X
 ;
 I '$G(^TMP("AZAX",$J,AZAXTYPE,0)) D  Q
 . W !,"NO "_AZAXTYPE_" DATA FOUND!"
 ;
 S AZAXFILE=$$FNAME^AZAXCADU(AZAXTYPE)
 Q:AZAXFILE']""
 ;
 S AZAXPATH=$$PATH^AZAXCADU($$SITE^AZAXCADU)
 Q:AZAXPATH']""
 ;
 D HFS^AZAXCADU(AZAXPATH,AZAXFILE,.%FILE,.AZAXOUT)
 Q:$G(AZAXOUT)
 ;
 U %FILE
 ;
 S AZAXD0=0
 F  S AZAXD0=$O(^TMP("AZAX",$J,AZAXD0)) Q:'AZAXD0  D
 . S AZAXD1=0
 . F  S AZAXD1=$O(^TMP("AZAX",$J,AZAXD0,AZAXD1)) Q:'AZAXD1  D
 . . S AZAXD2=0
 . . F  S AZAXD2=$O(^TMP("AZAX",$J,AZAXD0,AZAXD1,AZAXTYPE,AZAXD2)) Q:'AZAXD2  D
 . . . S AZAXD3=0
 . . . F  S AZAXD3=$O(^TMP("AZAX",$J,AZAXD0,AZAXD1,AZAXTYPE,AZAXD2,AZAXD3)) Q:'AZAXD3  D
 . . . . S X=$G(^TMP("AZAX",$J,AZAXD0,AZAXD1,AZAXTYPE,AZAXD2,AZAXD3,0))
 . . . . S X=$$FORMAT^AZAXCADU(X)
 . . . . Q:X']""
 . . . . W X
 . . . . W !
 ;
 D ^%ZISC
 ;
 I $E($G(IOST),1,2)="C-" W !?5,"FILE "_AZAXFILE_" HAS BEEN CREATED"
 ;
 Q
DATES(AZAXTXT,AZAXY) ;
 ;----- ASK DATE RANGE
 ;
 ;      INPUT:
 ;      AZAXTXT  =  PROMPT TEXT
 ;      
 ;      OUTPUT:
 ;      AZAXY    =  BEGIN^END DATES
 ;      
DL ;----- DATE LOOP
 ;
 N AZAXBEG,AZAXEND,DIR,DIRUT,DTOUT,DUOUT,X,Y
 ;
 W !
 S AZAXY=""
 S DIR(0)="DO^::E"
 S DIR("A")="Begin with "_AZAXTXT
 S DIR("?")="The "_AZAXTXT_" to include in the range"
 D ^DIR
 Q:$D(DTOUT)!($D(DUOUT))!($D(DIRUT))
 Q:Y=""
 S AZAXBEG=Y
 S DIR("A")="End with "_AZAXTXT
 D ^DIR
 Q:$D(DTOUT)!($D(DUOUT))!($D(DIRUT))
 Q:Y=""
 S AZAXEND=Y
 I AZAXEND<AZAXBEG D  G DL
 . W *7,!?5,"ENDING DATE cannot be less than BEGINNING DATE"
 S AZAXY=AZAXBEG_U_AZAXEND
 Q
TXT ;----- PRINT OPTION TEXT
 ;
 N I,X
 F I=1:1 S X=$P($T(DESC+I),";",3) Q:X["$$END"  W !,X
 Q       
BLD(AZAXICD,AZAXPRC,AZAXDRG) ;
 ;----- BUILD ICD DX CODE, PROCEDURE CODE AND DRUG ARRAYS
 ;
 N I,X
 ;
 K AZAXICD,AZAXPRC,AZAXDRG
 ;
 F I=1:1 S X=$P($T(I+I),";",3) Q:X']""  Q:X["$$END"  S AZAXI(X)=""
 F I=1:1 S X=$P($T(P+I),";",3) Q:X']""  Q:X["$$END"  S AZAXP(X)=""
 F I=1:1 S X=$P($T(D+I),";",3) Q:X']""  Q:X["$$END"  S AZAXD(X)="" 
 Q
I ;----- ICD DIAGNOSIS CODES BEING SEARCHED:
 ;;;714;RHEUMATOID ARTHRITIS;*** TESTING - AEF *** REMOVE THIS LINE
 ;;;250;DIABETES;*** TESTING - AEF *** REMOVE THIS LINE
 ;;;$$END ;*** TESTING - AEF *** REMOVE THIS LINE
 ;;410;ACUTE MYOCARDIAL INFARCTION 
 ;;411;UNSTABLE ANGINA PECTORIS
 ;;412;PREVIOUS ACUTE MYOCARDIAL INFARCTION
 ;;413;ANGINA PECTORIS
 ;;414;OTHER CHRONIC ISCHEMIC HEART DISEASE
 ;;$$END
 ;
P ;----- ICD PROCEDURE CODES BEING SEARCHED:
 ;;45.82;PERCUTANEOUS TRANSLUMINAL CORONARY ANGIOPLASTY
 ;;$$END
 ;
D ;----- DRUGS BEING SEARCHED:
 ;;;ASPIRIN;;*** TESTING - AEF *** REMOVE THIS LINE
 ;;;$$END ;*** TESTING - AEF *** REMOVE THIS LINE
 ;;ATORVASTATIN;LIPITOR
 ;;LOVASTATIN;MEVACOR
 ;;ROSUVASTATIN;CRESTOR
 ;;PRAVASTATIN;PRAVACHOL
 ;;SIMVASTATIN;ZOCOR
 ;;FLUVASTATIN;LESCOL
 ;;CERIVASTATIN;BAYCOL
 ;;$$END
