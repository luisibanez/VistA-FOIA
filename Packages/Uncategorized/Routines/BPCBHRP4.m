BPCBHRP4 ; IHS/OIT/MJL - behavioral health display for GUI ;
 ;;1.5;BPC;;MAY 26, 2005
 ;
 ;
 ;
TEST ;
 D DISPLAST(.RETVAL,1,,"S")
 Q
DISPLAST(BGUARRAY,BPCPAT,BPCPROV,BPCTYPE,BPCEFT) ;EP - BPCBH RPT LAST VISIT
 NEW AMHR
  S JOB=$J,BPCGUI=1,XWBWRAP=1
 S ZTIO="",ZTQUEUED=1
 S BGUARRAY="^XTMP(""BPCRPT"","_$J_")"
 K ^XTMP("BPCRPT",JOB)
 I $G(BPCPAT)="" S ^XTMP("BPCRPT",JOB,.5)=2,^XTMP("BPCRPT",JOB,1)="Invalid DFN of patient passed" D KILL Q
 I $G(BPCTYPE)="" S ^XTMP("BPCRPT",JOB,.5)=2,^XTMP("BPCRPT",JOB,1)="Invalid format type passed" D KILL Q
 I "ES"'[BPCTYPE S ^XTMP("BPCRPT",JOB,.5)=2,^XTMP("BPCRPT",JOB,1)="Invalid format type passed" D KILL Q
 I $G(BPCPROV),'$D(^VA(200,BPCPROV,0)) S ^XTMP("BPCRPT",JOB,.5)=2,^XTMP("BPCRPT",JOB,1)="Invalid IEN of provider entry passed" D KILL Q
 S AMHLVPR=$G(BPCPROV)
 S AMHTYPE=$G(BPCTYPE)
 S (DFN,AMHPAT,AUPNPAT)=BPCPAT
 S ^XTMP("BPCRPTRUN",JOB)=""
 D ^XBKSET
 D GETREC
 I 'AMHR S ^XTMP("BPCRPT",JOB,.5)=2,^XTMP("BPCRPT",JOB,1)="No visit found" D KILL Q
 S ZTRTN="TSK^BPCBHRP4",ZTIO="",ZTDESC="BPC LAST VISIT DISPLAY",ZTSAVE("AMH*")="",ZTSAVE("JOB")="",ZTDTH=$H D ^%ZTLOAD
 F I=1:1:120 Q:$G(^XTMP("BPCRPTRUN",$J))="DONE"  H 1
 D KILL
 Q
 ;
GETREC ;
 S AMHR="",AMHEFT=$G(BPCEFT) I AMHEFT="" S AMHEFT="F"
 I '$D(^AMHREC("AE",AMHPAT)) Q
 I AMHLVPR="" S AMHDLAST=$O(^AMHREC("AE",AMHPAT,"")),AMHR=$O(^AMHREC("AE",AMHPAT,AMHDLAST,"")) Q
 NEW D,%,P S (D,%)="" F  S D=$O(^AMHREC("AE",AMHPAT,D)) Q:D'=+D!(AMHR)  D
 .S V=0 F  S V=$O(^AMHREC("AE",AMHPAT,D,V)) Q:V'=+V  I $$PPINT^AMHUTIL(V)=AMHLVPR S AMHR=V
 .Q
 Q
TSK ;
 D ^XBKSET
 S ^XTMP("BPCRPTRUN",JOB)="START"
 D GUIR^XBLM($S(AMHTYPE="S":"EN1^AMHLELV",1:"^AMHLEFP2"),"^XTMP(""BPCRPT"",JOB)")
 S ^XTMP("BPCRPT",JOB,.5)=$O(^XTMP("BPCRPT",JOB,""),-1)+1
 S ^XTMP("BPCRPTRUN",JOB)="DONE"
 Q
 ;
KILL ;
 K DFN,AMHPAT,AUPNPAT
 K AMHOA,AMHBT,AMHTOT
 K BPCCTR,BPCGUI,AMHSF,DIC,JOB,X,Y,ZTDESC,ZTDTH,ZTIO,ZTRTN,ZTSAVE
 D EN^XBVK("AMH")
 Q
