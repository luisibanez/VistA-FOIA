%ZIS3 ;SFISC/AC,RWF -- DEVICE HANDLER(DEVICE TYPES & PARAMETERS) ;10/06/2005  13:23
 ;;8.0;KERNEL;**18,36,69,104,391**;JUL 10, 1995
 I %ZIS'["T",$G(^%ZIS(1,+%E,"POX"))]"" D XPOX^ZISX(%E)
 I $D(%ZISQUIT) S POP=1 K %ZISQUIT
 S %ZISCHK=1
 I 'POP&(%ZISB)&(%ZTYPE'="RES")&(%ZTYPE'="OTH")&(%ZTYPE'="SDP")&(IO'["::") D DEVOK
 G Q:POP
 G @%ZTYPE:(%ZTYPE["TRM"),@(%ZTYPE_"^%ZIS6") ;Jump to next part
 ; 
Q I $D(%ZISUOUT) K %ZISUOUT,%ZISHP,%ZISHPOP Q
 I $D(%ZISHPOP)&$S(IO="":1,1:'$D(IO(1,IO))) D HGBSY^%ZIS2 Q
 I POP S:%IS'["T" IO="" I $D(%ZISHG(0)),%IS'["D",'$D(%ZISHPOP) G HUNT^%ZIS2
 Q
VTRM ;Virtual terminal type
TRM D OPEN^%ZIS4:'POP&(%ZISB&(%IS'["T")),MARGN:'POP,SETPAR:'POP ;Terminal type
 I 'POP,%IS'["T",%ZISB=1,'$D(IOP),IO'=IO(0),'$D(IO("Q")),%IS["Q" D AQUE
 W:'$D(IOP) ! I '$D(IO("Q")) D O^%ZIS4:'POP&(%ZISB&(%IS'["T"))
 G Q
DEVOK N X,Y,X1
 S X=IO,X1=%ZTYPE
 D DEVOK^%ZOSV I Y=-99!(Y=0)!(Y=$J) Q
 I Y>0 S POP=1 W:'$D(IOP)&('$D(%ZISHG(0))!(%IS["D")) !,*7,"[Device Unavailable]" Q
 I Y=-1 S IO="",POP=1 W:'$D(IOP)&('$D(ZISHG(0))!(%IS["D")) !,*7,"[Device does not Exist or Unavailable]" Q
 Q
 ;
MARGN ;Get the margin and page length
 S %A=$P(%Y,";",1)
 I %A?1A.ANP D SUBIEN(.%A,1) I $D(^%ZIS(2,%A,1)) K %Z91 D ST(1) S %Y=$P(%Y,";",2,9),%ZISMY=$P(%ZISMY,";",2,9) G MARGN
 I %A>3 S $P(%Z91,"^")=$S(%A>255:255,1:+%A)
 I $P(%Y,";",2) S $P(%Z91,"^",3)=+$S($P(%Y,";",2)>65530:65530,1:$P(%Y,";",2)) ;Cache fix for $Y#65535 wrap
 ;
ALTP I '$D(IO("P")) Q:%A>3  G ASKMAR:%ZTYPE["TRM" Q
 S %X=$F(IO("P"),"M") I %X S %A=+$E(IO("P"),%X,99),$P(%Z91,"^")=$S(%A>255:255,1:%A)
 S %X=$F(IO("P"),"L") I %X S $P(%Z91,"^",3)=+$E(IO("P"),%X,99)
 Q:%A>3!(%ZTYPE'["TRM")
ASKMAR I %IS["M",'$D(IOP),$S(%E=%H:+$P(%Z,"^",3),1:1),$P(%Z,"^",4) W "    Right Margin: " W:$P(%Z91,"^")]"" +%Z91,"// "
 E  Q
 D SBR^%ZIS1 I '$D(DTOUT)&'$D(DUOUT) S:%X=""&($P(%Z91,"^")]"") %X=+%Z91 G ASKMAR:%X'?1.N S $P(%Z91,"^")=$S(%X>255:255,1:%X) Q
 S POP=1 I %ZISB&(%ZTYPE["TRM")&(IO'=IO(0)) C IO K IO(1,IO) Q
 Q
SETPAR S:%ZISOPAR]""&($A(%ZISOPAR)-40) %ZISOPAR="("_%ZISOPAR_")"
 Q
AQUE W ! S %=$S($D(IO("Q")):1,1:2),U="^",%ZISDTIM=60
 I $D(IO("Q")) W !,"Previously, you have selected queueing."
 W !,"Do you "_$S($D(IO("Q")):"STILL ",1:"")_"want your output QUEUED"
 D YN^%ZIS1 K %ZISDTIM G AQUE:%=0 Q:$D(IO("Q"))
 I %=-1 S POP=1,%ZISHPOP=1,%ZISUOUT=1 C IO K IO(1,IO) Q
 I %=1 S IO("Q")=1 C IO K IO(1,IO) Q
 Q
ST(%ZISTP) ;
 S %ZISIOST(0)=%A,%ZISIOST=$P($G(^%ZIS(2,%A,0)),"^")
 S:'$D(%Z91) %Z91=$P($G(^%ZIS(2,%A,1),"132^#^60^$C(8)"),"^",1,4),$P(%Z91,"^",5)=$G(^("XY"))
 Q:%ZISTP
STP N %B ;%E is a pointer to the Device file
 S %B=$G(^%ZIS(1,%E,91))
 S:$P(%B,"^")]"" $P(%Z91,"^")=+%B S:$P(%B,"^",3)]"" $P(%Z91,"^",3)=$P(%B,"^",3) ;S $P(%Z91,"^",5)=$G(^%ZIS(2,%ZISIOST(0),"XY"))
 Q
SUBIEN(%1,%) ;Return Subtype ien. %1 is call by Ref.
 N %XX,%YY
 I $D(^%ZIS(2,"B",%1))>9 S %1=+$O(^%ZIS(2,"B",%1,0)) Q
 I '$G(%) S X="" Q
 S %XX=%1 D 2^%ZIS5 S %1=+%YY
 Q
SUBTYPE(%A) ;Called from %ZISH
 N %ZISIOST,%Z91
 S:$G(%A)="" %A="P-OTHER"
 D SUBIEN(.%A),ST(1)
 S IOM=$P(%Z91,U,1),IOF=$P(%Z91,U,2),IOSL=$P(%Z91,U,3),IOST=%ZISIOST,IOST(0)=%ZISIOST(0),IOBS="$C(8)"
 S:IOST="" IOST="P-OTHER",IOST(0)=0
 Q
 
