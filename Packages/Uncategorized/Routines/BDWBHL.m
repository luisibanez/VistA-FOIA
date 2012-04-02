BDWBHL ; IHS/CMI/LAB - BDW Populate Various DW1 HL7 Segments ; [ 04/05/2007  2:56 PM ]
 ;;1.0;IHS DATA WAREHOUSE;**1,2**;JAN 23, 2006
 ;       
 ;this routine will set up all of the necessary variables to populate varios DW1 HL7 segments
 ;
 ;cmi/anch/maw 4/5/2007 added hard code of EXO in HDR
 ;
MAIN ;EP - this is the main routine driver
 S INQUE=1  ;cmi/anch/maw 7/26/04 this appears to suppress output queue setup in GIS for this interfaces A08 message
 D ZVP,DG1,PR1,ZDN,ZIM,ZMD,HF,MSR,XAM,CPT,LAB,PED,SKT
 Q
 ;
ZVP ;EP - populate the dw1 ZVP segment
 K PRV
 S BDWCNT=0
 D PROV^BDWUTIL1(.PRV,BHLVIEN)
 I $G(PRV(1))="" D
 . S BDWCNT=1,INDA("ZVP",BDWCNT)="",INA("BDW1ZVP1",BDWCNT)=BDWCNT
 S BDWDA=0 F  S BDWDA=$O(PRV(BDWDA)) Q:'BDWDA  D
 . S BDWDATA=$G(PRV(BDWDA))
 . S BDWCNT=BDWCNT+1
 . S INDA("ZVP",BDWCNT)=""
 . S INA("BDW1ZVP1",BDWCNT)=BDWCNT
 . S INA("BDW1ZVP2",BDWCNT)=$P(BDWDATA,U,3)
 . S INA("BDW1ZVP3",BDWCNT)=$P(BDWDATA,U,4)
 . S INA("BDW1ZVP4",BDWCNT)=$P(BDWDATA,U,6)
 . S INA("BDW1ZVP5",BDWCNT)=$P(BDWDATA,U,7)
 . S INA("BDW1ZVP6",BDWCNT)=$P(BDWDATA,U,8)
 . S INA("BDW1ZVP7",BDWCNT)=$P(BDWDATA,U,5)
 K BDWDA,BDWCNT,BDWDATA,PRV
 Q
 ;
DG1 ;EP - populate the dw1 DG1 and ZDX segments
 K POV
 S BDWCNT=0
 D POVS^BDWUTIL(.POV,BHLVIEN)
 S BDWDA=0 F  S BDWDA=$O(POV(BDWDA)) Q:'BDWDA  D
 . S BDWDATA=$G(POV(BDWDA))
 . S BDWCNT=BDWCNT+1
 . S INDA("DG1",BDWCNT)=""
 . S INA("BDW1DG11",BDWCNT)=BDWCNT
 . S INA("BDW1DG13",BDWCNT)=$P(BDWDATA,U)
 . S INA("BDW1ZDX4",BDWCNT,1)=$P(BDWDATA,U,2)
 . S INA("BDW1ZDX6",BDWCNT,1)=$P(BDWDATA,U,3)
 . S INA("BDW1ZDX7",BDWCNT,1)=$P(BDWDATA,U,4)
 S INDA("ZDX",1)=""
 K BDWCNT,BDWDA,BDWDATA,POV
 Q
 ;
