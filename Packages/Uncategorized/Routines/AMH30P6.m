AMH30P6 ; IHS/CMI/LAB - POST INIT BH ;   [ 01/02/05  3:20 PM ]
 ;;3.0;IHS BEHAVIORAL HEALTH;**5,6**;JAN 27, 2003
 ;
 ;LORI -SEND OUT LISTER ITEMS
ENV ;EP 
 I $G(XPDENV)=1 S (XPDDIQ("XPZ1"),XPDDIQ("XPZ2"))=0
 F X="XPO1","XPZ1","XPZ2","XPI1" S XPDDIQ(X)=0
 I '$$INSTALLD("AMH*3.0*5") D SORRY(2)
 Q
 ;
PRE ;
 F DA=1:1:200 S DIK="^AMHSORT(" D ^DIK
 F DA=1:1:50 S DIK="^AMHDTER(" D ^DIK
 F DA=1:1:10 S DIK="^AMHRECD(" D ^DIK
 S AMHX=0 F  S AMHX=$O(^AMHTSET("C",14,AMHX)) Q:AMHX'=+AMHX  I $P(^AMHTSET(AMHX,0),U)="TELE-MENTAL HEALTH" S DA=AMHX,DIK="^AMHTSET(" D ^DIK
 D ^XBFMK
 Q
POST ;EP
 S DA=$O(^AMHPROB("B","305.10",0))
 I DA S DIE="^AMHPROB(",DR=".01///305.1;.05///305.1" D ^DIE,^XBFMK
 S AMHX=0 F  S AMHX=$O(^AMHPROB("B",291.89,AMHX)) Q:AMHX'=+AMHX  D
 .I $P(^AMHPROB(AMHX,0),U,2)["SLEEP DISORDER" S DA=AMHX,DIE="^AMHPROB(",DR=".05///291.82" D ^DIE,^XBFMK
 S AMHX=0 F  S AMHX=$O(^AMHPROB("B",292.89,AMHX)) Q:AMHX'=+AMHX  D
 .I $P(^AMHPROB(AMHX,0),U,2)["SLEEP DISORDER" S DA=AMHX,DIE="^AMHPROB(",DR=".05///292.85" D ^DIE,^XBFMK
 S DA=$O(^AMHPROB("B",39,0)) I DA S DIE="^AMHPROB(",DR=".05///V62.84" D ^DIE,^XBFMK
 S DA=$O(^AMHPROB("B",40,0)) I DA S DIE="^AMHPROB(",DR=".05///V62.84" D ^DIE,^XBFMK
 ;W !!,"adding new codes:"
 F AMHJ=1:1 S AMHX=$T(ADD+AMHJ) Q:$P(AMHX,";;",2)=""  D
 .S AMHC=$P(AMHX,";;",2)  ;CODE
 .S AMHD=$P(AMHX,";;",3)  ;DESCRIPTION .02
 .S AMHM=$P(AMHX,";;",4)  ;MAP TO ICD .05
 .S AMHP=$P(AMHX,";;",5)  ;MHSS PROBLEM CODE
 .S AMHCAT=$P(AMHX,";;",6)  ;CATEGORY
 .;add to mhss problem codes if appropriate
 .W !?5,"adding ",AMHC
 .I $L($P(AMHC,"."))<3 D
 ..D ^XBFMK
 ..S DA=$O(^AMHPROBC("B",AMHC,0))
 ..I 'DA D ADDPC
 ..I 'DA Q
 ..;now edit the code
 ..S DIE="^AMHPROBC(",DR=".02///"_AMHD_";.03///"_AMHCAT
 ..D ^DIE
 ..I $D(Y) W "    editing problem code failed"
 .D ^XBFMK
 .S DA=$O(^AMHPROB("B",AMHC,0))
 .I DA W "  Already have code ",AMHC," will edit." G PADDSE
 .S X=AMHC,DIC="^AMHPROB(",DIC(0)="L" K DD,D0,DO S DIADD=1,DLAYGO=9002012.2 D FILE^DICN K DIADD,DLAYGO,DD,DO,D0
 .I Y=-1 W "  adding failed in dsm file" D ^XBFMK Q
 .S DA=+Y
PADDSE .;
 .S DIE="^AMHPROB(",DR=".02///"_AMHD_";.05///"_AMHM_";.03///"_AMHP
 .D ^DIE
 .I $D(Y) W " editing ",AMHC," failed dsm file."
 .K DA,DR,DIE,DIU,DIV,DIW
 .Q
 D ^AMHPAR
 D ^AMH30P6B
 Q
ADDPC ;
 S X=AMHC,DIC="^AMHPROBC(",DIC(0)="L" K DD,D0,DO S DIADD=1,DLAYGO=9002012.4 D FILE^DICN K DIADD,DLAYGO,DD,DO,D0
 I Y=-1 W "  adding failed." Q
 S DA=+Y
 Q
INSTALLD(AMHSTAL) ;EP - Determine if patch AMHSTAL was installed, where
 ; AMHSTAL is the name of the INSTALL.  E.g "AG*6.0*11".
 ;
 NEW AMHY,DIC,X,Y
 S X=$P(AMHSTAL,"*",1)
 S DIC="^DIC(9.4,",DIC(0)="FM",D="C"
 D IX^DIC
 I Y<1 D IMES Q 0
 S DIC=DIC_+Y_",22,",X=$P(AMHSTAL,"*",2)
 D ^DIC
 I Y<1 D IMES Q 0
 S DIC=DIC_+Y_",""PAH"",",X=$P(AMHSTAL,"*",3)
 D ^DIC
 S AMHY=Y
 D IMES
 Q $S(AMHY<1:0,1:1)
IMES ;
 D MES^XPDUTL($$CJ^XLFSTR("Patch """_AMHSTAL_""" is"_$S(Y<1:" *NOT*",1:"")_" installed.",IOM))
 Q
SORRY(X) ;
 KILL DIFQ
 I X=3 S XPDQUIT=2 Q
 S XPDQUIT=X
 W *7,!,$$CJ^XLFSTR("Sorry....FIX IT!",IOM)
 Q
ADD ;
 ;;22.2;;INSOMNIA DUE TO MENTAL DISORDER;;327.02;;22;;PSYCHOSOCIAL PROBLEMS
 ;;22.3;;HYPERSOMNIA DUE TO MENTAL DISORDER;;327.15;;22;;PSYCHOSOCIAL PROBLEMS
 ;;22.4;;BEHAVIORAL INSOMNIA CHILDHOOD;;V69.50;;22;;PSYCHOSOCIAL PROBLEMS
 ;;
