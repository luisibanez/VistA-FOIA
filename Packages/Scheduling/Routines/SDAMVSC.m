SDAMVSC ;;OIFO-BAY PINES/TEH - Appt Event Driver Utilities-Validate SC Appt type ; 12/1/91 [ 09/19/96  1:39 PM ]
 ;;5.3;Scheduling;**394,417**;Aug 13, 1993
 ;
 ;***************************************************************************************************************************
 ;
 ;                                                   ***** NOTE *****
 ;                                                   
 ;This software was created to be used with the SCHEDULING V5.3 appointment management package. The SRA API (SDAMA301)
 ;was employed to retrieve data from the PATIENT APPOINTMENT file (2.98) due inpart to VA Fileman non-compliance.
 ;
 ;DBIA #4433 SUBSCRIPTION 
 ;
 ;Entry Point EN. This routine requires the OUTPATIENT ENOUNTER IEN (variable SDOE)
 ;
 ;GLOBALS: ^SCE(IEN,0) (#.1) APPOINTMENT TYPE [10P:409.1]
 ;         ^DPT(IEN,"S",DATE,0)  ^ (#9.5) APPOINTMENT TYPE [16P:409.1]
 ;         ^SD(409.41,0)=OUTPATIENT CLASSIFCATION TYPE "Was treatment for SC Condition? " QUESTION FOR CHECKOUT.
 ;
 ;PROTOCOLS: This routine is called from the SDAM APPOINTMENT EVENTS.
 ;         
 ;This validates that both the OUTPATIENT ENCOUNTER and the PATIENT SCHEDULING NODES for APPOINTMENT TYPE are (pointer to
 ;409.1 APPOINTMENT TYPE) are set to the "SERVICE CONNECTED" appointment type when the response to the CLASSIFICATION TYPE
 ;"Was treatment for SC Condition?" question is answered "YES". If the question is answered "NO" and the APPOINTMENT TYPE
 ;is SERVICE CONNECTED, then the APPOINTMENT TYPE is reverted to REGULAR.
 ;
 ;
 ;****************************************************************************************************************************
 Q
EN ;Entry Point
 G END:'$D(SDOE),END:'$G(SDOE),END:SDOE=""
 N SDVSCL,SDVSTD,SDAPDF,SDDPTYP,SDOED,SDVSTD,SDVDPTD,SDVSCD,SDSCV,SDAPPTY,SDAPDT,SDDFN,SDVSTD,SDIENS,SDARRAY,SDAPDF
 S SDOED=$G(^SCE(SDOE,0)) G END:SDOED=""
 S SDDFN=$P(SDOED,U,2),SDAPDT=$P(SDOED,U) I '$D(^DPT(SDDFN,"S",SDAPDT,0)) Q
 ;GET APPOINTMENT FROM 2.98
 N SDAMIENS S SDAMIENS=SDAPDT_","_SDDFN_","
 S SDAPDPT=$$GET1^DIQ(2.98,SDAMIENS,9.5,"I")
 S SDVSCL=$P(SDOED,U,4)
 S SDVSTD=$P(SDOED,U,5),SDSCV=$$GET1^DIQ(9000010,SDVSTD_",",80001,"I")
 S SDAPDF=$$GET1^DIQ(44,SDVSCL_",",2507,"I")
 S SDAPPTY=$S(SDSCV=1:11,$D(SDAPDPT):SDAPDPT,SDAPDT'="":SDAPDF,1:9) D
 .;Set FDA for SCE(ien,0) OUTPATIENT ENCOUNTER
 .S SDIENS=SDOE_"," K ^TMP("SDAMSCE",$J)
 .D FDA^DILF(409.68,SDIENS,.1,,SDAPPTY,"^TMP(""SDAMSCE"",$J)","^TMP(""SDAMSCE"",$J)")
 .I $D(^TMP("SDAMSCE",$J,"DIERR")) D
 ..W !,"Processing Error ",^TMP("SDAMSCE",$J,"DIERR",1) Q
 .D FILE^DIE(,"^TMP(""SDAMSCE"",$J)","^TMP(""SDAMSCE"",$J)")
 .;Set FDA for ^DPT(ien,"S") PATIENT APPOINTMENT.
 .K ^TMP($J,"SDAMA301")
 .N SDAMVSCX S SDARRAY(1)=SDAPDT_";"_SDAPDT,SDARRAY(4)=SDDFN,SDARRAY("FLDS")=10,SDAMVSCX=$$SDAPI^SDAMA301(.SDARRAY)
 .I 'SDAMVSCX D  Q
 ..W !,"Processing Error "
 .S SDDPTYP=+$P($G(^TMP($J,"SDAMA301",SDDFN,SDVSCL,SDAPDT)),U,10) I SDDPTYP'=SDAPPTY D
 ..S $P(^DPT(SDDFN,"S",SDAPDT,0),U,16)=SDAPPTY
END Q
