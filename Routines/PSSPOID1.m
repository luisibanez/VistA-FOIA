PSSPOID1 ;BIR/RTR-Orderable Item cross references ;02/14/00
 ;;1.0;PHARMACY DATA MANAGEMENT;**38**;9/30/97
KILL1 ;Kill x-ref from field 2.1 of File 50
 K ^PS(50.7,"A50",X,DA)
 S PSSCROSS=1 N PSPOINT,PSSZA,PSSZS,PSSZOI,PSSTEST
 S PSSTEST=X D HOLD D EN1^PSSPOIDT D UNHOLD
 F PSSZA=0:0 S PSSZA=$O(^PS(52.6,"AC",DA,PSSZA)) Q:'PSSZA  D
 .S PSSZOI=$P($G(^PS(52.6,PSSZA,0)),"^",11)
 .I PSSZOI S $P(^PS(52.6,PSSZA,0),"^",11)="" K ^PS(52.6,"AOI",PSSZOI,PSSZA)
 F PSSZS=0:0 S PSSZS=$O(^PS(52.7,"AC",DA,PSSZS)) Q:'PSSZS  D
 .S PSSZOI=$P($G(^PS(52.7,PSSZS,0)),"^",11)
 .I PSSZOI S $P(^PS(52.7,PSSZS,0),"^",11)="" K ^PS(52.7,"AOI",PSSZOI,PSSZS)
 K PSSCROSS
 Q
SET1 ;Set x-ref from field 2.1 of File 50
 S ^PS(50.7,"A50",X,DA)=""
 S PSSCROSS=1 N PSPOINT,PSSZA,PSSZS,PSSTEST
 S PSSTEST=X D HOLD D EN1^PSSPOIDT D UNHOLD
 F PSSZA=0:0 S PSSZA=$O(^PS(52.6,"AC",DA,PSSZA)) Q:'PSSZA  D
 .S $P(^PS(52.6,PSSZA,0),"^",11)=X,^PS(52.6,"AOI",X,PSSZA)=""
 F PSSZS=0:0 S PSSZS=$O(^PS(52.7,"AC",DA,PSSZS)) Q:'PSSZS  D
 .S $P(^PS(52.7,PSSZS,0),"^",11)=X,^PS(52.7,"AOI",X,PSSZS)=""
 K PSSCROSS
 Q
K526 ;Kill x-ref from generic pointer in IV Additives file
 K ^PSDRUG("A526",X,DA)
 N PSSTEST,PSSVAR S PSSCROSS=1
 S PSSTEST=$P($G(^PS(52.6,DA,0)),"^",11)
 I PSSTEST D HOLD D EN1^PSSPOIDT D UNHOLD
 S PSSVAR=$P($G(^PS(52.6,DA,0)),"^",11) I PSSVAR S $P(^PS(52.6,DA,0),"^",11)="" K ^PS(52.6,"AOI",PSSVAR,DA)
 K PSSCROSS
 Q
S526 ;Set x-ref from generic pointer in IV Additives file
 S ^PSDRUG("A526",X,DA)=""
 N PSSTEST S PSSCROSS=1
 S (PSSTEST,PSSTESTX)=$P($G(^PSDRUG(X,2)),"^") I PSSTEST D HOLD D EN1^PSSPOIDT D UNHOLD
 I PSSTESTX S $P(^PS(52.6,DA,0),"^",11)=PSSTESTX,^PS(52.6,"AOI",PSSTESTX,DA)=""
 K PSSTESTX,PSSCROSS
 Q
K527 ;Kill x-ref from Generic pointer in IV Solutions file
 K ^PSDRUG("A527",X,DA)
 N PSSTEST,PSSVAR S PSSCROSS=1
 S PSSTEST=$P($G(^PS(52.7,DA,0)),"^",11)
 I PSSTEST D HOLD D EN1^PSSPOIDT D UNHOLD
 S PSSVAR=$P($G(^PS(52.7,DA,0)),"^",11) I PSSVAR S $P(^PS(52.7,DA,0),"^",11)="" K ^PS(52.7,"AOI",PSSVAR,DA)
 K PSSCROSS
 Q
S527 ;Set x-ref from Generic pointer in IV Solutions file
 S ^PSDRUG("A527",X,DA)=""
 N PSSTEST S PSSCROSS=1
 S (PSSTEST,PSSTESTX)=$P($G(^PSDRUG(X,2)),"^") I PSSTEST D HOLD D EN1^PSSPOIDT D UNHOLD
 I PSSTESTX S $P(^PS(52.7,DA,0),"^",11)=PSSTESTX,^PS(52.7,"AOI",PSSTESTX,DA)=""
 K PSSTESTX,PSSCROSS
 Q
HOLD ;
 S PSSHDZX=$G(X),PSSHDZDA=$G(DA)
 Q
UNHOLD ;
 S X=$G(PSSHDZX),DA=$G(PSSHDZDA)
 K PSSHDZX,PSSHDZDA
 Q