PR1 ;EP - populate the dw1 PR1 and ZPR segments
 K PRC
 S BDWCNT=0
 D PROC^BDWUTIL1(.PRC,BHLVIEN)
 S BDWDA=0 F  S BDWDA=$O(PRC(BDWDA)) Q:'BDWDA  D
 . S BDWDATA=$G(PRC(BDWDA))
 . S BDWCNT=BDWCNT+1
 . S INDA("PR1",BDWCNT)=""
 . S INA("BDW1PR11",BDWCNT)=BDWCNT
 . S INA("BDW1PR13",BDWCNT)=$P(BDWDATA,U)
 . S INA("BDW1PR15",BDWCNT)=$$DATE^INHUT($P(BDWDATA,U,2))
 . S INA("BDW1PR111",BDWCNT)=$P(BDWDATA,U,4)
 . S INA("BDW1ZPR5",BDWCNT,1)=$P(BDWDATA,U,3)
 . S INA("BDW1ZPR8",BDWCNT,1)=$P(BDWDATA,U,6)
 . S INA("BDW1ZPR9",BDWCNT,1)=$P(BDWDATA,U,5)
 . S INA("BDW1ZPR10",BDWCNT,1)=$P(BDWDATA,U,7)
 . S INA("BDW1ZPR11",BDWCNT,1)=$P(BDWDATA,U,8)
 . S INA("BDW1ZPR12",BDWCNT,1)=$P(BDWDATA,U,9)
 S INDA("ZPR",1)=""
 K BDWCNT,BDWDA,BDWDATA,PRC
 Q
 ;
ZDN ;EP - populate the dw1 ZDN and ZDP segments
 K DEN
 S BDWCNT=0
 D DENT^BDWUTIL(.DEN,BHLVIEN)
 S BDWDA=0 F  S BDWDA=$O(DEN(BDWDA)) Q:'BDWDA  D
 . S BDWDATA=$G(DEN(BDWDA))
 . S BDWCNT=BDWCNT+1
 . S INDA("ZDN",BDWCNT)=""
 . S INDA("ZDP",BDWCNT)=""
 . S INA("BDW1ZDN1",BDWCNT)=BDWCNT
 . S INA("BDW1ZDN2",BDWCNT)=$P(BDWDATA,U)
 . S INA("BDW1ZDN3",BDWCNT)=$P(BDWDATA,U,2)
 . S INA("BDW1ZDN4",BDWCNT)=$P(BDWDATA,U,3)
 . S INA("BDW1ZDN5",BDWCNT)=$P(BDWDATA,U,4)
 . S INA("BDW1ZDN6",BDWCNT)=$P(BDWDATA,U,8)
 . S INA("BDW1ZDN7",BDWCNT)=$P(BDWDATA,U,5)
 . S INA("BDW1ZDP1",BDWCNT)=BDWCNT
 . S INA("BDW1ZDP2",BDWCNT)=$P(BDWDATA,U,6)
 . S INA("BDW1ZDP3",BDWCNT)=$P(BDWDATA,U,7)
 K BDWCNT,BDWDA,BDWDATA,DEN
 Q
 ;
ZIM ;EP - populate the dw1 ZIM segment
 D ZIM^BDWBHL1
 Q
 ;
ZMD ;EP - populate the dw1 ZMD segment
 K MED
 S BDWCNT=0
 D MED^BDWUTIL1(.MED,BHLVIEN)
 S BDWDA=0 F  S BDWDA=$O(MED(BDWDA)) Q:'BDWDA  D
 . S BDWDATA=$G(MED(BDWDA))
 . S BDWCNT=BDWCNT+1
 . S INDA("ZMD",BDWCNT)=""
 . S INA("BDW1ZMD1",BDWCNT)=BDWCNT
 . S INA("BDW1ZMD2",BDWCNT)=$P(BDWDATA,U)
 . S INA("BDW1ZMD3",BDWCNT)=$P(BDWDATA,U,3)
 . S INA("BDW1ZMD4",BDWCNT)=$P(BDWDATA,U,4)
 . S INA("BDW1ZMD5",BDWCNT)=$P(BDWDATA,U,2)
 K BDWCNT,BDWDA,BDWDATA,MED
 Q
 ;
HF ;EP - populate the dw1 OBX health factors segment
 D HF^BDWBHL1
 Q
 ;
MSR ;EP - populate the dw1 OBX measurement segment
 D MSR^BDWBHL1
 Q
 ;
XAM ;EP - populate the dw1 OBX exam segment
 D XAM^BDWBHL1
 Q
 ;
CPT ;-- populate the dw1 CPT exam segment
 D CPT^BDWBHL1
 Q
 ;
