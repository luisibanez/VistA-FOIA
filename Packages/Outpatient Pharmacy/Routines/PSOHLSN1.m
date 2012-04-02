PSOHLSN1 ;BIR/RTR-Send order info to OERR from file 52 ;22-Jun-2011 17:27;PLS
 ;;7.0;OUTPATIENT PHARMACY;**1,10,24,27,55,46,71,101,99,121,139,157,1005,1011**;DEC 1997;Build 17
 ;Reference #50.606-DBIA 2174
 ;Reference #50.607-DBIA 2221
 ;Reference #50.7-DBIA 2223
 ;Reference #51.2-DBIA 2226
 ;Reference #50-DBIA 221
 ;Reference ^PSNDF-DBIA 2195
 ;Reference EN^PSSUTIL1-DBIA 3179
 ; Modified - IHS/CIA/PLS - 08/02/2004 - Line SKIP+5
 ;            IHS/MSC/PLS - 06/22/2011 - Line ZRX+8
EN(PSRXIEN,STAT,PSSTAT,COMM,PSNOO) ;
 N COUNT,DFN,J,LIMIT,NAME,NULLFLDS,PSDIEN,PSFLAG,PSND1,PSND2,PSND3,PRODUCT,UNIT,POIPTR,PSOHINST,PODOSE,PODOSENM,PSROUTE,RTNAME,SEGMENT,CCC,BBB,CSCOUNT,PPTR,MSG,PSOHSTRT,PSOHSTOP,PSOHISSD,PSORTLP,ZRXFLAG,RXE2FLAG,RXE2ONLY,PSODFN,EDUZ
 N PSOCDDUZ,DA,FSIG,BSIG,PSHRX,PSHORX,PSNOOTX,ZPRE,PSOZSTAT,CCCX,PSOCPS
 K FIELD
 I $G(STAT)="" Q
 I STAT="CR"!(STAT="DR")!(STAT="HR")!(STAT="OC")!(STAT="OD")!(STAT="OH")!(STAT="Z@")!(STAT="RP") S PSOZSTAT=STAT D DELP^PSOHLSN S STAT=PSOZSTAT G SKIP
 I STAT="SC" I $G(PSSTAT)="ZE"!($G(PSSTAT)="HD")!($G(PSSTAT)="DC") S PSOZSTAT=STAT D DELP^PSOHLSN S STAT=PSOZSTAT
