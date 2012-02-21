ONCOPA1 ;Hines OIFO/GWB - [PA Print Complete Abstract (132c)]; 08/25/97
 ;;2.11;ONCOLOGY;**13,15,16,18,28,33,34,36,40,41,42,43,44,45**;Mar 07, 1995
 ;Replaces print templates ONCOX1-X11.
 K IOP,%ZIS S %ZIS="MQ" W ! D ^%ZIS K %ZIS,IOP G:POP EXIT
 I $D(IO("Q")) S ONCOLST="ONCOIEN^PTIEN^STARS^LENGTH^TITLE^PRTPCE^ONCODA^EVADS" D TASK G EXIT
 U IO D PRINT D ^%ZISC K %ZIS,IOP G EXIT
 ;
PRINT ;Print
 Q:$G(ONCOIEN)=""
 W @IOF
 S (IEN,D0)=ONCOIEN,PTIEN=$P($G(^ONCO(165.5,IEN,0)),U,2)
 S PG=0,EX="",LINE=$S(IOST?1"C".E:IOSL-2,1:IOSL-6)
 S STARS="******************************************************************************"
 S DATEDX=$P($G(^ONCO(165.5,IEN,0)),U,16)
 D NOW^%DTC S Y=% D DD^%DT S PRTDATE=Y
 K DIQ S DIC="^ONCO(160,",DIQ(0)="C"
 S DR=".111:.131;2;7:10;13;18.9:21;22.9:29;38:44;48;50;51;52;61;55;56"
 S DA=PTIEN,DIQ="ONCAB" D EN^DIQ1
 K DIQ S DIC="^ONCO(165.5,",DIQ(0)="C"
 S DR=".01:.07;1.2;2:2.4;3;3.5:19;20.1;22:35.1;37:40.2;41;49:59;62:67;70:71.3;74:79;83;85:92;95;100;101;108;117:130;132;133;137:146;200;346;363;363.1;442;443;560;787;50.2;361;623;684;1010;153;153.1;435;149;151;154;155;170;171:192;711:713;809"
 S DA=ONCOIEN,DIQ="ONCAB" D EN^DIQ1
 K DIQ S DIC="^ONCO(165.5,",DIQ(0)="IE"
 S DR="29.2;30.2;29.1;31.1;32.1;32;33;34.3;34.4;44.1;44.2;44.3;44.4;44.5;44.6;160;161;162;163;164;165;166;167;168;148:148.4;15;21"
 S DA=ONCOIEN,DIQ="ONCAB" D EN^DIQ1
 K DIQ S DIC="^ONCO(165.5,",DIQ(0)="C"
 S DR="72",DA=ONCOIEN,DR(165.572)=".01;.02;.03;.031;.032",DIQ="ONCAB"
 F SR=0:0 S SR=$O(^ONCO(165.5,IEN,23,SR)) Q:SR'>0  D
 .S DA(165.572)=SR D EN^DIQ1 Q
 K DIQ S DIC="^ONCO(165.5,",DIQ(0)="C"
 S DR="60",DA=ONCOIEN,DR(165.51)=".01:2;33:37",DIQ="ONCAB"
 F SCT=0:0 S SCT=$O(^ONCO(165.5,IEN,4,SCT)) Q:SCT'>0  D
 .S DA(165.51)=SCT D EN^DIQ1 Q
 K DIQ S DIC="^ONCO(160,",DIQ(0)="C"
 S DR="44",DA=PTIEN,DR(160.044)=".01:1",DIQ="ONCAB"
 F CHST=0:0 S CHST=$O(^ONCO(160,PTIEN,9,CHST)) Q:CHST'>0  D
 .S DA(160.044)=CHST D EN^DIQ1 Q
 S PATNAME=$G(ONCAB(165.5,IEN,.02)),SSAN=$G(ONCAB(160,PTIEN,2))
 S NAME="CANCER REGISTRY ABSTRACT" D FORMAT
 S CRA=TITLE W !!,TITLE
 W !!?21,$E(ONCAB(165.5,IEN,.03),1,26)
 W "    ACOS #:  ",ONCAB(165.5,IEN,67)
 W ?76,"Print Date:  ",PRTDATE D P Q:EX=U
 W !,"      Patient Name:  ",ONCAB(165.5,IEN,.02),?76,"SSN:  ",ONCAB(160,PTIEN,2) D P Q:EX=U
 S DOB="",VRBLPTR=$P($G(^ONCO(160,PTIEN,0)),U,1) I VRBLPTR'="" D
 .S FILE=U_$P(VRBLPTR,";",2)_$P(VRBLPTR,";",1)_",0)"
 .S Y=$S($D(@FILE):$P(@FILE,U,3),1:"") I Y'="" D DD^%DT S DOB=Y Q
 W !,"      Home Address:  ",ONCAB(160,PTIEN,.119) D P Q:EX=U
 W !,"                     ",ONCAB(160,PTIEN,.116) D P Q:EX=U
 W !,"            County:  ",ONCAB(160,PTIEN,.12) D P Q:EX=U
 W !,"               Sex:  ",$E(ONCAB(160,PTIEN,10),1,14),?44,"Race:  ",$E(ONCAB(160,PTIEN,8),1,21),?76,"Ethnicity:  ",ONCAB(160,PTIEN,9) D P Q:EX=U
 W !,"     Date of Birth:  ",DOB
 W ?38," Age at DX:  ",ONCAB(165.5,IEN,4) D P Q:EX=U
 ;
