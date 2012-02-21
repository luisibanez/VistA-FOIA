RORNTEG ;ISC/XTSUMBLD KERNEL - Package checksum checker ;3060126.152942
 ;;0.0;
 ;;7.3;3060126.152942
 S XT4="I 1",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
CONT F XT1=1:1 S XT2=$T(ROU+XT1) Q:XT2=""  S X=$P(XT2," ",1),XT3=$P(XT2,";",3) X XT4 I $T W !,X X ^%ZOSF("TEST") S:'$T XT3=0 X:XT3 ^%ZOSF("RSUM") W ?10,$S('XT3:"Routine not in UCI",XT3'=Y:"Calculated "_$C(7)_Y_", off by "_(Y-XT3),1:"ok")
 G CONT^RORNTEG0
 K %1,%2,%3,X,Y,XT1,XT2,XT3,XT4 Q
ONE S XT4="I $D(^UTILITY($J,X))",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
 W !,"Check a subset of routines:" K ^UTILITY($J) X ^%ZOSF("RSEL")
 W ! G CONT
ROU ;;
ROR ;;2717801
ROR01 ;;1117
ROR02 ;;1122
ROR10 ;;7730208
ROR11 ;;8580380
RORAPI01 ;;1957725
RORBIN ;;2967124
RORDD ;;4656034
RORDD01 ;;3401360
RORERR ;;4405971
RORERR20 ;;14492523
ROREVT01 ;;2008294
ROREXPR ;;5694255
ROREXT ;;3147105
ROREXT01 ;;8425154
ROREXT02 ;;5834876
ROREXT03 ;;4554817
ROREXTUT ;;5555893
RORHDT ;;3349203
RORHDT01 ;;1390687
RORHDT02 ;;2997526
RORHDT03 ;;4297815
RORHDT04 ;;9379124
RORHDT05 ;;2711736
RORHDT06 ;;3568354
RORHDTAC ;;2681469
RORHDTUT ;;5831331
RORHIV03 ;;4806950
RORHIVUT ;;357536
RORHL01 ;;1491461
RORHL02 ;;5546944
RORHL03 ;;5258533
RORHL031 ;;6235058
RORHL04 ;;5297245
RORHL05 ;;4084796
RORHL06 ;;4217993
RORHL07 ;;3246023
RORHL071 ;;3217396
RORHL08 ;;5887870
RORHL081 ;;7585616
RORHL09 ;;6026195
RORHL10 ;;5509115
RORHL11 ;;4565613
RORHL12 ;;2399116
RORHL121 ;;9878360
RORHL13 ;;3466976
RORHL14 ;;5357488
RORHL15 ;;5532311
RORHL16 ;;3252430
RORHL17 ;;4936158
RORHL7 ;;4806448
RORHL7A ;;4554021
RORHLUT1 ;;1806943
RORKIDS ;;6182684
RORLOCK ;;4131518
RORLOG ;;6030893
RORLOG01 ;;3716383
RORP000 ;;10708753
RORP000A ;;10206450
RORP000B ;;11070750
RORPUT01 ;;5495626
RORPUT02 ;;5936706
RORREP01 ;;9158405
RORREP02 ;;10911089
RORRP007 ;;4442755
RORRP010 ;;1881192
RORRP011 ;;2555508
RORRP012 ;;1144389
RORRP013 ;;4665100
RORRP014 ;;2785597
RORRP015 ;;3365112
RORRP016 ;;3160766
RORRP017 ;;1924388
RORRP018 ;;1666201
RORRP019 ;;5814698
RORRP020 ;;4077705
RORRP021 ;;3721454
RORRP022 ;;1262090
RORRP023 ;;2273081
RORRP024 ;;3821351
RORRP025 ;;4917408
RORRP026 ;;10176668
RORRP027 ;;6589308
RORRP029 ;;1527601
RORRP030 ;;1101835
RORRP031 ;;4897990
RORRP032 ;;5035421
RORRP033 ;;2395118
RORRP034 ;;3041648
RORRP035 ;;1597804
RORRP036 ;;1773818
RORRP037 ;;2638742
RORRP038 ;;4339809
RORRP040 ;;4049054
RORRP041 ;;2687037
RORRP042 ;;2333070
RORSET01 ;;4563146
RORSETU1 ;;2833894
RORSETU2 ;;2447593
RORTMP ;;679112
RORTSK ;;3964693
RORTSK01 ;;7070947
RORTSK02 ;;4523778
RORTSK03 ;;2058050
RORTSK10 ;;5894436
RORTSK11 ;;3325690
RORTSK12 ;;2274583
RORTSK13 ;;5581664
RORTSK14 ;;2157270
RORTXT ;;141117
RORUPD ;;3118364
RORUPD01 ;;7989261
RORUPD04 ;;5421758
RORUPD05 ;;7081088
RORUPD06 ;;3084967
RORUPD07 ;;2356625
RORUPD08 ;;4579765
RORUPD09 ;;2869944
RORUPD50 ;;3764045
RORUPD51 ;;8479867
RORUPD52 ;;2557167
RORUPD62 ;;1941130
RORUPDUT ;;7113425
RORUPEX ;;3382608
RORUPP01 ;;3620688
RORUPP02 ;;3149282
RORUPR ;;5364149
RORUPR1 ;;10955587
RORUTL01 ;;4692322
RORUTL02 ;;5296575
RORUTL03 ;;8066801
RORUTL04 ;;2076790
RORUTL05 ;;7047621
RORUTL06 ;;10075666
RORUTL07 ;;2099977
RORUTL08 ;;3164502
RORUTL09 ;;1836557
RORUTL10 ;;5740794
RORUTL11 ;;942933
RORUTL14 ;;1375993
RORUTL15 ;;6511088
RORUTL16 ;;2364514
RORUTL17 ;;6994520
RORUTL18 ;;3250231
RORUTL19 ;;1203624
RORVM001 ;;609363
RORX000 ;;2233772
RORX001 ;;5778832
RORX002 ;;3917612
RORX003 ;;5545892
RORX003A ;;7545014
RORX004 ;;3369267
RORX005 ;;1558283
RORX005A ;;5728919
RORX005B ;;2068516
RORX005C ;;6689502
