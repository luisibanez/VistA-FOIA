ONCOCOS ;Hines OIFO/GWB - COMPUTED FIELDS; 11/09/99
 ;;2.11;ONCOLOGY;**5,13,16,17,19,22,24,36,42**;Mar 07, 1995
 ;
CC ;CASE CLASS/Renamed Class of Case
 S X=$P(^ONCO(165.5,D0,0),U,4),X=$S(X=0:"Dx H,Rx Ew",X=1:"Dx,Rx Here",X=2:"Dx Ew,Rx H",X=3:"Dx,Tx Ew",X=4:"Before Ref Dt",X=5:"Autopsy",X=6:"Death Cert",1:"Unknown") Q
RSX ;COMBINED RACE & SEX
 ;RACE ONLY
 ;COMING FROM 165.5 with D0=primary
 D GT G EX:XD0="",EX:XP0=""
1 S X=$S(SX=1:"M",SX=2:"F",1:""),XRX=$S(RC=1:"White-"_X,RC=2:"Black-"_X,1:"Other-"_X),X=XRX G EX
 ;for Race and Sex data
SXR ;SEX-RACE
 D GT G EX:XD0="",EX:XP0=""
 S X=$S(RC=1:"WT",RC=2:"BK",1:"OT"),XRX=$S(SX=1:"Male-"_X,SX=2:"Female-"_X,1:""),X=XRX G EX
GT S XP0="",XD0=$S($D(^ONCO(165.5,D0,0)):$P(^(0),U,2),1:"") Q:XD0=""  Q:'$D(^ONCO(160,XD0,0))  S XP0=^(0),RC=+$P(XP0,U,6),SX=$P(XP0,U,8)
 Q
SSG ;AJCC SUMMARY STAGE GROUP (combined 0,I,II,III,IV,U)
G D SG Q:X=""  S X=+X,X=$S(X=0:0,X=1:"I",X=2:"II",X=3:"III",X=4:"IV",1:"U")
 Q
SSG1 ;AJCC SUMMARY STAGE GROUPI (I,IA,IB,IC)
 D SG S X=$S(+X=1:"I"_$E(X,2),1:"") G EX
SSG2 ;AJCC SUMMARY STAGE GROUP-II (II,IIA,IIB,IIC)
 D SG S X=$S(+X=2:"II"_$E(X,2),1:"") G EX
SSG3 ;AJCC SUMMARY STAGE GROUP-III (III,IIIA,IIIB)
 D SG S X=$S(+X=3:"III"_$E(X,2),1:"") G EX
SSG4 ;AJCC SUMMARY STAGE GROUP-IV (IV,IVA,IVB)
 D SG S X=$S(+X=4:"IV"_$E(X,2),1:"") G EX
SG S X=$S($D(^ONCO(165.5,D0,2)):$P(^(2),U,20),1:"")
 Q
 ;
TXS ;TREATMENT PLAN (165.5,42)
 S XD0=D0,XX=0
 F  S XX=$O(^ONCO(165.5,"ATX",XD0,XX)) Q:XX=""  D
 .I $E(XX,1,7)="0000000" Q
 .I $E(XX,1,7)=9999999 Q
 .S T=$E(XX,8,9)
 .I T["S",T'="S1" Q
 .I T["S",X["S" Q
 .S X=$S(X="":$E(XX,8),1:X_"/"_$E(XX,8))
 S X=$S(X="":"NONE",1:X)
 K XD0,XX,T
 Q
 ;
TX ;TREATMENT (165.5,43)
 S XD0=D0,XX=0
 F  S XX=$O(^ONCO(165.5,"ATX",XD0,XX)) Q:XX=""  D
 .I $E(XX,1,7)="0000000" Q
 .I $E(XX,1,7)=9999999 Q
 .S T=$E(XX,8,9)
 .I T["S",X["SUR" Q
 .S TX=$S(T="S1":"SUR",T="C":"CMX",T="R":"XRT",T="H":"HOR",T="B":"BRM",T="P":"CNS",T="N":"NTX",T="E":"HEM",T="O":"OTR",1:"XXX")
 .S:TX'="XXX" X=$S(X="":TX,1:X_"/"_TX)
 S X=$S(X="":"NONE",1:X)
 K XD0,XX,T,TX Q
 ;
GSS ;GENERAL SUMMARY STAGE 35.1
 S X=$P($G(^ONCO(165.5,D0,2)),U,17),X=$S(X="":X,X=0:"In Situ",X=1:"Local",X=2:"Reg Ext",X=3:"Reg Nodes",X=4:"Reg Ext/Nodes",X=5:"Reg NOS",X=7:"Dist Met/Sys",X=9:"Unst/Unk")
 Q
SICD ;SELECTED IDCO-SITE CODES for cross-tabs
 S X=$P(^ONCO(165.5,D0,0),U),X=$S(X=31:"LUNG",X=62:"LYMPH-H",X=63:"LYMPH-NH",X=54:"BLADDER",X=17:"COLON",X>65&(X<70):"LEUK",X=39:"MELANOMA",X=50:"PROSTATE",X=9:"ORAL CAV",1:"OTHER")
 Q
 S X=$P(^ONCO(165.5,D0,0),U),X=$S(X=63:"LYMPH-NH",1:"ALL OTHERS") G EX
 ;
MAJ ;MAJOR SITES
 Q
 ;
OSYS ;ICDO SYSTEMS-OLD
 S X=$P($G(^ONCO(165.5,D0,0)),U,22) Q:X=""
 S X=$S(X<150:40,X=161:40,X=160:40,X=193:90,X=191:90,X<160&(X>149):50,X>184&(X<190):85,X>169&(X<174):70,1:X)
 S X=$S(X=162:"LUNG",X=196:"LYMPH",X=40:"H&N",X=50:"GI",X=70:"MS",X=85:"GU",X=90:"ENDO",X=191!(X=192):"NS",1:"") Q:X'=""  S X=$P(^ONCO(165.5,D0,0),U),X=$S(X=63:"LYMPH-H",1:"OTH") Q
 ;
SYS ;SYSTEMS
 S X=$P(^ONCO(165.5,D0,0),U),X=$S(X=63:"LYMPH-NH",X=62:"LYMPH",1:"") Q:X'=""  S X=$P($G(^ONCO(165.5,D0,0)),U,22)
 Q:X=""  S X=$S(X<6715:"H&N",X<6726:"DS",X<6739:"RS",X<6747:"MS",(X>6751&(X<6768)):"GU",X=6747!(X>6769&(X<6772)):"NS",1:"OTH")
 Q
TRS ;VITAL STATUS/TUMOR STATUS
 S XD0=D0
 S XTS="."_$P($G(^ONCO(165.5,XD0,7)),U,6)_".",XTS=$S(".1.4."[XTS:"NO-Evidence",".2.5.6.7."[XTS:"CA-Evidence",1:"Unknown"),XD1=$P(^(0),U,2)
 S VS=$P($G(^ONCO(160,XD1,1)),U),VS=$S(VS=0:"Dead",1:"Alive")
 S STS=VS_"/"_XTS,X=STS G EX
EX ;EXIT ROUTINE
 K SG,XD0,XRC,XSX,XRSX,XX
 Q
