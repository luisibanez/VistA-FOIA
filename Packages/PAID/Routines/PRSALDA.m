PRSALDA ;HISC/MGD-Labor Distribution Audit ;09/06/2003
 ;;4.0;PAID;**82**;Sep 21, 1995
 Q
TL W @IOF
 S PRSTLV=3 D ^PRSAUTL G:TLI<1 EX
 W !
 ;
PP ;select pay period
 K DIC S DIC="^PRST(458,",DIC(0)="AEMQZ"
 D ^DIC
 I Y'>0 D EX Q
 S PPI=+Y,PPNAME=$P(^PRST(458,PPI,0),U,1)
 ;
D2 W !!,"Would you like to review the Labor Distributions "
 W !,"in alphabetical order"
 S %=1 D YN^DICN
 Q:%=-1
 I %=0 D  G D2
 . W !!,"Answer YES if you want the Labor Distribution and any changes"
 . W !,"that have occurred during the selected Pay Period for all"
 . W !,"employees."
 I %=1 D  Q
 . D DVC
 . I POP D EX Q
 . D LOOP
 . Q
 I %=2 D EMP Q
 Q
 ;
DVC W !
 S IOFSAV=IOF
 K %ZIS,IOP
 S %ZIS="MQ",%ZIS("B")=""
 D ^%ZIS I POP Q
 S IOF=IOFSAV
 Q
 ;
LOOP S LP=1,NN=""
 U IO
 F  S NN=$O(^PRSPC("ATL"_TLE,NN)) Q:NN=""  D
 . F DFN=0:0 S DFN=$O(^PRSPC("ATL"_TLE,NN,DFN)) Q:DFN<1  D LD
 D:$E(IOST,1)="C" CHECK
 D:$E(IOST,1)'="C" ^%ZISC
 Q
 ;
EMP W @IOF
 K DIC
 S DIC("A")="Select EMPLOYEE: ",DIC(0)="AEQM",DIC="^PRSPC("
 W ! D ^DIC S DFN=+Y K DIC G:DFN<1 EX
 I DFN<1 D EX Q
 D DVC
 I POP D EX Q
 U IO
 D LD
 D:$E(IOST,1)'="C" ^%ZISC
 G EMP
 Q
LD ; Display changes to the Labor Distribution Codes within the Pay
 ; Period.
 ;
 N DASH,I,LDAUD,LDCC,LDCCB,LDCCEX,LDCODE,LDCODNUM,LDCNT,LDDATA,LDDIS
 N LDDOA,LDFCP,LDHOLD,LDPCT,LDTOI,PRTC,Y
 S $P(DASH,"-",80)="",PRTC=""
 S NAME=$$GET1^DIQ(450,DFN,.01,"E")
 I $E(IOST,1)="C" W @IOF
 D LDHDR
 W !!,"Current Labor Distribution Values:"
 S LDDOA=$$GET1^DIQ(450,DFN,756,"E")
 S LDCCB=$$GET1^DIQ(450,DFN,755,"E")
 S LDTOI=$$GET1^DIQ(450,DFN,755.1,"E")
 W !,LDDOA,?24,LDCCB,?61,LDTOI
 F LDDIS=1:1:4 D
 . S LDDATA=$G(^PRSPC(DFN,"LD",LDDIS,0))
 . S LDCODE=$P(LDDATA,U,2),LDPCT=$P(LDDATA,U,3)
 . S LDCC=$P(LDDATA,U,4),LDFCP=$P(LDDATA,U,5)
 . S Y=LDCC,SUB454="CC" D OT^PRSDUTIL K SUB454
 . S LDCCEX=$E(Y,1,30)
 . W !,"Code",LDDIS,": ",LDCODE,?15
 . I LDPCT>0 W $J(LDPCT,3,2)
 . W ?24,LDCC
 . I LDCC'="" W " - ",LDCCEX
 . W ?70,LDFCP
 ; Check for changes within the Pay Period.
 S LDCNT="A"
 S LDCNT=$O(^PRST(458,PPI,"E",DFN,"LDAUD",LDCNT),-1)
 I 'LDCNT D  Q
 . W !!,"There were no Labor Distribution changes for this employee"
 . W !,"during the Pay Period: ",PPNAME,"."
 . D PRTC
 F I=LDCNT:-1:1 D  Q:PRTC=0
 . W !!,"Previous Change # ",I
 . S IENS=I_","_DFN_","_PPI_","
 . S LDDOA=$$GET1^DIQ(458.1105,IENS,1,"E")
 . S LDCCB=$$GET1^DIQ(458.1105,IENS,2,"E")
 . S LDTOI=$$GET1^DIQ(458.1105,IENS,3,"E")
 . W !,LDDOA,?24,LDCCB,?61,LDTOI
 . F PRSLD=1:1:4 D  Q:PRTC=0
 . . S IENS=PRSLD_","_LDCNT_","_DFN_","_PPI_","
 . . S LDCODE=$$GET1^DIQ(458.11054,IENS,1)
 . . S LDPCT=$$GET1^DIQ(458.11054,IENS,2)
 . . S LDCC=$$GET1^DIQ(458.11054,IENS,3)
 . . S Y=LDCC,SUB454="CC"
 . . D OT^PRSDUTIL K SUB454
 . . S LDCCEX=$E(Y,1,30)
 . . S LDFCP=$$GET1^DIQ(458.11054,IENS,4)
 . . W !,"Code",PRSLD,": ",LDCODE,?15
 . . I LDPCT>0 W $J(LDPCT,3,2)
 . . W ?24,LDCC
 . . I LDCC'="" W " - ",LDCCEX
 . . W ?70,LDFCP
 . I I'=1 D CHECK
 . Q:PRTC=0
 . I PRTC&(I'=1) W @IOF D LDHDR S PRTC=""
 . I I=1&($E(IOST,1)="C") D PRTC
 Q
 ;
LDHDR ; Labor Distribution Header information
 ;
 N TAB
 S TAB=($L(NAME)\2)
 W $J(NAME,40+TAB)
 W !?15,"Labor Distribution Changes within the Pay Period:"
 W !,"Date/Time",?24,"Changed by",?61,"Type of Interface"
 W !,"Code",?14,"Percent",?24,"Cost Center - Description"
 W ?65,"Fund Ctrl Pt"
 W !,DASH
 Q
 ;
LDHOLD ; Pause of more LD changes that will fit on 1 screen.
 ;
 S LDHOLD=$$ASK^PRSLIB00(1)
 S X=$G(^PRSPC(DFN,0))
 W !,@IOF,?3,$P(X,"^",1)
 S X=$P(X,"^",9)
 I X W ?68,$E(X,1,3),"-",$E(X,4,5),"-",$E(X,6,9)
 W !,DASH
 D LDHDR
 Q
 ;
CHECK I $E(IOST,1)="C",$Y>(IOSL-7) D PRTC
 Q
 ;
PRTC W ! K DIR,DIRUT,DIROUT,DTOUT,DUOUT
 S DIR(0)="E",DIR("A")="Press RETURN to continue" D ^DIR S PRTC=Y
 S:$D(DIRUT) PRTC=0
 Q
 ;
EX K DFN,DIC,IEN,IENS,IOFSAV,LP,NAME,NN,POP,PPI,PPNAME,PRSLD,PRSTLV
 K TLE,TLI,X,%
 Q
