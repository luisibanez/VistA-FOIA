AMHLECOC ; IHS/CMI/LAB - MENTAL HLTH ROUTINE ;
 ;;4.0;IHS BEHAVIORAL HEALTH;;MAY 14, 2010
 ;
 W !!,"Current OPEN/ADMIT/CLOSE Dates:",!
 G:$G(^AMHPATR(AMHPAT,0))="" DIE
 W !?10,"CASE OPEN DATE:  " S Y=$P(^AMHPATR(AMHPAT,0),U,5) D DD^%DT W Y
 W !?10,"CASE ADMIT DATE:  " S Y=$P(^AMHPATR(AMHPAT,0),U,6) D DD^%DT W Y
 W !?10,"CASE CLOSED DATE:  " S Y=$P(^AMHPATR(AMHPAT,0),U,7) D DD^%DT W Y
 W !?10,"OUTCOME:  ",$$EXTSET^XBFUNC(9002011.55,.08,$P(^AMHPATR(AMHPAT,0),U,8))
 ;
 W !!
DIE ;
 I '$D(^AMHPATR(AMHPAT)) S DIC="^AMHPATR(",DIC(0)="L",DLAYGO=9002011.55,X="`"_AMHPAT D ^DIC D ^XBFMK I Y=-1 W !!,"FAILED TO ADD PATIENT TO BH PATIENT DATA FILE" G X
 K DIE,DR,DA,DIU,DIV L +^AMHPATR(AMHPAT):10 E  W !!,"Can't lock global" H 5 Q
 S DA=AMHPAT,DIE="^AMHPATR(",DR="[AMH UPDATE CASE OPEN/AMT/CLOSE" D ^DIE
 L -^AMHPATR(AMHPAT):10
 K DIE,DR,DA,DIU,DIV,DIW
 Q
X ;
 Q
