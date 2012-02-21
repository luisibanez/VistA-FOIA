FHORT3 ; HISC/REL/NCA - Tubefeeding Utilities ;8/9/96  11:41 ;
 ;;5.5;DIETETICS;;Jan 28, 2005
EN1 ; Edit Tubefeeding Products
 S CHK=0,TYP="T",EVENT="UPD",REC=1,(NOD1,NOD3)="" K ^TMP($J,"FHNOD2")
 W ! S (DIC,DIE)="^FH(118.2,",DIC(0)="AEQLM",DIC("DR")=".01",DLAYGO=118.2 W ! D ^DIC K DIC,DLAYGO G KIL:U[X!$D(DTOUT),EN1:Y<1
 S DA=+Y,IEN=Y,NOD1=$P($G(^FH(118.2,+IEN,0)),"^",1),NOD3=$G(^FH(118.2,+IEN,"I"))
 F IEN1=0:0 S IEN1=$O(^FH(118.2,+IEN,1,IEN1)) Q:IEN1<1  S:'$D(^TMP($J,"FHNOD2",IEN1)) ^TMP($J,"FHNOD2",IEN1)=$G(^FH(118.2,+IEN,1,IEN1,0))
 S DR=".01;1;2;S:X[""G"" Y=""@1"";3;@1;10:99" S:$D(^XUSEC("FHMGR",DUZ)) DIDEL=118.2 D ^DIE K DA,DIE,DIDEL,DR I $D(^ORD(101.43)) D UPDATE^FHWOR6
 G EN1
EN2 ; List Tubefeeding Products
 W !!,"The list requires a 132 column printer.",!
 W ! S L=0,DIC="^FH(118.2,",FLDS="[FHTFLST]",BY="NAME"
 S FR="",TO="",DHD="TUBEFEEDING PRODUCTS" D EN1^DIP,RSET Q
RSET K %ZIS S IOP="" D ^%ZIS K %ZIS,IOP,BY,DA,DHD,DIC,DIE,DR,FLDS,FR,L,TO,X,Y Q
KIL K ^TMP($J),CHK,DIC,DIE,DTOUT,EVENT,IEN,IEN1,NOD1,NOD3,REC,TYP,X,Y Q
POST ; Generate bulletin
 S WRD=$P($G(^FHPT(FHDFN,"A",ADM,0)),"^",8)
 Q:'$D(^FH(119.6,+WRD,0))  S XMKK=$P(^(0),"^",2) Q:XMKK<1
 K XMY,XMB S XMB(1)=$P(^DPT(DFN,0),"^",1),XMB(2)=BID
 S XMB(4)=$S($D(^DPT(DFN,.101)):^(.101),1:"unknown")
 S XMB(5)="" I CAN S XMB(5)="Diet Orders"_$S(CAN=2:" and Supplemental Feedings",1:"")_" have been cancelled."
 S XMB(3)=$P(^FH(119.6,WRD,0),"^",1),XMB="FHDITF",XMY(XMKK)="" D ^XMB K XMY,XMB,XMM,XMDT Q
