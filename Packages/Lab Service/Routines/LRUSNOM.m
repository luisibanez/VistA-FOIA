LRUSNOM ; IHS/DIR/FJE - ANATOMIC PATH REFERENCES 4/12/94 10:15 ;
 ;;5.2;LR;**1013**;JUL 15, 2002
 ;
 ;;5.2;LAB SERVICE;;Sep 27, 1994
A G:'$D(LRF) END K LR("CK") W ! S (DIE,DIC)=LRF,DIC(0)="AEQM" D ^DIC K DIC G:Y<1 END S DA=+Y I DR=5 D CK^LRU G:$D(LR("CK")) A D ^DIE D FRE^LRU G A
 D PRT G A
 ;
DE D END S LRF="^LAB(61.4," G E ;edit Disease
EE D END S LRF="^LAB(61.2," G E ;edit Etiology
FE D END S LRF="^LAB(61.3," G E ;edit edit Function
ME D END S LRF="^LAB(61.1," G E ;edit edit Morphology
OE D END S LRF="^LAB(61.6," G E ;edit Occupation
TE D END S LRF="^LAB(61," G E ;edit Topography
PE D END S LRF="^LAB(61.5," G E ;edit Procedure
E S DR=5 G LRUSNOM
 ;
DP D END S LRF=61.4 G P
EP D END S LRF=61.2 G P
FP D END S LRF=61.3 G P
MP D END S LRF=61.1 G P
OP D END S LRF=61.6 G P
TP D END S LRF=61 G P
PP D END S LRF=61.5 G P
P S DR="0;JR" G LRUSNOM
 ;
PRT ;print references
 S ZTRTN="QUE^LRUSNOM" D BEG^LRUTL G:POP!($D(ZTSK)) END
QUE U IO S DIC=^DIC(LRF,0,"GL") D EN^DIQ,END^LRUTL Q
 ;
END D V^LRU Q