LAB ;-- populate the dw1 OBX lab segment
 D LAB^BDWBHL1
 Q
 ;
PED ;EP - populate the dw1 OBX patient education segment
 D PED^BDWBHL1
 Q
 ;
SKT ;EP - populate the dw1 OBX skin test segment
 D SKT^BDWBHL1
 Q
 ;
ZRC ;EP - generate ZRC segment
 S INQUE=1  ;cmi/anch/maw 7/26/04 this appears to suppress output queue setup in GIS for this interfaces A31 message
 K INDA("ZRC")
 S BDWCNT=0
 S BDWDA=0 F  S BDWDA=$O(^AUPNPAT(DFN,41,BDWDA)) Q:'BDWDA  D
 . S BDWCNT=BDWCNT+1
 . S BDWDATA=$G(^AUPNPAT(DFN,41,BDWDA,0))
 . I $P(BDWDATA,U)="" S BDWDATA=BDWDA_BDWDATA  ;cmi/maw for missing 1st piece 6/28/04
 . Q:$P($G(^AGFAC($P(BDWDATA,U),0)),U,21)'="Y"  ;filter on reg fac
 . S INDA("ZRC",BDWCNT)=""
 . S INA("BDW1ZRC6",BDWCNT)=$S($P(BDWDATA,U):$P($G(^AUTTLOC($P(BDWDATA,U),0)),U,10),1:"")
 . S INA("BDW1ZRC7",BDWCNT)=$P(BDWDATA,U,2)
 . S INA("BDW1ZRC8",BDWCNT)=$P(BDWDATA,U,5)
 K BDWCNT,BDWDA
 Q
 ;
ZRL ;EP - generate ZRL segment
 K INDA("ZRL")
 S BDWCNT=0
 S BDWDA=0 F  S BDWDA=$O(^DPT(DFN,.01,BDWDA)) Q:'BDWDA  D
 . S BDWDATA=$P($G(^DPT(DFN,.01,BDWDA,0)),U)
 . S BDWCNT=BDWCNT+1
 . S BDWALNM=$P(BDWDATA,",")
 . S BDWAFNM=$P($P(BDWDATA,",",2)," ")
 . S BDWAMI=$P($P(BDWDATA,",",2)," ",2)
 . S BDWASTR=BDWALNM_U_BDWAFNM_U_BDWAMI
 . S INDA("ZRL",BDWCNT)=""
 . S INA("BDW1ZRL6",BDWCNT)=BDWASTR
 K BDWDA,BDWCNT,BDWALNM,BDWAFNM,BDWAMI,BDWASTR
 Q
 ;
