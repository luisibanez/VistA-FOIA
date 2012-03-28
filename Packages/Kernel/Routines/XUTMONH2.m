XUTMONH2 ;SEA/RDS - TaskMan: Option, XUTMON, Part 5 (Help Modules) ;5/12/94  12:12 [ 04/02/2003   8:29 AM ]
 ;;8.0;KERNEL;**1002,1003,1004,1005,1007**;APR 1, 2003
 ;;8.0;KERNEL;;Jul 10, 1995
 ;
 Q
 ;
PRINT ;Subroutine--Print A Task
 N ZTMT,ZTSK W:'ZTC @IOF,!,ZTH,! W:'ZTF !,"-------------------------------------------------------------------------------"
 S X=0,ZTF=0 D EN^XUTMTP(ZTS) I $Y>18 W ! S ZTF=1,DIR(0)="E" D ^DIR S X=$D(DTOUT)!$D(DUOUT) Q:X  W @IOF
 S ZTC=ZTC+1 Q
 ;
OUT ;Tag for breaking FOR scope to exit early
 Q
 ;
JOB ;Display Job List
 N DIR,DIRUT,DTOUT,DUOUT,X,ZT,ZT1,ZT2,ZTC,ZTF,ZTH,ZTS S ZTC=0,ZTF=1,ZTH="Job list..."
 S ZT1="" F ZT=0:0 S ZT1=$O(^%ZTSCH("JOB",ZT1)),ZT2=0 Q:ZT1=""  F ZT=0:0 S ZT2=$O(^%ZTSCH("JOB",ZT1,ZT2)) Q:'ZT2  S ZTS=ZT2 D PRINT S ZTC=ZTC+1 G OUT:X
 I 'ZTC W !!,"The Job List is empty."
 W ! S DIR(0)="E",DIR("A")=$S(ZTC:"End of listing.  ",1:"")_"Press RETURN to continue" D ^DIR Q
 ;
TASK ;Display Task List
 N DIR,DIRUT,DTOUT,DUOUT,X,ZTC,ZTF,ZTH,ZTS S ZTC=0,ZTF=1,ZTH="Task list..."
 F ZTS=0:0 S ZTS=$O(^%ZTSCH("TASK",ZTS)) Q:'ZTS  D PRINT S ZTC=ZTC+1 G OUT:X
 I 'ZTC W !!,"The Task List is empty."
 W ! S DIR(0)="E",DIR("A")=$S(ZTC:"End of listing.  ",1:"")_"Press RETURN to continue" D ^DIR Q
 ;
LINK ;Display Link Lists
 N DIR,DIRUT,DTOUT,DUOUT,X,ZT,ZT1,ZT2,ZTC,ZTF,ZTS S ZTC=0,ZTF=1,ZTH="Link lists..."
 S ZT1="" F ZT=0:0 S ZT1=$O(^%ZTSCH("LINK",ZT1)),ZT2="" Q:ZT1=""  F ZT=0:0 S ZT2=$O(^%ZTSCH("LINK",ZT1,ZT2)) Q:'ZT2  F ZTS=$O(^%ZTSCH("LINK",ZT1,ZT2,ZTS)) Q:'ZTS  D PRINT S ZTC=ZTC+1 G OUT:X
 I 'ZTC W !!,"The Link List is empty."
 W ! S DIR(0)="E",DIR("A")=$S(ZTC:"End of listing.  ",1:"")_"Press RETURN to continue" D ^DIR Q
 ;
