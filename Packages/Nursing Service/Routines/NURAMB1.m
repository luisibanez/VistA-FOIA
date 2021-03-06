NURAMB1 ;HIRMFO/MD,FT-BATCH JOB TO UPDATE ACUITY RUN ;2/27/98  14:21
 ;;4.0;NURSING SERVICE;**1,9****;Apr 25, 1997
EN1 ; ENTRY FROM MANHOUR NIGHT SHIFT ACUITY
 ; SUBROUTINE TO CALCULATE ACUITY FOR HOSPITAL
 S NURTYPE=2,NURDAY=RPTDATE,NURSHFT="N" D EN2^NURAMHU ;purge manhours multiple in 213.9
ACUIT ; LOOP THROUGH ^TMP($J,"NURCEN") TO STORE LATEST CLASS DATA IN FILE 213.4
 ; SETS NURSDT,NURCENDT AS THE BEGINNING AND ENDING DATES FOR SEARCH
 Q:OUTSW(2)  ;quit if night shift acuity already processed
 S NURTIME=$P($G(^DIC(213.9,1,0)),U,6) G:NURTIME="" QUIT ;get night shift acuity time
 S (NURCUTDT,NURCENDT)=+(NURDAY_"."_NURTIME) D ^NURSACEN ; Calculate hospital census at nightshift cutoff time.
 F NLOC=NWARD(2):0 S NLOC=$O(^TMP($J,"NURCEN",NLOC)) Q:NLOC'>0  F DFN=DFN(2):0 S DFN=$O(^TMP($J,"NURCEN",NLOC,DFN)) Q:DFN'>0  D
 .S BEDSECT=+$O(^NURSF(213.3,"B","DOMICILIARY",""))
 .I $D(^NURSF(211.4,"ABS",BEDSECT,NLOC)) S SHIFT="N",NBEDSECT=$E("00"_BEDSECT,1+$L(BEDSECT),2+$L(BEDSECT)),(NWARD,NCWARD)=NLOC D DOMRECNT^NURAAU2 Q
 .W:$E(IOST)="C" "." D EN6^NURSCUTL S NURSCLAS("CL")=2,NURSCLAS("WARD")=NLOC D EN2^NURSCUTL S NURDAT=$G(^NURSA(214.6,+NURSCLAS,0))
 .Q:$P(NURDAT,U,3)=""!($P(NURDAT,U,8)="")!($P(NURDAT,U,9)="")!($P(NURDAT,U,8)'=NLOC)  ; do not process if category or unit or bedsection is missing or the classification unit is different from patient's current unit.
 .S CLASS=$P(NURDAT,U,3),BEDSECT=$P(NURDAT,U,9),NCWARD=$P(NURDAT,U,8)
 .S:$L(BEDSECT)=1 BEDSECT="0"_BEDSECT
 .F I=1:1:5 S NCLASS(I)=0
 .S NCLASS(CLASS)=1
 .I $P($G(^NURSF(211.4,NCWARD,1)),U)="A" S SHIFT="N" D FINALLY^NURAAU0 ;process if Patient Care Flag set to ACTIVE
 .S $P(^DIC(213.9,1,"DATE"),U,11,12)=NCWARD_U_DFN ; update last ward & patient processed
 .Q
 D HEMCOUNT^NURAAU3,RECOUNT^NURAAU3
 S $P(^DIC(213.9,1,"DATE"),U,10)=1,$P(^("DATE"),U,11)=0,$P(^("DATE"),U,12)=0 ;mark night shift processing as complete and night shift ward and patient  as zero.
QUIT ;KILL VARIABLES/ROUTINE EXIT POINT
 K ^TMP($J,"NURCEN"),^TMP($J,"NGHT")
 Q
