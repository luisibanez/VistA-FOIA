ADEFLEX1 ; IHS/HQT/MJL  - EXTRACT F- DATA PART 3 ;  [ 03/24/1999   9:04 AM ]
 ;;6.0;ADE;;APRIL 1999
 ; THIS PART CONTAINS ERROR ROUTINES ONLY
 ; ORIGINAL VERSION IHS/ANMC/HMW 12-31-87 HAPPY NEW YEAR
ERR1 ;EP
 W !," - DAMAGED DATA FILE: MISSING 0TH NODE FOR FLUORIDATION SURVEILLANCE FILE ENTRY ",ADED0 D ERREND G S2^ADEFLEX0
ERR2 ;EP
 W !," - DAMAGED DATA FILE: NO WATER SYSTEM ENTRY FOR FLUORIDATION SURVEILLANCE ENTRY ",ADED0," (REFERENCING DFN ",ADEWP,")",! D ERREND G S2^ADEFLEX0
ERR3 ;EP
 W !," - MISSING NAME OR SFC CODE DATA FOR ENTRY ",$P(^ADEFLU(ADED0,0),U)," IN WATER SYSTEM FILE " D ERREND G S2^ADEFLEX0
ERR4 ;EP
 W !," - DAMAGED DATA FILE: MISSING SUBENTRY ",ADED1," FOR DENTAL SERVICE FILE ENTRY ",ADED0 D ERREND G S3^ADEFLEX0
ERR5 ;EP
 W !," - INCOMPLETE DATA: MISSING EQUIPMENT TYPE FOR SUBENTRY ",ADED1," OF FLUORIDATION SURVEILLANCE ENTRY ",ADED0 D ERREND G S3^ADEFLEX0
ERR6 ;EP
 W !," - INCOMPLETE DATA: MISSING ANALYST POINTER IN SUBENTRY ",ADED1," OF DENTAL SERVICE ENTRY ",ADED0 D ERREND G S3^ADEFLEX0
ERR7 ;EP
 W !," - DAMAGED DATA FILE: MISSING ANALYST ENTRY ",ADEID," FOR SUBENTRY ",ADED1," IN FLUORIDATION SURVEILLANCE FILE ENTRY ",ADED0 D ERREND G S3^ADEFLEX0
ERR8 ;EP
 I '$D(ADERR(ADEID)) W !," - INCOMPLETE DATA FILE: MISSING OR INVALID SSN FOR ",$P(^DIC(16,ADEID,0),U) S ADERR(ADEID)="" D ERREND
 G S3^ADEFLEX0
ERR9 ;EP
 W !," - INCOMPLETE DATA: MISSING TEST RESULTS IN SUBENTRY ",ADED1," OF FLUORIDATION SURVEILLANCE ENTRY ",ADED0 D ERREND G S3^ADEFLEX0
ERREND ;
 W !,?15,"RECORD SCANNING "
 Q
