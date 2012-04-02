ACHSRELG ;IHS/OIT/FCJ - Eligibility population Report by Tribe and FY
 ;;3.1;CONTRACT HEALTH MGMT SYSTEM;**18**;JUN 11, 2001
 ;ACHS*3.1*18 new routine
 ;Eligibility population report by TRIBAL CHSDA and FY
ST ;
 S ACHSIO=IO
 W !!,"This is a CHS population report based on Tribal CHSDA,"
 W !,"community of residence and Fiscal Year."
 W !,"The CHS Service Delivery Area is entered by county,"
 W !,"then checked against the patient's community of residence."
 W !!,"NOTE: If all counties are not listed for selected Tribal CHSDA"
 W !,"use the option SDA Enter/Edit Tribal CHSDA to update counties"
 ;
FY ; Select FY.
 S ACHSACFY=$$FYSEL^ACHS(1)
 G:$D(DTOUT)!$D(DUOUT) EXT
 I '$D(^ACHS(9,DUZ(2),"FY",ACHSACFY)) W !!,*7,"Fiscal year '",ACHSACFY,"' does not exist. -- TRY AGAIN" G FY
FYDT ;BEG AND END DATES FOR THE FY, DOS >ACHSBFY OR <ACHSEFY
 I $P(^ACHSF(DUZ(2),0),U,7)=1 S ACHSBFY=ACHSACFY-1701_($P(^ACHSF(DUZ(2),0),U,6)-1),ACHSEFY=ACHSACFY-1700_($P(^ACHSF(DUZ(2),0),U,6)-1)
 E  S ACHSBFY=ACHSACFY-1700_($P(^ACHSF(DUZ(2),0),U,6)-1),ACHSEFY=ACHSACFY-1699_($P(^ACHSF(DUZ(2),0),U,6)-1)
 ;
TRB ;Tribal CHSDA
 ;
 W !
 S DIC="^ACHSSDA(",DIC(0)="AEQM"
 S DIC("A")="Enter the Tribal CHSDA: "
 D ^DIC
 I +Y<0 G FY
 S ACHSSDA=+Y
 ;
TYPE ; TYPE OF REPORT SUMARRY OR DETAILED
 ; Enter Summary or Detail
 S DIR(0)="S^S:SUMMARY;D:DETAILED",DIR("A")="Report Type ",DIR("B")="SUMMARY"
 S DIR("?")="Detail will display indiviual PO, Summary will display only the totals"
 D ^DIR
 G EXT:$D(DUOUT),EXT:$D(DTOUT),EXT:$D(DIROUT)
 S ACHSRTYP=Y
DEV ; Select device for report.
 S %=$$PB^ACHS
 I %=U!$D(DTOUT)!$D(DUOUT) G EXT
 I %="B" D VIEWR^XBLM("A1^ACHSRELG"),EN^XBVK("VALM") G EXT
 K IOP,%ZIS
 S %ZIS="PQ"
 D ^%ZIS,SLV^ACHSFU:$D(IO("S"))
 K %ZIS
 I POP W !,*7,"No device specified." D HOME^%ZIS G EXT
 G:'$D(IO("Q")) A1
 K IO("Q")
 I $E(IOST)'="P" W *7,!,"Please queue to printers only." G DEV
 S ZTIO="",ACHSQIO=ION_";"_IOST_";"_IOM_";"_IOSL,ZTRTN="A1^ACHSRGPR",ZTDESC="CHS GPRA Report, "_ACHSRPT_", "_$$FMTE^XLFDT(ACHSBDT)_" to "_$$FMTE^XLFDT(ACHSEDT)
 F %="ACHSQIO","ACHSBDT","ACHSEDT","ACHSRTYP","ACHSACFY","ACHSEFY","ACHSBFY","ACHSSDA" S ZTSAVE(%)=""
 D ^%ZTLOAD
 G:'$D(ZTSK) DEV
 ;
 ;end of interactive portion.  The rest performed by Taskman
 ;
A1 ;EP - TaskMan.
 D FC^ACHSUF
 I $D(ACHSERR),ACHSERR=1 G EXT
 K ^TMP("ACHSRELG",$J)
 S ^TMP("ACHSRELG",$J,"TOTELG")=0
 S ACHSTRC=$P(^AUTTTRI($P(^ACHSSDA(ACHSSDA,0),U),0),U)
 ;
CNTY ;SET COUNTY AND COMMUNITY CODES IN TMP GLB
 S ACHSCNTY=0
 F  S ACHSCNTY=$O(^ACHSSDA(ACHSSDA,30,ACHSCNTY)) Q:ACHSCNTY'?1N.N  D
 .S ACHSCST=$P(^AUTTCTY($P(^ACHSSDA(ACHSSDA,30,ACHSCNTY,0),U),0),U,4)
 .S ^TMP("ACHSRELG",$J,"CNTY",ACHSCST,0)=0
 .S ACHSCOM=ACHSCST_"000",ACHSCOMT=ACHSCST_999
 .F  S ACHSCOM=$O(^AUTTCOM("C",ACHSCOM)) Q:(ACHSCOM="")!(ACHSCOM>ACHSCOMT)  D
 ..S ^TMP("ACHSRELG",$J,"CNTY",ACHSCST,ACHSCOM)=0
 ..S ACHSCOMP=$O(^AUTTCOM("C",ACHSCOM,0))
 ..S ^TMP("ACHSRELG",$J,"COM",ACHSCOMP)=ACHSCOM
 ;
