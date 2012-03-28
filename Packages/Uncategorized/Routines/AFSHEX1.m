AFSHEX1 ;IHS/OIRM/DSD/JDM-DHR SPLITOUT PROGRAM #2;    [ 10/27/2004   4:20 PM ]
 ;;3.0T1;AO FINANCIAL DATA MGMT SYSTEM;**2,16,13**;FEB 02, 1999
 ;;MODIFICATIONS ARE MADE FOR CACHE' COMPLIANCE; ACR*2.1*9
A0 D ^XBCLS K AFSJFLG
 F I=1:1:70 W "*"
 W !,?10,"D H R   S P L I T - O U T   I N   P R O C E S S",!
 F I=1:1:70 W "*"
 W !
 S AFSHPHDR(1)="LISTING OF INDIVIDUAL RECORDS",AFSHPHDR(2)="DHR BATCH RECONCILIATION TABLE",AFSHPGNO=0,AFSHBTCT=0,AFSHPLCT=0,AFSHRPT=1,AFSHTRCT=0 K AFSHBTNM
A0B ;D PTRDEF^AFSTUT4 Q:$D(AFSJFLG)
 ;D PTRSEL^AFSTUT4 Q:$D(AFSJFLG)
 S %ZIS("A")="What PRINTER do you want to use? "
 D ^%ZIS
 G Q:POP
 U IO(0) W !
 ;I IO>0 S AFSHPTRD=IO                       ;ACR*2.1*13.01 IM13574
 Q:IO']""  S AFSHPTRD=IO                     ;ACR*2.1*13.01 IM13574
 D PTRHDR^AFSHEX2
A0C S X=$P(^AUTTLOC(DUZ(2),0),U,4),AFSHCNPF=$P(^AUTTAREA(X,0),U,4),AFSHAREA=$P(^(0),U,1),AFSHAPN=$P(^AUTTSITE(1,0),U,2)
 I $E(AFSHCNPF,1,1)'="J"!($L(AFSHAREA)<3)!(+AFSHAPN'>0) S AFSERMSG="ACCOUNTING INFORMATION MISSING" G JCANCEL^AFSHEX1A
 S AFSHDEST=AFSCCTR
 D NOW^%DTC S AFSHNOW=% S $P(^AFSHRCDS(AFSHBCLR,0),U,2)=AFSHNOW
 ;K ^AFSHTEMP ; SCRATCH GLOBAL FOR TX DATA TO EXT FILE killed ;ACR*2.1*13.02 IM13574
 N AFSKIL S AFSKIL="^AFSHTEMP"                 ; ACR*2.1*13.02 IM13574
 K @AFSKIL  ; SCRATCH GLOBAL FOR TX DATA TO EXT FILE killed  ;ACR*2.1*13.02 IM13574
 K ^TMP("ACR",$J,"EXP")
B0 S AFSR=AFSHBCLR,(AFSRR,AFSRRR,AFSRRRR)=0
B1 S AFSRR=$O(^AFSHRCDS(AFSR,"D","B",AFSRR)) G ZEND:+AFSRR=0
B2 S AFSRRR=$O(^AFSHRCDS(AFSR,"D",AFSRR,"I","B",AFSRRR)) G B1:AFSRRR=""
 S AFSRRRP=0,AFSRRRP=$O(^AFSHRCDS(AFSR,"D",AFSRR,"I","B",AFSRRR,AFSRRRP))
 S AFSRRA=$P(^AFSHRCDS(AFSR,"D",AFSRR,"I",AFSRRRP,0),U,1),AFSHBCNT=$P(^(0),U,5),AFSHBTOT=$P(^(0),U,6),AFSHBAP=$P(^(0),U,2)
 S AFSHBDAT=AFSRR D PCCHDR^AFSHEX1A
 S AFSRRRR=0
B3 S AFSRRRR=$O(^AFSHRCDS(AFSR,"D",AFSRR,"I",AFSRRRP,"S",AFSRRRR)) G BTRL:+AFSRRRR=0
 S AFSHYY=^AFSHRCDS(AFSR,"D",AFSRR,"I",AFSRRRP,"S",AFSRRRR,0)
 I AFSRRRR#100=0 U IO(0) W $J(AFSRRRR,8)
 D ^AFSHEX2
 S AFSHTRCT=AFSHTRCT+2,AFSHPLCT=AFSHPLCT+2
 S ACRFMS=$G(^AFSHRCDS(AFSR,"D",AFSRR,"I",AFSRRRP,"S",AFSRRRR,99))
 I $G(ACRFMS) S ^TMP("ACR",$J,"EXP",ACRFMS)=AFSR_U_AFSRR_U_AFSRRR_U_AFSRRRR
 G B3
