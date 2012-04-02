AFSTCK1 ; IHS/OIRM/ADC/CSC-PART 2 OF GENERIC TELECOMMUNICATION VARIABLE CHECK PROGRAM;     [ 10/27/2004  4:22 PM ]
 ;;2.0;IHS 3780 TELECOMMUNICATIONS;**13**;AUG 9, 1995
 ;;MODIFIED FOR CACHE' COMPLIANCE ACR*2.1*13 IM13574
 Q  ;NOT AN ENTRY POINT
PADWRITE ; ENTRY POINT.
 U %DEV W X,!
 Q
CCTRID ;EP
 S AFSUXFNM=$S(AFSCCTR="DPS":"ddps",AFSCCTR="NIH":"nih",AFSCCTR="BCS":"bcbs",AFSCCTR="PCC":"pcc",1:" ")
 S AFSCCTRN=$S(AFSCCTR="DPS":"IHS Data Center (ALBQ)",AFSCCTR="NIH":"National Inst. of Hlth (Bethesda)",AFSCCTR="BCS":"Blue Cross / Shield (NM)",AFSCCTR="PCC":"Parklawn Computer Center (PCC)",1:"Z")
 Q
CCTRIDR ;EP
 I AFSCCTR'="PCC" S AFSRRTYP=$S(AFSCCTR="BCS":"B",AFSCCTR="NIH":"N",AFSCCTR="DPS":"I",1:"X"),Y=AFSRRTYP
 ;S AFSRRTYP=AFSRTYPE
 Q
OHFSDOC ;;VARIABLES REQUIRED FOR OPENHFS CALL
 ;;
 ;;   %DEV      -- INITIALLY SET TO 51
 ;;   %FN       -- UNIX FILE NAME (FULL PATH IF NEC)
 ;;   AFSERMSG  -- CONTAINS ERROR MESSAGE
 ;;   %ZA       -- CONTAINS COMPLETION CODE (-1 = ERROR)
 ;;   %IN       -- OPEN PARAMETER (1=READ ONLY) DEFAULT VALUE
 ;;   %FO       --  FILE OFFSET (DEFAULT = 0)
OPENHFS ;PEP; OPEN FILE IN DIRECTORY
 I '$D(%IN) S %IN=1
 I '$D(%FO) S %FO=0
 ;S ZISH1=$P(%FN,"/",1,4)_"/" ;CSC 7-95   ;ACR*2.1*13.06 IM14144
 ;S ZISH2=$P(%FN,"/",5)                   ;ACR*2.1*13.06 IM14144
 ;S ZISH3=$S(%IN=1:"R",%IN=0:"M",1:"R")   ;ACR*2.1*13.01 IM13574
 N ACRDIR,ACRDEL                          ;ACR*2.1*13.06 IM14144
 S ACRDIR=$$ARMSDIR^ACRFSYS(1)            ;ACR*2.1*13.06 IM14144
 I ACRDIR']"" S AFSERMSG="M15" Q          ;ACR*2.1*13.06 IM14144
 S ACRDEL=$E(ACRDIR)                      ;ACR*2.1*13.06 IM14144
 S ZISH1=$P(%FN,ACRDEL,1,4)_ACRDEL ;CSC 7-95 ;ACR*2.1*13.01 IM13574
 S ZISH2=$P(%FN,ACRDEL,5)                 ;ACR*2.1*13.06 IM14144
 S ZISH3=$S(%IN=0:"W",1:"R")              ;ACR*2.1*13.01 IM13574
 S Y=$$OPEN^%ZISH(ZISH1,ZISH2,ZISH3)
 ;I %ZA=-1 S AFSERMSG="M10"
 I Y'=0 S AFSERMSG="M10"
 E  S %DEV=IO
 Q
ERROR ;PEP; WRITES VARIABLE ERROR MESSAGES
 G ERROREX:'$D(AFSERMSG)
 S X=$P($T(@AFSERMSG),";;",2)
 U IO(0) W !!,*7,?(80-$L(X)/2),X,!
 K DIR S DIR(0)="E",DIR("A")="Enter <RETURN> to Continue" D ^DIR
ERROREX S AFSJFLG=1 K AFSERMSG Q
CRTSETUP ;PEP; SETS UP VARIABLES FOR CRT
 I '$G(IOST(0)) D HOME^%ZIS ;pdw
 S XY=$P(^%ZIS(2,IOST(0),1),"^",5)
 I '$D(^%ZIS(1,IOS,"SUBTYPE")) G BTRMDEF
 I '$D(^%ZIS(1,IOS,"TYPE")) G BTRMDEF
 I ^%ZIS(1,IOS,"TYPE")'="TRM"&(^%ZIS(1,IOS,"TYPE")'="VTRM") G BTRMDEF
 I '$D(^%ZIS(2,IOST(0),5)) G BTRMDEF
 S AFSLE=$P(^%ZIS(2,IOST(0),5),"^",6)
 S AFSLE="W "_AFSLE
 S AFSRVON=$P(^%ZIS(2,IOST(0),5),"^",4)
 S AFSRVOF=$P(^%ZIS(2,IOST(0),5),"^",5)
 S X=0 X ^%ZOSF("RM")
 Q
UXFILKIL ;EP
 S AFSCMD="rm /usr/bin/3780/RCVFILE*"
 S AFSTCMDR=AFSCMD D HOSTCMD^AFSTCKZC K AFSTCMDR ;CSC 7-95
 S AFSCMD="rm /usr/ihs/reports/ddpsnull*"
 S AFSTCMDR=AFSCMD D HOSTCMD^AFSTCKZC K AFSTCMDR ;CSC 7-95
 Q
BTRMDEF ;EP
 W !!!,"PROPER TERMINAL ATTRIBUTES MISSING  -  NOTIFY SITE MANAGER",!! H 3 Q
M1 ;;COMPUTER CENTER FOR TELECOMMUNICATIONS NOT CORRECTLY DEFINED
M2 ;;IHS COMM PARAMETERS NOT SET FOR THIS LOCATION
M3 ;;3780 TELECOMMUNICATIONS PORT NOT DEFINED
M4 ;;REMOTE NUMBER NOT DEFINED FOR THIS COMPUTER CENTER"
M5 ;;USER ID OR USER PASSWORD NOT DEFINED
M6 ;;DEFAULT 3780 COMMUNICATION PORT IN USE
M7 ;;ALL 3780 COMMUNICATION PORTS ARE BUSY
M8 ;;ALL UNIX HFS DEVICES ARE BUSY
M9 ;;PROGRAM AND/OR FUNCTION CANCELLED BY OPERATOR
M10 ;;OPEN FAILURE ON UNIX HFS FILE
M11 ;;DEFAULT PRINTER PORT NOT CORRECTLY DEFINED
M12 ;;PRINTER SET-UP ERROR -- NOTIFY SUPERVISOR
M13 ;;EXPORT AND/OR APPLICATION PARAMETERS NOT SET CORRECTLY
M14 ;;PACKAGE PREFIX NOT FOUND
M15 ;;DIRECTORY PATH NOT DEFINED IN FMS SYSTEM DEFAULTS FILE ;;ACR*2.1*13.06 IM14144