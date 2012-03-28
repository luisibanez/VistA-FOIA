SDAMOS ;ALB/CAW - Statistical Report for Appointments; [ 09/13/2001  2:13 PM ]
 ;;5.3;Scheduling;**11,46,1007**;Aug 13, 1993
 ;SCK - 5/18/93 MODS FOR APP CLININCS AND STOP CODES
 ;IHS/ANMC/LJF  9/29/2000 added call to list manager
 ;                        fixed code to display dashes correctly
 ;             10/25/2000 changed 132 column message
 ;cmi/anch/maw  8/14/2007 PATCH 1007 removed clinic stop as selectable report if division only
 ;
STATS ;EP
 N OPT,SDFIN
 K ^TMP("SDAMS",$J)
 S SDFIN=0,SDSORT=SDSEL
 I '$$FORMAT G STATSQ
 I '$$DIV^SDAMO G STATSQ
 I SDSEL=6 S VAUTC=1 G STATS1
 I SDSEL=5 S OPT=$S(FMT=1:"GETCLN",1:"GETSC") D @OPT G:SDFIN STATSQ
STATS1 ;
 I '$$COMPL G ^SDAMO
 W !!,$$LINE^SDAMO("Device Selection")
 ;W !!,"This output requires 132 columns.",!!  ;IHS/ANMC/LJF 10/25/2000
 W !!,"If printing to paper, this report requires 132 columns.",!!  ;IHS/ANMC/LJF 10/25/2000
 S %ZIS="PQM" D ^%ZIS G STATSQ:POP
 I $D(IO("Q")) D QUE G STATSQ
 W ! D WAIT^DICD
 I $E(IOST,1,2)="C-" D EN^BSDAMO,STATSQ Q  ;IHS/ANMC/LJF 9/29/2000
 D START^SDAMOS
STATSQ ;
 D:'$D(ZTQUEUED) ^%ZISC
 K SDAMDD,SDAPPT,SDASH,SDAT,SDATA,SDAT,SDCL,SDCLC,SDCLI,SDCLIN,SDCOL,SDDATE,SDDIV,SDDV,SDFLG,SDI,SDLEN,SDNXT,SDPAGE,SDPAT,SDSTAT,SDSTOP,SDTDASH
 K ^TMP("SDAMS",$J),SDSEL,FMT,SDFIN,SDRUN,SCTOT,BLD,VAUTC,VAUTD,SDBEG,SDEND,VAUTNI,VAUTSTR,VAUTVB,SDSORT,DIC,DTOUT,DUOUT,DIROUT
 Q
 ;
START ;
 U IO
 K ^TMP("SDAMS",$J)
 ;S SDLEN=25,SDPAGE=1,$P(SDASH,"-",IOM+1)="",$P(SDTDASH,"=",IOM+1)="",SDAMDD=$P(^DD(2.98,3,0),U,3)  ;IHS/ANMC/LJF 9/29/2000
 S SDLEN=25,SDPAGE=1,$P(SDASH,"-",132)="",$P(SDTDASH,"=",132)="",SDAMDD=$P(^DD(2.98,3,0),U,3)  ;IHS/ANMC/LJF 9/29/2000
 D EN
 I '$D(^TMP("SDAMS",$J)) D NOREP^SDAMOS1 G STATSQ
 I FMT=1 D BLD^SDAMOSP
 I FMT'=1 D BLD^SDAMOS1
 D STATSQ Q
 ;
EN ; build ^TMP global
 I FMT=1 D BLD1^SDAMOS
 I FMT'=1 D STOPC^SDAMOS0
ENQ Q
 ;
BLD1 ;
 I VAUTD=1 S SDDIV=0 D CLINIC
 S SDDV=0 F  S SDDV=$O(VAUTD(SDDV)) Q:'SDDV  S SDDIV=SDDV D CLINIC
 Q
 ;
CLINIC ;all clinic or specific clinic
 ;
 ;all divisions and all clinics selected
 I VAUTD=1&(VAUTC=1) D
 .S SDCLIN=0 F  S SDCLIN=$O(^SC(SDCLIN)) Q:'SDCLIN  I $$CLINIC^SDAMU(SDCLIN) S SDCLC=$G(^SC(SDCLIN,0)) D PATIENT
 ;specific division and all clinics selected
 I SDDIV&(VAUTC=1) D
 .S SDCLIN=0 F  S SDCLIN=$O(^SC(SDCLIN)) Q:'SDCLIN  I $$CLINIC^SDAMU(SDCLIN) D
 ..S SDCLC=$G(^SC(SDCLIN,0)) I SDDIV=$$DIV^SDAMU(.SDCLIN,.VAUTD,.SDNAME,.SDLEN) D PATIENT
 ;all or specific division(s) and specific clinic(s) selected
 I VAUTC=0 D
 .S SDCLIN=0 F  S SDCLIN=$O(VAUTC(SDCLIN)) Q:'SDCLIN  S SDCLC=$G(^SC(+SDCLIN,0)) D:VAUTD!(SDDIV=$$DIV^SDAMU(.SDCLIN,.VAUTD,.SDNAME,.SDLEN)) PATIENT
 Q
 ;
