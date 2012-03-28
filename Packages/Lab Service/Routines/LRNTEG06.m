LRNTEG06 ;ISC/XTSUMBLD KERNEL - Package checksum checker ;3070621.074623
 ;;5.2;LR;**1022**;September 20, 2007
 ;;7.3;3070621.074623
 S XT4="I 1",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
CONT F XT1=1:1 S XT2=$T(ROU+XT1) Q:XT2=""  S X=$P(XT2," ",1),XT3=$P(XT2,";",3) X XT4 I $T W !,X X ^%ZOSF("TEST") S:'$T XT3=0 X:XT3 ^%ZOSF("RSUM") W ?10,$S('XT3:"Routine not in UCI",XT3'=Y:"Calculated "_$C(7)_Y_", off by "_(Y-XT3),1:"ok")
 G CONT^LRNTEG07
 K %1,%2,%3,X,Y,XT1,XT2,XT3,XT4 Q
ONE S XT4="I $D(^UTILITY($J,X))",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
 W !,"Check a subset of routines:" K ^UTILITY($J) X ^%ZOSF("RSEL")
 W ! G CONT
ROU ;;
LRBLAA1 ;;3783887
LRBLAB ;;1375584
LRBLAGG ;;2396666
LRBLAUD ;;4908608
LRBLAUD1 ;;9401031
LRBLB ;;7956270
LRBLBU ;;1843508
LRBLC ;;2025571
LRBLCAP ;;2911093
LRBLCMV ;;4928270
LRBLCON ;;34600
LRBLD ;;3327830
LRBLDA ;;12147978
LRBLDA1 ;;3268356
LRBLDAA ;;12506982
LRBLDAL ;;9228865
LRBLDC ;;14240143
LRBLDC1 ;;5310711
LRBLDCR ;;10174741
LRBLDCU ;;5599605
LRBLDED ;;6275008
LRBLDEL ;;9981938
LRBLDELT ;;5342237
LRBLDEX ;;2324070
LRBLDEX1 ;;13687096
LRBLDEX2 ;;14342166
LRBLDK ;;4441284
LRBLDL ;;8060230
LRBLDL1 ;;1195224
LRBLDLG ;;19234971
LRBLDMV ;;6457828
LRBLDP ;;2057718
LRBLDPA ;;3947482
LRBLDPA1 ;;13847605
LRBLDPA2 ;;14010725
LRBLDPAW ;;3197309
LRBLDPH ;;10390788
LRBLDPK ;;8187645
LRBLDPL ;;3899732
LRBLDPT ;;9349793
LRBLDPT1 ;;3747848
LRBLDR ;;15580584
LRBLDR1 ;;7700606
LRBLDRR ;;17268790
LRBLDRR1 ;;25538126
LRBLDRR2 ;;3286428
LRBLDRR3 ;;1799803
LRBLDSC ;;8429525
LRBLDT ;;13459983
LRBLDTA ;;2600745
LRBLDUC ;;5311338
LRBLDW ;;5918103
LRBLDX ;;4968135
LRBLFIX ;;1322332
LRBLFX72 ;;3884524
LRBLINTG ;;3212170
LRBLJ ;;1017052
LRBLJA ;;17273587
LRBLJA1 ;;6333983
LRBLJB ;;10326586
LRBLJC ;;9964679
LRBLJCK ;;9867617
LRBLJD ;;12678359
LRBLJD1 ;;14481597
LRBLJDA ;;9799309
LRBLJDM ;;15110824
LRBLJDP ;;9538287
LRBLJED ;;15577355
LRBLJI ;;8232116
LRBLJL ;;20177611
LRBLJL1 ;;8092253
LRBLJLA ;;10606928
LRBLJLG ;;22434197
LRBLJLG1 ;;12109485
LRBLJM ;;5716689
LRBLJM1 ;;15713929
LRBLJP ;;5322959
LRBLJPA ;;5668672
LRBLJPA1 ;;16460745
LRBLJPA2 ;;11480747
LRBLJPH ;;6324782
LRBLJPP ;;13361845
LRBLJPP1 ;;6533032
LRBLJR ;;8337634
LRBLJRB ;;10178183
LRBLJSH ;;10453243
LRBLJT ;;9133136
LRBLJTS ;;4021962
LRBLJTS1 ;;8904563
LRBLJTS2 ;;8609540
LRBLJU ;;6048443
LRBLJU1 ;;7426924
LRBLJUT ;;6665328
LRBLJW ;;11324922
LRBLJX ;;5755259
LRBLP ;;17418314
LRBLPA ;;5491353
LRBLPAB ;;4479659
LRBLPB ;;1161401
LRBLPBR ;;9697931
LRBLPBR1 ;;15320101
LRBLPC ;;16600919
LRBLPC1 ;;7224946
LRBLPCS ;;10290637
LRBLPCS1 ;;13922822
LRBLPCSS ;;10015953
LRBLPD ;;11774146
LRBLPD1 ;;10140365
LRBLPE ;;13323251
LRBLPE1 ;;9165996
LRBLPED ;;17147926
LRBLPED1 ;;9800010
LRBLPED2 ;;3635113
LRBLPEW ;;14887801
LRBLPH ;;4029035
LRBLPIT ;;7051859
LRBLPOST ;;1842824
LRBLPP ;;1117183
LRBLPQA ;;9315666
LRBLPR ;;6872362
LRBLPR1 ;;13083370
LRBLPRA ;;6201156
LRBLPT ;;9193831
LRBLPT1 ;;11256754
LRBLPTR ;;11758949
LRBLPTR1 ;;10249153
LRBLPUS ;;13178966
LRBLPUS1 ;;10560710
LRBLPUS2 ;;6349114
LRBLPX ;;16100078
LRBLPX1 ;;12892470
LRBLQPR ;;5571366
LRBLQST ;;7084452
LRBLRCT ;;9631694
LRBLS ;;11617800
LRBLSCRN ;;1075474
LRBLSET ;;2910064
LRBLSSN ;;3930307
LRBLST ;;3568264
LRBLSTR ;;3281779
LRBLSUM ;;2196481
LRBLTA ;;7744169
LRBLTA1 ;;4789022
LRBLTX ;;13988532
LRBLTXA ;;12740605
LRBLU ;;16130805
LRBLUL ;;1167136
LRBLVAL ;;747507
LRBLW ;;4578412
LRBLWD ;;4955575
LRBLWDS ;;8200644
LRBLXREF ;;301615
LRBLY ;;3121634
LRCAP64 ;;9237355
LRCAP64S ;;4824368
LRCAP67 ;;7933374
LRCAPA12 ;;5214646
LRCAPACC ;;8757923
LRCAPAM0 ;;3521688
