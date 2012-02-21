GMRANKA ;HIRMFO/WAA-ALLERGY/ADVERSE REACTION PATIENT NKA DRIVE ;12/3/04  13:51
 ;;4.0;Adverse Reaction Tracking;**2,21**;Mar 29, 1996
NKA(DFN) ;See if patient has reaction on file
 ;  Input Variables:
 ;       DFN = Patient Internal Entry Number
 ;
 ;  Output Variables:
 ;       GMA = 1 Patient has known reaction
 ;             0 Patient has No known reaction
 ;             Null Patient has never been asked about reaction
 S GMA=""
 S GMA=$P($G(^GMR(120.86,DFN,0)),U,2)
 Q GMA
 ;
NKAASK(DFN,GMRAOUT) ; Ask a Patient if patient has any known allergens
 ;  Input Variables
 ;     DFN = Patient Internal entry number
 ;  GMRAOUT = Up Caret or time out flag
 ;
 N GMAIEN
 L +^GMR(120.86,0):1
 I $G(^GMR(120.86,DFN,0))="" D  ;ADD A RECORD TO THE 120.86 FILE
 .N HEAD
 .;UPDATE HEADER
 .S HEAD=^GMR(120.86,0)
 .S $P(HEAD,U,4)=($P(HEAD,U,4)+1)
 .S $P(HEAD,U,3)=DFN,^GMR(120.86,0)=HEAD
 .S ^GMR(120.86,DFN,0)=DFN_U,^GMR(120.86,"B",DFN,DFN)=""
 .Q
 L -^GMR(120.86,0)
 L +^GMR(120.86,DFN,0):1
 ;ASK PATIENT QUESTION VIA
 N DIR,Y,DIROUT,DTOUT,DIRUT,DUOUT,GMAOLD
 S GMAOLD=$P($G(^GMR(120.86,DFN,0)),U,2)
 S DIR(0)="120.86,1^AO^I Y=0&'$$NKASCR^GMRANKA(DFN) D INFO^GMRANKA K X"
 S DIR("A")="Does this patient have any known allergies or adverse reactions? "
 S DIR("B")=$S($P($G(^GMR(120.86,DFN,0)),U,2)=1:"Yes",$P($G(^GMR(120.86,DFN,0)),U,2)=0:"No",1:"") K:DIR("B")="" DIR("B")
 S DIR("?")=$S(GMAOLD=0:"You may also enter @ to delete a previous NKA assessment and return the patient to a 'not assessed' state.  Use this if the NKA assessment was previously incorrectly entered.",1:"") ;21
 D ^DIR
 I $G(X)="@" D:GMAOLD=0 CLN W:GMAOLD=0 !,"Assessment deleted." Q  ;21 Allow removal of NKA
 I $D(DTOUT)!$D(DIROUT) S GMRAOUT=1 D:GMAOLD="" CLN Q
 I $D(DUOUT) S GMRAOUT=2 D:GMAOLD="" CLN Q
 ; User Hits return and doesn't answer question
 I Y="",GMAOLD="" D CLN Q
 I Y'="",GMAOLD'=Y D
 . N DIE,DA,DR
 . S DIE="^GMR(120.86,",DA=DFN,DR="1////"_Y_";2////"_DUZ_";3///NOW"
 . D ^DIE
 . Q
 L -^GMR(120.86,DFN,0)
 Q
CLN ; Clean out entries that have not been answered.
 S DIK="^GMR(120.86,",DA=DFN D ^DIK K DIK,DA
 ;W !?20,"Patient will still be listed as not being",!?20,"asked about Allergies/Adverse Reactions."
 Q
INFO ; Info string
 N GMASTR
 S GMASTR(1)="Currently this patient has Causative Agents on file."
 S GMASTR(2)="You will have to answer YES to this question and then"
 S GMASTR(3)="indicate that each of the Causative Agents are incorrect."
 S GMASTR(4)="Then you will be reasked this question and will be able"
 S GMASTR(5)="to enter NO."
 D WRITE^GMRADSP8(1,0,$C(7))
 D WRITE^GMRADSP8(1,10,.GMASTR)
 Q
NKASCR(DFN) ; Is Patient NKA (No Known Allergy)
 ;   Input Variable:
 ;        DFN = Patient DFN in Patient file
 ;
 ;  Output Variable:
 ;        GMA = 1 Patient is True NKA
 ;            = 0 Patient has a reaction in file 120.8
 ;
 ; This code will screen out Entered in Error entries
 S GMA=1
 N GMAX
 S GMAX=0
 F  S GMAX=$O(^GMR(120.8,"B",DFN,GMAX)) Q:GMAX<1  D  Q:'GMA
 .I +$G(^GMR(120.8,GMAX,"ER")) Q
 .S GMA=0
 .Q
 Q GMA
 ;
DELNKA ;Remove assessment of NKA for a selected patient
 N Y,DFN,DIR,DIC
 S DIC=120.86,DIC(0)="AEMQZ",DIC("A")="Select PATIENT NAME: " D ^DIC Q:Y=-1
 S DFN=+Y
 W !
 I $$NKA^GMRANKA(DFN)'=0 W !,"This patient doesn't currently have an assessment of NKA." Q
 S DIR(0)="Y",DIR("A")="Delete NKA assessment for patient "_$G(Y(0,0)),DIR("B")="NO"
 S DIR("?")="Enter Y to delete the NKA assessment and return the patient to a 'not assessed' status.  Enter N to cancel this action."
 D ^DIR
 I Y=1 D CLN^GMRANKA W "...Done"
 Q
