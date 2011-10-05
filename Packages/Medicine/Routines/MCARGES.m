MCARGES ;WISC/TJK-SCREEN ENTER/EDIT-ENDOSCOPY,HEMATOLOGY,PACEMAKER ;4/7/97  14:14
 ;;2.3;Medicine;**8,15,16**;09/13/1996
START ;
 K EXIT,MCDEMO,MCESFL S MCESFL=1
 D ENTER I '$D(MCFILE)!('$D(MCARGDA)) D EXIT Q
 I '$D(^MCAR(MCFILE,MCARGDA,0)),$D(MCBACK) D BACKSS^MCESEDT K MCBACK S EXIT=1
 K:'$D(^MCAR(MCFILE,MCARGDA,0)) MCESFL D EXIT
 Q
ENTER ; edit a GI procedure record and display/edit history if selected
 D DPT^MCARGE I $D(EXIT) Q
 I MCARCODE="G"!(MCARCODE="P") S MCDEMO=1 D DEMO^MCARGE
 ;if user wants to edit patient history in patient file
 I $D(MCDEMO) D
 .S DJSC="MCGDEM",DIC="MCAR(690,",DJDN=DFN,DIC(0)="EQ" D EN^MCARD
 .S:$D(DUOUT) EXIT=1
 .I '$D(EXIT),$D(^DIC(120.8)) N VADM D EN2^GMRAPEM0
 .K MCDEMO
 .;restore the procedure record number after patient lookup in 690
 .S MCARGDA=+$G(MCARDA)
 Q:$D(EXIT)  D EDIT Q
EDIT D:MCARCODE="G" SETVAR^MCARGE K DIC
 S DJSC=MCEPROC
 S DJDN=MCARGDA,DIC="^MCAR("_MCFILE_","
 S DIC(0)="EQ"
 D IN^MCEO
 I $D(DTOUT)!$D(DUOUT) S EXIT=1 Q
 D EN^MCARD
 I $D(DUOUT) S EXIT=1 Q
 I '$D(^MCAR(MCFILE,MCARGDA,0)) S EXIT=1 Q
 S MCDFLAG="" I MCARGNAM'="NON-ENDO" D ^MCARGD
 D OUT^MCEO
 Q
CONSULT ;
 K DIC S MCDFLAG="" D CONSULT^MCARGE
 G EXIT:$D(DTOUT),EXIT:$D(DUOUT) I $D(Y),Y<0 G EXIT
 S DJSC=$S($G(MCBS)=1:"MCCONSULTBR",1:"MCCONSULT")
 S DIC="^MCAR(699.5,",DJDN=MCARGDA,DIC(0)="EQ",MCFILE=699.5 D IN^MCEO G EXIT:$D(DTOUT)!$D(DUOUT) D EN^MCARD,OUT^MCEO
EXIT ;
 I '$D(DTOUT),'$D(DUOUT),$D(MCESFL),$D(MCFILE),$D(MCARGDA),MCESON D:MCESFL=0 ESRC^MCESSCR(MCFILE,MCARGDA)
 K AV,MULTI,EXIT,X,MCPRO,MCEPROC,MCPATNM D EXIT^MCARGE
 Q
GENEX(MCARGDA,GENEX) ;Check and resolve non-associated procedures
 I ('$P(^MCAR(699.5,MCARGDA,0),U,2)!'$P(^(0),U,6)) S DIK="^MCAR(699.5,",DA=MCARGDA,GENEX=1 D ^DIK Q
 Q
