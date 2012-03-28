GMVSC1 ;HOIFO/YH,FT-CUMULATIVE V/M - CONTINUED ;12/18/01  10:53
 ;;5.0;GEN. MED. REC. - VITALS;;Oct 31, 2002
 ;
 ; This routine uses the following IAs:
 ; #10061 - ^VADPT calls           (supported)
 ;
EN1 ; ENTRY TO PRINT REPORT FROM TASKMAN {called from GMVSC0}
 K ^TMP($J,"GMRV"),GMRVDT
 S (GMRVHT,GMROUT,GMRDATE(0))=0
 F GMRVTY="T","P","R","BP","HT","WT","CVP","CG","PO2","PN"  S GMRVITY=$O(^GMRD(120.51,"C",GMRVTY,0)) I GMRVITY>0 D SETAR
 I $O(^TMP($J,"GMRV",0))'>0 W !,"THERE IS NO DATA FOR THIS REPORT" G QT
 F GMRDATE=0:0 S GMRDATE=$O(GMRVDT(GMRDATE)) Q:GMRDATE'>0!GMROUT  I $D(^TMP($J,"GMRV",GMRDATE)) D PRT Q:GMROUT
QT ;
 I IOSL'<($Y+10) F X=1:1 W ! Q:IOSL<($Y+10)
 I 'GMROUT W ! D FOOTER^GMVSC0
 K ^TMP($J,"GMRV"),^TMP($J,"OTHR"),GOTHR,GMRV,GMRVDT
 Q
Q ; KILL VARIABLES
 K ^TMP($J)
 K GMRZZ,GMRVARY
 K GMRVER,GDATA,GMRST,GERROR,GERST,GBED,GWARD,DFN,GX,GMR1ST,GMRDAT,GMRDATE,GMRDSH,GMRDT,GMRLN,GMRPDT,GMRSP,GMRVDA,GMRVITY,GMRX,GMRY,GMRVTY,GMRSITE,GMRVX,POP,DIPGM,%T,GMRQUAL,GMROUT,GMRPG,GFLAG
 D KVAR^VADPT K VA
 D ^%ZISC ;???
 Q
SETAR ;
 F GMRDT=0:0 S GMRDT=$O(^GMR(120.5,"AA",DFN,GMRVITY,GMRDT)) Q:GMRDT'>0  S GMRDATE=9999999-GMRDT I '(GMRDATE>GMRVFDT!(GMRDATE<GMRVSDT)) D SETND
 Q
SETND ;
 F GMRVDA=0:0 S GMRVDA=$O(^GMR(120.5,"AA",DFN,GMRVITY,GMRDT,GMRVDA)) Q:GMRVDA'>0  D SETUT
 Q
SETUT ;
 S ^TMP($J,"GMRV",+$E(GMRDATE,1,12),GMRVTY,GMRVDA)=$S('$D(^GMR(120.5,GMRVDA,2)):0,1:+$P(^(2),"^"))
 S GMRVDT(+$E(GMRDATE,1,12))=""
 Q
PRT ;PRINT V/M BY DATE/TIME
 D:IOSL<($Y+9) HDR^GMVSC2 Q:GMROUT
 S Y=GMRDATE X ^DD("DD") I $P(GMRDATE,".")'=GMRDATE(0) W !,$E(GMRDATE,4,5)_"/"_$E(GMRDATE,6,7)_"/"_$E(GMRDATE,2,3) S GMRDATE(0)=$P(GMRDATE,".")
 D:IOSL<($Y+9) HDR^GMVSC2 Q:GMROUT  W !,$P($P(Y,"@",2),":",1,2)
 I $D(^TMP($J,"GMRV",GMRDATE)) D
 .K GMRLN,GERROR F GMRVTY="T","P","R","BP","HT","WT","CVP","CG","PO2","PN" S GPRT(GMRVTY)=0 I $D(^TMP($J,"GMRV",GMRDATE,GMRVTY)) F GMRVDA=0:0 S GMRVDA=$O(^TMP($J,"GMRV",GMRDATE,GMRVTY,GMRVDA)) Q:GMRVDA'>0!GMROUT  D SETLN^GMVSC2
 Q
