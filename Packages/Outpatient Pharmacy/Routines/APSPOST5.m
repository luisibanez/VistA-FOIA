APSPOST5 ; IHS/DSD/ENM - OUTPAT/DRUG FILE 50 DIVISION FLAG/APU ;  [ 09/03/97   1:30 PM ]
 ;;6.0;IHS PHARMACY MODIFICATIONS;;09/03/97
EP ;Division Update
 D EP0,EP1,XIT
 Q
EP0 S APSP1=0
 S APSPSITE=$O(^PS(59,0)) Q:APSPSITE=""
 I $P($G(^PS(59.7,1,9999999)),"^",7)]"" Q
 I +$P($G(^PS(59.7,1,9999999)),"^",8) S APSP1=$P(^(9999999),"^",8)-1
 F  S APSP1=$O(^PSDRUG(APSP1)) Q:'APSP1  D SET S $P(^PS(59.7,1,9999999),"^",8)=APSP1
 S APSPM1=" ",APSPM2="The Outpatient Pharmacy Drug File Division Flag update ",APSPM3="has finished on "
 D MSG^APSPOST2,NOW^%DTC S $P(^PS(59.7,1,9999999),"^",7)=$E(%,1,12)
 K APSP1,APSPM1,APSPM2,APSPM3,APSP3,DIE,DA,DR
 Q
SET S DIE="^PSDRUG(",DA=APSP1,DR="9999999.03////^S X=APSPSITE" D ^DIE
 Q
EP1 ;APPLICATION PACKAGE'S USE UPDATE
 S APSP11=0
 I $P($G(^PS(59.7,1,9999999)),"^",9)]"" Q
 I +$P($G(^PS(59.7,1,9999999)),"^",10) S APSP11=$P(^(9999999),"^",10)-1
 F  S APSP11=$O(^PSDRUG(APSP11)) Q:'APSP11  D PAC S $P(^PS(59.7,1,9999999),"^",10)=APSP11
 S APSPM1=" ",APSPM2="The Outpatient Pharmacy Drug File 'Application Package Use' update ",APSPM3="has finished on "
 D MSG^APSPOST2,NOW^%DTC S $P(^PS(59.7,1,9999999),"^",9)=$E(%,1,12)
 Q
PAC S $P(^PSDRUG(APSP11,2),"^",3)="O",^PSDRUG("AIUO",$P(^PSDRUG(APSP11,0),"^"),APSP11)=""
 Q
ZAP ;
 ;F I=0:0 S I=$O(^PSDRUG(I)) Q:'I  S ADIV=$P($G(^PSDRUG(I,9999999)),"^",3) D DEL
 ;Q
DEL ;I ADIV=2 S DA=I,DIK="^PSDRUG(" D ^DIK W "."
 ;Q
XIT K APSP11,APSPSITE
 Q