CI ;Cancer Identification
 S NAME="CANCER IDENTIFICATION" D FORMAT
 W !!,TITLE
 S NODE2=$G(^ONCO(165.5,IEN,2))
 S COC=$P($G(^ONCO(165.5,IEN,0)),U,4)
 W !!,"       Accession Number: ",ONCAB(165.5,IEN,.05),?38,"Accession Year:  ",ONCAB(165.5,IEN,.07),?76,"Sequence Number:  ",ONCAB(165.5,IEN,.06) D P Q:EX=U
 W !,"                    Date Dx: ",ONCAB(165.5,IEN,3) D P Q:EX=U
 W !,"                Dx Facility: ",ONCAB(165.5,IEN,5) D P Q:EX=U
 W !,"      Date of First Contact: ",ONCAB(165.5,IEN,155) D P Q:EX=U
 W !,"              Class of Case: ",ONCAB(165.5,IEN,.04) D P Q:EX=U
 I COC=1,$G(EVADS)'="N" D
 .W !,"     Date of First Symptoms: ",ONCAB(165.5,IEN,171) D P Q:EX=U
 .W !,"  Date Start Workup Ordered: ",ONCAB(165.5,IEN,172) D P Q:EX=U
 .W !,"        Date Workup Started: ",ONCAB(165.5,IEN,173) D P Q:EX=U
 W !,"   Type of Reporting Source: ",ONCAB(165.5,IEN,1.2) D P Q:EX=U
 W !,"                    Site/Gp: ",ONCAB(165.5,IEN,.01) D P Q:EX=U
 W !,"          Primary Site Code: ",ONCAB(165.5,IEN,20.1),"  "
 S TOP=$P(NODE2,U,1) I TOP'="" W $P(^ONCO(164,TOP,0),U,1) D P Q:EX=U
 W !,"    Text-Primary Site Title: ",ONCAB(165.5,IEN,100) D P Q:EX=U
 W !,"                 Laterality: ",ONCAB(165.5,IEN,28) D P Q:EX=U
 S HIST=$$HIST^ONCFUNC(IEN)
 W !,"                  Histology: ",ONCAB(165.5,IEN,HSTFLD) D P Q:EX=U
 W !,"       Text-Histology Title: ",ONCAB(165.5,IEN,101) D P Q:EX=U
 W:TOP=67619 !,"            Gleason's Score: ",ONCAB(165.5,IEN,623)
 W:TOP=67619 !,"                        PSA: ",ONCAB(165.5,IEN,684)
 W !,"       Grade/Diff/Cell Type: ",ONCAB(165.5,IEN,24),"  "
 S GR=$P(NODE2,U,5) I GR'="" W $P(^ONCO(164.43,GR,0),U,2) D P Q:EX=U
 W !,"            AFIP Submission: ",ONCAB(165.5,IEN,83) D P Q:EX=U
 W !,"    Diagnostic Confirmation: ",ONCAB(165.5,IEN,26) D P Q:EX=U
 W:TOP=67220 !,"                Hepatitis C: ",ONCAB(165.5,IEN,1010)
 S TM1=$$PRINT^ONCOTM(IEN,1)
 I TM1["UMOR" S $E(TM1,2,5)="umor" I TM1["ARKER" S $E(TM1,8,12)="arker"
 S TM2=$$PRINT^ONCOTM(IEN,2)
 I TM2["UMOR" S $E(TM2,2,5)="umor" I TM2["ARKER" S $E(TM2,8,12)="arker"
 S TM3=$$PRINT^ONCOTM(IEN,3)
 I TM3["UMOR" S $E(TM3,2,5)="umor" I TM3["ARKER" S $E(TM3,8,12)="arker"
 S LEN=$L(TM1) W !?(27-LEN),TM1,": ",ONCAB(165.5,IEN,25.1) D P Q:EX=U
 S LEN=$L(TM2) W !?(27-LEN),TM2,": ",ONCAB(165.5,IEN,25.2) D P Q:EX=U
 S LEN=$L(TM3) W !?(27-LEN),TM3,": ",ONCAB(165.5,IEN,25.3) D P Q:EX=U
 W !,"         Referring Facility: ",ONCAB(165.5,IEN,6) D P Q:EX=U
 W !,"          Transfer Facility: ",ONCAB(165.5,IEN,7) D P Q:EX=U
 W !,"Presentation at Cancer Conf: ",ONCAB(165.5,IEN,120) D P Q:EX=U
 W !,"  Date of Cancer Conference: ",ONCAB(165.5,IEN,121) D P Q:EX=U
 W !,"         Casefinding Source: ",ONCAB(165.5,IEN,21,"E") D P Q:EX=U
 I COC=1,$E(TOP,3,4)=34,$G(EVADS)'="N" D
 .W !,"     Blood in Sputum Per Pt: ",ONCAB(165.5,IEN,174.1)," ",ONCAB(165.5,IEN,174) D P Q:EX=U
 .W !,"                    Dyspnea: ",ONCAB(165.5,IEN,186.1)," ",ONCAB(165.5,IEN,186) D P Q:EX=U
 .W !,"            Increased Cough: ",ONCAB(165.5,IEN,187.1)," ",ONCAB(165.5,IEN,187) D P Q:EX=U
 .W !,"                      Fever: ",ONCAB(165.5,IEN,188.1)," ",ONCAB(165.5,IEN,188) D P Q:EX=U
 .W !,"               Night Sweats: ",ONCAB(165.5,IEN,189.1)," ",ONCAB(165.5,IEN,189) D P Q:EX=U
 .W !,"         Weight Loss Per Pt: ",ONCAB(165.5,IEN,190) D P Q:EX=U
 .W !,"                Chest X-ray: ",ONCAB(165.5,IEN,175.1)," ",ONCAB(165.5,IEN,175) D P Q:EX=U
 .W !,"                    CT Scan: ",ONCAB(165.5,IEN,176.1)," ",ONCAB(165.5,IEN,176) D P Q:EX=U
 .W !,"               Bronchoscopy: ",ONCAB(165.5,IEN,177.1)," ",ONCAB(165.5,IEN,177) D P Q:EX=U
 .W !,"            Mediastinoscopy: ",ONCAB(165.5,IEN,178.1)," ",ONCAB(165.5,IEN,178) D P Q:EX=U
 .W !,"                   PET Scan: ",ONCAB(165.5,IEN,179.1)," ",ONCAB(165.5,IEN,179) D P Q:EX=U
 I COC=1,($E(TOP,3,4)=18)!(TOP=67199)!(TOP=67209),$G(EVADS)'="N" D
 .W !,"    Ulcerative Colitis (UC): ",ONCAB(165.5,IEN,191) D P Q:EX=U
 .W !,"Familial Adenomatous Polyps: ",ONCAB(165.5,IEN,711) D P Q:EX=U
 .W !,"                      HNPCC: ",ONCAB(165.5,IEN,712) D P Q:EX=U
 .W !,"            Crohn's Disease: ",ONCAB(165.5,IEN,809) D P Q:EX=U
 .W !," Inflammatory Bowel Disease: ",ONCAB(165.5,IEN,713) D P Q:EX=U
 .W !,"            Sporadic Polyps: ",ONCAB(165.5,IEN,192) D P Q:EX=U
 .W !," Change Bowel Habits Per Pt: ",ONCAB(165.5,IEN,180.1)," ",ONCAB(165.5,IEN,180) D P Q:EX=U
 .W !,"    Fecal Occult Blood Test: ",ONCAB(165.5,IEN,181.1)," ",ONCAB(165.5,IEN,181) D P Q:EX=U
 .W !,"               Barium Enema: ",ONCAB(165.5,IEN,182.1)," ",ONCAB(165.5,IEN,182) D P Q:EX=U
 .W !,"              Sigmoidoscopy: ",ONCAB(165.5,IEN,183.1)," ",ONCAB(165.5,IEN,183) D P Q:EX=U
 .W !,"                Colonoscopy: ",ONCAB(165.5,IEN,185.1)," ",ONCAB(165.5,IEN,185) D P Q:EX=U
 .W !,"       CT of Abdomen/Pelvis: ",ONCAB(165.5,IEN,184.1)," ",ONCAB(165.5,IEN,184) D P Q:EX=U
 .W !,"                   PET Scan: ",ONCAB(165.5,IEN,179.1)," ",ONCAB(165.5,IEN,179) D P Q:EX=U
 ;
 I IOST?1"C".E W ! K DIR S DIR(0)="E",DIR("A")="Enter RETURN to continue with this abstract" D ^DIR Q:'Y  D HDR G PA1A
 D P Q:EX=U
PA1A D ^ONCOPA1A
 ;
EXIT K CHF,CHST,CRA,DOB,DXDT,EX,FHDT,FHIEN,FHZN,FILE,FLG,FM,FOLH,FR,GR
 K HIST,IEN,J,LEN,LENGTH,LINE,NAME,NF,NODE2,NOK,NUM,ONCAB,ONCOIEN,OTHPRI
 K PATNAME,PG,PRTDATE,PRZN,PTIEN,QS,RCDT,SCT,SITE,SR,SSAN,ST,STARS
 K TITLE,TM1,TM2,TM3,TOP,TSTAT,TX,VRBLPTR,VS,XDX,XD1
 Q
P ;
 I $Y>(IOSL-10) D  Q:EX=U  W !
 .I IOST?1"C".E W ! K DIR S DIR(0)="E",DIR("A")="Enter RETURN to continue with this abstract" D ^DIR I 'Y S EX=U Q
 .D HDR Q
 Q
FORMAT ;
 S LENGTH=$L(NAME),NUM=(((132-LENGTH)/2)\1)-10
 S TITLE="     "_$E(STARS,1,NUM)_"     "_NAME_"     "_$E(STARS,1,NUM)
 Q
TASK ;If report is queued
 K IO("Q"),ZTUCI,ZTDTH,ZTIO,ZTSAVE
 S ZTRTN="PRINT^ONCOPA1",ZTREQ="@",ZTSAVE("ZTREQ")=""
 S ZTDESC="Print Complete Abstract"
 F RK=1:1 S RK1=$P(ONCOLST,U,RK) Q:RK1=""  S ZTSAVE(RK1)=""
 D ^%ZTLOAD D ^%ZISC U IO W !,"Report Queued",!
 K RK,RK1,ONCOLST,ZTSK Q
HDR ;Header
 W @IOF S PG=PG+1
 W CRA,!
 W ?5," Patient Name:  ",PATNAME,?84,"SSN:  ",SSAN,!
 Q
MULT ;Entry point from routine ONCOPMA. This is for printing MULTIPLE
 ;abstracts (option ABS...MA...3). The ONCOPM routines do the device
 ;prompt code so we don't need it here, just the following.
 ;Also called from PCEPRT2^ONCOGEN. This is for printing all PCE's and
 ;attached abstracts for a particular site (option ABS...MA...5).
 ;ONCOGEN does the device prompt code so it is not needed here.
 I $D(IO("Q")) S ONCOLST="ONCOIEN^PTIEN^STARS^LENGTH^TITLE^PRTPCE^ONCODA" D TASK G EXIT
 U IO D PRINT K %ZIS,IOP G EXIT
 Q
