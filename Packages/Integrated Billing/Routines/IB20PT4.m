IB20PT4	;ALB/CPM - List Template Exporter ; 21-MAR-1994
	;;Version 2.0 ; INTEGRATED BILLING ;; 21-MAR-94
	W !!,">>> Installing List Templates...",!
	W !,"'IB CHARGES' List Template..."
	S DA=$O(^SD(409.61,"B","IB CHARGES",0)),DIK="^SD(409.61," D ^DIK:DA
	K DO,DD S DIC(0)="L",DIC="^SD(409.61,",X="IB CHARGES" D FILE^DICN S VALM=+Y
	I VALM>0 D
	.S ^SD(409.61,VALM,0)="IB CHARGES^1^1^80^5^14^1^1^Charge^IBACM1 MENU^Charges^1^32"
	.S ^SD(409.61,VALM,1)="^VALM HIDDEN ACTIONS"
	.S ^SD(409.61,VALM,"ARRAY")=" ^TMP(""IBACM"",$J)"
	.S ^SD(409.61,VALM,"COL",0)="^409.621^7^7"
	.S ^SD(409.61,VALM,"COL",1,0)="CHARGE^71^9^Charge"
	.S ^SD(409.61,VALM,"COL",2,0)="FDATE^4^9^Bill From"
	.S ^SD(409.61,VALM,"COL",3,0)="ENTRY^25^23^Charge Type"
	.S ^SD(409.61,VALM,"COL",4,0)="STATUS^57^12^Status"
	.S ^SD(409.61,VALM,"COL",5,0)="CHG#^1^3"
	.S ^SD(409.61,VALM,"COL",6,0)="BILL#^49^6^Bill #"
	.S ^SD(409.61,VALM,"COL",7,0)="TDATE^15^8^Bill To"
	.S ^SD(409.61,VALM,"FNL")="D FNL^IBECEA"
	.S ^SD(409.61,VALM,"HDR")="D HDR^IBECEA"
	.S ^SD(409.61,VALM,"HLP")="S X=""?"" D DISP^XQORM1 W !!"
	.S ^SD(409.61,VALM,"INIT")="D INIT^IBECEA"
	.S DA=VALM,DIK="^SD(409.61," D IX1^DIK K DA,DIK
	.W "Filed."
	;
	W !,"'IB EVENTS' List Template..."
	S DA=$O(^SD(409.61,"B","IB EVENTS",0)),DIK="^SD(409.61," D ^DIK:DA
	K DO,DD S DIC(0)="L",DIC="^SD(409.61,",X="IB EVENTS" D FILE^DICN S VALM=+Y
	I VALM>0 D
	.S ^SD(409.61,VALM,0)="IB EVENTS^1^^80^5^14^1^1^Event^IBACME EVENT MENU^Update Events^1^^1"
	.S ^SD(409.61,VALM,1)="^VALM HIDDEN ACTIONS"
	.S ^SD(409.61,VALM,"ARRAY")=" ^TMP(""IBACME"",$J)"
	.S ^SD(409.61,VALM,"COL",0)="^409.621^5^5"
	.S ^SD(409.61,VALM,"COL",1,0)="TYPE^4^18^Event Type"
	.S ^SD(409.61,VALM,"COL",2,0)="WARD^24^20^Ward"
	.S ^SD(409.61,VALM,"COL",3,0)="EDATE^48^10^Event Date"
	.S ^SD(409.61,VALM,"COL",4,0)="STATUS^60^7^Status"
	.S ^SD(409.61,VALM,"COL",5,0)="LCALC^69^10^Last Calc"
	.S ^SD(409.61,VALM,"FNL")="D EXIT^IBECEA5"
	.S ^SD(409.61,VALM,"HDR")="D HDR^IBECEA5"
	.S ^SD(409.61,VALM,"HLP")="S X=""?"" D DISP^XQORM1 W !!"
	.S ^SD(409.61,VALM,"INIT")="D INIT^IBECEA5"
	.S DA=VALM,DIK="^SD(409.61," D IX1^DIK K DA,DIK
	.W "Filed."
	;
	W !,"'IBCNS ANNUAL BENEFITS' List Template..."
	S DA=$O(^SD(409.61,"B","IBCNS ANNUAL BENEFITS",0)),DIK="^SD(409.61," D ^DIK:DA
	K DO,DD S DIC(0)="L",DIC="^SD(409.61,",X="IBCNS ANNUAL BENEFITS" D FILE^DICN S VALM=+Y
	I VALM>0 D
	.S ^SD(409.61,VALM,0)="IBCNS ANNUAL BENEFITS^1^^98^5^18^1^1^Annual Benefits^IBCNSA ANNUAL BENEFITS^Annual Benefits Editor^1^^1"
	.S ^SD(409.61,VALM,1)="^VALM HIDDEN ACTIONS"
	.S ^SD(409.61,VALM,"ARRAY")=" ^TMP(""IBCNSA"",$J)"
	.S ^SD(409.61,VALM,"COL",0)="^409.621^^0"
	.S ^SD(409.61,VALM,"FNL")="D EXIT^IBCNSA K IBL"
	.S ^SD(409.61,VALM,"HDR")="D HDR^IBCNSA(""Annual Benefits"")"
	.S ^SD(409.61,VALM,"HLP")="D HELP^IBCNSA"
	.S ^SD(409.61,VALM,"INIT")="S IBL=1 D INIT^IBCNSA"
	.S DA=VALM,DIK="^SD(409.61," D IX1^DIK K DA,DIK
	.W "Filed."
	;
	W !,"'IBCNS BENEFITS USED BY DATE' List Template..."
	S DA=$O(^SD(409.61,"B","IBCNS BENEFITS USED BY DATE",0)),DIK="^SD(409.61," D ^DIK:DA
	K DO,DD S DIC(0)="L",DIC="^SD(409.61,",X="IBCNS BENEFITS USED BY DATE" D FILE^DICN S VALM=+Y
	I VALM>0 D
	.S ^SD(409.61,VALM,0)="IBCNS BENEFITS USED BY DATE^1^^98^5^18^1^1^Benefits Used by Date^IBCNSD BENEFITS USED BY DATE^Benefits Used By Date Editor^1^^1"
	.S ^SD(409.61,VALM,1)="^VALM HIDDEN ACTIONS"
	.S ^SD(409.61,VALM,"ARRAY")=" ^TMP(""IBCNSD"",$J)"
	.S ^SD(409.61,VALM,"FNL")="D EXIT^IBCNSD"
	.S ^SD(409.61,VALM,"HDR")="D HDR^IBCNSA(""Benefits Used"")"
	.S ^SD(409.61,VALM,"HLP")=""
	.S ^SD(409.61,VALM,"INIT")="D INIT^IBCNSD"
	.S DA=VALM,DIK="^SD(409.61," D IX1^DIK K DA,DIK
	.W "Filed."
	;
	G ^IB20PT41
