DIFG7 ;SFISC/DG(OHPRD)-CALLS TO DIC,DIE,DIK ;1/7/92  2:47 PM [ 04/02/2003   8:23 AM ]
 ;;22.0;VA FileMan;**1001**;APR 1, 2003
 ;;22.0;VA FileMan;;Mar 30, 1999
 ;THIS ROUTINE CONTAINS IHS MODIFICATIONS BY IHS/TUCSON/LAB 3/13/96
 ;This routine is modified to pass back to the caller, an array,
 ;DIFGYFE(file,da) of all entries that were either added or edited
 ;during the filegram install.  It is the responsibility of the 
 ;caller to kill DIFGYFE
 ;Per VHA Directive 10-93-142, this routine should not be modified.
CALLDIC ;
 I $D(^UTILITY("DIFG",$J,DIFGORDR,DIFGFILE,"DINUM")) S DINUM=^("DINUM")
 S DIADD=1,DIC(0)="FLI" I $P(^UTILITY("DIFG",$J,DIFGORDR,DIFGFILE,"X"),U,2)]"" S X="`"_X
 S DLAYGO=DIFGFILE
 S DITC=""
 D ^DIC
 K DITC
 ;----- BEGIN IHS MODIFICATIONS
 ;ORIGINAL MODIFICATIONS BY IHS/TUCSON/LAB 3/13/96
 ;COMMENTED OUT LINE BELOW AND REPLACED WITH NEXT LINE TO ADD ,K Q
 ;SO THAT IF THERE IS AN ERROR VARS WILL GET KILLED THEN QUIT
 ;I Y<1 S DIFGER=16_U_$P(^UTILITY("DIFG",$J,DIFGORDR,DIFGFILE,"MODE"),U,2) D ERROR^DIFG
 I Y<1 S DIFGER=16_U_$P(^UTILITY("DIFG",$J,DIFGORDR,DIFGFILE,"MODE"),U,2) D ERROR^DIFG,K Q
 ;ADDED NEXT LINE TO PASS BACK TO CALLER, THE IEN,FILE OF ENTRY ADDED
 S DIFGYFE(DIFGFILE,+Y)=$P(Y,U,3)
 ;COMMENTED LINE BELOW AND REPLACED BY NEXT LINE TO ADD LINE LABEL K
 ;SO IT COULD BE CALLED
 ;K DIADD,DLAYGO,DR,DINUM
K K DIADD,DLAYGO,DR,DINUM
 ;----- END IHS MODIFICATIONS
 Q
 ;
CALLDIE ;
 I DR[".01///"&($P(^DD(DIFGFILE,.01,0),U,5,99)["DINUM"!$D(^UTILITY("DIFG",$J,DIFGORDR,DIFGFILE,"DINUM"))) S DIFGDRVL=$P($P(DR,".01///",2),";"),DR=$P(DR,".01///"_DIFGDRVL)_$P(DR,".01///"_DIFGDRVL_";",2)
 NEW I F I=0:1 Q:'$D(@("D"_I))  K @("D"_I)
 S DITC=""
 D ^DIE K DITC
 ;----- BEGIN IHS MODIFICATION
 ;ORIGINAL MODIFICATION BY IHS/TUCSON/LAB 3/13/96
 ;NEW LINE ADDED TO PASS BACK IEN,FILE THAT WAS EDITED
 I $G(DA),'$D(DIFGYFE(DIFGFILE,DA)) S DIFGYFE(DIFGFILE,DA)=""
 ;----- END IHS MODIFICATION
 Q
 ;
WP ;PROCESS WORD PROCESSING FIELD
 S DIFG("FIELD")=^UTILITY("DIFG",$J,DIFGORDR,DIFGFILE,"WP",0)
 F DIFGI=1:1 Q:'$D(^UTILITY("DIFG",$J,DIFGORDR,DIFGFILE,"WP",DIFGI))  D:^(DIFGI)[";" CHANGE S DR=DIFG("FIELD")_"///+"_^(DIFGI) D ^DIE
 K DR
 Q
 ;
CHANGE ;TEXT CONTAINS A ";"
 S DIFGSECP=^UTILITY("DIFG",$J,DIFGORDR,DIFGFILE,"WP",DIFGI) D PARSE^DIFG1 S ^UTILITY("DIFG",$J,DIFGORDR,DIFGFILE,"WP",DIFGI)="^S X="_DIFGSECP
 Q
 ;
CALLDIK ;
 D ^DIK
 Q
 ;
