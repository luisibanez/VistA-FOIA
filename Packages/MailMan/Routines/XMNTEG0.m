XMNTEG0 ;ISC/XTSUMBLD KERNEL - Package checksum checker ;08/29/2002  09:16
 ;;8.0;MailMan;;Jun 28, 2002
 ;;7.3;Apr 19, 2002@07:52:43
 S XT4="I 1",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
CONT F XT1=1:1 S XT2=$T(ROU+XT1) Q:XT2=""  S X=$P(XT2," ",1),XT3=$P(XT2,";",3) X XT4 I $T W !,X X ^%ZOSF("TEST") S:'$T XT3=0 X:XT3 ^%ZOSF("RSUM") W ?10,$S('XT3:"Routine not in UCI",XT3'=Y:"Calculated "_$C(7)_Y_", off by "_(Y-XT3),1:"ok")
 ;
 K %1,%2,%3,X,Y,XT1,XT2,XT3,XT4 Q
ONE S XT4="I $D(^UTILITY($J,X))",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
 W !,"Check a subset of routines:" K ^UTILITY($J) X ^%ZOSF("RSEL")
 W ! G CONT
ROU ;;
XMUPIN ;;10484796
XMUT1 ;;4713080
XMUT1A ;;4119010
XMUT2 ;;6124745
XMUT4 ;;14014054
XMUT41 ;;6742163
XMUT4A ;;1491748
XMUT4C ;;8776176
XMUT5 ;;6643977
XMUT5B ;;1726462
XMUT5C ;;3073565
XMUT5G ;;338629
XMUT5Q ;;8506023
XMUT5Q1 ;;4388458
XMUT5R1 ;;2364051
XMUT5R2 ;;3211915
XMUT6 ;;2312993
XMUT7 ;;411505
XMUTCOM1 ;;2620897
XMUTERM ;;7174403
XMUTERM1 ;;17510874
XMUTERM2 ;;10583278
XMUTPUR0 ;;2780450
XMVGROUP ;;13634422
XMVGRP ;;11462353
XMVSURR ;;3022444
XMVVITA ;;7297401
XMVVITAE ;;11577437
XMXADDR ;;16602920
XMXADDR1 ;;13510282
XMXADDR2 ;;14695480
XMXADDR3 ;;8833831
XMXADDR4 ;;7884015
XMXADDRD ;;10571405
XMXADDRG ;;16118455
XMXANSER ;;2014179
XMXAPI ;;7362843
XMXAPIB ;;3472533
XMXAPIG ;;5257560
XMXAPIU ;;596863
XMXBSKT ;;12498784
XMXBULL ;;5251831
XMXEDIT ;;7275716
XMXGRP ;;9498223
XMXGRP1 ;;10875164
XMXLIST ;;6277109
XMXLIST1 ;;12801864
XMXLIST2 ;;6802380
XMXMBOX ;;1530327
XMXMSGS ;;10893386
XMXMSGS1 ;;7497318
XMXMSGS2 ;;8470689
XMXPARM ;;14944409
XMXPARM1 ;;4016561
XMXPARMB ;;3923435
XMXPRT ;;3257492
XMXREPLY ;;5837087
XMXSEC ;;21878434
XMXSEC1 ;;14620130
XMXSEC2 ;;24844137
XMXSEC3 ;;3540050
XMXSEND ;;10773097
XMXTO ;;1746429
XMXUTIL ;;12300932
XMXUTIL1 ;;6906795
XMXUTIL2 ;;7664489
XMXUTIL3 ;;5771323
XMXUTIL4 ;;9367334
XMYPRE ;;2625462