REG ;CHECK PAT FOR CURRENT COM
 ;TEST FOR NON-INDIAN BENEFICIARY, NON-INDIAN MEMBER OF IND. HOUSEHOLD AND UNSPECIFIED
 S ACHSTCD1=$O(^AUTTTRI("C","000",0)),ACHSTCD2=$O(^AUTTTRI("C",970,0)),ACHSTCD3=$O(^AUTTTRI("C",999,0))
 S ACHSPAT=0,ACHSCT=0
 F  S ACHSPAT=$O(^AUPNPAT(ACHSPAT)) Q:ACHSPAT'?1N.N  D
 .S ACHSCT=ACHSCT+1 I '$D(ZTQUEUED),ACHSCT#1000=0 W "."
 .;TEST TRIBAL ENROLLMENT
 .Q:'$D(^AUPNPAT(ACHSPAT,11))
 .S ACHSTRB=$P(^AUPNPAT(ACHSPAT,11),U,8)
 .Q:(ACHSTRB=ACHSTCD1)!(ACHSTRB=ACHSTCD2)!(ACHSTRB=ACHSTCD3)!(ACHSTRB="")
 .;TEST FOR DATE OF DEATH, QUIT IF DATE IS < BEG DATE OF FY
 .I $D(^DPT(ACHSPAT,.35)) Q:$P(^DPT(ACHSPAT,.35),U)<ACHSBFY
 .;TEST FOR CURRENT COMMUNITY AND DATE MOVE < THE LAST DAY OF THE FY
 .S ACHSCOMP=$P(^AUPNPAT(ACHSPAT,11),U,17),ACHSCCDT=$P(^(11),U,13)
 .Q:'ACHSCOMP
 .I $D(^TMP("ACHSRELG",$J,"COM",ACHSCOMP)),ACHSCCDT<ACHSEFY D SET Q
 .;THEN TEST PREVIOUS COMMUNITY FOR DATES WITH IN SELECTED FY
 .I $D(^AUPNPAT(ACHSPAT,51)) S ACHSQUIT=0 D
 ..S L=0  F  S L=$O(^AUPNPAT(ACHSPAT,51,L)) Q:L'?1N.N  D  Q:ACHSQUIT=1
 ...Q:L>ACHSEFY
 ...S ACHSCOMP=$P(^AUPNPAT(ACHSPAT,51,L,0),U,3)
 ...I ACHSCOMP,$D(^TMP("ACHSRELG",$J,"COM",ACHSCOMP)),(L>ACHSBFY&L<ACHSEFY) D SET S ACHSQUIT=1 Q
 ...I ACHSCOMP,$D(^TMP("ACHSRELG",$J,"COM",ACHSCOMP)),L<ACHSBFY D
 ....S L1=L,L1=$O(^AUPNPAT(ACHSPAT,51,L1)) I L1="" D SET S ACHSQUIT=1 Q
 ....I L1>ACHSBFY,L1<ACHSEFY D SET S ACHSQUIT=1 Q
 D PRINT
 ;
EXT ; Kill vars, close device, quit.
 I $D(IO("S")) X ACHSPPC
 E  D ^%ZISC
 D EN^XBVK("ACHS"),^ACHSVAR:'$D(ZTQUEUED)
 K ^TMP("ACHSRELG",$J)
 K DTOUT,DUOUT,ZTSK
 Q
 ;
SET ;SET THE DATA FOR ELIG PATIENT
 ;
 S ACHSCOM=^TMP("ACHSRELG",$J,"COM",ACHSCOMP),ACHSCST=$E(ACHSCOM,1,4)
 S ^TMP("ACHSRELG",$J,"CNTY",ACHSCST,ACHSCOM)=^TMP("ACHSRELG",$J,"CNTY",ACHSCST,ACHSCOM)+1
 S ^TMP("ACHSRELG",$J,"CNTY",ACHSCST,0)=^TMP("ACHSRELG",$J,"CNTY",ACHSCST,0)+1
 S ^TMP("ACHSRELG",$J,"TOTELG")=^TMP("ACHSRELG",$J,"TOTELG")+1
 ;Q:ACHSRTYP="S"
 S ^TMP("ACHSRELG",$J,"CNTY","T",ACHSCST,$P(^AUTTTRI(ACHSTRB,0),U),$P(^DPT(ACHSPAT,0),U),ACHSPAT)=$P(^AUTTCOM(ACHSCOMP,0),U)
 I '$D(^TMP("ACHSRELG",$J,"CNTY","TRB",ACHSTRB)) S ^TMP("ACHSRELG",$J,"CNTY","TRB",ACHSTRB)=0
 S ^TMP("ACHSRELG",$J,"CNTY","TRB",ACHSTRB)=^TMP("ACHSRELG",$J,"CNTY","TRB",ACHSTRB)+1
 Q
 ;
