BSDX41J ; IHS/OIT/HMW/MSC/SAT - WINDOWS SCHEDULING RPCS ;
 ;;3.0;IHS WINDOWS SCHEDULING;;DEC 09, 2010
 ;
MRL ; ******************** MOST RECENT LAB * 9000010.09 *******
 I '$D(^AUPNVLAB("AA",APCHSPAT)) D EKGLAB G MRLX
 ;X APCHSCKP Q:$D(APCHSQIT)
 ;X:'APCHSNPG APCHSBRK
 ; <SETUP>
 ; <PROCESS>
 D LBLD,LPRT
 D EKGLAB
 ;now display lab refusals
 S APCHST="LAB",APCHSFN=60 D DISPREF^BSDX41F
 K APCHST,APCHSFN
 ; <CLEANUP>
MRLX K APCHSLT,APCHSLR,APCHSLTX,APCHSLRT,APCHSLL,APCHSLW,APCHSNMX,APCHSDFN,APCHSIVD,APCHSLTD,APCHSN,Y
 K ^TMP($J,"APCHS"),^TMP($J,"APCHS1")
 Q
 ; <BUILD>
LBLD K ^TMP($J,"APCHS","LAB"),^TMP($J,"APCHS1")
 S APCHSLRT="" F APCHSQ=0:0 S APCHSLRT=$O(^AUPNVLAB("AA",APCHSPAT,APCHSLRT)) Q:APCHSLRT=""  D LDATE
 D REORDER
 Q
REORDER ;reorder by accession, parent and child
 S X=0 F  S X=$O(^TMP($J,"APCHS","LAB",X)) Q:X'=+X  D
 .S Y=$P(^TMP($J,"APCHS","LAB",X),U,3)
 .S %=$E($P(^AUPNVLAB(Y,0),U,6),1,2) S:%="" %="ZZ"
 .S %1=$S($P($G(^AUPNVLAB(Y,12)),U,8)]"":$P(^AUPNVLAB(Y,12),U,8),1:Y)
 .S %2=$S($P($G(^AUPNVLAB(Y,12)),U,8)="":0,1:Y)
 .S ^TMP($J,"APCHS1",%,%1,%2,X)=^TMP($J,"APCHS","LAB",X)
 .Q
 K ^TMP($J,"APCHS")
 Q
LDATE S APCHSIVD=$O(^AUPNVLAB("AA",APCHSPAT,APCHSLRT,0))
 S APCHSDFN=0 F  S APCHSDFN=$O(^AUPNVLAB("AA",APCHSPAT,APCHSLRT,APCHSIVD,APCHSDFN)) Q:APCHSDFN'=+APCHSDFN   D:APCHSIVD&(APCHSIVD'>APCHSDLM) LSET
 Q
LSET ;
 S APCHSN=^AUPNVLAB(APCHSDFN,0),APCHSLR=$P(APCHSN,U,4)
 I $P($G(^AUPNVLAB(APCHSDFN,11)),U,9)="R",APCHSLR="",$$VALI^XBDIQ1(60,$P(APCHSN,U),999999901) Q  ;do not display tests that are resulted, result is null and flag says don't display
 I APCHSLR]"",APCHSLR'=" ",$P(APCHSN,U,5)]"" S APCHSLR=APCHSLR_" ("_$P(APCHSN,U,5)_")"
 I APCHSLR="",$P($G(^TMP($J,"APCHS","LAB",APCHSLRT)),U,2)]"" Q
 S ^TMP($J,"APCHS","LAB",APCHSLRT)=(-APCHSIVD\1+9999999)_U_APCHSLR_U_APCHSDFN S APCHSLTX=$P(^LAB(60,APCHSLRT,0),U,1)
 Q
 ; <PRINT>
