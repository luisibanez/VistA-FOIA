BGPM5AFH ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON JUL 15, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"881,63874034742 ",.01)
 ;;63874034742
 ;;9002226.02101,"881,63874034742 ",.02)
 ;;63874034742
 ;;9002226.02101,"881,63874034745 ",.01)
 ;;63874034745
 ;;9002226.02101,"881,63874034745 ",.02)
 ;;63874034745
 ;;9002226.02101,"881,63874034790 ",.01)
 ;;63874034790
 ;;9002226.02101,"881,63874034790 ",.02)
 ;;63874034790
 ;;9002226.02101,"881,63874034801 ",.01)
 ;;63874034801
 ;;9002226.02101,"881,63874034801 ",.02)
 ;;63874034801
 ;;9002226.02101,"881,63874034810 ",.01)
 ;;63874034810
 ;;9002226.02101,"881,63874034810 ",.02)
 ;;63874034810
 ;;9002226.02101,"881,63874034814 ",.01)
 ;;63874034814
 ;;9002226.02101,"881,63874034814 ",.02)
 ;;63874034814
 ;;9002226.02101,"881,63874034820 ",.01)
 ;;63874034820
 ;;9002226.02101,"881,63874034820 ",.02)
 ;;63874034820
 ;;9002226.02101,"881,63874034830 ",.01)
 ;;63874034830
 ;;9002226.02101,"881,63874034830 ",.02)
 ;;63874034830
 ;;9002226.02101,"881,63874034860 ",.01)
 ;;63874034860
 ;;9002226.02101,"881,63874034860 ",.02)
 ;;63874034860
 ;;9002226.02101,"881,63874034890 ",.01)
 ;;63874034890
 ;;9002226.02101,"881,63874034890 ",.02)
 ;;63874034890
 ;;9002226.02101,"881,63874042301 ",.01)
 ;;63874042301
 ;;9002226.02101,"881,63874042301 ",.02)
 ;;63874042301
 ;;9002226.02101,"881,63874042307 ",.01)
 ;;63874042307
 ;;9002226.02101,"881,63874042307 ",.02)
 ;;63874042307
 ;;9002226.02101,"881,63874042310 ",.01)
 ;;63874042310
 ;;9002226.02101,"881,63874042310 ",.02)
 ;;63874042310
 ;;9002226.02101,"881,63874042314 ",.01)
 ;;63874042314
 ;;9002226.02101,"881,63874042314 ",.02)
 ;;63874042314
 ;;9002226.02101,"881,63874042320 ",.01)
 ;;63874042320
 ;;9002226.02101,"881,63874042320 ",.02)
 ;;63874042320
 ;;9002226.02101,"881,63874042330 ",.01)
 ;;63874042330
 ;;9002226.02101,"881,63874042330 ",.02)
 ;;63874042330
 ;;9002226.02101,"881,63874042360 ",.01)
 ;;63874042360
 ;;9002226.02101,"881,63874042360 ",.02)
 ;;63874042360
 ;;9002226.02101,"881,63874051401 ",.01)
 ;;63874051401
 ;;9002226.02101,"881,63874051401 ",.02)
 ;;63874051401
 ;;9002226.02101,"881,63874051410 ",.01)
 ;;63874051410
 ;;9002226.02101,"881,63874051410 ",.02)
 ;;63874051410
 ;;9002226.02101,"881,63874051414 ",.01)
 ;;63874051414
 ;;9002226.02101,"881,63874051414 ",.02)
 ;;63874051414
 ;;9002226.02101,"881,63874051415 ",.01)
 ;;63874051415
 ;;9002226.02101,"881,63874051415 ",.02)
 ;;63874051415
 ;;9002226.02101,"881,63874051416 ",.01)
 ;;63874051416
 ;;9002226.02101,"881,63874051416 ",.02)
 ;;63874051416
 ;;9002226.02101,"881,63874051420 ",.01)
 ;;63874051420
 ;;9002226.02101,"881,63874051420 ",.02)
 ;;63874051420
 ;;9002226.02101,"881,63874051428 ",.01)
 ;;63874051428
 ;;9002226.02101,"881,63874051428 ",.02)
 ;;63874051428
 ;;9002226.02101,"881,63874051430 ",.01)
 ;;63874051430
 ;;9002226.02101,"881,63874051430 ",.02)
 ;;63874051430
 ;;9002226.02101,"881,63874051460 ",.01)
 ;;63874051460
 ;;9002226.02101,"881,63874051460 ",.02)
 ;;63874051460
 ;;9002226.02101,"881,63874051490 ",.01)
 ;;63874051490
 ;;9002226.02101,"881,63874051490 ",.02)
 ;;63874051490
 ;;9002226.02101,"881,63874052201 ",.01)
 ;;63874052201
 ;;9002226.02101,"881,63874052201 ",.02)
 ;;63874052201
 ;;9002226.02101,"881,63874052215 ",.01)
 ;;63874052215
 ;;9002226.02101,"881,63874052215 ",.02)
 ;;63874052215
 ;;9002226.02101,"881,63874052230 ",.01)
 ;;63874052230
 ;;9002226.02101,"881,63874052230 ",.02)
 ;;63874052230
 ;;9002226.02101,"881,63874052260 ",.01)
 ;;63874052260
 ;;9002226.02101,"881,63874052260 ",.02)
 ;;63874052260
 ;;9002226.02101,"881,63874055801 ",.01)
 ;;63874055801
 ;;9002226.02101,"881,63874055801 ",.02)
 ;;63874055801
 ;;9002226.02101,"881,63874055810 ",.01)
 ;;63874055810
 ;;9002226.02101,"881,63874055810 ",.02)
 ;;63874055810
 ;;9002226.02101,"881,63874055814 ",.01)
 ;;63874055814
 ;;9002226.02101,"881,63874055814 ",.02)
 ;;63874055814
 ;;9002226.02101,"881,63874055816 ",.01)
 ;;63874055816
 ;;9002226.02101,"881,63874055816 ",.02)
 ;;63874055816
 ;;9002226.02101,"881,63874055828 ",.01)
 ;;63874055828
 ;;9002226.02101,"881,63874055828 ",.02)
 ;;63874055828
 ;;9002226.02101,"881,63874055830 ",.01)
 ;;63874055830
 ;;9002226.02101,"881,63874055830 ",.02)
 ;;63874055830
 ;;9002226.02101,"881,63874055860 ",.01)
 ;;63874055860
 ;;9002226.02101,"881,63874055860 ",.02)
 ;;63874055860
 ;;9002226.02101,"881,63874055890 ",.01)
 ;;63874055890
 ;;9002226.02101,"881,63874055890 ",.02)
 ;;63874055890
 ;;9002226.02101,"881,63874065501 ",.01)
 ;;63874065501
 ;;9002226.02101,"881,63874065501 ",.02)
 ;;63874065501
 ;;9002226.02101,"881,63874065510 ",.01)
 ;;63874065510
 ;;9002226.02101,"881,63874065510 ",.02)
 ;;63874065510
 ;;9002226.02101,"881,63874065520 ",.01)
 ;;63874065520
 ;;9002226.02101,"881,63874065520 ",.02)
 ;;63874065520
 ;;9002226.02101,"881,63874065530 ",.01)
 ;;63874065530
 ;;9002226.02101,"881,63874065530 ",.02)
 ;;63874065530
 ;;9002226.02101,"881,63874065560 ",.01)
 ;;63874065560
 ;;9002226.02101,"881,63874065560 ",.02)
 ;;63874065560
 ;;9002226.02101,"881,63874098701 ",.01)
 ;;63874098701
 ;;9002226.02101,"881,63874098701 ",.02)
 ;;63874098701
 ;;9002226.02101,"881,63874098710 ",.01)
 ;;63874098710
 ;;9002226.02101,"881,63874098710 ",.02)
 ;;63874098710
 ;;9002226.02101,"881,63874098714 ",.01)
 ;;63874098714
 ;;9002226.02101,"881,63874098714 ",.02)
 ;;63874098714
 ;;9002226.02101,"881,63874098720 ",.01)
 ;;63874098720
 ;;9002226.02101,"881,63874098720 ",.02)
 ;;63874098720
 ;;9002226.02101,"881,63874098730 ",.01)
 ;;63874098730
 ;;9002226.02101,"881,63874098730 ",.02)
 ;;63874098730
 ;;9002226.02101,"881,63874098760 ",.01)
 ;;63874098760
 ;;9002226.02101,"881,63874098760 ",.02)
 ;;63874098760
 ;;9002226.02101,"881,63874111409 ",.01)
 ;;63874111409
 ;;9002226.02101,"881,63874111409 ",.02)
 ;;63874111409
 ;;9002226.02101,"881,64579001300 ",.01)
 ;;64579001300
 ;;9002226.02101,"881,64579001300 ",.02)
 ;;64579001300
 ;;9002226.02101,"881,64579001301 ",.01)
 ;;64579001301
 ;;9002226.02101,"881,64579001301 ",.02)
 ;;64579001301
 ;;9002226.02101,"881,64579001400 ",.01)
 ;;64579001400
 ;;9002226.02101,"881,64579001400 ",.02)
 ;;64579001400
 ;;9002226.02101,"881,64579001420 ",.01)
 ;;64579001420
 ;;9002226.02101,"881,64579001420 ",.02)
 ;;64579001420
 ;;9002226.02101,"881,64579001500 ",.01)
 ;;64579001500
 ;;9002226.02101,"881,64579001500 ",.02)
 ;;64579001500
 ;;9002226.02101,"881,64579001501 ",.01)
 ;;64579001501
 ;;9002226.02101,"881,64579001501 ",.02)
 ;;64579001501
 ;;9002226.02101,"881,64679090201 ",.01)
 ;;64679090201
 ;;9002226.02101,"881,64679090201 ",.02)
 ;;64679090201
 ;;9002226.02101,"881,64679090202 ",.01)
 ;;64679090202
 ;;9002226.02101,"881,64679090202 ",.02)
 ;;64679090202
 ;;9002226.02101,"881,64679090301 ",.01)
 ;;64679090301
 ;;9002226.02101,"881,64679090301 ",.02)
 ;;64679090301
 ;;9002226.02101,"881,64679090302 ",.01)
 ;;64679090302
 ;;9002226.02101,"881,64679090302 ",.02)
 ;;64679090302
 ;;9002226.02101,"881,64679090401 ",.01)
 ;;64679090401
 ;;9002226.02101,"881,64679090401 ",.02)
 ;;64679090401
 ;;9002226.02101,"881,64679090402 ",.01)
 ;;64679090402
 ;;9002226.02101,"881,64679090402 ",.02)
 ;;64679090402
 ;;9002226.02101,"881,64679090501 ",.01)
 ;;64679090501
 ;;9002226.02101,"881,64679090501 ",.02)
 ;;64679090501
 ;;9002226.02101,"881,64679090502 ",.01)
 ;;64679090502
 ;;9002226.02101,"881,64679090502 ",.02)
 ;;64679090502
 ;;9002226.02101,"881,64679092301 ",.01)
 ;;64679092301
 ;;9002226.02101,"881,64679092301 ",.02)
 ;;64679092301
 ;;9002226.02101,"881,64679092302 ",.01)
 ;;64679092302
 ;;9002226.02101,"881,64679092302 ",.02)
 ;;64679092302
 ;;9002226.02101,"881,64679092303 ",.01)
 ;;64679092303
 ;;9002226.02101,"881,64679092303 ",.02)
 ;;64679092303
 ;;9002226.02101,"881,64679092307 ",.01)
 ;;64679092307
 ;;9002226.02101,"881,64679092307 ",.02)
 ;;64679092307
 ;;9002226.02101,"881,64679092309 ",.01)
 ;;64679092309
 ;;9002226.02101,"881,64679092309 ",.02)
 ;;64679092309
 ;;9002226.02101,"881,64679092310 ",.01)
 ;;64679092310
 ;;9002226.02101,"881,64679092310 ",.02)
 ;;64679092310
 ;;9002226.02101,"881,64679092401 ",.01)
 ;;64679092401
 ;;9002226.02101,"881,64679092401 ",.02)
 ;;64679092401
 ;;9002226.02101,"881,64679092402 ",.01)
 ;;64679092402
 ;;9002226.02101,"881,64679092402 ",.02)
 ;;64679092402
 ;;9002226.02101,"881,64679092403 ",.01)
 ;;64679092403
 ;;9002226.02101,"881,64679092403 ",.02)
 ;;64679092403
 ;;9002226.02101,"881,64679092407 ",.01)
 ;;64679092407
 ;;9002226.02101,"881,64679092407 ",.02)
 ;;64679092407
 ;;9002226.02101,"881,64679092409 ",.01)
 ;;64679092409
 ;;9002226.02101,"881,64679092409 ",.02)
 ;;64679092409
 ;;9002226.02101,"881,64679092410 ",.01)
 ;;64679092410
 ;;9002226.02101,"881,64679092410 ",.02)
 ;;64679092410
 ;;9002226.02101,"881,64679092501 ",.01)
 ;;64679092501
 ;;9002226.02101,"881,64679092501 ",.02)
 ;;64679092501
 ;;9002226.02101,"881,64679092502 ",.01)
 ;;64679092502
 ;;9002226.02101,"881,64679092502 ",.02)
 ;;64679092502
 ;;9002226.02101,"881,64679092503 ",.01)
 ;;64679092503
 ;;9002226.02101,"881,64679092503 ",.02)
 ;;64679092503
 ;;9002226.02101,"881,64679092507 ",.01)
 ;;64679092507
 ;;9002226.02101,"881,64679092507 ",.02)
 ;;64679092507
 ;;9002226.02101,"881,64679092509 ",.01)
 ;;64679092509
 ;;9002226.02101,"881,64679092509 ",.02)
 ;;64679092509
 ;;9002226.02101,"881,64679092510 ",.01)
 ;;64679092510
 ;;9002226.02101,"881,64679092510 ",.02)
 ;;64679092510
 ;;9002226.02101,"881,64679092601 ",.01)
 ;;64679092601
 ;;9002226.02101,"881,64679092601 ",.02)
 ;;64679092601
 ;;9002226.02101,"881,64679092602 ",.01)
 ;;64679092602
 ;;9002226.02101,"881,64679092602 ",.02)
 ;;64679092602
 ;;9002226.02101,"881,64679092603 ",.01)
 ;;64679092603
 ;;9002226.02101,"881,64679092603 ",.02)
 ;;64679092603
 ;;9002226.02101,"881,64679092607 ",.01)
 ;;64679092607
 ;;9002226.02101,"881,64679092607 ",.02)
 ;;64679092607
 ;;9002226.02101,"881,64679092609 ",.01)
 ;;64679092609
 ;;9002226.02101,"881,64679092609 ",.02)
 ;;64679092609
 ;;9002226.02101,"881,64679092610 ",.01)
 ;;64679092610
 ;;9002226.02101,"881,64679092610 ",.02)
 ;;64679092610
 ;;9002226.02101,"881,64679092701 ",.01)
 ;;64679092701
 ;;9002226.02101,"881,64679092701 ",.02)
 ;;64679092701
 ;;9002226.02101,"881,64679092702 ",.01)
 ;;64679092702
 ;;9002226.02101,"881,64679092702 ",.02)
 ;;64679092702
 ;;9002226.02101,"881,64679092705 ",.01)
 ;;64679092705
 ;;9002226.02101,"881,64679092705 ",.02)
 ;;64679092705
 ;;9002226.02101,"881,64679092709 ",.01)
 ;;64679092709
 ;;9002226.02101,"881,64679092709 ",.02)
 ;;64679092709
 ;;9002226.02101,"881,64679092801 ",.01)
 ;;64679092801
 ;;9002226.02101,"881,64679092801 ",.02)
 ;;64679092801
 ;;9002226.02101,"881,64679092802 ",.01)
 ;;64679092802
 ;;9002226.02101,"881,64679092802 ",.02)
 ;;64679092802
 ;;9002226.02101,"881,64679092805 ",.01)
 ;;64679092805
 ;;9002226.02101,"881,64679092805 ",.02)
 ;;64679092805
 ;;9002226.02101,"881,64679092806 ",.01)
 ;;64679092806
 ;;9002226.02101,"881,64679092806 ",.02)
 ;;64679092806
 ;;9002226.02101,"881,64679092810 ",.01)
 ;;64679092810
 ;;9002226.02101,"881,64679092810 ",.02)
 ;;64679092810
 ;;9002226.02101,"881,64679092901 ",.01)
 ;;64679092901
 ;;9002226.02101,"881,64679092901 ",.02)
 ;;64679092901
 ;;9002226.02101,"881,64679092902 ",.01)
 ;;64679092902
 ;;9002226.02101,"881,64679092902 ",.02)
 ;;64679092902
 ;;9002226.02101,"881,64679092905 ",.01)
 ;;64679092905
 ;;9002226.02101,"881,64679092905 ",.02)
 ;;64679092905
 ;;9002226.02101,"881,64679092906 ",.01)
 ;;64679092906
 ;;9002226.02101,"881,64679092906 ",.02)
 ;;64679092906