PRINT ; 
 S ACHST1=$$C^XBFUNC("CHS population Report")
 S ACHST2=$$C^XBFUNC("Tribal CHS Delivery Area: "_ACHSTRC)
 S ACHST3=$$C^XBFUNC("For Fiscal Year "_ACHSACFY),X3=0
 D BRPT^ACHSFU
 X:$D(IO("S")) ACHSPPO
 I ACHSRTYP="D" D HDR,DET G:$D(DUOUT)!$D(DTOUT) EXT D TOT
 S ACHSRTYP="S" D HDR,SUM,TOT
 G EXT Q
 ;
DET ;DETAILED REPORT
 S ACHSCST=0
 F  S ACHSCST=$O(^TMP("ACHSRELG",$J,"CNTY","T",ACHSCST)) Q:ACHSCST'?1N.N  D  Q:$D(DUOUT)!$D(DTOUT)
 .S ACHSCTY=$O(^AUTTCTY("C",ACHSCST,0)) D HDRD
 .S ACHSTRB=0 F  S ACHSTRB=$O(^TMP("ACHSRELG",$J,"CNTY","T",ACHSCST,ACHSTRB)) Q:ACHSTRB=""  D  Q:$D(DUOUT)!$D(DTOUT)
 ..D HDRD1
 ..S ACHSPAT=0 F  S ACHSPAT=$O(^TMP("ACHSRELG",$J,"CNTY","T",ACHSCST,ACHSTRB,ACHSPAT)) Q:ACHSPAT=""  D  Q:$D(DUOUT)!$D(DTOUT)
 ...S ACHSIEN=0 F  S ACHSIEN=$O(^TMP("ACHSRELG",$J,"CNTY","T",ACHSCST,ACHSTRB,ACHSPAT,ACHSIEN)) Q:ACHSIEN=""  D  Q:$D(DUOUT)!$D(DTOUT)
 ....W !?2,ACHSPAT,?50,^TMP("ACHSRELG",$J,"CNTY","T",ACHSCST,ACHSTRB,ACHSPAT,ACHSIEN)
 ....I $Y>ACHSBM D RTRN^ACHS Q:$D(DUOUT)!$D(DTOUT)  D HDR,HDRD,HDRD1
 .Q:$D(DUOUT)!$D(DTOUT)
 .W !!,"Total County = ",$J($P(^TMP("ACHSRELG",$J,"CNTY",ACHSCST,0),U),10),!,$$REPEAT^XLFSTR("=",79),!
 .I $Y>ACHSBM D RTRN^ACHS Q:$D(DUOUT)!$D(DTOUT)  D HDR,HDRD,HDRD1
 Q
SUM ;SUMMARY REPORT
 ;
 S ACHSCST=0
 F  S ACHSCST=$O(^TMP("ACHSRELG",$J,"CNTY",ACHSCST)) Q:ACHSCST'?1N.N  D
 .S ACHSCTY=$O(^AUTTCTY("C",ACHSCST,0))
 .W !,$P(^AUTTCTY(ACHSCTY,0),U),?45,$J($P(^TMP("ACHSRELG",$J,"CNTY",ACHSCST,0),U),10)
 .I $Y>ACHSBM D RTRN^ACHS Q:$D(DUOUT)!$D(DTOUT)  D HDR
 W !
 S ACHSTRB=0
 F  S ACHSTRB=$O(^TMP("ACHSRELG",$J,"CNTY","TRB",ACHSTRB)) Q:ACHSTRB'?1N.N  D
 .W !,$P(^AUTTTRI(ACHSTRB,0),U),?45,"TOTAL = ",$J($P(^TMP("ACHSRELG",$J,"CNTY","TRB",ACHSTRB),U),10)
 .I $Y>ACHSBM D RTRN^ACHS Q:$D(DUOUT)!$D(DTOUT)  D HDR
 Q
 ;
HDR ; Paginate.
 S ACHSPG=ACHSPG+1
 W @IOF,!!?19,"***  CONTRACT HEALTH MANAGEMENT SYSTEM  ***",!,ACHSUSR,?71,"Page",$J(ACHSPG,3),!,ACHSLOC,!,ACHST1,!,ACHST2,!,ACHSTIME,!,ACHST3
 I ACHSRTYP="S" D
 .W !,"CHSDA-County",?45,"Population Total"
 W !,$$REPEAT^XLFSTR("=",79),!
 Q
HDRD ;DETAILED HEADING
 W "CHSDA-County: ",$P(^AUTTCTY(ACHSCTY,0),U)
 Q
HDRD1 ;
 W !!,"Tribe of Enrollment: ",ACHSTRB
 W !,"Patient Name",?48,"Community"
 Q
TOT ;TOTALS
 W !!,"Total CHS Delivery Area =  ",$J(^TMP("ACHSRELG",$J,"TOTELG"),10)
 D RTRN^ACHS Q:$D(DUOUT)!$D(DTOUT)
 Q