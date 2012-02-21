SROACAR ;BIR/MAM - OPEATIVE DATA ;04/13/04  12:55 PM
 ;;3.0; Surgery ;**38,71,93,95,100,125,142**;24 Jun 93
 I '$D(SRTN) W !!,"A Surgery Risk Assessment must be selected prior to using this option.",!!,"Press <RET> to continue  " R X:DTIME G END
 S SRACLR=0,SRSOUT=0,SRSUPCPT=1 D ^SROAUTL
START D:SRACLR RET G:SRSOUT END S SRACLR=0 K SRA,SRAO D ^SROACR1
ASK W !,"Select Operative Information to Edit: " R X:DTIME I '$T!("^"[X) G END
 S:X="a" X="A" I '$D(SRAO(X)),(X'?.N1":".N),(X'="A") D HELP G:SRSOUT END G START
 I X="A" S X="1:20"
 I X?.N1":".N S Y=$E(X),Z=$P(X,":",2) I Y<1!(Z>20)!(Y>Z) D HELP G:SRSOUT END G START
 D HDR^SROAUTL
 I X?.N1":".N D RANGE G START
 I $D(SRAO(X)),+X=X S EMILY=X D  G START
 .I $$LOCK^SROUTL(SRTN) W ! D ONE,UNLOCK^SROUTL(SRTN)
 I $D(SRAO(X)) W ! S EMILY=X D  G START
 .I $$LOCK^SROUTL(SRTN) D ONE,UNLOCK^SROUTL(SRTN)
END I 'SRSOUT D ^SROACR2
 W @IOF D ^SRSKILL
 Q
HELP W @IOF,!!!!,"Enter the number or range of numbers you want to edit.  Examples of proper",!,"responses are listed below."
 W !!,"1. Enter 'A' to update all information.",!!,"2. Enter a number (1-20) to update the information in that field.  (For",!,"   example, enter '9' to update Valve Repair.)"
 W !!,"3. Enter a range of numbers (1-20) separated by a ':' to enter a range of",!,"   information.  (For example, enter '6:8' to enter Aortic Valve",!,"   Replacement, Mitral Valve Replacement, and Tricuspid Valve Replacement.)"
 D RET
 Q
RANGE ; range of numbers
 I $$LOCK^SROUTL(SRTN) D  D UNLOCK^SROUTL(SRTN)
 .W ! S SHEMP=$P(X,":"),CURLEY=$P(X,":",2) F EMILY=SHEMP:1:CURLEY Q:SRSOUT  D ONE
 Q
ONE ; edit one item
 ;I EMILY=16 D MIS^SROACR1 Q
 K DR,DIE S DA=SRTN,DR=$P(SRAO(EMILY),"^",2)_"T",DIE=130 D ^DIE K DR I $D(Y) S SRSOUT=1
 I 'SRSOUT,EMILY=12!(EMILY=13) D OK
 Q
OK N SRISCH,SRCPB S X=$G(^SRF(SRTN,206)),SRISCH=$P(X,"^",36),SRCPB=$P(X,"^",37)
 I SRISCH,SRCPB,SRISCH>SRCPB W !!,"  ***  NOTE: Ischemic Time is greater than CPB Time!!  Please check.  ***",! D RET W !
 Q
RET Q:SRSOUT  W ! K DIR S DIR(0)="E" D ^DIR K DIR I $D(DTOUT)!$D(DUOUT) S SRSOUT=1
 Q
