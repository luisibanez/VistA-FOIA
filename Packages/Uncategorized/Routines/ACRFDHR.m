ACRFDHR ;IHS/OIRM/DSD/THL,AEF - PROCESS DOCUMENT HISTORY RECORDS;  [ 10/27/2004   4:18 PM ]
 ;;2.1;ADMIN RESOURCE MGT SYSTEM;**3,13**;NOV 05, 2001
 ;
EN D EN1
EXIT F ACRI=1:1:30 K @("ACR"_ACRI)
 K ACR,ACRTCODE,ACRRCODE,ACRMCODE
 Q
EN1 ;
 N ACRREF,ACRDHR,ACRREFX,ACROBJ
 S ACRDOC0=^ACRDOC(ACRDOCDA,0)
 S ACRREF=$P(ACRDOC0,U,13)
 I $P(ACRDOC0,U,4)=30 S ACRREF=63
 I $P(ACRDOC0,U,4)=35,$P($G(^ACRSYS(1,"DT1")),U,8)'=1 Q  ; NO DHR FOR CREDIT CARD PURCHASES
 I $P(ACRDOC0,U,19),'$P(^ACRSYS(1,"DT"),U,36) Q  ;NO DHR FOR BPA CALLS UNLESS INDICATED
 Q:'ACRREF
 Q:'$D(^AUTTDOCR(ACRREF,0))  S ACRREF=$P(^AUTTDOCR(ACRREF,0),U)
 Q:ACRREF=""
 I $D(^ACRDOC(ACRDOCDA,3)),$P(^(3),U,11)]""!($P(^(3),U,12)]"") S ACRREF=210
 S ACRREFX=$S("^103^210^101^"[(U_ACRREF_U):103,1:ACRREF)
 I $D(ACRDHRZ),$D(ACRRREF) S ACRREF=ACRRREF
 I $D(ACRRR),$G(ACRRRNO) S ACRREFX=499
 S ACRDHR=""
 I $P(^ACRSYS(1,"DT"),U,32),"^130^600^"'[(U_ACRREF_U) Q
 I ACRREF=210,'$P(^ACRSYS(1,"DT"),U,38) Q
 S:'$D(ACRTCODE) ACR3=$S(ACRREF'=600:"050",$P(^ACROBL(ACRDOCDA,"APV"),U,9)>1:"182",1:"192")
 S:$D(ACRTCODE)#2 ACR3=ACRTCODE
 I $P(^ACRSYS(1,"DT"),U,37),"^600^618^"[(U_ACRREF_U),"^181^182^191^192^"[(U_$G(ACRTCODE)_U) Q
 I "^600^618^"[(U_ACRREF_U),$P(^ACRSYS(1,"DT"),U,37),'$D(ACRCANCL) Q  ;NO DHR IF TRAVEL PAID BY 1166
 D EN1^ACRFPSS
 D DHR
 Q
DHR ;EP;CREATE INDIVIDUAL DHR'S
 S ACR1=2
 S:"^116^204^103^204^349^326^210^"[(U_ACRREF_U) ACRVDA=$P(^ACRDOC(ACRDOCDA,"PO"),U,5)
 S:"^130^600^"[(U_ACRREF_U) ACRVDA=$P(^ACRDOC(ACRDOCDA,"TO"),U,9)
 S:ACRREF="043" ACRVDA=""
 S:ACRREF=148 ACRVDA=+$G(^ACRDOC(ACRDOCDA,"TRNG3"))
 S ACR2=DT
 S:'$D(ACRTCODE) ACR3=$S(ACRREF'=600:"050",$P(^ACROBL(ACRDOCDA,"APV"),U,9)>1:"182",1:"192")
 S:$D(ACRTCODE)#2 ACR3=ACRTCODE
 S:'$D(ACRRCODE)#2 ACR4=$S($P(ACRDOC0,U,14)["CANCELLED":2,1:1)
 S:$D(ACRRCODE)#2 ACR4=ACRRCODE
 N ACRRCODT ;ACR*2.1*3.3
 S ACRRCODT=ACR4              ;SAVE REVERSAL CODE ;ACR*2.1*3.3
 S:'$D(ACRMCODE) ACR5=$S($P(ACRDOC0,U,15):5,$D(^ACRDHR("E",ACRDOCDA))&(ACRREF=600):4,$P(ACRDOC0,U,14)["CANCELLED":5,1:3)
 S:$D(ACRMCODE)#2 ACR5=ACRMCODE
 S ACR6=$S(ACRREF'=600:ACRREF,ACRREF=600:130,1:ACRREF)
 N ACRDOC,ACRCAN,ACRAMT
 S ACR7=$S("^103^349^326^210^"[(U_ACRREF_U)&($P(ACRDOC0,U,2)]""):$P(ACRDOC0,U,2),1:$P(ACRDOC0,U))
 S:$L($P(ACRDOC0,U,27))=10 ACR7=$P(ACRDOC0,U,27)
 I ACR7["-" D
 .S ACR7=$TR(ACR7,"-","")
 .S ACR7=$E(ACR7,2,11)
 ;S:"^103^349^326^130^"[(U_$E(ACR7,1,3)_U) ACR7=$E(ACR7,4,99)
 S ACR7=$E("0000000000",1,10-$L(ACR7))_ACR7
 S ACR7=$E(ACR7,1,10)
 I ACRREFX'=499,ACRREFX'="043" S ACR8=$S($P($G(^ACRDOC(ACRDOCDA,18)),U,5)]"":$P(^AUTTDOCR($P(^(18),U,5),0),U),1:"000")
 I ACRREFX=499!(ACRREFX="043") D
 .S ACR8=ACR6
 .S ACR9=ACR7
 .S:ACRREFX="043" (ACR6,ACR7)=""
 I ACRREFX'=499&(ACRREFX'="043") D
 .S ACR9=$P($G(^ACRDOC(ACRDOCDA,18)),U,4)
 .S ACR9=$E("0000000000",1,10-$L(ACR9))_ACR9
 S ACR10=1
 N ACRLOCB                           ; ACR*2.1*13.05 IM10810
 S ACRLOCB=$P(ACRDOC0,U,6)           ; ACR*2.1*13.05 IM10810
 S ACR11=$E($$FYFUN^ACRFUTL1(ACRLOCB),4)    ; ACR*2.1*13.05 IM10810
 S ACR15=$S($G(ACRFEDC)=2:2,ACRREF'=210:1,1:2)
 S ACR16=""
 I ACRVDA D
 .I "^103^349^326^210^148^204^"[(U_ACRREF_U),$D(^AUTTVNDR(ACRVDA,11)),$P(^(11),U,13)]"" S ACR16=$P(^(11),U,13)
 .I "^130^600^"[(U_ACRREF_U),$D(^VA(200,ACRVDA,1)),$P(^(1),U,9)]"" S ACR16=$P(^(1),U,9)
 S ACR16=ACR16_$E("               ",1,15-$L(ACR16))
 S ACR17="000000000000000"
 S ACR18=$E($P($G(^ACRDOC(+$G(ACRDOCDA),18)),U,3),1,10)
 S ACR18=$$PAD^ACRFUTL(ACR18,"L",10,"")
 S ACR19="000000"
 S ACR20="00"
 S ACR21="0"
 S ACR22="00"
 S ACR23="0000"
 S ACR24="0000"
 S ACR25="000000"
 S ACR27=""
 I $G(ACRDOCDA)]"" S ACR27=$G(^ACRDOC(ACRDOCDA,"TO"))
 S ACR26=$E($P(ACR27,U,14),4,5)_$E($P(ACR27,U,14),2,3)
 I $L(ACR26)'=4 S ACR26="    "
 S ACR27=$E($P(ACR27,U,15),4,5)_$E($P(ACR27,U,15),2,3)
 I $L(ACR27)'=4 S ACR27="    "
 S ACR28=$E($$FYFUN^ACRFUTL1(ACRLOCB),3,4)   ; ACR*2.1*13.05 IM10810
 I $L(ACR28)'=2 S ACR28="  "
 S ACR29=" "
 S ACR30="    "
 S ACRACT=""
 F  S ACRACT=$O(ACROBJ(ACRACT)) Q:ACRACT=""  D ACT
 Q
 ;
ACT ;S ACR11=$E($P(ACRACT," ",2));                  ; ACR*2.1*13.05 IM10810
 S ACRCANDA=0
 F  S ACRCANDA=$O(ACROBJ(ACRACT,ACRCANDA)) Q:'ACRCANDA  I $D(^AUTTCAN(ACRCANDA,0)) S ACR12=$P(^(0),U) D:$L(ACR12)=7
 .S ACROBJDA=0
 .F  S ACROBJDA=$O(ACROBJ(ACRACT,ACRCANDA,ACROBJDA)) Q:'ACROBJDA  I $D(^AUTTOBJC(ACROBJDA,0)) S ACR13=$P(^(0),U) I $L(ACR13)=4 D
 ..D CREATE
 ..;NEXT SECTION CREATES SEPARATE DHR FOR AIRLINE EXPENSE IF INDICATED
 ..I $D(ACROBJ(ACRACT,ACRCANDA,ACROBJDA,"A"))#2 D
 ...S ACR13=$P(^AUTTOBJC(ACROBJDA,0),U)
 ...S ACR6=$P($G(^AUTTDOCR(+$P($G(^ACRSYS(ACRADA,"DT")),U,35),0)),U)
 ...Q:ACR6'?3N
 ...S ACROBJ(ACRACT,ACRCANDA,ACROBJDA)=ACROBJ(ACRACT,ACRCANDA,ACROBJDA,"A")
 ...D CREATE
 K ACRDR
 Q
CREATE I ACRREFX=499,$E(ACR13,1,2)=22!($E(ACR13,1,2)=23) Q
 S ACR14=ACROBJ(ACRACT,ACRCANDA,ACROBJDA)
 I +ACR14=0,"^181^182^190^191^192^"'[(U_(ACR3)_U) Q
 I ACRREF=600,'$D(^ACRDHR("E",ACRDOCDA)),ACR14=0 Q
 I ACR3="050",ACROBJDA=$P($G(^ACRSYS(1,400)),U,2),'$P($G(^ACRSYS(1,400)),U,3) Q   ;TRAVEL MGT FEE OBL DHR
 I "^181^182^190^191^191^"[(U_(ACR3)_U),ACROBJDA=$P($G(^ACRSYS(1,400)),U,2),'$P($G(^ACRSYS(1,400)),U,4) Q   ;TRAVEL MGT FEE PMT DHR
 D 14
 S (ACRDR,ACRDHR)=""
 F ACR=1:1:30 D
 .S ACRDR=ACRDR_ACR_"////"_@("ACR"_ACR)_";"
 .S ACRDHR=ACRDHR_@("ACR"_ACR)
 S ACRDR=ACRDR_"211////"_$G(ACRRRZDA) ;ACR*2.1*3.31
 ;Q:$D(^ACRDHR("C",ACRDHR))   ;COMMENTED OUT TO ALLOW NEW OBLIGATION DHR TO BE CREATED WHEN A DOCUMENT IS CANCELLED AND THEN RETURNED TO INITIATOR AND REPROCESSED
 S X=ACR7
 S:ACRREF="043" X=ACR9
 S DIC="^ACRDHR("
 S DIC(0)="L"
 S DLAYGO=9002189.1
 S DIC("DR")=".02////"_DT_";.03////"_DUZ_";.04////"_$G(ACRDOCDA)
 K DD,DO,DINUM
 D FILE^ACRFDIC
 S (ACRDA,DA)=+Y
 I +Y>0 S ACRFMS=+Y
 S DIE="^ACRDHR("
 S DR=ACRDR
 D DIE^ACRFDIC
 S DA=ACRDA
 S DIE="^ACRDHR("
 S DR="99////"_ACRDHR
 D DIE^ACRFDIC
 D DHRRCD^ACRFDHR1
 I $G(ACRDOCDA) D   ;ACR*2.1*3.28
 .S ACR=ACR1_U_ACR3_U_ACR4_U_ACR5_U_ACR6_U_ACR12_U_ACR13_U_$$DOL^ACRFUTL(ACR14/100)_U_ACR15_U_ACR16_U_ACR7 ;OPEN DOCUMENT INTERFACE ;ACR*2.1*3.28
 .D EN^ACRFODOC(ACRDOCDA,ACR,"") ;OPEN DOCUMENT INTERFACE ;ACR*2.1*3.28
 S (ACRRCODE,ACR4)=ACRRCODT          ;RESET REVERSAL CODE ;ACR*2.1*3.3
 Q
14 ;FORMAT DOLLAR AMOUNT
 S ACR14=$FN(ACR14,"P",2)
 S ACR14=$TR(ACR14," ","")
 S ACR14=$TR(ACR14,".","")
 I ACR14["(" D   ;ACR*2.1*3.3
 .I ACRRCODT=2 S (ACRRCODE,ACR4)=1  ;If cancelled reverse negative to positive ;ACR*2.1*3.3
 .I ACRRCODT=1 S (ACRRCODE,ACR4)=2 ;ACR*2.1*3.3
 S ACR14=$TR(ACR14,"(",0)
 S ACR14=$TR(ACR14,")","")
 S ACR14=$J(ACR14,12)
 S ACR14=$TR(ACR14," ","0")
 Q
PRINT ;EP;TO PRINT DHR'S FOR SELECTED DOCUMENT
 Q:'$D(ACRDOCDA)
 Q:'ACRDOCDA
 N ACRACT
 S ACRDOC0=^ACRDOC(ACRDOCDA,0),ACRACT=$P(^ACRSYS(1,"DT"),U,25)
 I $P(ACRDOC0,U,4)=35,$P($G(^ACRSYS(1,"DT1")),U,8)'=1 Q  ; NO DHR FOR CREDIT CARD PURCHASES
 I 'ACRACT!$P($G(^ACRSYS(1,"DT")),U,39) D P Q
 ;PRINT DHR FOR BPA CALLS IF NO AUTO DHR
 I $P(ACRDOC0,U,19),'$P(^ACRSYS(1,"DT"),U,36) D P Q
 ;PRINT NON-TO/TV DHR'S
 I $P(^ACRSYS(1,"DT"),U,32),"^130^600^"'[(U_ACRREF_U) D P Q
 I ACRREF=210,'$P(^ACRSYS(1,"DT"),U,38) D P Q
 ;NO DHR IF TRAVEL PAID BY 1166
 I "^600^618^"[(U_ACRREF_U),$P(^ACRSYS(1,"DT"),U,37) D P Q
 Q
P S D0=0
 F  S D0=$O(^ACRDHR("E",ACRDOCDA,D0)) Q:'D0  D P1
 D PAUSE^ACRFWARN
 Q
P1 ;EP;TO PRINT INDIVIDUAL DHR
 N DXS,DIP,DC,DN
 W !,"DOCUMENT HISTORY RECORD"
 W:$G(ACRDOCDA) " FOR: ",$P(^ACRDOC(ACRDOCDA,0),U,2)
 D ^ACRDHR
 W @IOF
 Q