LPRT ;
 S BSDXTMP=" "_"TEST"
 S BSDXTMP=BSDXTMP_$$FILL^BSDX41(22-$L(BSDXTMP))_"RESULT DT/TIME"
 S BSDXTMP=BSDXTMP_$$FILL^BSDX41(38-$L(BSDXTMP))_"VISIT"
 S BSDXTMP=BSDXTMP_$$FILL^BSDX41(46-$L(BSDXTMP))_"RESULT"
 S BSDXTMP=BSDXTMP_$$FILL^BSDX41(59-$L(BSDXTMP))_"UNITS"
 S BSDXTMP=BSDXTMP_$$FILL^BSDX41(69-$L(BSDXTMP))_"REF RANGE"
 S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)=BSDXTMP_$C(30)
 S BSDXTMP=""
 S APCHSACC="" F  S APCHSACC=$O(^TMP($J,"APCHS1",APCHSACC)) Q:APCHSACC=""!($D(APCHSQIT))  D
 .S APCHSPAR=0 F  S APCHSPAR=$O(^TMP($J,"APCHS1",APCHSACC,APCHSPAR)) Q:APCHSPAR'=+APCHSPAR!($D(APCHSQIT))  D
 ..S APCHCHIL="" F  S APCHCHIL=$O(^TMP($J,"APCHS1",APCHSACC,APCHSPAR,APCHCHIL)) Q:APCHCHIL=""  D
 ...S APCHSLT=$O(^TMP($J,"APCHS1",APCHSACC,APCHSPAR,APCHCHIL,0))
 ...S APCHSDFN=$P(^TMP($J,"APCHS1",APCHSACC,APCHSPAR,APCHCHIL,APCHSLT),U,3)
 ...S Y=$P(^TMP($J,"APCHS1",APCHSACC,APCHSPAR,APCHCHIL,APCHSLT),U,1),APCHSLR=$P(^TMP($J,"APCHS1",APCHSACC,APCHSPAR,APCHCHIL,APCHSLT),U,2) X APCHSCVD S APCHSLTD=Y
 ...D LPRT2
 K APCHCHIL,APCHSPAR,APCHSACC,APCHSLT
 Q
LPRT2 ;
 S APCHSLTX=$P(^LAB(60,APCHSLT,0),U)
 S APCHSRDT=$P($G(^AUPNVLAB(APCHSDFN,12)),U,12) I APCHSRDT]"" S APCHSRDT=$$DATE^APCHSMU($P(APCHSRDT,"."))_"@"_$P($P($$FMTE^XLFDT(APCHSRDT),"@",2),":",1,2)
 ;X APCHSCKP Q:$D(APCHSQIT)
 I APCHSNPG D
 .S BSDXTMP=" "_"TEST"
 .S BSDXTMP=BSDXTMP_$$FILL^BSDX41(22-$L(BSDXTMP))_"RESULT DT/TIME"
 .S BSDXTMP=BSDXTMP_$$FILL^BSDX41(38-$L(BSDXTMP))_"VISIT"
 .S BSDXTMP=BSDXTMP_$$FILL^BSDX41(46-$L(BSDXTMP))_"RESULT"
 .S BSDXTMP=BSDXTMP_$$FILL^BSDX41(59-$L(BSDXTMP))_"UNITS"
 .S BSDXTMP=BSDXTMP_$$FILL^BSDX41(69-$L(BSDXTMP))_"REF RANGE"
 .S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)=BSDXTMP_$C(30)
 S BSDXTMP=""
 S:APCHCHIL BSDXTMP=" "
 S BSDXTMP=BSDXTMP_$E(APCHSLTX,1,20)
 S BSDXTMP=BSDXTMP_$$FILL^BSDX41(22-$L(BSDXTMP))_APCHSRDT
 S BSDXTMP=BSDXTMP_$$FILL^BSDX41(37-$L(BSDXTMP))_APCHSLTD
 S BSDXTMP=BSDXTMP_$$FILL^BSDX41(46-$L(BSDXTMP))_APCHSLR
 S BSDXTMP=BSDXTMP_$$FILL^BSDX41(59-$L(BSDXTMP))_$P($G(^AUPNVLAB(APCHSDFN,11)),U)
 I $P($G(^AUPNVLAB(APCHSDFN,11)),U,4)]""!($P($G(^AUPNVLAB(APCHSDFN,11)),U,5)]"") S BSDXTMP=BSDXTMP_$$FILL^BSDX41(69-$L(BSDXTMP))_$P(^AUPNVLAB(APCHSDFN,11),U,4)_"-"_$P(^AUPNVLAB(APCHSDFN,11),U,5)
 S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)=BSDXTMP_$C(30)
 I '$P(^APCHSCTL(APCHSTYP,0),U,7) Q
 ;print out comments per Dorothy
 S APCHSX=0 F  S APCHSX=$O(^AUPNVLAB(APCHSDFN,21,APCHSX)) Q:APCHSX'=+APCHSX!($D(APCHSQIT))  D
 .;X APCHSCKP Q:$D(APCHSQIT)
 .S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)=^AUPNVLAB(APCHSDFN,21,APCHSX,0)_$C(30)
 F APCHSX=1:1:3 Q:$D(APCHSQIT)  I $P($G(^AUPNVLAB(APCHSDFN,13)),U,APCHSX)]"" D
 .;X APCHSCKP Q:$D(APCHSQIT)
 .S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)=$P(^AUPNVLAB(APCHSDFN,13),U,APCHSX)_$C(30)
 Q
 ;
