AUPNVDXQ ; IHS/CMI/LAB - SETS "AQ" XREF FOR V DIAGNOSTIC PROCEDURE 24-MAY-1993 ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;MODIFIED FOR PATCH 2 TO SUPPORT AQ CROSS REFERENCES OHPRD/JCM 010195
AQKILL1 ; ENTRY POINT FROM V DX PROCEDURE DD .01 FIELD TO KILL "AQ" XREF
 N AUPNKKK S AUPNKKK=""
AQ1 ; ENTRY POINT FROM V DX PROCEDURE DD .01 FIELD TO SET "AQ" XREF
 I X="" Q
 I DUZ("AG")="V",'$P($G(^AUPNVDXP(DA,0)),U,7) Q  ;IHS/OHPRD/JCM 8/8/94
 N A,B,C,%,E,F S (A,F)=X
 K:$D(AUPNKKK) ^AUPNVDXP("AQ",(X_";"),DA) ;IHS/OHPRD/JCM 8/8/94
 S X=$P($G(^AUPNVDXP(DA,0)),U,4) I X="" S X=F S:'$D(AUPNKKK) ^AUPNVDXP("AQ",(X_";"),DA)="" Q  ;IHS/OHPRD/JCM 8/8/94
 D AQEN S X=F
 Q
 ;
AQKILL ; ENTRY POINT TO KILL V DX PROCEDURE "AQ" XREF FROM .04 FIELD
 N AUPNKKK S AUPNKKK=""
AQ ; ENTRY POINT TO SET V DX PROCEDURE "AQ" XREF FROM .04 FIELD
 I X="" Q
 I DUZ("AG")="V",'$P($G(^AUPNVDXP(DA,0)),U,7) Q  ;IHS/OHPRD/JCM 8/8/94
 N A,B,C,%,E
 S %=$D(^AUPNVDXP(DA,0)) Q:'%  S %=^(0)
 S A=+% I 'A Q
 K:'$D(AUPNKKK) ^AUPNVDXP("AQ",$P(^AUPNVDXP(DA,0),U)_";",DA) ;IHS/OHPRD/JCM 8/8/94
 S:$D(AUPNKKK) ^AUPNVDXP("AQ",$P(^AUPNVDXP(DA,0),U)_";",DA)="" ;IHS/OHPRD/JCM 8/8/94
AQEN S B=$G(AUPNDXTP) I B="" Q
 I B="S"!(B="G")!(B="L") S C=X D AQSET Q
 I "><"[$E(X) S X=$E(X,2,99)
 D @("AQ"_B)
 Q
 ;
AQZ I "nN"[$E(X) S C=0 D AQSET Q
 I "tT"[$E(X) S C=1 D AQSET Q
 I $E(X,1,2)?1N1"+" S C=+X I X,X<5 S C=X+1 D AQSET Q
 Q
 ;
AQSET S %=A_";"_C
 I $D(AUPNKKK) K ^AUPNVDXP("AQ",%,DA) Q
 S ^AUPNVDXP("AQ",%,DA)=""
 Q
 ;
AQT I "nN"[$E(X) S C="000000000" D AQSET Q
 I "pP"[$E(X) S C="000000001" D AQSET Q
 I $E(X,1,2)="1:" S C=+$P(X,":",2) I C S E="000000000" D AQPAD,AQSET Q
 Q
 ;
AQN S C=+X I C S E="0000" D AQPAD,AQSET
 Q
 ;
AQQ S C=("Nn"'[$E(X))
 D AQSET
 Q
 ;
AQPAD S %=$P(C,"."),%=$E(E,1,$L(E)-$L(%))_%
 I $P(C,".",2) S %=%_"."
 S C=%_$P(C,".",2)
 Q
 ;
STUFF ; SETS V DX PROCEDURE "AQ" XREF WITHOUT CALLING FILEMAN
 K ^AUPNVDXP("AQ")
 F DA=0:0 S DA=$O(^AUPNVDXP(DA)) Q:'DA  S X=$G(^(DA,0)),AUPNDXR=+X,X=$P(X,U,4) I X'="",AUPNDXR S AUPNDXTP=$P($G(^AUTTDXPR(AUPNDXR,0)),U,2) I AUPNDXTP'="" D AQ W *13,DA
 K AUPNDXTP,AUPNVDXR
 Q
 ;
