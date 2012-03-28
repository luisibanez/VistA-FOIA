BLRLINK1 ;IHS/DIR/MJL - CONT. OF IHS LAB LINK TO PCC ; [ 12/13/2002  10:38 AM ]
 ;;5.2;LR;**1008,1009,1015,1018,1021,1027**;NOV 01, 1997
 ;;5.2;LR;**1008,1009,1015**;NOV 18, 2002
 ;
 ; parsing of data elements from disk into local arrays and variables
 ; validation of lab data to determine if appropriate to send to PCC
 ;
 ; BLRVAL = array containing elements of ^BLRTXLOG (file # 9009022)
 ;
EP ; EP
 D:$G(SNAPSHOT) ENTRYAUD^BLRUTIL("EP^BLRLINK1 0.0")
 ;
 S BLRVAL(0)=$G(^BLRTXLOG(BLRLOGDA,0))
 S BLRVAL(1)=$G(^BLRTXLOG(BLRLOGDA,1))
 S BLRVAL(2)=$G(^BLRTXLOG(BLRLOGDA,2))
 S BLRVAL(3)=$G(^BLRTXLOG(BLRLOGDA,3))   ;IHS/ITSC/TPF 10/25/02 'SIGN OR SYMPTOM' LAB POV **1015**
 ;
 ; ----- BEGIN IHS/OIT/MKK - LR*5.2*1027
 D:$G(SNAPSHOT) ENTRYAUD^BLRUTIL("^BLRLINK1 1.0","BLRVAL")
 NEW IHSLABPOV
 ; Reset BLRVAL(3) if Sign or Symptom entry in BLRTXLOG contains an "^"
 I $G(^BLRTXLOG(BLRLOGDA,3))["^" D
 . S IHSLABPOV=$P($G(^BLRTXLOG(BLRLOGDA,3)),"^",2)
 . S:$G(IHSLABPOV)="" IHSLABPOV=$P($G(^BLRTXLOG(BLRLOGDA,3)),"^")
 . S BLRVAL(3)=$G(IHSLABPOV)
 ;----- END IHS/OIT/MKK - LR*5.2*1027
 ;
 S BLRVAL(11)=$G(^BLRTXLOG(BLRLOGDA,11))
 S BLRVAL(12)=$G(^BLRTXLOG(BLRLOGDA,12))
 S BLRVAL(13)=$G(^BLRTXLOG(BLRLOGDA,13))
 S BLRVAL(20)=$G(^BLRTXLOG(BLRLOGDA,20))
 S BLRVAL(30)=$G(^BLRTXLOG(BLRLOGDA,30,0))  ;COMMENTS
 ;
 DO CHKINHL7  ; IHS/OIT/MKK - LR*5.2*1027
 ;
 F T=1:1 S TEXTSTR=$T(PARSE+T) S BLRSTR=$P(TEXTSTR,";",3) Q:BLRSTR=""  S NAME=$P(BLRSTR,"|"),INDX=$P(BLRSTR,"|",2),FLD=$P(BLRSTR,"|",3),@NAME=$P(BLRVAL(INDX),U,FLD)
 ; S APCDALVR("APCDTLPV")=BLRLPOV  ;IHS/ITSC/TPF 9/24/02 LAB POV **1014**
 ;
 ; ----- BEGIN IHS/OIT/MKK - LR*5.2*1027
 NEW IHSLABPOV
 I $G(BLRLPOV)["^" S IHSLABPOV=$P(BLRLPOV,"^",2)
 S:$G(IHSLABPOV)="" IHSLABPOV=$P(BLRLPOV,"^")
 S APCDALVR("APCDTLPV")=IHSLABPOV ; IHS/OIT/MKK LR*5.2*1027
 ; ----- END IHS/OIT/MKK - LR*5.2*1027
 ; 
 I BLRPCC'="" S BLRPCC="" D SETNUL^BLRLINK S BLRPCC="" ; reset error flag field in IHS transaction log file
 I BLRSS="" S BLRBUL=2,BLRPCC="Test Subscript not defined",BLRERR=1 W:'BLRQUIET !,BLRPCC,! Q
 ;
 I BLR("SITE")="" S BLRBUL=2,BLRPCC="NO Institution entry",BLRERR=1 W:'BLRQUIET !,"There is no Institution entry in File #44 for this location",!,25,"V file not created" Q
 S:BLRORDL'="" BLRORDL1=$P($G(^SC(BLRORDL,0)),U,4)  ;IHS/DIR TUC/AAB 04/08/98
 S BLRORDL1=$G(BLRORDL1) I +BLRORDL1,BLR("SITE")'=BLRORDL1,BLRVIEN="" D SETTSITE ;IHS/DIR/MJL 09/20/99
 I BLRFILE'=2 D  Q   ;if not a patient in file #2 then processing is not to occur
 .S BLRBUL=$S($P($G(^BLRSITE(BLR("SITE"),0)),U,4):0,1:2)
 .S BLRPCC="Record is from file "_BLRFILE_" - is not Patient File",BLRERR=1
 .W:'BLRQUIET !,BLRPCC,!
 I BLRVADFN="" S BLRBUL=2,BLRPCC="Patient IEN is required",BLRERR=1 W:'BLRQUIET !,BLRPCC,! Q
 ;----- BEGIN IHS/OIT/MKK MODIFICATIONS LR*5.2*1021
 I $D(^DPT(BLRVADFN))<10 D  Q     ; Make certain data exists in patient file
 . S BLRBUL=2
 . S BLRPCC="No Data in Patient File for IEN "_BLRVADFN
 . S BLRERR=1
 . W:'BLRQUIET !,BLRPCC,!
 ;----- END IHS/OIT/MKK MODIFICATIONS LR*5.2*1021
 I BLRCDT="",BLRSTAT'="O" S BLRBUL=2,BLRPCC="No Collection date",BLRERR=1 W:'BLRQUIET !,BLRPCC,! Q
 ;
 I BLRCDT\1>DT S BLRBUL=0,BLRPCC="Future collection - No update of PCC",BLRERR=1 W:'BLRQUIET !,BLRPCC,! Q  ;IHS/DIR/MJL 09/20/99
 ;
 S BLRNMSPC=$O(^DIC(9.4,"C","LR",""))
 I '$D(^APCCCTRL(BLR("SITE"),11,BLRNMSPC,0)) S BLRBUL=2,BLRPCC="No Lab entry in PCC Master Control file for "_$P($G(^DIC(4,BLR("SITE"),0)),U),BLRERR=1 W:'BLRQUIET !,BLRPCC,! Q
 S PCCVISIT=+BLRVIEN ; set up flag for visit creation
FAC ;
 D:$G(SNAPSHOT) ENTRYAUD^BLRUTIL("FAC^BLRLINK1 0.0")
 S:BLRSDI="" BLRSDI="L"
 ;
 S:BLRCLIN'="" BLRCLIN="`"_BLRCLIN
 S BLRCD=$P(BLRCDT,".")
 ;
 ;----- BEGIN IHS MODIFICATIONS LR*5.2*1018 IHS -- Use Collection Date, not Order Date
 ; S BLRPATCD=BLRVADFN_$P(BLRODT,".")  ;IHS/OIRM TUC/MJL 11/07/2000
 S BLRPATCD=BLRVADFN_$P(BLRCDT,".")
 ;----- END IHS MODIFICATIONS LR*5.2*1018 IHS -- Use Collection Date, not Order Date
 I BLRVAL(30)'="" D LCOM
 S SEX=$P($G(^DPT(BLRVADFN,0)),U,2),SEX=$S(SEX="":"",1:SEX),DOB=$P($G(^DPT(BLRVADFN,0)),U,3),AGE=$S($D(DT)&(DOB?7N):DT-DOB\10000,1:0)
 S APCDALVR("APCDPAT")=BLRVADFN
 S APCDALVR("APCDTYPE")=$S($P($G(^APCCCTRL(BLR("SITE"),0)),U,4)'="":$P($G(^(0)),U,4),1:"I")
 S APCDALVR("APCDDATE")=BLRCD
 S APCDALVR("APCDLOC")=BLR("SITE")
 S APCDALVR("APCDCLN")=BLRCLIN
 S APCDALVR("APCDTCLN")=BLRCLIN
 S APCDALVR("APCDCAT")=BLRVCAT
 D PROV Q:BLRERR
 D:BLRSS'="CH" ^BLRSPRSE
 D:$G(SNAPSHOT) ENTRYAUD^BLRUTIL("FAC^BLRLINK1 9.0","APCDALVR","BLR")
 Q
LCOM ; parse long comments
 D:$G(SNAPSHOT) ENTRYAUD^BLRUTIL("LCOM^BLRLINK1 0.0")
 ;S BLRNCOM=$P(BLRVAL(30),U,4)
 ;S:BLRNCOM>3 BLRNCOM=3
 ;F BLRLCTR=1:1:BLRNCOM S BLRCOM=$G(^BLRTXLOG(BLRIEN,30,BLRLCTR,0)) D
 ;. S BLRCOM(BLRLCTR)=$S($L(BLRCOM)>70:$E(BLRCOM,1,70),1:BLRCOM)
 ;FOLLOWING ADDED BY MARK WILLIAMS **1014**
 S BLRLCTR=0
 S BLRCMDA=0 F  S BLRCMDA=$O(^BLRTXLOG(BLRIEN,30,BLRCMDA)) Q:'BLRCMDA  D
 .S BLRLCTR=BLRLCTR+1
 .S BLRCOM=$G(^BLRTXLOG(BLRIEN,30,BLRCMDA,0))
 .S BLRCOM(BLRLCTR)=$E(BLRCOM,1,70)
 ;END MARK WILLIAMS ADDITION
 D:$G(SNAPSHOT) ENTRYAUD^BLRUTIL("LCOM^BLRLINK1 9.0","BLRCOM")
 Q
PROV ; check for provider location
 D:$G(SNAPSHOT) ENTRYAUD^BLRUTIL("PROV^BLRLINK1 0.0")
 I +BLROPRV<1 S BLRBUL=2,BLRPCC="No entry in Provider file for the Ordering Provider",BLRERR=1 W:'BLRQUIET !,BLRPCC,! Q  ;IHS/DIR TUC/AAB 3/11/98
 I BLROPRV'="",'BLR200CV S BLROPRV=$P($G(^VA(200,BLROPRV,0)),U,16) I BLROPRV="" S BLRBUL=2,BLRPCC="No entry in Provider file for the Ordering Provider",BLRERR=1 W:'BLRQUIET !,BLRPCC,! Q
 I BLREPRV'="",'BLR200CV S BLREPRV=$P($G(^VA(200,BLREPRV,0)),U,16) I BLREPRV="" S BLRBUL=2,BLRPCC="No entry in Provider file for the Encounter Provider",BLRERR=1 W:'BLRQUIET !,BLRPCC,! Q
 D:$G(SNAPSHOT) ENTRYAUD^BLRUTIL("PROV^BLRLINK1 9.0")
 Q
 ;
PARSE ;
 ;;BLRIEN|0|1;; seq. # (IEN of transaction log file)
 ;;BLRFILE|0|2;;
 ;;BLRDFN|0|3;; patient's ^LR ien
 ;;BLRVADFN|0|4;; patient pointer of IEN of patient file (file #2)
 ;;BLRPNAM|0|5;; patient name
 ;;BLRTLAB|0|6;; test/panel (ien)
 ;;BLRTNAM|0|7;; test/panel name
 ;;BLRSS|0|8;; lab module (CH,BB,MI,SP,AU,CY,OT)
 ;;BLR("SITE")|0|9;; clinic's institution ien [DUZ(2)]
 ;;BLRVCAT|0|10;; inpatient/outpatient category "I"= IP "A"= OP
 ;;BLRPAREN|1|1;; parent pointer to IEN of transaction log file
 ;;BLRSTAT|1|2;; order stat flag (O,R,M,D,A)
 ;;BLREPRV|1|13;; encounter provider pointer (IEN of new person file)
 ;;BLREPNM|1|14;; encounter provider name
 ;;BLRVFN|1|4;; associated V file
 ;;BLRVIEN|1|5;; ien of V file entry
 ;;BLRPCC|1|6;; error flag
 ;;BLRBILL|1|7;; billable item (1 = billable " " = nonbillable)
 ;;BLRCOST|1|8;; lab test cost
 ;;BLRCLIN|1|9;; clinic stop code
 ;;BLRCLNAM|1|10;; clinic stop name
 ;;BLRCPT|1|11;; CPT lab code pointer (IEN of file #9009021)
 ;;BLRSDI|1|15;; source of data input (non-lab or lab)
 ;;BLRCPTST|2|1;; billing CPT string
 ;;BLRODT|11|1;; order date
 ;;BLRORD|11|3;; order number
 ;;BLROPRV|11|4;; ordering provider pointer (IEN of new person file)
 ;;BLROPNM|11|5;; name of provider (used when provider pointer is null)
 ;;BLRORDL|11|6;; clinic (ordering location)
 ;;BLRCDT|12|1;; collected date/time
 ;;BLRACC|12|2;; accession number
 ;;BLRRES|20|1;; results
 ;;BLRABNL|20|2;; result N/A flag
 ;;BLRUNIT|20|3;; units
 ;;BLRSITE|20|4;; site/specimen (ien of file #61)
 ;;BLRSNAM|20|5;; site/specimen name
 ;;BLRRFL|20|8;; reference low
 ;;BLRRFH|20|9;; reference high
 ;;BLRCOLSA|13|7;; collection sample
 ;;BLRCOMDT|13|9;; complete date
 ;;BLRLOINC|13|10;; loinc code pointer
 ;;BLRLPOV|3|1;;  sign or symptom
 ;
 Q
 ;
CHECK ;CHECK MASTER CONTROL FILE
 D:$G(SNAPSHOT) ENTRYAUD^BLRUTIL("CHECK^BLRLINK1 0.0","BLR")
 I '$D(^APCCCTRL(BLR("SITE"),0)) W:'BLRQUIET !,"The ordering facility is not an entry in the PCC Master Control File.",!,?25,"Visit not created" S BLRERR=1 Q
 I '$D(^APCCCTRL(BLR("SITE"),11,BLRNMSPC,0)) W:'BLRQUIET !!,"Entry not made in the PCC Master Control File for Lab for this ordering location ",!,?25,"PCC Visit not created" S BLRERR=1 Q
 I '$P($G(^APCCCTRL(BLR("SITE"),11,BLRNMSPC,0)),U,2) S BLRERR=1 ;; Pass data to PCC not set
 D:$G(SNAPSHOT) ENTRYAUD^BLRUTIL("CHECK^BLRLINK1 9.0","BLR")
 Q
 ;
CKFRSTAT ;
 D:$G(SNAPSHOT) ENTRYAUD^BLRUTIL("CKFRSTAT^BLRLINK1 0.0")
 S BLRQ=0,BLRCKP=0 F  Q:BLRQ  S BLRCKP=$O(^BLRTXLOG("AAT",BLRACC,BLRCKP)) Q:'BLRCKP  S BLRCKTN=0 F  S BLRCKTN=$O(^BLRTXLOG("AAT",BLRACC,BLRCKP,BLRCKTN)) Q:'BLRCKTN!BLRQ  D
 .I $P($G(^BLRTXLOG(BLRCKTN,1)),U,5),BLRACC=$P($G(^BLRTXLOG(BLRCKTN,12)),U,2),BLRODT=$P($G(^BLRTXLOG(BLRCKTN,11)),U) S BLR("SITE")=$P($G(^BLRTXLOG(BLRCKTN,0)),U,9),BLRQ=1 Q
 I BLRQ,BLR("SITE")=BLRORDL1 L +^BLRTXLOG(BLRIEN):60 S DIE=9009022,DA=BLRIEN,DR=".09////"_BLR("SITE") D ^DIE L -^BLRTXLOG(BLRIEN)
 D:$G(SNAPSHOT) ENTRYAUD^BLRUTIL("CKFRSTAT^BLRLINK1 9.0","BLR")
 K BLRCKTN,BLRCKP,BLRQ
 Q
 ;
SETTSITE ;
 D:$G(SNAPSHOT) ENTRYAUD^BLRUTIL("SETTSITE^BLRLINK1 0.0","BLR")
 S BLR("SITE")=BLRORDL1
 L +^BLRTXLOG(BLRIEN):60 S DIE=9009022,DA=BLRIEN,DR=".09////"_BLR("SITE") D ^DIE L -^BLRTXLOG(BLRIEN)
 Q
 ;
 ; ----- BEGIN IHS/OIT/MKK - LR*5.2*1027
 ;       Need to get Reference Ranges & Units from Incoming HL7 message
 ;       IF and ONLY IF the transaction is tied to an incoming message.
CHKINHL7 ; EP
 D:$G(SNAPSHOT) ENTRYAUD^BLRUTIL("CHKINHL7^BLRLINK1 0.0","BLRVAL")
 NEW DNIEN,DNDESC,F60IEN,HL7TEST,LRAA,LRAD,LRAN,LRAS,STR,UID
 NEW ABNFLAG,REFHIGH,REFLOW,UNITS
 ;
 Q:+$G(BLRLOGDA)<1
 ;
 S F60IEN=+$P($G(^BLRTXLOG(BLRLOGDA,0)),"^",6)     ; File 60 IEN
 ;
 S LRAS=$P($G(^BLRTXLOG(BLRLOGDA,12)),"^",2)       ; Accession number
 D GETACCCP^BLRUTIL3(LRAS,.LRAA,.LRAD,.LRAN)       ; Get Accession's component parts
 Q:LRAA<1!(LRAD<1)!(LRAN<1)
 ;
 S UID=+$P($G(^LRO(68,LRAA,1,LRAD,1,LRAN,.3)),"^")
 Q:UID<1
 ;
 Q:$$GETINTHU(UID)<1
 ;
 D:$G(SNAPSHOT) ENTRYAUD^BLRUTIL("CHKINHL7^BLRLINK1 4.5")
 ;
 S STR=$G(^TMP("BLR",$J,UID,F60IEN))
 Q:$L(STR)<1
 ;
 S ABNFLAG=$P(STR,"^",2)
 S REFLOW=$P(STR,"^",3)
 S REFHIGH=$P(STR,"^",4)
 S UNITS=$P(STR,"^",5)
 ;
 I $L(ABNFLAG) D
 . S $P(BLRVAL(20),"^",2)=$G(ABNFLAG)
 . S $P(^BLRTXLOG(BLRLOGDA,20),"^",2)=$G(ABNFLAG)
 I $L(UNITS) D
 . S $P(BLRVAL(20),"^",3)=$G(UNITS)
 . S $P(^BLRTXLOG(BLRLOGDA,20),"^",3)=$G(UNITS)
 I $L(REFLOW) D
 . S $P(BLRVAL(20),"^",8)=$G(REFLOW)
 . S $P(^BLRTXLOG(BLRLOGDA,20),"^",8)=$G(REFLOW)
 I $L(REFHIGH) D
 . S $P(BLRVAL(20),"^",9)=REFHIGH
 . S $P(^BLRTXLOG(BLRLOGDA,20),"^",9)=$G(REFHIGH)
 ;
 S:$G(SNAPSHOT) ^TMP("BLRLINK1",$J,UID,F60IEN,"BLRVAL(20)")=$G(BLRVAL(20))
 D:$G(SNAPSHOT) ENTRYAUD^BLRUTIL("CHKINHL7^BLRLINK1 9.0","BLRVAL")
 Q
 ;
GETINTHU(UID) ; EP -- Get Reference Range information from File 4001 (UNIVERSAL INTERFACE)
 D:$G(SNAPSHOT) ENTRYAUD^BLRUTIL("GETINTHU^BLRLINK1 0.0")
 NEW AUTIF60P,AUTOINSN,AUTOINSP,AUTOITST,FOUNDIT,MSGID,MSGNUM,MSGUID,MSGSEG,MSGSTR
 NEW MSGRESLT,MSGUNITS,MSGRLOW,MSGRHI,MSGABN,NOTMSG
 NEW LA7INST,AUTOINSP,WOTPIECE
 ;
 ; Quit if test already stored in ^TMP global
 Q:$D(^TMP("BLR",$J,UID,F60IEN))>0 1
 ;
 ; Retrieve "Instrument Name" for Reference Lab
 S LA7INST=$$GET1^DIQ(9009029,DUZ(2),3001)
 Q:$G(LA7INST)="" 0       ; Quit with zero if no Reference Lab
 ;
 ; Determine what piece is the observation sub-id: QUEST uses OBX3.4; all others use OBX3.1
 S WOTPIECE=$S($$UP^XLFSTR(LA7INST)["QUEST":4,1:1)
 ;
 S AUTOINSP=+$O(^LAB(62.4,"B",LA7INST,""))         ; Auto Instrument IEN
 Q:AUTOINSP<1 0           ; Quit with zero if No Auto Instrument
 ;
 ; Reverse Order -- "newest" to "oldest"
 S FOUNDIT=0,MSGID=""
 F  S MSGID=$O(^INTHU("D",MSGID),-1)  Q:$G(MSGID)=""!(FOUNDIT)  D
 . S (MSGNUM,MSGUID)=0
 . F  S MSGNUM=$O(^INTHU("D",MSGID,MSGNUM))  Q:MSGNUM<1!(FOUNDIT)  D
 .. S (MSGSEG,NOTMSG)=0
 .. F  S MSGSEG=$O(^INTHU(MSGNUM,3,MSGSEG))  Q:MSGSEG<1!(FOUNDIT)  D
 ... I $P($G(^INTHU(MSGNUM,3,MSGSEG,0)),"|")="OBR" D
 .... ; Determine if UID = UID of Message
 .... S:UID=+$P($G(^INTHU(MSGNUM,3,MSGSEG,0)),"|",3) FOUNDIT=MSGNUM
 ... Q:'FOUNDIT
 ... ;
 ... ; Find OBX segment
 ... S CNT=0
 ... F  S MSGSEG=$O(^INTHU(MSGNUM,3,MSGSEG))  Q:MSGSEG<1  D
 .... S MSGSTR=$G(^INTHU(MSGNUM,3,MSGSEG,0))
 .... Q:$P(MSGSTR,"|")'="OBX"
 .... ;
 .... S CNT=CNT+1
 .... S MSGTEST=$P($P(MSGSTR,"|",4),"^",WOTPIECE)  ; OBX 3
 .... Q:$L(MSGTEST)<1                              ; If not defined, Quit
 .... ;
 .... Q:$D(^LAB(62.4,AUTOINSP,3,"AC",MSGTEST))<1   ; Skip if not in Auto Instrument file
 .... ;
 .... ; File 60 IEN from Auto Instrument file
 .... S AUTIF60P=$P($G(^LAB(62.4,AUTOINSP,3,$O(^LAB(62.4,AUTOINSP,3,"AC",MSGTEST,0)),0)),"^")
 .... ;
 .... S MSGRESLT=$P(MSGSTR,"|",6)                  ; Results
 .... S MSGUNITS=$P(MSGSTR,"|",7)                  ; Units
 .... S MSGRLOW=$P($P(MSGSTR,"|",8),"-")           ; Reference Low
 .... S MSGRHI=$P($P(MSGSTR,"|",8),"-",2)          ; Reference High
 .... S MSGABN=$P(MSGSTR,"|",9)                    ; Status Flag
 .... S MSGABN=$S(MSGABN="L":MSGABN,MSGABN="H":MSGABN,1:"")
 .... S ^TMP("BLR",$J,UID,AUTIF60P)=MSGRESLT_"^"_MSGABN_"^"_MSGRLOW_"^"_MSGRHI_"^"_MSGUNITS
 .... S FOUNDIT=1
 ;
 D:$G(SNAPSHOT) ENTRYAUD^BLRUTIL("GETINTHU^BLRLINK1 9.0")
 Q FOUNDIT
 ; ----- END IHS/OIT/MKK - LR*5.2*1027
