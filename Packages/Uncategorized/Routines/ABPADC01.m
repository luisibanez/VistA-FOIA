ABPADC01 ;CONVERT PAYMENT DATA TO v1.4 FORMAT; [ 07/08/91  9:10 PM ]
 ;;1.4;AO PVT-INS TRACKING;*0*;IHS-OKC/KJR;JULY 25, 1991
 W !!,"<<< NOT AN ENTRY POINT - JOB ABORTED >>>",!! Q
BEGIN ;ENTRY POINT
 D SETUP H 2 D GETDATA,END
 Q
SETUP ;
 S ABPA("C%")=.02,ABPA("CONVERT")="" I $D(ABPAROFF)'=1 D CRT^ABPAVAR
 S ABPA("PCNT")=$P(^ABPVAO(0),"^",4) Q:+ABPA("PCNT")'>0
 F I=.02:.02:1 S ABPA(I,"%")=ABPA("PCNT")*I
 W !!?3,"Converting your payment data to the v1.4 format:",!!?6,"You "
 W "have ",ABPA("PCNT")," patient(s) in your database to process."
 W !!?6,"Starting time: " S %H=$H D YX^%DTC W $P(Y,"@",2),!!
 S X="Percentage of your database converted" W ?(40-($L(X)\2)),X,!
 W ?13,0 F I=10:10:100 W ?($X+3) W:I=10 " " W I
 W !?13,"|" F I=1:1:10 W "----|"
 F I=$X:-1:14 W @IOBS W:I=14 @ABPARON
 Q
