BPCMEAS ; IHS/OIT/MJL - GUI V MEASUREMENT VISIT CREATION ;
 ;;1.5;BPC;;MAY 26, 2005
 ;;
GETVISIT(BGUARRAY,BPCPIEN,BPCTYPE,BPCVDT,BPCLOC,BPCCAT,BPCMOD,BPCMTYP,BPCMVAL,BPCPROV,BPCEPRV) ;EP CALL
 ;                          FROM REMOTE PROC: BPC MEASVISIT SAVE
 ;BGUARRAY is return array
 ;BPCPIEN is patient IEN
 ;BPCTYPE is VISIT type ex: I FOR IHS
 ;BPCVDT is visit date and time in fm format
 ;BPCLOC is DUZ(2) 
 ;BPCCAT is service category
 ;BPCMOD is flag ex: C is create/add new entry, M is modify entry
 ;BPCMTYP is meas type IEN
 ;BPCMVAL is meas value
 ;BPCPROV is ordering provider IEN
 ;BPCEPRV is encounter provider IEN  usually DUZ
 ;
EN ;ENTRY POINT FOR TESTING
 ;S BPCPIEN=25241,BPCTYPE="I",BPCVDT="3010924.1200"
 ;S BPCLOC=DUZ(2),BPCCAT="A",BPCMOD="C",BPCMTYP="4"
 ;S BPCMVAL="120/88",BPCPROV=2,BPCEPRV=2
 S JOB=$J,XWBWRAP=1,BPCGUI=1
 S BGUARRAY="^XTMP(""BPCMV"","_$J_")"
 K @BGUARRAY
 ;
 ;check patient IEN
 S BPCERR=0
 I $G(BPCPIEN)="" D  Q:BPCERR
 .S ^XTMP("BPCMV",JOB,1)=-1,^(2)="PATIENT IEN NOT SENT!"
 .D KILL
 .S BPCERR=1
 .Q
 ;
 ;check patient
 S BPCERR=0
 I '$D(^AUPNPAT(BPCPIEN,0)) D  Q:BPCERR
 .S ^XTMP("BPCMV",JOB,1)=-1,^XTMP(2)="PATIENT IEN IS NOT DEFINED!"
 .D KILL
 .S BPCERR=1
 .Q
 ;
 ;check for DUZ(2)
 S BPCERR=0
 I 'BPCLOC D  Q:BPCERR
 .S ^XTMP("BPCMV",JOB,1)=-1,^(2)="LOCATION (DUZ(2)) NOT SENT!"
 .D KILL
 .S BPCERR=1
 .Q
 ;
 ;check VISIT TYPE
 S BPCERR=0
 I $G(BPCTYPE)="" D  Q:BPCERR
 .S:'$D(^APCCCTRL(BPCLOC,0)) BPCERR=1
 .S:BPCERR ^XTMP("BPCMV",JOB,1)=-1,^XTMP(2)="VISIT TYPE NOT DEFINED!"
 .Q:BPCERR
 .S BPCTYPE=$S($P($G(^APCCCTRL(BPCLOC,0)),U,4)'="":$P(^(0),U,4),1:"I")
 ;
 ;check for SERVICE CATEGORY
 S BPCERR=0
 I $G(BPCCAT)="" D  Q:BPCERR
 .S ^XTMP("BPCMV",JOB,1)=-1,^(2)="SERVICE CATEGORY NOT SENT!"
 .D KILL
 .S BPCERR=1
 .Q
 ;
 ;check for CREATE/MOD flag
 S BPCERR=0
 I $G(BPCMOD)="" D  Q:BPCERR
 .S ^XTMP("BPCMV",JOB,1)=-1,^(2)="CREATE/MOD FLAG NOT SENT!"
 .D KILL
 .S BPCERR=1
 .Q
 ;
VISIT ;CALLS APCDALV TO CREATE PCC VISIT
 K APCDALVR ;KILL PCC DATA ARRAY
 K X,Y,DINUM,DLAYGO,DR,DIC,DA,D0,DIU,DIW,DIY,DIV  ; KILL FILEMAN VAR
 S APCDALVR("APCDAUTO")="" ;BACKGROUND SILENT VISIT CREATION
 S APCDALVR("AUPNTALK")="" ;BACKGROUND SILENT VISIT CREATION
 S (APCDAUTO,AUPNTALK)=""
 S APCDALVR("APCDPAT")=$G(BPCPIEN)
 S APCDALVR("APCDTYPE")=$G(BPCTYPE)
 S APCDALVR("APCDDATE")=$G(BPCVDT)
 S APCDALVR("APCDLOC")=$G(BPCLOC)
 S APCDALVR("APCDCAT")=$G(BPCCAT)
 D ^APCDALV
 ;
 ;if no visit is created
 S BPCERR=0
 I $D(APCDALVR("APCDAFLG")) D  Q:BPCERR
 .S ^XTMP("BPCMV",JOB,1)=-1
 .S ^XTMP("BPCMV",JOB,2)="PCC Visit not created APCDFLG = "
 .S ^XTMP("BPCMV",JOB,2)=^XTMP("BPCMV",JOB,2)_APCDALVR("APCDAFLG")
 .D KILL
 .S BPCERR=1
 .Q
 S BPCVSIT=APCDALVR("APCDVSIT")
 ;
VBUILD ; create APCDALVR array containing the elements to be passed to PCC
 ;assume VISIT created and stored in APCDALVR(""APCDVSIT"")
 ;
 K APCDALVR ;KILL PCC DATA ARRAY
 S APCDALVR("APCDAUTO")="" ;BACKGROUND SILENT VISIT CREATION
 S APCDALVR("AUPNTALK")="" ;BACKGROUND SILENT VISIT CREATION
 S (APCDAUTO,AUPNTALK)=""
 S APCDALVR("APCDVSIT")=BPCVSIT
 S APCDALVR("APCDPAT")=$G(BPCPIEN)
 S BPCERR=0
 I '$D(APCDALVR("APCDVSIT")) D  Q:BPCERR
 .S ^XTMP("BPCMV",JOB,1)=-1,^(2)="PCC Visit not created"
 .D KILL
 .S BPCERR=1
 .Q
 ;
 ;check for ORDERING PROVIDER
 S BPCERR=0
 I '+$G(BPCPROV) D  Q:BPCERR
 .S ^XTMP("BPCMV",JOB,1)=-1,^(2)="INVALID ORDERING PROVIDER SENT!"
 .D KILL
 .S BPCERR=1
 .Q
 ;
 ;check for ORDERING PROVIDER ENTRY IN VA200
 S BPCERR=0
 I '$D(^VA(200,+BPCPROV,0)) D  Q:BPCERR
 .S ^XTMP("BPCMV",JOB,1)=-1,^(2)="ORDERING PROVIDER NOT DEFINED!"
 .D KILL
 .S BPCERR=1
 .Q
 ;
 ;check for ENCOUNTER PROVIDER
 S BPCERR=0
 I '+$G(BPCEPRV) D  Q:BPCERR
 .S ^XTMP("BPCMV",JOB,1)=-1,^(2)="INVALID ENCOUNTER PROVIDER SENT!"
 .D KILL
 .S BPCERR=1
 .Q
 ;
 ;check for ENCOUNTER PROVIDER ENTRY IN VA200
 S BPCERR=0
 I '$D(^VA(200,+BPCEPRV,0)) D  Q:BPCERR
 .S ^XTMP("BPCMV",JOB,1)=-1,^(2)="ENCOUNTER PROVIDER NOT DEFINED!"
 .D KILL
 .S BPCERR=1
 .Q
 ;
 ;set measurement variables
 ;date,meastype,measval previously validated in Client
 S APCDALVR("APCDTVAL")=$G(BPCMVAL)
 S APCDALVR("APCDTTYP")="`"_BPCMTYP
 S APCDALVR("APCDTCDT")=$G(BPCVDT)
 S APCDALVR("APCDTEPR")="`"_BPCEPRV
 S APCDALVR("APCDTPRV")="`"_BPCPROV
 ;
 ;define PCC TEMPLATE and run
 S BPCVFILE="9000010.01" ;pcc V MEAS file number
 S APCDALVR("APCDATMP")="[APCDALVR "_BPCVFILE_" (ADD)]"
 I $G(BPCMOD)="M" S APCDALVR("APCDATMP")="[APCDALVR "_BPCVFILE_" (MOD)]"
 D ^APCDALVR
 ;if no V MEAS is created
 S BPCERR=0
 I $D(APCDALVR("APCDAFLG")) D  Q:BPCERR
 .S ^XTMP("BPCMV",JOB,1)=-1
 .S ^XTMP("BPCMV",JOB,2)="PCC Measurement not created APCDFLG = "
 .S ^XTMP("BPCMV",JOB,2)=^XTMP("BPCMV",JOB,2)_APCDALVR("APCDAFLG")
 .D KILL
 .S BPCERR=1
 .Q
 ;
 S BPCERR=0
 I '$D(APCDALVR("APCDAFLG")) D  Q:BPCERR
 .S ^XTMP("BPCMV",JOB,1)=3
 .S ^XTMP("BPCMV",JOB,2)="PCC Measurement Saved"
 .S ^XTMP("BPCMV",JOB,3)=+$G(APCDALVR("APCDADFN"))
 .D KILL
 .S BPCERR=1
 .Q
 Q
 ;
KILL ;kill variables
 K APCDALVR,BPCPIEN,BPCTIEN,BPCLOC,BPCCAT,BPCCTR,BPCEPRV,BPCERR
 K BPCGUI,BPCL,BPCLOC,BPCMOD,BPCMTYP,BPCVAL,BPCPIEN,BPCPROV,BPCRTN
 K BPCTIEN,BPCTYPE,BPVVDT,BPCVFILE,BPCVSIT,BPCX
 Q
 ;
HELP(BGUARRAY,BPCMTYP) ;EP CALL
 ;     FROM REMOTE PROC: BPC MEASTYPE HELP
 ;
ENH ;ENTRY POINT FOR TESTING HELP
 ;S BPCMTYP=1
 S JOB=$J,BPCGUI=1
 S XWBWRAP=1,BGUARRAY="^XTMP(""BPCMV"","_$J_")"
 K @BGUARRAY
 ;
 ;check MEASUREMENT TYPE
 S BPCERR=0
 I '$G(BPCMTYP) D  Q:BPCERR
 .S ^XTMP("BPCMV",JOB,1)=-1,^XTMP(2)="MEASUREMENT TYPE NOT DEFINED!"
 .D KILL
 .S BPCERR=1
 .Q
 ;
 S BPCERR=0
 I '$D(^AUTTMSR(BPCMTYP,0)) D  Q:BPCERR
 .S ^XTMP("BPCMV",JOB,1)=-1,^XTMP(2)="MEASUREMENT TYPE IEN NOT DEFINED!"
 .D KILL
 .S BPCERR=1
 .Q
 ;
 ;called BPCMTYP already set
 S BPCMTYP="H"_$P(^AUTTMSR(BPCMTYP,0),U,1)
 S:BPCMTYP="HVU" BPCMTYP="HVC"
 I BPCMTYP="HHT" S ^XTMP("BPCMV",JOB,1)=2,^XTMP(2)="Enter height in inches and fractions (64 3/4), or inches and",^XTMP(3)="decimal (64.75)  Height must be between 10 and 90 inches" Q
 I BPCMTYP="HWT" S ^XTMP("BPCMV",JOB,1)=2,^XTMP(2)="Enter weight in LBS and OZs (132 12) or (132 3/4) or (132.75)",^XTMP(3)="Weight must be between 2 and 750 lbs and fractional/decimal part must be a multiple of 1/16 (.0625).i" Q
 ;S ^XTMP("BPCMV",JOB,1)=-1,^XTMP(2)="MEASUREMENT TYPE IEN NOT DEFINED!"
 S BPCRTN="AUPNVMS2"
 S BPCERR=0
 I $T(@BPCMTYP^@BPCRTN)="" D  Q:BPCERR
 .S ^XTMP("BPCMV",JOB,1)=-1,^(2)="MEASUREMENT TYPE HELP NOT AVAILABLE!"
 .S BPCERR=1
 .Q
 ;
 S BPCCTR=1
 S BPCERR=0
 ;
 F BPCX=1:1 D  Q:BPCERR
 .S BPCL=$T(@BPCMTYP+BPCX^@BPCRTN)
 .S:BPCL=""!($P(BPCL,";;",1)'=" ") BPCERR=1
 .Q:BPCERR
 .S ^XTMP("BPCMV",JOB,BPCCTR)=$P(BPCL,";;",2)
 .S BPCCTR=BPCCTR+1
 ;
 S ^XTMP("BPCMV",JOB,.5)=BPCCTR-1
 Q
 ;
VAL(BGUARRAY,BPCMTYP,BPCMVAL) ;EP CALL
 ;     FROM REMOTE PROC: BPC MEASVAL VALIDATE
 ;
ENV ;ENTRY POINT FOR TESTING VALIDATE
 ;S BPCMTYP=4
 ;S BPCMVAL="100/80"
 S JOB=$J,BPCGUI=1
 S XWBWRAP=1,BGUARRAY="^XTMP(""BPCMV"","_$J_")"
 K @BGUARRAY
 ;
 ;check MEASUREMENT VALUE
 S BPCERR=0
 I $G(BPCMVAL)="" D  Q:BPCERR
 .S ^XTMP("BPCMV",JOB,1)=-1,^XTMP(2)="MEASUREMENT VALUE NOT DEFINED!"
 .D KILL
 .S BPCERR=1
 .Q
 ;
 S BPCERR=0
 I '$D(^AUTTMSR(BPCMTYP,0)) D  Q:BPCERR
 .S ^XTMP("BPCMV",JOB,1)=-1,^XTMP(2)="MEASUREMENT TYPE IEN NOT DEFINED!"
 .D KILL
 .S BPCERR=1
 .Q
 ;
 ;called BPCMTYP already set
 S BPCMTYP=$P(^AUTTMSR(BPCMTYP,0),U,1)
 S:BPCMTYP="VU" BPCMTYP="VC"
 S BPCRTN="AUPNVMSR"
 S BPCERR=0
 I $T(@BPCMTYP^@BPCRTN)="" D  Q:BPCERR
 .S ^XTMP("BPCMV",JOB,1)=-1,^(2)="MEASUREMENT VALIDATE NOT AVAILABLE!"
 .S BPCERR=1
 .Q
 ;
 S BPCCTR=1
 S BPCERR=0
 S X=BPCMVAL
 D @BPCMTYP^@BPCRTN
 I '$D(X) D  Q:BPCERR
 .S ^XTMP("BPCMV",JOB,1)=-1,^(2)="MEASUREMENT VALUE IS NOT ACCEPTABLE!"
 .S BPCERR=1
 .Q
 ;
 S ^XTMP("BPCMV",JOB,.5)=2
 S ^XTMP("BPCMV",JOB,1)="INPUT TRANSFORM OK!"
 Q
