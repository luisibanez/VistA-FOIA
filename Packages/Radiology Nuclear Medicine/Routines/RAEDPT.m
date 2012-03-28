RAEDPT ;HISC/FPT,GJC,SS AISC/MJK,RMO-Edit Exams by Patient ;4/21/97  10:47
 ;;5.0;Radiology/Nuclear Medicine;**10,18,28**;Mar 16, 1998
 ;last modification by SS JUNE 19,2000
CASE D SET^RAPSET1 I $D(XQUIT) K XQUIT,POP Q
 S RAXIT=0,DIC(0)="AEMQ" D ^RADPA G Q:Y<0
 S RADFN=+Y,RAHEAD="**** Edit Exams By Patient ****"
 D ^RAPTLU G CASE:"^"[X
 W !!,"Case No.:",RACN,?15,"Procedure:",$E(RAPRC,1,30),?57,"Date:",RADATE
 N RADISPLY
 S RADISPLY=$G(^RAMIS(71,+$P($G(^RADPT(+RADFN,"DT",+RADTI,"P",+RACNI,0)),U,2),0)) ; set $ZR to 71 for prccpt^radd1, not call raprod since diff col
 S RADISPLY=$$PRCCPT^RADD1()
 W !,?25,RADISPLY
 I $D(^RA(72,"AA",RAIMGTY,9,+RAST)),'$D(^XUSEC("RA MGR",DUZ)) W !!?3,*7,"You do not have the appropriate access privilege to edit completed exams.",! G CASE
 I $D(^RA(72,"AA",RAIMGTY,0,+RAST)) W !!?3,*7,"Exam has been 'cancelled' therefore it cannot be edited." G CASE
 S RAQUICK=0,DA=RADFN,DIE("NO^")="OUTOK"
 S RADADA=RADTI ; RADTI defined in ^RAPTLU
 S DIE="^RADPT(",DR="[RA EXAM EDIT]"
 S RADIE="^RADPT("_RADFN_",""DT"","
 S RAXIT=$$LOCK^RAUTL12(RADIE,RADADA) I RAXIT G CASE
 N REM,RANUZD1,RAPSDRUG,RA00,RADIOPH,RALOW,RAHI,RADRAWN,RAASK,RADOSE,RASKMEDS,RAWHICH ;these are used by the edit template
 D SVBEFOR^RAO7XX(RADFN,RADTI,RACNI) ;P18 save before edit to compare later in RAUTL1
 D ^DIE K DE,DQ,DIE,DR
 S:$D(RAPRI) RAPRIT=RAPRI D UP1^RAUTL1
 D UNLOCK^RAUTL12(RADIE,RADADA) ;modif P18 by SS
 K RADADA,RADIE,RADUZ W ! G CASE ;modif P18 by SS
 ;
Q K %,%DT,%Y,A,C,D0,D1,D2,DA,DIC,I,RACN,RACNI,RACNT,RACT,RADADA,RADATE,RADATI,RADFN,RADIE,RADTE,RADTI,RAHEAD,RAMES,RANME,RAOR,RAORDIFN,RAPOP,RAPRC,RAPRI,RAQUICK,RARPT,RASN,RASSN,RAST,RASTI,RAXIT,XQUIT,VAINDT,VADMVT,X,Y
 K ^TMP($J,"RAEX")
 K %W,%Y1,D,D3,DDER,DI,DK,DL,POP,DISYS,DUOUT,RAI
 Q