HDR ;-- generate the header record
 S INQUE=1  ;cmi/anch/maw 7/26/04 this appears to suppress output queue setup in GIS for this interfaces HDR message
 NEW BDWDEST S BDWDEST=$O(^INRHD("B","HL IHS DW1 IE",0)) K ^INLHDEST(BDWDEST) ;IHS/CMI/LAB - kill at beginning of each batch
 ;cmi/anch/maw 3/7/2007 added the following 3 lines for common header vars
 S INA("BDW1ZHS4")="HL7"
 I $G(INA("FILE")) S INA("BDW1ZHS5")="EXO^"_$$GET1^DIQ(INA("FILE"),INDA,.23)  ;cmi/anch/maw 3/7/2007 for desc of option ran
 S INA("BDW1ZHS6")="2.4"  ;change this when version changes
 I INA("FILE")=90215 D  Q
 . S INA("BDW1BHS7")=$$DATE^INHUT($$GET1^DIQ(90215,INDA,.01),1)
 . S INA("BDW1BHS9")=INDA
 . S INA("BDW1BHS11")=$P($G(^AUTTLOC($P(^AUTTSITE(1,0),U),0)),U,10)_INDA
 . S (INA("BDW1ZHS1"),INA("BDW1ZHS2"))=$$DATE^INHUT($$GET1^DIQ(90215,INDA,.01,"I"))
 . S INA("BDW1ZHS3")=INDA
 I INA("FILE")=90213 D  Q
 . S INA("BDW1BHS7")=$$DATE^INHUT($$GET1^DIQ(90213,INDA,.01,"I"),1)
 . S INA("BDW1BHS9")=INDA
 . S INA("BDW1BHS11")=$P($G(^AUTTLOC($P(^AUTTSITE(1,0),U),0)),U,10)_INDA
 . S INA("BDW1ZHS1")=$$DATE^INHUT($$GET1^DIQ(90213,INDA,.01,"I"))
 . S INA("BDW1ZHS2")=$$DATE^INHUT($$GET1^DIQ(90213,INDA,.02,"I"))
 . S INA("BDW1ZHS3")=INDA
 . S INA("BDW1ZHS3")=INDA
 I INA("FILE")=90214 D  Q
 . S INA("BDW1BHS7")=$$DATE^INHUT($$GET1^DIQ(90214,INDA,.03,"I"),1)
 . S INA("BDW1BHS9")=INDA
 . S INA("BDW1BHS11")=$P($G(^AUTTLOC($P(^AUTTSITE(1,0),U),0)),U,10)_INDA
 . S INA("BDW1ZHS1")=$$DATE^INHUT($$GET1^DIQ(90214,INDA,.01,"I"))
 . S INA("BDW1ZHS2")=$$DATE^INHUT($$GET1^DIQ(90214,INDA,.02,"I"))
 . S INA("BDW1ZHS3")=INDA
 Q
 ;
TRL ;-- generate the trailer record
 S INQUE=1  ;cmi/anch/maw 7/26/04 this appears to suppress output queue setup in GIS for this interfaces TRL message
 I INA("FILE")=90214 D  Q
 . S INA("BDW1ZTS1")=$$GET1^DIQ(90214,INDA,.18)
 . S INA("BDW1ZTS2")=$$GET1^DIQ(90214,INDA,.05)
 . S INA("BDW1ZTS3")=(INA("BDW1ZTS2")-$$GET1^DIQ(90214,INDA,3101))
 . S INA("BDW1ZTS4")=$$GET1^DIQ(90214,INDA,3101)
 . S INA("BDW1ZTS5")=$$GET1^DIQ(90214,INDA,.06)+2
 . S INA("BDW1BTS1")=$$GET1^DIQ(90214,INDA,.06)
 . S INA("BDW1BTS2")=$P($G(^DIC(4,$P(^AUTTSITE(1,0),U),0)),U)
 . S INA("BDW1BTS3")=1
 . D HFS  ;task to host file
 I INA("FILE")=90213 D  Q
 . S INA("BDW1ZTS1")=$$GET1^DIQ(90213,INDA,.18)
 . S INA("BDW1ZTS2")=$$GET1^DIQ(90213,INDA,.05)
 . S INA("BDW1ZTS3")=(INA("BDW1ZTS2")-$$GET1^DIQ(90213,INDA,3101))
 . S INA("BDW1ZTS4")=$$GET1^DIQ(90213,INDA,3101)
 . S INA("BDW1ZTS5")=$$GET1^DIQ(90213,INDA,.06)+2
 . S INA("BDW1BTS1")=$$GET1^DIQ(90213,INDA,.06)
 . S INA("BDW1BTS2")=$P($G(^DIC(4,$P(^AUTTSITE(1,0),U),0)),U)
 . S INA("BDW1BTS3")=1
 . N BDWDA,BDWC S BDWC=0
 . S BDWDA=0 F  S BDWDA=$O(^BDWXLOG(INDA,99,BDWDA)) Q:'BDWDA  D
 .. S BDWC=BDWC+1
 .. S INDA("NTE",BDWC)=""
 .. S INA("BDW1NTE3",BDWC)=$G(^BDWXLOG(INDA,99,BDWDA,0))
 . D HFS  ;task to host file
 I INA("FILE")=90215 D  Q
 . S INA("BDW1ZTS5")=$$GET1^DIQ(90215,INDA,.05)+2
 . S INA("BDW1BTS1")=$$GET1^DIQ(90215,INDA,.05)
 . S INA("BDW1BTS2")=$P($G(^DIC(4,$P(^AUTTSITE(1,0),U),0)),U)
 . S INA("BDW1BTS3")=1
 . D HFS  ;task to host file
 Q
 ;
