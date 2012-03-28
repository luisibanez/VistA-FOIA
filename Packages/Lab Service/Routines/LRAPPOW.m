LRAPPOW ; IHS/DIR/AAB - POW PATIENT LOOK-UP 11/14/91 15:42 ;
 ;;5.2;LR;**1002**;JUN 01, 1998
 ;;5.2;LAB SERVICE;**72,114**;Sep 27, 1994
 I $D(^DPT(DFN,.52)),$P(^(.52),U,5)="Y" S X=$P(^(.52),U,6) D FLG
 I $D(^DPT(DFN,.322)) S X=$P($G(^(.322)),"^",10) D:X="Y" R
 Q
FLG W !!?19,$C(7),"*** THIS PATIENT WAS A PRISONER OF WAR ***",!! I X S X=$S($D(^DIC(22,X,0)):$P(^(0),U,1),1:"") W ?24,"POW PERIOD: ",X
 W !!,"FORWARD A DUPLICATE SET OF SLIDES,BLOCKS AND REPRESENTATIVE WET TISSUE TO:"
 W !!,?3,"DIRECTOR,ARMED FORCES INSTITUTE OF PATHOLOGY"
 W !,?3,"ATTENTION: FORMER POW REGISTRY"
 W !,?3,"WASHINGTON, D.C. 20306",!,"<A POW label (VA Form 10-5558) may be attached to packaged specimens>"
 W !!,"MARK CASE CLEARLY AS:"
 W "  FORMER POW  ",X
 W !,"NOTE IN APPROPRIATE FORM THAT MATERIAL HAS BEEN SENT TO THE AFIP"
 I $D(LRSS),LRSS="AU" D NOTE
 W !! Q
NOTE W !!,"Follow Guidelines for Performing Autopsy Examination on Former Prisoners of War (POW's)  PROFESSIONAL SERVICES LETTER  IL 11-82-17"
 W !,"Be sure to take appropriate samples of:",!,"BRAIN, NERVE, TESTES, PROSTATE, URINARY BLADDER, and KIDNEY"
 Q
R W $C(7),!!,$$CJ^XLFSTR("***THIS PATIENT SERVED IN THE PERSIAN GULF WAR***",IOM),!!
 W !,$$CJ^XLFSTR("***************",IOM),!
 W !,$$CJ^XLFSTR("Send a set of DUPLICATE paraffin blocks/smears, H & E slides for ",IOM)
 W !!,$$CJ^XLFSTR("Anatomic Path material and a copy of the Final Pathology Report to ",IOM)
 W !!,$$CJ^XLFSTR("the AFIP using the AFIP Requisition form.  ",IOM),!
 W !!,$$CJ^XLFSTR("***************",IOM),!
 Q