EKGLAB ;ENTRY POINT - EKG display in most recent lab panel
 Q:'$D(^AUPNVDXP("AC",APCHSPAT))
 K APCHS
 S APCHSERR=$$START1^APCLDF(APCHSPAT_"^LAST DIAGNOSTIC ECG SUMMARY","APCHS(")
 G:APCHSERR EKGLABX
 ; *array APCHS(1)="DATE^RESULT^DIAG PROC^VDIAG PROCEDURE IEN^AUPNVDXP^VISIT IEN"
 K APCHSERR
 S APCHSIVD=$S($D(APCHS(1)):9999999-$P($P(APCHS(1),U,1),".",1),1:"")
 Q:'APCHSIVD!(APCHSIVD>APCHSDLM)
 S (APCHSLTX,APCHSLT)="EKG"
 S APCHSLRT("EKG")=$P(APCHS(1),U,1)_"^"_$P(APCHS(1),U,2)
 D EKGPRT  ;                           computes/prints ekg info
EKGLABX ;
 K APCHSERR,APCHS(1)
 Q
 ;
EKGPRT ;computers/prints ekg info
 S Y=$P(APCHSLRT(APCHSLT),U,1) X APCHSCVD S APCHSLTD=Y
 S APCHSLR=$P(APCHSLRT(APCHSLT),U,2)
 S APCHSLR=$S(APCHSLR="N":"NORMAL",APCHSLR="A":"ABNORMAL",APCHSLR="B":"BORDERLINE",1:"<none recorded>") ;IHS/CMI/LAB added borderline
 S APCHSLW=$S($G(APCHSLW):APCHSLW,1:28)
 S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)=$C(30)
 S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)=APCHSLTX_$$FILL^BSDX41(APCHSLW-$L(APCHSLTX))_APCHSLTD_"  "_APCHSLR_$C(30)
 Q
 ;
MCIS ; *********** MANAGED CARE MIS * 90001
 ;X APCHSCKP Q:$D(APCHSQIT)
 S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)=$C(30)
 S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)=$C(30)
 NEW X
 S X="BMCHS" X ^%ZOSF("TEST") I $T G HS ; write mcis summary
 G:'$D(^BMCREF("D",APCHSPAT)) MCISX ; exit if no referrals for patient
 ;X APCHSCKP Q:$D(APCHSQIT)  X:'APCHSNPG APCHSBRK
 S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)="<MCIS DISPLAY ROUTINE MISSING!>"_$C(30)
MCISX ;MCIS EXIT
 ;
HS ;EP-called from health summary
 S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)=$$CTR^BMC(" <<<  RCIS ACTIVE REFERRALS  >>> ",80)_$C(30)
 I '$D(^BMCREF("AA",APCHSPAT)) D  Q
 .;X APCHSCKP Q:$D(APCHSQIT)
 .S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)=$C(30)
 .S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)="No Referred Care Referral records on file."_$C(30)
 .Q
 S X1=DT,X2=-365 D C^%DTC S BMCYAGO=X ;      date one year ago
 I $O(^BMCREF("AA",APCHSPAT,""),-1)<BMCYAGO D  Q
 .;X APCHSCKP Q:$D(APCHSQIT)
 .S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)=$C(30)
 .S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)="No Referred Care Referral records within last year."_$C(30)
 .Q
 S BMCRDATE=""
 F  S BMCRDATE=$O(^BMCREF("AA",APCHSPAT,BMCRDATE),-1) Q:BMCRDATE<BMCYAGO!($D(APCHSQIT))  S BMCRIEN=0 F  S BMCRIEN=$O(^BMCREF("AA",APCHSPAT,BMCRDATE,BMCRIEN)) Q:'BMCRIEN!($D(APCHSQIT))  D WRTREF
