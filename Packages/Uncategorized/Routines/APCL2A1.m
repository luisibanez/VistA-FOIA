APCL2A1 ; IHS/CMI/LAB - Process APC 1A report ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;CMI/TUCSON/LAB fixed FY patch 3
 ;IHS/CMI/LAB - FILE 200 CHECK
START ;
 S APCLBT=$H,APCLJOB=$J
 K ^XTMP("APCL2A",APCLJOB,APCLBT)
 D XTMP^APCLOSUT("APCL2A","PCC 1A REPORT")
 ;beginning Y2K fix
 ;S X1=APCLFY,X2=-1 D C^%DTC S APCLSD=X S X1=APCLFY,X2=365 D C^%DTC S APCLFYE=$E(X,1,3)_"0930" ;Y2000
 ;end Y2K
V ; Run by visit date
 S APCLGRAN=0
 S X=0 F  S X=$O(APCLLOCS(X)) Q:X'=+X  S APCLGRAN(X)=0
 S APCLSD=APCLSD_".9999" F  S APCLSD=$O(^AUPNVSIT("B",APCLSD)) Q:APCLSD=""!((APCLSD\1)>APCLFYE)  D V1
 ;
XIT ;
 D EOJ
 S APCLET=$H
 Q
V1 ;
 S APCLVDFN="" F  S APCLVDFN=$O(^AUPNVSIT("B",APCLSD,APCLVDFN)) Q:APCLVDFN'=+APCLVDFN  I $D(^AUPNVSIT(APCLVDFN,0)) S APCLVREC=^(0) D PROC,EOJ
 Q
PROC ;
 S DFN=$P(APCLVREC,U,5)
 Q:$$DEMO^APCLUTL(DFN,$G(APCLDEMO))
 ;I APCLLOC]"",APCLLOC'=$P(APCLVREC,U,6) Q
 Q:$P(APCLVREC,U,6)=""
 I $D(APCLLOCS),'$D(APCLLOCS($P(APCLVREC,U,6))) Q
 S APCLVLOC=$P(APCLVREC,U,6)
 Q:'$$APCWL^APCLV(APCLVDFN)  ;no wl reportable
 ;Q:$$PRIMPOV^APCLV(APCLVDFN,"C")=".9999"
 S APCLCLIN=$P(APCLVREC,U,8) S APCLCLN=$S(APCLCLIN:$P(^DIC(40.7,APCLCLIN,0),U,2),1:25)
 I APCLCLN=56,$D(^AUPNVMED("AD",APCLVDFN)) S APCLDPTR=$O(^DIC(7,"D","09",0)) I 1
 E  S APCLDPTR=$$PRIMPROV^APCLV(APCLVDFN,"F")
 I APCLDPTR="" S APCLDPTR="??"
 S APCLMOS=+$E(APCLSD,4,5)
 S ^(APCLMOS)=$S($D(^XTMP("APCL2A",APCLJOB,APCLBT,APCLVLOC,"MODISC",$$PDC(APCLDPTR),APCLDPTR,APCLMOS)):^(APCLMOS)+1,1:1)
 S ^(APCLDPTR)=$S($D(^XTMP("APCL2A",APCLJOB,APCLBT,APCLVLOC,"DISCTOT",$$PDC(APCLDPTR),APCLDPTR)):^(APCLDPTR)+1,1:1)
 S APCLGRAN(APCLVLOC)=APCLGRAN(APCLVLOC)+1
 I $P($G(^AUPNVSIT(APCLVDFN,11)),U,6)="" D
 .S ^("NO EXPORT")=$S($D(^XTMP("APCL2A",APCLJOB,APCLBT,APCLVLOC,"NO EXPORT")):^("NO EXPORT")+1,1:1)
 .I $D(^AUPNVSIT("ADWO",$P(APCLVREC,U,2),APCLVDFN)) S ^("IN XREF")=$S($D(^XTMP("APCL2A",APCLJOB,APCLBT,APCLVLOC,"IN XREF")):^("IN XREF")+1,1:1) Q
 .I $D(^AUPNVSIT("ADWO",$P($P(APCLVREC,U,13),"."),APCLVDFN)) S ^("IN XREF")=$S($D(^XTMP("APCL2A",APCLJOB,APCLBT,APCLVLOC,"IN XREF")):^("IN XREF")+1,1:1) Q
 ;TABLE VISITS AND COUNT DUPLICATES BY PATIENT,DATE,CLINIC
 ;S Q=$$PRIMPROV^APCLV(APCLVDFN,"I")
 ;Q:Q=""
 ;I $D(^XTMP("APCL2A",APCLJOB,APCLBT,APCLVLOC,DFN,$P($P(APCLVREC,U),"."),APCLCLN,Q)) S ^("DUPLICATE")=$S($D(^XTMP("APCL2A",APCLJOB,APCLBT,APCLVLOC,"DUPLICATE")):^("DUPLICATE")+1,1:1)
 ;E  S ^XTMP("APCL2A",APCLJOB,APCLBT,APCLVLOC,DFN,$P($P(APCLVREC,U),"."),APCLCLN,Q)=""
 Q
PDC(D) ;
 I $G(D)="" Q ""
 I D="??" Q "ZZ"
 I '$D(^DIC(7,D,9999999)) Q "ZZ"
 S D=$P(^DIC(7,D,9999999),U)
 I D="" Q "ZZ"
 I $E(D)="0" S D=+D
 Q D
 ;
EOJ K APCLVLOC,APCLVREC,APCLCLIN,APCLSKIP,APCL1,APCL2,APCLAP,APCLDISC,APCLDPTR,APCLLOCC,APCLCLN
 K X,X1,X2
 Q
 ;
 ;