BQ(BHLP) ;-- return blood quantum
 K BHLPVAL
 N BHLX,BHLY
 S (BHLX,BHLY)=""
 S BHLPVAL=""
 S BHLPVAL=$P($G(^AUPNPAT(BHLP,11)),U,10)
 I +BHLPVAL>0 S BHLX=$P(BHLPVAL,"/",1)/$P(BHLPVAL,"/",2)
 S BHLY=$S((BHLPVAL="FULL"!(BHLX=1)):1,BHLPVAL="NONE":5,BHLPVAL="UNSPECIFIED":6,BHLPVAL="UNKNOWN":7,+BHLPVAL'>0:7,1:BHLY)
 I BHLY]"" Q $G(BHLY)
 S BHLY=$S(BHLX'<.5:2,BHLX'<.25:3,BHLX'<.125:4,BHLX<.125:4,1:BHLY)
 Q $G(BHLY)
 ;
FLG(BDWSEG,BDWIEN) ;EP -- return status flag based on segment
 I $G(INA("BACKLOAD")) Q "A"  ;everything is a "A" on backlboad
 NEW G,X
 S G=0 F X=1:1:5 I $P($G(^AUPNPAT(BDWIEN,4)),U,X)]"" S G=1
 I 'G Q "A"  ;everything is an "A" if patient never sent to dw before
 N BDWFLG
 S BDWCD="N",BDWFLG=0
 I '$G(^AUPNPAT(BDWIEN,4)) S BDWFLG=1
 I BDWSEG="ZRB" D  Q $G(BDWCD)
 . I $P($G(^AUPNPAT(BDWIEN,4)),U)="" S BDWFLG=1
 . I $P($G(^AUPNDWAF(BDWIEN,0)),U,2)]"",BDWFLG=1 S BDWCD="A"
 . I $P($G(^AUPNDWAF(BDWIEN,0)),U,2)]"",BDWFLG=0 S BDWCD="Y"
 I BDWSEG="ZRL" D  Q $G(BDWCD)
 . I $P($G(^AUPNPAT(BDWIEN,4)),U)="",$P($G(^AUPNPAT(BDWIEN,4)),U,3)="" S BDWFLG=1
 . I $P($G(^AUPNDWAF(BDWIEN,0)),U,6)]"",BDWFLG=1 S BDWCD="A"
 . I $P($G(^AUPNDWAF(BDWIEN,0)),U,6)]"",BDWFLG=0 S BDWCD="Y"
 I BDWSEG="ZRC" D  Q $G(BDWCD)
 . I $P($G(^AUPNPAT(BDWIEN,4)),U)="",$P($G(^AUPNPAT(BDWIEN,4)),U,4)="" S BDWFLG=1
 . I $P($G(^AUPNDWAF(BDWIEN,0)),U,8)]"",BDWFLG=1 S BDWCD="A"
 . I $P($G(^AUPNDWAF(BDWIEN,0)),U,8)]"",BDWFLG=0 S BDWCD="Y"
 I BDWSEG="ZRD" D  Q $G(BDWCD)
 . I $P($G(^AUPNPAT(BDWIEN,4)),U)="",$P($G(^AUPNPAT(BDWIEN,4)),U,2)="" S BDWFLG=1
 . I $P($G(^AUPNDWAF(BDWIEN,0)),U,4)]"",BDWFLG=1 S BDWCD="A"
 . I $P($G(^AUPNDWAF(BDWIEN,0)),U,4)]"",BDWFLG=0 S BDWCD="Y"
 I BDWSEG="ZIN" D  Q $G(BDWCD)
 . I $P($G(^AUPNPAT(BDWIEN,4)),U)="",$P($G(^AUPNPAT(BDWIEN,4)),U,5)="" S BDWFLG=1
 . I $P($G(^AUPNDWAF(BDWIEN,0)),U,11)]"",BDWFLG=1 S BDWCD="A"
 . I $P($G(^AUPNDWAF(BDWIEN,0)),U,11)]"",BDWFLG=0 S BDWCD="Y"
 Q BDWCD
 ;
