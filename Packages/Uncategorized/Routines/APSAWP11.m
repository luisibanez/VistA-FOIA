APSAWP11 ;IHS/ITSC/ENM/POC - ACQUISITION COST FILE READ ;12-Feb-2008 15:59;SM
 ;;7.0;IHS PHARMACY MODIFICATIONS;**1006**; Sep 23, 2004
 ;THIS RTN READS IN A LOCAL ACTUAL ACQUISTION COST FILE TO THE GLOBAL ^APSAMDF IHS/OKCAO/POC 11/11/2002
 ; Modified - IHS/MSC/PLS - 09/06/07 - Add changes from Pawhuska for McKesson support
 ;
EN1(APSPPATH,APSPFILE) ;
 S ZTQUEUED=1 ;IF COMING FROM EN1 SET VARIABLE TO CALL SILENTLY
EN ;ENTRY POINT TO IMPORT ACTUAL ACQUISTION COST FILE
 ;CALLED BY OPTION APSQ IMPORT AAC
 L +^TMP("APSAWP11",$J):3 I '$T W:'$D(ZTQUEUED) !,"CAN'T LOCK-IS SOMEONE ELSE RUNNING THIS OPTION?" Q
 I '$D(^APSAMDF) L -^TMP("APSAWP11",$J) Q
 K ^TMP("APSAWP11",$J)
 D CLEAN
 W:'$D(ZTQUEUED) !,"THIS OPTION WILL IMPORT ACTUAL ACQUISTION COST INTO THE AWP MED TRANSACTION FILE"
 I '$D(ZTQUEUED) W:$D(^APSAMDF("DATEACC")) !,"LAST IMPORT ON DATE ",$$FMTE^XLFDT(^("DATEACC"),1)
 I '$D(ZTQUEUED) S Y=$$DIR("Y","DO YOU WISH TO CONTINUE","YES")  ;DIR(0),DIR("A"),DIR("B")
 I '$D(ZTQUEUED) I Y'=1 D CLEAN Q
 S APSAOS=$P($G(^AUTTSITE(1,0)),"^",21)
 S APSAPATH=$S($P($G(^AUTTSITE(1,1)),"^",1)]"":$P(^(1),"^",1),APSAOS=1:"/pub",APSAOS=2:"C:\INETPUB\FTPROOT\PUB",$D(APSPPATH):APSPPATH,1:"")
 I '$D(ZTQUEUED) S Y=$$DIR("F^3:60","ENTER THE PATH TO THE ACTUAL ACQUISTION FILE",APSAPATH)
 I '$D(ZTQUEUED) I Y="^" D CLEAN Q
 I '$D(ZTQUEUED) S APSAPATH=Y
 I APSAOS=1,$E(APSAPATH,$L(APSAPATH))'="/" S APSAPATH=APSAPATH_"/"
 I APSAOS=2,$E(APSAPATH,$L(APSAPATH))'="\" S APSAPATH=APSAPATH_"\"
 ;
 S APSAFILE=$S($D(APSPFILE):APSPFILE,1:"")
 I '$D(ZTQUEUED) S Y=$$DIR("F^3:30","ENTER THE NAME OF THE ACTUAL ACQUISTION FILE",APSAFILE)
 I '$D(ZTQUEUED) I Y="^" D CLEAN Q
 I '$D(ZTQUEUED) S APSAFILE=Y
 S Y=$$LIST^%ZISH(APSAPATH,APSAFILE,.APSAGOT)
 S Y=$$CHECK
 I Y'=1 D CLEAN Q
 S Y=$$OPEN^%ZISH(APSAPATH,APSAFILE,"R")
 I Y'=0 W:'$D(ZTQUEUED) !,"HMM... CAN'T OPEN THIS FILE... HELP" D CLEAN Q
 D FLETCH
 D CLOSE(IO)
 S ^APSAMDF("DATEACC")=DT
 D:'$D(ZTQUEUED) REP
 D CLEAN
 L -^TMP("APSAWP11",$J) ;UNLOCK
 Q
DIR(O,A,B) ;
 S DIR(0)=O,DIR("A")=A,DIR("B")=B
 D ^DIR
 I $D(DTIOUT)!($D(DUOUT))!($D(DIRUT))!($D(DIROUT)) Q "^"
 Q Y
 ;
CLEAN ;
 D EN^XBVK("APSA")
 K PAGE,END,LINE,DRUGIEN,TMPIEN,APSAIEN
 K DIR,DIC,DIE
 Q
 ;
