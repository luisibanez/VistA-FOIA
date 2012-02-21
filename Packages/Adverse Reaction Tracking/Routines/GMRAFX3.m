GMRAFX3 ;SLC/DAN Update existing entries to new reactant ;2/24/05  12:11
 ;;4.0;Adverse Reaction Tracking;**17,19,23**;Mar 29, 1996
 ;DBIA SECTION
 ;10018 - DIE
 ;2056  - DIQ
 ;3154  - ORQ1
 ;4134  - ORCHECK
 ;4135  - ORKCHK
 ;10026 - DIR
 ;
UIE ;Update individual entries
 N DFN,GMRAOUT,GMRAING,GMRADRCL,DIE,DA,DR,AIFN,SIGN,TIME,SUB,ORX,GMRAORX,GMRAOC,GI,FND,COM,SIEN,DIR,Y
 S GMRADONE=0 ;Flag to keep track of updated entries
 S DFN=$P($G(^GMR(120.8,GMRAPA,0)),U) Q:'+DFN
 W !!,"For patient ",$$GET1^DIQ(2,DFN_",",.01),!
 I $D(GMRAAR) D
 .S DIR(0)="Y",DIR("A")="Use reactant "_GMRAAR(0),DIR("B")="Y" D ^DIR
 .K:'Y GMRAAR
 .Q
 D:'$D(GMRAAR) ^GMRAFX2 Q:'$D(GMRAAR)  ;Get new reactant
 S GMRAOUT=0
 I $$DUP W !,"Patient already has an active allergy for this reactant.",!,"Duplicate not allowed.",! D WAIT Q
 I $$DUPCHK^GMRAPES0(GMRAAR(0),DFN,GMRAPA) Q  ;Checks to see if reactant previously entered in error.
 ;Update reactant, allergy and signed off fields
 S DIE="^GMR(120.8,",DA=GMRAPA,DR=".02////"_GMRAAR(0)_";1////^S X=GMRAAR"_";3.1////"_GMRAAR("O")_";15///1" D ^DIE
 I $D(^GMR(120.85,"C",GMRAPA)) D  ;Observed reaction, need to update data
 .S AIFN=0
 .F  S AIFN=$O(^GMR(120.85,"C",GMRAPA,AIFN)) Q:'+AIFN  D
 ..S SIEN=$O(^GMR(120.85,AIFN,3,"B",$P(^XTMP("GMRAFX","IDX",+NMBR),"^"),0)) Q:'+SIEN  ;Was previous reactant stored as "suspected agent"
 ..S DA(1)=AIFN,DA=SIEN
 ..S DIE="^GMR(120.85,DA(1),3,",DR=".01////^S X=GMRAAR(0)" D ^DIE ;Update suspected agent to new value
 D DELMUL(2),DELMUL(3) ;Delete drug ingredient/drug classes multiples
 I GMRAAR("O")["D" D UPDATE^GMRAPES1 ;If reactant type is Drug then add appropriate ingredients and classes
 S GMRADONE=1 ;Update complete
 S COM="Updated using clean up process.  Changed reactant from "_$P(^XTMP("GMRAFX","IDX",+NMBR),"^",2)_" (free text) "_"to "_GMRAAR(0)_"(file - "_$P(GMRAAR,";",2)_")"
 D ADCOM^GMRAFX(GMRAPA,"O",COM) ;Add a comment for this update
 ;Do order checking here - compare existing orders against new allergy information.
 W !,"Performing order checking..."
 K ^TMP("ORR",$J),GMRAOC,ORX
 D EN^ORQ1(DFN_";DPT(") ;Retrieve active orders
 S TIME=$O(^TMP("ORR",$J,0))
 Q:'^TMP("ORR",$J,TIME,"TOT")  ;No orders found
 S SUB=0 F  S SUB=$O(^TMP("ORR",$J,TIME,SUB)) Q:'+SUB  D
 .D BLD^ORCHECK(+^TMP("ORR",$J,TIME,SUB)) ;Get "order" information in order checking format
 M GMRAORX=ORX K ORX ;19
 D EN^ORKCHK(.GMRAOC,DFN,.GMRAORX,"ACCEPT")
 S GI=0,FND=0 F  S GI=$O(GMRAOC(GI)) Q:'+GI  D
 .Q:$P(GMRAOC(GI),U,2)'=3  ;Quit if not allergy related
 .Q:$D(^OR(100,$P(GMRAOC(GI),U),9,"B",3))  ;23 If order check exists can't be for this data
 .W !,"Patient has a(n) ",$P($$STATUS^ORQOR2($P(GMRAOC(GI),U)),U,2)," order for",$P($P(GMRAOC(GI),U,4),":",2),", order #",$P(GMRAOC(GI),U)
 .S FND=1
 W:'FND "No problems found"
 D WAIT
 Q
 ;
DELMUL(FIELD) ;Delete multiple FIELD from GMR ALLERGY file
 N MIEN,DA,DIE,DR
 S MIEN=0 F  S MIEN=$O(^GMR(120.8,GMRAPA,FIELD,MIEN)) Q:'+MIEN  D
 .S DA(1)=GMRAPA,DA=MIEN
 .S DIE="^GMR(120.8,DA(1),FIELD,",DR=".01///@" D ^DIE ;Delete entry
 Q
 ;
DUP() ;Function returns true (1) if selected reactant is a duplicate
 N LOOP,FND
 S LOOP=0,FND=0
 F  S LOOP=$O(^GMR(120.8,"B",DFN,LOOP)) Q:'+LOOP!(FND)  D
 .I $P(^GMR(120.8,LOOP,0),U,3)=GMRAAR&('$D(^GMR(120.8,LOOP,"ER"))) S FND=1
 Q FND
 ;
WAIT ;Issues press enter to return prompt
 N DIR
 S DIR(0)="E",DIR("A")="Press enter to continue" D ^DIR
 Q
 ;
GETNUM(ACTION) ; -- Return numbers to act on, if action chosen first
 N X,Y,DIR,MAX
 S MAX=$S($D(^TMP($J,"IDX2")):$G(^TMP($J,"IDX2",0)),1:$G(VALMCNT)) Q:MAX'>0 ""
 I ACTION="DET" W !!,"Please choose only one entry for the detailed display."
 S DIR(0)="LAO^1:"_MAX,DIR("A")="Select Entries from list: "
 S DIR("?")="Enter the items you wish to act on, as a range or list of numbers."
 D ^DIR S:$D(DTOUT) Y="^"
 I $D(Y(1)) W !,">>>Too many entries selected, try using smaller ranges" H 2 S Y="^"
 I $L($G(Y),",")>2,ACTION="DET" W !,">>You may only choose ONE group for detailed display." H 2 S Y="^"
 Q Y
 ;
UPDATE ;Update display to account for changes to the list
 N CNT,SP1,SP2,SP3
 I VALMAR["GMRADET" N VALMAR S VALMAR="^XTMP(""GMRAFX"")"
 S CNT=^XTMP("GMRAFX","GMRAR",$P(ENTRY,U),$P(ENTRY,U,2))-1
 S ^XTMP("GMRAFX","GMRAR",$P(ENTRY,U),$P(ENTRY,U,2))=CNT K ^($P(ENTRY,U,2),GMRAJ)
 S SP1=4-$L(+NUM),SP2=40-$L($P(ENTRY,U)),SP3=$S(CNT:16-$L(CNT)\2,1:2)
 D SET^VALM10(+NUM,+NUM_$$REPEAT^XLFSTR(" ",SP1)_$P(ENTRY,U,2)_$$REPEAT^XLFSTR(" ",(SP2+SP3))_$S(CNT:CNT,1:"** FIXED **"))
 Q
 ;
LOCK(ENTRY) ;Lock entry in 120.8
 N LOCK
 S LOCK=1
 L +^XTMP("GMRAFX","IDX",ENTRY):1
 I '$T D FULL^VALM1 S VALMBCK="R" W !,"The ",$P(^XTMP("GMRAFX","IDX",ENTRY),U)," group is being edited by another user" D WAIT S LOCK=0
 Q LOCK
 ;
AR ;Add/edit patient reactions
 N LCV,DFN,SUB
 S VALMBCK="R" D FULL^VALM1
 W !!,"You should use this option to add NEW reactions only.  If you mark"
 W !,"existing free text entries as entered in error from within this option it will"
 W !,"not update the utility's display until the list is rebuilt upon re-entry"
 W !,"of this option.  This could cause confusion as the list will no longer"
 W !,"be accurate.",!
 I '$G(NMBR2) D WAIT,EN1^GMRAPEM0 Q
 F LCV=1:1:$L(NMBR2,",")-1 S SUB=$P(NMBR2,",",LCV) S DFN=+$P($G(^GMR(120.8,+$P($G(^TMP($J,"IDX2",SUB)),U,2),0)),U) I DFN W !!,"Now working with patient ",$$GET1^DIQ(2,DFN,.01),! D WAIT D EN2^GMRAPEM0
 Q
 ;
DSPREACT ;Display detailed information about the free text reactant
 N DIC,DA,GMRAI,STOP,NUM2,DIR,Y
 S VALMBCK="R" D FULL^VALM1
 I '$G(NMBR2) S NMBR2=$$GETNUM("") Q:'+NMBR2
 F GMRAI=1:1:($L(NMBR2,",")-1) D  Q:$G(STOP)
 .S NUM2=$P(NMBR2,",",GMRAI)
 .S DA=$P(^TMP($J,"IDX2",NUM2),U,2) Q:'DA
 .S DIC="^GMR(120.8,"
 .W ! D EN^DIQ
 .S DIR(0)="E",DIR("A")="Press return to continue or '^' to stop" D ^DIR
 .S:$D(DIRUT) STOP=1
 .Q
 Q
