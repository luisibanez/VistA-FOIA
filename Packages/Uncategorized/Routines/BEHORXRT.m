BEHORXRT ;IHS/MSC/MGH - E-Prescribing receipt ;03-Mar-2011 17:38;PLS
 ;;1.1;BEH COMPONENTS;**009004,009006**;Mar 20, 2007
 ;=================================================================
 ; RPC: Retrieve reports for date range
GETRPTS(DATA,DFN,BEHFLG,STRT,END) ;EP
 S DATA=$$TMPGBL^CIAVMRPC
 D CAPTURE^CIAUHFS("D REPORTS^BEHORXRT(DFN,.BEHFLG,STRT,END)",DATA,80)
 S:'$D(@DATA) @DATA@(1)="No E-Prescriptions found within specified date range."
 Q
 ; RPC: Retrieve report
 ; Entry point for OE/RR REPORT file
OERRRPTS(ROOT,ORDFN,ID,ALPHA,OMEGA,ORDTRNG,REMOTE,ORMAX,ORFHIE) ;EP
 D GETRPTS(.ROOT,ORDFN,,ALPHA,OMEGA)
 Q
REPORTS(DFN,BEHFLG,STRT,END) ;
 N TRANSDT,IEN,DATA,RX,PAT
 K ^TMP("BEHRX",$J) K ^TMP("BEHRX2",$J)
 S TRANSDT=STRT,END=END\1+.2359
 F  S TRANSDT=$O(^PS(52.51,"AC1",TRANSDT)) Q:TRANSDT=""  D
 .I TRANSDT,TRANSDT'>END D
 ..S IEN="" F  S IEN=$O(^PS(52.51,"AC1",TRANSDT,IEN)) Q:IEN=""  D
 ...S DATA=$G(^PS(52.51,IEN,0))
 ...S PAT=$P(DATA,U,2),STATUS=$P($G(^PS(52.51,IEN,0)),U,10)
 ...I PAT=DFN&(STATUS=2) D SAVE(IEN,DATA)
 D RESORT,REPORT
 Q
SAVE(IEN,DATA) ;EP
 ; Generate specified report segments for a visit abstract
 N RX,PHARM,RXDRUG,DRUG,RXPHARM,PHARM,PROV
 S RX=$P(DATA,U,1)
 Q:RX=""
 S RXDRUG=$P($G(^PSRX(RX,0)),U,6)
 Q:RXDRUG=""
 S DRUG=$P($G(^PSDRUG(RXDRUG,0)),U,1)
 S RXPHARM=$P($G(^PSRX(RX,999999921)),U,4)
 Q:RXPHARM=""
 S PROV=$P($G(^PSRX(RX,0)),U,4)
 Q:PROV=""
 S PHARM=$P($G(^APSPOPHM(RXPHARM,0)),U,1)
 S DATE=$P(TRANSDT,".",1)
 S ^TMP("BEHRX",$J,PROV,RXPHARM,DATE,RX)=TRANSDT
 Q
RESORT ;
 N PROV,RXPHARM,TRANSDT,RX,CNT
 S CNT=0
 S PROV="" F  S PROV=$O(^TMP("BEHRX",$J,PROV)) Q:PROV=""  D
 .S RXPHARM="" F  S RXPHARM=$O(^TMP("BEHRX",$J,PROV,RXPHARM)) Q:RXPHARM=""  D
 ..S TRANSDT="" F  S TRANSDT=$O(^TMP("BEHRX",$J,PROV,RXPHARM,TRANSDT)) Q:TRANSDT=""  D
 ...S CNT=0 S RX="" F  S RX=$O(^TMP("BEHRX",$J,PROV,RXPHARM,TRANSDT,RX)) Q:RX=""  D
 ....S CNT=CNT+1
 ....S ^TMP("BEHRX2",$J,PROV,RXPHARM,TRANSDT)=CNT
 Q
