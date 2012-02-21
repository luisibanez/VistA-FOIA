SDWLEVAL ;;IOFO BAY PINES/ESW - WAIT LIST - DISPOSITION AFTER APPOINTMENT(S) ENTRY;06/12/2002 ; 5/23/05 4:47pm
 ;;5.3;Scheduling;**327,471**;AUG 13 1993
 ;Evaluate appt for optional disposition
 ;called from SDMM, SDMM1, SDM1A, SDAM2
 ;replaces SDWLR
 ;
EN(DFN,SDYN) ;evaluation if patient is on EWL
 ; SDYN has to be passed by reference
 ;output: SDYN=0 -  no open entries in EWL
 ;        SDYN=1 -  at least one open entry in EWL
 ;        SDYN(1)  - related message
 S SDYN=0,SDYN(1)=""
 I '$D(DFN)!(DFN'?1.N) S SDYN(1)="Patient's DFN not passed." Q
 I $D(DFN),'$D(^SDWL(409.3,"B",DFN)) S SDYN(1)="This patient is not on EWL." Q
 S SDWLDA="" F  S SDWLDA=$O(^SDWL(409.3,"B",DFN,SDWLDA)) Q:SDWLDA=""  D  Q:SDYN=1
 .I $P($G(^SDWL(409.3,SDWLDA,0)),"^",17)="O" S SDYN=1,SDYN(1)="Patient has open Wait List entries."
 I SDYN=0 S SDYN(1)="Patient has no open Wait List entries."
 Q
EWLANS(SDCONT) ;display EWL OPEN entries
 ;check if to continue with EWL open entries
 S SDCONT=0
 N X,DIR
 S DIR("B")="YES"
 S DIR("A")="Do you want to display open Wait list entries (Yes/No)?",DIR(0)="Y"
 S DIR("?")="Do you want to review open EWL entries for Dispositioning?"
 D ^DIR
 I Y S SDCONT=1
 Q
ASKREM ;prompt user for record for dispositioning
 S SDDIS=0 ; flag indicating disposition
 W ! N X,DIR
 S DIR("B")="NO"
 S DIR("A")="DO YOU WISH TO REMOVE ANY ENTRY FROM LIST (Yes/No)? ",DIR(0)="Y"
 S DIR("?")="To disposition any entry based on scheduled appointments."
 D ^DIR
 I Y S SDDIS=1
 D ANSW(SDDIS)
 D END
 Q
