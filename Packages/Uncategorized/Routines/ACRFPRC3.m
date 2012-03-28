ACRFPRC3 ;IHS/OIRM/DSD/THL,AEF - PROCESS PENDING DOCUMENTS;  [ 01/03/2003  9:53 AM ]
 ;;2.1;ADMIN RESOURCE MGT SYSTEM;**3,5**;NOV 05, 2001
 ;;CONTINUATION OF ACRFPRCS
UP ;EP;TO SET NEXT APPROVAL TO BE PROCESSED
 N ACRAPDA
 K ACRQUIT,ACROUT
 S ACRORD=0
 F  S ACRORD=$O(^ACRAPVS("AORDR",ACRDOCDA,ACRORD)) Q:'ACRORD!$D(ACRQUIT)!$D(ACROUT)  D
 .S ACRAPDA=0
 .F  S ACRAPDA=$O(^ACRAPVS("AORDR",ACRDOCDA,ACRORD,ACRAPDA)) Q:'ACRAPDA!$D(ACRQUIT)  D
 ..S ACRAPV0=$G(^ACRAPVS(ACRAPDA,0))
 ..S ACRAPVDT=$G(^ACRAPVS(ACRAPDA,"DT"))
 ..Q:$P(ACRAPVDT,U)]""
 ..Q:DT<$P(ACRAPVDT,U,8)
 ..K ACRQUIT
 ..D NOW^%DTC
 ..S ACRNOW=%
 ..S ACRAPVT=$P(ACRAPV0,U,3)
 ..S ACRINDV=$P(ACRAPVDT,U,2)
 ..I ACRAPVT=""!(ACRINDV="") S ACRQUIT="" Q
 ..S $P(^ACRAPVS(ACRAPDA,"DT"),U,3)=ACRNOW
 ..S ^ACRAPVS("ANXT",ACRAPVT,ACRINDV,ACRAPDA)=ACRDOCDA_U_$P(ACRAPVDT,U,8)
 ..S $P(^ACRAPVS(ACRAPDA,"DT"),U,3)=ACRNOW
 ..D DOMAIN^ACRFNXT
 ..K ACRINDV,ACRAPV0,ACRAPVDT
 ..S ACRQUIT=""
 K ACRQUIT
 Q
APX ;EP;SUBROUTINE TO UPDATES INFO IN THE APPROVAL FILE FOR EACH DOCUMENT
 ;APPROVAL.  ALSO, CREATES A MAILMAN MESSAGE WHENEVER DOCUMENT IS NOT
 ;APPROVED OR WHEN ANY MESSAGE IS ENTERED AT TIME OF APPROVAL
 Q:+$$SIGSCR^ACRFPRC1($G(ACRAPVT),.ACRAPVS,$P($G(^ACRDOC(ACRDOCDA,"TO")),U,9),$P($G(^ACRDOC(ACRDOCDA,"TRNG")),U,2),DUZ)
 D NOW^%DTC
 S ACRNOW=%
 S DA=ACRAPDA
 S DIE="^ACRAPVS("
 S DR="1////"_ACRAPDAS_";6////"_DUZ_";4////"_ACRNOW
 S:$D(ACRSIGN(ACRAPDA)) DR=DR_";3////"_ACRNOW
 D DIE^ACRFDIC
 S ACRAPV0=^ACRAPVS(ACRAPDA,0)
 S ACRAPVDT=^ACRAPVS(ACRAPDA,"DT")
 S X=^ACRAPVT($P(ACRAPV0,U,3),"DT")
 S ACRGLB=$P(X,U)
 S ACRPC=$P(X,U,2)
 S ACRTXTYP=$P(ACRDOC0,U,4)
 S ACRAPVT=$P(ACRAPV0,U,3)
 S ACRAPDAS=$P(ACRAPVDT,U)
 S ACRAPDAF=$E($P(ACRAPVDT,U,5))
 S ACRINDV=$P(ACRAPVDT,U,2)
 S ACRORD=$P(ACRAPV0,U,4)
 I ACRAPVT=15,$P(ACRAPV0,U,6)=$O(^AUTTDOCR("B",602,0)) D OTA^ACRFTA:ACRAPDAS="A" Q:ACRAPDAS'="A"
 I ACRAPVT'=43 D:ACRAPDAF="Y" APV11
 I $D(ACRALTY),$D(ACRALTX(ACRALTY)) S ACRDUZ=ACRALTX(ACRALTY)
 I ACRAPDAS="A" D
 .I ACRAPVT=36 D           ;IF TO REQUEST, CK FOR AMT>2500 & SEND MSG ACR*2.1*5.15
 ..D TO25^ACRFXMY(ACRDOCDA,ACRAPDA)           ;ACR*2.1*5.15
 .K ^ACRAPVS("ANXT",ACRAPVT,ACRINDV,ACRAPDA),^TMP("ACRDATA",$J,ACRDUZ,ACRJJ),^TMP("ACRALT",$J,ACRDUZ,ACRJJ)
 .D CERT^ACRFPRC4:$P(ACRAPV0,U,6)'=$O(^AUTTDOCR("B",602,0))
 .D UP
 I ACRAPDAS="D" D
 .K ^ACRAPVS("ANXT",ACRAPVT,ACRINDV,ACRAPDA),^TMP("ACRDATA",$J,ACRDUZ,ACRJJ),^TMP("ACRALT",$J,ACRDUZ,ACRJJ)
 .I $P(^ACRAPVS(ACRAPDA,0),U,11) D OTADEL^ACRFTA Q
 .D EN3^ACRFDEL
 .S DA=ACRDOCDA
 .S DIE="^ACROBL("
 .S DR="903////D"
 .D DIE^ACRFDIC
 Q
