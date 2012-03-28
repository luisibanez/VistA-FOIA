APCDEWHO ; IHS/CMI/LAB - DISPLAY PATIENT & VISIT INFO ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;CALLED FROM THE TEMPLATE APCD WHO (WHO)
 ;
START(APCDEV) ;EP - CALLED FROM EHR CODING AUDIT
 NEW APCDVREC
 S:$G(APCDEV) APCDVREC=^AUPNVSIT(APCDEV,0)
 W !!,"You are currently processing the following Patient",$S($G(APCDEV):" Visit",1:""),":",!!
 S APCDH="Patient Name",APCDV=$E($P(^DPT(AUPNPAT,0),U),1,20) D WRITE
 S APCDH="Chart #",APCDV=$S($D(^AUPNPAT(AUPNPAT,41,DUZ(2),0)):$P(^(0),U,2),1:"None") D WRITE
 S APCDH="Date of Birth" S Y=AUPNDOB D DD^%DT S APCDV=Y D WRITE
 S APCDH="Sex",APCDV=AUPNSEX D WRITE
 G:'$D(APCDVREC) XIT
 S APCDH="Visit Date" S Y=$P(APCDVREC,U) D DD^%DT S APCDV=Y D WRITE
 S APCDH="Location",APCDV=$E($P(^DIC(4,$P(APCDVREC,U,6),0),U),1,25) D WRITE
 S APCDH="Type",APCDV=$P(APCDVREC,U,3) D WRITE
 S APCDH="Service Category",APCDV=$P(APCDVREC,U,7) D WRITE
 S APCDH="Clinic",APCDV=$S($P(APCDVREC,U,8)="":"None Entered",1:$P(^DIC(40.7,$P(APCDVREC,U,8),0),U)) D WRITE
 S APCDH="Hospital Location",APCDV=$$VAL^XBDIQ1(9000010,APCDEV,.22) D WRITE
 S APCDH="Chart Audit Status",APCDV=$$VAL^XBDIQ1(9000010,APCDEV,1111) D WRITE
 S APCDH="Dependent Entry Count",APCDV=$P(APCDVREC,U,9) D WRITE
 ;
XIT ;
 W !
 K APCDY,Y,APCDX,APCDT,APCDV,APCDH,APCDZ,APCDVREC
 Q
WRITE ;
 S APCDX=APCDH_": "_APCDV W:$X>39 ! S APCDT=$S($X>1:41,1:1) W:(APCDT+$L(APCDX))>79 ! W ?APCDT,APCDH,": ",@APCDRVON,APCDV,@APCDRVOF
 K APCDT,APCDX
 Q
