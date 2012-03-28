ACRFEDG ;IHS/OIRM/DSD/THL,AEF - ESTABLISH DISTRIBUTION GROUP; [ 11/01/2001   9:44 AM ]
 ;;2.1;ADMIN RESOURCE MGT SYSTEM;;NOV 05, 2001
 ;;ROUTINE TO ESTABLISH FUND DISTRIBUTION GROUP
EN N ACRI
 F  D EN1 Q:$D(ACRQUIT)!$D(ACROUT)
EXIT K ACRQUIT,ACRX,ACRY,ACRDGDA,ACRDG,ACRDGMDA,ACRDGM,ACRPRCT,ACRFEDG
 Q
EN1 W @IOF
 S ACRX="MANAGE FUND DISTRIBUTION GROUPS"
 W !!?80-$L(ACRX)\2,ACRX
 W !?80-$L(ACRX)\2
 F ACRI=1:1:$L(ACRX) W "="
 S DIR(0)="SO^1:ADD/EDIT;2:DELETE^K:X'?1N!(X<1)!(X>2) X"
 S DIR("A")="  Option"
 D DIR^ACRFDIC
 Q:$D(ACRQUIT)!$D(ACROUT)
 I X=1 D ADD Q
 D DELETE
 K ACRQUIT
 Q
ADD F  D ADD1 Q:$D(ACRQUIT)!$D(ACROUT)
 K ACRQUIT
 Q
ADD1 D GET^ACRFEDG1
 Q:$D(ACRQUIT)!$D(ACROUT)
 F  D DISPLAY,SIB:ACRJ=1,A1:ACRJ>1 I $D(ACRQUIT)!$D(ACROUT) K ACRQUIT Q
 Q
SIB W !!,"Add MEMBERS for the ",@ACRON,ACRDG,@ACROF," Fund Distribution Group by:"
 S DIR(0)="SO^1:Office/Div/Branch/Dept;2:Area;3:Service Unit;4:Facility^K:X'?1N!(X<1)!(X>5) X"
 S DIR("A")="Member Type"
 D DIR^ACRFDIC
 Q:$D(ACRQUIT)!$D(ACROUT)
 S ACRX=$S(X=1:"OFFICE",X=2:"AREA",X=3:"SU",X=4:"FAC")
 F  D S1 Q:+Y<1
 Q
S1 S ACRY=$P($T(@ACRX),";;",2,99)
 S DIC(0)="AEMQZ"
 S (ACRGLB,DIC)=$P(ACRY,";;")
 S DIC=U_DIC
 S DIC("A")=$P(ACRY,";;",2)
 W !
 D DIC^ACRFDIC
 Q:+Y<1
 S ACRDFN=+Y,ACRY=Y(0,0)
 D NEWM
 Q
SIB1 D GETM^ACRFEDG1
 Q:+Y<1
 I $D(^ACRDG(ACRDGDA,"GP","B")) D  I 1
 .S (ACRX,ACRY)=0
 .F  S ACRX=$O(^ACRDG(ACRDGDA,"GP",ACRX)) Q:'ACRX  S:$D(^ACRDG(ACRDGDA,"GP",ACRX,"DT")) ACRY=ACRY+$P(^("DT"),U,3)
 E  S ACRY=0
 S DA=ACRDGMDA
 S DIE="^ACRDG("_ACRDGDA_",""GP"","
 S DIE("NO^")="NO"
 S DR=".02T;.03T;.04T;S ACRY=ACRY-$P(^ACRDG(ACRDGDA,""GP"",DA,""DT""),U,3);10T;I $P(^ACRDG(ACRDGDA,""GP"",DA,""DT""),U,3)+ACRY>100 K X S $P(^(""DT""),U,3)=100-ACRY W *7,*7,!!,""TOTAL PERCENT CANNOT BE GREATER THAN 100."" S Y=10"
 D DIE^ACRFDIC
 Q
NEWM S:'$D(@("^ACRDG("_ACRDGDA_",""GP"",0)")) @("^ACRDG("_ACRDGDA_",""GP"",0)")="^9002198.01^^"
 S DA(1)=ACRDGDA
 S X=ACRY
 S DIC="^ACRDG("_ACRDGDA_",""GP"","
 S DIC(0)="AELMQZ"
 S DIC("DR")=".02T;.03T;.04T;1////"_ACRGLB_";2////"_ACRDFN_";10T"
 D FILE^ACRFDIC
 Q
