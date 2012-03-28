BHSMEDH ;IHS/CIA/MGH - Encounters from PCC ;16-Apr-2008 13:47;MGH
 ;;1.0;HEALTH SUMMARY COMPONENTS;**1,2**;March 17, 2006
 ;===================================================================
 ;tAKEN FROM APCHS78
 ; IHS/TUCSON/LAB - PART 7 OF BHS -- SUMMARY PRODUCTION COMPONENTS ;    [ 02/20/04  1:48 PM ]
 ;;2.0;IHS RPMS/PCC Health Summary;**5,7,8,9,10,11**;JUN 24, 1997
 ;;Patch 1 changes prescribed at to dispensed at as in IHS patch 15
 ;Patch 2 changes for patch 16
 ;
MEDSNDUP ; ************* ALL, NON DUPLICATED *************
 N BHSPAT
 S BHSPAT=DFN
 S BHSMTY="NODUP"
 ;
CONT ; <SETUP>
 N BHSQ,BHSCC,BHSCHR,BHSCRX
 I '$D(^AUPNVMED("AC",BHSPAT)) S BHST="MEDICATION",BHSFN=50 D DISPREF^BHSRAD Q
 D CKP^GMTSUP Q:$D(GMTSQIT)
 ; <BUILD>
 K ^TMP($J,"BHSMED")
 S BHSIVD=0 F  S BHSIVD=$O(^AUPNVMED("AA",BHSPAT,BHSIVD)) Q:BHSIVD=""!(BHSIVD>GMTSDLM)  S BHSMX=0 F  S BHSMX=$O(^AUPNVMED("AA",BHSPAT,BHSIVD,BHSMX)) Q:BHSMX=""  D
 .S M=+^AUPNVMED(BHSMX,0)
 .S $P(^TMP($J,"BHSMED",M),U)=$P($G(^TMP($J,"BHSMED",M)),U)+1
 .S X=$P(^TMP($J,"BHSMED",M),U)
 .I X<10 S $P(^TMP($J,"BHSMED",M),U,(X+1))=$$FMTE^XLFDT((9999999-BHSIVD),5)
 K ^TMP($J,"BHSMTB"),^TMP($J,"BHSMTP"),^TMP($J,"BHSNO")
 S BHSIVD=0 F BHSQ=0:0 S BHSIVD=$O(^AUPNVMED("AA",BHSPAT,BHSIVD)) Q:BHSIVD=""!(BHSIVD>GMTSDLM)  S BHSMX=0 F BHSQ=0:0 S BHSMX=$O(^AUPNVMED("AA",BHSPAT,BHSIVD,BHSMX)) Q:BHSMX=""  D MEDBLD
 ; <DISPLAY>
 ;REBUILD LIST BY NAME (TRADE OR GENERIC) AND DATE
 S (BHSIVD,BHSCC,BHSCRX)=0 F BHSQ=0:0 S BHSIVD=$O(^TMP($J,"BHSMTP",BHSIVD)) Q:'BHSIVD  I $P(^TMP($J,"BHSMTP",BHSIVD),U,2)="C",$P(^TMP($J,"BHSMTP",BHSIVD),U,3)=0 D
 .S BHSCC=BHSCC+1 W:BHSCC=1 !,$$CTR("Chronic Medications",80),! D MEDDSP
 S (BHSIVD)=0 F BHSQ=0:0 S BHSIVD=$O(^TMP($J,"BHSMTP",BHSIVD)) Q:'BHSIVD  I $P(^TMP($J,"BHSMTP",BHSIVD),U,2)="C",$P(^TMP($J,"BHSMTP",BHSIVD),U,3)=1 D
 .S BHSCC=BHSCC+1 W:BHSCC=1 !,$$CTR("Chronic Medications",80),! D MEDDSP
 S (BHSIVD,BHSCC)=0 F BHSQ=0:0 S BHSIVD=$O(^TMP($J,"BHSMTP",BHSIVD)) Q:'BHSIVD  I $P(^TMP($J,"BHSMTP",BHSIVD),U,2)'="C",$P(^TMP($J,"BHSMTP",BHSIVD),U,3)=0 D
 .S BHSCC=BHSCC+1 W:BHSCC=1 !,$$CTR("Acute Medications",80),! D MEDDSP
 S (BHSIVD)=0 F BHSQ=0:0 S BHSIVD=$O(^TMP($J,"BHSMTP",BHSIVD)) Q:'BHSIVD  I $P(^TMP($J,"BHSMTP",BHSIVD),U,2)'="C",$P(^TMP($J,"BHSMTP",BHSIVD),U,3)=1 D
 .S BHSCC=BHSCC+1 W:BHSCC=1 !,$$CTR("Acute Medications",80),! D MEDDSP
 ;Patch2 hold meds
 D HOLDDSP^BHSMED
 Q:$D(GMTSQIT)
 ;Patch 2 refusals
 S BHST="MEDICATION",BHSFN=50 D DISPREF^BHSRAD
 K BHST,BHSFN
 ;CLEANUP
