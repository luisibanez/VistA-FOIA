ORB3LAB ; slc/CLA - Routine to trigger Lab-related notifications ;10/14/03
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**210**;Dec 17, 1997
 ;
LAB(DFN,LRDFN,LRI,LRA,LRSS) ;trigger Lab Anatomic Path notifs
 ; called by ADD^LRWOMEN (DBIA #4287)
 ;
 N ORBMSG,APMD,ORBADUZ,SRPT
 S APMD=$P(LRA,U,7)  ;provider/physician "ordering" the ap test
 I $L(APMD) S ORBADUZ(APMD)=""
 S SRPT=$P(LRA,U,15) ;original release date
 S SRPT=$S($L(SRPT):" supplmntl rpt",1:"")
 S ORBMSG=$S(LRSS="CY":"Cytology",LRSS="SP":"Surgical Pathology",1:"Anatomic Pathology")
 S ORBMSG=ORBMSG_SRPT_" results available."
 D EN^ORB3(71,DFN,"",.ORBADUZ,ORBMSG,"")
 Q