BTRL D PCCTRL^AFSHEX1A
 G B2
ZEND ;EXIT POINT FROM $O -- DO NOT DELETE
 I AFSHPLCT>55 D PTRHDR^AFSHEX2
 S AFSJCLNO=8 S:AFSCCTR="BCS" AFSJCLNO=10
 U AFSHPTRD W !!,?10,"NUMBER OF OUTPUT DHR RECORDS = ",?45,$J(AFSHTRCT,8),!!,?10,"NUMBER OF JCL RECORDS = ",?45,$J(AFSJCLNO,8),!!
 S X="",$P(X,"-",44)="" W ?10,X,!,?15,"TOTAL RECORDS TO TRANSMIT = ",?45,$J(AFSHTRCT+AFSJCLNO,8),!!
REPORT2 ;
 S AFSHRPT=2,AFSHTOT1=0,AFSHTOT2=0
 D PTRHDR^AFSHEX2
REP0 S AFSR=0,AFSSPACE="",$P(AFSSPACE," ",41)=""
REP1 S AFSR=$O(AFSHBTNM(AFSR)) G REPEND:AFSR=""
 S X=AFSHBTNM(AFSR),Y=$P(X,U,1)
 S AFSHPTRL=$E(AFSSPACE,1,35)_$E(Y,4,5)_"/"_$E(Y,6,7)_"/"_$E(Y,2,3)_" "_$P(X,U,2)_$E(AFSSPACE,1,20)_$J($P(X,U,3),4)
 S AFSHPLCT=AFSHPLCT+2
 S AFSHTOT1=AFSHTOT1+1,AFSHTOT2=AFSHTOT2+$P(X,U,3)
 D PTRWRITE^AFSHEX2 S AFSHPTRL="" D PTRWRITE^AFSHEX2
 G REP1
