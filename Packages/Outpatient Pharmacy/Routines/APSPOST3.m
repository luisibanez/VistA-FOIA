APSPOST3 ; IHS/DSD/ENM - OUTPATIENT CONV DIC(51 - PS(51 ;  [ 09/03/97   1:30 PM ]
 ;;6.0;IHS PHARMACY MODIFICATIONS;;09/03/97
EP ;Move Medication Instructions to PS(51
 Q  ;IHS/DSD/ENM 03/19/97 DO NOT USE, OPERATION HANDLED IN APSPOST7
 S APSPD51=0,APSPNR="",APSPDT=0
 I $P($G(^PS(59.7,1,9999999)),"^",4)]"" S APSPNR=$P(^PS(59.7,1,9999999),"^",4),APSPDT=$P(^PS(59.7,1,9999999),"^",3) ;APSPD51=APSPNR-1
 F APSPD51=0:0 S APSPD51=$O(^DIC(51,APSPD51)) Q:'APSPD51  S APSP1=$P(^DIC(51,APSPD51,0),"^"),APSP2=$P(^(0),"^",2),$P(^PS(59.7,1,9999999),"^",4)=APSPD51 D SET
 S APSPM1=" ",APSPM2="The Outpatient Pharmacy Medication Instruction File update ",APSPM3="has finished on "
 D MSG^APSPOST2,NOW^%DTC S DIE="^PS(59.7,",DA=1,DR="9999999.03////^S X=$E(%,1,12)"
 D ^DIE
 ;D MSG^APSPOST2,NOW^%DTC S $P(^PS(59.7,1,9999999),"^",3)=$E(%,1,12)
 K APSP1,APSP2,APSPD51,DA,DIC,DR,X,Y,APSPNR,APSPDT,^DIC(51,"B"),^DIC(51,"AI")
 Q
SET ;
 K DD,DO
 S DIC="^PS(51,",X=APSP1,DIC("DR")="1///^S X=APSP2",DIC(0)=""
 D FILE^DICN S DA=APSPD51,DIK="^DIC(51," D ^DIK
 Q