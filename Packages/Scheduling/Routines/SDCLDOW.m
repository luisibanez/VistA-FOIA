SDCLDOW ;ALB/TMP - PRINT LIST OF CLINICS BY DAY OF WEEK ; 22 MAR 1999  2:22 pm [ 07/31/2001  12:32 PM ]
 ;;5.3;Scheduling;**188*1011,1012**;Aug 13, 1993
 ;IHS/ANMC/LJF 10/04/2000 added choice of clinics; removed page #
 ;                        and call to list manager code
 ;
 S:'$D(DTIME) DTIME=300 I '$D(DT) D DT^SDUTL
 ;
 ;IHS/ANMC/LJF 10/04/2000
 ;S DIV="" I $D(^DIC(4,+$$SITE^VASITE,"DIV")),^("DIV")="Y" S DIC("A")="CLINIC LIST BY DOW FOR WHICH DIVISION: " D ASK^SDDIV Q:Y<0
 S DIV="" D CLINIC^BSDU(1) I $D(BSDQ) K BSDQ G END
 ;I DIV="" S DIV=$O(^DG(40.8,"C",DUZ(2),0))  ;cmi/maw 9/1/09 orig PATCH 1011
 I DIV="" S DIV=$O(^DG(40.8,"AD",DUZ(2),0))  ;cmi/maw 9/1/09 modified PATCH 1011
 ;S VAR="DIV",VAL=DIV,PGM="START^SDCLDOW" D ZIS^DGUTQ Q:POP
 S VAR="VAUTC#^VAUTD#^DIV",PGM="START^BSDCLDOW"  ;IHS/ANMC/LJF 10/4/2000
 I $$BROWSE^BDGF="B" D START^BSDCLDOW Q
 D ZIS^DGUTQ Q:POP  D START^BSDCLDOW  Q
 ;IHS/ANMC/LJF 10/04/2000 end of mods
 ;
START U IO S (END,SDPG)=0
 S LINE1="|------------------------------------|-----|-----|-----|-----|-----|-----|-----|",SDIV=$S(DIV:DIV,1:1)
 D TOF
 S SCN=0
 F  S SCN=$O(^SC("B",SCN)) G:SCN=""!(END) END D
 . S SC=""
 . F  S SC=$O(^SC("B",SCN,SC)) Q:SC=""  D CHECK I $T D SET,PRT
 G END
END K I,SDCL,LINE1,PGM,NAME,POP,SDALL,SCN,END,M,L,DOW,SDOS,SC,SDPG,X,Y D CLOSE^DGUTQ Q
SET S NAME=$P(^SC(SC,0),"^",1)
 K DOW F L=DT-.1:0 S L=$O(^SC(SC,"T",L)) Q:L=""  S X=L D DW^%DTC S:'$D(^SC(SC,"T"_Y,L,1)) DOW(Y+1)="F"
 F L=0:1:6 I '$D(DOW(L+1)) F M=DT-.1:0 S M=$O(^SC(SC,"T"_L,M)) Q:M=""  I $D(^(M,1)),^(1)]"" S DOW(L+1)=$S($O(^SC(SC,"T"_L,DT))=M:"C",1:"F") Q
 F M=DT-.1:0 S M=$O(^SC(SC,"OST",M)) Q:M=""  S X=M D DW^%DTC I '$D(DOW(Y+1)),$D(^SC(SC,"OST",M,1)),^(1)["[" S DOW(Y+1)="C"
 Q
PRT I $Y+7>IOSL D:IOSL<25 SEEND:IOST?1"C-".E Q:END  D TOF
 I $D(DOW) W !,"|",NAME W ?37,"|" F M=1:1:7 S SDOS=(M+6)*6-3 W:$D(DOW(M)) ?SDOS,"*",DOW(M),"*" S SDOS=SDOS+4 W ?SDOS,"|" K SDOS
 I $D(DOW) W ! W LINE1
 Q
SEEND R !,"Press return to continue or ""^"" to escape ",CXEND:DTIME I '$T!(CXEND="^") S END=1 Q
 Q
TOF ;W @IOF,!!,?2,"FACILITY: ",$P(^DG(40.8,+SDIV,0),"^",1),!,?2,"CLINIC LIST BY DAY OF WEEK AS OF " S Y=DT D DT^DIQ S SDPG=SDPG+1 W ?(IOM-10),"PAGE: ",SDPG  ;IHS/ANMC/LJF 10/4/2000
 W @IOF,!,?2,"FACILITY: ",$P(^DG(40.8,+SDIV,0),"^",1),!,?2,"CLINIC LIST BY DAY OF WEEK AS OF " S Y=DT D DT^DIQ ;S SDPG=SDPG+1 W ?(IOM-10),"PAGE: ",SDPG  ;IHS/ANMC/LJF 10/4/2000
 W !!,?3,"*C* = CLINIC CURRENTLY MEETS ON THIS DAY",!,?3,"*F* = CLINIC WILL MEET IN THE FUTURE ON THIS DAY",!!
 W !,"CLINIC:",?37,"| SUN | MON | TUE | WED | THU | FRI | SAT |"
 S I="",$P(I,"=",81)="" W !,I Q
CHECK ;I $P(^SC(SC,0),"^",3)="C",$S(DIV="":1,$P(^SC(SC,0),"^",15)=DIV:1,1:0)  ;IHS/ANMC/LJF 10/4/2000
 I $P(^SC(SC,0),"^",3)="C",$S(VAUTD=1:1,$D(VAUTD(+$P(^SC(SC,0),U,15))):1,1:0),$S(VAUTC=1:1,$D(VAUTC($P(^SC(SC,0),U))):1,1:0),$$ACTV^BSDU(SC,DT)  ;IHS/ANMC/LJF 10/4/2000
 Q
