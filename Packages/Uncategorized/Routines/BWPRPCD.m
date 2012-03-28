BWPRPCD ;IHS/ANMC/MWR - BW PRINT A PROCEDURE;15-Feb-2003 22:08;PLS
 ;;2.0;WOMEN'S HEALTH;**3,8**;MAY 16, 1996
 ;;* MICHAEL REMILLARD, DDS * ALASKA NATIVE MEDICAL CENTER *
 ;;  DISPLAY CODE FOR PRINTING PROCEDURES.  ENTRY POINTS FOR PRINTING
 ;;  INDIVIDUAL PROCEDURES AND ALL NEW PROCEDURES.
 ;;  PATCHED AT LINE LABEL START+28.
 ;
TOP(DA) ;EP
 ;---> PRINT PROCEDURE (NOT CALLED BY ANY OPTION).
 ;---> REQUIRED VARIABLE: DA=IEN OF PROCEDURE IN PROC FILE 9002086.1.
 ;
 D SETVARS^BWUTL5
 D DEVICE Q:BWPOP
 D START(DA)
 D ^%ZISC
 W @IOF
 Q
 ;
 ;
STARTQ ;EP
 ;---> ENTRY POINT FOR TASKMAN--CANNOT PASS PARAMETERS.
 ;---> REQUIRED VARIABLE: DA=IEN OF PROCEDURE IN PROC FILE 9002086.1.
 D START(DA)
 Q
 ;
 ;
