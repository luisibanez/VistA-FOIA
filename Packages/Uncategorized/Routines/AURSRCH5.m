AURSRCH5 ; SEARCH MISCELLANEOUS FOR ROUTINES [ 04/06/88  8:39 AM ]
 ; PREVIOUSLY NAMED AUSM
 ;
 W !!,"This routine searches a file for MISCELLANEOUS ^DD ENTRIES that call routines.",!
 S U="^"
 S DIC="^DIC(",DIC(0)="AEMQ" D ^DIC
 I Y<0 D EOJ Q
 S AUSM("FILE")=+Y
 K ^UTILITY("AURSRCH",$J)
 S AUSM("MASTER")=""
EN ; ENTRY POINT FOR CALLING ROUTINES
 S AUSM("LAST FILE")=""
 D FILE
 D:$D(AUSM("MASTER")) LIST
 D EOJ
 Q
FILE ; CHECK ONE FILE
 I $D(^DD(AUSM("FILE"),0,"ACT")) S X=^("ACT"),AUSM("GR")=$ZR D FILE2
 I $D(^DD(AUSM("FILE"),0,"SCR")) S X=^("SCR"),AUSM("GR")=$ZR D FILE2
 I $D(^DD(AUSM("FILE"),0,"ID")) S AUSM("FIELD")="" F AUSM("L")=0:0 S AUSM("FIELD")=$O(^DD(AUSM("FILE"),0,"ID",AUSM("FIELD"))) Q:AUSM("FIELD")=""  S X=^(AUSM("FIELD")),AUSM("GR")=$ZR D FILE2
 I $D(^DD(AUSM("FILE"),.01,7.5)) S X=^(7.5),AUSM("GR")=$ZR D FILE2
 I $D(^DD(AUSM("FILE"),.01,"DEL")) S AUSM("SUB")="DEL" D FIELD
 I $D(^DD(AUSM("FILE"),.01,"LAYGO")) S AUSM("SUB")="LAYGO" D FIELD
 Q
 ;
FIELD ; CHECK ONE FIELD
 S AUSM("FIELD")="" F AUSM("L")=0:0 S AUSM("FIELD")=$O(^DD(AUSM("FILE"),.01,AUSM("SUB"),AUSM("FIELD"))) Q:AUSM("FIELD")=""  D FIELD2
 Q
 ;
FIELD2 ;
 S AUSM("NODE")="" F AUSM("L")=0:0 S AUSM("NODE")=$O(^DD(AUSM("FILE"),.01,AUSM("SUB"),AUSM("FIELD"),AUSM("NODE"))) Q:AUSM("NODE")=""  S X=^(AUSM("NODE")),AUSM("GR")=$ZR D FILE2
 Q
 ;
FILE2 ;
 Q:X'[U
 S AURSRCH("FOUND")=0,AUSM("COUNT")=$L(X,U)
 F AUSM("I")=AUSM("COUNT"):-1:2 S Y=$P(X,U,AUSM("I")) D ^AURSRCH1
 D:AURSRCH("FOUND") WRITE
 Q
 ;
WRITE ;
 I $D(AURSRCH("NO DETAIL")) W "." Q
 I AUSM("FILE")'=AUSM("LAST FILE") S AUSM("LAST FILE")=AUSM("FILE") W !
 W !,AUSM("GR"),?30,$E(X,1,49)
 F AUSM("L")=0:0 S X=$E(X,50,999) Q:X=""  W !,?30,$E(X,1,49)
 Q
 ;
LIST ; LIST ROUTINE NAMES
 Q:'$D(^UTILITY("AURSRCH",$J))
 W !!,"Sorted list of routines found:",!
 S X="" F AUSM("L")=0:0 S X=$O(^UTILITY("AURSRCH",$J,X)) Q:X=""  W !,"^",X
 K ^UTILITY("AURSRCH",$J)
 W !
 Q
 ;
EOJ ;
 K DIC
 K X,X0,X1,X2,Y,YY
 K:$D(AUSM("MASTER")) AURSRCH
 K AUSM,AUSMFL
 Q