GETDIR ;get export directory
 ;cmi/anch/maw modified 7/27/2004 to look at default directories based on OS, defaults to UNIX then checks
 ;cmi/anch/maw modified 9/16/2004 to look for correct directory
 S BDWHDIR=$S($P($G(^AUTTSITE(1,1)),U,2)]"":$P(^AUTTSITE(1,1),U,2),1:$G(^XTV(8989.3,1,"DEV")))
 I $G(BDWHDIR)="" S BDWHDIR="/usr/spool/uucppublic/"
 Q
HFSA(DEST,BHLHDIR,BHLHFNM) ;EP - export from this destination
 S Y=$$OPEN^%ZISH(BHLHDIR,BHLHFNM,"W")
 Q:Y
 S BHLX=0 F  S BHLX=$O(^BDWTMP(DEST,BHLX)) Q:'BHLX  D
 . S BHLU=$O(^INTHU("AT",BHLX,0))
 . Q:'BHLU  ;cmi/maw 6/28/2004 added for null node
 . D LPINTHU(BHLU)
 D ^%ZISC
 ;*****LORI PUT SENDTO HERE WHEN READY
 I $P($G(^AUTTSITE(1,0)),U,21)=1 S BDWSLASH="/" I 1
 E  S BDWSLASH="\"
 S BDWNOSLA=1 I $E(BDWHDIR,$L(BDWHDIR))="/"!($E(BDWHDIR,$L(BDWHDIR))="\") S BDWNOSLA=0
 S BDWPAFN=BHLHDIR_$S(BDWNOSLA:BDWSLASH,1:"")_BHLHFNM
 ;now loop through and delete them
 S BHLX=0 F  S BHLX=$O(^BDWTMP(DEST,BHLX)) Q:'BHLX  D
 .S BHLU=$O(^INTHU("AT",BHLX,0))
 .Q:'BHLU  ;cmi/maw 6/28/2004 added for null node
 .S DA=BHLU,DIE="^INTHU(",DR=".03////C" D ^DIE K DIE,DA,DR
 .Q
 K ^BDWTMP(DEST)
 D AUTOSEND^BDWBHL1  ;cmi/anch/maw 8/8/2007 moved after kill of BDWTMP so a failed ftp will not stop the kill
FTP ;
 ;PUT FTP TO DW MACHINE HERE
BULL ;now send mailman message to user who queued the job
 D BULL^BDWBHL1
 Q
 ;
LPINTHU(BHLUIEN)       ;EP - loop through UIF and set to file
 S BHLUDA=0 F  S BHLUDA=$O(^INTHU(BHLUIEN,3,BHLUDA)) Q:'BHLUDA  D
 . U IO W $P($G(^INTHU(BHLUIEN,3,BHLUDA,0)),"|CR|"),!
 Q
 ;
DELAY(IDA,IA) ;-- determine the delay based on records
 ;cmi/maw 11/7/2007 added for dynamic delay based on number of records
 I IA=90215 Q 60
 N BDWRCNT
 S BDWRCNT=$$GET1^DIQ(IA,IDA,.06)
 I BDWRCNT>10000 Q 30
 I BDWRCNT>40000 Q 60
 I BDWRCNT>60000 Q 90
 Q 15
 ;
HFS ;-- task the file to the host system
 NEW BDWUSER,BDWDESC,F,BDWPFL,BDWPIEN
 S BDWUSER=$$VALI^XBDIQ1(INA("FILE"),INDA,8801)
 S BDWPFL=$G(INA("FILE"))  ;maw added 4/7/2005  for ZTS-6
 S BDWPIEN=$G(INDA)  ;maw added 4/7/2005 for ZTS-6
 I INA("FILE")=90213 S BDWDESC="Data Warehouse Export for: "_$$VAL^XBDIQ1(90213,INDA,.01)_" to "_$$VAL^XBDIQ1(90213,INDA,.02)
 I INA("FILE")=90214 S BDWDESC="Data Warehouse Visit Backload for: "_$$VAL^XBDIQ1(90214,INDA,.01)_" to "_$$VAL^XBDIQ1(90214,INDA,.02)
 I INA("FILE")=90215 S BDWDESC="Full Registration Backload to the Data Warehouse"
 S ZTRTN="HFS1^BDWBHL"
 S ZTIO="",ZTDTH=$$FMADD^XLFDT($$NOW^XLFDT,,,$$DELAY(INDA,INA("FILE"))),ZTDESC="DW DATA WAREHOUSE HFS CREATION" S ZTSAVE("BDW*")=""
 D ^%ZTLOAD
 Q
HFS1 ;EP - called from taskman
 N BDWDEST,BDWHDIR,BDWHFNM
 S BDWDEST=$O(^INRHD("B","HL IHS DW1 IE",0))
 Q:'BDWDEST
 K ^INLHDEST(BDWDEST) ;kill off inlhdest
 N BDWQCNT
 S BDWQCNT=$$QCNT(BDWDEST)  ;4/7/05 maw quick count of records to put in ZTS-6
 D SETZTS6(BDWPFL,BDWPIEN,BDWQCNT)
 ;before saving off, reset AUPNDWAF and 4 node in AUPNPAT
 I BDWPFL=90213,'$P($G(^BDWXLOG(BDWPIEN,0)),U,22) D RST4AF^BDWRDR(BDWPIEN)
 I BDWPFL=90213,$P($G(^BDWXLOG(BDWPIEN,0)),U,22) D RESETFLG^BDWBHL1(BDWDEST,BDWPFL,BDWPIEN)
 ;
 D GETDIR
 Q:BDWHDIR=""
 N BDWASU
 S BDWASU=$P($G(^AUTTLOC($P($G(^AUTTSITE(1,0)),U),0)),U,10)
 D NOW^%DTC
 N BDWDTS
 S BDWDTS=$TR(%,".")
 S BDWHFNM=BDWASU_BDWDTS_".BDW"
 D HFSA(BDWDEST,BDWHDIR,BDWHFNM)
 S ZTREQ="@"
 Q
 ;
QCNT(DEST) ;-- let's loop through and get a quick count of records
 N BDWDA,BDWCNT
 S BDWCNT=0
 S BDWDA=0 F  S BDWDA=$O(^BDWTMP(DEST,BDWDA)) Q:'BDWDA  D
 . Q:'$O(^INTHU("AT",BDWDA,0))
 . ;cmi/anch/maw 12/7/2007 filter out A40's?
 . S BDWCNT=BDWCNT+1
 Q +$G(BDWCNT)
 ;
SETZTS6(PFL,PIEN,QCNT) ;-- set ZTS-6 with actual counts
 N TRL
 I PFL=90213 D
 . S TRL=$P($G(^BDWXLOG(PIEN,0)),U,14)
 . Q:'TRL
 . S TRL=$O(^INTHU("AT",TRL,0))
 I PFL=90214 D
 . S TRL=$P($G(^BDWBLOG(PIEN,0)),U,14)
 . Q:'TRL
 . S TRL=$O(^INTHU("AT",TRL,0))
 I PFL=90215 D
 . S TRL=$P($G(^BDWRBLOG(PIEN,0)),U,8)
 . Q:'TRL
 . S TRL=$O(^INTHU("AT",TRL,0))
 Q:'$G(TRL)
 N LDA
 S LDA=0 F  S LDA=$O(^INTHU(TRL,3,LDA)) Q:'LDA  D
 . I $E($G(^INTHU(TRL,3,LDA,0)),1,3)="ZTS" D
 .. S $P(^INTHU(TRL,3,LDA,0),"|",7)=QCNT_"|CR"
 Q