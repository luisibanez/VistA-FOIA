AMERERS ; IHS/OIT/SCR - ROUTINES TO SUPPORT MERGE OF PCC DATA TO ERS DATA ;
 ;;3.0;ER VISIT SYSTEM;**1,2**;FEB 23, 2009
SYNCHERA(AMERDA,AMERPCC)   ;
 ;IHS/OIT/SCR 12/31/08 
 ;This routine is called when it is determined that PCC admission data needs to replace shared ERS Visit
 ;file admission information
  ; Compare ER "Presenting Complaint" to VISIT "Chief Complaint"
 ;N AMERVVAL,AMEREVAL,AMERDUZ,AMERSTRG,AMEREDTS
 N AMERVVAL,AMEREVAL,AMERDUZ,AMERSTRG,AMEREDTS,AMERDR  ;IHS/OIT/SCR 071509
 ;S AMERDUZ=DUZ
 S AMEREVAL=$G(^AMERVSIT(AMERDA,1))
 S AMERVVAL=$G(^AUPNVSIT(AMERPCC,14))
 S AMERVVAL=$TR(AMERVVAL,";","~")  ;IHS/OIT/SCR 05/07/09 patch 1 - don't try to save ";"
 ;S AMERAIEN=$$CREATAUD^AMEREDAU(AMERDA,AMERDUZ) Q:AMERAIEN<0  ;CREATE AN AUDIT FILE RECORD
 I (AMEREVAL'=AMERVVAL) D
 .Q:AMERVVAL=""
 .;KEEP THE PCC VISIT INFO - PUT IT INTO THE AMER VISIT
 .S AMERDR="1////"_AMERVVAL
 .D DIE^AMEREDIT(AMERDA,AMERDR)
 .;D NOW^%DTC
 .;S AMERSTRG="1;"_X_";"_AMEREVAL_";"_AMERVVAL_";Other;CHIEF COMPLAINT;Silent PCC SYNCH"
 .;S AMEREDTS=AMERSTRG
 .;D:AMEREDTS'="" MULTAUDT^AMEREDAU(AMEREDTS,AMERAIEN)
 .Q
 ; GET THE DEPARTURE OUT TIME FROM VISIT AND COMPARE TO CHECK OUT TIME IN ER VISIT
 S AMEREVAL=$P($G(^AMERVSIT(AMERDA,6)),U,2)  ; AMERDEPT IS DEPARTURE TIME
 ;S AMERVVAL=$$CODT^APCLV(AMERPCC,"I")
 S AMERVVAL=$P(^AUPNVSIT(AMERPCC,0),"^",18)  ;CHECKOUT TIME
 I (AMEREVAL'=AMERVVAL) D
 .Q:AMERVVAL=""
 .;KEEP THE PCC VISIT INFO - PUT IT INTO THE AMER VISIT
 .S AMERDR="6.2////"_AMERVVAL
 .D DIE^AMEREDIT(AMERDA,AMERDR)
 .;D NOW^%DTC
 .;S AMERSTRG="1;"_X_";"_$$EDDISPL^AMEREDAU(AMEREVAL,"D")_";"_$$EDDISPL^AMEREDAU(AMERVVAL,"D")_";Other;CHECK OUT TIME;Silent PCC SYNCH"
 .;S AMEREDTS=AMERSTRG
 .;D:AMEREDTS'="" MULTAUDT^AMEREDAU(AMEREDTS,AMERAIEN)
 .Q
 Q
SYNCHERX(AMERDA,AMERPCC)  ;EP from AMEREDIT and AMERPCC2
 ;IHS/OIT/SCR 12/29/08
 ;This routine is called when it is determined that PCC DX need to replace the ER VISIT file DXs.
 ;0. REMOVE ALL DX FROM ERS SO DX GO BACK IN SAME INDEX AS PCC ARRA
 ;1. GET ALL DX FROM PCC
 ;2. REPLACE THE PRIMARY DX INFO WITH THE FIRST DX
 ;3. REPLACE EACH DX NODE IN ERS WITH THAT PCC DX NODE
 N AMERDXS,AMERINDX,AMERVERR,AMERDR,AMERONAR,AMERODX,AMEROLD,AMERNEW,AMERPDX,AMERNNAR,AMERSTRG,AMERAIEN,AMERDUZ
 N AMEREDNM,AMEREDTS,AMERDIE,AMERERR,DA,DIC,X,Y,DIK,AMEROFST
 S AMEREDTS=""
 ;S AMEROFST=0
 S AMERERR=0
 ;S AMEREDNM=1
 ;S AMERDUZ=DUZ ;WHO EVER IS USING THIS APPLICATION WHEN THIS ROUTINE IS CALLED
 ;S AMERAIEN=$$CREATAUD^AMEREDAU(AMERDA,AMERDUZ) Q:AMERAIEN<0  ;CREATE AN AUDIT FILE RECORD
 S AMERINDX=0
 F  S AMERINDX=$O(^AMERVSIT(AMERDA,5,AMERINDX)) Q:(AMERINDX="")  D
 .S DA(1)=AMERDA,DA=AMERINDX
 .S DIK="^AMERVSIT(DA(1),5,"
 .D ^DIK,EN^DIK  ; Delete identified entry and re-index diagnosis field
 .Q
 S AMERDXS="",AMERDR=""
 K APCLV
 S AMERVERR=$$PCCVF^APCLV(AMERPCC,"POV","5;7;11;12;14;17")
 ; This will return:
 ; APCLV(x)=^^^^internal value of V POV^^ ICD9 code^^^^Cause of injury^place of injury^provider narrative^date of injury
 ; for each V POV x in the file for this visit
 Q:$G(APCLV(1))=""  ;IHS/OIT/SCR 01/20/09 - if there are no DX in the PCC visit, don't wipe out ERS .9999 info
 S AMERINDX="",AMERCNT=0
 F  S AMERINDX=$O(APCLV(AMERINDX)) Q:AMERINDX=""  D
 .S AMERNDX=$P(APCLV(AMERINDX),"^",7)
 .S AMERNDXI=$P($$ICDDX^ICDCODE(AMERNDX,,,1),U,1)
 .I AMERNDXI<1 D
 ..S AMERNDXI=$P($$ICDDX^ICDCODE(".9999",,,1),U,1)   ;start by setting it to 'uncoded' pointer
 ..I AMERNDX="VA LOCAL CODE SELECTED" D
 ...;LOOK IT UP THROUGH FILEMAN
 ...S DIC="^AUPNVPOV(",DIC(0)="NX",X="`"_$P(APCLV(AMERINDX),"^",5)
 ...D ^DIC
 ...I Y'=-1 D
 ....;Now you have looked upt the entry in AUPNVPOV
 ....S AMERNDXI=$P(Y,"^",2)  ;brings back the pointer to ICD in the .01 field of this V POV
 ....S AMERNDX=$P($$ICDDX^ICDCODE(AMERNDX,,,1),U,2)  ;brings back the ICD code
 ...Q
 ..Q
 .S AMERNNAR=$P(APCLV(AMERINDX),"^",14)
 .S AMERNNAR=$$STRIPNAR^AMERPCC2(AMERNNAR) ;IHS/OIT/SCR 05/05/09
 .I AMERINDX=1 D
 ..S AMERODX=$P($G(^AMERVSIT(AMERDA,5.1)),U,2)  ;OLD PRIMARY DX IEN
 ..S AMERONAR=$P($G(^AMERVSIT(AMERDA,5.1)),U,3)   ;OLD PRIMARY NARRATIVE
 ..I AMERODX'=AMERNDXI D
 ...;I AMERODX'="" S AMEROLD=$P($$ICDDX^ICDCODE(AMERODX,,,1),U,2)
 ...;E  S AMEROLD=""
 ...;S AMERNEW=$P($$ICDDX^ICDCODE(AMERNDX,,,1),U,2)
 ...;D NOW^%DTC  ; FM datetime returned in X
 ...;S AMERSTRG="5.2."_AMEREDNM_";"_X_";"_$$EDDISPL^AMEREDAU(AMEROLD,"X")_";"_$$EDDISPL^AMEREDAU(AMERNEW,"X")_";Other;PRIMARY DIAGNOSIS;Silent PCC SYNCH"
 ...;S AMEREDNM=AMEREDNM+1
 ...;S AMEREDTS=$S(AMEREDTS="":AMERSTRG,1:AMEREDTS_"^"_AMERSTRG)
 ...S AMERDR=$S(AMERDR'="":AMERDR_";",1:""),AMERDR=AMERDR_"5.2////"_AMERNDXI
 ...Q
 ..I AMERONAR'=AMERNNAR D
 ...;D NOW^%DTC  ; FM date time returned in X
 ...;S AMERSTRG="5.3."_AMEREDNM_";"_X_";"_AMERONAR_";"_AMERNNAR_";Other;PRIMARY DX NARRATIVE;Silent PCC SYNCH"
 ...;S AMEREDNM=AMEREDNM+1
 ...;S AMEREDTS=$S(AMEREDTS="":AMERSTRG,1:AMEREDTS_"^"_AMERSTRG)
 ...S AMERDR=$S(AMERDR'="":AMERDR_";",1:""),AMERDR=AMERDR_"5.3////"_AMERNNAR  ; Update narrative
 ..D:AMERDR'="" DIE^AMEREDIT(AMERDA,AMERDR)  ;UPDATES ER VISIT PRIMARY DX AND NARRATIVE
 ..;D:AMEREDTS'="" MULTAUDT^AMEREDAU(AMEREDTS,AMERAIEN)
 ..Q
 .;S DA(1)=AMERDA,DIC="^AMERVSIT("_DA(1)_",5,",DIC(0)="L" ; DIAGNOSES
 .S DA(1)=AMERDA,DIC="^AMERVSIT("_DA(1)_",5,",DIC(0)="" ; DIAGNOSES
 .;S X="`"_AMERNDXI
 .S X=AMERNDXI
 .;D ^DIC
 .D FILE^DICN
 .Q:+Y<0
 .S DIE=DIC,DA(1)=AMERDA,DA=+Y,DR="1////"_AMERNNAR
 .D ^DIE
 .K DIC,DIE,DA,Y,DR
 .Q
 K APCLV
 Q
SYNCHERD(AMERDA,AMERPCC)  ;EP from AMEREDIT and AMERPCC1
 ;IHS/OIT/SCR 12/30/08
 ;This routine is called when it is determined that PCC PROVIDERS need to replace the ER VISIT file PROVIDERS.
 ;1. GET ALL PROVIDERS FROM PCC
 ;2. REPLACE THE ERS DISCHARGE PROVIDER INFO WITH THE INFO IN THE PCC PRIMARY PROVIDER IF THEY ARE DIFFERENT
 N AMERVINT,AMEREINT,AMERVERR,AMERDR,AMERSTRG,AMERAIEN,AMERDUZ,AMEREDTS
 S AMEREDTS=""
 ;S AMERDUZ=DUZ ;WHO EVER IS USING THIS APPLICATION WHEN THIS ROUTINE IS CALLED
 ;S AMERAIEN=$$CREATAUD^AMEREDAU(AMERDA,AMERDUZ) Q:AMERAIEN<0  ;CREATE AN AUDIT FILE RECORD
 S AMERVINT=$$PRIMPROV^APCLV(AMERPCC,"I")  ;RETURNS ONE PCC PRIMARY PROVIDER
 S AMEREINT=$P($G(^AMERVSIT(AMERDA,6)),U,3) ; DISCHARGE PROVIDER
 I AMERVINT'=AMEREINT D
 .Q:AMERVINT=""
 .;UPDATE ERS DISCHARGE PROVIDER WITH THE PCC PRIMARY PROVIDER
 .S AMERDR=""
 .S AMERDR="6.3////"_AMERVINT
 .D:AMERDR'="" DIE^AMEREDIT(AMERDA,AMERDR)
 .;D NOW^%DTC
 .;S AMERSTRG="6.3;"_X_";"_$$EDDISPL^AMEREDAU(AMEREINT,"N")_";"_$$EDDISPL^AMEREDAU(AMERVINT,"N")_";Other;DISCHARGE PROVIDER;Silent PCC SYNCH"
 .;S AMEREDTS=AMERSTRG
 .;D:AMEREDTS'="" MULTAUDT^AMEREDAU(AMEREDTS,AMERAIEN)
 .Q
 Q
SYNCHERS(AMERSTRT,AMEREND)  ;EP from ERS reporting routines to synch a range of records
 ;IHS/OIT/SCR 12/29/08
 ;This routine is called to check all ER VISITS in a date range and update them with PCC DATA when
 ;the 'last edited' date on the PCC VISIT is more recent than the 'last edited' 'date in the ERS VISIT
 ; 1. CREATE AN ARRAY OF ERS IEN, PCC VISIT IEN AND ERS LAST UPDATE INFO FOR ERS VISITS IN THE DATE RANGE
 ; 2. FOR EACH ENTRY IN THAT ARRAY, GET THE PCC 'LAST UPDATE DATE'
 ;      COMPARE PCC 'LAST UPDATE' TO  ERS 'LAST UPDATE'
 ;      IF PCC LAST UPDATE IS MORE CURRENTCALL SYNCHER ROUTINES TO UPDATE ERS VISIT
 N AMEREMOD,AMERPMOD,AMERPCC,AMERDA,AMERFRST,AMERLST,X,Y,X1,X2,AMERPAT
 S %DT=""
 S X=AMERSTRT
 D ^%DT
 S AMERFRST=Y
 S X=AMEREND
 D ^%DT
 S AMERLST=Y
 ;S AMERIDX1=AMERFRST
 S AMERIDX1=AMERFRST-1  ;IHS/OIT/SCR 2/27/09 not synching all entries when reports are run
 F  S AMERIDX1=$O(^AMERVSIT("B",AMERIDX1)) Q:($P(AMERIDX1,".",1)>AMERLST)!(AMERIDX1="")  D
 .I AMERIDX1<AMERFRST Q  ;GET TO STARTING POINT
 .S AMERDA=$O(^AMERVSIT("B",AMERIDX1,""))
 .S AMEREMOD=$P($G(^AMERVSIT(AMERDA,12)),"^",6)  ;DATE  LAST MODIFIED IN ERS VISIT
 .S AMERPCC=$P($G(^AMERVSIT(AMERDA,0)),"^",3)   ;PCC IEN FOR THIS VISIT
 .I AMERPCC<1 D  Q  ;IHS/OIT/SCR 05/07/09
 ..D EN^DDIOL("No PCC VISIT found for ERS VISIT IEN "_AMERDA_"!!","","!?5")
 ..D EN^DDIOL("Skipping this record","","!?10")
 ..Q
 .S AMERPMOD=$$DLM^APCLV(AMERPCC,"I")
 .I AMERPMOD>=$P(AMEREMOD,".",1) D
 ..D SYNCHERA(AMERDA,AMERPCC)   ;SYNCH ADMISSION IFO
 ..D SYNCHERX(AMERDA,AMERPCC)   ;SYNCH DIAG INFO
 ..D SYNCHERD(AMERDA,AMERPCC)   ;SYNCH PRIMARY PROVIDER INFO
 ..;IHS/OIT/SCR 12/15/08 - update ER VISIT FILE with DATE LAST SYNCHED (NOW)
 ..D TIMESTMP^AMERSAV1(AMERDA)
 ..Q
 .S AMERPAT=$P($G(^AMERVSIT(AMERDA,0)),U,2)
 .D:AMERPAT>0 SYNCHERP(AMERPAT,AMERDA)
 .Q
 W !,"FINISHED SYNCHING ERS WITH CURRENT PCC DATA FROM "_AMERSTRT_" TO "_AMEREND
 Q
SYNCHERP(AMERPAT,AMERDA)  ; EP from AMER0, AMEREDIT AND AMERPCC
 ;SYNCHS MOST CURRENT PATIENT INFORMATION FOR DUPLICATED FIELDS HRN AND DOB
 N AMERDOB,AMERHRN,AMERDR ;IHS/OIT/SCR 071509 patch 2
 S AMERDOB=$$DOB^AUPNPAT(AMERPAT)
 S AMERHRN=$$HRN^AUPNPAT(AMERPAT,DUZ(2))
 I $P($G(^AMERVSIT(AMERDA,0)),U,12)'=AMERDOB D
 .S AMERDR=".12////"_AMERDOB
 .D DIE^AMEREDIT(AMERDA,AMERDR)
 .Q
 I $P($G(^AMERVSIT(AMERDA,0)),U,13)'=AMERHRN D
 .S AMERDR=".13////"_AMERHRN
 .D DIE^AMEREDIT(AMERDA,AMERDR)
 .Q
 Q