GETDATA ;
 S ABPA("RCT")=0,ABPATDFN=0 F  D  Q:+ABPATDFN=0
 .S ABPATDFN=$O(^ABPVAO(ABPATDFN)) Q:+ABPATDFN=0
 .S ABPA("RCT")=ABPA("RCT")+1,ABPADDFN=0 F  D  Q:+ABPADDFN=0
 ..S ABPADDFN=$O(^ABPVAO(ABPATDFN,"P",ABPADDFN)) Q:+ABPADDFN=0
 ..D KVARS S (ABPACAMT,ABPACCNT,ABPAOBAL,ABPATPD)=0
 ..S (ABPATA2,ABPATA3,ABPATA4,ABPATA5,ABPATA7)=0
 ..F C="N","D","S" S ABPA("UP",C)=0
 ..S ABPAAPTR=0 F  D  Q:+ABPAAPTR=0
 ...S ABPAAPTR=$O(^ABPVAO(ABPATDFN,"P",ABPADDFN,"A",ABPAAPTR))
 ...Q:+ABPAAPTR=0  S X=^ABPVAO(ABPATDFN,"P",ABPADDFN,"A",ABPAAPTR,0)
 ...S ABPAPCOD=$P(X,"^",2) I ABPAPCOD]"" I "NDS"[ABPAPCOD D
 ....S ABPA("UP",ABPAPCOD)=ABPA("UP",ABPAPCOD)+(+X)
 ..S ABPADPTR=0 F  D  Q:+ABPADPTR=0
 ...S ABPADPTR=$O(^ABPVAO(ABPATDFN,"P",ABPADDFN,"D",ABPADPTR))
 ...Q:+ABPADPTR=0
 ...S ABPADOS=+^ABPVAO(ABPATDFN,"P",ABPADDFN,"D",ABPADPTR,0)
 ...S DA=$P(^ABPVAO(ABPATDFN,"P",ABPADDFN,"D",ABPADPTR,0),"^",2)
 ...Q:$D(^ABPVAO(ABPATDFN,1,DA,0))'=1  D GETDAT
 ..D BEGIN^ABPAPD7A,CURARAY^ABPAPD7C S ABPA("Y")=3 D FILE^ABPAPD7
 .I ABPA("RCT")'<ABPA(ABPA("C%"),"%") D UPDATE
 Q
GETDAT ;
 S ABPAPTR=+DA,ABPADATA=^ABPVAO(ABPATDFN,1,ABPAPTR,0)
 S ABPA("CP",ABPADOS,DA)="0^0^0^0^0^0"
 S ABPA("HP",ABPADOS,DA)=ABPA("CP",ABPADOS,DA) D HPARRAY
 S ABPACCNT=ABPACCNT+1,ABPA("C",ABPACCNT)=DA
 S ABPACAMT=ABPACAMT+$P(ABPADATA,"^",7)
 F J=2,3,4,5,7 D
 .S @("ABPATA"_J)=@("ABPATA"_J)+$P(ABPA("HP",ABPADOS,DA),"^",J)
 Q
HPARRAY ;
 F ABPAJ=2:1:5 S @("ABPAP"_ABPAJ)=0
 S ABPAZ=0 F  S ABPAPTOT=0 D  Q:+ABPAZ=0
 .S ABPAZ=$O(^ABPVAO("PD",ABPATDFN,DA,ABPAZ)) Q:+ABPAZ=0
 .S ABPAZZ=0 F  D  Q:+ABPAZZ=0
 ..S ABPAZZ=$O(^ABPVAO(ABPATDFN,"P",ABPAZ,"D",ABPAZZ)) Q:+ABPAZZ=0
 ..Q:$D(^ABPVAO(ABPATDFN,"P",ABPAZ,"D",ABPAZZ,0))'=1  S ABPARCD=^(0)
 ..Q:$P(ABPARCD,"^",2)'=DA  F ABPAL=3:1:6 D
 ...S @("ABPAP"_(ABPAL-1))=@("ABPAP"_(ABPAL-1))+$P(ABPARCD,"^",ABPAL)
 S ABPAPTOT=ABPAP2+ABPAP3+ABPAP4+ABPAP5,ABPATPD=ABPATPD+ABPAPTOT
 S ABPABAL=($P(ABPADATA,"^",7)-ABPAPTOT)-(+$P(ABPADATA,"^",3))
 S $P(ABPA("HP",ABPADOS,DA),"^")=ABPABAL,ABPAOBAL=ABPAOBAL+ABPABAL
 F ABPAJ=2:1:5 S $P(ABPA("HP",ABPADOS,DA),"^",ABPAJ)=@("ABPAP"_ABPAJ)
 S $P(ABPA("HP",ABPADOS,DA),"^",6)=ABPAPTOT
 S $P(ABPA("HP",ABPADOS,DA),"^",7)=+$P(ABPADATA,"^",3)
 Q
UPDATE ;
 I ABPA("C%")#.1'=0 W:ABPA("C%")=.02 "|" W "-"
 E  W "|"
 S ABPA("C%")=ABPA("C%")+.02
 Q
END ;
 F  Q:ABPA("C%")>1  D UPDATE
 W @ABPAROFF,!!?6,"Ending time: " S %H=$H D YX^%DTC W $P(Y,"@",2),!!
 K ABPATDFN,ABPADDFN,ABPA
KVARS ;
 K ABPACAMT,ABPACCNT,ABPA("HP"),ABPA("CP"),ABPA("PP"),ABPA("UP")
 K ABPAP1,ABPAP2,ABPAP3,ABPAP4,ABPAP5,ABPAP6,ABPAPTOT,ABPACDFN,ABPAY
 K ABPA("PB"),ABPA("NB"),ABPA("DB"),ABPA("SB"),ABPACTOB,ABPADOS
 K ABPACURB,ABPA("S$"),ABPA("N$"),ABPA("P$"),ABPA("D$"),ABPATCNT
 K ABPATBAL,ABPA("%"),ABPA("$"),ABPAD,ABPADATA,ABPAY,ABPAZ,ABPAZZ
 K ABPAT1,ABPAT2,ABPAT3,ABPAT4,ABPAT5,ABPAT6,ABPAH2,ABPAH3,ABPAH4
 K ABPAH5,ABPACURA,ABPAAPTR,X,ABPAPCOD,ABPADPTR,DA,ABPAPTR
 Q
