MCARPS3 ; HOIFO/NCA - Get Procedures for Medicine and CP ;1/13/04  14:35
 ;;2.3;Medicine;**39**;09/13/1996
 ;Modified from MCARPS2 for CPRS
 ; Please Reference DBIA # 3397
EN(MCDFN,CODE,MDSDT,MDEDT) ;Get procedures for a patient
 S WH="" K ^TMP("OR",$J,"MCAR")
 N MDGBL,MDPTR
 S MDGBL="^MCAR(690,""AC"",MCDFN)"
 F  S MDGBL=$Q(@MDGBL) Q:MDGBL=""  Q:$QS(MDGBL,3)'=MCDFN  D
 .S MDPTR=$QS(MDGBL,6)_";"_$QS(MDGBL,5)_",",S4=$QS(MDGBL,4),S5=$QS(MDGBL,5),S6=$QS(MDGBL,6)
 .D CONT
 D PR0
 K S5 Q
CONT ;CONT+1 modified on 2-7-94,S MCFILE..2) added to conform w/alpha site
 I $D(^MCAR(+$P(S5,"(",2),S6,2005)) S MCFILE=+$P(S5,"(",2) D SUM^MCMAG
 I S5="MCAR(702.7" Q
 I S5="MCAR(699" S (LL,LL1)=$P($G(^MCAR(699,S6,0)),U,12) Q:LL'>0  S LL=$P($G(^MCAR(697.2,LL,0)),U) G:'$D(PE) CONT1 Q:PE'=LL  G CONT1
 I S5="MCAR(699.5",'$D(PE) D  Q  ;MC*2.3*8
 .S LL6=$P($G(^MCAR(699.5,S6,0)),U,6),LL8=$P($G(^MCAR(699.5,S6,0)),U,8)
 .S (LL,LL1)=$P($G(^MCAR(699.5,S6,0)),U,6) Q:'LL  S LL=$P($G(^MCAR(697.2,LL,0)),U) D CONT1
 I S5="MCAR(699.5",$D(PE) D  Q  ;MC*2.3*8
 .S LL6=$P($G(^MCAR(699.5,S6,0)),U,6),LL8=$P($G(^MCAR(699.5,S6,0)),U,8)
 .S (LL,LL1)=$P($G(^MCAR(699.5,S6,0)),U,6) Q:'LL  S LL=$P($G(^MCAR(697.2,LL,0)),U)
 .N LLX,LLY
 .S LLX=$O(^MCAR(697.2,"B",PE,0)) Q:'LLX  S LLY=$P($G(^MCAR(697.2,LLX,1)),U)
 .I LLY="S",LLX=LL6 D CONT1
 .I LLY="P",LLX=LL8 D CONT1
 I S5[694 S (LL,LL1)=$P($G(^MCAR(694,S6,0)),U,3) Q:'LL  S LL=$P(^MCAR(697.2,LL,0),U) G CONT1:'$D(PE) Q:PE'=LL  G CONT1
 ;MFD 2/5/93 I S5[700,$P($G(^MCAR(700,S6,2)),U)'="Y" Q  ;    exclude unreleased PFT
 S (LL,LL1)=$O(^MCAR(697.2,"C",S5,0)),LL=$P(^MCAR(697.2,LL,0),U,1)
CONT1 ;
 S REC=$O(^MCAR(697.2,"B",LL,0)) S:REC="" REC=0
 S MCARCODE=""
 S MCESON=$P($G(^MCAR(697.2,REC,0)),U,14),MCESKEY=$P($G(^MCAR(697.2,REC,0)),U,15),MCSUP=+$P($G(^MCAR(697.2,REC,0)),U,16)
 S (MCARSUM,MCARPSUM)="",MCARFILE=U_S5_","_S6_",.2)" S:$D(@MCARFILE) MCARSUM=$P(@MCARFILE,U,1),MCARPSUM=$P(@MCARFILE,U,2)
 K MCARFILE S S1=$S(WH="P":LL,1:S4),S2=$S(WH="P":S4,1:LL)
 S MCFILE=+$P(S5,"(",2)
 I MCESON,($G(MCESKEY)'=""),('$$SCRSUMPT^MCESSCR(MCESKEY,S6,MCSUP)) K MCARSUM,MCARPSUM,MCFILE,REC,MCSUP Q
 I '$$VALID^MCARUTL5(S5,S6,MCDFN) Q  ; MC*2.3*33
 I $P($G(@(U_S5_","_S6_",""ES"")")),U,7)="S" G EXIT  ;MC*2.3*8
 S S2=S2_U_S6  ;MC*2.3*8
 S ^TMP("OR",$J,"MCAR",S1,S2)=MCARSUM_U_S6_";"_S5_","_U_$P(^MCAR(697.2,LL1,0),U,5,7)
 ;I $P(^MCAR(697.2,LL1,0),U,2)'=S5 S $P(^TMP("OR",$J,"MCAR",S1,S2),U,3,5)="EN1^MCARGP^CONSULTS" ; MC*2.3*33
 ;I $P(^MCAR(697.2,LL1,0),U,2)'=S5 S $P(^TMP("OR",$J,"MCAR",S1,S2),U,3,5)="EN1^MCARGP^NONENDO" ; MC*2.3*33
 ;I $P(^MCAR(697.2,LL1,0),U,2)'=S5 S $P(^TMP("OR",$J,"MCAR",S1,S2),U,3,5)="EN1^MCARGP^GI" ; MC*2.3*33
 I $P(^MCAR(697.2,LL1,0),U,2)'=S5 S $P(^TMP("OR",$J,"MCAR",S1,S2),U,3,5)="EN1^MCARGP^PARAC" ; MC*2.3*33
 S $P(^TMP("OR",$J,"MCAR",S1,S2),U,10)=MCARPSUM
 S $P(^TMP("OR",$J,"MCAR",S1,S2),U,11)=LL
 I S5="MCAR(699.5" D  ;MC*2.3*8
 .I LL8="" S LL8=" "
 .S $P(^TMP("OR",$J,"MCAR",S1,S2),U,12)=$E(($E($P($G(^MCAR(697.2,LL6,0)),U,8),1,13)_"/"_$P($G(^MCAR(697.2,LL8,0)),U)),1,31) K LL6,LL8
EXIT K MCARSUM,MCARPSUM,REC,MCSUP,MCESON Q
PR0 S I="",L=0
 F  S I=$O(^TMP("OR",$J,"MCAR",I)) Q:I=""  I I'="OT" D
 . S J="" F  S J=$O(^TMP("OR",$J,"MCAR",I,J)) Q:J=""  S PR=^(J) D
 .. Q:$P(PR,U,3,5)="^^"  ; MC*2.3*33
 .. S MCARDT=$S(WH="P":$P(J,U),1:I),MCARPROC=$S(WH="P":I,1:$P(J,U))
 .. S MCARPROC=$O(^MCAR(697.2,"B",MCARPROC,0)),MCARPROC=$P(^MCAR(697.2,MCARPROC,0),U,8)
 .. I $P(PR,U,12)'="" S MCARPROC=$P(PR,U,12)
 .. S DA=$P(PR,U,2),K=$P(PR,U),M=$P(PR,U,10)
 .. S K=$S(K="N"!(K="L"):"NORMAL",K="A":"ABNORMAL",K="B":"BORDERLINE",K="T":"TECHNICALLY UNSATISFACTORY",K="ND":"NON-DIAGNOSTIC",K="MI":"MILDLY ABNORMAL",K="MO":"MODERATELY ABNORMAL",K="S":"SEVERELY ABNORMAL",1:"")
 ..I CODE'="" Q:CODE'=K
 ..I +$G(MDSDT) Q:(9999999.9999-MCARDT)<+$G(MDSDT)
 ..I +$G(MDEDT) Q:(9999999.9999-MCARDT)>+$G(MDEDT)
 ..N MCDT S MCDT=MCARDT,Y=9999999.9999-MCARDT X ^DD("DD")
 ..S L=MCARPROC_"~"_DA
 ..S ^TMP("MDPLST",$J,MCDT,L)=MCARPROC_U_+DA_U_"PR690^MDPS1"_U_$P(PR,U,5)_U_J S $P(^(L),U,6)=Y,$P(^(L),U,7)=K,$P(^(L),U,10)=M,$P(^(L),U,11)=$S(WH="P":I_U_$P(J,U,2),1:J)
 K ^TMP("OR",$J,"MCAR")
 Q
