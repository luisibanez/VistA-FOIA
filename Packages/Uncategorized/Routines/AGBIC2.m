AGBIC2 ; IHS/ASDS/EFG - ENTRY UTILITY FOR MANDATORY DATA ;  
 ;;7.1;PATIENT REGISTRATION;;AUG 25,2005
 ;
L1 ;
 D S1
 D ^AG1
 G K^AG0:$D(DFOUT)!$D(DTOUT)
 G UP:$D(DUOUT)
 I $D(DOG) G:'$D(AG("TEMP CHART")) K^AG0
 I $D(AG("TEMP CHART")) D  Q
 . D S1
 . D DOB^AG2A
L4 ;
 D S1
 D ^AGBIC2B
 G L1:$D(DUOUT)!$D(DTOUT)
 G K^AG0:$D(DFOUT)
 D CMMNR
L5 ;
 D S1
 D TRIBE^AG2A
 G L4:$D(DUOUT)
 G K^AG0:$D(DFOUT)!$D(DTOUT)
 I $D(^AUPNPAT(DFN,11)),$P(^(11),U,8)]"",$P(^AUTTTRI($P(^AUPNPAT(DFN,11),U,8),0),U,4)="Y" W !,"That TRIBE no longer valid" G L5
 D S1
 D IQTM^AG2A
 G L5:$D(DUOUT)
 G K^AG0:$D(DFOUT)!$D(DTOUT)
L5ELIG ;
 D S1
 D ^AGBIC2C
 D CALCELIG
 W *7,!!?15,"This patient's eligibility has been computed to be "
 W !?80-$L(AG("NARR1"))/2,AG("NARR1")
 W !!,"If you wish to have the eligibility recomputed you may reenter the Community,"
 W !,"Tribe, and/or Indian Quantum by entering ""^"" at this time.  "
 D S1
 D READ^AG
 G K^AG0:$D(DFOUT)!$D(DTOUT)
 G L4:$D(DUOUT)
L5AOPT ;
 I AGOPT(2)="Y" D  G L5:$D(DUOUT) I 1
 . D S1
 . D TRINUM^AGOPT2
 E  G L5:$D(DUOUT)
L5OPT ;
 I AGOPT(1)="Y" D  G L5AOPT:$D(DUOUT) I 1
 . D S1
 . D TQTM^AGOPT2
 E  G L5AOPT:$D(DUOUT)
L6OPT ;
 I AGOPT(8)="Y" D  G L5OPT:$D(DUOUT) I 1
 . D S1
 . D OTHRTR^AGOPT2
 E  G L5OPT:$D(DUOUT)
L7 ;
 D S1
 D BEN^AG2A
 G L6OPT:$D(DUOUT)
 G K^AG0:$D(DFOUT)!$D(DTOUT)
END ;
 K AG
 G ^AG3
S1 ;
 K DFOUT,DTOUT,DUOUT,DLOUT,DQOUT
 Q
UP ;
 S AG("EDIT")=""
 W !!,*7,*7,"Deleting Patient ",$P(^DPT(DFN,0),U)," ...."
 D Z1^AGKPAT
 D DFN^AGKPAT
 G L1^AG0
CKMINOR ;
 S DA=DFN
 S DIC=9000001
 S DR=1102.99
 D ^AGDICLK
 S Y="N"
 I $D(AG("LKPRINT")) D  G L5:$D(DUOUT),K^AG0:$D(DFOUT)!$D(DTOUT)
 . D:AG("LKPRINT")<18 ASKMINOR
 I Y="T" S Y="B"
 Q
ASKMINOR ;
 W *7,!!,"IS THIS THE MINOR CHILD OF A TRIBAL MEMBER? (Y/N) // "
 D READ^AG
 I (Y'["Y")&(Y'["N") D  G ASKMINOR
 . D YN^AG
 Q
CALCELIG ;EP
 S AG("ELG")=$P(^AUPNPAT(DFN,11),U,24)
 S AG("NARR1")=$S(AG("ELG")'="":$P(^AUTTBICE(AG("ELG"),0),U),1:"")
 Q
SETMINOR ;
 G:Y'="Y" QUITMNR
 S Y=$S($P(^AUPNPAT(DFN,11),U,25)="C":"B",1:"T")
 Q
QUITMNR ;
 S Y=$S($P(^AUPNPAT(DFN,11),U,25)="C":"C",$P(^(11),U,25)="B":"C",1:"N")
 Q
CKMNRES ;
 S DA=DFN
 S DIC=9000001
 S DR=1102.99
 D ^DIC
 S Y="N"
 I $D(AG("LKPRINT")) D  G L4:$D(DUOUT),K^AG0:$D(DFOUT)!$D(DTOUT)
 . D:AG("LKPRINT")<18 ASKMNRES
 Q
ASKMNRES ;
 W *7,!!,"IS EITHER PARENT ELIGIBLE FOR DIRECT OR CHS CARE? (Y/N) // "
 D READ^AG
 I (Y'["Y")&(Y'["N") D  G ASKMNRES
 . D YN^AG
 Q
SETMNRES ;
 G:Y'="Y" QUITRES
 I $P(^AUPNPAT(DFN,11),U,25)="T" S Y="B" Q
 S Y="C"
 Q
QUITRES ;
 S Y=$S($P(^AUPNPAT(DFN,11),U,25)="T":"T",$P(^(11),U,25)="B":"T",1:"N")
 Q
CMMNR ;EP
 I $P(^AUPNPAT(DFN,11),U,21)'="Y"&($P(^(11),U,22)'="Y") D  Q
 . D CKMNRES
 . D SETMNRES
 . S DA=DFN
 . S DR="1125///"_Y
 . S DIE="^AUPNPAT("
 . D ^DIE
 . D S1
 Q
TRBMNR ;EP
 S AG("TRIBE")="Y"
 I $D(^AUPNPAT(DFN,11)),$P(^(11),U,8)]"" S:$P(^AUTTTRI($P(^AUPNPAT(DFN,11),U,8),0),U,2)="000"!($P(^AUTTTRI($P(^AUPNPAT(DFN,11),U,8),0),U,2)>"979") AG("TRIBE")="N"
 I AG("TRIBE")="N" D  Q
 . D CKMINOR
 . D SETMINOR
 . S DA=DFN
 . S DR="1125///"_Y
 . S DIE="^AUPNPAT("
 . D ^DIE
 . D S1
 . D TRBFLG^AG2A
 Q
TRBVER ;
 Q:$D(DUOUT)
 S AG("TRBVER")=" "
 S:$D(^AUPNPAT(DFN,11)) AG("TRBVER")=$P(^(11),U,19)
 W !!,"HAS TRIBAL MEMBERSHIP BEEN VERIFIED? (Y/N/U): "
 W:(AG("TRBVER")["Y")!(AG("TRBVER")["N")!(AG("TRBVER")["U") AG("TRBVER")_" // "
 S Y=AG("TRBVER")
 D READ^AG
 S:$D(DLOUT)&(AG("TRBVER")'=" ") Y=AG("TRBVER")
 I (Y'["Y")&(Y'["N")&(Y'["U") D  G TRBVER
 .W !!,"Enter a ""Y"" for YES or an ""N"" for NO OR A ""U"" for UNABLE."
 S AG("TRIBE")=Y
SETRBFLG ;
 D S1
 D TRBFLG^AG2A
 I AG("TRIBE")'="Y" D  Q
 . D CKMINOR
 . D SETMINOR
 . S DA=DFN
 . S DR="1125///"_Y
 . S DIE="^AUPNPAT("
 . D ^DIE
 . D S1
 . D TRBFLG^AG2A
 Q
