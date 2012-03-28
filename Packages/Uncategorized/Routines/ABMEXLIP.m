ABMEXLIP ;IHS/PIMC/JLG - Create export of inpatients for a month 
 ;;2.6;IHS 3P BILLING SYSTEM;;NOV 12, 2009
 ;Pat name in ABMQ(9002274.3,IENS,.01,"E")
 ;HRN in ABMHRN
 ;get ADM SVC from ADT in ABMADMSV
 ;ADM date in ABMQ(....61  DISC date in ABMQ(.....63
 ;Calculate LOS in ABMLOS
 ;NAR, CARE, Caid in ABMQ(.....08, and ABMINTYP
 ;MCAID Plan in ABMPLAN
 ;PPO, HMO, TRI not available
 ;PI insurer in ABMQ(....08
 ;Claim number ABMD0
 ;AMT BILL A from 3p bill file
 ;Fields 13 and 15 in AR bill file may be useful.  It will take some
 ;creativeness to get the AMT REC A
 W !
 K DIRUT
 S %DT="AEPX"
 S %DT("A")="Enter Start Date: "
 D ^%DT
 Q:Y=-1
 S ABMSTDT=Y
 S X1=Y
 S X2=-4
 D C^%DTC
 S ABMDT=X
 S %DT="AEPX"
 S %DT("A")="Enter End Date: "
 D ^%DT
 Q:Y=-1
 S ABMENDDT=Y
FILEN ;open & write file
 S DIR(0)="9002274.5,.47"
 S DIR("A")="Enter File Directory"
 S DIR("B")=$P($G(^ABMDPARM(DUZ(2),1,4)),"^",7)
 D ^DIR K DIR
 I Y["^" S POP=1 Q
 S ABMXPATH=Y
 S DIR(0)="FAO^3:40^K:X'?1A.(1AN,1"" "",1""-"",1""_"") X"
 S DIR("A")="Enter Filename for output: "
 S DIR("B")="abmxls"_$E(DT,2,7)
 S DIR("?")="Please enter name of file."
 D ^DIR
 Q:$D(DIRUT)
 S ABMXFILE=Y
 D OPEN^%ZISH("ABMXFILE",ABMXPATH,ABMXFILE,"W")
 I POP D  G FILEN
 .W !,"Output file not opened.  Try again."
 U IO(0)
 W !,"File opened beginning to write export data.",!
 U IO
 F  S ABMDT=$O(^ABMDCLM(DUZ(2),"AD",ABMDT)) Q:'ABMDT!(ABMDT>ABMENDDT)  D
 .S ABMD0=0
 .F  S ABMD0=$O(^ABMDCLM(DUZ(2),"AD",ABMDT,ABMD0)) Q:'ABMD0  D
 ..K ABMQ,ABMB
 ..S IENS=ABMD0_","
 ..S DR=".01;.07;.08;.61;.63;65*"
 ..D GETS^DIQ(9002274.3,IENS,DR,"EI","ABMQ")
 ..S AD=ABMQ(9002274.3,IENS,.61,"I")
 ..Q:AD<ABMSTDT!(AD>ABMENDDT)
 ..S VT=ABMQ(9002274.3,IENS,.07,"I")
 ..Q:(VT'=111)&(VT'=999)
 ..K ABMADMSV
 ..I $D(^ABMDCLM(DUZ(2),ABMD0,11,"AC","P")) D
 ...S VAIP("D")=+^AUPNVSIT(+$O(^ABMDCLM(DUZ(2),ABMD0,11,"AC","P",0)),0)
 ...S DFN=ABMQ(9002274.3,IENS,.01,"I")
 ...D IN5^VADPT
 ...S ABMADMSV=$P(VAIP(8),U,2)
 ..I ABMQ(9002274.3,IENS,.08,"I")="" D
 ...S ABMDONE=0
 ...K IENS2,IENS4,IENS4SAV,ABMQC
 ...S ABMD1=0
 ...F  S ABMD1=$O(^ABMDCLM(DUZ(2),ABMD0,13,ABMD1)) Q:'ABMD1  D  Q:ABMDONE
 ....S IENS4=ABMD1_","_IENS
 ....D GETS^DIQ(9002274.3013,IENS4,".01;.03","EI","ABMQ")
 ....I "IB"[ABMQ(9002274.3013,IENS4,.03,"I") D
 .....S IENS2=ABMQ(9002274.3013,IENS4,.01,"I")_","
 .....S ABMDONE=1
 .....S ABMINSN=ABMQ(9002274.3013,IENS4,.01,"E")
 ....E  I "C"=ABMQ(9002274.3013,IENS4,.03,"I") D
 .....S ABMQC=1
 .....S IENS4SAV=IENS4
 ...I $G(IENS4),'ABMDONE,$G(ABMQC) D
 ....S IENS2=ABMQ(9002274.3013,IENS4SAV,.01,"I")_","
 ....S ABMINSN=ABMQ(9002274.3013,IENS4SAV,.01,"E")
 ..E  D
 ...S IENS2=ABMQ(9002274.3,IENS,.08,"I")_","
 ...S ABMINSN=ABMQ(9002274.3,IENS,.08,"E")
 ..Q:IENS2=","
 ..S ABMINS=+IENS2
 ..S ABMINTYP=$$GET1^DIQ(9999999.18,IENS2,.21,"I")
 ..K ABMPLAN
 ..S ABMCAID=""
 ..S ABMCARE=""
 ..S ABMMFD0=$O(^AUPNMCD("B",ABMQ(9002274.3,IENS,.01,"I"),""))
 ..I ABMMFD0]"" D
 ...S IENS3=ABMMFD0_","
 ...S ABMPLAN=$$GET1^DIQ(9000004,IENS3,.11)
 ..I ABMINTYP="D" S ABMCAID=1
 ..E  I ABMINTYP="R" D
 ...S ABMCARE=1
 ..K ABMBILAM,ABMBILRE
 ..S IENSX=""
 ..F  S IENSX=$O(ABMQ(9002274.3065,IENSX)) Q:'IENSX  D
 ...S ABMBIL=ABMQ(9002274.3065,IENSX,.01,"E")
 ...S ABMLET=$E(ABMBIL,$L(ABMBIL))
 ...S IENS2=ABMQ(9002274.3065,IENSX,.01,"I")_","
 ...S ABMBILAM(ABMLET)=$$GET1^DIQ(9002274.4,IENS2,.21)
 ...S X=ABMBIL
 ...S DIC=90050.01
 ...D ^DIC
 ...Q:Y=-1
 ...S IENS2=+Y_","
 ...D GETS^DIQ(90050.01,IENS2,"13;15",,"ABMB")
 ...S ABMBILRE(ABMLET)=ABMB(90050.01,IENS2,13)-ABMB(90050.01,IENS2,15)
 ..S ABMHRN=$$HRN^AUPNPAT(ABMQ(9002274.3,IENS,.01,"I"),DUZ(2))
 ..S X1=ABMQ(9002274.3,IENS,.63,"I")
 ..S X2=ABMQ(9002274.3,IENS,.61,"I")
 ..D ^%DTC
 ..S ABMLOS=X+1
 ..S ABMNAR=$S(ABMINS=1184:1,1:"")      ;1184 = Beneficiary Indian
 ..S P="|"
 ..S ABMEXPS=ABMQ(9002274.3,IENS,.01,"E")_P_ABMHRN_P
 ..S ABMEXPS=ABMEXPS_$G(ABMADMSV)_P
 ..S ABMEXPS=ABMEXPS_ABMQ(9002274.3,IENS,.61,"E")_P
 ..S ABMEXPS=ABMEXPS_ABMQ(9002274.3,IENS,.63,"E")_P_ABMLOS_P
 ..S ABMEXPS=ABMEXPS_ABMNAR_P_ABMCARE_P_ABMCAID_P
 ..I $D(ABMPLAN) S ABMEXPS=ABMEXPS_ABMPLAN_P
 ..E  S ABMEXPS=ABMEXPS_P
 ..S ABMEXPS=ABMEXPS_P_P_P
 ..I ABMINTYP="P" S ABMEXPS=ABMEXPS_ABMINSN_P
 ..E  S ABMEXPS=ABMEXPS_P
 ..S ABMEXPS=ABMEXPS_ABMD0_P
 ..S ABMLET=""
 ..F  S ABMLET=$O(ABMBILAM(ABMLET)) Q:ABMLET=""  D
 ...S ABMEXPS=ABMEXPS_ABMBILAM(ABMLET)_P_ABMBILRE(ABMLET)_P
 ..W ABMEXPS,!
 D CLOSE^%ZISH("ABMXFILE")
 W !,"Export file complete."
 Q
