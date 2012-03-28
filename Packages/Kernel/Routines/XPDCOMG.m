XPDCOMG ;SFISC/RSD - compare globals ;07/15/2003  10:22 [ 03/19/2004  12:04 PM ]
 ;;8.0;KERNEL;**304,1009**;Jul 10, 1995
EN D FIA,KRN
 Q
FIA N DIC,OLDA,XPDFIL,XPDFILO,XPDFILS,XPDS,XPDS0,XPDX,XPDX0,XPDY,XPDY1,XPDZ,XPDZ1,X,Y
 S XPDFIL=0
 F  S XPDFIL=$O(^XTMP("XPDI",XPDA,"FIA",XPDFIL)) Q:'XPDFIL  S XPDZ1=^(XPDFIL,0),XPDFILO=^(0,1) D
 .I '$D(^DIC(XPDFIL)) W !!," File # ",XPDFIL," is NEW",! Q
 .S XPDZ="^XTMP(""XPDI"","_XPDA
 .I $P(XPDFILO,U)="y" D
 ..W !!," File # ",XPDFIL," Data Dictionary ",!
 ..S XPDY=XPDZ_",""^DIC"","_XPDFIL_","_XPDFIL_",0",XPDX=XPDY_")",XPDY=XPDY_",",XPDY1="^DIC("_XPDFIL_",0",XPDS=XPDY1_")",XPDY1=XPDY1_","
 ..D COMPAR(1)
 ..S XPDFILS=0 F  S XPDFILS=$O(^XTMP("XPDI",XPDA,"^DD",XPDFIL,XPDFILS)) Q:'XPDFILS  D
 ...S XPDY=XPDZ_",""^DD"","_XPDFIL_","_XPDFILS,XPDX=XPDY_")",XPDY=XPDY_",",XPDY1="^DD("_XPDFILS,XPDS=XPDY1_")",XPDY1=XPDY1_","
 ...D COMPAR(1)
 .Q:'$D(^XTMP("XPDI",XPDA,"DATA",XPDFIL))
 .W !!," File # ",XPDFIL," Data ",!
 .K DIC
 .S DIC=XPDFIL,DIC(0)="X",XPDZ=XPDZ_",""DATA"","_XPDFIL,OLDA=0
 .F  S OLDA=$O(^XTMP("XPDI",XPDA,"DATA",XPDFIL,OLDA)) Q:'OLDA  S OLDA(0)=^(OLDA,0) D
 ..S X=$P(OLDA(0),U) D ^DIC
 ..I Y<0 W !,X," will be ADDED " Q
 ..S XPDY=XPDZ_","_OLDA_",",XPDX=XPDZ_","_OLDA_")",XPDY1=XPDZ1_+Y_",",XPDS=XPDZ1_+Y_")"
 ..D COMPAR(0)
 W !! Q
KRN N DEL,DIC,OLDA,ORD,X,XPDFIL,XPDFILNM,XPDI,XPDS,XPDS0,XPDX,XPDX0,XPDY,XPDY1,XPDZ,XPDZ1,Y
 S ORD=0
 F  S ORD=$O(^XTMP("XPDI",XPDA,"ORD",ORD)) Q:'ORD  S XPDFIL=+$O(^(ORD,0)),XPDFILNM=$G(^(XPDFIL,0)) D:XPDFIL
 .I $P($G(^DIC(XPDFIL,0)),U)'=XPDFILNM W !!," File "_XPDFIL_" is not "_XPDFILNM_", nothing can be installed.",! Q
 .W !!,XPDFILNM,! K DIC
 .S DIC=XPDFIL,DIC(0)="X",XPDZ="^XTMP(""XPDI"","_XPDA_",""KRN"","_XPDFIL_",",XPDZ1=^DIC(XPDFIL,0,"GL"),OLDA=0
 .F  S OLDA=$O(^XTMP("XPDI",XPDA,"KRN",XPDFIL,OLDA)) Q:'OLDA  S DEL=+$G(^(OLDA,-1)),OLDA(0)=^(0) D
 ..I XPDFIL<.44 S DIC("S")="I $P(^(0),U,"_$S(XPDFIL'=.403:"4)",1:"8)")_"="_$P(OLDA(0),U,$S(XPDFIL'=.403:4,1:8))
 ..I DEL=1,XPDFIL<.44 S %=$P(OLDA(0),U),$P(OLDA(0),U)=$P(%,"    FILE #"),DIC("S")="I $P(^(0),U,"_$S(XPDFIL'=.403:4,1:8)_")="_+$P(%,"    FILE #",2)
 ..S X=$P(OLDA(0),U) D ^DIC
 ..I Y<0,DEL'=1 W !,XPDFILNM,": ",X," will be ADDED " Q
 ..I DEL=1 W:Y>0 !,XPDFILNM,": ",X," will be DELETED " Q
 ..S XPDY=XPDZ_OLDA_",",XPDX=XPDZ_OLDA_",-1)",XPDY1=XPDZ1_+Y_",",XPDS=XPDZ1_+Y_")" D COMPAR(0)
 Q
 ;taken from XTVGC2 routine
COMPAR(XPDFL) S XPDFL=$G(XPDFL)
 N XPDS1,XPDX1
 F  D  Q:XPDX=""&(XPDS="")
 .S XPDX0=$$QU(.XPDX,XPDY),XPDX1=$P(XPDX,XPDY,2)
 .S XPDS0=$$QU(.XPDS,XPDY1),XPDS1=$P(XPDS,XPDY1,2) Q:XPDX=""&(XPDS="")
 .D CHECK
 Q
CHECK N FL,I,X1,X1,S1,S2
CHK1 I XPDX="" W:'XPDFL !,"* DEL *   ",XPDS," = ",XPDS0 Q
 I XPDS="" W !,"* ADD *   ",XPDY1_XPDX1," = ",XPDX0 Q
 S FL=$S(XPDX1=XPDS1:0,1:1)
 I FL S X1=$E(XPDX1,1,$L(XPDX1)-1),S1=$E(XPDS1,1,$L(XPDS1)-1) D
 .F I=1:1 S X2=$P(X1,",",I),S2=$P(S1,",",I) I X2'=S2 S FL=$S(+X2=X2:$S(+S2'=S2:1,X2<S2:1,1:-1),+S2=S2:-1,S2]X2:1,1:-1) Q
 I FL<0 W:'XPDFL !,"* DEL *   ",XPDS," = ",XPDS0 S XPDS0=$$QU(.XPDS,XPDY1),XPDS1=$P(XPDS,XPDY1,2) G CHK1
 I FL>0 W !,"* ADD *   ",XPDY1_XPDX1," = ",XPDX0 S XPDX0=$$QU(.XPDX,XPDY),XPDX1=$P(XPDX,XPDY,2) G CHK1
 I XPDX0'=XPDS0 W !,"* OLD *   ",XPDS," = ",XPDS0,!,"* NEW *   ",XPDY1_XPDX1," = ",XPDX0
 Q
QU(X,Y) ;X=gr, Y=root
 Q:$G(X)="" ""
 S X=$Q(@X)
 I X=""!(X'[$G(Y)) S X="" Q ""
 Q @X
