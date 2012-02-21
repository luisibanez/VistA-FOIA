PSOORUT2 ;ISC BHAM/SAB - build listman screen ;02/22/95
 ;;7.0;OUTPATIENT PHARMACY;**11,146,132,182**;DEC 1997
 ;External reference to SDPHARM1 supported by DBIA 4196
 ;External reference ^PS(55 supported by DBIA 2228
 ;External reference ^DIC(31 supported by DBIA 658
 ;External reference ^DPT(D0,.372 supported by DBIA 1476
 ;
 K ^TMP("PSOHDR",$J),^TMP("PSOPI",$J) S DFN=PSODFN D ^VADPT,ADD^VADPT
 S ^TMP("PSOHDR",$J,1,0)=VADM(1),^TMP("PSOHDR",$J,2,0)=$P(VADM(2),"^",2)
 S ^TMP("PSOHDR",$J,3,0)=$P(VADM(3),"^",2),^TMP("PSOHDR",$J,4,0)=VADM(4),^TMP("PSOHDR",$J,5,0)=$P(VADM(5),"^",2)
 D NVA
 S POERR=1 D RE^PSODEM K POERR
 S ^TMP("PSOHDR",$J,6,0)=$S($P(WT,"^",8):$P(WT,"^",9)_" ("_$P(WT,"^")_")",1:"_______ (______)")
 S ^TMP("PSOHDR",$J,7,0)=$S($P(HT,"^",8):$P(HT,"^",9)_" ("_$P(HT,"^")_")",1:"_______ (______)") K VM,WT,HT S PSOHD=7
 S GMRA="0^0^111" D ^GMRADPT S ^TMP("PSOHDR",$J,8,0)=+$G(GMRAL)
 S $P(^TMP("PSOHDR",$J,9,0)," ",62)="ISSUE  LAST REF DAY"
 S ^TMP("PSOHDR",$J,10,0)=" #  RX #         DRUG                                 QTY ST  DATE  FILL REM SUP"
 D ELIG^VADPT S IEN=1,^TMP("PSOPI",$J,IEN,0)="Eligibility: "_$P(VAEL(1),"^",2)_$S(+VAEL(3):"     SC%: "_$P(VAEL(3),"^",2),1:""),IEN=IEN+1
 S N=0 F  S N=$O(VAEL(1,N)) Q:'N  S $P(^TMP("PSOPI",$J,IEN,0)," ",14)=$P(VAEL(1,N),"^",2),IEN=IEN+1
 S ^TMP("PSOPI",$J,IEN,0)=" ",IEN=IEN+1,^TMP("PSOPI",$J,IEN,0)="Disabilities: "
 F I=0:0 S I=$O(^DPT(DFN,.372,I)) Q:'I  S I1=$S($D(^DPT(DFN,.372,I,0)):^(0),1:"") D:+I1
 .S PSDIS=$S($P($G(^DIC(31,+I1,0)),"^")]""&($P($G(^(0)),"^",4)']""):$P(^(0),"^"),$P($G(^DIC(31,+I1,0)),"^",4)]"":$P(^(0),"^",4),1:""),PSCNT=$P(I1,"^",2)
 .S:$L(^TMP("PSOPI",$J,IEN,0)_PSDIS_"-"_PSCNT_"% ("_$S($P(I1,"^",3):"SC",1:"NSC")_"), ")>80 IEN=IEN+1,$P(^TMP("PSOPI",$J,IEN,0)," ",14)=" "
 .S ^TMP("PSOPI",$J,IEN,0)=$G(^TMP("PSOPI",$J,IEN,0))_PSDIS_"-"_PSCNT_"% ("_$S($P(I1,"^",3):"SC",1:"NSC")_"), "
 S IEN=IEN+1 S ^TMP("PSOPI",$J,IEN,0)=" ",IEN=IEN+1
 I +VAPA(9),+VAPA(10) S ^TMP("PSOPI",$J,IEN,0)="      (Temp Address from "_$P(VAPA(9),"^",2)_" till "_$P(VAPA(10),"^",2)_")",IEN=IEN+1
 S ^TMP("PSOPI",$J,IEN,0)=VAPA(1) S:VAPA(2)]"" IEN=IEN+1,^TMP("PSOPI",$J,IEN,0)=VAPA(2) S:VAPA(3)]"" IEN=IEN+1,^TMP("PSOPI",$J,IEN,0)=VAPA(3)
 S IEN=IEN+1,^TMP("PSOPI",$J,IEN,0)=VAPA(4),$P(^TMP("PSOPI",$J,IEN,0)," ",40)="PHONE: "_VAPA(8)
 S IEN=IEN+1,^TMP("PSOPI",$J,IEN,0)=$P(VAPA(5),"^",2)_"  "_$S(VAPA(11)]"":$P(VAPA(11),"^",2),1:VAPA(6))
 S MAILD=+$P($G(^PS(55,DFN,0)),"^",3) D  K MAILD
 .S IEN=IEN+1,^TMP("PSOPI",$J,IEN,0)="Prescription Mail Delivery: "_$S(MAILD=1:"Certified Mail",MAILD=2:"DO NOT MAIL",MAILD=3:"Local - Regular Mail",MAILD=4:"Local - Certified Mail",1:"Regular Mail")
 S IEN=IEN+1,^TMP("PSOPI",$J,IEN,0)=$S($P($G(^PS(55,DFN,0)),"^",2):"Cannot use safety caps.",1:"") S $P(^TMP("PSOPI",$J,IEN,0)," ",40)=$S($P($G(^PS(55,DFN,0)),"^",4):"Dialysis Patient.",1:"")
 I $G(^PS(55,DFN,1))]"" S PSON=^(1),IEN=IEN+1 D
 .S ^TMP("PSOPI",$J,IEN,0)=" ",IEN=IEN+1,^TMP("PSOPI",$J,IEN,0)="     Outpatient Narrative: "
 .F I=1:1 Q:$P(PSON," ",I,99)=""  S:$L(^TMP("PSOPI",$J,IEN,0)_$P(PSON," ",I)_" ")>80 IEN=IEN+1 S ^TMP("PSOPI",$J,IEN,0)=$G(^TMP("PSOPI",$J,IEN,0))_$P(PSON," ",I)_" "
 S IEN=IEN+1,^TMP("PSOPI",$J,IEN,0)=" "
 I $D(^PS(52.91,DFN,0)) I '$P(^(0),"^",3)!($P(^(0),"^",3)>DT) D
 .S IEN=IEN+1,^TMP("PSOPI",$J,IEN,0)="Primary Care Appointment: "_$$PRIAPT^SDPHARM1(DFN)
 .S IEN=IEN+1,^TMP("PSOPI",$J,IEN,0)=" "
 I 'GMRAL D
 .S IEN=IEN+1,^TMP("PSOPI",$J,IEN,0)="Allergies: "_$S(GMRAL=0:"NKA",1:""),IEN=IEN+1,^TMP("PSOPI",$J,IEN,0)=" "
 .S IEN=IEN+1,^TMP("PSOPI",$J,IEN,0)="Adverse Reactions:"
 D:$G(GMRAL) ^PSOORUT3
 K ^UTILITY("VASD",$J),VASD S DFN=PSODFN,VASD("F")=DT,VASD("T")=9999999,VASD("W")="123456789" D SDA^VADPT K VASD I $D(^UTILITY("VASD",$J)) D
 .S IEN=IEN+1,^TMP("PSOPI",$J,IEN,0)=" ",IEN=IEN+1,^TMP("PSOPI",$J,IEN,0)="Pending Clinic Appointments:"
 .F PSOAPP=0:0 S PSOAPP=$O(^UTILITY("VASD",$J,PSOAPP)) Q:'PSOAPP  S PSOAPPE=$G(^UTILITY("VASD",$J,PSOAPP,"E")),PSOAPPI=$G(^("I")) D
 ..K X S X2=DT,X1=$P($P($G(PSOAPPI),"^"),".") I $G(X1) D ^%DTC
 ..S IEN=IEN+1,^TMP("PSOPI",$J,IEN,0)="    "_$P(PSOAPPE,"^")_"  "_$P(PSOAPPE,"^",2)_$S($P(PSOAPPI,"^",3)["C":"   *** Canceled ***",1:" ("_$G(X)_" days)")
 K ^UTILITY("VASD",$J),X,PSOAPPI,PSOAPPE,PSOAPP,N
 S PSOPI=IEN K IEN
 Q
NVA ;
 Q:'$O(^PS(55,PSODFN,"NVA",0))
 K LSTDT F I=0:0 S I=$O(^PS(55,PSODFN,"NVA",I)) Q:'I  D
 .Q:$P(^PS(55,PSODFN,"NVA",I,0),"^",7)  Q:'$P(^PS(55,PSODFN,"NVA",I,0),"^")
 .I $P(^PS(55,PSODFN,"NVA",I,0),"^",10)>+$G(LSTDT) S LSTDT=$P(^(0),"^",10)
 I $G(LSTDT)]"" D
 .S LSTDT="Non-VA Meds on File - Last entry on "_$E(LSTDT,4,5)_"/"_$E(LSTDT,6,7)_"/"_$E(LSTDT,2,3)
 .I $G(^TMP("PSOHDR",$J,5,0))="MALE" S $P(^TMP("PSOHDR",$J,5,0)," ",22)=LSTDT K LSTDT Q
 .S $P(^TMP("PSOHDR",$J,5,0)," ",20)=LSTDT K LSTDT
 K I
 Q
