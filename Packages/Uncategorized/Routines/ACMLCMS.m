ACMLCMS ; IHS/TUCSON/TMJ - ENTRY TO SET AND DISPLAY CLIENT DATA ; [ 01/03/06  2:03 PM ]
 ;;2.0;ACM CASE MANAGEMENT SYSTEM;**2,5,6**;JAN 10, 1996
 ;PATCH #6 FIXES INSURANCE HEADER DISPLAY AND FORMAT PROBLEMS
 ;EP;ENTRY POINT TO SET AND DISPLAY CLIENT DATA
LCMS D INIT,VARS
 Q
 ;
INIT ;S ACMDOB=$P(^DPT(ACMPTNO,0),U,3),(Y,X2)=ACMDOB,X1=DT
 S ACMDOB=$P(^DPT(ACMPTNO,0),U,3),(Y,X2)=ACMDOB,X1=DT,ACMPHONE=$P($G(^(.13)),U) ;IHS/CIM/THL PATCH 5
 D ^%DTC
 X ^DD("DD")
 S ACMDOB=Y
 I X>365 S ACMAGE=(X\365.25)_" YRS"
 I (X>30)&(X<366) S ACMAGE=(X\30.4)_" MOS"
 I X<31 S ACMAGE=X_" (DYS)"
 Q
 ;
