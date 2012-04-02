BPBSUPD1 ;IHS/CIA/PLS - Update Drug File from AWP data ;10-Aug-2005 21:57;SM
 ;;1.0;PHARMACY BARCODE SCAN;;August 10, 2005
 ;=================================================================
PSSMAN(MANUAL,BPBSDRG) ; EP
 N PSDRUG,PSSFLAG,PSSXX,PSSZ,DIC,DA
 Q:'$G(BPBSDRG)
 S MANUAL=$G(MANUAL,1)
 D ^PSSDEE2
 S PSSFLAG=0,PSSZ=1,PSSXX=1
 S (FLG1,FLG2,FLG3,FLG4,FLG5,FLG6,FLG7,FLAG,FLGKY,FLGOI)=0
 K ^TMP($J,"ADD"),^TMP($J,"SOL")
 S (DA,DISPDRG)=BPBSDRG
 L +^PSDRUG(DISPDRG):0 I '$T W !,$C(7),"Another person is editing this one." Q
 S PSSHUIDG=1,PSSNEW=0
 D USE^PSSDEE,NOPE^PSSDEE,COMMON,DEA^PSSDEE,MF^PSSDEE K PSSHUIDG
 D HUIDG
 L -^PSDRUG(DISPDRG)
 K FLG3,PSSNEW
 D ^PSSDEE2
 Q
 ;
HUIDG ;
 N X
 S X="PSSHUIDG"
 X ^%ZOSF("TEST") I $T D DRG^PSSHUIDG(DISPDRG,PSSNEW)
 Q
COMMON S DIE="^PSDRUG("
 I MANUAL D
 .S DR="[PSSCOMMON]"
 E  D SETDRARY(1)
 D ^DIE K DR Q:$D(Y)!($D(DTOUT))
 W:'$D(Y) !,"PRICE PER DISPENSE UNIT: "
 S:'$D(^PSDRUG(DA,660)) $P(^PSDRUG(DA,660),"^",6)=""
 W:'$D(Y) $P(^PSDRUG(DA,660),"^",6)
 D DEA^PSSDEE,CK^PSSDEE,ASKND^PSSDEE,OIKILL^PSSDEE1,COMMON1^PSSDEE
 Q
 ;
SETDRARY(PSS) ; Set the DR array with fields to edit
 N P61
 S P61=$S($$PATCH^XPDUTL("PSS*1.0*61"):"D PKIND^PSSDDUT2;",1:"")
 S PSS=$G(PSS,0)
 I PSS D
 .S DR=".01;31;"_P61_"3;"_P61_"9;12;14.5;15;13;9999999.02;9999999.31;W !,$P(^DD(50,9999999.32,0),U),"" is "" W:$D(^PSDRUG(DA,999999931)) $P(^(999999931),U,2);9999999.33;2;"
 .S DR(1,50,1)="W !!,""NATIONAL FORMULARY INDICATOR: "" W:$P($G(^PSDRUG(DA,""ND"")),U,11)=1 ""YES"" W:$P($G(^PSDRUG(DA,""ND"")),U,11)="""" ""Not Matched To NDF"""
 .S DR(1,50,2)="W:$P($G(^PSDRUG(DA,""ND"")),U,11)=0 ""NO"";51;52;37;65;101;102;6;100;8;9999999.05;9999999.06"
 .S DR(2,50.037)=".01"
 .S DR(2,50.065)=".01"
 .S DR(2,50.1)=".01;1;2;"
 E  D
 .S DR=".01;31;3;9;12;14.5;15;13;9999999.02;9999999.31;W !,$P(^DD(50,9999999.32,0),U),"" is "" W:$D(^PSDRUG(DA,999999931)) $P(^(999999931),U,2);9999999.33;"
 .S DR(1,50,1)="101;2;4:6,8:15;W !,$P(^DD(50,16,0),U),"" is "" W:$D(^PSDRUG(DA,660)) $P(^(660),U,6);17;51;100;50;9999999.05;9999999.06;"
 .S DR(2,50.1)=".01:2"
 Q