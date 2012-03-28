ACRFAU ;IHS/OIRM/DSD/THL,AEF - EDIT ARMS USER INFORMATION;  [ 10/26/2006   9:44 AM ]
 ;;2.1;ADMIN RESOURCE MGT SYSTEM;**19,21**;NOV 05, 2001
 ;;ROUTINE USED TO EDIT ARMS USER INFORMATION
AU ;EP;TO ENTER/UPDATE ARMS USER DATA
 D 10
 Q:$D(ACRQUIT)
 F  D AU1 Q:$D(ACRQUIT)!$D(ACROUT)
 K ACRQUIT
 Q
AU1 ;SELECT EMPLOYEE
 D EMPLOYEE
 I '$G(ACRDUZ) S ACRQUIT="" Q
 I '$D(^ACRAU("B",ACRDUZ))!'$D(^ACRAU(ACRDUZ,0)) D
 .I '$D(^ACRAU(ACRDUZ,0)) D
 ..S (X,DINUM)=ACRDUZ
 ..S DIC="^ACRAU("
 ..S DIC(0)="L"
 ..D FILE^ACRFDIC
 .I +$G(^ACRAU(ACRDUZ,0))'=ACRDUZ D
 ..S DA=ACRDUZ
 ..S DIE="^ACRAU("
 ..S DR=".01///"_ACRDUZ
 ..D DIE^ACRFDIC
 .I +$G(^ACRAU(ACRDUZ,0))'=ACRDUZ S $P(^ACRAU(ACRDUZ,0),U)=ACRDUZ
 .I '$D(^ACRAU("B",ACRDUZ))#2 S ^ACRAU("B",ACRDUZ,ACRDUZ)=""
 D SETREQ^ACRFDRC1
 K ACRNWLVL
 S ACRLVLDA=1
 I '$D(^ACRUAL(ACRDUZ,0)) D
 .D ACCESS^ACRFACC
 .S ACRLVLDA=1
 .D SETKILL^ACRFACC
 S ACRDA=ACRDUZ
 Q:'ACRDA
 F  D AU2 Q:$D(ACRQUIT)!$D(ACROUT)
 K ACRQUIT
 Q
AU2 W @IOF
 W !?10,"Edit ARMS USER DATA for ",ACRUSER
 W !!?5,"Select USER EDIT FUNCTION"
 W !!?10,1
 W ?15,"Print User Profile"
 W !?10,2
 W ?15,"Edit Basic Data"
 W !?10,3
 W ?15,"Edit Signature Authorities"
 W !?10,4
 W ?15,"Edit Access Level"
 W !?10,5
 W ?15,"Delete User's ARMS Access"
 W !?10,6
 W ?15,"Assign/Delete Access to Multiple Department Accounts"
 W !?10,7
 W ?15,"Assign Access to Multiple Blanket Purchase Agreements"
 S DIR(0)="LO^1:7"
 S DIR("A")="Which one"
 W !
 D DIR^ACRFDIC
 Q:$D(ACRQUIT)!$D(ACROUT)!'+ACRY
 S ACRAU=ACRY
 F ACRAUJ=1:1 S ACRAUX=$P(ACRAU,",",ACRAUJ) Q:'ACRAUX!$D(ACROUT)  D
 .S ACRAUX=$S(ACRAUX=1:"PSUM",ACRAUX=2:"BASIC",ACRAUX=3:"AUTHOR",ACRAUX=4:"ACCESS",ACRAUX=5:"DELETE",ACRAUX=6:"MCAN",ACRAUX=7:"BPA^ACRFACC")
 .W !
 .D @ACRAUX
 .K ACRQUIT
 K ACRAU,ACRAUJ,ACRAUX
 Q
PSUM ;EP;TO DISPLAY ARMS USER DATA
 S ZTDESC="ARMS USER DATA SUMMARY"
 S ACRRTN="PS1^ACRFUP"
 D ^ACRFZIS
 Q
