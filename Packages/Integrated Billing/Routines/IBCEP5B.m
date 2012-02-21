IBCEP5B ;ALB/TMP - EDI UTILITIES for prov ID ;29-SEP-00
 ;;2.0;INTEGRATED BILLING;**137,239,232**;21-MAR-94
 ;
NEWID(IBFILE,IBINS,IBPRV,IBPTYP,IBIEN,IBF) ; Generic add prov id
 ; at both prov (file 355.9) and ins co levels (355.91)
 ; IBFILE = 355.9 or 355.91 - the file being edited
 ; IBINS = ien of ins co (36) or *ALL* for all ins co
 ; IBPRV = vp ien of billing prov
 ; IBPTYP = ien of prov type (file 355.96)
 ; IBIEN = ien of entry being added (req'd)
 ; IBF = 1 if deleting from ins-related options, "" from prov-related
 N DIC,DIR,X,Y,Z,DA,DR,DIE,DO,DD,DLAYGO,DTOUT,DUOUT,IBQ,IBCUND,IB3559,IB35591,Q,IBDR,IBID
 S IB35591(.03)="",IBPTYP=$G(IBPTYP)
 F Z=.04,.05,.03 D  G:Z="" NEWQ
 . I $S(Z'=.03:1,1:$S('$G(IBINS):0,1:$G(IBCUND))) D  Q:Z=""
 .. N DA
 .. I Z'=.03 S DIR(0)=IBFILE_","_Z
 .. I Z=.03 D
 ... S DIR(0)="PAO^355.95:AEMQ"
 ... S DIR("S")="I $O(^IBA(355.96,""AUNIQ"","_IBINS_",Y,"_$G(IB3559(.04))_","_$G(IB3559(.05))_","_IBPTYP_",0))!($O(^IBA(355.96,""AUNIQ"","_IBINS_",Y,"_$G(IB3559(.04))_",0,"_IBPTYP_",0)))"
 ... S DIR("S")=DIR("S")_"!($O(^IBA(355.96,""AUNIQ"","_IBINS_",Y,0,"_$G(IB3559(.05))_","_IBPTYP_",0)))!($O(^IBA(355.96,""AUNIQ"","_IBINS_",Y,0,0,"_IBPTYP_",0)))"
 ... S DIR("?",1)="Care unit describes areas of service and is assigned by the payer, if",DIR("?")="  applicable.  Use Care Unit Maintenance to add or modify care units."
 .. S DA=0
 .. I Z=.04,$P($G(^IBE(355.97,+IBPTYP,0)),U,3)="1A" D SETDIR(.DIR)
 .. D ^DIR K DIR
 .. I $D(DTOUT)!$D(DUOUT) S Z="" K IB3559,IB35591 Q
 .. S IB3559(Z)=$S(Z'=.03:$P(Y,U),1:$S($P(Y,U)>0:$P(Y,U),1:"*N/A*"))
 . I Z=.05 D
 .. S IBCUND=$$CAREUN^IBCEP3(IBINS,IBPTYP,IB3559(.04),IB3559(.05),IB3559(.05)=3)
 .. S:'IBCUND!($G(IB3559(.03))=0) IB3559(.03)="*N/A*"
 .. I '$G(IBINS) S IBINS="*ALL*"
 . I Z=.03 D CAREUN^IBCEP5C
 ;
 I $D(IB3559) D
 . N Q,Z2,Z3,Z4,Z5,Z6,IBLAST,IBOK,DIR,Y,X
 . S IBLAST=0
 . D DISP^IBCEP4("Q",IBINS,IBPTYP,IB3559(.04),IB3559(.05),1)
 . W !!,"THE FOLLOWING WAS CHOSEN:"
 . S Q=0 F  S Q=$O(Q(Q)) Q:'Q  W !,?3,Q(Q)
 . I IBCUND W !,?3,"CARE UNIT: "_$$EXPAND^IBTRE(355.96,.01,IB3559(.03))
 . S Z2=IBINS,Z3=IB35591(.03),Z4=IB3559(.04),Z5=IB3559(.05),Z6=IBPTYP
 . S IBOK=1
 . ; If both forms, chk for specific
 . I 'Z4 S IBOK=$$COMBOK^IBCEP5C(IBFILE,IBPRV_U_4_U_Z2_U_Z3_U_Z4_U_Z5_U_Z6,1,$G(IBFILE)=355.91)
 . ; If specific form, chk for all
 . I IBOK,Z4 S IBOK=$$COMBOK^IBCEP5C(IBFILE,IBPRV_U_4_U_Z2_U_Z3_U_Z4_U_Z5_U_Z6,0,$G(IBFILE)=355.91)
 . ; If both care types, chk for specific
 . I IBOK,'Z5 S IBOK=$$COMBOK^IBCEP5C(IBFILE,IBPRV_U_5_U_Z2_U_Z3_U_Z4_U_Z5_U_Z6,1,$G(IBFILE)=355.91)
 . ; If specific care type, chk for all
 . I IBOK,Z5 S IBOK=$$COMBOK^IBCEP5C(IBFILE,IBPRV_U_5_U_Z2_U_Z3_U_Z4_U_Z5_U_Z6,0,$G(IBFILE)=355.91)
 . I 'IBOK K IB3559,IB35591
 . I IBOK D
 .. S DIR(0)=IBFILE_",.07"
 .. W ! D ^DIR K DIR
 .. S IBID=Y
 .. I $D(DTOUT)!$D(DUOUT) K IB3559,IB35591 S IBOK=0 Q
 .. S IBDR=$S(IBFILE=355.9:$S($G(IBINS):".02////"_IBINS_";",1:""),1:"")_$S($G(IBCUND):".03////"_$S(IB35591(.03):IB35591(.03),1:"*N/A*")_";",1:"")_".04////"_IB3559(.04)_";.05////"_IB3559(.05)_";.06////"_IBPTYP_$S(IBID'="":";.07////"_IBID,1:"")
 .. ;
 .. I $G(IBIEN) D
 ... S DR=IBDR,DA=IBIEN,DIE="^IBA("_IBFILE_","
 ... D ^DIE
 ... I $D(Y) K IB3559,IB35591 S IBOK=0
 ;
NEWQ I '$D(IB3559),$G(IBIEN) D
 . N DIR,DIK,DA,X,Y
 . S DA=IBIEN,DIK="^IBA("_IBFILE_"," D ^DIK
 . S DIR(0)="EA",DIR("A",1)=$S('$G(IBOK):"",1:"PROBLEM ENCOUNTERED FILING THE RECORD - ")_"RECORD NOT ADDED",DIR("A")="PRESS ENTER to continue " W ! D ^DIR K DIR
 Q
 ;
CHG(IBFILE,IBDA) ; Generic call - edit prov id
 ; IBFILE = 355.9 or 355.91 (file being edited)
 ; IBDA = ien in file
 ;
 N DIR,DIE,DA,DR,IBCUCHK,IBOK,IB0,IBOLD,X,Y,Z
 F Z=1:1:3 L +^IBA(IBFILE,IBDA):5 Q:$T  W !,"Attempting to lock record"
 I '$T D  G CHGQ
 . W !,"RECORD LOCKED BY ANOTHER USER - TRY AGAIN LATER"
 . D ENTER(.DIR)
 . W ! D ^DIR K DIR W !
 S (IB0,IBOLD)=$G(^IBA(IBFILE,IBDA,0))
 G:IB0="" CHGQ
 F Z=.04,.05,.06,.03 S IBOK=$$EDIT(IBFILE,Z,IB0,IBOLD,IBDA,0) S:IBOK="*ALL*" IBOK="" Q:$P(IBOK,U,2)  S $P(IB0,U,Z*100)=$P(IBOK,U)
 I $P(IBOK,U,2) S DIR(0)="EA",DIR("A")="NO CHANGES MADE, PRESS ENTER TO CONTINUE: " W ! D ^DIR K DIR W ! G CHGQ
 S IBOK=$$EDIT(IBFILE,.07,IB0,IBOLD,IBDA,1)
 I '$P(IBOK,U,2) S $P(IB0,U,7)=$P(IBOK,U)
 I $P(IBOK,U,2)!(IB0=IBOLD) S DIR(0)="EA",DIR("A")="NO CHANGES MADE, PRESS ENTER TO CONTINUE: " W ! D ^DIR K DIR W ! G CHGQ
 S IBCUCHK=$$CUCHK^IBCEP5C(IBDA,IB0) G:IBCUCHK CHGQ
 S DR=""
 F Z=2,4:1:7,3 I $P(IB0,U,Z)'=$P(IBOLD,U,Z) S DR=DR_$S(DR'="":";",1:"")_(Z/100)_"///"_$S($P(IB0,U,Z)'="@":"/",1:"")_$P(IB0,U,Z)
 I DR'="" S DIE="^IBA("_IBFILE_",",DA=IBDA D ^DIE
CHGQ L -^IBA(IBFILE,IBDA)
 Q
 ;
DEL(IBFILE,IBDA,IBF) ; Delete prov specific ID's
 ; IBFILE = 355.9 or 355.91 for the file
 ; IBDA = ien of entry in file IBFILE
 ; IBF = 1 if deleting from ins co-related options, ""
 ;       from prov-related options
 D DEL^IBCEP5C(IBFILE,IBDA,$G(IBF))
 Q
 ;
EDIT(IBFILE,IBFLD,IB0,IBOLD,IBIEN,IBCK1) ; Generic edit flds
 N DIR,Y,X,IB,IB1,IBCUVAL,IBCUY,IBFLD0,IBNEW,IBPRV,IBVAL,IBIVAL,IBINS,IBCUCHK,IBOK,DUOUT,DTOUT
 I IBFILE=355.91,IBFLD=.02 S IBNEW="" G EDITQ ; No .02 in file 355.91
 S IBCUCHK=1,IBCUVAL=""
 S IBFLD0=IBFLD*100,IBPRV=$S(IBFILE=355.9:$P(IB0,U),1:""),IBNEW=""
 S IBINS=$P(IB0,U,$S(IBFILE=355.9:2,1:1))
 I IBFLD'=.03 S IBVAL=$$EXPAND^IBTRE(IBFILE,IBFLD,$P(IB0,U,IBFLD0)),IBIVAL=$P(IB0,U,IBFLD0)
 I IBFLD=.03,$S('IBINS:1,1:'$$CAREUN^IBCEP3(IBINS,$P(IB0,U,6),$P(IB0,U,4),$P(IB0,U,5),$P(IB0,U,5)=3)) S:$P(IB0,U,3) IBNEW="@" G EDITQ
 I IBFLD=.03 S IBVAL=$P($G(^IBA(355.95,+$G(^IBA(355.96,+$P(IB0,U,3),0)),0)),U),IBIVAL=$P(IB0,U,3) D
 . S IBCUCHK=0,IBCUVAL=$P($G(^IBA(355.96,+IBIVAL,0)),U,1) I IBCUVAL="" Q
 . I $O(^IBA(355.96,"AUNIQ",IBINS,IBCUVAL,$P(IB0,U,4),$P(IB0,U,5),$P(IB0,U,6),"")) S IBCUCHK=1 Q
 . I $O(^IBA(355.96,"AUNIQ",IBINS,IBCUVAL,$P(IB0,U,4),0,$P(IB0,U,6),""))  S IBCUCHK=1 Q
 . I $O(^IBA(355.96,"AUNIQ",IBINS,IBCUVAL,0,$P(IB0,U,5),$P(IB0,U,6),"")) S IBCUCHK=1 Q
 . I $O(^IBA(355.96,"AUNIQ",IBINS,IBCUVAL,0,0,$P(IB0,U,6),"")) S IBCUCHK=1 Q
 . S IBIVAL="@"
 I IBFLD'=.02 D
 . N DA
 . S DIR(0)=$S(IBFLD'=.03:IBFILE_","_IBFLD_"AO",1:"PAO^355.95:AEMQ")
 . I IBFLD=.03 D  Q:$P(IB0,U,4)=""!($P(IB0,U,5)="")!($P(IB0,U,6)="")
 .. S DIR("A")="CARE UNIT: "
 .. S DIR("S")="I $D(^IBA(355.96,""AUNIQ"",IBINS,Y,$P(IB0,U,4),$P(IB0,U,5),$P(IB0,U,6)))!($D(^IBA(355.96,""AUNIQ"",IBINS,Y,$P(IB0,U,4),0,$P(IB0,U,6))))"
 .. S DIR("S")=DIR("S")_"!($D(^IBA(355.96,""AUNIQ"",IBINS,Y,0,$P(IB0,U,5),$P(IB0,U,6))))!($D(^IBA(355.96,""AUNIQ"",IBINS,Y,0,0,$P(IB0,U,6))))"
 . I IBFLD'=.03 S DIR("A")=$$GET1^DID(IBFILE,IBFLD,,"LABEL")_": "
 . S:IBVAL'=""&(IBCUCHK) DIR("A")=DIR("A")_IBVAL_"// "
 . S DA=0
 . F  D ^DIR S IBOK=0 D  Q:IBOK
 .. I $D(DUOUT)!$D(DTOUT) S IBOK=1 Q
 .. I X="",$P(IB0,U,(IBFLD*100))'="" S (X,Y)=$P(IB0,U,(IBFLD*100))
 .. I IBFLD=.06,$P(IB0,U,4)'=1,$P($G(^IBE(355.97,$S(+Y:+Y,1:+$P(IB0,U,6)),0)),U,3)="1A" W !,"BLUE CROSS IS ONLY ALLOWED FOR UB92 ONLY" Q
 .. S IBOK=1
 . K DIR
 . I IBFLD=.03,'$D(DTOUT),'$D(DUOUT) D  S Y=IBCUY
 .. S IBCUVAL=+$G(^IBA(355.96,+Y,0))
 .. S IBCUY=+$O(^IBA(355.96,"AUNIQ",IBINS,IBCUVAL,$P(IB0,U,4),$P(IB0,U,5),$P(IB0,U,6),0))
 .. I 'IBCUY S IBCUY=+$O(^IBA(355.96,"AUNIQ",IBINS,IBCUVAL,$P(IB0,U,4),0,$P(IB0,U,6),0))
 .. I 'IBCUY S IBCUY=+$O(^IBA(355.96,"AUNIQ",IBINS,IBCUVAL,0,$P(IB0,U,5),$P(IB0,U,6),0))
 .. I 'IBCUY S IBCUY=+$O(^IBA(355.96,"AUNIQ",IBINS,IBCUVAL,0,0,$P(IB0,U,6),0))
 .. I 'IBCUY S IBCUY="@"
 . I IBIVAL'="",IBCUCHK,($P(Y,U)=IBIVAL!(X="")) S IBNEW=IBIVAL Q
 . I 'IBCUCHK,X="" S IBNEW=IBIVAL Q
 . I X'="@",($S(X="":IBIVAL'="",1:0)!$D(DTOUT)!$D(DUOUT)) S IBNEW="^1" Q
 . S IBNEW=$S(X'="@":$P(Y,U),1:X)
 . I IBFLD=.03,X="" S IBNEW="" ; No care unit selected
 I IBFLD=.02 D  ; Only file 355.9
 . N DIR,X,Y,DIC,DA,IBIT
 . S IBIT=$$GET1^DID(355.9,.02,,"INPUT TRANSFORM")
 . S DIR(0)="FAO^1:30"
 . S DIR("A")="INSURANCE CO: "_$S(IBVAL'="":IBVAL_"// ",1:" "),DIR("?")="^N IBHELP,Z D HELP^DIE(355.9,,.02,""A"",""IBHELP"") S Z=0 F  S Z=$O(IBHELP(""DIHELP"",Z)) Q:'Z  W !,IBHELP(""DIHELP"",Z)"
 . F  W ! D ^DIR D  I IBNEW'="" K DIR Q
 .. I $D(DTOUT)!$D(DUOUT) S IBNEW="^1" Q
 .. I IBIVAL'="",($P(Y,U)=IBIVAL!(X="")) S IBNEW=IBIVAL Q
 .. I X="@" S IBNEW="@" Q
 .. I X="",IBIVAL="" S IBNEW="*ALL*" Q
 .. S DIC="^DIC(36,",DIC(0)="EMQ",DIC("S")="X IBIT I $D(X)" D ^DIC
 .. I Y>0 S IBNEW=$P(Y,U) Q
 .. S Y="",IBNEW="^1"
 G:IBNEW="^1"!(IBNEW=IBIVAL)!(IBFLD=.07) EDITQ
 I $G(IBCK1) D
 . N X1,X2,X3,X4,X5,X6
 . S X1=$S(IBFILE=355.9:$S(IBFLD'=.01:IBPRV,1:IBNEW),1:"")
 . S X2=$S(IBFILE=355.9:$S(IBFLD'=.02:$P(IB0,U,2),1:IBNEW),1:$S(IBFLD'=.01:$P(IB0,U),1:IBNEW))
 . S X3=$S(IBFLD'=.03:$P(IB0,U,3),1:IBNEW),X4=$S(IBFLD'=.04:$P(IB0,U,4),1:IBNEW),X5=$S(IBFLD'=.05:$P(IB0,U,5),1:IBNEW),X6=$S(IBFLD'=.06:$P(IB0,U,6),1:IBNEW)
 . I X2="" S X2="*ALL*"
 . I X3="" S X3="*N/A*"
 . I IBFILE=355.9,$S(X4=""!(X5="")!(X6=""):1,$O(^IBA(355.9,"AUNIQ",X1,X2,X3,X4,X5,X6,0)):$O(^(0))'=IBIEN,1:0) S IBNEW=IBNEW_"^2" Q
 . I IBFILE=355.91,$S(X4=""!(X5="")!(X6=""):1,$O(^IBA(355.91,"AUNIQ",X2,X3,X4,X5,X6,0)):$O(^(0))'=IBIEN,1:0) S IBNEW=IBNEW_"^2" Q
 . F IB=2,3 D  Q:$P(IBNEW,U,3)=3
 .. S IB1=(X2="*ALL*"!(X3="*N/A*"))
 .. I IBFILE=355.9,IB=2,$S($P(IBOLD,U,2)="":X2'="*ALL*",1:$P(IBOLD,U,2)'=X2) S X2=""
 .. I IB=3,$S($P(IBOLD,U,3)="":X3'="*N/A*",1:$P(IBOLD,U,3)'=X3) S X3=""
 .. I '$$COMBOK^IBCEP5C(IBFILE,IBPRV_U_(IBFLD*100)_U_X2_U_X3_U_X4_U_X5_U_X6,IB1) S IBNEW="^3"
 ;
EDITQ Q IBNEW
 ;
SETDIR(DIR) ; Sets dir for BLUE CROSS only UB92 form type
 S DIR("B")="UB92",$P(DIR(0),U,3)="K:Y'=1 X",DIR("?")="ONLY UB92 FORM TYPE IS VALID FOR BLUE CROSS ID"
 Q
 ;
ENTER(DIR) ;
 S DIR(0)="EA",DIR("A")="PRESS ENTER TO CONTINUE: "
 Q
 ;