PATIENT ;loop through appointments - find status of appt.
 ;
 S SDDATE=SDBEG-.1
 F SDDATE=SDDATE:0 S SDDATE=$O(^SC(SDCLIN,"S",SDDATE)) Q:'SDDATE!(SDDATE>(SDEND_".9"))  D
 .S SDAPPT=0 F  S SDAPPT=$O(^SC(SDCLIN,"S",SDDATE,1,SDAPPT)) Q:'SDAPPT  D SET
 Q
 ;
SET ;Set in ^TMP("SDAMS",$J,Division,Clinic Name,Clinic IFN,Appt Status)
 ;
 S SDDV=$$DIV^SDAMU(.SDCLIN,.VAUTD,.SDNAME,.SDLEN),SDPAT=+$G(^SC(SDCLIN,"S",SDDATE,1,SDAPPT,0))
 S SDATA=$G(^DPT(SDPAT,"S",SDDATE,0)) I 'SDATA G SETQ
 G:'$$VALID^SDAM2(SDPAT,SDCLIN,SDDATE,SDAPPT) SETQ
 S SDSTAT=$$STATUS^SDAM1(SDPAT,SDDATE,SDCLIN,SDATA,SDAPPT)
 S ^(+SDSTAT)=$G(^TMP("SDAMS",$J,SDDV,$P(^SC(SDCLIN,0),U),SDCLIN,+SDSTAT))+1
 S SDCL("SDAMS",$J,SDDV,+SDSTAT)=$G(SDCL("SDAMS",$J,SDDV,+SDSTAT))+1
 S SDAT("SDAMS",$J,+SDSTAT)=$G(SDAT("SDAMS",$J,+SDSTAT))+1
 I +SDSTAT["4^5^6^7",$P(SDSTAT,U,4)'="" S SDCI(SDCLIN,+SDSTAT)=$G(SDCI(SDCLIN,+SDSTAT))+1
SETQ Q
 ;
GETCLN S SDFIN='$$CLINIC^SDAMO Q
 ;
GETSC S SDFIN='$$STOP Q
 ;
FORMAT() ;
 N Y S Y=0
 W !!,$$LINE^SDAMO("Report Format")
 S FMT=$$OPTION(0)
 Q (Y)
 ;
OPTION(CHECK) ;
 S X="S^"
 S X=X_"1:Appointment Clinic;"
 ;S X=X_"2:Stop Code"  ;cmi/anch/maw orig line
 I SDSEL'=6 S X=X_"2:Stop Code"  ;cmi/anch/maw 8/14/2007 patch 1007 no stop code report for division only stats
 S DIR(0)=X,DIR("A")="Select Report Format",DIR("?")="Select format for printed report",DIR("B")="Appointment Clinic"
 D ^DIR K DIR
 Q (+Y)
QUE ;
 S ZTRTN="START^SDAMOS",ZTDESC="Appointment Management Report"
 F X="FMT","VAUTC(","VAUTD(","SDSORT","SDSEL","SDBEG","SDEND","VAUTD","VAUTC" S ZTSAVE(X)=""
 D ^%ZTLOAD W:$D(ZTSK) !,"Task #",ZTSK," Started."
 D HOME^%ZIS K IO("Q")
 Q
STOP() ;
 W !!,$$LINE^SDAMO("Stop Code Selection")
 S DIC="^DIC(40.7,",VAUTSTR="Stop Code",VAUTVB="VAUTC",VAUTNI=2
 D FIRST^VAUTOMA
 I Y<0 K VAUTC
 Q $D(VAUTC)>0
 ;
COMPL() ;
 I '$$DISP^SDAMOS0 S Y=0 G COMPLQ
 S DIR(0)="Y",DIR("A")="Continue",DIR("?")="Enter 'Y'es or 'N'o.",DIR("B")="YES"
 D ^DIR K DIR I $D(DTOUT) S Y=0
COMPLQ Q (Y)