XIT ;
 K DIEN,BMCPFH,BMCPFS,BMCPIEN,BMCYAGO,BMCCHSCT,BMCDFN,BMCRDATE,BMCREC,BMCRIEN,BMCRIO,BMCRNUMB,BMCRREC,BMCRSTAT,BMCRTYPE,BMCX,BMCDIEN
 Q
 ;
WRTREF ; WRITE RCIS REFERRAL ENTRY
 S BMCRREC=^BMCREF(BMCRIEN,0)
 S Y=BMCRIEN
 D ^BMCREF
 ;
 Q:BMCRSTAT'="A"  ;Quit if Not an Active Referral
 ;
 S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)=$C(30)
 S BSDXTMP="BEGIN DOS: "_$$AVDOS^BMCRLU(BMCRIEN,"C")_"  "_$$AVDOS^BMCRLU(BMCRIEN,"E")
 S BSDXTMP=BSDXTMP_$$FILL^BSDX41(36-$L(BSDXTMP))_"DISCHARGE CONSULT DT: "_$$FMTE^XLFDT($P(BMCRREC,U,18),"5D")
 S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)=BSDXTMP_$C(30)
 S BSDXTMP=""
 S BSDXTMP="DATE REFERRED: "_$$FMTE^XLFDT($P(BMCRREC,U),"5D")
 S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)=BSDXTMP_$$FILL^BSDX41(36-$L(BSDXTMP))_"CHS STATUS: "_$$VAL^XBDIQ1(90001,BMCRIEN,1112)_$C(30)
 S BSDXTMP=""
 S BMCMCC=""
 I $D(^BMCPARM(DUZ(2),4100)) S BMCMCC=$P($G(^BMCPARM(DUZ(2),4100)),U)
 I BMCMCC="Y" S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)=$$FILL^BSDX41(36)_"MCC ACTION: "_$$VAL^XBDIQ1(90001,BMCRIEN,1123)_$C(30)
 S BSDXTMP="REFERRED BY: "_$S($P(BMCRREC,U,6):$E($P(^VA(200,$P(BMCRREC,U,6),0),U),1,22),1:"???")
 S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)=BSDXTMP_$$FILL^BSDX41(36-$L(BSDXTMP))_"REFERRED TO: "_$$TOFAC^BMC(BMCRIEN)_$C(30)
 S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)="PURPOSE: "_$$VAL^XBDIQ1(90001,BMCRIEN,1201)_$C(30)
 D WRTDXPX
 Q
 ;
WRTDXPX ; WRITE DX's and PX's
 D WRTDX
 Q:$D(APCHSQIT)
 D WRTPX
 Q
 ;
WRTDX ; WRITE DX'S FOR THIS REFERRAL
 I '$O(^BMCDX("AD",BMCRIEN,0)) D WRTCATD Q  ; no dx's so write category
 S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)="DIAGNOSES"_$C(30)
 ;X APCHSCKP Q:$D(APCHSQIT)
 S BMCPFS="F"
 D WRTDXLP ;                                          write finals
 I BMCRSTAT="A"!('BMCPFH) S BMCPFS="P" D WRTDXLP ;    write provisionals
 Q
 ;
WRTDXLP ; LOOP THRU DX ENTRIES
 S (BMCDIEN,BMCPFH)=0
 F  S BMCDIEN=$O(^BMCDX("AD",BMCRIEN,BMCDIEN)) Q:'BMCDIEN  D WRTDX2 Q:$D(APCHSQIT)
 Q
 ;
WRTDX2 ; WRITE ONE DX
 S X=^BMCDX(BMCDIEN,0)
 Q:$P(X,U,4)'=BMCPFS
 S BSDXTMP=$$FILL^BSDX41(9)_$P(^ICD9($P(X,U),0),U)
 S BSDXTMP=BSDXTMP_$$FILL^BSDX41(18-$L(BSDXTMP))_$S($P(X,U,4)="P":"PROV",$P(X,U,4)="F":"FINAL",1:"???")_" "_$S($P(X,U,5)="P":"PRI",$P(X,U,5)="S":"SEC",1:"???")
 S X=$P(X,U,6)
 I X S:$D(^AUTNPOV(X,0)) X=$P(^AUTNPOV(X,0),U) I 1
 E  D ENP^XBDIQ1(90001.01,BMCDIEN,".019","BMCX(","E") S:BMCX(".019")]"" X=BMCX(".019")
 S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)=BSDXTMP_$$FILL^BSDX41(26-$L(BSDXTMP))_X_$C(30)
 S BSDXTMP=""
 S BMCPFH=1
 ;X APCHSCKP
 Q
 ;