MEDX K APCHEXPD,BHSIVD,BHSMX,BHSMFX,BHSQTY,BHSIG,BHSSGY,BHSEXP,BHSMTS,BHSMED,BHSDTM,BHSDAT,BHSDYS,BHSN,BHSDC,BHSVDF,BHSP,BHSNON,BHSDLU,BHSIEN
 K BHSNFL,BHSNSH,BHSNAB,BHSVSC,BHSITE,BHSRX,BHSDRG,BHSCRN,BHSREF,BHSRFL,BHSALL,BHSTXT,BHSMTY,BHSALT
 K ^TMP($J,"BHSMTB"),^TMP($J,"BHSMTP"),^TMP($J,"BHSNO"),^TMP($J,"BHSMED")
 K X1,X2,X,Y,M,I
 Q
MEDBLD ;BUILD ARRAY OF MEDICATIONS
 ;BHSDC=DATE DISCONTINUED,DYS=DAYS PRESCRIBED,SIG=DIRECTIONS
 ;VDF=VISIT FILE DATE
 Q:'$D(^AUPNVMED(BHSMX,0))
 S BHSN=^AUPNVMED(BHSMX,0)
 Q:'$D(^PSDRUG($P(BHSN,U,1)))
 S BHSDTM=-BHSIVD\1+9999999
 S BHSDC=$P(BHSN,U,8),BHSDYS=$P(BHSN,U,7),BHSMFX=$S($P(BHSN,U,4)="":+BHSN,$P(BHSN,U,4)=$P(^PSDRUG(+BHSN,0),U):+BHSN,1:$P(BHSN,U,4)),BHSCHR=$$CHRONIC^BHSMEDSF(BHSMX),BHSCHR=$S(BHSCHR=1:"C",1:"Z")
 S BHSCRX=$$CRX($P(BHSN,U))
 D @BHSMTY
 Q
NODUP ;
 I $D(^TMP($J,"BHSMTB",BHSMFX)) Q
 S ^TMP($J,"BHSMTB",BHSMFX)=BHSDC,^TMP($J,"BHSMTP",BHSIVD_"-"_BHSMFX)=BHSMX_"^"_BHSCHR_"^"_BHSCRX
 Q
