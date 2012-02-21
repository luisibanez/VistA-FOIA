ORWDBA10 ; SLC/GDU - Billing Awareness - Phase I [11/24/04 13:42]
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**195**;Dec 17, 1997
 ;Clinical Indicator Data Capture By Provider Parameter Module
 ;This program will assign the CIDC parameter to all active clinicians 
 ;who do not already have it assigned to them. The CIDC functionality
 ;will be enabled or disabled at time of CIDC parameter assignment
 ;based on user selection passed to this program.
 ;External Variable:
 ;  CIDC        Clinical Indicator Data Capture
 ;              A value of E for enable CIDC functionality.
 ;              A value of D for disable CIDC functionality.
 ;Internal Variables:
 ;  CNT         Counter variable, used to build temporary global
 ;  DIR         Input array variable for ^DIR
 ;  DT          Standard Fileman/Kernel variable for current date
 ;              DT is set, not newed or killed
 ;  DTOUT       Timeout indicator, output variable of ^DIR
 ;  DUOUT       Up arrow indicator, output variable of ^DIR
 ;  OREM        Error Message, output variable for XPAR
 ;  IEN         Internal Entry Number
 ;  LIST        Input variable of XPAR where output ENVAL^XAR
 ;              will be stored
 ;  PTD         Provider Termination Date
 ;  VAL         Input variable of XPAR
 ;              A value of 1 will enable CIDC functionality
 ;              A value of 0 will disable CIDC functionality
 ;  X           Work variable
 ;  Y           Processed user selection, output variable of ^DIR
 ;External References
 ;  ^DIR        DBIA 10026
 ;  ADD^XPAR    DBIA 2263
 ;  ENVAL^XPAR  DBIA 2263
 ;
EN(CIDC) ;Entry point for this program
 N CNT,DIR,DTOUT,DUOUT,OREM,IEN,LIST,PTD,VAL,X,Y
 K ^TMP($J,"OR","CIDC")
 S DT=$$DT^XLFDT
 ;Get list of clinicians with the CIDC functionality parameter assigned
 ;to them.
 S OREM="",LIST="^TMP($J,""OR"",""CIDC"",""A"")"
 D ENVAL^XPAR(LIST,"OR BILLING AWARENESS BY USER",1,.OREM,1)
 ;Build list of active clinicians with the CIDC functionality parameter 
 ;not assigned to them.
 S IEN="",(CNT,^TMP($J,"OR","CIDC","U",0))=0
 F  S IEN=$O(^XUSEC("PROVIDER",IEN)) Q:IEN=""  D
 . I $D(^TMP($J,"OR","CIDC","A",IEN_";VA(200,",1))=1 Q
 . I $$GET1^DIQ(200,IEN,7)="YES" Q
 . S PTD=$$GET1^DIQ(200,IEN,9.2,"I")
 . I PTD'="",(PTD=DT)!(PTD<DT) Q
 . S CNT=CNT+1
 . S ^TMP($J,"OR","CIDC","U",0)=CNT
 . S ^TMP($J,"OR","CIDC","U",CNT)=IEN_";VA(200,"
 I ^TMP($J,"OR","CIDC","U",0)=0 G APA
 ;Build and display user interface
 S DIR(0)="SX^;"_$P($T(OY),";",3)
 S DIR(0)=DIR(0)_$S(CIDC="E":$P($T(OYE),";",3),1:$P($T(OYD),";",3))_";"
 S DIR(0)=DIR(0)_$P($T(ON),";",3)
 S DIR(0)=DIR(0)_$S(CIDC="E":$P($T(ONE),";",3),1:$P($T(OND),";",3))
 S DIR("A",1)=^TMP($J,"OR","CIDC","U",0)_" "_$P($T(A1),";",3)
 S DIR("A",2)=$S(CIDC="E":$P($T(A2E),";",3),1:$P($T(A2D),";",3))
 S DIR("A",3)=$P($T(A3),";",3)
 S DIR("A")=$P($T(A4),";",3)
 S DIR("?",1)=$P($T(HY),";",3)
 S DIR("?",1)=DIR("?",1)_$S(CIDC="E":$P($T(HYE),";",3),1:$P($T(HYD),";",3))
 S DIR("?")=$P($T(HN),";",3)
 S DIR("?")=DIR("?")_$S(CIDC="E":$P($T(HNE),";",3),1:$P($T(HND),";",3))
 D SCRHDR,^DIR K DIR
 ;Process user's selection
 ;If the user selects no, times out, or enters "^" quit program
 I Y="NO"!($D(DTOUT))!($D(DUOUT)) Q
 ;Process the mass CIDC parameter assignment and enable/disable CIDC
 ;functionality.
 D SCRHDR
 W !!,$S(CIDC="E":$P($T(EP),";",3),1:$P($T(DP),";",3))
 S VAL=$S(CIDC="E":1,1:0)
 F X=1:1:^TMP($J,"OR","CIDC","U",0) D
 . W "."
 . D ADD^XPAR(^TMP($J,"OR","CIDC","U",X),"OR BILLING AWARENESS BY USER",1,VAL,.OREM)
 ;Alert the user the mass CIDC parameter assignment and the 
 ;enabling/disabling CIDC functionality is done.
 S DIR("A")=$S(CIDC="E":$P($T(EC),";",3),1:$P($T(DC),";",3)) G EXIT
APA ;All Providers Assigned
 S DIR("A")=$P($T(ALL),";",3)
 D SCRHDR W !!
EXIT ;Exit point of this routine
 S DIR(0)="E"
 D ^DIR K DIR
 K ^TMP($J,"OR","CIDC")
 Q
 ;
SCRHDR ;Screen Header
 W:$D(IOF) @IOF
 W !,$P($T(SH),";",3)
 W !,$S(CIDC="E":$P($T(SHE),";",3),1:$P($T(SHD),";",3))
 Q
SH ;;Enable Clinical Indicator Data Capture By Provider Parameter Management
SHE ;;Assign/Enable Parameter For All Active Providers Option
SHD ;;Assign/Disable Parameter For All Active Providers Option
OY ;;YES:Enter YES to begin process of assign/
ON ;;NO:Enter NO to cancel process of assign/
OYE ;;enable
ONE ;;enable and quit
OYD ;;disable
OND ;;disable and quit
A1 ;;active providers do not have this parameter assigned to them.
A2E ;;You have selected to assign the parameter and enable Clinical Indictor
A2D ;;You have selected to assign the parameter and disable Clinical Indicator
A3 ;;Data Capture for all of these providers. This may take some time.
A4 ;;Are you sure you want to do this? (YES/NO - must be all cap)
HY ;;Enter YES to begin the assign/
HN ;;Enter No to cancel the assign/
HYE ;;enable process.
HNE ;;enable process and quit.
HYD ;;disable process.
HND ;;disable process and quit.
EP ;;Now assigning CIDC parameter and enabling the functionality.
EC ;;CIDC parameter assignment and functionality enabling complete.
DP ;;Now assigning CIDC parameter and disabling the functionality.
DC ;;CIDC parameter assignment and functionality disabling complete.
ALL ;;All active providers have the CIDC parameter assigned to them
