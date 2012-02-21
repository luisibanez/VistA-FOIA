PRSASC1 ; HISC/REL-File Approvals ;1/10/2000
 ;;4.0;PAID;**55**;Sep 21, 1995
 D NOW^%DTC S NOW=%
 F DA=0:0 S DA=$O(AP(1,DA)) Q:DA<1  D LV1
 F DA=0:0 S DA=$O(AP(2,DA)) Q:DA<1  D OT1
 F DA=0:0 S DA=$O(AP(3,DA)) Q:DA<1  D ED1
 S NX="" F  S NX=$O(AP(4,NX)) Q:NX=""  D TC1
 S NOD="AXR",NX="" F  S NX=$O(AP(5,NX)) Q:NX=""  D APP^PRSASC3
 D UPD^PRSASAL,APP^PRSASAL Q
LV1 ; Process action
 S DFN=$P(AP(1,DA),"^",1),ACT=$P(AP(1,DA),"^",2),COM=$P(AP(1,DA),"^",3),X=ESNAM,X1=DUZ,X2=DA D EN^XUSHSHP
 S $P(^PRST(458.1,DA,0),"^",9)=ACT K ^PRST(458.1,"AR",DFN,DA)
 S $P(^PRST(458.1,DA,0),"^",12,14)=DUZ_"^"_NOW_"^"_X
 S:COM'="" $P(^PRST(458.1,DA,1),"^",1)=COM Q
OT1 ; Process action
 S DFN=$P(AP(2,DA),"^",1),ACT=$P(AP(2,DA),"^",2),COM=$P(AP(2,DA),"^",3),X=ESNAM,X1=DUZ,X2=DA D EN^XUSHSHP
 I ACT="S" S ^PRST(458.2,"AS",DFN,DA)=""
 S $P(^PRST(458.2,DA,0),"^",8)=ACT K ^PRST(458.2,"AR",DFN,DA)
 S $P(^PRST(458.2,DA,0),"^",13,15)=DUZ_"^"_NOW_"^"_X
 S:COM'="" $P(^PRST(458.2,DA,1),"^",1)=COM Q
ED1 ; Process action
 S DFN=$P(AP(3,DA),"^",1),ACT=$P(AP(3,DA),"^",2),COM=$P(AP(3,DA),"^",3),X=ESNAM,X1=DUZ,X2=DA D EN^XUSHSHP
 S $P(^PRST(458.3,DA,0),"^",9)=ACT K ^PRST(458.3,"AR",DFN,DA)
 S $P(^PRST(458.3,DA,0),"^",12,14)=DUZ_"^"_NOW_"^"_X
 S:COM'="" $P(^PRST(458.3,DA,1),"^",1)=COM D:ACT="A" ^PRSASC2 Q
TC1 ; Process action
 S DFN=$P(AP(4,NX),"^",1),ACT=$P(AP(4,NX),"^",2),PPI=$P(NX,"~",2)
 S X=ESNAM,X1=DUZ,X2=DFN D EN^XUSHSHP
 I ACT="A" F DAY=0:0 S DAY=$O(^PRST(458,"ATC",DFN,PPI,DAY)) G:DAY="" T1 S $P(^PRST(458,PPI,"E",DFN,"D",DAY,0),"^",5,7)=DUZ_"^"_NOW_"^"_X
 ; tour change(s) were disapproved or canceled so undo them
 S STAT=$P($G(^PRST(458,PPI,"E",DFN,0)),"^",2) I STAT'="","PX"[STAT G T1
 S TYP="" F DAY=0:0 S DAY=$O(^PRST(458,"ATC",DFN,PPI,DAY)) Q:DAY=""  D
 .; special undo if tour change made to next pay period
 .I $P($G(^PRST(458,PPI,"E",DFN,"D",DAY,0)),U,3)=2 D  Q
 ..S $P(^PRST(458,PPI,"E",DFN,"D",DAY,0),U,3,4)="^"
 ..S $P(^PRST(458,PPI,"E",DFN,"D",DAY,0),U,10,11)=DUZ_"^"_NOW
 .; tour change not made to next pay period
 .I $D(^PRST(458,PPI,"E",DFN,"D",DAY,4)) K ^(4) S $P(^(0),"^",13,15)="^^"
 .S TD=$P($G(^PRST(458,PPI,"E",DFN,"D",DAY,0)),"^",4),Y=$G(^PRST(457.1,+TD,1)),TDH=$P($G(^(0)),"^",6) D SET^PRSATE
 .Q
T1 K ^PRST(458,"ATC",DFN,PPI) Q
