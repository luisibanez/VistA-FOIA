PXRMGECV ;SLC/JVS -Extract data for GEC Reports ;5/23/03  12:49
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 Q
 ;
 ;Arrays
 ;^TMP("PXRMGEC",$J,    = Root Reference
 ;"REF",DATE,DFN)       = Number of HF in Referral
 ;"REFDFN",DFN)         = Number of Referrals per Patient
 ;"HS"                  = Heath Summary Array
 Q
GEC ;Get ien for GEC Date Sources
 S (GEC1DA,GEC2DA,GEC3DA,GECFDA)=0
 S GECFDA=$O(^PX(839.7,"B","GECF",0))
 S GEC1DA=$O(^PX(839.7,"B","GEC1",0))
 S GEC2DA=$O(^PX(839.7,"B","GEC2",0))
 S GEC3DA=$O(^PX(839.7,"B","GEC3",0))
 Q
 ;
RANG(BDT,EDT,VDT,SDT,CHK) ;Dates are in date range
 ;S=start date F=finished date
 N OK,SOK,FOK
 S (SOK,FOK,OK)=0
 I CHK["S" D
 .S:($P(SDT,".",1)'<(BDT))&($P(SDT,".",1)'>(EDT)) SOK=1
 I CHK["F" D
 .S:($P(VDT,".",1)'<(BDT))&($P(VDT,".",1)'>(EDT)) FOK=1
 S OK=$S(SOK=1:1,FOK=1:1,1:0)
 I CHK["SF"&(SOK+FOK'=2) S OK=0
 Q OK
 ;
FIN(DATE,DFN) ;Check to see if finished
 N GEC,DA,VST,VDT,DONE
 S DONE=0,VDT="0000000"
 S GEC=0 F  S GEC=$O(^AUPNVHF("AED",DATE,DFN,GEC)) Q:GEC=""  D
 .I GEC=GECFDA S DONE=1 D
 ..S DA=$O(^AUPNVHF("AED",DATE,DFN,GEC,0))
 ..S VST=$P($G(^AUPNVHF(DA,0)),"^",3)
 ..S VDT=$P($G(^AUPNVSIT(VST,0)),"^",1)
 Q DONE_"^"_VDT
 ;
E(ARY,FIN,BDT,EDT,CHK,DFNONLY) ;EXTRACT GEC REFERRALS
 N DATE,GEC,DFN,DA,DFNX,DATEX,ZALL,CNTREF,COMPLETE
 N REFERAL,REFERA,LOCA,LOCN,LOC,DOC,DOCT,DOCTN,DOCTNA
 N DOCTOR,DR,DONE,VDT,FLAG,DTCHK,DATE1,DFN1,DATEY,DFNXX
 N GEC1DA,GEC2DA,GEC3DA,GECFDA,DFNFLAG
 N TMPDFN,TMPDOC,TMPDT,TMPLOC
 ;====================================================
 K ^TMP("PXRMGEC",$J,"REF"),^TMP("PXRMGEC",$J,"REFDFN")
 ;====================================================
 ;Callers Responsibility to Kill the Array
 ;(ARY,FIN,BDT,EDT,CHK,DFNONLY)
 ;EXAMPLE FOR HEALTH SUMMARY
 ;D E^PXRMGECV("HS",2,3020509,3030609,"S",0)
 ;Parameters
 ;S ARY="HS"
 ;Array to Create HS,DT,DFN,DOC,LOC,HFCD
 ;S FIN=0
 ;finished referrals 1=finished 0=unfinished 2=Both ""=finished
 ;S BDT=3020509 Begin Date
 ;S EDT=3030609 End Date
 ;S CHK="S"
 ;Check dates S=Start date Default F=Final date for date range
 ;S DFNONLY=0
 ; DFN of patient 0 or all
 ;=====================================================
 ;Count of Referrals
 S CNTREF=0
 D GEC ;get iens for the GECF VARIABLES
 ;==============
 D WORK
 Q
WORK ;
 S DATE1=0,DFN1=0
 S DATE="" F  S DATE=$O(^AUPNVHF("AED",DATE)) Q:DATE=""  D
 .S DFN="" F  S DFN=$O(^AUPNVHF("AED",DATE,DFN)) Q:DFN=""  D
 ..S COMPLETE=$$FIN(DATE,DFN),DONE=+COMPLETE,VDT=$P(COMPLETE,"^",2)
 ..Q:FIN=1&(DONE=0)
 ..Q:FIN=0&(DONE=1)
 ..Q:'$$RANG(BDT,EDT,VDT,DATE,CHK)
 ..;
PAT ..;===Check Patient DFN to see if continue or quit
 ..S DFNFLAG=1 I DFNONLY>0 D  Q:DFNFLAG=0
 ...I $D(DFNARY)&('$D(DFNARY(DFN))) S DFNFLAG=0
 ...I '$D(DFNARY)&(DFN'=DFNONLY) S DFNFLAG=0
 ...;======
 ...;
 ..S GEC="" F  S GEC=$O(^AUPNVHF("AED",DATE,DFN,GEC)) Q:GEC=""  D
 ...Q:GEC'=GECFDA&(GEC'=GEC1DA)&(GEC'=GEC2DA)&(GEC'=GEC3DA)
 ...S DFNXX=$P($G(^DPT(DFN,0)),"^",1)_" "_$P($G(^DPT(DFN,0)),"^",9)
 ...S DATEY=$$FMTE^XLFDT(DATE,"1P")
 ...I $D(^TMP("PXRMGEC",$J,"REF",DATE,DFN)) S ^TMP("PXRMGEC",$J,"REF",DATE,DFN)=$G(^TMP("PXRMGEC",$J,"REF",DATE,DFN))+1
 ...E  S ^TMP("PXRMGEC",$J,"REF",DATE,DFN)=1
 ...;TO HERE BY REFERRAL
 ...S DA="" F  S DA=$O(^AUPNVHF("AED",DATE,DFN,GEC,DA)) Q:DA=""  D
 ....;TO HERE BY HEALTH FACTOR
 ....D VDOC(DA,.VDOC,.LOCB)
 D PATIENT^PXRMGECW
 I ARY="CTD" D DATECNT^PXRMGECW
 I ARY="CTP" D PATIENT^PXRMGECW
 I ARY="CTDR" D DOCCNT^PXRMGECW
 I ARY="CTL" D LOCCNT^PXRMGECW
 I ARY="LOC" D LOCCNT^PXRMGECW
 I ARY="DFN" D DOCCNT^PXRMGECW
 Q
KILL ;Kill out unwanted Arrays
 K ^TMP("PXRMGEC",$J,"REF"),^TMP("PXRMGEC",$J,"REFDFN")
 Q
VDOC(DA,VDOC,LOCB) ;Get Dr's and location according to Visit
 Q:ARY="CTD"
 Q:ARY="CTP"
 ;
 S VDOC("UNKNOWN",DA)=""
 Q:DA=""
 Q:'$D(^AUPNVHF(DA))
 S VDOC("UNKNOWN")=1
 S VST=$P($G(^AUPNVHF(DA,0)),"^",3)
 S DOC="" F  S DOC=$O(^AUPNVPRV("AD",VST,DOC)) Q:DOC=""  D
 .K VDOC("UNKNOWN")
 .S DOCT=$P($G(^AUPNVPRV(DOC,0)),"^",1)
 .S DOCTN=$$GET1^DIQ(200,DOCT,.01)
 .S ^TMP("PXRMGEC",$J,"REFDOC",DOCTN,VDT,DOCT)=""
 .I $D(VDOC(DOCTN,VDT)) S VDOC(DOCTN,VDT)=$G(VDOC(DOCTN,VDT))+1
 .E  S VDOC(DOCTN,VDT)=1
 .;DBIA #10040 However the ability for the Visit to store a pointer
 .;to the location file might be removed in the future.
 .S LOC=$P($G(^AUPNVSIT(VST,0)),"^",22)
 .S LOCN=$P($G(^SC(LOC,0)),"^",1)
 .S ^TMP("PXRMGEC",$J,"REFLOC",LOCN,VDT)=""
 .I DONE=1 D
 ..K TMPDT(DATEY,DFNXX,DOCTN,LOCN)
 ..K TMPDFN(DFNXX,DATEY,DOCTN,LOCN)
 ..K TMPDOC(DOCTN,LOCN,DATEY,DFNXX)
 ..K TMPLOC(LOCN,DOCTN,DATEY,DFNXX)
 ..K ^TMP("PXRMGEC",$J,"TMPDT",DATEY,DFNXX,DOCTN,LOCN)
 ..K ^TMP("PXRMGEC",$J,"TMPDFN",DFNXX,DATEY,DOCTN,LOCN)
 ..K ^TMP("PXRMGEC",$J,"TMPDOC",DOCTN,LOCN,DATEY,DFNXX)
 ..K ^TMP("PXRMGEC",$J,"TMPLOC",LOCN,DOCTN,DATEY,DFNXX)
 .;===============================================================
 .;CHeck for new Referral
 .I DATE1'=DATE!(DFN1'=DFN) S CNTREF=CNTREF+1,DATE1=DATE,DFN1=DFN
 .;===============================================================
 .I ARY="HS" D
 ..;CNTREF=Count or numbered Referral
 ..;DFN   =Patient IEN
 ..;DATE  =Starting Date of Referral
 ..;VDT   =Finished Date of Referral-Visit of GECF
 ..;CAT   =Health Factor Category
 ..;DATEV =Date that each Dialog was done
 ..;DA    =Ien of each Health Factor
 ..;
 ..N NAMEDA,NAME,CATDA,CAT,DATEV,DATEDA
 ..S NAMEDA=$P($G(^AUPNVHF(DA,0)),"^",1)
 ..;GET COMMENTS
 ..S NAME=$P($G(^AUTTHF(NAMEDA,0)),"^",1)
 ..S DATEDA=$P($G(^AUPNVHF(DA,0)),"^",3)
 ..S DATEV=$P($G(^AUPNVSIT(DATEDA,0)),"^",1)
 ..S CATDA=$P($G(^AUTTHF(NAMEDA,0)),"^",3)
 ..S CAT=$P($G(^AUTTHF(CATDA,0)),"^",1)
 ..S ^TMP("PXRMGEC",$J,"HS",CNTREF,DFN,DATE,VDT,CAT,DATEV,DA)=""
 .;===============================================================
 .I ARY="HS1" D
 ..;CNTREF=Count or numbered Referral
 ..;DFN   =Patient IEN
 ..;DATE  =Starting Date of Referral
 ..;VDT   =Finished Date of Referral-Visit of GECF
 ..;CAT   =Health Factor Category
 ..;DATEV =Date that each Dialog was done
 ..;DA    =Ien of each Health Factor
 ..;DFNXX =Patient's Name
 ..;
 ..N NAMEDA,NAME,CATDA,CAT,DATEV,DATEDA
 ..S NAMEDA=$P($G(^AUPNVHF(DA,0)),"^",1)
 ..S NAME=$P($G(^AUTTHF(NAMEDA,0)),"^",1)
 ..S DATEDA=$P($G(^AUPNVHF(DA,0)),"^",3)
 ..S DATEV=$P($G(^AUPNVSIT(DATEDA,0)),"^",1)
 ..S CATDA=$P($G(^AUTTHF(NAMEDA,0)),"^",3)
 ..S CAT=$P($G(^AUTTHF(CATDA,0)),"^",1)
 ..S ^TMP("PXRMGEC",$J,"HS1",DFNXX,CNTREF,DATE,VDT,CAT,DATEV,DA)=""
 ..;=============================================================
 .I ARY="HFCD" D
 ..S NAMEDA=$P($G(^AUPNVHF(DA,0)),"^",1)
 ..;GET COMMENTS
 ..S NAME=$P($G(^AUTTHF(NAMEDA,0)),"^",1)
 ..S DATEDA=$P($G(^AUPNVHF(DA,0)),"^",3)
 ..S DATEV=$P($G(^AUPNVSIT(DATEDA,0)),"^",1)
 ..S CATDA=$P($G(^AUTTHF(NAMEDA,0)),"^",3)
 ..Q:'$D(CATIEN(CATDA))
 ..S CAT=$P($G(^AUTTHF(CATDA,0)),"^",1)
 ..S ^TMP("PXRMGEC",$J,"HFCD",CAT,DFN,NAME,DATEV,DA)=""
 .I ARY="DT" D
 ..S ^TMP("PXRMGEC",$J,"TMPDT",DATEY,DFNXX,DOCTN,LOCN,DONE,VDT)=""
 ..S ^TMP("PXRMGEC",$J,"TMPDT","IEN",DATEY,DFNXX,DOCTN,LOCN,DA)=""
 .I ARY="DFN" D
 ..N DSRC,IDENT,DIADA,DIANAME,DATEDA,DATEV
 ..S DSRC=$P($G(^AUPNVHF(DA,812)),"^",3) ;Pointer to data source file
 ..S IDENT=$P($G(^PX(839.7,DSRC,0)),"^",1) ;IDENTIFY Name (GEC1)
 ..S DATEDA=$P($G(^AUPNVHF(DA,0)),"^",3)
 ..S DATEV=$P($G(^AUPNVSIT(DATEDA,0)),"^",1)
 ..S DIADA=$O(^PXRMD(801.41,"AC",IDENT,0)) ;Dialog ien
 ..S ^TMP("PXRMGEC",$J,"DFN",DOCT,DFN,DIADA,DATEV)=""
 .I ARY="DOC" D
 ..S ^TMP("PXRMGEC",$J,"TMPDOC",DOCTN,LOCN,DATEY,DFNXX,DONE,VDT)=""
 ..S ^TMP("PXRMGEC",$J,"TMPDOC","IEN",DOCTN,LOCN,DATEY,DFNXX,DA)=""
 .I ARY="LOC" D
 ..S ^TMP("PXRMGEC",$J,"TMPLOC",LOCN,DFNXX,VDT)=""
 ..S ^TMP("PXRMGEC",$J,"LOCB",LOCN,VDT)=""
 ;
 S DOCT=$P($G(^AUPNVHF(DA,12)),"^",4)
 I DOCT>0 D
 .Q:ARY="LOC"
 .Q:ARY="DR"
 .Q:ARY="HS1"
 .Q:ARY="HS"
 .Q:ARY="HFCD"
 .S DOCTN=$$GET1^DIQ(200,DOCT,.01)
 .I $D(VDOC(DA,DOCTN,DA)) S VDOC(DA,DOCTN,DA)=$G(VDOC(DA,DOCTN,DA))+1
 .E  S VDOC(DA,DOCTN,DA)=1
 .I DONE=1 D
 ..K TMPDT(DATEY,DFNXX,DOCTN,LOCN)
 ..K TMPDFN(DFNXX,DATEY,DOCTN,LOCN)
 ..K TMPDOC(DOCTN,LOCN,DATEY,DFNXX)
 ..K TMPLOC(LOCN,DOCTN,DATEY,DFNXX)
 ..K ^TMP("PXRMGEC",$J,"TMPDT",DATEY,DFNXX,DOCTN,LOCN)
 ..K ^TMP("PXRMGEC",$J,"TMPDFN",DFNXX,DATEY,DOCTN,LOCN)
 ..K ^TMP("PXRMGEC",$J,"TMPDOC",DOCTN,LOCN,DATEY,DFNXX)
 ..K ^TMP("PXRMGEC",$J,"TMPLOC",LOCN,DOCTN,DATEY,DFNXX)
 .;==========================
 .;CHeck for new Referral
 .I DATE1'=DATE!(DFN1'=DFN) S CNTREF=CNTREF+1,DATE1=DATE,DFN1=DFN
 .;==========================
 .I ARY="DT" D
 ..S ^TMP("PXRMGEC",$J,"TMPDT",DATEY,DFNXX,DOCTN,LOCN,DONE,VDT)=""
 ..S ^TMP("PXRMGEC",$J,"TMPDT","IEN",DATEY,DFNXX,DOCTN,LOCN,DA)=""
 .I ARY="DFN" D
 ..N DSRC,IDENT,DIADA,DIANAME
 ..S DSRC=$P($G(^AUPNVHF(DA,812)),"^",3) ;POINTER TO DATA SOURCE FILE
 ..S IDENT=$P($G(^PX(839.7,DSRC,0)),"^",1) ; IDENTIFY NAME
 ..S DIADA=$O(^PXRMD(801.41,"AC",IDENT,0)) ;DIALOG IEN
 ..S ^TMP("PXRMGEC",$J,"DFN",DOCT,DFN,DIADA,VDT)=""
 .I ARY="DOC" D
 ..S ^TMP("PXRMGEC",$J,"TMPDOC",DOCTN,LOCN,DATEY,DFNXX,DONE,VDT)=""
 ..S ^TMP("PXRMGEC",$J,"TMPDOC","IEN",DOCTN,LOCN,DATEY,DFNXX,DA)=""
 .I ARY="LOC" D
 ..S ^TMP("PXRMGEC",$J,"TMPLOC",LOCN,DFNXX,VDT)=""
 ..I $D(^TMP("PXRMGEC",$J,"LOCB",LOCN)) S ^TMP("PXRMGEC",$J,"LOCB",LOCN)=$G(^TMP("PXRMGEC",$J,"LOCB",LOCN))+1
 ..E  S ^TMP("PXRMGEC",$J,"LOCB",LOCN)=1
 Q
 ;
