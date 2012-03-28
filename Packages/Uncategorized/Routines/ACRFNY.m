ACRFNY ;IHS/OIRM/DSD/THL,AEF - CREATE FINANCIAL ACCOUNTS FOR THE NEW FISCAL YEAR, ALL ACCOUNTS;  [ 01/02/2003  8:02 AM ]
 ;;2.1;ADMIN RESOURCE MGT SYSTEM;**5**;NOV 05, 2001
 ;;ROUTINE TO CREATE FINANCIAL ACCOUNTS FOR THE NEW FISCAL YEAR
EN D EXIT
 D EN1
EXIT K ACR,^TMP("ACRAPP",$J),ACR0,ACR1,ACR2,ACR3,ACR4,ACRACTDA,ACRALC,ACRALW,ACRAPP,ACRAPPDA,ACRDAC,ACRFY,ACRFYN,ACRFYNEW,ACRRTN,ACRY,ACRNO,ACRNEWDA,ACRALCDA,ACRALWDA,ACRMM,ACRDIK,ACRQUIT,ACROUT,ACRLBDA,ACROLD,ACRAPPX
 Q
EN1 D SELECT
 Q:$D(ACRQUIT)
 S ACRAPPX=""
 I ACRAPP["/" D  Q:$D(ACRQUIT)
 .N X,Y,Z
 .S X=$P(ACRAPP,"/")
 .S Y=$P(ACRAPP,"/",2)
 .S Z=$E(X,$L(X))+1
 .S:$L(Z)=2 Z=$E(Z,2)
 .S X=$E(X,1,$L(X)-1)_Z
 .S Z=$E(Y)+1
 .S:$L(Z)=2 Z=$E(Z,2)
 .S Y=Z_$E(Y,2,99)
 .S ACRAPPX=X_"/"_Y
 .S DIR(0)="SO^1:Create FY "_$E(X,$L(X))_" Dept. Accts for "_ACRAPP_";2:Create FY "_$E(X,$L(X))_" Dept. Accts for "_ACRAPPX
 .S DIR("A")="Which one"
 .W !
 .D DIR^ACRFDIC
 .I +Y<1 S ACRQUIT="" Q
 .S ACRAPP=$S(Y=1:ACRAPP,1:ACRAPPX)
 .S ACRAPPX=$S(Y=2:"",1:ACRAPPX)
 .D ^ACRFNY2
 S DIR(0)="PO^9999999.51:AENQ"
 S DIR("A")="Create NEXT FY Accounts for APPROPRIATION NO."
 S DIR("B")=ACRAPP
 W !
 D DIR^ACRFDIC:$G(ACRNO)'=2
 Q:+Y<1
 S ACRAPPDA=$S($G(ACRNO)'=2:+Y,1:ACRAPPDA)
 I $G(ACRNO)=2 S DA=ACRAPPDA,DIE="^ACRAPP(" D NO
 D NFY
 Q:$G(ACRFYNEW)=""
 W !!,"Create NEW ",$S($G(ACRNO)'=2:"Allowances, Sub-Allowances and ",1:""),"Department Accounts"
 W !,"for APPROPRIATION ",$P(^AUTTPRO(ACRAPPDA,0),U)," (FY ",ACRFYNEW,")"
 W !,"Based on accounts from Fiscal Year ",ACRFY
 S DIR(0)="YO"
 S DIR("A")="Is that correct"
 S DIR("B")="NO"
 W !
 D DIR^ACRFDIC
 Q:Y'=1
 D ZIS
 Q
NO Q:$G(DIE)=""!($G(DA)="")
 N X,Y,Z
 S DR=".16////2"
 D DIE^ACRFDIC
 Q
SELECT ;EP;SELECT APPROPRIATION ACCOUNT
 S DIR(0)="PO^9002185:AENQ"
 S DIR("A")="Select THIS FY appropriation account ID NO."
 W !
 D DIR^ACRFDIC
 I +Y<1 S ACRQUIT="" Q
 S ACRACTDA=+Y
 S ACRFY=$P(^ACRAPP(+Y,"DT"),U) ; fiscal year in in the format 9999
 S ACRAPPDA=$P(^ACRAPP(+Y,"DT"),U,4)
 S ACRAPP=$P(^AUTTPRO(ACRAPPDA,0),U)
 ;S:ACRAPP["X" ACRNO=2                           ;ACR*2.1*5.07
 S ACRFYN=ACRFY+1
 S:$L(ACRFYN)=4 ACRFYN=$E(ACRFYN,4)
 S ACRAPP=$S(ACRAPP'["X"&(ACRAPP'["/"):(75_ACRFYN_$E(ACRAPP,4,7)),1:ACRAPP)
 Q
CREATE ;EP;TO CREATE NEW FY ACCOUNTS
 D APP,CREATE^ACRFNY1
 Q
APP ;CREATE TMP ARRAY OF ALL CURRENT YEAR ACCOUNTS FROM THE APPROPRIAITON
 ;LEVEL DOWN TO THE DEPARTMENT ACCOUNT LEVEL
 N X,Y,Z,J
 K ACRNO
 S X=ACRACTDA
 S ACRAPP=$P(^AUTTPRO($P(^ACRAPP(X,"DT"),U,4),0),U)
 ;S:ACRAPP["X" ACRNO=2                           ;ACR*2.1*5.07
 ;S:ACRAPP["X"&'$D(ACRMM) ACRNO=2                ;ACR*2.1*5.07
 S ^TMP("ACRAPP",$J,X)=""
 S Y=0
 F  S Y=$O(^ACRALW("M",X,Y)) Q:'Y  I $D(^ACRALW(Y,0)),$D(^ACRALW(Y,"DT")) D
 .I $G(ACRNO)=2 S DA=Y,DIE="^ACRALW(" D NO
 .S ^TMP("ACRAPP",$J,X,Y)=""
 .S Z=0
 .F  S Z=$O(^ACRALC("M",Y,Z)) Q:'Z  I $D(^ACRALC(Z,0)),$D(^ACRALC(Z,"DT")) D
 ..I $G(ACRNO)=2 S DA=Z,DIE="^ACRALC(" D NO
 ..S ^TMP("ACRAPP",$J,X,Y,Z)=""
 ..S J=0
 ..F  S J=$O(^ACRLOCB("M",Z,J)) Q:'J  I $D(^ACRLOCB(J,0)),$D(^ACRLOCB(J,"DT")) D
 ...S ACR0=^ACRLOCB(J,0)
 ...I $P(ACR0,U,16)=1 S ^TMP("ACRAPP",$J,X,Y,Z,J)=""
 Q
ZIS S ACRRTN="CREATE^ACRFNY"
 S ZTDESC="ARMS FUND ACCOUNT CREATION REPORT"
 D ^ACRFZIS
 Q
NFY ;SELECT FISCAL YEAR FOR NEW ACCOUNTS
 I ACRAPP'["X",ACRAPP'["/" S ACRFYNEW=ACRFY+1
 E  S ACRFYNEW=$S($E(DT,4,5)<7:DT\10000,1:DT\10000+1)+1700
 S DIR(0)="NO^1000:9999"
 S DIR("A")="Fiscal Year for new Accounts"
 S DIR("B")=ACRFYNEW
 D DIR^ACRFDIC
 I $L(Y)'=4 K ACRFYNEW S ACDQUIT="" Q
 S ACRFYNEW=Y
 Q