REPORT ;
 N SNAME,ADDRESS,CITY,INAME,IADDRESS,ICITY,IPHONE,IFAX
 N PROV,RXPHARM,TRANSDT,RX,RX0,INST,HLOC,PAGE,NNAME
 S PAGE=0,FIRST=1
 D HDR
 S PROV="" F  S PROV=$O(^TMP("BEHRX",$J,PROV)) Q:PROV=""  D
 .;I FIRST=0 D FOOTER,HDR
 .S NNAME=$P($G(^VA(200,PROV,0)),U,1)
 .S RXPHARM="" F  S RXPHARM=$O(^TMP("BEHRX",$J,PROV,RXPHARM)) Q:RXPHARM=""  D
 ..;I FIRST=0 D FOOTER,HDR
 ..D PHARM
 ..S TRANSDT="" F  S TRANSDT=$O(^TMP("BEHRX",$J,PROV,RXPHARM,TRANSDT)) Q:TRANSDT=""  D
 ...I FIRST=0 D FOOTER,HDR
 ...S CNT=$G(^TMP("BEHRX2",$J,PROV,RXPHARM,TRANSDT))
 ...S DTE=$$FMTE^XLFDT(TRANSDT)
 ...W !,CNT_" prescription(s) were sent on: "_DTE
 ...W !,"Prescriptions were sent electronically and securely to:"
 ...W !,$$CJ^XLFSTR(SNAME,IOM)
 ...W !,$$CJ^XLFSTR(ADDRESS,IOM)
 ...W !,$$CJ^XLFSTR(CITY,IOM)
 ...W !,"The prescription(s) sent were:",!
 ...W !,"MEDICATION",?50,"SENT"
 ...S RX="" F  S RX=$O(^TMP("BEHRX",$J,PROV,RXPHARM,TRANSDT,RX)) Q:RX=""  D
 ....I FIRST=1 S FIRST=0
 ....S RX0=$G(^PSRX(RX,0))
 ....S HLOC=$P(RX0,U,5)
 ....S INST=$$GET1^DIQ(44,HLOC,3,"I")
 ....D INST
 ....S DRUG=$P(RX0,U,6),DNAME=$P($G(^PSDRUG(DRUG,0)),U,1)
 ....S TDATE=$G(^TMP("BEHRX",$J,PROV,RXPHARM,TRANSDT,RX))
 ....W !,DNAME,?50,$$FMTE^XLFDT(TDATE)
 D FOOTER
 Q
PHARM ;Get the data for the pharmacy
 S SNAME=$$VAL^XBDIQ1(9009033.9,RXPHARM,.1)
 S ADDRESS=$$VAL^XBDIQ1(9009033.9,RXPHARM,1.1)_" "_$$VAL^XBDIQ1(9009033.9,RXPHARM,1.2)
 S CITY=$$VAL^XBDIQ1(9009033.9,RXPHARM,1.3)_" "_$$VAL^XBDIQ1(9009033.9,RXPHARM,1.4)_" "_$$VAL^XBDIQ1(9009033.9,RXPHARM,1.5)
 Q
INST ;Get the data for the institution
 S INAME=$$GET1^DIQ(4,INST,.01)
 S IADDRESS=$$GET1^DIQ(4,INST,1.01)  ;Street Address 1
 S ICITY=$$GET1^DIQ(4,INST,1.03)_", "_$$GET1^DIQ(4,INST,.02)_"  "_$$GET1^DIQ(4,INST,1.04)
 S IPHONE=$$GET1^DIQ(9999999.06,INST,.13)
 S IFAX=$$GET^XPAR("ALL","APSP AUTO RX FAXED FROM NUMBER")
 Q
 ; Start new page and output header if exceed line count
HDR S CNT=$G(CNT,1),PAGE=PAGE+1
 W @IOF
 ;W #
 W !,$$CJ^XLFSTR("RECEIPT",IOM)
 W !,$$CJ^XLFSTR("E-Prescription Transmission Summary",IOM),!!
 S NAME=$P($G(^DPT(DFN,0)),U,1)
 S LNAME=$P(NAME,",",1),FNAME=$P(NAME,",",2)
 S NAME=FNAME_" "_LNAME
 W !,$$CJ^XLFSTR(NAME,IOM),!
 Q
FOOTER ;
 W !!!,"Important Note: This is the summary of your medications"
 W !,"you will be receiving from your pharmacy.  You do not have"
 W !,"to present this slip at your pharmacy in order to pick up your"
 W !,"prescription(s), but sharing this slip with the pharmacist can"
 W !,"help to  ensure that you get all of the medicines that have been"
 W !,"prescribed for you",!!
 W !,"To the Pharmacist:",!
 W !,"Prescriptions for the medications listed above were sent to your"
 W !,"pharmacy via the Surescripts network. Please look for these"
 W !,"prescriptions in your computer's electronic prescriptions queue"
 W !,"and/or your fax machine.",!!
 W !,$$CJ^XLFSTR(NNAME,IOM)
 W !,$$CJ^XLFSTR(INAME,IOM)
 W !,$$CJ^XLFSTR(IADDRESS,IOM)
 W !,$$CJ^XLFSTR(ICITY,IOM)
 W !,$$CJ^XLFSTR("Phone: "_IPHONE,IOM)
 W !,$$CJ^XLFSTR("Fax: "_IFAX,IOM)
 S PAGE=PAGE+1
 W !!,$$REPEAT^XLFSTR("=",80),!
 F I=$Y:1:IOSL-8 W !
 Q
