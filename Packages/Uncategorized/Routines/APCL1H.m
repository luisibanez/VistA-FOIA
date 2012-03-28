APCL1H ; IHS/CMI/LAB - print hospital discharges by ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
START ; 
 D INFORM
 K DUOUT,DTOUT
FY S %DT="AE",%DT("A")="Enter the Fiscal Year for this report: ",%DT("B")=$E(DT,2,3) D ^%DT I $D(DTOUT) G XIT
 I X="^" G XIT
 I Y=-1 D ERR G FY
 I $E(Y,4,7)'="0000" D ERR G FY
 S X1=$E(Y,1,3)_"0930",X2=-365 D C^%DTC S APCLFY=$E(X,1,3)_"1001"
A ;
 S DIC("A")="Run for which IHS AREA: ",DIC="^AUTTAREA(",DIC(0)="AEMQ" D ^DIC K DIC,DA G:Y<0 FY
 S APCLAREA=+Y
 W !!,$C(7),$C(7),"THIS REPORT MUST BE PRINTED ON 132 COLUMN PAPER OR ON A PRINTER THAT IS",!,"SET UP FOR CONDENSED PRINT!!!",!,"IF YOU DO NOT HAVE SUCH A PRINTER AVAILABLE - SEE YOUR SITE MANAGER.",!
DEMO ;
 D DEMOCHK^APCLUTL(.APCLDEMO)
 I APCLDEMO=-1 G FY
ZIS ;
 S XBRC="^APCL1H1",XBRP="^APCL1HP",XBNS="APCL",XBRX="EOJ^APCL1H"
 D ^XBDBQUE
XIT ;
EOJ K APCL132,APCLAREC,APCLDT,APCLAREA,APCLFY,APCLFYD,APCLFYE,APCLGRAN,APCLJ,APCLLOC,APCLLOCN,APCLMOL,APCLMOS,APCLODAT,APCLPG,APCLSD,APCLT,APCLTAB,APCLVDFN,APCLVINP,APCLMON,APCLQUIT,APCLBT,APCLX,APCLJOB
 K X,X1,X2,IO("Q"),%,Y,%DT,%Y,%W,%T,%H,POP,C,DUOUT,DTOUT,DIRUT,ZTSK,H,S,TS,M,J,K
 Q
 ;
ERR W $C(7),$C(7),!,"Must be a valid Year.  Enter a year only!!" Q
INFORM ;
 W:$D(IOF) @IOF
 W !,"**********  PCC HOSPITAL DISCHARGE REPORT  **********",!
 W !,"This report will print Fiscal Year to Date Hospital Discharge Counts for",!,"all Facilities in the Area that select.  The counts by month are for",!,"month of discharge.",!
 Q
 ;
 ;
