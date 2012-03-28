BLRRLMV ; cmi/anch/maw - BLR View/Refile Raw Reference Lab Messages ;
 ;;5.2;LR;**1021**;Jul 27, 2006
 ;;1.0;BLR REFERENCE LAB;;MAR 14, 2005
 ;
 ;
 ;
 ;this routine will allow the user to verify reference lab results
 ;before passing them on to PCC
 ;
MAIN ;EP - this is the main routine driver
 S BLRMF=$$ASK
 I $G(BLRMF)="F" D  Q
 . S BLRRF=$$ASKF
 . I $G(BLRRF)]"" D LOOP
 . D EOJ
 I $G(BLRMF)="M" D
 . S BLRMSG=$$ASKM
 . I $G(BLRMSG) D SM(BLRMSG)
 D EOJ
 Q
 ;
ASK() ;-- ask to look by message number or file
 S DIR(0)="S^M:Message Number;F:File",DIR("A")="Select by Message Number or File Name "
 D ^DIR
 K DIR
 Q $G(Y)
 ;
ASKF() ;-- ask file
 S DIR(0)="P^9009026.1",DIR("A")="Which Reference Lab Import File Do You Want To View "
 D ^DIR
 K DIR
 Q +$G(Y)
 ;
ASKM() ;-- ask message number
 S DIR(0)="N",DIR("A")="Which Message Would You Like to View/Refile "
 D ^DIR
 K DIR
 Q +$G(Y)
 ;
LOOP ;-- loop the xref and call VER
 I $O(^BLRRLG("B",0))="" D  Q
 . W !,"No Files to View"
 S DIC="^INTHU("
 S BLRVDA=0 F  S BLRVDA=$O(^BLRRLG(BLRRF,1,BLRVDA)) Q:'BLRVDA!$G(BLRVQ)  D
 . Q:$G(BLRVQ)
 . W @IOF
 . S (DA,BLRUIF)=$G(^BLRRLG(BLRRF,1,BLRVDA,0))
 . I '$G(^INTHU(BLRUIF,0)) D  Q
 .. W !!,"GIS HL7 Message "_BLRUIF_" has already been purged, cannot display"
 . D DIQ^BLRLMR(DIC,DA)
 W !!,"No More Messages in Batch, Exiting"
 H 2
 Q
 ;
SM(BLRUIF) ;-- view the message
 I '$D(^INTHU(BLRUIF)) D  Q
 . W !!,"GIS HL7 Message "_BLRUIF_" has already been purged, cannot display"
 S DIC="^INTHU("
 Q:$G(BLRVQ)
 W @IOF
 S (DA,BLRUIF)=BLRUIF
 D DIQ^BLRLMR(DIC,DA)
 Q
 ;
REF(UIF) ;-- mark entry as verified
 S ^INLHSCH(0,$H,UIF)=""
 Q
 ;cmi/flag/maw 4/8/2004 the following is not used anymore
 S BLRRL=$P($G(^BLRSITE(DUZ(2),"RL")),U)
 Q:'$G(BLRRL)
 S BLRRLE=$P($G(^BLRRL(BLRRL,0)),U)
 S BLRSCR=$O(^INRHS("B","Generated: HL IHS LAB R01 "_BLRRLE_" IN-I",0))
 Q:'$G(BLRSCR)
 S BLRRUN="S BLRRFL=$$^IS"_$$ZERO(BLRSCR)_BLRSCR_"("_UIF_")"
 X BLRRUN
 Q
 ;
EOJ ;-- kill variables
 D JOB^BLRPARAM
 D EN^XBVK("BLR")
 Q
 ;
ZERO(SCR)          ;-- find out how many zeros need to be installed
 I $L(BLRSCR)=1 Q "0000"
 I $L(BLRSCR)=2 Q "000"
 I $L(BLRSCR)=3 Q "00"
 I $L(BLRSCR)=4 Q "0"
 Q "0"
 ;