START(DA) ;EP
 N BWPRMT1,BWTITLE,BWY,N,X
 D SETVARS^BWUTL5
 S BWSL="I $Y+6>IOSL D:BWCRT DIRZ^BWUTL3 Q:BWPOP  D HEADER4^BWUTL7"
 D TOPHEAD^BWUTL7,PCDVARS^BWUTL3(DA)
 ;---> BWCRT=1 IF OUTPUT IS TO SCREEN (SET BY TOPHEAD^BWUTL7).
 S BWTITLE1="* * *  WOMEN'S HEALTH: PROCEDURE PRINTOUT  * * *"
 D CENTERT^BWUTL5(.BWTITLE1)
 S BWPRMT1="   Press RETURN to continue or '^'to exit, or"
 S BWY=^BWPCD(DA,0),BWDFN=$P(BWY,U,2)
 ;
 U IO
 D HEADER4^BWUTL7 W:'BWCRT !
 W !?5,"Date of Procedure: ",$$TXDT^BWUTL5($P(BWY,U,12))
 W ?45,"PCC Date/Time: ",$$TXDT^BWUTL5($P(BWY,U,3))
 W !?4,"Date First Entered: ",$$TXDT^BWUTL5($P(BWY,U,19))
 W ?42,"First Entered By: " S X=$P(BWY,U,18) W $E($$PROV^BWUTL6,1,20)
 W ! W:$P(BWY,U,15)]"" ?43,"Radiology Case#: ",$P(BWY,U,15)
 W !?4,"Clinician/Provider: ",BWPROV
 W !?2,"Ward/Clinic/Location: " S X=$P(BWY,U,11) W $$HOSPLC^BWUTL6
 W !?2,"Health Care Facility: " S X=$P(BWY,U,10) W $$INSTTX^BWUTL6(X)
 W !?6,"Clinical History: "
 ;---> WRITE OUT CLINICAL HISTORY; IF TWO LINES, SPLIT BETWEEN WORDS.
 D
 .Q:'$D(^BWPCD(DA,3))
 .N L,Y
 .S Y=$P(^BWPCD(DA,3),U)
 .S L=56 I Y[" " F  Q:$E(Y,L)=" "  S L=L-1
 .;
 .;===> ANMC MODS BEGIN, IHS/ANMC/MWRZ 04/25/97
 .;---> Lengthened to display Radiology link message.   ;MWRZ 04/25/97
 .;W $E(Y,1,L),! W:$L(Y)>56 ?24,$E(Y,L+1,99)            ;MWRZ 04/25/97
 .W $E(Y,1,L),! W:$L(Y)>56 ?24,$E(Y,L+1,109)            ;MWRZ 04/25/97
 .;===> ANMC MODS END, IHS/ANMC/MWRZ 04/25/97
 ;
 W !?4,"Complete by (Date): ",$$TXDT^BWUTL5($P(BWY,U,13))
 W !?5,"Results/Diagnosis: ",BWRES
 W !," Sec Results/diagnosis: " W $$DIAG^BWUTL4($P(BWY,U,6))
 W ?57,"HPV: " W:$P(BWY,U,8) "YES"
 W !?16,"Status: " S Y=BWY W $$STATUS^BWUTL4
 ;
 ;---> IF THIS PROCEDURE HAS COLPOSCOPY-TYPE RESULTS, DISPLAY COLP PAGE.
 D:$$COLP^BWUTL4(DA)  Q:BWPOP
 .I BWCRT D DIRZ^BWUTL3 Q:BWPOP  D HEADER4^BWUTL7
 .S BWTITLE="-----  CLINICAL FINDINGS  -----"
 .D CENTERT^BWUTL5(.BWTITLE) W !!,BWTITLE
 .;
 .X BWSL Q:BWPOP  W !?2,"T-Zone Seen Entirely: "
 .W $S($P(BWY,U,21):"YES",$P(BWY,U,21)=0:"NO",1:"")
 .W ?54,"Multifocal: "
 .W $S($P(BWY,U,21):"YES",$P(BWY,U,21)=0:"NO",1:"")
 .;
 .X BWSL Q:BWPOP  W !?2,"Lesion Outside Canal: "
 .W $S($P(BWY,U,22):"YES",$P(BWY,U,22)=0:"NO",1:"")
 .W ?45,"Number of Quadrants: " W $P(BWY,U,24)
 .;
 .X BWSL Q:BWPOP  W !?5,"Satisfactory Exam: "
 .W $S($P(BWY,U,20):"YES",$P(BWY,U,20)=0:"NO",1:"")
 .X BWSL Q:BWPOP  W !?12,"Impression: "
 .W $$DIAG^BWUTL4($P(BWY,U,29))
 .;
 .X BWSL Q:BWPOP  S BWTITLE="-----  TISSUE PATHOLOGY  -----"
 .D CENTERT^BWUTL5(.BWTITLE) W !!,BWTITLE
 .;
 .X BWSL Q:BWPOP  W !?9,"ECC Dysplasia: "
 .S X=$P(BWY,U,25) W $$ECCDYS^BWUTL6
 .W ?57,"Margins Clear: "
 .W $S($P(BWY,U,27):"YES",$P(BWY,U,27)=0:"NO",1:"") X BWSL Q:BWPOP
 .X BWSL Q:BWPOP  W !?3,"Ectocervical Biopsy: "
 .W $$DIAG^BWUTL4($P(BWY,U,26))
 .W ?57,"Stage: "
 .W $$STAGE^BWUTL4($P(BWY,U,31)) X BWSL Q:BWPOP
 .X BWSL Q:BWPOP  W !?8,"STD Evaluation: "
 .W $$DIAG^BWUTL4($P(BWY,U,28))
 ;
 I BWCRT D DIRZ^BWUTL3 Q:BWPOP  D HEADER4^BWUTL7
 S BWTITLE="-----  TEXT OF LAB RESULT (received: "
 S BWTITLE=BWTITLE_$$SLDT2^BWUTL5($P(BWY,U,32))_")  -----  "
 D CENTERT^BWUTL5(.BWTITLE) W !!,BWTITLE,!
 S BWTITLE="-----  TEXT OF LAB RESULT (continued)  -----"
 D CENTERT^BWUTL5(.BWTITLE) S BWSUBH=BWTITLE
 S N=0
 F  S N=$O(^BWPCD(DA,1,N)) Q:'N!(BWPOP)  D
 .X BWSL Q:BWPOP
 .W !,^BWPCD(DA,1,N,0)
 S BWTITLE="-----  End of Procedure Printout  -----"
 D CENTERT^BWUTL5(.BWTITLE) W !!,BWTITLE
 K BWSUBH
 D:BWCRT&('BWPOP) DIRZ^BWUTL3 W @IOF
 Q
 ;
DEVICE ;EP
 ;---> GET DEVICE AND POSSIBLY QUEUE TO TASKMAN.
 S ZTRTN="STARTQ^BWPRPCD",ZTSAVE("DA")=""
 D ZIS^BWUTL2(.BWPOP,1)
 Q
 ;
JUSTPRT ;EP
 ;---> CALLED BY OPTION: "BW  PRINT INDIVIDUAL PROCEDURES".
 ;---> JUST PRINT AN INDIVIDUAL PROCEDURE.
 N DA,Y
 F  D  Q:Y<0
 .D TITLE^BWUTL5("PRINT A PROCEDURE")
 .D LKUPPCD^BWPROC(.Y)
 .Q:Y<0
 .;===> ANMC MODS BEGIN, IHS/ANMC/MWRZ 04/1/97
 .;---> Use Listmanager for display/print.
 .;---> NEXT TWO LINES CHANGED TO INCLUDE ^BWUTL5  ;IHS/ANMC/MWR 5/18/98
 .I $$AGENCY^BWUTL5(DUZ(2))="i" D  Q
 ..S DA=+Y D VIEWR^XBLM("START^BWPRPCD(DA)")
 .D TOP(+Y)
 .;===> ANMC MODS BEGIN, IHS/ANMC/MWRZ 04/1/97
 D EXIT
 Q
 ;
PRTNEW ;EP
 ;---> CALLED BY OPTION: "BW PRINT ALL NEW PROCEDURES".
 ;---> PRINT ALL PROCEDURES WITH A STATUS OF "NEW" (NEW UPLOADED
 ;---> LAB RESULTS).
 D TITLE^BWUTL5("PRINT ALL ""NEW"" PROCEDURES")
 S ZTRTN="DEQUEUE^BWPRPCD"
 D ZIS^BWUTL2(.BWPOP,1)
 Q:BWPOP
 ;
DEQUEUE ;EP
 ;---> FOR TASKMAN QUEUE OF PRINTOUT.
 S N=0
 F  S N=$O(^BWPCD("S","n",N)) Q:'N  D
 .D START(N)
 D ^%ZISC,EXIT
 Q
 ;
EXIT ;EP
 D KILLALL^BWUTL8
 Q