MEDDSP ;DISPLAY MEDICATION
 ;BHSRX=RX# in FILE 52,CHRN=CHRONIC FLAG,REF=#REFILLS
 S BHSMX=$P(^TMP($J,"BHSMTP",BHSIVD),U)
 S BHSCRX=$P(^TMP($J,"BHSMTP",BHSIVD),U,3)
 S BHSN=^AUPNVMED(BHSMX,0)
 S BHSIEN=+BHSN
 S BHSRX=$S($D(^PSRX("APCC",BHSMX)):$O(^(BHSMX,0)),1:0)
 S BHSCRN=$S(+BHSRX:$D(^PS(55,BHSPAT,"P","CP",BHSRX)),1:0)
 S (X,BHSDTM)=-BHSIVD\1+9999999 D REGDT4^GMTSU S BHSDAT=X
 S BHSDC=$P(BHSN,U,8),BHSDYS=$P(BHSN,U,7),BHSQTY=$P(BHSN,U,6),BHSIG=$P(BHSN,U,5),BHSVDF=$P(BHSN,U,3),BHSMFX=+BHSN
 S X1=DT,X2=BHSDTM D ^%DTC ;Q:X>60&(X>(2*BHSDYS))
 S BHSEXP=""
 S BHSMED=$S($P(BHSN,U,4)="":$P(^PSDRUG(BHSMFX,0),U,1),1:$P(BHSN,U,4))
 S BHSALT=$P($G(^AUPNVMED(BHSMX,12)),U,12)  ;IHS/CMI/GRL
 S APCHEXPD=$$VALI^XBDIQ1(52,BHSRX,26) S APCHEXPD=$$FMTE^XLFDT(APCHEXPD,5)
 I BHSDC S X=BHSDC D REGDT4^GMTSU S BHSEXP="-- D/C "_X
 D SIG S BHSIG=BHSSGY
 D REF I BHSREF S BHSIG=BHSIG_" "_BHSREF_$S(BHSREF=1:" refill",1:" refills")_" left."
 D SITE
 D CKP^GMTSUP Q:$D(GMTSQIT)
 W BHSDAT,?10,$S(BHSCRX:"CRX",1:""),?14,BHSMED W:BHSQTY " #",BHSQTY
 W:BHSDYS " (",BHSDYS," days) " W BHSEXP
 I APCHEXPD]"" W "(expires "_APCHEXPD_")"
 W !
 I BHSITE]"" W ?14,"Dispensed at: ",BHSITE,!
 I $G(BHSALT)]"" I $E($G(BHSALT),1,6)'=$E($G(BHSMED),1,6) W ?14,"("_BHSALT_")",!  ;IHS/CMI/GRL
 D CKP^GMTSUP Q:$D(GMTSQIT)
 S BHSICL=14,BHSNRQ="",BHSTXT="  "_BHSIG D PRTTXT^BHSUTL K BHSICL,BHSNRQ,BHSP
 S Y=$P(^TMP($J,"BHSMED",BHSIEN),U)
 Q:Y<2
 D CKP^GMTSUP Q:$D(GMTSQIT)
 W ?16,"# times prev filled: ",Y-1 W "  " F I=3:1:5 W " ",$P(^TMP($J,"BHSMED",BHSIEN),U,I)
 W !
 Q
 ;
SIG ;CONSTRUCT THE FULL TEXT FROM THE ENCODED SIG
 S BHSSGY="" F BHSP=1:1:$L(BHSIG," ") S X=$P(BHSIG," ",BHSP) I X]"" D
 . S Y=$O(^PS(51,"B",X,0)) I Y>0 S X=$P(^PS(51,Y,0),"^",2) I $D(^(9)) S Y=$P(BHSIG," ",BHSP-1),Y=$E(Y,$L(Y)) S:Y>1 X=$P(^(9),"^",1)
 . S BHSSGY=BHSSGY_X_" "
 Q
 ;
REF ;DETERMINE THE NUMBER OF REFILLS REMAINING
 I 'BHSRX S BHSREF=0 Q
 S BHSRFL=$P(^PSRX(BHSRX,0),U,9) S BHSREF=0 F  S BHSREF=$O(^PSRX(BHSRX,1,BHSREF)) Q:'BHSREF  S BHSRFL=BHSRFL-1
 S BHSREF=BHSRFL
 Q
 ;
 ;
SITE ;DETERMINE IF OUTSIDE LOCATION INFO PRESENT
 S BHSITE=""
 I $D(^AUPNVSIT(BHSVDF,21))#2 S BHSITE=$P(^(21),U) Q
 Q:$P(^AUPNVSIT(BHSVDF,0),U,6)=""
 I $P(^AUPNVSIT(BHSVDF,0),U,6)'=DUZ(2) S BHSITE=$E($P(^DIC(4,$P(^AUPNVSIT(BHSVDF,0),U,6),0),U),1,30)
 Q
 ;
CRX(D) ;
 I $P(^PSDRUG(D,0),U,3)="" Q 0
 NEW Y S Y=$P(^PSDRUG(D,0),U,3)
 I Y[1 Q 1
 I Y[2 Q 1
 I Y[3 Q 1
 I Y[4 Q 1
 I Y[5 Q 1
 I Y["C" Q 1
 I Y["A" Q 1
 Q 0
CTR(X,Y) ;EP - Center X in a field Y wide.
 Q $J("",$S($D(Y):Y,1:IOM)-$L(X)\2)_X
