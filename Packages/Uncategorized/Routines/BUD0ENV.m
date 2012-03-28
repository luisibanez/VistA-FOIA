BUD0ENV ; IHS/CMI/LAB - environmental check 13 Jan 2010 7:22 AM ;
 ;;5.0;IHS/RPMS UNIFORM DATA SYSTEM;;JAN 18, 2011;Build 12
 ;
ENV ;
 ; The following line prevents the "Disable Options..." and "Move
 ; Routines..." questions from being asked during the install.
 I $G(XPDENV)=1 S (XPDDIQ("XPZ1"),XPDDIQ("XPZ2"))=0
 F X="XPO1","XPZ1","XPZ2","XPI1" S XPDDIQ(X)=0
 I $$VERSION^XPDUTL("BJPC")'="2.0" D SORRY(2)
 I $$VERSION^XPDUTL("BGP")'>"9.0" D SORRY(2)
 ;I '$D(^DIC(9.4,"C","LEX")) D MES^XPDUTL($$CJ^XLFSTR("Lexicon is *NOT* installed.",IOM)) D SORRY(2)
 Q
 ;
 ;
PRE ;
 ;ADD ALL OTHERS BACK IN
 F DA=1:1:50 S DIK="^BUDTCNTL(" D ^DIK
 F DA=1:1:50 S DIK="^BUDTIL(" D ^DIK
 F DA=1:1:50 S DIK="^BUDTTFIV(" D ^DIK
 F DA=1:1:50 S DIK="^BUDTTTA(" D ^DIK
 Q
POST ;
 ;move site parameters from 04 to 05 on first time install only
 I '$O(^BUDTSITE(0)) D
 .S BUDX=0 F  S BUDX=$O(^BUDNSITE(BUDX)) Q:BUDX'=+BUDX   D
 ..M ^BUDTSITE(BUDX)=^BUDNSITE(BUDX)
 ..S DA=BUDX,DIK="^BUDTSITE(" D IX1^DIK
 D ^BUD0Z
 ;create and populate drug taxonomy
 D DRUG
 D LAB
 Q
LAB ;EP
 S BUDX="BUD HEPATITIS B TESTS" D LAB1
 S BUDX="BUD HEPATITIS C TESTS" D LAB1
 Q
LAB1 ;
 S BUDDA=$O(^ATXLAB("B",BUDX,0))
 Q:BUDDA  ;taxonomy already exisits
 W !,"Creating ",BUDX," Taxonomy..."
 S X=BUDX,DIC="^ATXLAB(",DIC(0)="L",DIADD=1,DLAYGO=9002228 D ^DIC K DIC,DA,DIADD,DLAYGO,I
 I Y=-1 W !!,"ERROR IN CREATING ",BUDX," TAX" Q
 S BUDTX=+Y,$P(^ATXLAB(BUDTX,0),U,2)=BUDX,$P(^(0),U,5)=DUZ,$P(^(0),U,6)=DT,$P(^(0),U,8)="B",$P(^(0),U,9)=60
 S ^ATXLAB(BUDTX,21,0)="^9002228.02101PA^0^0"
 S DA=BUDTX,DIK="^ATXAX(" D IX1^DIK
 Q
 ;
INSTALLD(BUDSTAL) ;EP - Determine if patch BUDSTAL was installed, where
 ; BUDSTAL is the name of the INSTALL.  E.g "AG*6.0*11".
 ;
 NEW BUDY,DIC,X,Y
 S X=$P(BUDSTAL,"*",1)
 S DIC="^DIC(9.4,",DIC(0)="FM",D="C"
 D IX^DIC
 I Y<1 D IMES Q 0
 S DIC=DIC_+Y_",22,",X=$P(BUDSTAL,"*",2)
 D ^DIC
 I Y<1 D IMES Q 0
 S DIC=DIC_+Y_",""PAH"",",X=$P(BUDSTAL,"*",3)
 D ^DIC
 S BUDY=Y
 D IMES
 Q $S(BUDY<1:0,1:1)
IMES ;
 D MES^XPDUTL($$CJ^XLFSTR("Patch """_BUDSTAL_""" is"_$S(Y<1:" *NOT*",1:"")_" installed.",IOM))
 Q
SORRY(X) ;
 KILL DIFQ
 I X=3 S XPDQUIT=2 Q
 S XPDQUIT=X
 W *7,!,$$CJ^XLFSTR("Sorry....FIX IT!",IOM)
 Q
DRUG ;EP set up drug taxonomies
 S ATXFLG=1
 S BUDX="BUD DIABETES MEDS TAX",BUDTAX="",BUDNDCT="BUD DIABETES MEDS NDC" D DRUG1
 K ATXFLG,BUDX,BUDDA,BUDTX,BUDNDCT,BUDTAX
 Q
DRUG1 ;
 W !,"Creating ",BUDX," Taxonomy..."
 S BUDTX=$O(^ATXAX("B",BUDX,0))
 I 'BUDTX D  Q:Y=-1
 .S X=BUDX,DIC="^ATXAX(",DIC(0)="L",DIADD=1,DLAYGO=9002226 D ^DIC K DIC,DA,DIADD,DLAYGO,I
 .I Y=-1 W !!,"ERROR IN CREATING ",BUDX," TAX" Q
 .S BUDTX=+Y,$P(^ATXAX(BUDTX,0),U,2)=BUDX,$P(^(0),U,8)=0,$P(^(0),U,9)=DT,$P(^(0),U,12)=173,$P(^(0),U,13)=0,$P(^(0),U,15)=50,^ATXAX(BUDTX,21,0)="^9002226.02101A^0^0"
 S DA=BUDTX,DIK="^ATXAX(" D IX1^DIK
 I $G(BUDTAX)]"" D
 .S A=0,B="" F  S A=$O(^ATXAX(BUDTX,21,A)) Q:A'=+A  S B=A
 .S BUDC=B
 .S ^ATXAX(BUDTX,21,0)="^9002226.02101A^"_B_U_B
 .S Z=$O(^ATXAX("B",BUDTAX,0))
 .S J=0 F  S J=$O(^PSDRUG(J)) Q:J'=+J  S C=$P($G(^PSDRUG(J,0)),U,2) I C]"",$D(^ATXAX(Z,21,"B",C)) D
 ..Q:$D(^ATXAX(BUDTX,21,"B",J))
 ..S BUDC=BUDC+1,^ATXAX(BUDTX,21,BUDC,0)=J_U_J
 I $G(BUDNDCT)]"" D
 .S A=0,B="" F  S A=$O(^ATXAX(BUDTX,21,A)) Q:A'=+A  S B=A
 .S BUDC=B
 .S ^ATXAX(BUDTX,21,0)="^9002226.02101A^"_B_U_B
 .S Z=$O(^ATXAX("B",BUDNDCT,0))
 .S J=0 F  S J=$O(^PSDRUG(J)) Q:J'=+J  S C=$P($G(^PSDRUG(J,2)),U,4) I C]"",$D(^ATXAX(Z,21,"B",C)) D
 ..Q:$D(^ATXAX(BUDTX,21,"B",J))
 ..S BUDC=BUDC+1,^ATXAX(BUDTX,21,BUDC,0)=J_U_J
 S DA=BUDTX,DIK="^ATXAX(" D IX1^DIK
 Q
 ;
