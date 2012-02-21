YSCLSRV2	;DALOI/RLM-Clozapine data server ;APR 24,1990@15:26
	;;5.01;MENTAL HEALTH;**69,90**;Dec 30, 1994;Build 18
	; Reference to ^%ZOSF supported by IA #10096
	; Reference to ^DPT supported by IA #10035
	; Reference to ^DD("DD" supported by IA #10017
	; Reference to ^PS(55 supported by IA #787
	; Reference to ^PSDRUG supported by IA #25
	; Reference to ^PSRX supported by IA #780
	; Reference to ^VA(200 supported by IA #10060
	; Reference to $$SITE^VASITE supported by IA #10112
	; Reference to $$FMTE^XLFDT() supported by IA #10103
	; Reference to ^PSDRUG supported by IA #221
	; Reference to ^LAB(60 supported by IA #333
	; 
REPORT	;send report of current registrations to the Clozapine group on Forum
	S XMRG="",YSCLA=0 F  S YSCLA=$O(^YSCL(603.01,YSCLA)) Q:'YSCLA  S YSCLDTA=$G(^YSCL(603.01,YSCLA,0)) D
	 . I YSCLDTA="" S YSCLER="Clozapine Patient List damaged at " D OUT Q
	 . S YSCLWB=$P(YSCLDTA,"^",3),YSCLWB=$S(YSCLWB="M":"Monthly",YSCLWB="W":"Weekly",YSCLWB="B":"Bi-weekly",1:"Unknown")
	 . S YSCLER=$P(YSCLDTA,"^")_" is assigned to "_$P($G(^DPT($P(YSCLDTA,"^",2),0)),"^")_" ("_$P($G(^DPT($P(YSCLDTA,"^",2),0)),"^",9)_") "_YSCLWB_" at " D OUT
	I YSCLSUB["+" S YSCLLNT=$G(YSCLLNT)+1,^TMP($J,"YSCLDATA",YSCLLNT)="====" S YSCLA=0 F  S YSCLA=$O(^PS(55,"ASAND",YSCLA)) Q:'YSCLA  S YSCLER="" D  D:YSCLER]"" OUT ;Transmit the most recent for each patient.
	 . S YSCLDFN=$P(^PS(55,YSCLA,0),"^") ;Find out who we're reporting on
	 . S YSCLNM=$P(^DPT(YSCLDFN,0),"^") ;Get the patients name
	 . S YSCLSD1=YSCLNM_"^"_^PS(55,YSCLA,"SAND") ;Add name to data
	 . S YSCLZZ=YSCLA,$P(YSCLSD1,"^",4)=$P($$CL^YSCLTST2(YSCLDFN),"^",2),YSCLA=YSCLZZ
	 . S YSCLDOC=$P(YSCLSD1,"^",6) I YSCLDOC K DIERR,YSCL200 D FIND^DIC(200,,".01","X","`"_YSCLDOC,,,,,"YSCL200","YERROR") S $P(YSCLSD1,"^",6)=$G(YSCL200("DILIST",1,1))
	 . ;S YSCLDOC=$P(YSCLSD1,"^",6) I YSCLDOC S $P(YSCLSD1,"^",6)=$P($G(^VA(200,YSCLDOC,0)),"^") ;OLD CODE
	 . S $P(YSCLSD1,"^",7)=$P(YSCLSD1,"^",7) ;Pad it to 7 ^-pieces
	 . S YSCLB=0 F  S YSCLB=$O(^PS(55,YSCLA,"P",YSCLB)) Q:'YSCLB  I $D(^PSRX(^PS(55,YSCLA,"P",YSCLB,0),"SAND")) D  ;D OUT ;This will transmit them all
	 . . S YSCLER=YSCLSD1_"^"_$G(^PSRX(^PS(55,YSCLA,"P",YSCLB,0),"SAND"))_"^"
	 . . S Y=$P(YSCLER,"^",7) I Y]"" X ^DD("DD") S $P(YSCLER,"^",7)=Y
	 . . S Y=$P(YSCLER,"^",10) I Y]"" X ^DD("DD") S $P(YSCLER,"^",10)=Y
	 . ;D OUT
	S YSCLLNT=$G(YSCLLNT)+1,^TMP($J,"YSCLDATA",YSCLLNT)="  Linked Tests:"
	S YSCLA=0 F  S YSCLA=$O(^YSCL(603.04,1,1,YSCLA)) Q:'YSCLA  D
	 . S YSCLLNT=$G(YSCLLNT)+1,^TMP($J,"YSCLDATA",YSCLLNT)=$P(^LAB(60,$P(^YSCL(603.04,1,1,YSCLA,0),"^",1),0),"^")
	 . S YSCLTYPE=$P(^YSCL(603.04,1,1,YSCLA,0),"^",2),YSCLRPT=$P(^YSCL(603.04,1,1,YSCLA,0),"^",3)
	 . S YSCLTA="  reports  "_$S(YSCLTYPE="W":"WHITE BLOOD COUNT",YSCLTYPE="A":"ABSOLUTE NEUTROPHIL COUNT",YSCLTYPE="N":"NEUTROPHIL PERCENT",YSCLTYPE="S":"SEGS %",YSCLTYPE="B":"BANDS %",YSCLTYPE="T":"BANDS A",YSCLTYPE="C":"SEGS A")
	 . S ^TMP($J,"YSCLDATA",YSCLLNT)=^TMP($J,"YSCLDATA",YSCLLNT)_YSCLTA_"  "_$S(YSCLRPT:"K/units",1:"units")
	;Old method
	;S YSCLLNT=$G(YSCLLNT)+1,^TMP($J,"YSCLDATA",YSCLLNT)="  Linked Tests:"
	;S YSCLLNT=$G(YSCLLNT)+1,^TMP($J,"YSCLDATA",YSCLLNT)="WBC = "_$$GET1^DIQ(603.02,1,.01)_", Neut% = "_$$GET1^DIQ(603.02,1,1)
	S YSCLLNT=$G(YSCLLNT)+1,^TMP($J,"YSCLDATA",YSCLLNT)="  Monitored Drug - Monitor Routine - NDC - Lab Test"
	S YSPR=0 F  S YSPR=$O(^PSDRUG(YSPR)) Q:'YSPR  I $P($G(^PSDRUG(YSPR,"CLOZ1")),"^")]"" D
	 . S YSCLTC=$P($G(^PSDRUG(YSPR,"CLOZ")),"^") I YSCLTC S YSCLTC=$$GET1^DIQ(60,YSCLTC,.01)
	 . S YSCLLNT=$G(YSCLLNT)+1,^TMP($J,"YSCLDATA",YSCLLNT)=$P($G(^PSDRUG(YSPR,0)),"^")_" - "_$P(^PSDRUG(YSPR,"CLOZ1"),"^")_" - "_$P($G(^PSDRUG(YSPR,2)),"^",4)_" - "_YSCLTC
	S YSCLDR=0 F  S YSCLDR=$O(^PSDRUG(YSCLDR)) Q:'YSCLDR  I $D(^PSDRUG(YSCLDR,"CLOZ2")) D
	 . S YSCLDRA=0 F  S YSCLDRA=$O(^PSDRUG(YSCLDR,"CLOZ2",YSCLDRA)) Q:'YSCLDRA  D
	 . . S YSCLDRB=^PSDRUG(YSCLDR,"CLOZ2",YSCLDRA,0)
	 . . S YSCLLNT=$G(YSCLLNT)+1,^TMP($J,"YSCLDATA",YSCLLNT)=$P(^PSDRUG(YSCLDR,0),"^")_" uses "_$P(^LAB(60,$P(YSCLDRB,"^"),0),"^")_" to indicate "_$S($P(YSCLDRB,"^",4)=1:"White Blood Count",1:"Neutrophil Count")
	;D OPTION^%ZTLOAD("YSCL WEEKLY TRANSMISSION","LIST") D
	; . S ZTSK="" F  S ZTSK=$O(LIST(ZTSK)) Q:ZTSK=""  D
	; . . D STAT^%ZTLOAD S YSCLLNT=$G(YSCLLNT)+1,^TMP($J,"YSCLDATA",YSCLLNT)="Local Task # "_ZTSK_" is "_$S('ZTSK(0):" not ",1:"")_"defined with a status of "_ZTSK(2)
	S YSCLLNT=$G(YSCLLNT)+1,^TMP($J,"YSCLDATA",YSCLLNT)="              Run day is: "_$P(^YSCL(603.03,1,0),"^",2)
	S YSCLLNT=$G(YSCLLNT)+1,^TMP($J,"YSCLDATA",YSCLLNT)="           Debug Mode is: "_$S($P(^YSCL(603.03,1,0),"^",3):"On.",1:"Off.")
	S YSCLLNT=$G(YSCLLNT)+1,^TMP($J,"YSCLDATA",YSCLLNT)="Last Run Date (start) is: "_$$FMTE^XLFDT($P(^YSCL(603.03,1,0),"^",4))
	S YSCLLNT=$G(YSCLLNT)+1,^TMP($J,"YSCLDATA",YSCLLNT)=" Last Run Date (stop) is: "_$$FMTE^XLFDT($P(^YSCL(603.03,1,0),"^",5))
	S YSCLLNT=$G(YSCLLNT)+1,^TMP($J,"YSCLDATA",YSCLLNT)="Last Demographic date is: "_$$FMTE^XLFDT($P(^YSCL(603.03,1,0),"^",6))
	Q
OUT	S YSCLLNT=$G(YSCLLNT)+1,^TMP($J,"YSCLDATA",YSCLLNT)=XMRG_YSCLER_YSCLST Q
	;Build the text for the return message here.
REBUILD	;
	S XMRG="",(YSCLA,YSCLLNT)=1 F  S YSCLA=$O(^PS(55,"ASAND1",YSCLA)) W:'$D(ZTQUEUED) "." Q:YSCLA=""  D
	 . S YSCLB=$O(^PS(55,"ASAND1",YSCLA,"")) I YSCLB="" S YSCLER=" record is in error (1) at " D OUT Q
	 . I '$D(^PS(55,YSCLB,0)) S YSCLER=" record is in error (2) at " D OUT Q
	 . S YSCLB=$P(^PS(55,YSCLB,0),"^") I YSCLB="" S YSCLER=" record is in error (3) at " D OUT Q
	 . I '$D(^PS(55,YSCLB,"SAND")) S YSCLER=" record is in error (4) at " D OUT Q
	 . S DIC="^DPT(",DIC(0)="X",D="SSN",(YSCLSSN,X)=$P(^DPT(YSCLB,0),"^",9)
	 . I $D(^YSCL(603.01,"B",YSCLA)) S YSCLX=$O(^YSCL(603.01,"B",YSCLA,"")) S:YSCLX]"" YSCLX=$P(^YSCL(603.01,YSCLX,0),"^",2),YSCLER=" Clozapine # "_YSCLA_" is in use by "_$P($G(^DPT(YSCLX,0)),"^")_" at " D OUT Q
	 . D MIX^DIC1 S YSCLPT=+Y I Y=-1 S YSCLER=" could not be added at " D OUT Q
	 . K DD S DIC="^YSCL(603.01,",X=YSCLA,DIC("DR")="1////"_YSCLPT K DO D FILE^DICN
	 . S YSCLX=$O(^YSCL(603.01,"B",YSCLA,"")) S:YSCLX]"" YSCLX=$P(^YSCL(603.01,YSCLX,0),"^",2),YSCLER=","_YSCLSSN_" assigned to "_$P($G(^DPT(YSCLX,0)),"^")_" at " D OUT
	Q
OVRRID	;Update record with Monthly, Weekly or Bi-weekly status
	F  X XMREC Q:XMER<0  S XMRG=$TR(XMRG,"- ","") D
	 . I XMRG'?2U5N1","9N1",".E S YSCLER=" is in error and was not added at " D OUT Q
	 . I $P(XMRG,",")'?2U5N S YSCLER=" is not a valid Clozapine number format " D OUT Q
	 . I $P(XMRG,",",2)'?9N S YSCLER=" An SSN must be 9 numbers " D OUT Q
	 . K %DT S X=$P(XMRG,",",3),%DT="F" D ^%DT I Y=-1 S YSCLER=" is an invalid date, over-ride authorization not filed at " D OUT Q
	 . S YSCLOVR=Y
	 . S YSCLNM=$P(XMRG,","),YSCLSSN=$P(XMRG,",",2),YSCLWB=$P(XMRG,",",3)
	 . I '$D(^YSCL(603.01,"B",YSCLNM)) S YSCLER=" does not exist at " D OUT Q
	 . S YSCLDA=$O(^DPT("SSN",YSCLSSN,0))
	 . I YSCLDA="" S YSCLER=" SSN does not exist at " D OUT Q
	 . I $O(^YSCL(603.01,"B",YSCLNM,0))="" S YSCLER=" SSN not in Clozapine file " D OUT Q
	 . I $O(^DPT("SSN",YSCLSSN,YSCLDA)) S YSCLER=" SSN has more than one owner " D OUT Q
	 . I $O(^YSCL(603.01,"B",YSCLNM,0))'=$O(^YSCL(603.01,"C",YSCLDA,0)) S YSCLER=" SSN ("_YSCLSSN_","_$P(^DPT(YSCLDA,0),"^")_") has multiple Clozapine Numbers at " D OUT
	 . I $O(^YSCL(603.01,"B",YSCLNM,0))=$O(^YSCL(603.01,"C",YSCLDA,0)) D
	 . . S YSCLDA1=$O(^YSCL(603.01,"B",YSCLNM,0)) S $P(^YSCL(603.01,YSCLDA1,0),"^",4)=YSCLOVR
	 . . S Y=YSCLOVR D DD^%DT S YSCLER=" "_YSCLNM_" ("_$P(^DPT(YSCLDA,0),"^")_") authorized for over-ride on "_Y_" at " D OUT
	G EXIT^YSCLSERV
ZEOR	;YSCLSRV2