REPEND S AFSHPTRL="" D PTRWRITE^AFSHEX2
 S AFSHPTRL=$E(AFSSPACE,1,30)_"TOTAL   "_$J(AFSHTOT1,4)_$E(AFSSPACE,1,20)_$J(AFSHTOT2,7) D PTRWRITE^AFSHEX2
 ;I $D(AFSHPTRD)&('$D(^AFSHPARM(DUZ(2),0))!($P(^AFSHPARM(DUZ(2),0),U,5)["N")) S IO=AFSHPTRD D ^%ZISC ;LINE CHGED FOR 1166 POSTING ;ACR*2.1*13.02 IM13574
 I $D(AFSHPTRD),('$D(^AFSHPARM(DUZ(2),0))!($P(^AFSHPARM(DUZ(2),0),U,5)["N")) D ^%ZISC  ;ACR*2.1*13.02 IM13574
 ;I $D(%DEV) S IO=%DEV D ^%ZISC                   ;ACR*2.1*13.02 IM13574
 I $D(%DEV) D CLOSE^%ZISH()                       ;ACR*2.1*13.02 IM13574
 ;L                                               ;ACR*2.1*13.02 IM13574
FILECPY ;;COPY ^AFSHTEMP GLOBAL  TO PCC & BCS UNIX FILES
 S (AFSFLNM1,AFSFLNM2)="",AFSRCNT=0
 I AFSHDTNM="DHRP"!(AFSHDTNM="dhp") G FCOPYA
 S AFSHDTNM="dhc",AFSCCTR="PCC",AFSPKGNM="ACHS"
FCOPYA ;
 I $D(AFSHDTNM) S AFSZSAV=AFSHDTNM ;AFSH*3.0T1*2
 D FILESEL^AFSEXUT0 I $D(AFSJFLG) G ENDERR^AFSHEX0A
 I $D(AFSZSAV) S AFSHDTNM=AFSZSAV ;AFSH*3.0T1*2
 K AFSZSAV ;AFSH*3.0T1*2
 S AFSFLNM1=AFSEXFN
 S %FN=AFSEXFN,%IN=0 D OPENHFS^AFSTCK1 I %ZA<0 D ERROR^AFSTCK1 S AFSERMSG="JOB PROCESSING ERROR" G JCANCEL^AFSHEX1A
 D PCCJHDR^AFSHEX1A
 U IO(0) W !!,?10,"COPYING DHR DATA TO ",AFSEXFN,!!
 D COPY2
 D PCCJTRL^AFSHEX1A
 ;S IO=%DEV D ^%ZISC                             ;ACR*2.1*13.02 IM13574
 D CLOSE^%ZISH()                                 ;ACR*2.1*13.02 IM13574
 S AFSJCLCT(1)=AFSRCNT+AFSZCNT
 D LINK(AFSEXFN)
 I AFSHDTNM="DHRP"!(AFSHDTNM="dhp") G LOG1
 S AFSHDTNM="bhc",AFSCCTR="BCS",AFSPKGNM="ACHS"
 D FILESEL^AFSEXUT0 I $D(AFSJFLG) G ENDERR^AFSHEX0A
 K %DEV S AFSRCNT=0
 S AFSFLNM2=AFSEXFN
 S %FN=AFSEXFN,%IN=0 D OPENHFS^AFSTCK1 I %ZA<0 D ERROR^AFSTCK1 S AFSERMSG="JOB PROCESSING ERROR" G JCANCEL^AFSHEX1A
 D FIJHDR^AFSHEX1A
 U IO(0) W !!,?10,"COPYING DHR DATA TO ",AFSEXFN,!!
 D COPY2
 D FIJTRL^AFSHEX1A
 ;S IO=%DEV D ^%ZISC                             ;ACR*2.1*13.02 IM13574
 D CLOSE^%ZISH()                                 ;ACR*2.1*13.02 IM13574
 S AFSJCLCT(2)=AFSRCNT+AFSZCNT
 D LINK(AFSEXFN)
LOG1 S AFSEXFNS=$P(AFSFLNM1,"/",5) D TXLOGADD^AFSTXUT0
 I +AFSY<0 U IO(0) W "IHS TX LOG POSTING ERROR" G JCANCEL^AFSHEX1A
 S AFSRCNT=AFSJCLCT(1)
 I +AFSY D NORMEND^AFSTUT5
 I AFSFLNM2="" G BKUP
 S AFSEXFNS=$P(AFSFLNM2,"/",5) D TXLOGADD^AFSTXUT0
 I +AFSY<0 U IO(0) W "IHS TX LOG POSTING ERROR" G JCANCEL^AFSHEX1A
 S AFSRCNT=AFSJCLCT(2)
 I +AFSY D NORMEND^AFSTUT5
 ;  DO BACKUP HERE
BKUP K AFSJFLG S AFSRTCD=999
 I '$D(AFSHPARM(DUZ(2))) G BKUPA
 I $P(^AFSHPARM(DUZ(2)),U,4)="N" G BKUPOK
BKUPA S %SDIR="",%FN=AFSFLNM1_" "_AFSFLNM2,AFSDTYPE="C",AFSEXFN="DHR TX FILES" D TARBKUP^AFSARCH0
 I AFSRTCD=0 G BKUPOK
 K DIR S DIR("A")="Do you want to try BACKUP file to "_AFSDNAME_" AGAIN?",DIR("B")="Y",DIR(0)="Y" D ^DIR
 I Y=0 S AFSJFLG=1 Q
 W !!,*7,"Make sure an appropriate TAPE (Write Enabled) is in the ",AFSDNAME," DRIVE",!
 K DIR S DIR(0)="E" D ^DIR
 I Y=0 S AFSJFLG=1 G ENDERR^AFSHEX0A
 G BKUP
BKUPOK Q
COPY2 ;;SUBROUTINE TO COPY TX DATA FROM GLOBAL TO EXT FILE
 S AFSGCNT=0,AFSZCNT=0
COPY2A S AFSGCNT=$O(^AFSHTEMP(AFSGCNT)) G COPY2END:AFSGCNT=""
 S AFSDATA=^AFSHTEMP(AFSGCNT) U %DEV W AFSDATA,!
 I AFSGCNT#100=0 U IO(0) W $J(AFSGCNT,8)
 S AFSZCNT=AFSZCNT+1
 G COPY2A
COPY2END Q
Q ;
 D ^%ZISC
 Q
LINK(X7) ;----- FMS DOCUMENT HISTORY RECORD FILE LINK
 ;      NEW SUBROUTINE ACR*2.0T1*16
 ;
 ;      X7 = UNIX TRANSMISSION FILE
 ;
 N ACRFMS,X,X3,X4,X5,X6
 Q:'$D(^TMP("ACR",$J,"EXP"))
 S X7=$P(AFSEXFN,"/",$L(AFSEXFN,"/"))
 S ACRFMS=0
 F  S ACRFMS=$O(^TMP("ACR",$J,"EXP",ACRFMS)) Q:'ACRFMS  D
 . S X=^TMP("ACR",$J,"EXP",ACRFMS)
 . S X3=$P(X,U)
 . S X4=$P(X,U,2)
 . S X5=$P(X,U,3)
 . S X6=$P(X,U,4)
 . D LINK^ACRFDHRE(ACRFMS,DT,X3,X4,X5,X6,X7)
 K ^TMP("ACR",$J,"EXP")
 Q
