ASDMON ; IHS/ADC/PDW/ENM - MONTH AT A GLANCE ; [ 03/25/1999  11:48 AM ]
 ;;5.0;IHS SCHEDULING;;MAR 25, 1999
 ;
 S:'$D(SDMM) SDMM=0
EN1 ; ask clinic and set variables for call to SDM0
 W !! D I^SDUTL
 S DIC="^SC(",DIC(0)="AEMZQ",DIC("A")="Select CLINIC: "
 S DIC("S")="I $P(^(0),U,3)=""C""" D ^DIC K DIC G:Y<0!'$D(^("SL")) END
 K SDAPTYP,SDIN,SDRE,SDXXX
 I $D(^SC(+Y,"I")) S SDIN=+^("I"),SDRE=+$P(^("I"),U,2)
 K SDINA I $D(SDIN),SDIN S SDINA=SDIN K SDIN
 I $D(SD),$D(SC),+Y'=+SC K SD
 S SL=^SC(+Y,"SL"),X=$P(SL,U,3),STARTDAY=$S(X:X,1:8),SC=Y
 S SB=STARTDAY-1/100,X=$P(SL,U,6),HSI=$S(X=1:X,X:X,1:4)
 S SI=$S(X="":4,X<3:4,X:X,1:4)
 S STR="#@!$* XXWVUTSRQPONMLKJIHGFEDCBA0123456789jklmnopqrstuvwxyz"
 S SDDIF=$S(HSI<3:8/HSI,1:2) K Y
 D CS^SDM1A S SDW="",WY="Y" ;checks clinic code
 ;
 I $D(^SC("AIHSPC",+SC)) D  G ASDMON
 . W !!,*7," This is a Principal Clinic!",!
 . K DIR S DIR(0)="NO^1:2",DIR("B")=2
 . S DIR("A",1)=" 1  Display availability of just this clinic"
 . S DIR("A",2)=" 2  Display first available for clinics under this grouping"
 . S DIR("A")="Select 1 or 2" D ^DIR W !
 . I Y=1 D DEV Q
 . I Y=2 S SDPC=+SC D EN^ASDPC K SDPC
 ;
DEV ; ask for device then call SDM0, return to EN1
 S %ZIS="N" D ^%ZIS
 S DFN=-1 D ^SDM0,^%ZISC G EN1
 ;
 ;
END D KVAR^VADPT K SDAPTYP,SDSC,%,%DT,ASKC,COV,DA,DIC,DIE,DP,DR
 K HEY,HSI,HY,J,SB,SC,SDDIF,SDJ,SDLN,SD17,SDMAX,SDU,SDYC,SI,SL
 K SSC,STARTDAY,STR,SDZPR,WY,X,XX,Y,S,SD,SDAP16,SDEDT,SDTY,SM
 K SS,ST,ARG,CCX,CCXN,HX,I,PXR,SDINA,SDW,COLLAT,SDDIS,SDMM,SDMLT1
 K SDAV,SDHX,SDSOH,SDT
 Q