SKIP ;
 I $G(STAT)="SC",$G(PSSTAT)="ZE",$P($G(^PSRX(+$G(PSRXIEN),0)),"^",19)=2 Q
 I $G(STAT)="RP" S STAT="OD",PSSTAT="RP"
 S COUNT=0,NULLFLDS="F JJ=0:1:LIMIT S FIELD(JJ)="""""
 I '$D(^PSRX(PSRXIEN,0)) Q
 ;IHS/CIA/PLS - 08/02/2004 - PCC requires event to be fired regardless of whether a linked order exists.
 ; CPRS screens these out anyway, so no impact on receiver.
 ; Next line commented out to pass all events to receivers.
 ;I STAT'="SN",STAT'="ZC",'$P($G(^PSRX(PSRXIEN,"OR1")),"^",2) Q
 I $G(STAT)="SC",$G(PSSTAT)="ZE" S $P(^PSRX(PSRXIEN,0),"^",19)=2
 D INIT
 S COUNT=1,(ZRXFLAG,RXE2FLAG,RXE2ONLY)=0 D PID,PV1,ORC
 I $G(STAT)="Z@" G NCM
 I $G(STAT)="OK"!($G(STAT)="SN")!($G(STAT)="ZC")!($G(STAT)="XX")!($G(STAT)="SC")!($G(STAT)="RO") D RXO,RXE,RXR,ZRX,ZSC G NCM
 I $G(STAT)="SC",$G(PSSTAT)="CM" D RXO,RXE,RXR,ZRX,ZSC
 I '$G(RXE2FLAG) S RXE2ONLY=1 D RXE,SEGPARX^PSOHLSN
 I '$G(ZRXFLAG) D ZRX
NCM D SEND
 K PSRXIEN Q
INIT K ^UTILITY("DIQ1",$J),DIQ S DA=$P($$SITE^VASITE(),"^") I $G(DA) S DIC=4,DIQ(0)="I",DR="99" D EN^DIQ1 S PSOHINST=$G(^UTILITY("DIQ1",$J,4,DA,99,"I")) K ^UTILITY("DIQ1",$J),DA,DR,DIQ,DIC
 S MSG(1)="MSH|^~\&|PHARMACY|"_$G(PSOHINST)_"|||||"_$S($G(PSOMSORR):"ORR",1:"ORM")
 Q
PID S LIMIT=5 X NULLFLDS
 S DFN=+$P(^PSRX(PSRXIEN,0),"^",2) D DEM^VADPT S NAME=$G(VADM(1)) K VADM
 S FIELD(0)="PID"
 S FIELD(3)=DFN
 S FIELD(5)=NAME
 D SEG Q
PV1 ;
 S LIMIT=19 X NULLFLDS
 S FIELD(0)="PV1"
 S FIELD(2)="O"
 S:$P(^PSRX(PSRXIEN,0),"^",5) FIELD(3)=$P(^(0),"^",5)
 D SEG Q
ORC ;
 S LIMIT=15 X NULLFLDS
 S FIELD(0)="ORC"
 S FIELD(1)=$G(STAT)
 I $G(STAT)'="SN",$G(STAT)'="ZC" S FIELD(2)=$P($G(^PSRX(PSRXIEN,"OR1")),"^",2)
 S:FIELD(2)'="" FIELD(2)=FIELD(2)_$S($G(PLACERXX):";"_PLACERXX,1:"")_"^OR"
 S FIELD(3)=PSRXIEN_"^PS"
 S FIELD(5)=$G(PSSTAT)
 I $G(STAT)="RO",$G(PSOROPCH)'="PATCH" S FIELD(5)="CM"
 I $G(FIELD(5))="" I $G(STAT)="OR"!($G(STAT)="OE") S FIELD(5)="CM"
 S X=$P($G(^PSRX(PSRXIEN,2)),"^") I X S FIELD(9)=$$FMTHL7^XLFDT(X)
 S EDUZ=$P($G(^PSRX(PSRXIEN,0)),"^",16) I EDUZ S FIELD(10)=EDUZ_"^"_$P($G(^VA(200,EDUZ,0)),"^")
 I $G(PSOCANRC),$G(PSOCANRN)'="" I $G(STAT)="OD"!($G(STAT)="OC") S FIELD(12)=$G(PSOCANRC)_"^"_$G(PSOCANRN)
 I '$G(FIELD(12)) S FIELD(12)=$P($G(^PSRX(PSRXIEN,0)),"^",4)_"^"_$P($G(^VA(200,+$P($G(^PSRX(PSRXIEN,0)),"^",4),0)),"^")
 S PSOHISSD="",X=$P($G(^PSRX(PSRXIEN,0)),"^",13) I X S PSOHISSD=$$FMTHL7^XLFDT(X)
 S FIELD(15)=$G(PSOHISSD) K X
 D SEG
 I $G(COMM)'=""!($G(PSNOO)'="") D
 .I $G(PSNOO)'="" D NOO
 .I $L($G(COMM))+($L(MSG(COUNT)))+($L($G(PSNOOTX)))+($S($G(PSNOO)'="":11,1:5))<245 S MSG(COUNT)=MSG(COUNT)_"|"_$G(PSNOO)_"^"_$G(PSNOOTX)_"^"_$S($G(PSNOO)'="":"99ORN",1:"")_"^^"_$G(COMM)_"^" Q
 .S MSG(COUNT,1)="|"_$G(PSNOO)_"^"_$G(PSNOOTX)_"^"_$S($G(PSNOO)'="":"99ORN",1:"")_"^^"_$G(COMM)_"^"
 Q
RXO ;
 S LIMIT=1 X NULLFLDS
 S FIELD(0)="RXO"
 S PPTR=+$P($G(^PSRX(PSRXIEN,"OR1")),"^")
 S FIELD(1)=$S('PPTR:"^^^^^",1:"^^^"_PPTR_"^"_$P($G(^PS(50.7,PPTR,0)),"^")_" "_$P($G(^PS(50.606,+$P($G(^(0)),"^",2),0)),"^")_"^99PSP")
 D SEG Q
 ;
RXE ;
 S RXE2FLAG=1
 S LIMIT=$S('$G(RXE2ONLY):26,1:2) X NULLFLDS
 S FIELD(0)="RXE"
 S (PSOHSTRT,PSOHSTOP)="" S X=$P($G(^PSRX(PSRXIEN,2)),"^",2) I X S PSOHSTRT=$$FMTHL7^XLFDT(X)
 I '$G(DT) S DT=$$DT^XLFDT
 S X=$S($P($G(^PSRX(PSRXIEN,3)),"^",5):$P($G(^(3)),"^",5),$G(STAT)="OD"!($G(STAT)="OC"):$G(DT),$P($G(^(2)),"^",6):$P($G(^(2)),"^",6),1:$G(DT)) I X S PSOHSTOP=$$FMTHL7^XLFDT(X)
 K X N PSOMZT,MMZZ,MMZZT S MMZZT=1 F MMZZ=0:0 S MMZZ=$O(^PSRX(PSRXIEN,6,MMZZ)) Q:'MMZZ  D:$D(^(MMZZ,0))
 .S FIELD(1,MMZZT)=$S($P($G(^PSRX(PSRXIEN,6,MMZZ,0)),"^",2):$P($G(^(0)),"^")_"&"_$P($G(^PS(50.607,+$P($G(^(0)),"^",3),0)),"^")_"&"_$P($G(^PSRX(PSRXIEN,6,MMZZ,0)),"^",2)_"&"_$P($G(^(0)),"^",4),1:"")_"^"_$P($G(^(0)),"^",8)
 .I $P($G(FIELD(1,MMZZT)),"^")'="" F PSOMZT=1,3 I $E($P(FIELD(1,MMZZT),"&",PSOMZT),1)="." S $P(FIELD(1,MMZZT),"&",PSOMZT)="0"_$P(FIELD(1,MMZZT),"&",PSOMZT)
 .S FIELD(1,MMZZT)=$G(FIELD(1,MMZZT))_"^"_$$DUR(PSRXIEN,MMZZ)_"^^^^^"_$S($P($G(FIELD(1,MMZZT)),"^")'="":$P($G(FIELD(1,MMZZT)),"&")_$P($G(FIELD(1,MMZZT)),"&",2),1:$P($G(^PSRX(PSRXIEN,6,MMZZ,0)),"^"))
 .S FIELD(1,MMZZT)=$G(FIELD(1,MMZZT))_"^"_$P($G(^PSRX(PSRXIEN,6,MMZZ,0)),"^",6)
 .I $O(^PSRX(PSRXIEN,6,MMZZ)) S FIELD(1,MMZZT)=$G(FIELD(1,MMZZT))_"~"
 .S MMZZT=MMZZT+1
 S $P(FIELD(1,1),"^",4)=$G(PSOHSTRT),$P(FIELD(1,1),"^",5)=$G(PSOHSTOP)
 S PSFLAG=0,PSDIEN=+$P(^PSRX(PSRXIEN,0),"^",6),PSND1=$P($G(^PSDRUG(PSDIEN,"ND")),"^"),PSND2=$P($G(^("ND")),"^",2),PSND3=$P($G(^("ND")),"^",3) I PSND1,PSND3 S PSFLAG=1
 S FIELD(2)=$S(PSFLAG:PSND1_"."_PSND3_"^"_PSND2_"^"_"99NDF",1:"^^")_"^"_PSDIEN_"^"_$P($G(^PSDRUG(PSDIEN,0)),"^")_"^"_"99PSD"
 Q:$G(RXE2ONLY)
 I PSFLAG D
 .I $T(^PSNAPIS)]"" S PSOXN=$$DFSU^PSNAPIS(PSND1,PSND3) S FIELD(5)="^^^"_$P($G(PSOXN),"^",5)_"^"_$P($G(PSOXN),"^",6)_"^"_"99PSU" K PSOXN Q
 .S PRODUCT=$G(^PSNDF(PSND1,5,PSND3,0)) S UNIT=$P($G(^PSNDF(PSND1,2,+$P(PRODUCT,"^",2),3,+$P(PRODUCT,"^",3),4,+$P(PRODUCT,"^",4),0)),"^")
 .S FIELD(5)="^^^"_UNIT_"^"_$P($G(^PS(50.607,+UNIT,0)),"^")_"^"_"99PSU"
 S POIPTR=$P($G(^PSRX(PSRXIEN,"OR1")),"^") I POIPTR S PODOSE=$P($G(^PS(50.7,POIPTR,0)),"^",2),PODOSENM=$P($G(^PS(50.606,+PODOSE,0)),"^")
 I POIPTR S FIELD(6)="^^^"_$G(PODOSE)_"^"_$G(PODOSENM)_"^"_"99PSF"
 S FIELD(10)=$P(^PSRX(PSRXIEN,0),"^",7)
 S FIELD(12)=$P(^PSRX(PSRXIEN,0),"^",9)
 S FIELD(14)=$P(^PSRX(PSRXIEN,0),"^",4)
 S FIELD(15)=$P(^PSRX(PSRXIEN,0),"^")
 S FIELD(22)=$P(^PSRX(PSRXIEN,0),"^",8)
 K MMZZ S MMZZ=$$EN^PSSUTIL1(PSDIEN) S FIELD(25)=$S($E($P(MMZZ,"|"),1)=".":"0",1:"")_$P(MMZZ,"|"),FIELD(26)=$P(MMZZ,"|",2)
 N PLIM,PVAR,PVAR1,SUBCOUNT D SEGPARX^PSOHLSN
 ;
 I $O(^PSRX(PSRXIEN,"PRC",0)) D
 .S COUNT=COUNT+1,CCC=$O(^PSRX(PSRXIEN,"PRC",0))
 .S MSG(COUNT)="NTE|6||"_$G(^PSRX(PSRXIEN,"PRC",CCC,0))
 .S CSCOUNT=1 F CCC=CCC:0 S CCC=$O(^PSRX(PSRXIEN,"PRC",CCC)) Q:'CCC  S MSG(COUNT,CSCOUNT)=$G(^PSRX(PSRXIEN,"PRC",CCC,0)),CSCOUNT=CSCOUNT+1
 I $O(^PSRX(PSRXIEN,"INS1",0)) D
 .S COUNT=COUNT+1,CCC=$O(^PSRX(PSRXIEN,"INS1",0))
 .S MSG(COUNT)="NTE|7|L|"_$G(^PSRX(PSRXIEN,"INS1",CCC,0))
 .S CCCX=1 F CCC=CCC:0 S CCC=$O(^PSRX(PSRXIEN,"INS1",CCC,0)) Q:'CCC  I $D(^(0)) S MSG(COUNT,CCCX)=$G(^(0)) S CCCX=CCCX+1
 S COUNT=COUNT+1
 I $P($G(^PSRX(PSRXIEN,"SIG")),"^",2) D  Q
 .D FSIG^PSOUTLA("R",PSRXIEN,238) S MSG(COUNT)="NTE|21||"_$S($G(FSIG(1))'="":$G(FSIG(1)),1:"No SIG available") I $O(FSIG(1)) F CCC=1:0 S CCC=$O(FSIG(CCC)) Q:'CCC  S MSG(COUNT,(CCC-1))=$G(FSIG(CCC))
 I '$P($G(^PSRX(PSRXIEN,"SIG")),"^",2) D  Q
 .D EN3^PSOUTLA1(PSRXIEN,238) S MSG(COUNT)="NTE|21||"_$S($G(BSIG(1))'="":$G(BSIG(1)),1:"No SIG available") I $O(BSIG(1)) F CCC=1:0 S CCC=$O(BSIG(CCC)) Q:'CCC  S MSG(COUNT,(CCC-1))=$G(BSIG(CCC))
 Q
 ;
RXR ;
 F PSORTLP=0:0 S PSORTLP=$O(^PSRX(PSRXIEN,6,PSORTLP)) Q:'PSORTLP  D
 .S LIMIT=1 X NULLFLDS
 .S FIELD(0)="RXR"
 .S PSROUTE=$P($G(^PSRX(PSRXIEN,6,PSORTLP,0)),"^",7) I PSROUTE,$D(^PS(51.2,PSROUTE,0))  S RTNAME=$P(^PS(51.2,PSROUTE,0),"^")
 .S FIELD(1)="^^^"_$G(PSROUTE)_"^"_$G(RTNAME)_"^"_"99PSR"
 .D SEG
 Q
ZSC S PSOCPS=$$DT^PSOMLLDT S LIMIT=$S($G(PSOCPS):6,1:1) X NULLFLDS
 S FIELD(0)="ZSC"
 I '$G(PSOCPS) S FIELD(1)=$S($P($G(^PSRX(PSRXIEN,"IB")),"^"):"NSC",1:"SC")
 I $G(PSOCPS) D
 .S FIELD(1)=$P($G(^PSRX(PSRXIEN,"IBQ")),"^"),FIELD(2)=$P($G(^("IBQ")),"^",2),FIELD(3)=$P($G(^("IBQ")),"^",3),FIELD(4)=$P($G(^("IBQ")),"^",4),FIELD(5)=$P($G(^("IBQ")),"^",5),FIELD(6)=$P($G(^("IBQ")),"^",6),FIELD(7)=$P($G(^("IBQ")),"^",7)
 D SEG Q
ZRX ;
 S ZRXFLAG=1
 S LIMIT=6 X NULLFLDS
 S FIELD(0)="ZRX"
 S ZPRE=$P($G(^PSRX(PSRXIEN,"OR1")),"^",3) I ZPRE S FIELD(1)=$P($G(^PSRX(ZPRE,"OR1")),"^",2)
 I '$G(FIELD(1)),$G(PSORDEDT) S FIELD(1)=$P($G(^PS(52.41,$G(PSORDEDT),0)),"^")
 S FIELD(2)=$G(PSNOO)
 I $G(STAT)="SN"!($G(STAT)="RO") S FIELD(3)=$S($G(STAT)="RO"!($G(PSOEDIT)):"E",$G(PSOOPT)=3:"R",1:"N")
 ;IHS/MSC/PLS - 06/21/2011
 ;S FIELD(4)=$P(^PSRX(PSRXIEN,0),"^",11)
 I +$P($G(^PSRX(PSRXIEN,999999921)),U,3) D  ;autofinished
 .N PLACER
 .S PLACER=+$P($G(^PSRX(PSRXIEN,"OR1")),U,2)
 .I PLACER D
 ..S FIELD(4)=$$VALUE^ORCSAVE2(PLACER,"PICKUP")
 .E  S FIELD(4)=$P(^PSRX(PSRXIEN,0),"^",11)
 E  S FIELD(4)=$P(^PSRX(PSRXIEN,0),"^",11)
 S PSOCDDUZ=$S($G(PSOROPCH)="PATCH":$P($G(^PSRX(PSRXIEN,"OR1")),"^",5),$G(PSOHUIOR)&($P($G(^PSRX(PSRXIEN,"EXT")),"^")'=""):+$G(PSOCANRC),1:$G(DUZ))
 I $G(PSOCDDUZ) S FIELD(5)=PSOCDDUZ_"^"_$P($G(^VA(200,PSOCDDUZ,0)),"^")_"^"_"99NP"
 I $G(STAT)="ZD",$G(PSODISPP) S FIELD(6)="P"
 D SEG Q
SEG S SEGMENT="" F J=0:1:LIMIT S SEGMENT=$S(SEGMENT="":FIELD(J),1:SEGMENT_"|"_FIELD(J))
 S COUNT=COUNT+1,MSG(COUNT)=SEGMENT
 Q
SEND K FIELD D MSG^XQOR("PS EVSEND OR",.MSG) Q
 ;
NOO ;
 I $G(PSNOO)="" S PSNOOTX="" Q
 S PSNOOTX=$S(PSNOO="W":"Written",PSNOO="V":"Verbal",PSNOO="P":"Telephoned",PSNOO="S":"Service Correction",PSNOO="X":"Rejected",PSNOO="D":"Duplicate",PSNOO="I":"Policy",PSNOO="E":"Physician Entered",PSNOO="A":"Auto DC",1:"") Q
 Q
 ;
DUR(PSODX1,PSODX2) ;
 N PSODX,PSODX4,PSODX5,PSODX6,PSODX7 S PSODX=$P($G(^PSRX(PSODX1,6,PSODX2,0)),"^",5)
 I 'PSODX Q PSODX
 S PSODX4=$L(PSODX),PSODX5=$E(PSODX,PSODX4)
 S PSODX=$S(PSODX5?1A:PSODX,1:PSODX_"D")
 S PSODX6=$L(PSODX)
 S PSODX7=$E(PSODX,PSODX6)_$E(PSODX,1,(PSODX6-1))
 Q PSODX7
 Q
