DGBTEND ;ALB/SCK - BENEFICIARY TRAVEL CLEAN-UP VARIABLES ROUTINE;12/15/92 3/19/93
 ;;5.3;Registration;**35,186**;Aug 13, 1993
 ;
END I DGBTTOUT=1 I $D(^DGBT(392,DGBTDT,0)) F I=0,"A","D","M","R","T" S ^DGBT(392,DGBTDT,I)=$S($D(DGBTVAR(I)):DGBTVAR(I),1:"")
 G:'$D(^DGBT(392,DGBTDT,0))!(DGBTTOUT=1) QUIT I '$D(DGBTACCT) S DGBTVAR(0)=^DGBT(392,DGBTDT,0),DGBTACCT=$S('$D(^DGBT(392.3,+$P(DGBTVAR(0),"^",6),0)):0,1:+$P(^DGBT(392.3,+$P(DGBTVAR(0),"^",6),0),"^",5))
 S Z="^INFORMATION^DISPLAY^EDIT",PROMPT="<I>nformation, <D>isplay claim, <E>dit claim," I DGBTACCT=4!(DGBTACCT=5) S PROMPT=PROMPT_" <P>rint form,",Z=Z_"^PRINT"
 S DIR("A")=PROMPT_" or <Q>uit ",DIR("B")="Quit",DIR("?")="^D HELP^DGBTEND",DIR(0)="SA^Q:Quit;I:Information;D:Display;E:Edit;P:Print"
 D ^DIR K DIR G DELETE:Y["Q"!($D(DIRUT)),SCREEN^DGBTE:Y="I"
 S DGBTX1=$S(X="D":"SCREEN^DGBTCD",X="E":"SCREEN^DGBTCE",X="P":"START^DGBTCR",1:"") I DGBTX1]"" D @DGBTX1 D:DGBTTOUT QUIT^DGBTCE1 G:DGBTX1="START^DGBTCR" PATIENT^DGBTE G END
 G END
DELETE I '$D(^DGBT(392,DGBTDT,"A")) S %=2 W !!,"Do you want to delete this claim" D YN^DICN G:%=2 COMPLT^DGBTE G:%=-1 DELETE1 I %<1 D HELP1^DGBTE G DELETE
DELETE1 I '$D(^DGBT(392,DGBTDT,"A"))!(DGBTTOUT=-1) W !,"This claim is incomplete and is now being deleted....." S DGBTTOUT="",DIK="^DGBT(392,",DA=DGBTDT D ^DIK
 G:DGBTTOUT=-1 QUIT D KVAR G PATIENT^DGBTE
QUIT K DGBTDIV,DGBTDIVI,PRCABN,DGBTMD,DGBTDIVN,DGBTTOUT,ANS,DGBTREC,ERR,RETURN
QUIT1 K DGBT,DGBTA,DGBTAD,DGBTAI,DGBTAN,DGBTAS,DGBTC,DGBTCA,DGBTCD,DGBTCE,DGBTCH,DGBTCH1,DGBTCL,DGBTCN,DGBTCS,DGBTCSN,DGBTCST,DGBTDD,DGBTDTE,DGBTDTI,DGBTI,DGBTIME,DGBTMTD,DGBTMTI,DGBTNEW,DGBTP,DGBTPAP,DGBTPDE,DGBTPDT,DGBTPDTE,DGBTSCC,DGBTZ
 K DGBTMTS,DGBTCSC,DGBTELG,DGBTINC,DGBTDEP ; created w/ patch 35
 K DA,DFN,DIC,DIE,DINUM,DR,S,Y,X,DGBTX1,X2,I,J,VA,VADM,VAEL,VAPA,VADAT,VADATE,VAUTD,VAUTNALL,VAUTSTR,DIK
 K ^UTILITY($J,"DGBT"),^UTILITY("DGBT",$J),C,DGBTELIG,DGBTSCP,DGBTVAR,DGBTDT,DGBTINFL,DGBTACCT,DGBTACTN,DGBTOACT,DGBTCNU,DGBTFLAG,DGBTFR4,DGBTMETC,DGBTMR,DGBTRATE,DGBTTCTY,DGBTFCTY,CHZFLG,Y1
KVAR K VADM(4),VADM(5),VADM(6),VADM(7),VADM(8),VADM(9),VADM(10),VAEL(2),VAEL(4),VAEL(5),VAEL(7),VAEL(8),VAERR,VAPA(7),VAPA(8),VAPA(9),VAPA(10),DIC
 K DGBTDEF,PROMPT,DLAYGO,J,DGBTDV1,DGBTRMK,K,DGBTREC,DGBTMD
 Q
HELP ;
 W !!,"You may choose from the following: ",!!?5,"<I>nformation - to view the two informational screens",!?5,"<D>isplay - to view this claim",!?5,"<E>d it - to change this claim"
 W:DGBTACCT=4!(DGBTACCT=5) !?5,"<P>rint - to print form 70-3542d (132 columns)" W !?5,"<Q>uit - to exit from this option"
 Q
