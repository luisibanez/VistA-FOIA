ECXLBB ;DALOI/KML - DSS BLOOD BANK EXTRACT ; 12/12/05 11:50am
 ;;3.0;DSS EXTRACTS;**78,84,90**;Dec 22, 1997
 ;Per VHA Directive 97-033 this routine should not be modified.  Medical Device # BK970021
 ; access to the LAB DATA file (#63) is supported by 
 ; controlled subscription to IA 525  (global root ^LR)  
BEG ;entry point from option
 D SETUP I ECFILE="" Q
 D ^ECXTRAC,^ECXKILL
 Q
 ;
START ; Entry point from tasked job
 ; begin package specific extract
 N ECTRSP,ECADMT,ECTODT,ECENCTR,ECPAT,ECLRDFN,ECXPHY,ECXPHYPC
 N ECD,ECXDFN,ECARRY,EC66,ECERR,ECTRFDT,ECTRFTM,ECX,ECINOUT,ECXINST
 ;variables ECFILE,EC23,ECXYM,ECINST,ECSD,ECSD1,ECED passed in 
 ; by taskmanager 
 ; ECED defined in ^ECXTRAC - it represents the end date of the extract
 ; sort process.  TRANSFUSION DATE should be within start and end dates
 ; ECED and ECSD were assigned with input provided by the user interface
 ; and ECSD1 = ECSD-.1
 ; Read through the TRANSFUSION RECORD sub-file (63.017) of 
 ; the LAB DATA file (#63)
 ;the global nodes containing transfusion record entries are constructed
 ; by calculating the TRANSFUSION DATE/TIME (.01)
 ; into its reverse date/time representation and then DINUM'd when 
 ;filing the record entry 
 ; ECD equals the reverse date/time of ECED+.3 and will need to be
 ; reset for each DFN.
 I $D(ZTQUEUED),$$S^%ZTLOAD S QFLG=1 Q  ;quit if tasked and user sends stop request  (QFLG assigned in ECXTRAC)
AUDRPT ; entry point for pre-extract audit report
 S ECTODT=9999999-ECSD1,ECLRDFN=0
 F  S ECLRDFN=$O(^LR(ECLRDFN)) Q:'ECLRDFN  S ECXDFN=$$GETDFN(ECLRDFN),ECERR=$$PAT(ECXDFN) S ECD=9999999-(ECED+.3) F  S ECD=$O(^LR(ECLRDFN,1.6,ECD)) Q:ECERR  Q:'ECD!(ECD>ECTODT)  S EC0=^LR(ECLRDFN,1.6,ECD,0) D
 .; ECARRY(1)=TRANSFUSION DATE AND TIME, 
 .; ECARRY(3)=COMPONENT, ECARRY(4)=COMPONENT ABBREVIATION
 .; ECARRY(5)=UNITS POOLED, ECARRY(6)=TRANSFUSION REACTION, 
 .; ECARRY(7)=VOLUME TRANSFUSED, ECARRY(8)=TRANSFUSION REACTION TYPE
 . S ECARRY(1)=$P(EC0,"^"),EC66=$P($G(^LAB(66,$P(EC0,"^",2),0)),"^",1,2)
 . S ECARRY(3)=$E($P(EC66,"^"),1,15),ECARRY(4)=$P(EC66,"^",2)
 . S ECARRY(5)=$S(+$P(EC0,"^",7)=0:1,1:+$P(EC0,"^",7))
 . S ECARRY(6)=$S($P(EC0,"^",8)=1:"Y",1:"N"),ECARRY(7)=$P(EC0,"^",10)
 . S ECARRY(8)=$P($G(^LAB(65.4,+$P(EC0,"^",11),0)),"^",2)
 . S (ECXPHY,ECXPHYPC)=""
 . D GETDATA
 . K ECARRY
 Q
 ;
GETDATA ; gather rest of extract data that will be recorded in an 
 ; entry in file 727.829
 S ECTRFDT=$$ECXDOB^ECXUTL(ECARRY(1)),ECTRFTM=$$ECXTIME^ECXUTL(ECARRY(1))
 S ECX=$$INP^ECXUTL2(ECXDFN,ECARRY(1)),ECINOUT=$P(ECX,U),ECTRSP=$P(ECX,U,3),ECADMT=$P(ECX,U,4) ; [FLD #5]
 ;
 ;- Observation patient indicator (YES/NO)
 S ECXOBS=$$OBSPAT^ECXUTL4(ECINOUT,ECTRSP)
 ;- If no encounter number don't file record
 S ECENCTR=$$ENCNUM^ECXUTL4(ECINOUT,ECPAT("SSN"),ECADMT,ECARRY(1),ECTRSP,ECXOBS,ECHEAD,,) ; [FLD #6]
 Q:ECENCTR=""
 ;
 S ECXSTR=$G(EC23)_"^"_ECINST_"^"_ECXDFN_"^"_ECPAT("SSN")_"^"_ECPAT("NAME")_"^"_ECINOUT_"^"_ECENCTR_"^"_ECTRFDT_"^"_ECTRFTM_"^"_ECARRY(3)_"^"_ECARRY(4)_"^"_ECARRY(5)_"^"_ECARRY(7)_"^"_ECARRY(6)_"^"_ECARRY(8)_"^BB"_ECINST_"^^"
 I $G(ECXLOGIC)>2005 S ECXSTR=ECXSTR_U_ECXPHY_U_ECXPHYPC
 I '$D(ECXRPT) D FILE(ECXSTR) Q
 S ^TMP("ECXLBB",$J,ECXDFN,ECD)=ECXSTR  ;temporary global array
 ;   used in ECXPLBB (pre-extract audit report)
 Q
 ;
GETDFN(ECXLRDFN) ;
 ; INPUT - LRDFN
 ; OUTPUT - DFN
 ; Obtains DFN (Patient ID) from LRDFN (Lab Patient ID).
 ; If no valid DFN exists, 0 is returned.
 S ECXLRDFN=+$G(ECXLRDFN)
 I $P($G(^LR(ECXLRDFN,0)),"^",2)'=2 Q 0
 Q +$P(^LR(ECXLRDFN,0),"^",3)
 ; 
PAT(ECXDFN) ;get/set patient data
 ; INPUT - ECXDFN = patient ien (DFN)
 ; OUTPUT - ECPAT array:
 ;          ECPAT("SSN")
 ;          ECPAT("NAME")
 ; returns 0 or 1 in ECXERR - 0=successful
 ;                            1=error condition
 N X,OK,ECXERR
 ;get data
 S ECXERR=0
 K ECXPAT S OK=$$PAT^ECXUTL3(ECXDFN,"",1,.ECPAT)
 I 'OK S ECXERR=1
 Q ECXERR
 ;
FILE(ECODE) ;
 ; Input - ECODE = extract record
 ;
 ; record the extract record at a global node in file 727.829
 ; sequence #^year/month of extract^extract #^facility^patient dfn^SSN^
 ; name^i/o pt indicator^encounter #^date of transfusion^time of 
 ; transfusion^component^component abbrev^# of units^volume in mm^
 ; reaction^reaction type^feeder location^DSS product dept^DSS IP #
 ; ordering physician^ordering physician pc
 ;note:  DSS product dept and DSS IP # are dependent on the release of
 ; ECX*3*61
 N DA,DIK,EC7
 S EC7=$O(^ECX(ECFILE,999999999),-1),EC7=EC7+1
 S ECODE=EC7_"^"_ECODE
 S ^ECX(ECFILE,EC7,0)=ECODE,ECRN=ECRN+1
 S DA=EC7,DIK="^ECX("_ECFILE_"," D IX1^DIK K DIK,DA
 Q
 ;
 ;
SETUP ;Set required input for ECXTRAC.
 S ECHEAD="LBB"
 D ECXDEF^ECXUTL2(ECHEAD,.ECPACK,.ECGRP,.ECFILE,.ECRTN,.ECPIECE,.ECVER)
 Q
 ;
LOCAL ; to extract nightly for local use not to be transmitted to TSI
 ; should be queued with a 1D frequency
 D SETUP,^ECXTLOCL,^ECXKILL Q
 ;
QUE ; entry point for the background requeuing handled by ECXTAUTO
 D SETUP,QUE^ECXTAUTO,^ECXKILL
 Q
 ;
 ;ECXLBB
