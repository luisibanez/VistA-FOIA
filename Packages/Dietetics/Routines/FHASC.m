FHASC	; HISC/REL/NCA - Clinical Management ;2/13/95  14:12 
	;;5.0;Dietetics;;Oct 11, 1995
EN1	; Enter/Edit Nutrition Classifications
	S (DIC,DIE)="^FH(115.3,",DIC(0)="AEQLM",DIC("DR")=".01",DLAYGO=115.3 W ! D ^DIC K DIC,DLAYGO G KIL:"^"[X!$D(DTOUT),EN1:Y<1
	S DA=+Y,DR=".01:99" S:$D(^XUSEC("FHMGR",DUZ)) DIDEL=115.3 D ^DIE,KIL G EN1
EN2	; List Nutrition Classifications
	W ! S L=0,DIC="^FH(115.3,",FLDS=".01,99",BY=".01"
	S (FR,TO)="",DHD="NUTRITION CLASSIFICATIONS" D EN1^DIP,RSET Q
EN9	; Enter/Edit Nutrition Plans
	S (DIC,DIE)="^FH(115.5,",DIC(0)="AEQLM",DIC("DR")=".01",DLAYGO=115.5 W ! D ^DIC K DIC,DLAYGO G KIL:"^"[X!$D(DTOUT),EN9:Y<1
	S DA=+Y,DR=".01:99" S:$D(^XUSEC("FHMGR",DUZ)) DIDEL=115.5 D ^DIE,KIL G EN9
EN10	; List Nutrition Plans
	W ! S L=0,DIC="^FH(115.5,",FLDS=".01",BY=".01"
	S (FR,TO)="",DHD="NUTRITION PLANS" D EN1^DIP,RSET Q
RSET	K %ZIS S IOP="" D ^%ZIS
KIL	G KILL^XUSCLEAN