ANSW(SDDIS) ;
 ;SDDIS=0 - select entries not to disposition
 ;SDDIS=1 - select entries to disposition
 K DIR,X
 W !
 N STR,SS S SDC=$O(^TMP($J,"SDWLPL",""),-1) I SDC=1 S DIR("B")=1
 S DIR(0)="L^1:"_SDC S DIR("A")="Select entries for entering Non-Removal Reason or '^' to Quit>",DIR("?")="Enter number(s) or range of displayed Wait List entries."
 I SDDIS S DIR("A")="Select entries for dispositioning or '^' to Quit>"
 D ^DIR
 I X="^" Q
 I X["-" D
 .N SXB,SXE
 .S SXB=$P(X,"-"),SXE=$P(X,"-",2) N SDC F SDC=SXB:1:SXE S SDWLDA=+^TMP($J,"SDWLPL",SDC) D
 ..;LOCK
 ..L +^SDWL(409.3,SDWLDA):5 I '$T W !,"Another User is Editing this Entry. Try Later." Q
 ..I 'SDDIS D DISPO(SDWLDA,SDC)
 ..I SDDIS D GETDATA(SDWLDA) D DISEND(SDWLDA,SDC)
 I X[","!(X?1N) D
 .N FF S FF=X N GG,SDC F GG=1:1 S SDC=$P(FF,",",GG) Q:SDC=""  S SDWLDA=+^TMP($J,"SDWLPL",SDC) D
 ..;LOCK
 ..L +^SDWL(409.3,SDWLDA):5 I '$T W !,"Another User is Editing this Entry. Try Later." Q
 ..I 'SDDIS D DISPO(SDWLDA,SDC)
 ..I SDDIS D GETDATA(SDWLDA) D DISEND(SDWLDA,SDC)
 ..L
 Q
DISEND(SDWLAD,SDC) ;enter disposition
 ;SDWLDA - IEN of 409.3  
 ;are you sure you want to disposition this entry:
 ;display an entry
 ;quit if NO
 ;proceed if YES
 D EDIT(SDWLDA,SDC,.SDWLERR) Q:$D(DUOUT)  I SDWLERR Q
 W !!,"*** Patient has been removed from Wait List ***",!
 K DIR,DIE,DR,DIC
 S DIR(0)="E" D ^DIR I $D(DUOUT) Q
 Q
GETDATA(SDWLDA) ;PATIENT DATA RETRIEVAL
 S SDWLDATA=$G(^SDWL(409.3,SDWLDA,0))
 S SDWLIN=$P(SDWLDATA,U,3),SDWLCL=+$P(SDWLDATA,U,4),SDWLTY=$P(SDWLDATA,U,5),SDWLST=$P(SDWLDATA,U,6)
 S SDWLSP=$P(SDWLDATA,U,7),SDWLSS=$P(SDWLDATA,U,8),SDWLSC=$P(SDWLDATA,U,9),SDWLPRI=$P(SDWLDATA,U,10),SDWLRB=$P(SDWLDATA,U,11)
 S SDWLPROV=$P(SDWLDATA,U,12),SDWLDAPT=$P(SDWLDATA,U,16),SDWLST=$P(SDWLDATA,U,17),SDWLDUZ=DUZ,SDWLEDT=DT
 S SDWLSCL="" I SDWLSC S SDWLSCL=+$P(^SDWL(409.32,SDWLSC,0),U,1)
 I $D(^SDWL(409.3,SDWLDA,"DIS")) S SDWLDISP=$P(^SDWL(409.3,SDWLDA,"DIS"),U,3)
 Q
EDIT(SDWLDA,SDC,SDWLERR) ;ENTER/EDIT DISPOSITION
 ;SDWLDA -IEN of selected 409.3 entry to disposition
 ;SDWLERR - called by a reference
 ;SDC - sequential number in ^TMP($J,"SDWLPL",SDC
 S SDWLDUZ=DUZ,SDWLERR=0 K DIR,DR,DIE,DIC
 I $D(SDWLDISP) S DIR("B")=$$EXTERNAL^DILFD(409.3,21,,SDWLDISP)
 S DIR(0)="SO^D:DEATH;NC:REMOVED/NON-VA CARE;SA:REMOVED/SCHEDULED-ASSIGNED;CC:REMOVED/VA CONTRACT CARE;NN:REMOVED/NO LONGER NECESSARY;ER:ENTERED IN ERROR;Q:QUIT/DO NOT DISPOSITION^"
 S DIR("L",1)="Disposition Reason for # "_SDC_":",DIR("L",2)="",DIR("L",3)="D DEATH",DIR("L",4)="NC REMOVED/NON-VA CARE",DIR("L",5)="SA REMOVED/SCHEDULED-ASSIGNED"
 S DIR("L",6)="CC REMOVED/VA CONTRACT CARE",DIR("L",7)="NN REMOVED/NO LONGER NECESSARY",DIR("L",8)="ER ENTERED IN ERROR",DIR("L")="Q QUIT/DO NOT DISPOSITION"
 ;MAKE DEFAULT 'SA'
 S DIR("A")="Enter selection or <cr> to accept 'SA REMOVED/SCHEDULED-ASSIGNED'> "
 S DIR("?")="SA selection will require appointment selection to disposition this entry."
 S DIR("B")="SA"
 D ^DIR
 S SDWLDISP=$S(X["D":"D",X["d":"D",X["NC":"NC",X["nc":"NC",X["SA":"SA",X["sa":"SA",X["CC":"CC",X["cc":"CC",X["NN":"NN",X["nn":"NN",X["ER":"ER",X["er":"ER",X["Q":"^",X="":"SA",1:0)
 I X="^" S DUOUT=1 Q
 I SDWLDISP="^" S DUOUT=1 Q
 I SDWLDISP=0 S SDWLERR=1
 I SDWLERR W *7,"Invalid Entry" Q
 S DIE("NO^")="NO EDITING"
 N SDAP I SDWLDISP="SA" D APPTD D  I SDAP="^" W !,"Disposition canceled by user",! Q
 .W ! K DIR,X
 .N STR,SS,SDA S SDA=$O(^TMP($J,"APPT",""),-1) I SDA=1 S DIR("B")=1
 .S DIR(0)="N^1:"_SDA S DIR("A")="Select appointment entry for Removal Reason or '^' to Quit>",DIR("?")="Select Appointment for updating the selected EWL with."
 .D ^DIR
 .S SDAP=X
 S DIE="^SDWL(409.3,",DA=SDWLDA,DR="21////^S X=SDWLDISP" D ^DIE
 S DR="19////^S X=DT" D ^DIE
 S DR="20////^S X=SDWLDUZ" D ^DIE
 S DR="23////^S X=""C""" D ^DIE
 ;I SDWLDISP="SA" update with appointment data
 ;get appointment data to file (for a particular appt #)
 I SDWLDISP="SA" N SDA D DATP(SDAP,.SDA) D
 .I $D(SDA) S DIE="^SDWL(409.3,",DA=SDWLDA D
 ..S DR="13////"_SDA(1)_";13.1////"_DT_";13.2////"_SDA(2)_";13.3////"_SDA(15)_";13.4////"_SDA(13)_";13.5////"_SDA(14)_";13.6////"_SDA(16)_";13.8////"_SDA(3)_";13.7////"_DUZ
 ..D ^DIE
 N SDWLSCL,SDWLSS
 S SDWLSCL=$P($G(^TMP($J,"SDWLPL",SDC)),U,9)
 S SDWLSS=$P($G(^TMP($J,"SDWLPL",SDC)),U,10)
 I SDWLSCL K:$D(^SDWL(409.3,"SC",SDWLSCL,SDWLDA)) ^SDWL(409.3,"SC",SDWLSCL,SDWLDA)
 S SDWLDFN=$P($G(^TMP($J,"APPT",1)),U,4)
 I SDWLSS,SDWLDFN K:$D(^SDWL(409.3,"SS",SDWLDFN,SDWLSS,SDWLDA)) ^SDWL(409.3,"SS",SDWLDFN,SDWLSS,SDWLDA)
 Q
DISPO(SDWLDA,SDC) ;
 ;SDWLDA - IEN of 409.3
 ;select NON-REMOVAL reason
 K DIR,X
 S DIR(0)="SO^1:APPOINTMENT CRITERIA NOT MET;2:PATIENT WANTS ANOTHER APPOINTMENT;3:PROVIDER WANTS ANOTHER APPOINTMENT;4:OTHER;5:QUIT"
 S DIR("L",1)="SELECT ONE OF THE FOLLOWING REASONS FOR # "_SDC_":",DIR("L",2)=""
 S DIR("L",3)="1. APPOINTMENT CRITERIA NOT MET",DIR("L",4)="2. PATIENT WANTS ANOTHER APPOINTMENT"
 S DIR("L",5)="3. PROVIDER WANTS ANOTHER APPOINTMENT",DIR("L,6")="4. OTHER",DIR("L,7")="5. QUIT"
 S DIR("A")="Select one of the following reasons for #: "_SDC
 D ^DIR
 S X=$E(X,1,2) S:$E(X,2)'="R" X=$E(X)
 S SDWLX=$S(X="a":"A",X="p":"P",X="pr":"PR",X="o":"O",X="A":"A",X="P":"P",X="PR":"PR",X="O":"O",X=1:"A",X=2:"P",X=3:"PR",X=4:"O",X="^":"^",X="Q":"^",X=5:"^",1:"")
 I SDWLX="^" Q
 I SDWLX="O" D
 .S DIR(0)="FAO^^",DIR("A")="Comments: " D ^DIR Q:X["^"
 .S SDWLCOM=X,DA=SDWLDA,DIE="^SDWL(409.3,",DR="18.1////^S X=SDWLCOM" D ^DIE
 N DA S DA=SDWLDA
 S DIE="^SDWL(409.3,",DR="18////^S X=SDWLX" D ^DIE
 S DR="17////^S X=DUZ" D ^DIE
 S DR="16////^S X=DT" D ^DIE
 K SDWLERR,DIR,DR,DIE,X,SDWLX,SDWLDSS,SDWLASK,SDWLDA,SDWLCOM
 Q
HD ;HEADER
 W:$D(IOF) @IOF W !!,?80-$L("Wait List - Disposition Patient")\2,"Wait List - Disposition Patient",!!
 Q
APPT(DFN,SD,SC) ;create appt TMP
 ;SD - appt date/time
 ;SC - Hospital Location IEN
 N SDARR,SCNT
 S SDDIV=""
 S SDARR(1)=SD_";"_SD
 S SDARR(2)=SC
 S SDARR(4)=DFN
 S SDARR("FLDS")="1;2;3;4;10;13;14"
 N SAPP S SAPP=$$SDAPI^SDAMA301(.SDARR) D
 .N SDINST,SDFAC,SDINSTE
 .Q:'$D(^TMP($J,"SDAMA301",DFN))
 .S SCNT=$O(^TMP($J,"APPT",""),-1)+1
 .S ^TMP($J,"APPT",SCNT)=^TMP($J,"SDAMA301",DFN,SC,SD)
 .S SDINST=$$GET1^DIQ(44,SC_",",3,"I")  ; get Institution
 .S SDINSTE=$$GET1^DIQ(44,SC_",",3,"E")
 .S SDFAC=$S(SDINST="":"",1:$$GET1^DIQ(4,SDINST_",",99,"I"))  ; Station
 .I SDFAC="" N SDDIV S SDDIV="" S SDDIV=$$GET1^DIQ(44,SC_",",3.5,"I") D
 ..I SDDIV'="" S SDINST=$$GET1^DIQ(40.8,SDDIV_",",.07,"I") I SDINST'="" D
 ...S SDFAC=$S(SDINST="":"",1:$$GET1^DIQ(4,SDINST_",",99,"I"))  ; Station
 ..I SDDIV="" S SDFAC=$P($$SITE^VASITE(,),"^",3)
 .S $P(^TMP($J,"APPT",SCNT),"^",15)=SDINST_";"_SDINSTE
 .S $P(^TMP($J,"APPT",SCNT),"^",16)=SDFAC
 .K ^TMP($J,"SDAMA301",DFN,SC,SD)
 Q
APPTD ;display appointment
 ;from appointment list created in ^TMP if open EWL entries
 N STR,SCNT
 Q:'$D(^TMP($J,"APPT"))
 S SCNT="" F  S SCNT=$O(^TMP($J,"APPT",SCNT)) Q:SCNT=""  D
 .S STR=^TMP($J,"APPT",SCNT)
 .N ZZ F ZZ=2,3,4,10,15 S SDD(ZZ)=$P($P(STR,"^",ZZ),";",2)
 .N SD S SD=$P(STR,U) D  S Y=SD D D^DIQ S SDD(1)=Y ; date conversion
 ..I SDD(3)="SCHEDULED/KEPT" S SDD(3)=$S(SD<DT:"KEPT",1:"SCHEDULED")
 .S SDD(16)=$P(STR,U,16)
 .N CP,ZZ F ZZ=13,14 S CP(ZZ)=$P($P(STR,U,ZZ),";") D
 ..S SDD(ZZ)=""
 ..I CP(ZZ)>0 S SDD(ZZ)=$$GET1^DIQ(40.7,CP(ZZ)_",",.01,"I") ; stop code desc
 .;DISPLAY
 .I SCNT=1 D DPH(SCNT,.SDD)
 .D DPHD(SCNT,.SDD)
 W !
 Q
DATP(SCNT,SDA) ;create data from appt # SCNT to be filed in 409.3 entry
 ;SDA - called by a reference to be returned to EDIT
 S STR=^TMP($J,"APPT",SCNT)
 S SDA(1)=$P(STR,U)
 N ZZ F ZZ=2,3,10,13,14,15 S SDA(ZZ)=$P($P(STR,"^",ZZ),";",1)
 S SDA(16)=$P(STR,"^",16) ;station
 Q
DPH(SCNT,SDD) ;display appt header
 W !!,?80-$L("Appointment(s) for: "_SDD(4)_" in Clinic: "_SDD(2)_"on "_SDD(1))\2,"Appointment(s) for: "_SDD(4)_" in Clinic: "_SDD(2) W !!?4,"Specialty: "_SDD(13),?60,"Station: ",SDD(16),!
 W !?3,"Appt Date/Time",?25,"Status",?42,"Appt Type",?60,"Institution",! N SDL S $P(SDL,"-",79)="" W SDL,!
 Q
DPHD(SCNT,SDD) ;
 W !,SCNT,?3,SDD(1),?25,SDD(3),?42,SDD(10),?60,SDD(15)
 Q
END ;QUIT OPTION
 K DIC,DIR,DR,DIE,SDWLDFN,DUOUT
 K SDWLCL,SDWSLCN,SDWLDA,SDWLDAPT,SDWLDATA,SDWLDFN,SDWLDISP,SDWLDUZ,SDWLEDT,SDWLERR,SDWLIN,SDWLNAM,SDWLOP,SDWLPRI
 K SDWLPROV,SDWLPS,SDWLRB,SDWLSC,SDWLSP,SDWLSS,SDWLST,SDWLTY,SDWLY,X,Y,SDWLHDR
 Q