APV11 ;SUBROUTINE TO UPDATE OBLIGATION AND DOCUMENT FILE INFO DURING
 ;APPROVAL PROCESS
 I $G(ACRAPDAS)="D",$P(^ACRAPVS(ACRAPDA,0),U,11) Q
 W:$E($G(IOST),1,2)="C-" !!,"Document ",$S(ACRAPDAS="A":"",1:"DIS"),"APPROVED, now being forwarded for processing..."
 S DA=ACRDOCDA
 S DIE="^ACROBL("
 S DR="903////"_ACRAPDAS
 I "^103^204^349^326^210^600^148^"[(U_ACRREF_U) D
 .S:"^103^349^326^210^148^"[(U_ACRREF_U)!(ACRREF=204&($P(^ACRDOC(ACRDOCDA,0),U,4)=30)) DR=DR_";911////"_ACRAPDAS_";905////"_ACRAPDAS
 .I ACRREF=600,$P($G(^AUTTDOCR(+$P($G(ACRAPV0),U,6),0)),U)=600 S DR=DR_";911////"_ACRAPDAS_";905////"_ACRAPDAS
 D DIE^ACRFDIC
 I ACRAPDAF="Y",ACRAPDAS="A" D PROCESS
 Q
PROCESS ;PROCESS FINAL APPROVAL SIGNATURE
 S ACRPODA=$P(ACRDOC0,U,8)
 S ACRLBDA=$P(ACRDOC0,U,6)
 S ACRDPTDA=$P(^ACRLOCB(ACRLBDA,0),U,5)
 S ACRPA=$P(^ACRDEPT(ACRDPTDA,0),U,3)
 I ACRREF=116,'+$G(^ACRDOC(ACRDOCDA,"PA")) D
 .S DIE="^ACRDOC("
 .S DA=ACRDOCDA
 .S ACRPA=$S(ACRPA:ACRPA,1:$P(^ACRPO(ACRPODA,0),U,3))
 .S DR=".2////"_ACRPA
 .D DIE^ACRFDIC
 I ACRREF=116,$P(ACRDOC0,U,19)!($P(ACRDOC0,U,4)=30) D CONV
 I "^116^204^101^130^148^"[(U_ACRREF_U) D
 .S ACRREFX=ACRREF
 .D ^ACRFPRNT
 .K ACRREV
 I ACRREF=103!(ACRREF=349)!(ACRREF=326)!(ACRREF=210),ACRAPVT=1 D
 .D PONUM1^ACRFPRC4
 .S ACRPO=""
 .I $D(^ACRDOC(ACRDOCDA,3)),$P(^(3),U,13) D FEDSTRIP^ACRFSSA
 D OBL^ACRFSS
 I "^103^204^349^326^210^130^600^148^"[(U_ACRREF_U)!(ACRREF=116&($P(^ACRDOC(ACRDOCDA,0),U,4)=35)) D
 .S:ACRREF=103!(ACRREF=349)!(ACRREF=326)!(ACRREF=210) (ACRPO,ACRPPO)=""
 .S ACRREFX=ACRREF
 .D:$G(ACRAPVT)'=9 ^ACRFDHR
 .D:ACRREF'=130 ^ACRFPRNT
 .K ACRREV,ACRPO,ACRPPO
 I ACRREF=130,ACRAPVT=21 D
 .S (ACRSSDA,ACRTOT)=0
 .F  S ACRSSDA=$O(^ACRSS("C",ACRDOCDA,ACRSSDA)) Q:'ACRSSDA  I $D(^ACRSS(ACRSSDA,"DT")) S ACRTOT=ACRTOT+$P(^("DT"),U,4)
 .I ACRTOT D
 ..S DIE="^ACRDOC("
 ..S DA=ACRDOCDA
 ..S DR="130176////"_$G(ACRTOT)
 ..D DIE^ACRFDIC
 ;CREATE TRAVEL PAYMENT ENTRY IN 1166
 I ACRREF=600,ACRAPVT=38!(ACRAPVT=39),$P($G(^ACRSYS(1,"DT1")),U,9)>1 D PAYT
 I ACRREF=148,ACRAPVT=38!(ACRAPVT=39),$P($G(^ACRSYS(1,"DT1")),U,9)>2 D PAYT
 I ACRREF=130,$P($G(^ACROTA(ACRDOCDA,0)),U,3)>$P($G(^ACROTA(ACRDOCDA,0)),U,4) D OTAAPP
 I ACRREF=116!(ACRREF=101)!(ACRREF=130)!(ACRREF=210&($P(^ACROBL(ACRDOCDA,"APV"),U,3)="")) D CONV
 I ACRAPVT=1 D POAPP^ACRFXMY
 I ACRAPVT=21 D TOAPP^ACRFXMY
 I ACRAPVT=22 D TRAPP^ACRFXMY
 I ACRAPVT=38!(ACRAPVT=39) D TVAPP^ACRFXMY
 I $P(^ACRDOC(ACRDOCDA,0),U,4)=30 D RR
 Q
CONV ;EP;CONVERT REQUEST TO PO AND TRAVEL ORDER TO TRAVEL VOUCHER WHEN APPROVED
 S ACRREF=$S(ACRREF=130:600,$P(^ACRDOC(ACRDOCDA,0),U,4)=30:204,$P(^(0),U,24)&($P(^(0),U,24)<4):349,$P(^(0),U,24)=4:326,"^116^204^101^103^210^"[(U_ACRREF_U):103,1:ACRREF)
 S:$P($G(^ACRDOC(ACRDOCDA,3)),U,13) ACRREF=210
 S ACRREFDA=$O(^AUTTDOCR("B",ACRREF,0))
 S DA=ACRDOCDA
 S DIE="^ACRDOC("
 S DR=".13///"_ACRREF
 N ACRBPA
 I ACRREF=103!(ACRREF=349)!(ACRREF=326)!(ACRREF=210) D
 .S DR=DR_";.4////"_$P(^ACRPO($P(ACRDOC0,U,8),0),U,3)
 .I $P(^ACRDOC(ACRDOCDA,0),U,19) D
 ..S ACRBPA=$P(^ACRDOC(ACRDOCDA,0),U,19)
 ..S ACRUSER=+^ACRDOC(ACRBPA,"PA")
 ..S DR=DR_";.2////"_ACRUSER_";.3////"_DT
 S:ACRREF=600 DR=DR_";130155////"_DT
 S:ACRREF=148 DR=DR_";148320////"_DT
 K ACRTXDAX
 D DIE^ACRFDIC
 S ACRTXDA=$P(ACRDOC0,U,4)
 S DA=ACRDOCDA
 S DIE="^ACROBL("
 S DR=".1///"_ACRREF_";906////Y"
 S:ACRREF=600 DR=DR_";910////19"
 D DIE^ACRFDIC
 S ACRY=ACRDOCDA
 S ACRDA=0
 F  S ACRDA=$O(^ACRSS("C",ACRY,ACRDA)) Q:'ACRDA  D
 .S DA=ACRDA
 .S DIE="^ACRSS("
 .S DR=".1///"_ACRREF
 .D DIE^ACRFDIC
BPA ;IF CALL AGAINST BPA OR CREDIT CARD PURCHASE
 ;AUTHORIZE PURCHASE AND BYPASS PURCHASING
 ;I $P(^ACRDOC(ACRDOCDA,0),U,19)!($P(^(0),U,25))!($P(^(0),U,4)=35)!($P(^(0),U,12)) D
 I $P(^ACRDOC(ACRDOCDA,0),U,19)!($P(^(0),U,25)&($P(^(0),U,4)=35)) D
 .S DA=ACRDOCDA
 .S DIE="^ACROBL("
 .S DR="905////A;911////A"
 .D DIE^ACRFDIC
 .S DA=ACRDOCDA
 .S DIE="^ACRDOC("
 .S DR=".13///103"
 .D DIE^ACRFDIC
 Q
AP1 ;EP;CHECK IF THE CURRENT USER IS SUPPOSED TO SIGN DOCUMENT IN ANY OTHER
 ;CAPACITY AND PROCESSES ADDITIONAL SIGNATURES
 K ACRP11
 N ACRAPDA
 S ACRAPDA=0
 F  S ACRAPDA=$O(ACRSIGN(ACRAPDA)) Q:'ACRAPDA  D APX
 Q
PAYT ;SEND TRAVEL PAYMENT INFO TO 1166
 K ACRIVPAY
 N J,X,Y,Z
 S X=0
 F J=1:1 S X=$O(^ACRSS("J",ACRDOCDA,X)) Q:'X  D
 .S Y=$G(^ACRSS(X,0))
 .S Z=$G(^ACRSS(X,"DT"))
 .Q:'$P(Y,U,4)!'$P(Y,U,5)
 .I J=1,ACRREF'=148,$P($G(^ACRDOC(ACRDOCDA,"TOAU")),U,5)'=1 Q
 .S ACRIVPAY($P(Y,U,5),$P(Y,U,4))=$G(ACRIVPAY($P(Y,U,5),$P(Y,U,4)))+$P(Z,U,4)
 Q:'$P(Y,U,4)!'$P(Y,U,5)
 S ACRIVPAY($P(Y,U,5),$P(Y,U,4))=$G(ACRIVPAY($P(Y,U,5),$P(Y,U,4)))-$P($G(^ACROTA(ACRDOCDA,0)),U,3)+$P($G(^(0)),U,4)
 S X=DT
 I $E(X,4,7)=1225 S X=$E(X,1,3)_1224
 I $E(X,4,7)="0101" S X=$E(X,1,3)_"0102"
 I $E(X,4,7)="0704" S X=$E(X,1,3)_"0705"
 S Z=X
 D DW^%DTC
 I $E(X)="S" D
 .S X1=Z
 .S X2=$S($E(X,1,2)="SA":-1,1:-2)
 .D C^%DTC
 .S Z=X
 S Y=$S(Z>DT:Z,1:DT)
 S ACRPAYDA=Y
 S ACRBTYP=$S(ACRREF'=148:"T",1:"V")
 D ^ACRFIV11
 K ACRIVPAY
 Q
RR ;PROCESS RECEIVING FOR MISC OBLIGATION DOCUMENTS
 N ACRSSDA
 S ACRSSDA=0
 F  S ACRSSDA=$O(^ACRSS("J",ACRDOCDA,ACRSSDA)) Q:'ACRSSDA  D
 .S ACRSS0=$G(^ACRSS(ACRSSDA,0))
 .S ACRSSDT=$G(^ACRSS(ACRSSDA,"DT"))
 .S X=ACRSSDA
 .S DIC="^ACRRR("
 .S DIC(0)="L"
 .S DIC("DR")=".02////"_ACRDOCDA_";.03////"_ACRDOCDA_";.04////1;.05////"_DUZ_";.06////"_DT_";.07////"_DT_";.08////1;1////"_$P(ACRSSDT,U,3)_";2////"_$P(ACRSSDT,U)_";3////"_$P(ACRSSDT,U)_";4////"_DT
 .D FILE^ACRFDIC
 S DA=ACRDOCDA
 S DIE="^ACROBL("
 S DR="909////1;911////"_ACRAPDAS_";905////"_ACRAPDAS
 D DIE^ACRFDIC
 S DA=ACRDOCDA
 S DIE="^ACRDOC("
 S DR="113210////"_DT
 D DIE^ACRFDIC
 Q
OTAAPP ;CREATE APPROVAL FOR OUTSTANDING TRAVEL ADVANCE
 N ACRREFDA,ACRFINAL,ACRAPVT,ACRORDER,ACRLBDA,ACRUSER,ACRDATE,ACRINDV,ACRAPDA
 S ACRREFDA=$O(^AUTTDOCR("B",602,0))
 D KILL^ACRFAPVS
 S ACRFINAL="N"
 S ACRAPVT=39
 S ACRORDER=1
 S ACRLBDA=$P(^ACRDOC(ACRDOCDA,0),U,6)
 S ACRUSER=$P(^ACRDOC(ACRDOCDA,"TO"),U,24)
 Q:'ACRUSER
 D NOW^%DTC
 S ACRDATE=%
 D SETAPP^ACRFAPVS
 S (DA,ACRAPDA)=+Y
 S ^ACRAPVS("ANXT",39,+ACRUSER,ACRAPDA)=ACRDOCDA
 S ACRUSERZ=ACRUSER
 S ACRAPDAZ=ACRAPDA
 S DIE="^ACRAPVS("
 S DR=".11////"_ACRDOCDA
 D DIE^ACRFDIC
 S ACRFINAL="Y"
 S ACRAPVT=15
 S ACRORDER=2
 S ACRREFDA=$O(^AUTTDOCR("B",602,0))
 S ACRLBDA=$P(^ACRDOC(ACRDOCDA,0),U,6)
 ;When a doucment is created, all of the Signature authorities
 ;are set into the FMS Document file, regardless of the type of request.
 ;The Area FMO is retrieved from the FMS System Default file and set
 ;into the REQ1 node and is not an editable field for the user.
 ;Sometimes this value is reset to a different person, by-passing the
 ;data dictionary input transform, which verifies that the person has
 ;the signature authority. Have not been able to find the cause of the
 ;error. Frequently, the erroneous value does not have the signature
 ;authority, so the document never comes up for approval. Appears to go
 ;into a black hole. This can create a problem when a travel advance is
 ;requested as the routines are hard-coded to use the Area FMO signature
 ;for the final approval for the advance. This is a band-aid fix that
 ;ignores what is in the Document file and uses the value in the FMS
 ;System Default file.  
 ;
 ;S ACRUSER=$P(^ACRDOC(ACRDOCDA,"REQ1"),U,13) ;COMMENTED OUT ;ACR*2.1*3.38
 S ACRUSER=$P(^ACRSYS(1,"DT"),U,5) ; Default Area FMO ;ACR*2.1*3.38
 Q:'ACRUSER
 D NOW^%DTC
 S ACRDATE=%
 D SETAPP^ACRFAPVS
 S (DA,ACRAPDA)=+Y
 S DIE="^ACRAPVS("
 S DR=".11////"_ACRDOCDA
 D DIE^ACRFDIC
ZZ ;EP;
 S ^ACRAPVS("ANXT",39,+ACRUSERZ,ACRAPDAZ)=ACRDOCDA
 Q
