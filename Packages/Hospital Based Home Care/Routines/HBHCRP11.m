HBHCRP11 ; LR VAMC(IRMS)/MJT-HBHC rpt on file 631, All active (admitted but not D/C) cases by date range, sorted by HBHC Team, then by name, includes: patient name, SSN, admission date, & totals for team & all ;9205
 ;;1.0;HOSPITAL BASED HOME CARE;**6**;NOV 01, 1993
 D START^HBHCUTL
 G:(HBHCBEG1=-1)!(HBHCEND1=-1) EXIT
 S %ZIS="Q",HBHCCC=0 K IOP,ZTIO,ZTSAVE D ^%ZIS G:POP EXIT
 I $D(IO("Q")) S ZTRTN="DQ^HBHCRP11",ZTDESC="HBPC Team Census Report",ZTSAVE("HBHC*")="" D ^%ZTLOAD G EXIT
DQ ; De-queue
 U IO
 K ^TMP("HBHC",$J)
 S $P(HBHCY,"-",81)="",(HBHCFTOT,HBHCTOT)=0,HBHCHEAD="Team Census",HBHCHDR="W !,""Patient Name"",?43,""SSN"",?68,""Date""",HBHCCOLM=(80-(30+$L(HBHCHEAD))\2) S:HBHCCOLM'>0 HBHCCOLM=1
 D TODAY^HBHCUTL
LOOP ; Loop thru ^HBHC(631) "AD" (admission date) cross-ref to build report
 S X1=HBHCBEG1,X2=-1 D C^%DTC S HBHCADDT=X
 F  S HBHCADDT=$O(^HBHC(631,"AD",HBHCADDT)) Q:(HBHCADDT="")!(HBHCADDT>HBHCEND1)  S HBHCDFN="" F  S HBHCDFN=$O(^HBHC(631,"AD",HBHCADDT,HBHCDFN)) Q:HBHCDFN=""  S HBHCNOD0=^HBHC(631,HBHCDFN,0) D:$P(HBHCNOD0,U,15)=1 PROCESS
 I '$D(^TMP("HBHC",$J)) K HBHCNAM D HDRRANGE^HBHCUTL W !!,"No data found for Date Range selected."
 I $D(^TMP("HBHC",$J)) D PRTLOOP W !!,HBHCZ,!,"All Team Census Total: ",HBHCFTOT,!,HBHCZ
 D ENDRPT^HBHCUTL1
EXIT ; Exit module
 D ^%ZISC
 K HBHCADDT,HBHCBEG1,HBHCBEG2,HBHCCLM1,HBHCCC,HBHCCOLM,HBHCDFN,HBHCDPT0,HBHCDT,HBHCEND1,HBHCEND2,HBHCFFFL,HBHCFTOT,HBHCHDR,HBHCHEAD,HBHCN,HBHCNAM,HBHCNOD0,HBHCPAGE,HBHCPT,HBHCTDY,HBHCTOT,HBHCY,HBHCZ,X,X1,X2,Y,^TMP("HBHC",$J)
 Q
PROCESS ; Process record & build ^TMP("HBHC",$J) global
 Q:($P(HBHCNOD0,U,40)]"")&($P(HBHCNOD0,U,40)<HBHCEND1)
 S HBHCNAM=$P($G(^HBHC(631,HBHCDFN,1)),U,13) S:HBHCNAM]"" HBHCNAM=$G(^HBHC(633,$P(^HBHC(631.4,HBHCNAM,0),U,6),0)) S:HBHCNAM="" HBHCNAM="Unknown"
 S HBHCDPT0=^DPT($P(HBHCNOD0,U),0)
 S ^TMP("HBHC",$J,HBHCNAM,$P(HBHCDPT0,U),HBHCADDT)=$E($P(HBHCDPT0,U,9),1,3)_"-"_$E($P(HBHCDPT0,U,9),4,5)_"-"_$E($P(HBHCDPT0,U,9),6,9)
 Q
PRTLOOP ; Print loop
 S HBHCNAM=""
 F  S HBHCNAM=$O(^TMP("HBHC",$J,HBHCNAM)) D:HBHCTOT>0 TOT Q:HBHCNAM=""  D HDR S HBHCPT="" F  S HBHCPT=$O(^TMP("HBHC",$J,HBHCNAM,HBHCPT)) Q:HBHCPT=""   S HBHCDT="" F  S HBHCDT=$O(^TMP("HBHC",$J,HBHCNAM,HBHCPT,HBHCDT)) Q:HBHCDT=""  D PRT
 Q
HDR ; Print header
 S HBHCN=HBHCNAM,HBHCCLM1=(80-(22+$L(HBHCNAM))\2) S:HBHCCLM1'>0 HBHCCLM1=1 W:$D(HBHCFFFL) @IOF
 D:IO'=IO(0)!($D(IO("S"))) HDRRANGE^HBHCUTL
 I '$D(IO("S")),(IO=IO(0)) S HBHCCC=HBHCCC+1 D HDRRANGE^HBHCUTL
 S:'$D(HBHCFFFL) HBHCFFFL=1
 Q
PRT ; Print report
 I ($D(ZTRTN)!(HBHCCC=0))&((IOSL-$Y)<5) W @IOF D HDRRANGE^HBHCUTL
 S HBHCTOT=HBHCTOT+1,Y=HBHCDT D DD^%DT
 W !,HBHCPT,?43,^TMP("HBHC",$J,HBHCNAM,HBHCPT,HBHCDT),?68,Y,!,HBHCY
 Q
TOT ; Print HBHC team total
 W !!,"Team: "_HBHCN_"   Census Total: ",HBHCTOT
 S HBHCFTOT=HBHCFTOT+HBHCTOT,HBHCTOT=0
 Q
