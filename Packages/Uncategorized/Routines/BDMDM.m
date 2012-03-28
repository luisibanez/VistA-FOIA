BDMDM ; IHS/CMI/LAB -IHS -DIABETES QA REPORT ;
 ;;2.0;DIABETES MANAGEMENT SYSTEM;**2**;JUN 14, 2007
 ;
 S X="BDM DIABETES PROGRAM QA AUDIT",DIC="^BDMRPT(",DIC(0)="FM" D ^DIC I Y=-1 W !,*7,"DIABETES PROGRAM QA AUDIT REPORT NOT AVAILABLE" H 2 K DIC,X,Y Q
 S BDM1=+Y
 S X="BDM CUMULATIVE DIABETES QA" D ^DIC I Y=-1 S BDM2=0 K DIC,X,Y
 I Y>0 S BDM2=+Y K Y
 S DIC="^ACM(41.1,",DIC(0)="AEMQ",DIC("A")="Enter the Official Diabetes Register: " D ^DIC
 I Y=-1 S BDMDMRG="" W !,"NO Register Selected!!!  The CMS register will not be used in retrieving",!,"any data." G GO
 S BDMDMRG=+Y
GO ;
 K BDMPTS
 D START1^BDMASK(BDM1,BDM2) K BDM1,BDM2
 K BDMPTS,BDMDMRG,BDMCUML,BDMDOO
 Q
REC(DFN,BDMRTYP) ;EP - called to send back a visit record as
 NEW BDMX,BDMREC
 S BDMREC=""
 S BDMRTYP("IEN")=$O(^BDMRECD("B",BDMRTYP,0))
 I 'BDMRTYP("IEN") Q BDMREC
PROC ;
 S BDMX=0
 F  S BDMX=$O(^BDMRECD(BDMRTYP("IEN"),11,"AC",BDMX)) Q:BDMX'=+BDMX!(BDMREC=-1)  S BDM=$O(^BDMRECD(BDMRTYP("IEN"),11,"AC",BDMX,0))  D
 .S X="" X:$D(^BDMRECD(BDMRTYP("IEN"),11,BDM,11)) ^BDMRECD(BDMRTYP("IEN"),11,BDM,11)
 .I X["-1" S BDMREC=-1 Q
 .;I X="",$P(^BDMRECD(BDMRTYP("IEN"),11,BDM,0),U,5) S BDMREC=-1 Q
 .I X'[-1 S $E(BDMREC,$P(^BDMRECD(BDMRTYP("IEN"),11,BDM,0),U,2))=X
 Q BDMREC
WRITEF ;EP write flat file
 K ^TMP($J,"BDM EPI")
 Q:'$D(^TMP("BDMEPI",$J))
 ;load in epi definition to ^TMP($J,"BDM EPI"
 S (X,N)=0 F  S X=$O(^BDMRECD(4,13,X)) Q:X'=+X  S N=N+1,^TMP($J,"BDM EPI",N)=^BDMRECD(4,13,X,0)
 ;MOVE RECORDS TO ^TMP($J,"BDM EPI"
 S X=0 F  S X=$O(^TMP("BDMEPI",$J,X)) Q:X'=+X  S N=N+1,^TMP($J,"BDM EPI",N)=^TMP("BDMEPI",$J,X)
 S XBGL="TMP("_$J_",""BDM EPI"","
 S XBMED="F",XBFN=BDMFILE,XBTLE="SAVE OF DM AUDIT EPI INFO RECORDS GENERATED BY -"_$P(^VA(200,DUZ,0),U)
 S XBF=0,XBQ="N",XBFLT=1,XBE=$J
 D ^XBGSAVE
 ;check for error
 K ^TMP($J,"BDM EPI")
 K XBGL,XBMED,XBTLE,XBFN,XBF,XBQ,XBFLT
 Q
