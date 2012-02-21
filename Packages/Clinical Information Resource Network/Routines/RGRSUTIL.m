RGRSUTIL ;ALB/RJS-MPI/PD UTILITIES ;03/12/96
 ;;1.0;CLINICAL INFO RESOURCE NETWORK;**1,3,19**;30 Apr 99
EXCEPT ;This entry point identifies exception notifications
 ;Check the mail group RG CIRN DEMOGRAPHIC ISSUES to see if 
 ;this user should be notified.
 N DIC,X,Y
 S DIC="3.8",DIC(0)="Z",X="RG CIRN DEMOGRAPHIC ISSUES"
 D ^DIC
 S RGMG=$P($G(Y),"^",1) Q:RGMG<1
 D GETS^DIQ(3.8,+RGMG_",","2*","I","RGAR") S RGNOTFY=0,RGX="" F  S RGX=$O(RGAR(3.81,RGX)) Q:RGX=""  I RGAR(3.81,RGX,.01,"I")=$G(DUZ) S RGNOTFY=1
 ;identify existence of unresolved exceptions
 I RGNOTFY=1 S RGNOTFY=$$CUREX^RGEX01()
 I RGNOTFY=1 D SET^XUS1A("!Use the MPI/PD Exception Handling option on the Message Exception Menu to resolve exceptions.")
 K RGTYPE,RGMG,RGNOTFY,RGAR,RGX,RGEX
 Q
SEG(SEGMENT,PIECE,CODE) ;Return segment from RGDC array and kill node
 N RGNODE,RGDATA,RGDONE,RGC K RGDONE
 I '$D(RGC) S RGC=$E(HL("ECH"))
 S RGNODE=0
 F  S RGNODE=$O(RGDC(RGNODE)) Q:RGNODE=""!($D(RGDONE))  D
 .S RGDATA=RGDC(RGNODE)
 .I ($P(RGDATA,HL("FS"),1)=SEGMENT)&($P($P(RGDATA,HL("FS"),PIECE),RGC,1)=CODE) S RGDONE=1 K RGDC(RGNODE)
 Q:$D(RGDONE) $G(RGDATA)
 Q ""
SEG1(SEGMENT,PIECE,CODE) ;Return segment from RGDC array 
 N RGNODE,RGDATA,RGDONE,RGC K RGDONE
 I '$D(RGC) S RGC=$E(HL("ECH"))
 S RGNODE=0
 F  S RGNODE=$O(RGDC(RGNODE)) Q:RGNODE=""!($D(RGDONE))  D
 .S RGDATA=RGDC(RGNODE)
 .I ($P(RGDATA,HL("FS"),1)=SEGMENT)&($P($P(RGDATA,HL("FS"),PIECE),RGC,1)=CODE) S RGDONE=1
 Q:$D(RGDONE) $G(RGDATA)
 Q ""
ERROR(CODE) ;**THIS ENTRY POINT IS NO LONGER USED**
 Q ""
INITIZE ;Initialize RGDC array with incoming message
 N I,J,X
 F I=1:1 X HLNEXT Q:HLQUIT'>0  S RGDC(I)=HLNODE,J=0  F  S J=$O(HLNODE(J)) Q:'J  S RGDC(I,J)=HLNODE(J)
 Q
SSNDFN(SSN) ;Input ssn output DFN
 N DFN
 Q:$G(SSN)="" -1
 S DFN=$O(^DPT("SSN",+SSN,0))
 Q:$L(DFN) DFN
 S DFN=$O(^DPT("SSN",SSN,0))
 Q:$L(DFN) DFN
 Q -1
 ;
LINE() ; Return a dashed line.       
 Q $TR($J("",80)," ","-")
 ;
PAUSE() ; Pause for CRT output.
 ;  Input:   IOST, IOSL
 ;  Output:  0  --  Continue to display output
 ;           1  --  Quit
 Q:$E(IOST,1,2)'["C-" 0
 N DIR,DIRUT,DTOUT,DUOUT,RGJ
 F RGJ=$Y:1:(IOSL-4) W !
 S DIR(0)="E" D ^DIR
 Q $D(DIRUT)!($D(DUOUT))
 ;
DIAG(X) ; Return a string for diagnoses.
 ;  Input:   X  -  Code for type of diagnosis (Primary, etc.)
 ;  Output:  Descriptive string, i.e., "Primary", etc.
 Q $S($G(X)="":"Unknown",X="A":"Additional",X="P":"Primary",X="S":"Secondary",X="T":"Tertiary",1:"Unknown")
 ;
ORD(X) ; Return a string for orders.
 ;  Input:   X  -  Code for type of order (Lab, etc.)
 ;  Output:  Descriptive string, i.e., "Lab", etc.
 Q $S($G(X)="":"Unknown",X="L":"Lab",X="R":"Radiology",1:"Unknown")
 ;
UPDTFLD(FILE,FLD,ANS1,ANS2) ; Returns the correct field answer
 ;DLR - Added to prevent the overwriting the last four in ZIP with null
 ; input:  FILE  - file number (ex. 2 PATIENT)
 ;         FLD  -  field number (ex. .1112 ZIP+4)
 ;         ANS1 -  existing field value
 ;         ANS2 -  incoming value
 I (FILE=2)&(FLD=.1112) I $E(ANS1,1,5)=$E(ANS2,1,5),($L(ANS2)=5) Q ANS1
 Q ANS2
 ;
SSNINT(SSN) ;
 Q:$G(SSN)="" ""
 Q $TRANSLATE(SSN,"-","")
