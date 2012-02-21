LRLNCC ;DALOI/CA-LOINC COMMON CODE;1-JAN-2001
 ;;5.2;LAB SERVICE;**232,280**;Sep 27,1994
 ;============================================================
 ;Not valid entry call
 Q
 ;
CODE ;ask which code to map
 I +LRLOINC("DILIST",0)=0 D  Q
 .W !!,"No matches found."
 .S LRNO=1
 W !! S I=0
 F  S I=$O(LRLOINC("DILIST","ID",I)) Q:'I!$G(LREND)  D
 .I $E(IOST,1,2)="C-",'(I#18) D  Q:$G(LREND)
 ..S DIR(0)="E" D ^DIR
 ..S:$S($G(DIRUT):1,$G(DUOUT):1,1:0) LREND=1
 .W !,I,":",LRLOINC("DILIST","ID",I,80)
 K DIRUT,DUOUT
 W !!
 S DIR(0)="N^1:"_$S($G(LREND):I-2,1:$P(LRLOINC("DILIST",0),U),1:0)
 S DIR("A")="LOINC code to map this test"
 D ^DIR K DIR,LREND
 I $D(DIRUT) S LREND=1 Q
 S LRCODE=LRLOINC("DILIST",1,+Y)
DISPL ;Show LOINC entry selected in file 95.3
 ;display header-system and class
 ;display LOINC code, component, property, time aspect, scale type and method type
 S DA=LRCODE
 S LRLNC0=^LAB(95.3,DA,0)
 F I=2,6,7,8,9,10,11,14 S LRLNC0(I)=$P(LRLNC0,U,I)
 S LRLNCNAM=$P($G(^LAB(95.3,DA,80)),U)
 W @IOF
 W !,"LOINC CODE: ",LRCODE,"   ",LRLNCNAM
 W !,"SYSTEM: ",$P($G(^LAB(64.061,+LRLNC0(8),0)),U),?40,"CLASS: ",$P($G(^LAB(64.061,+LRLNC0(11),0)),U)
 W:LRLNC0(2) !,"COMPONENT: ",$P($G(^LAB(95.31,+LRLNC0(2),0)),U)
 W:LRLNC0(6) !,"PROPERTY: ",$P($G(^LAB(64.061,+LRLNC0(6),0)),U)
 W:LRLNC0(7) !,"TIME ASPECT: ",$P($G(^LAB(64.061,+LRLNC0(7),0)),U)
 W:LRLNC0(9) !,"SCALE TYPE: ",$P($G(^LAB(64.061,+LRLNC0(9),0)),U)
 W:LRLNC0(10) !,"METHOD TYPE: ",$P($G(^LAB(64.2,+LRLNC0(10),0)),U)
 W:LRLNC0(14) !,"UNITS: ",$P($G(^LAB(64.061,+LRLNC0(14),0)),U)
 Q
 Q 
ENTERLNC ;Enter LOINC code when already know the LOINC code
 W !! K DIR S LREND=0,DIR(0)="PO^95.3:AEMZ",DIR("A")="Enter LOINC Code/Name "
 S DIR("S")="I '$G(^(4))"
 S DIR("?")="Enter LOINC Code Name or LOINC Number"
 S DIR("?",1)="You can see possible LOINC CODES/Specimen by entering the"
 S DIR("?",2)="LOINC Test Name..Specimen   example( GLUCOSE..UR )"
 S DIR("?",3)=" "
 D ^DIR K DIR
 I $D(DUOUT)!($D(DTOUT))!(Y=-1) K DTOUT,DUOUT S LREND=1 Q
 S LRCODE=+Y
 D DISPL
 Q