DISPLAY ;EP;TO DISPLAY DISTRIBUTION
 D HEAD
 S (ACRJ,ACRX)=0
 F  S ACRX=$O(^ACRDG(ACRDGDA,"GP",ACRX)) Q:'ACRX  D D1 Q:$D(ACRPSE)
 I ACRJ=0,'$D(ACRFEDG) D  Q
 .W !,"NO FUND DISTRIBUTION GROUP MEMBERS"
 .W !,"GROUP MEMBERS MUST BE ESTABLISHED"
 .W !,"VIA SYSTEM SETUP.  CONSULT YOUR SYSTEMS"
 .W !,"MANAGER FOR ASSISTANCE."
 .S ACRQUIT=""
 .H 3
 I ACRJ=0,$D(ACRFEDG) D SIB Q
 I ACRJ>0 D
 .S (ACRX,ACRPRCT)=0
 .F  S ACRX=$O(^ACRDG(ACRDGDA,"GP",ACRX)) Q:'ACRX  D D2
 I ACRJ>1 D
 .W !?19,"TOTAL PERCENT:"
 .W ?35,$J(ACRPRCT,3)
 Q
D1 S ACRJ=ACRJ+1
 S ACRY=$E($P(^ACRDG(ACRDGDA,"GP",ACRX,0),U),1,25)
 S ACRP=$P(^ACRDG(ACRDGDA,"GP",ACRX,"DT"),U,3)
 W:ACRJ#2=1 !
 W:ACRJ#2=0 ?40,"| "
 W ACRX
 W ?$X+8-$L(ACRX),ACRY
 W ?$X+28-$L(ACRY),ACRP
 D:ACRJ#20=0 PAUSE
 Q
D2 S:$D(^ACRDG(ACRDGDA,"GP",ACRX,"DT")) ACRPRCT=ACRPRCT+$P(^("DT"),U,3)
 Q
A1 S DIR(0)="SO^1:ADD;2:EDIT;3:DELETE^K:X'?1N!(X<1)!(X>3) X"
 S DIR("A")="  Option"
 D DIR^ACRFDIC
 Q:$D(ACRQUIT)!$D(ACROUT)
 I X=1 D SIB I $D(ACRQUIT)!$D(ACROUT) S X=1 K ACRQUIT Q
 I X=2 F  D SIB1 I $D(ACRQUIT)!$D(ACROUT) S X=1 K ACRQUIT Q
 D:X=3 DELETEM
 K ACRQUIT
 Q
DELETE D GET^ACRFEDG1
 Q:+Y<1
 S DA=ACRDGDA
 S DIK="^ACRDG("
 D DIK^ACRFDIC
 Q
DELETEM D GETM^ACRFEDG1
 Q:+Y<1
 S DA(1)=ACRDGDA
 S DA=ACRDGMDA
 S DIK="^ACRDG("_ACRDGDA_",""GP"","
 D DIK^ACRFDIC
 Q
PAUSE K ACRPSE
 S DIR(0)="YO"
 S DIR("A")="         List more MEMBERS"
 S DIR("B")="NO"
 W !
 D DIR^ACRFDIC
 S:Y'=1 ACRPSE=""
 Q
AREA ;;AUTTAREA(;;AREA OFFICE.........: ;;
SU ;;AUTTSU(;;SERVICE UNIT........: ;;
FAC ;;AUTTLOC(;;FACILITY............: ;;
OFFICE ;;AUTTPRG(;;OFFICE/DIV/BR/DEPT..: ;;
HEAD W @IOF
 W !!,@ACRON,ACRDG,@ACROF," Fund Distribution Group"
 W !!?35,"STD"
 W ?77,"STD"
 W !,"ID NO."
 W ?8,"MEMBER"
 W ?36,"%"
 W ?42,"ID NO."
 W ?50,"MEMBER"
 W ?78,"%"
 W !,"------"
 W ?8,"-------------------------"
 W ?35,"---"
 W ?40,"| ------"
 W ?50,"-------------------------"
 W ?77,"---"
 Q
ACREDG ;EP;
 S ACRFEDG="" D EN
 Q