WRTPX ; WRITE PX'S FOR THIS REFERRAL
 I '$O(^BMCPX("AD",BMCRIEN,0)) D WRTCATS Q  ; no px's so write category
 S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)="PROCEDURES"_$C(30)
 ;X APCHSCKP Q:$D(APCHSQIT)
 S BMCPFS="F"
 D WRTPXLP ;                                         write finals
 I BMCRSTAT="A"!('BMCPFH) S BMCPFS="P" D WRTPXLP ;   write provisionals
 Q
 ;
WRTPXLP ; LOOP THRU PX ENTRIES
 S (BMCPIEN,BMCPFH)=0
 F  S BMCPIEN=$O(^BMCPX("AD",BMCRIEN,BMCPIEN)) Q:'BMCPIEN  D WRTPX2 Q:$D(APCHSQIT)
 Q
 ;
WRTPX2 ; WRITE ONE PX
 S X=^BMCPX(BMCPIEN,0)
 Q:$P(X,U,4)'=BMCPFS
 S BSDXTMP=$$FILL^BSDX41(9)_$S($P(X,U)'=1:$P(^ICPT($P(X,U),0),U),1:"???")
 S BSDXTMP=BSDXTMP_$$FILL^BSDX41(17-$L(BSDXTMP))_$S($P(X,U,4)="P":"PROV",$P(X,U,4)="F":"FINAL",1:"???")_" "_$S($P(X,U,5)="P":"PRI",$P(X,U,5)="S":"SEC",1:"???")
 S X=$P(X,U,6)
 I X S:$D(^AUTNPOV(X,0)) X=$P(^AUTNPOV(X,0),U) I 1
 E  D ENP^XBDIQ1(90001.02,BMCPIEN,".019","BMCX(","E") S:BMCX(".019")]"" X=BMCX(".019")
 S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)=BSDXTMP_$$FILL^BSDX41(26-$L(BSDXTMP))_X_$C(30)
 S BSDXTMP=""
 S BMCPFH=1
 ;X APCHSCKP
 Q
 ;
WRTCAT ; WRITE DX/SVC CAT
 D WRTCATD
 D WRTCATS
 Q
 ;
WRTCATD ; WRITE DX CAT
 D ENP^XBDIQ1(90001,BMCRIEN,".12","BMCX(","E") S X=BMCX(".12")
 S BSDXTMP="DIAGNOSTIC CATEGORY:"
 S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)=BSDXTMP_$$FILL^BSDX41(24-$L(BSDXTMP))_X_$C(30)
 S BSDXTMP=""
 ;X APCHSCKP Q:$D(APCHSQIT)
 Q
 ;
WRTCATS ; WRITE PX CAT
 Q  ;Remove from HS per Dr. Griffith 11-23-00
 D ENP^XBDIQ1(90001,BMCRIEN,".13","BMCX(","E") S X=BMCX(".13")
 S BSDXTMP="CPT SERVICE CATEGORY:"
 S BSDXI=BSDXI+1 S ^BSDXTMP($J,BSDXI)=BSDXTMP_$$FILL^BSDX41(24-$L(BSDXTMP))_X_$C(30)
 S BSDXTMP=""
 ;X APCHSCKP Q:$D(APCHSQIT)
 Q
