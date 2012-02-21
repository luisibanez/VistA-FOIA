PSOHLDS4 ;BIR/PWC-Build HL7 Segments for Automated Interface ;04/10/2004
 ;;7.0;OUTPATIENT PHARMACY;**156**;DEC 1997
 ;HLFNC       supp. by DBIA 10106
 ;DIC(5       supp. by DBIA 10056
 ;This routine is called from PSOHLDS1
 Q
IAM(PSI) ;allergy list segment
 Q:'$D(DFN)!$D(PAS3)
 N IAM,IDX,SEV,SEV1,DAT,X,TYP,TYP1,VER,VER1
 S IAM="",CNT=0,GMRA="0^0^111" D EN1^GMRADPT
 I $G(GMRAL)="" G ZALQT
 F AIEN=0:0 S AIEN=$O(GMRAL(AIEN)) Q:'AIEN  D
 .K ADTL D EN1^GMRAOR2(AIEN,"ADTL") S CNT=CNT+1
 .S TYP1=$P(GMRAL(AIEN),"^",7)
 .S TYP=$S(TYP1="D":"DRUG",TYP1="F":"FOOD",TYP1="O":"OTHER",TYP1="DF":"DRUG/FOOD",TYP1="DO":"DRUG/OTHER",TYP1="DFO":"DRUG/FOOD/OTHER",1:"""""")
 .S VER=$S($P(GMRAL(AIEN),"^",4)=1:"VERIFIED",1:"NON-VERIFIED")
 .S VER1=$S($P(GMRAL(AIEN),"^",4)=1:"C",1:"U")  ;confirmed or unconfirmed
 .S $P(IAM,"|",2)=TYP1_CS_TYP_CS_"LGMR120.8"
 .S $P(IAM,"|",3)=AIEN_CS_$P(GMRAL(AIEN),"^",2)_CS_"LGMR120.8"
 .S IDX=$O(ADTL("O","")),X="" S:IDX'="" X=$G(ADTL("O",IDX))
 .S DAT=$P(X,"^"),DAT=$S(DAT'="":$$HLDATE^HLFNC(DAT,"DT"),1:"")
 .S SEV=$P(X,"^",2) S:SEV="" SEV="""""",DAT=""
 .S SEV1=$S(SEV="MILD":"MI",SEV="MODERATE":"MO",SEV="SEVERE":"SV",1:"U")
 .S $P(IAM,"|",4)=SEV1
 .S $P(IAM,"|",5)=$P($P(GMRAL(AIEN),"^",8),";")
 .S $P(IAM,"|",13)=DAT
 .S $P(IAM,"|",17)=VER1
 .S ^TMP("PSO",$J,PSI)="IAM|"_IAM,PSI=PSI+1
 .F  S IDX=$O(ADTL("O",IDX)) Q:IDX=""  D   ;repeat for all reactions
 ..S X=$G(ADTL("O",IDX)),DAT=$P(X,"^"),SEV=$P(X,"^",2) I SEV="" Q
 ..S DAT=$S(DAT'="":$$HLDATE^HLFNC(DAT,"DT"),1:"")
 ..S $P(IAM,FS,4)=SEV,$P(IAM,FS,13)=DAT
 ..S ^TMP("PSO",$J,PSI)="IAM|"_IAM,PSI=PSI+1
 S PAS3=1
 ;
ZALQT K GMRAL,ADTL,AIEN,CNT,CNT,GMRA,TYP,TYP1,SEV,SEV1,VER,VER1
 Q
 ;
ORC(PSI) ;common order segment
 Q:'$D(DFN)
 N ORC S ORC=""
 S $P(ORC,"|",1)="NW"
 S $P(ORC,"|",2)=IRXN_CS_"OP7.0"
 S $P(ORC,"|",9)=ISDT
 S $P(ORC,"|",10)=EBY_CS_EBY1
 S $P(ORC,"|",12)=PVDR_CS_PVDR1
 S $P(ORC,"|",13)=$G(PSOLAP)
 S $P(ORC,"|",15)=EFDT
 S $P(ORC,"|",16)=$S($G(RXPR(IRXN)):"PARTIAL",$G(RXFL(IRXN)):"REFILL",$G(RXRP(IRXN)):"REPRINT",1:"NEW")
 S $P(ORC,"|",17)=CLN_CS_CLN1_CS_"99PSC"
 S $P(ORC,"|",19)=$S(CSINER'="":CSINER_CS_CSINER1,1:"")
 S $P(ORC,"|",21)=$P(SITE,"^",1)_CS_CS_$P(SITE,"^",6)
 S PSZIP=$P(SITE,"^",5),PSOHZIP=$S(PSZIP["-":PSZIP,1:$E(PSZIP,1,5)_$S($E(PSZIP,6,9)]"":"-"_$E(PSZIP,6,9),1:""))
 S $P(ORC,"|",22)=$P(SITE,"^",2)_CS_CS_$P(SITE,"^",7)_CS_$S($D(^DIC(5,+$P(SITE,"^",8),0)):$P(^(0),"^",2),1:"UKN")_CS_PSOHZIP
 S $P(ORC,"|",23)="("_$P(SITE,"^",3)_")"_$P(SITE,"^",4)
 S ^TMP("PSO",$J,PSI)="ORC|"_ORC,PSI=PSI+1
 Q
