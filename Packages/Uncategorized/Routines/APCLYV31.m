APCLYV31 ; IHS/CMI/LAB - PRINT CLINIC VISITS (CALC) ; 
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;
 ;cmi/anch/maw 9/12/2007 code set versioning PV1,PV2,PRC
 ;
DGZCALL ;EP for DGZCALLS routine
 Q:'$D(APCLBD)!('$D(APCLED))
 I '$D(APCLCL) D
 .  K DIC S DIC=40.7,DIC(0)="M",X=44 D ^DIC
 .  I Y=-1 W !!,*7,"DAY SURGERY CODE 44 NOT IN CLINIC STOP FILE!",!! Q
 .  S APCLCL=+Y
 S:'$D(APCLICD) APCLICD=1
 S:'$D(APCLBICD) APCLBICD=""
 S:'$D(APCLEICD) APCLEICD=""
CALC ;find visits by date then store by patient name
 ;
 S APCLJOB=$J,APCLBT=$H
 D XTMP^APCLOSUT("APCLYV3","PCC LISTING OF CLINIC VISITS")
 S APCLVDT=APCLBD-.0001
VST S APCLVDT=$O(^AUPNVSIT("B",APCLVDT))
 G NEXT:APCLVDT="",NEXT:APCLVDT>(APCLED+.2359) S APCLVDFN=0
VST1 S APCLVDFN=$O(^AUPNVSIT("B",APCLVDT,APCLVDFN)) G VST:APCLVDFN=""
 ;
 G VST1:'$D(^AUPNVSIT(APCLVDFN,0)) S APCLSTR=^(0)
 G VST1:$P(APCLSTR,"^",11) ;screen out deleted visits
 G VST1:$$DEMO^APCLUTL($P(APCLSTR,U,5),$G(APCLDEMO))
 I APCLLOC]"",$P(APCLSTR,U,6)'=APCLLOC G VST1
 G VST1:"HDXEIO"[$P(APCLSTR,"^",7)
 G:$D(^APCLCNTL(4,11,"B",$P(APCLSTR,"^",3))) VST1
 I APCLPROV]"" S APCLFOUN=0 D PROV G:'APCLFOUN VST1
 I +APCLCL G VST1:$P(APCLSTR,"^",8)'=APCLCL
 I APCLCL="N" G VST1:$P(APCLSTR,"^",8)'=""
 S APCLCLX=$S(APCLCL=+APCLCL:APCLCL,1:$P(APCLSTR,"^",8))
 S:APCLCLX="" APCLCLX="E"
 S APCLFLG=$S(APCLICD=1:1,1:0) D POV:APCLICD=2,PRC:APCLICD=3
 G VST1:'APCLFLG
 ;
 S DFN=$P(APCLSTR,"^",5),APCLNAME=$P(^DPT(DFN,0),"^")
 S ^XTMP("APCLYV3",APCLJOB,APCLBT,APCLCLX,APCLNAME,DFN,APCLVDT,APCLVDFN)="" G VST1
 ;
NEXT ;
 S APCLET=$H
 Q
 ;
POV ;does visit have POV within selected range?
 S APCLPV=0
PV1 S APCLPV=$O(^AUPNVPOV("AD",APCLVDFN,APCLPV)) Q:APCLPV=""
 G PV1:'$D(^AUPNVPOV(APCLPV,0)) S X=$P(^(0),"^") G PV1:'$D(^ICD9(X,0))
 G PV2:APCLBICD["V",PV2:APCLBICD["E"
 ;I $P(^ICD9(X,0),"^")'<APCLBICD,($P(^ICD9(X,0),"^")'>APCLEICD) S APCLFLG=1 Q  ;cmi/anch/maw 9/12/2007 orig line
 I $P($$ICDDX^ICDCODE(X),"^",2)'<APCLBICD,($P($$ICDDX^ICDCODE(X),"^",2)'>APCLEICD) S APCLFLG=1 Q  ;cmi/anch/maw 9/12/2007 csv
 G PV1
PV2 ;I $P(^ICD9(X,0),"^")'["V"&($P(^ICD9(X,0),"^")'["E") G PV1  ;cmi/anch/maw 9/12/2007 orig line
 I $P($$ICDDX^ICDCODE(X),"^",2)'["V"&($P($$ICDDX^ICDCODE(X),"^",2)'["E") G PV1  ;cmi/anch/maw 9/12/2007 csv
 ;S Y=+$E($P(^ICD9(X,0),"^"),2,9)  ;cmi/anch/maw 9/12/2007 orig line
 S Y=+$E($P($$ICDDX^ICDCODE(X),"^",2),2,9)  ;cmi/anch/maw 9/12/2007 csv
 I Y'<$E(APCLBICD,2,9),(Y'>$E(APCLEICD,2,9)) S APCLFLG=1 Q
 G PV1
 ;
PRC ;does visit have procedure(s) within selected range?
 S APCLPRC=0
PRC1 S APCLPRC=$O(^AUPNVPRC("AD",APCLVDFN,APCLPRC)) Q:APCLPRC=""
 G PRC1:'$D(^AUPNVPRC(APCLPRC,0)) S X=$P(^(0),"^")
 G PRC1:'$D(^ICD0(X,0))
 ;I $P(^ICD0(X,0),"^")'<APCLBICD,($P(^ICD0(X,0),"^")'>APCLEICD) S APCLFLG=1 Q  ;cmi/anch/maw 9/12/2007 orig line
 I $P($$ICDOP^ICDCODE(X),"^",2)'<APCLBICD,($P($$ICDOP^ICDCODE(X),"^",2)'>APCLEICD) S APCLFLG=1 Q  ;cmi/anch/maw 9/12/2007 csv
 G PRC1
PROV ;check to see if provider is one of the providers
 NEW X S X=0 F  S X=$O(^AUPNVPRV("AD",APCLVDFN,X)) Q:X'=+X!(APCLFOUN)  I APCLPROV=$P(^AUPNVPRV(X,0),U) S APCLFOUN=1
 Q
