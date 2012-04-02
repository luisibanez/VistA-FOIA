APCDHOS ; IHS/CMI/LAB - DISPLAY HISTORY OF SURGERY ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
HOS ; ************* HISTORY OF SURGERY * 9000010.08 (V PROCEDURE) *******
 ; <SETUP>
 D DATE
 S APCDTICF="S"
 I '$D(^AUPNVPRC("AC",APCDPAT)) W !!,"***************** NO SURGICAL HISTORY ON FILE ******************",!! Q
 W !!,"************************ SURGICAL HISTORY **********************",!!
 S APCDTCNT=0
 ; <DISPLAY>
 S APCDTIVD=0 F APCDTQ=0:0 S APCDTIVD=$O(^AUPNVPRC("AA",APCDPAT,APCDTIVD)) Q:'APCDTIVD  S APCDTDFN=0 F APCDTQ=0:0 S APCDTDFN=$O(^AUPNVPRC("AA",APCDPAT,APCDTIVD,APCDTDFN)) Q:'APCDTDFN  D HOSDSP
 I 'APCDTCNT W "Minor procedures are on file but have not been displayed.",!
 ; <CLEANUP>
HOSX K APCDTDFN,APCDTICD,APCDTNRQ,APCDTDAT,APCDTDS,APCDTICL,APCDTIVD,APCDTCOD,APCDTCNT,APCDTN,APCDTICF,APCDTCVD,APCDTNTD,APCDTQ,Y
 Q
HOSDSP S APCDTN=^AUPNVPRC(APCDTDFN,0)
 S APCDTICD=$P(APCDTN,U)
 D HOSCHK Q:APCDTICD=""
 S APCDTCNT=APCDTCNT+1
 D GETICDOP
 S Y=$P(APCDTN,U,3),Y=+^AUPNVSIT(Y,0)\1 X APCDTCVD S APCDTDAT=Y
 S APCDTNRQ=$P(APCDTN,U,4)
 D GETNARR
 S APCDTDS="DATE?",Y=$P(APCDTN,U,6) I Y]"" X APCDTCVD S APCDTDS=Y
 W APCDTDS S APCDTNTD=APCDTDAT S APCDTICL=12 D PRTICD
 Q
HOSCHK ;
 S APCDTCOD=$P($$ICDOP^ICDCODE(APCDTICD,$P(APCDTN,U,3)),U,2)
 I APCDTCOD\1>85 S APCDTICD="" Q
 I APCDTCOD=69.7 S APCDTICD="" Q
 I APCDTCOD\1=23 S APCDTICD="" Q
 I APCDTCOD\1=24 S APCDTICD="" Q
 Q
 ;
GETICDDX ;
 S:APCDTICF="L" APCDTICD=$P($$ICDDX^ICDCODE(APCDTICD,$P(APCDTN,U,3)),U,4)
 S:APCDTICF="S" APCDTICD=$P($$ICDDX^ICDCODE(APCDTICD,$P(APCDTN,U,3)),U,4)
 Q
GETICDOP ;
 S:APCDTICF="L" APCDTICD=$P($$ICDOP^ICDCODE(APCDTICD,$P(APCDTN,U,3)),U,5)
 S:APCDTICF="S" APCDTICD=$P($$ICDOP^ICDCODE(APCDTICD,$P(APCDTN,U,3)),U,5)
 Q
 ;
PRTICD ;
 S:APCDTNRQ="" APCDTNRQ="<no narrative provided>" S APCDTICD=""
 S APCDTTXT=APCDTICD D PRTTXT
 Q
 ;
PRTTXT ; GENERALIZED TEXT PRINTER
 S APCDTDLT=1,APCDTILN=80-APCDTICL-1
 F APCDTQ=0:0 S:APCDTNRQ]""&(($L(APCDTNRQ)+$L(APCDTTXT)+2)<255) APCDTTXT=$S(APCDTTXT]"":APCDTTXT_"; ",1:"")_APCDTNRQ,APCDTNRQ="" Q:APCDTTXT=""  D PRTTXT2
 K APCDTILN,APCDTDLT,APCDTF,APCDTC,APCDTTXT
 Q
PRTTXT2 D GETFRAG W ?APCDTICL W APCDTF,! S APCDTICL=APCDTICL+APCDTDLT,APCDTILN=APCDTILN-APCDTDLT,APCDTDLT=0
 Q
GETFRAG I $L(APCDTTXT)<APCDTILN S APCDTF=APCDTTXT,APCDTTXT="" Q
 F APCDTC=APCDTILN:-1:1 Q:$E(APCDTTXT,APCDTC)=" "
 S APCDTF=$E(APCDTTXT,1,APCDTC-1),APCDTTXT=$E(APCDTTXT,APCDTC+1,255)
 Q
 ;
GETNARR ;
 I APCDTNRQ]"" S APCDTNRQ=$S($D(^AUTNPOV(APCDTNRQ)):$P(^AUTNPOV(APCDTNRQ,0),U),1:"***** "_APCDTNRQ_" *****")
 E  S APCDTNRQ=""
 Q
 ;
GETSITEV ;
 S %=^AUPNVSIT(APCDTVDF,0),APCDTVSC=$P(%,U,7),APCDTITE=$P(%,U,6)
GETSITE ;
 S:APCDTITE="" APCDTITE="null"
 S %=$G(^AUTTLOC(APCDTITE,0))
 S APCDTNFL=$P(%,U),APCDTNFL=$S($D(^DIC(4,APCDTITE,0)):$P(^(0),U),1:"<"_APCDTITE_">")
 S APCDTNSH=$P(%,U,2) I APCDTNSH="" S APCDTNSH="<"_APCDTITE_">"
 S APCDTNAB=$J($P(%,U,7),4) I APCDTNAB="" S APCDTNAB="<"_APCDTITE_">"
 Q
DATE S APCDTCVD="S:Y]"""" Y=+Y,Y=$E(Y,4,5)_""/""_$E(Y,6,7)_""/""_(1700+$E(Y,1,3))" K Y
 Q