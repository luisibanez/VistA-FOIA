BRNFOIA ; IHS/PHXAO/TMJ - ROI FOIA DISCLOSURES BY PURPOSE (BY DATE RANGE) ;  
 ;;2.0;RELEASE OF INFO SYSTEM;*1*;APR 10, 2003
 ;IHS/OIT/LJF 01/23/2008 PATCH 1 Added choice of facility to print
 ;                               Added date range limits
 ;
 ;A Yes Answer in field 2401 determines if this is a First Party Request
ASK ;Ask For Date Range
 ;
 ;
BD ;get beginning date
 ;W !! S DIR(0)="D^::EP",DIR("A")="Enter beginning ROI Initiated Date" D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 W !! S DIR(0)="D^:"_DT_":EP",DIR("A")="Enter beginning ROI Initiated Date" D ^DIR K DIR S:$D(DUOUT) DIRUT=1  ;IHS/OIT/LJF 01/23/2008 PATCH 1
 I $D(DIRUT) G END
 S BRNBD=Y
ED ;get ending date
 ;W ! S DIR(0)="D^"_BRNBD_"::EP",DIR("A")="Enter ending ROI Initiation Date"  D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 W ! S DIR(0)="D^"_BRNBD_":"_DT_":EP",DIR("A")="Enter ending ROI Initiation Date"  D ^DIR K DIR S:$D(DUOUT) DIRUT=1  ;IHS/OIT/LJF 01/23/2008 PATCH 1
 I $D(DIRUT) G BD
 S BRNED=Y
 S X1=BRNBD,X2=-1 D C^%DTC S BRNSD=X
 W !
 ;
 NEW BRNFAC,BRNFACN D ASKFAC^BRNU(.BRNFAC) I BRNFAC="" D ED Q            ;IHS/OIT/LJF 01/23/2008 PATCH 1
 I BRNFAC>0 S BRNFACN=$$GET1^DIQ(90264.2,BRNFAC,.01)  ;IHS/OIT/LJF 01/23/2008 PATCH 1
 ;
PRINT ;PRINT CLOSED DISCLOSURES BY DATE
 ;
 ;IHS/OIT/LJF 01/23/2008 PATCH 1
 ;S FLDS="[BRN FOIA SUBTOTAL PRINT]",BY="'(#.01),INTERNAL(#2401)=""Y"",+.07",DIC="^BRNREC(",L=0
 ;S FR=BRNBD,TO=BRNED
 S FLDS="[BRN FOIA SUBTOTAL PRINT]",BY="FACILITY,'(#.01),INTERNAL(#2401)=""Y"",+.07",DIC="^BRNREC(",L=0
 I BRNFAC=0 S FR="@,"_BRNBD,TO="ZZZ,"_BRNED
 E  S FR=BRNFACN_","_BRNBD,TO=BRNFACN_","_BRNED
 ;end of Patch 1 changes
 ;
 K DHIT,DIOEND,DIOBEG
 D EN1^DIP
END ;
 K BRNBD,BRNED,BRNSD,X,DD0,B Q
