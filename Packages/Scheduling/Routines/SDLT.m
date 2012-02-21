SDLT ;ALB/LDB - CANCELLATION LETTERS ; 14 Feb 2003
 ;;5.3;Scheduling;**185,213,281,330,398**;Aug 13, 1993
 ;
 ;**************************************************************************
 ;                          MODIFICATIONS
 ;                          
 ;   DATE      PATCH     DEVELOPER  DESCRIPTION OF CHANGES
 ; --------  ----------  ---------  ----------------------------------------
 ; 02/14/03  SD*5.3*281  SAUNDERS   Print letters to confidential address if
 ;                                  requested
 ; 12/2/03   SD*5.3*330  LUNDEN     Remove form feed from PRT+0
 ;
 ;**************************************************************************
 ;
 ;WRITE GREETING AND OPENING TEXT OF LETTER
PRT S Y=DT D DTS^SDUTL
 I +$G(SDFIRST)=0 W @IOF ;SD*5.3*330 Form feed only after letter #1
 K SDFIRST
 ;S SDFIRST=0
 W !,?65,Y,!,?65,$$LAST4(A),!!!!
 I 'SDFORM W !!!!! D ADDR W !!!!
W1 W !,"Dear ",$S($P(^DPT(+A,0),"^",2)="M":"Mr. ",1:"Ms. ")
 N DPTNAME
 S DPTNAME("FILE")=2,DPTNAME("FIELD")=".01",DPTNAME("IENS")=(+A)_","
 S X=$$NAMEFMT^XLFNAME(.DPTNAME,"G","M") W X,","
 W !! K ^UTILITY($J,"W"),DIWF,DIWR,DIWF S DIWL=1,DIWF="C80WN" F Z0=0:0 S Z0=$O(^VA(407.5,SDLET,1,Z0)) Q:Z0'>0  S X=^(Z0,0) D ^DIWP
 D ^DIWW K ^UTILITY($J,"W") Q
WRAPP ;WRITE APPOINTMENT INFORMATION
 S:$D(SC)&'$D(SDC) SDC=SC S SDCL=$P(^SC(+SDC,0),"^",1),SDCL=SDCL_" Clinic" D FORM
 S SDX1=$S($D(SDX):SDX,1:X) S:$D(SDS) S=SDS F B=3,4,5 I $P(S,"^",B)]"" S SDCL=$S(B=3:"LAB",B=4:"XRAY",1:"EKG"),SDX=$P(S,"^",B) D FORM
 S (SDX,X)=SDX1 Q
FORM S:$D(SDX) X=SDX S SDHX=X D DW^%DTC S DOW=X,X=SDHX X ^DD("FUNC",2,1) S SDT0=X,SDDAT=$P("JAN^FEB^MAR^APR^MAY^JUN^JUL^AUG^SEP^OCT^NOV^DEC","^",$E(SDHX,4,5))_" "_+$E(SDHX,6,7)_", "_(1700+$E(SDHX,1,3)) W !?4,DOW,?14,$J(SDDAT,12)
 W ?27,$J(SDT0,8)," ",SDCL I $D(SDLT)&($Y>(IOSL-8)) W @IOF
 Q
REST ;WRITE THE REMAINDER OF LETTER
 I SDLET W !?12 K ^UTILITY($J,"W"),DIWL,DIWR,DIWF S DIWL=1,DIWF="C80WN" F Z5=0:0 S Z5=$O(^VA(407.5,SDLET,2,Z5)) Q:Z5'>0  S X=^(Z5,0) D ^DIWP
 D ^DIWW K ^UTILITY($J,"W") Q:'SDFORM
 F I=$Y:1:IOSL-12 W !
 D ADDR Q
ADDR K VAHOW S DFN=+A W !?12,$$FML^DGNFUNC(DFN) S VAHOW=2
 I $D(^DG(43,1,"BT")),'$P(^("BT"),"^",3) S VAPA("P")=""
 S X1=DT,X2=5 D C^%DTC I '$D(VAPA("P")) S (VATEST("ADD",9),VATEST("ADD",10))=X
 D ADD^VADPT D
 .;CHANGE STATE TO ABBR.
 .N SDIENS,X
 .I $D(^UTILITY("VAPA",$J,5)) S SDIENS=+^UTILITY("VAPA",$J,5)_",",X=$$GET1^DIQ(5,SDIENS,1),$P(^UTILITY("VAPA",$J,5),U,2)=X
 .K SDIENS Q
 N SDCCACT1,SDCCACT2
 S SDCCACT1=^UTILITY("VAPA",$J,12),SDCCACT2=$P($G(^UTILITY("VAPA",$J,22,2)),"^",3)
 ;if confidential address is not active for scheduling/appointment letters, print to regular address
 I ($G(SDCCACT1)=0)!($G(SDCCACT2)'="Y") D
 .F LL=1:1:4 W:^UTILITY("VAPA",$J,LL)]"" !,?12,^UTILITY("VAPA",$J,LL)
 .W:^UTILITY("VAPA",$J,4)']"" ! I ^UTILITY("VAPA",$J,5)]"" W ", ",$P(^UTILITY("VAPA",$J,5),"^",2)
 .I ^UTILITY("VAPA",$J,11)]"" W "  ",$P(^UTILITY("VAPA",$J,11),U,2)
 ;if confidential address is active for scheduling/appointment letters, print to confidential address
 I $G(SDCCACT1)=1,$G(SDCCACT2)="Y" D
 .F LL=13:1:16 W:^UTILITY("VAPA",$J,LL)]"" !,?12,^UTILITY("VAPA",$J,LL)
 .W:^UTILITY("VAPA",$J,16)']"" ! I ^UTILITY("VAPA",$J,17)]"" W ", ",$P(^UTILITY("VAPA",$J,17),"^",2)
 .I ^UTILITY("VAPA",$J,18)]"" W "  ",$P(^UTILITY("VAPA",$J,18),U,2)
 W ! D KVAR^VADPT Q
 ;
 ;
LAST4(DFN) ;Return patient "last four"
 N SDX
 S SDX=$G(^DPT(+DFN,0))
 Q $E(SDX)_$E($P(SDX,U,9),6,9)
 ;
BADADD ;Print patients with a Bad Address Indicator
 I '$D(^TMP($J,"BADADD")) Q
 N SDHDR,SDHDR1
 W @IOF,$TR($J("",IOM)," ","*")
 S SDHDR="BAD ADDRESS INDICATOR LIST" W !,?(IOM-$L(SDHDR)/2),SDHDR,!
 S SDHDR1="** THE LETTER FOR THESE PATIENT(S) DID NOT PRINT DUE TO A BAD ADDRESS INDICATOR."
 W !,"Last 4",!,"of SSN",?10,"Patient Name",!
 W $TR($J("",IOM)," ","*")
 N SDNAM,SDDFN
 S SDNAM="" F  S SDNAM=$O(^TMP($J,"BADADD",SDNAM)) Q:SDNAM=""  D
 . S SDDFN=0 F  S SDDFN=$O(^TMP($J,"BADADD",SDNAM,SDDFN)) Q:'SDDFN  D
 . . W !,$$LAST4(SDDFN),?10,SDNAM
 W !!,SDHDR1
 Q