MP ;EP;TO ALLOW USER TO EDIT THEIR OWN USER DATA
 S ACRDA=DUZ
 S DR="[ACR MY PERSON PROFILE]"
 S ACRDR="[ACR MY PROFILE]"
BASIC ;EDIT BASIC ARMS USER DATA FROM THE PERSON AND EMPLOYEE FILES
 Q:'$G(ACRDA)
 S DA=ACRDA
 S DIE="^VA(200,"
 S DR=$S('$D(DR):"[ACR PERSON]",1:DR)
 D DDS^ACRFDIC
 I $D(ACRSCREN) K ACRSCREN D DIE^ACRFDIC
 I '$D(^ACRAU(ACRDA,0))#2 D
 .S (X,DINUM)=ACRDA,DIC="^ACRAU(",DIC(0)="L"
 .D FILE^ACRFDIC
 S DA=ACRDA
 S DIE="^ACRAU("
 S DR=$S('$D(ACRDR):"[ACR ARMS USER]",1:ACRDR)
 D DDS^ACRFDIC
 I $D(ACRSCREN) K ACRSCREN D DIE^ACRFDIC
 W !
 Q
AUTHOR D EN^ACRFDRC1
 Q
ACCESS D EN2^ACRFACC
 Q
DELETE D DELETE^ACRFACC
 Q
MCAN ;EP;TO ASSIGN MULTIPLE CANS TO ARMS USER
 K ACRDEL
 S DIR(0)="SO^1:Assign Access;2:Delete Access"
 S DIR("A")="Which one"
 D DIR^ACRFDIC
 Q:$D(ACRQUIT)!$D(ACROUT)!(+Y<1)
 I Y=2 S ACRDEL=""
 S DIR(0)="SO^1:Appropriation Accounts;2:Allowance Accounts;3:Sub-Allowance Accounts;4:Department Accounts"
 S DIR("A")="Which one"
 D DIR^ACRFDIC
 Q:$D(ACRQUIT)!$D(ACROUT)!(+Y<1)
 S ACRDIC=$S(Y=1:"^ACRAPP",Y=2:"^ACRALW",Y=3:"^ACRALC",1:"^ACRLOCB")
 S DIR(0)="LO^1:"_$P(@ACRDIC@(0),U,3)
 S DIR("A")="List ID NO(s). of the Accounts"
 D DIR^ACRFDIC
 Q:$D(ACRQUIT)!$D(ACROUT)!(+Y<1)
 N ACRYY
 S %X="Y("
 S %Y="ACRYY("
 D %XY^%RCR
 K Y
 S ACRYY=ACRYY(0)
 D:'$D(ACRDEL) MCAN1
 D:$D(ACRDEL) DCAN1
 I $D(ACRYY(1)) D
 .S ACRJ=0
 .F  S ACRJ=$O(ACRYY(ACRJ)) Q:'ACRJ  D
 ..S ACRYY=ACRYY(ACRJ)
 ..D:'$D(ACRDEL) MCAN1
 ..D:$D(ACRDEL) DCAN1
 K ACRDEL
 Q
MCAN1 F ACRI=1:1 S ACRX=$P(ACRYY,",",ACRI) Q:ACRX=""  I $D(@ACRDIC@(ACRX,0))#2 D
 .S:'$D(@ACRDIC@(ACRX,"SC",0)) @ACRDIC@(ACRX,"SC",0)=$S(ACRDIC["ACRALW":"^9002186.01P",ACRDIC["ACRALC":"^9002187.04P",1:"^9002188.04P")
 .Q:$D(@ACRDIC@(ACRX,"SC","B",ACRDUZ))
 .S DA(1)=ACRX
 .S DIC=ACRDIC_"("_ACRX_",""SC"","
 .S DIC(0)="L",X=ACRDUZ
 .D FILE^ACRFDIC
 Q
DCAN1 F ACRI=1:1 S ACRX=$P(ACRYY,",",ACRI) Q:ACRX=""  I $D(@ACRDIC@(ACRX)) D
 .S DA(1)=ACRX
 .S DA=$O(@ACRDIC@(ACRX,"SC","B",ACRDUZ,0))
 .S DIK=ACRDIC_"("_ACRX_",""SC"","
 .D:DA DIK^ACRFDIC
 Q
10 ;EP;TO LIST USERS WITH ACCESS LEVEL 10
 Q:'$D(^ACRUAL("LVL",DUZ,3))
 N X,Y
 W @IOF
 W !?10,"LIST OF USERS WITH LEVEL 9 OR 10 ACCESS"
 W !?10,"---------------------------------------"
 S X=0
 F  S X=$O(^ACRUAL("LVL",X)) Q:'X  D
 .;I $D(^ACRUAL("LVL",X,3))!$D(^ACRUAL("LVL",X,11)),$D(^VA(200,X,0)) S Y=$P(^(0),U) D  ;ACR*2.1*19.02 IM16848
 .I $D(^ACRUAL("LVL",X,3))!$D(^ACRUAL("LVL",X,11)),$D(^VA(200,X,0)) S Y=$$NAME2^ACRFUTL1(X) D  ;ACR*2.1*19.02 IM16848
 ..S Y=$P($P(Y,",",2)," ")_" "_$P(Y,",")
 ..W !?10,Y,?32,"LEVEL ",$S($O(^ACRUAL("LVL",X,0))=3:10,1:9)
 W !!!,"The users listed above all have LEVEL 9 or 10 access to ARMS."
 W !!,"Only users who absolutely need this level of access and who are performing"
 W !,"ARMS Manager functions should have LEVEL 9 or 10 access."
 W !!,"Review this information to ensure that only authorized ARMS Managers"
 W !,"have LEVEL 9 or 10 access."
 D PAUSE^ACRFWARN
 Q
SCREEN ;EP;TO DETERMINE IF SCREENMAN SHOULD BE INVOKED
 K ACRSCREN
 I +$G(^ACRSYS(1,"DT1")) S ACRSCREN="" Q
 I $P($G(^ACRSYS(1,"DT")),U,40),$P($G(^ACRAU(DUZ,1)),U,13) S ACRSCREN=""
 Q
LIST ;EP;TO PRINT LIST OF ARMS USERS
 S DIC="^ACRAU("
 S FLDS="[ACR ARMS USER LIST]"
 S BY=".01"
 S FR="A"
 S TO="ZZ"
 S IOP=ION
 D EN1^DIP
 D PAUSE^ACRFWARN
 Q
PLIST ;EP;TO DISPLAY LIST OF ARMS USERS
 S ZTDESC="ARMS USER LIST"
 S ACRRTN="LIST^ACRFAU"
 D ^ACRFZIS
 Q
EMPLOYEE ;EP;TO SELECT EMPLOYEE
 W @IOF
EMP1 ;EP;TO SKIP FORM FEED
 K ACRDUZ
 S DIC="^VA(200,"
 S DIC(0)="AEMQZ"
 S DIC("A")="EMPLOYEE............: "
 S DIC("DR")=""
 W !!?21,"|" F ACRI=1:1:30 W "="
 W "|"
 D DIC^ACRFDIC
 I U[$E(X)!(+Y<1) S ACRQUIT="" Q
 S ACRDUZ=+Y
 ;S ACRUSER=Y(0,0)                                 ;ACR*2.1*21.02 IM16848
 ;S ACRUSER=$P(ACRUSER,",",2)_" "_$P(ACRUSER,",")  ;ACR*2.1*21.02 IM16848
 S ACRUSER=$$NAME3^ACRFUTL1(ACRDUZ)                ;ACR*2.1*21.02 IM16848
 Q
FDMCAN ;EP;ASSIGN ACCESS TO MULTIPLE ACCOUNTS FROM FUNDS DISTRIBUTION
 K ACRDUZ
 D EMPLOYEE
 I '$G(ACRDUZ) S ACRQUIT="" Q
 D MCAN
 Q