GENERIC ;Generic Medicine Enter/Edit
 W !,"GENERIC EDIT"
 N GENEX S GENEX=0
 D MCEPROC^MCARE,^MCAREH
 S DIC="^MCAR(699.5,",DIC(0)="AEQLM",(DLAYGO,DIDEL,MCFILE)=699.5,DIC("S")="I '$P(^MCAR(699.5,+Y,0),U,3)"
 S DR=".01;.02;.05" D ^DIC G EXIT:Y<0  S MCARGDA=+Y,MCESFL=0
 D GENEX(MCARGDA,.GENEX) G:GENEX EXIT
 ;    allow user to edit .01 field
 I MCESON,("125"'[$$ESTONUM^MCESSCR(MCFILE,MCARGDA)) D ESRC^MCESSCR(MCFILE,.MCARGDA) G:$D(MCBACK) SETUP K DIC Q
SUPS S DIE="^MCAR(699.5,",DA=MCARGDA,DR=".01;.02;.05" D ^DIE
 I $D(DA) D GENEX(MCARGDA,.GENEX) G:GENEX EXIT
 I $D(DTOUT)!$D(DUOUT)!'$D(DA) G EXIT
 S MCARGNUM=$P(^MCAR(699.5,MCARGDA,0),U,6),DFN=$P(^(0),U,2)
 S DJSC=MCEPROC
 S MCARGNAM=$P(^MCAR(699.5,MCARGDA,0),U),DJDN=MCARGDA,DIC="^MCAR(699.5,",DIC(0)="EQ"
 S MCHOLD=MCARGDA
 ;D IN^MCEO G EXIT:$D(DTOUT)!$D(DUOUT) D EN^MCARD S MCARGDA=MCHOLD D GENEX(MCARGDA,.GENEX) K MCHOLD G:GENEX EXIT
 D IN^MCEO G EXIT:$D(DUOUT) D EN^MCARD S MCARGDA=MCHOLD D GENEX(MCARGDA,.GENEX) K MCHOLD  ;MC*2.3*8
 D OUT^MCEO,QTASK^MCPARAM G EXIT
 ;
HEM S DIC="^MCAR(694,",DIC(0)="AEQLM",(DLAYGO,DIDEL,MCFILE)=694 D ^DIC G EXIT:Y<0
 S MCARGDA=+Y I $D(DTOUT),('$P(^MCAR(694,+Y,0),U,2))!('$P(^(0),U,3)) S DIK="^MCAR(694,",DA=MCARGDA D ^DIK W "??" G EXIT
 S MCARGNUM=$P(^MCAR(694,MCARGDA,0),U,3),DFN=$P(^(0),U,2),DJSC=MCEPROC
 S MCARGNAM=$P(^MCAR(697.2,MCARGNUM,0),U),DJDN=MCARGDA,DIC="^MCAR(694,",DIC(0)="EQ"
 G EXIT:$D(DTOUT)!$D(DUOUT) D EN^MCARD,QTASK^MCPARAM G EXIT
MULTI K MULTI S MULTI="",MCARGDA=-1 D GEN G EXIT:$D(DTOUT),EXIT:$D(DUOUT),EXIT:'$G(MCARGDA)
 S AV=$G(^MCAR(698,MCARGDA,0)),DFN=$P(AV,U,2),AV=$P(AV,U,7) G EXIT:AV=""!("AV"'[AV)
 K DIC S DIC("S")="I $P(^(0),U,2)=DFN" D ALEAD:AV["A" G EXIT:$D(DUOUT)!($D(DTOUT))
 K DIC S DIC("S")="I $P(^(0),U,2)=DFN" D VLEAD:AV["V" G EXIT
GEN S MCFILE=698
 S MCPRO="GEN.IMPL." D MCEPROC^MCARE S MCARGNUM=MCARGNAM,MCARGNAM="GENERATOR IMPLANT" G LOOK
VLEAD S MCFILE=698.1
 D:$D(MULTI) LAST^MCARPACE
 S MCPRO="V-LEAD IMP" D MCEPROC^MCARE S MCARGNUM=MCARGNAM,MCARGNAM="VENTRICAL LEAD IMPLANT" G LOOK
ALEAD S MCFILE=698.2
 D:$D(MULTI) LAST^MCARPACE
 S MCPRO="A-LEAD IMP" D MCEPROC^MCARE S MCARGNUM=MCARGNAM,MCARGNAM="ATRIAL LEAD IMPLANT" G LOOK
DEMO ;
 W @IOF,!!!,"DEMOGRAPHIC INFORMATION      *** SCREEN EDIT ***",!!!
 D
 .N DLAYGO
 .S DLAYGO=690,DIC="^MCAR(690,",DIC(0)="AEQLM",DIC("B")=$G(MCPATNM)
 .D ^DIC
 .Q
 G EXIT:Y<0
 S (DJDN,MCARGDA)=+Y,DJSC="MCPACEDEMO",DIC(0)="EQ" D EN^MCARD
 ;get new default patient name
 S MCX=$$VALUE^MCENDIQ1(690,MCARGDA,.01)
 I MCX'="" S MCPATNM=MCX
 G EXIT
LOOK ;
 W @IOF,!!!,MCARGNAM," PROCEDURES      *** SCREEN EDIT ***",!!!
 S DIC="^MCAR("_MCFILE_",",DIC(0)="AEQLM"
 S DIC("A")="Enter patient name, or date and time: "
 ;S DIC("B")=$G(MCPATNM)
 S (DLAYGO,DIDEL)=MCFILE D ^DIC G EX:Y<0
 ;
 ;    NOTE:  next line must define DFN for Order Entry to work
 S MCARGDA=+Y,DFN=$P($G(^MCAR(MCFILE,MCARGDA,0)),U,2) I $D(DTOUT),'DFN S DIK=DIC,DA=MCARGDA D ^DIK G EX
 S MCARGNUM=$O(^MCAR(697.2,"BA",MCARGNAM,0))
 S DJSC=MCEPROC
 S MCARGNAM=$P(^MCAR(697.2,MCARGNUM,0),U),DJDN=MCARGDA,DIC(0)="EQ" D IN^MCEO G EXIT:$D(DTOUT)!$D(DUOUT) D EN^MCARD,OUT^MCEO
 ;get new default patient name
 S MCX=$$VALUE^MCENDIQ1(MCFILE,MCARGDA,1)
 I MCX'="" S MCPATNM=MCX
EX Q:$D(MULTI)  G EXIT
SETUP ; If the record is superseded, the user will be allow to edit the superseded record.
 S Y=MCY,DA=Y,Y(0)=MCY(0),Y(0,0)=MCY(0,0),MCARGDA=+MCY K MCY,DTOUT,DIROUT,DUOUT,DIC
 G SUPS