VARS I $D(DUZ(2))#2,DUZ(2) S ACMSRT=$S($D(^AUPNPAT(ACMPTNO,41,DUZ(2),0)):$P(^(0),U,2),1:"<NONE>")
 S (ACMSTAT,ACMSEV,ACMPC,ACMINIT,ACMWHER,ACMCOMM,ACMPG)="NOT STATED",(ACMPRV,ACMMGR,ACMPHN)="NONE ASSIGNED"
 S ACMDT="^ACM(41,"_ACMRGDFN_",""DT"")"
 I '$D(@ACMDT) S @ACMDT="A"
 S ACMDT=@ACMDT,ACMSTAT=$S($P(ACMDT,U)'="":$P(ACMDT,U),1:"NOT STATED"),ACMMGR=$S($P(ACMDT,U,6)'="":$P(ACMDT,U,6),1:"NONE ASSIGNED")
 S:ACMMGR'="NONE ASSIGNED" ACMMGR=$S($D(^VA(200,ACMMGR,0)):$P(^(0),U),1:"NONE ASSIGNED")
 S ACMPHN=$S($P(ACMDT,U,7)'="":$P(ACMDT,U,7),1:"NONE ASSIGNED")
 S:ACMPHN'="NONE ASSIGNED" ACMPHN=$S($D(^VA(200,ACMPHN,0)):$P(^(0),U),1:"NONE ASSIGNED")
 S ACMSEV=$S($P(ACMDT,U,5)'="":$P(ACMDT,U,5),1:"NOT STATED")
 I $P(ACMDT,U,4)'="" S ACMINIT=$P(ACMDT,U,4) S Y=ACMINIT X ^DD("DD") S ACMINIT=Y
 S ACMWHER=$S($P(ACMDT,U,10):$P(ACMDT,U,10),1:"NOT STATED")
 S:ACMWHER'="NOT STATED" ACMWHER=$S($D(^AUTTLOC(ACMWHER,0)):$P(^(0),U,2),1:"NOT STATED")
 S ACMPG=$S($P(ACMDT,U,13)'="":$P(ACMDT,U,13),1:"NOT STATED"),ACMPC=$S($P(ACMDT,U,14)'="":$P(ACMDT,U,14),1:"NOT STATED"),ACMPRV=$S($P(ACMDT,U,15)'="":$P(ACMDT,U,15),1:"NONE ASSIGNED")
 S:ACMPRV'="NONE ASSIGNED" ACMPRV=$S($D(^VA(200,ACMPRV,0)):$P(^(0),U),1:"NONE ASSIGNED")
 S ACMCOMM=$S($D(^AUPNPAT(ACMPTNO,11)):$P(^(11),U,18),1:"")
 S:ACMCOMM="" ACMCOMM="NOT STATED"
 K ACMDT
 Q
ACMPT ;EP;TO DISPLAY PATIENT INFO
 W:'$D(ACMPAGE) !?7,"CHART: ",ACMSRT
 W:$D(ACMPAGE) !  ;IHS/ANMC/LJF 11/5/99 put PCP on separate line if rpt
 W ?35,"PRIMARY CARE PROVIDER: ",$$VAL^XBDIQ1(9000001,ACMPTNO,.14)  ;IHS/ANMC/LJF 11/5/99
 W !?9,"DOB: ",?14,ACMDOB,?53,"AGE: ",ACMAGE
 W !?5,"CONTACT: ",?14,$S(ACMPG'="":ACMPG,1:"NOT LISTED"),?47,"COMMUNITY: ",ACMCOMM ;IHS/CIM/THL PATCH 5
 W !?46,"HOME PHONE: ",$G(ACMPHONE) ;IHS/CIM/THL PATCH 5
 N APCHSPAT,APCHSCKP,APCHSNPG
 S APCHSPAT=ACMPTNO
 S APCHSCKP=""
 S APCHSNPG=1
 S APCHSCVD="S:Y]"""" Y=+Y,Y=$E(Y,4,5)_""/""_$S($E(Y,6,7):$E(Y,6,7)_""/"",1:"""")_$E(Y,2,3)"
 S ACMINS=0 ;IHS/CMI/TMJ PATCH #6
 I $D(^AUPNMCD("B",ACMPTNO)) S ACMINS=1
 I $D(^AUPNMCR(ACMPTNO)) S ACMINS=1
 I $D(^AUPNPRVT(ACMPTNO)) S ACMINS=1
 I $D(^AUPNRRE(ACMPTNO)) S ACMINS=1
 I ACMINS=1 W !,"**************************  INSURANCE INFORMATION  ***************************",!
 D INS^APCHS5
 W !  ;IHS/ANMC/LJF 11/5/99 separate editable from uneditable fields
 W "     ***********************  PATIENT INFORMATION  *************************",! ;IHS/CMI/TMJ PATCH #6
 W ?6,"STATUS: ",$S(ACMSTAT="A":"ACTIVE",ACMSTAT="I":"INACTIVE",ACMSTAT="T":"TRANSIENT",ACMSTAT="U":"UNREVIEWED",ACMSTAT="D":"DECEASED",ACMSTAT="N":"NON-IHS",1:"NOT STATED")
 ;W ?44,"CASE PRIORIT: ",?14,$S(ACMSEV="L":"LOW",ACMSEV="M":"MEDIUM",ACMSEV="H":"HIGH",ACMSEV="C":"CRITICAL",1:"NOT STATED"),!,"PRIMARY PRVD: ",?14,ACMPRV
 W ?44,"CASE PRIORIT: ",?58,$S(ACMSEV="L":"LOW",ACMSEV="M":"MEDIUM",ACMSEV="H":"HIGH",ACMSEV="C":"CRITICAL",1:"NOT STATED"),!,?6,"REGISTER PRV: ",?14,ACMPRV  ;IHS/ANMC/LJF 11/5/99
 W ?46,"INIT ENTRY: ",$S($D(ACMINIT):ACMINIT,1:"NOT STATED"),!,?6,"CASE MANAGER: ",?14,ACMMGR,?46,"WHERE FLWD: ",ACMWHER
 W !,?6,"PUB HLTH NRS:",?14,$S($D(ACMPHN):ACMPHN,1:"NONE ASSIGNED")
 I $D(ACMPAGE)&(IOST["P-") S DR="12////"_DT,DIE="^ACM(41,",DA=ACMRGDFN D ^DIE
 Q