CHECK() ;CHECK FOR ONLY ONE FILE (THAT'S NOT NONE OR MORE THAN ONE)
 N I,CNT
 S CNT=0,I=""
 F  S I=$O(APSAGOT(I)) Q:I=""  S CNT=CNT+1
 I CNT=0 W:'$D(ZTQUEUED) !,"NO FILE IN PATH "_APSAPATH_" WITH NAME "_APSAFILE_" EXISTS"
 I CNT>1 W:'$D(ZTQUEUED) !,"MORE THAN ONE FILE EXISTS FOR THIS PATH "_APSAPATH_" AND THIS FILE NAME "_APSAFILE
 I CNT=1 W:'$D(ZTQUEUED) !,"GOT THE FILE "_APSAFILE
 Q CNT
 ;
TRANS(VAL) ;
 S VAL=$TR(VAL," ","") ;NO SPACES
 ;IHS/ITSC/ENM/POC NEXT 5 LINES ADDED 05/14/03
 S VAL=$TR(VAL,"""","")  ;NO QUOTES
 S VAL=$TR(VAL,"-","")
 N PIECE,I,NCONT  ;STRIP OUT CONTROL CHARACTERS
 S NCONT="" F I=1:1:$L(VAL) D
 .S PIECE=$E(VAL,I) I PIECE'?1C S NCONT=NCONT_PIECE
 Q NCONT
 ;
ERR(VALUE,APSANUM,APSANDC) ;
 S ^TMP("APSAWP11",$J,"SORT"," "_APSANDC)=APSANDC_"  "_APSANUM_"  "_VALUE
 Q
 ;
SORT N APSANDC S APSANDC=""
 K ^TMP("APSAWP11",$J,"ERR")  ;IN CASE COME HERE FROM OPTION
 F  S APSANDC=$O(^TMP("APSAWP11",$J,"SORT",APSANDC)) Q:APSANDC=""  D
 .S ^(0)=$G(^TMP("APSAWP11",$J,"ERR",0))+1,IEN=^(0)
 .S ^TMP("APSAWP11",$J,"ERR",IEN,0)=^TMP("APSAWP11",$J,"SORT",APSANDC)
 Q
 ;
CLOSE(IO) ;
 D CLOSE^%ZISH(IO)
 Q
FLETCH ;
 S APSACNT=0
 S APSASTAT=$S($G(^%ZOSF("OS"))["OpenM":-1,$G(^%ZOSF("OS"))["Windows":1,$G(^%ZOSF("OS"))["UNIX":-1,1:-1)
 F  U IO R APSANODE:5 Q:($$STATUS^%ZISH=APSASTAT)!'$T  D  ;DO I HAVE TO HAVE A TIMEOUT ON A READ??
 .U IO(0)  ;IHS/OKCAO/POC 5/7/2003
 .Q:APSANODE=""
 .S APSAQUIT=0
 .S APSANODE=$$TRANS(APSANODE)  ;ONE TIME INSTEAD OF MANY
 .S APSANDC=$P(APSANODE,",",2) ;NDC NUMBER
 .S APSAAAC=$P(APSANODE,",",4)
 .S APSANUM=$P(APSANODE,",",1)
 .I APSAAAC']"" D ERR("NO ACTUAL ACQUISTION COST",APSANUM,APSANDC) S APSAQUIT=1
 .I APSANDC']"" D ERR("NO NDC NUMBER",APSANUM,0) S APSAQUIT=1
 .I $L(APSANDC)'=11 D ERR("NDC NOT 11 DIGITS",APSANUM,APSANDC) S APSAQUIT=1
 .Q:APSAQUIT
 .S APSAFNUM=$O(^APSAMDF("B",APSANDC,""))
 .I APSAFNUM']"" D ERR("NO ENTRY IN AWP MED TRANSACTION FILE FOR NDC ",APSANUM,APSANDC) S APSAQUIT=1
 .Q:APSAQUIT
 .S DA=APSAFNUM
 .S DIE="^APSAMDF("
 .S DR="404///"_APSAAAC
 .D ^DIE
 .S APSACNT=APSACNT+1
 .I '$D(ZTQUEUED) U 0 W "."
 I '$D(ZTQUEUED) U 0 W !!,"COUNT OF UPDATES IS ",APSACNT
 Q
 ;
REP ;ENTRY POINT TO PRINT OUT THE ERROR ACTUAL ACQUISTION FILE ENTRIES
 ;CALLED BY OPTION APSQ PRINT ERRORS FROM IMPORT OF AAC
 S LINE="W !?5,""NDC#"",?18,""AAC#"",?27,""ERR"""
 U 0 W !!,"ENTER THE DEVICE TO PRINT THE ERROR LIST"
 S %ZIS="QM" D ^%ZIS I POP Q
 I $D(IO("Q")) D  Q
 .S ZTRTN="REPORT^APSAWP11",ZTDESC="PRINT ERROR REPORT OF ACUTAL ACQUISTION COST IMPORT"
 .S ZTSAVE("LINE")=""  ;IHS/ITSC/ENM/POC 5/20/2003
 .D ^%ZTLOAD,HOME^%ZIS K IO("Q")
 ;
REPORT ;
 D SORT ;SORT IT OUT FIRST
 I $D(ZTQUEUED) S ZTREQ="@"
 S:'$D(DTIME) DTIME=20
 S (END,PAGE)=0
 U IO
 D @("HDR"_(2-($E(IOST,1,2)="C-")))
 I '$D(^TMP("APSAWP11",$J,"ERR")) W !,"NO ERRORS IN THE ERROR LOG" Q
 S APSAIEN=0 F  S APSAIEN=$O(^TMP("APSAWP11",$J,"ERR",APSAIEN)) Q:APSAIEN=""!END  D
 .W !?5,^TMP("APSAWP11",$J,"ERR",APSAIEN,0)
 .D HDR:$Y+5>IOSL
 D ^%ZISC
 D CLEAN
 Q
 ;
REP1 ;ENTRY POINT FOR NO ACTUAL ACQUISTION COST IN THE DRUG FILE
 K ^TMP("APSAWP11",$J,"ERR1")
 D CLEAN
 S LINE="W !?5,""DRUG#"",?30,""DRUG NAME"""
 S DRUGIEN=0
 F  S DRUGIEN=$O(^PSDRUG(DRUGIEN)) Q:DRUGIEN'=+DRUGIEN  D
 .I $S('$D(^PSDRUG(+DRUGIEN,"I")):0,DT'>^("I"):0,1:1) Q  ;INACTIVE
 .Q:$P($G(^PSDRUG(+DRUGIEN,660)),"^",6)]""  ;GOT A PRICE
 .S ^(0)=$G(^TMP("APSAWP11",$J,"ERR1",0))+1,TMPIEN=^(0)
 .S ^TMP("APSAWP11",$J,"ERR1",TMPIEN,0)=$E(+DRUGIEN_"                         ",1,25)_$P(^PSDRUG(+DRUGIEN,0),"^",1)
 .Q
 U 0 W !!,"ENTER THE DEVICE TO PRINT THE LIST OF DRUGS WITH NO AAC"
 S %ZIS="QM" D ^%ZIS I POP Q
 I $D(IO("Q")) D  Q
 .S ZTRTN="REP1PRT^APSAWP11",ZTDESC="PRINT ERROR REPORT OF ACUTAL ACQUISTION COST IMPORT"
 .S ZTSAVE("LINE")=""  ;IHS/ITSC/ENM/POC 5/20/2003
 .D ^%ZTLOAD,HOME^%ZIS K IO("Q")
 ;
REP1PRT ;
 I $D(ZTQUEUED) S ZTREQ="@"
 S:'$D(DTIME) DTIME=20
 S (END,PAGE)=0
 U IO
 D @("HDR"_(2-($E(IOST,1,2)="C-")))
 I '$D(^TMP("APSAWP11",$J,"ERR1")) W !,"NO ERRORS IN THE ERROR LOG" Q
 S APSAIEN=0 F  S APSAIEN=$O(^TMP("APSAWP11",$J,"ERR1",APSAIEN)) Q:APSAIEN=""!END  D
 .W !?5,^TMP("APSAWP11",$J,"ERR1",APSAIEN,0)
 .D HDR:$Y+5>IOSL
 K ^TMP("APSAWP11",$J,"ERR1")
 D ^%ZISC
 D CLEAN
 Q
 ;
HDR I $E(IOST,1,2)="C-" W !,"PRESS RETURN TO CONTINUE OR '^' TO QUIT" R X:DTIME S END='$T!(X="^") Q:END
HDR1 W @IOF
HDR2 S APSALOC=$P(^DIC(4,DUZ(2),0),"^"),APSALEN=$L(APSALOC)
 S PAGE=PAGE+1 W ?(IOM-APSALEN/2),APSALOC,?(IOM-12),"PAGE:  ",$J(PAGE,3)
 X LINE
 Q
