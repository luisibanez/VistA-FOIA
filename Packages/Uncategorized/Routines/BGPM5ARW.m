BGPM5ARW ;IHS/MSC/SAT-CREATED BY ^ATXSTX ON AUG 16, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1005,58087007630 ",.02)
 ;;58087007630
 ;;9002226.02101,"1005,58087007730 ",.01)
 ;;58087007730
 ;;9002226.02101,"1005,58087007730 ",.02)
 ;;58087007730
 ;;9002226.02101,"1005,58864000630 ",.01)
 ;;58864000630
 ;;9002226.02101,"1005,58864000630 ",.02)
 ;;58864000630
 ;;9002226.02101,"1005,58864006628 ",.01)
 ;;58864006628
 ;;9002226.02101,"1005,58864006628 ",.02)
 ;;58864006628
 ;;9002226.02101,"1005,58864010430 ",.01)
 ;;58864010430
 ;;9002226.02101,"1005,58864010430 ",.02)
 ;;58864010430
 ;;9002226.02101,"1005,58864051015 ",.01)
 ;;58864051015
 ;;9002226.02101,"1005,58864051015 ",.02)
 ;;58864051015
 ;;9002226.02101,"1005,58864060315 ",.01)
 ;;58864060315
 ;;9002226.02101,"1005,58864060315 ",.02)
 ;;58864060315
 ;;9002226.02101,"1005,58864060330 ",.01)
 ;;58864060330
 ;;9002226.02101,"1005,58864060330 ",.02)
 ;;58864060330
 ;;9002226.02101,"1005,58864060390 ",.01)
 ;;58864060390
 ;;9002226.02101,"1005,58864060390 ",.02)
 ;;58864060390
 ;;9002226.02101,"1005,58864060515 ",.01)
 ;;58864060515
 ;;9002226.02101,"1005,58864060515 ",.02)
 ;;58864060515
 ;;9002226.02101,"1005,58864060530 ",.01)
 ;;58864060530
 ;;9002226.02101,"1005,58864060530 ",.02)
 ;;58864060530
 ;;9002226.02101,"1005,58864061815 ",.01)
 ;;58864061815
 ;;9002226.02101,"1005,58864061815 ",.02)
 ;;58864061815
 ;;9002226.02101,"1005,58864061830 ",.01)
 ;;58864061830
 ;;9002226.02101,"1005,58864061830 ",.02)
 ;;58864061830
 ;;9002226.02101,"1005,58864065430 ",.01)
 ;;58864065430
 ;;9002226.02101,"1005,58864065430 ",.02)
 ;;58864065430
 ;;9002226.02101,"1005,58864066130 ",.01)
 ;;58864066130
 ;;9002226.02101,"1005,58864066130 ",.02)
 ;;58864066130
 ;;9002226.02101,"1005,58864066730 ",.01)
 ;;58864066730
 ;;9002226.02101,"1005,58864066730 ",.02)
 ;;58864066730
 ;;9002226.02101,"1005,58864067430 ",.01)
 ;;58864067430
 ;;9002226.02101,"1005,58864067430 ",.02)
 ;;58864067430
 ;;9002226.02101,"1005,58864068130 ",.01)
 ;;58864068130
 ;;9002226.02101,"1005,58864068130 ",.02)
 ;;58864068130
 ;;9002226.02101,"1005,58864072615 ",.01)
 ;;58864072615
 ;;9002226.02101,"1005,58864072615 ",.02)
 ;;58864072615
 ;;9002226.02101,"1005,58864072630 ",.01)
 ;;58864072630
 ;;9002226.02101,"1005,58864072630 ",.02)
 ;;58864072630
 ;;9002226.02101,"1005,58864075030 ",.01)
 ;;58864075030
 ;;9002226.02101,"1005,58864075030 ",.02)
 ;;58864075030
 ;;9002226.02101,"1005,58864075330 ",.01)
 ;;58864075330
 ;;9002226.02101,"1005,58864075330 ",.02)
 ;;58864075330
 ;;9002226.02101,"1005,58864075390 ",.01)
 ;;58864075390
 ;;9002226.02101,"1005,58864075390 ",.02)
 ;;58864075390
 ;;9002226.02101,"1005,58864075430 ",.01)
 ;;58864075430
 ;;9002226.02101,"1005,58864075430 ",.02)
 ;;58864075430
 ;;9002226.02101,"1005,58864075530 ",.01)
 ;;58864075530
 ;;9002226.02101,"1005,58864075530 ",.02)
 ;;58864075530
 ;;9002226.02101,"1005,58864076230 ",.01)
 ;;58864076230
 ;;9002226.02101,"1005,58864076230 ",.02)
 ;;58864076230
 ;;9002226.02101,"1005,58864077115 ",.01)
 ;;58864077115
 ;;9002226.02101,"1005,58864077115 ",.02)
 ;;58864077115
 ;;9002226.02101,"1005,58864077430 ",.01)
 ;;58864077430
 ;;9002226.02101,"1005,58864077430 ",.02)
 ;;58864077430
 ;;9002226.02101,"1005,58864077490 ",.01)
 ;;58864077490
 ;;9002226.02101,"1005,58864077490 ",.02)
 ;;58864077490
 ;;9002226.02101,"1005,58864078730 ",.01)
 ;;58864078730
 ;;9002226.02101,"1005,58864078730 ",.02)
 ;;58864078730
 ;;9002226.02101,"1005,58864083830 ",.01)
 ;;58864083830
 ;;9002226.02101,"1005,58864083830 ",.02)
 ;;58864083830
 ;;9002226.02101,"1005,58864084730 ",.01)
 ;;58864084730
 ;;9002226.02101,"1005,58864084730 ",.02)
 ;;58864084730
 ;;9002226.02101,"1005,58864085930 ",.01)
 ;;58864085930
 ;;9002226.02101,"1005,58864085930 ",.02)
 ;;58864085930
 ;;9002226.02101,"1005,58864086330 ",.01)
 ;;58864086330
 ;;9002226.02101,"1005,58864086330 ",.02)
 ;;58864086330
 ;;9002226.02101,"1005,58864086930 ",.01)
 ;;58864086930
 ;;9002226.02101,"1005,58864086930 ",.02)
 ;;58864086930
 ;;9002226.02101,"1005,59564012820 ",.01)
 ;;59564012820
 ;;9002226.02101,"1005,59564012820 ",.02)
 ;;59564012820
 ;;9002226.02101,"1005,59762227001 ",.01)
 ;;59762227001
 ;;9002226.02101,"1005,59762227001 ",.02)
 ;;59762227001
 ;;9002226.02101,"1005,59762227003 ",.01)
 ;;59762227003
 ;;9002226.02101,"1005,59762227003 ",.02)
 ;;59762227003
 ;;9002226.02101,"1005,59762227007 ",.01)
 ;;59762227007
 ;;9002226.02101,"1005,59762227007 ",.02)
 ;;59762227007
 ;;9002226.02101,"1005,59762227101 ",.01)
 ;;59762227101
 ;;9002226.02101,"1005,59762227101 ",.02)
 ;;59762227101
 ;;9002226.02101,"1005,59762227103 ",.01)
 ;;59762227103
 ;;9002226.02101,"1005,59762227103 ",.02)
 ;;59762227103
 ;;9002226.02101,"1005,59762227107 ",.01)
 ;;59762227107
 ;;9002226.02101,"1005,59762227107 ",.02)
 ;;59762227107
 ;;9002226.02101,"1005,59762227201 ",.01)
 ;;59762227201
 ;;9002226.02101,"1005,59762227201 ",.02)
 ;;59762227201
 ;;9002226.02101,"1005,59762227203 ",.01)
 ;;59762227203
 ;;9002226.02101,"1005,59762227203 ",.02)
 ;;59762227203
 ;;9002226.02101,"1005,59762227207 ",.01)
 ;;59762227207
 ;;9002226.02101,"1005,59762227207 ",.02)
 ;;59762227207
 ;;9002226.02101,"1005,59762227301 ",.01)
 ;;59762227301
 ;;9002226.02101,"1005,59762227301 ",.02)
 ;;59762227301
 ;;9002226.02101,"1005,59762227303 ",.01)
 ;;59762227303
 ;;9002226.02101,"1005,59762227303 ",.02)
 ;;59762227303
 ;;9002226.02101,"1005,59762227307 ",.01)
 ;;59762227307
 ;;9002226.02101,"1005,59762227307 ",.02)
 ;;59762227307
 ;;9002226.02101,"1005,59762227401 ",.01)
 ;;59762227401
 ;;9002226.02101,"1005,59762227401 ",.02)
 ;;59762227401
 ;;9002226.02101,"1005,59762227403 ",.01)
 ;;59762227403
 ;;9002226.02101,"1005,59762227403 ",.02)
 ;;59762227403
 ;;9002226.02101,"1005,59762227407 ",.01)
 ;;59762227407
 ;;9002226.02101,"1005,59762227407 ",.02)
 ;;59762227407
 ;;9002226.02101,"1005,59762227501 ",.01)
 ;;59762227501
 ;;9002226.02101,"1005,59762227501 ",.02)
 ;;59762227501
 ;;9002226.02101,"1005,59762227503 ",.01)
 ;;59762227503
 ;;9002226.02101,"1005,59762227503 ",.02)
 ;;59762227503
 ;;9002226.02101,"1005,59762227507 ",.01)
 ;;59762227507
 ;;9002226.02101,"1005,59762227507 ",.02)
 ;;59762227507
 ;;9002226.02101,"1005,59762329301 ",.01)
 ;;59762329301
 ;;9002226.02101,"1005,59762329301 ",.02)
 ;;59762329301
 ;;9002226.02101,"1005,59762329302 ",.01)
 ;;59762329302
 ;;9002226.02101,"1005,59762329302 ",.02)
 ;;59762329302
 ;;9002226.02101,"1005,59762329303 ",.01)
 ;;59762329303
 ;;9002226.02101,"1005,59762329303 ",.02)
 ;;59762329303
 ;;9002226.02101,"1005,59762329304 ",.01)
 ;;59762329304
 ;;9002226.02101,"1005,59762329304 ",.02)
 ;;59762329304
 ;;9002226.02101,"1005,59762329401 ",.01)
 ;;59762329401
 ;;9002226.02101,"1005,59762329401 ",.02)
 ;;59762329401
 ;;9002226.02101,"1005,59762329402 ",.01)
 ;;59762329402
 ;;9002226.02101,"1005,59762329402 ",.02)
 ;;59762329402
 ;;9002226.02101,"1005,59762329403 ",.01)
 ;;59762329403
 ;;9002226.02101,"1005,59762329403 ",.02)
 ;;59762329403
 ;;9002226.02101,"1005,59762329404 ",.01)
 ;;59762329404
 ;;9002226.02101,"1005,59762329404 ",.02)
 ;;59762329404
 ;;9002226.02101,"1005,59762329501 ",.01)
 ;;59762329501
 ;;9002226.02101,"1005,59762329501 ",.02)
 ;;59762329501
 ;;9002226.02101,"1005,59762329502 ",.01)
 ;;59762329502
 ;;9002226.02101,"1005,59762329502 ",.02)
 ;;59762329502
 ;;9002226.02101,"1005,59762329503 ",.01)
 ;;59762329503
 ;;9002226.02101,"1005,59762329503 ",.02)
 ;;59762329503
 ;;9002226.02101,"1005,59762329504 ",.01)
 ;;59762329504
 ;;9002226.02101,"1005,59762329504 ",.02)
 ;;59762329504
 ;;9002226.02101,"1005,59762501901 ",.01)
 ;;59762501901
 ;;9002226.02101,"1005,59762501901 ",.02)
 ;;59762501901
 ;;9002226.02101,"1005,59762502001 ",.01)
 ;;59762502001
 ;;9002226.02101,"1005,59762502001 ",.02)
 ;;59762502001
 ;;9002226.02101,"1005,59762502101 ",.01)
 ;;59762502101
 ;;9002226.02101,"1005,59762502101 ",.02)
 ;;59762502101
 ;;9002226.02101,"1005,59762502201 ",.01)
 ;;59762502201
 ;;9002226.02101,"1005,59762502201 ",.02)
 ;;59762502201
 ;;9002226.02101,"1005,59762525001 ",.01)
 ;;59762525001
 ;;9002226.02101,"1005,59762525001 ",.02)
 ;;59762525001
 ;;9002226.02101,"1005,59762525004 ",.01)
 ;;59762525004
 ;;9002226.02101,"1005,59762525004 ",.02)
 ;;59762525004
 ;;9002226.02101,"1005,59762525101 ",.01)
 ;;59762525101
 ;;9002226.02101,"1005,59762525101 ",.02)
 ;;59762525101
 ;;9002226.02101,"1005,59762525104 ",.01)
 ;;59762525104
 ;;9002226.02101,"1005,59762525104 ",.02)
 ;;59762525104
 ;;9002226.02101,"1005,59772704501 ",.01)
 ;;59772704501
 ;;9002226.02101,"1005,59772704501 ",.02)
 ;;59772704501
 ;;9002226.02101,"1005,59772704503 ",.01)
 ;;59772704503
 ;;9002226.02101,"1005,59772704503 ",.02)
 ;;59772704503
 ;;9002226.02101,"1005,59772704504 ",.01)
 ;;59772704504
 ;;9002226.02101,"1005,59772704504 ",.02)
 ;;59772704504
 ;;9002226.02101,"1005,59772704505 ",.01)
 ;;59772704505
 ;;9002226.02101,"1005,59772704505 ",.02)
 ;;59772704505
 ;;9002226.02101,"1005,59772704601 ",.01)
 ;;59772704601
 ;;9002226.02101,"1005,59772704601 ",.02)
 ;;59772704601
 ;;9002226.02101,"1005,59772704602 ",.01)
 ;;59772704602
 ;;9002226.02101,"1005,59772704602 ",.02)
 ;;59772704602
 ;;9002226.02101,"1005,59772704603 ",.01)
 ;;59772704603
 ;;9002226.02101,"1005,59772704603 ",.02)
 ;;59772704603
 ;;9002226.02101,"1005,59772704604 ",.01)
 ;;59772704604
 ;;9002226.02101,"1005,59772704604 ",.02)
 ;;59772704604
 ;;9002226.02101,"1005,59772704701 ",.01)
 ;;59772704701
 ;;9002226.02101,"1005,59772704701 ",.02)
 ;;59772704701
 ;;9002226.02101,"1005,59772704703 ",.01)
 ;;59772704703
 ;;9002226.02101,"1005,59772704703 ",.02)
 ;;59772704703
 ;;9002226.02101,"1005,59772704704 ",.01)
 ;;59772704704
 ;;9002226.02101,"1005,59772704704 ",.02)
 ;;59772704704
 ;;9002226.02101,"1005,59772704801 ",.01)
 ;;59772704801
 ;;9002226.02101,"1005,59772704801 ",.02)
 ;;59772704801
 ;;9002226.02101,"1005,60312001430 ",.01)
 ;;60312001430
 ;;9002226.02101,"1005,60312001430 ",.02)
 ;;60312001430
 ;;9002226.02101,"1005,60312001490 ",.01)
 ;;60312001490
 ;;9002226.02101,"1005,60312001490 ",.02)
 ;;60312001490
 ;;9002226.02101,"1005,60312001954 ",.01)
 ;;60312001954
 ;;9002226.02101,"1005,60312001954 ",.02)
 ;;60312001954
 ;;9002226.02101,"1005,60312010654 ",.01)
 ;;60312010654
 ;;9002226.02101,"1005,60312010654 ",.02)
 ;;60312010654
 ;;9002226.02101,"1005,60312011000 ",.01)
 ;;60312011000
 ;;9002226.02101,"1005,60312011000 ",.02)
 ;;60312011000
 ;;9002226.02101,"1005,60312011100 ",.01)
 ;;60312011100
 ;;9002226.02101,"1005,60312011100 ",.02)
 ;;60312011100
 ;;9002226.02101,"1005,60312011200 ",.01)
 ;;60312011200
 ;;9002226.02101,"1005,60312011200 ",.02)
 ;;60312011200
 ;;9002226.02101,"1005,60312014058 ",.01)
 ;;60312014058
 ;;9002226.02101,"1005,60312014058 ",.02)
 ;;60312014058
 ;;9002226.02101,"1005,60312014558 ",.01)
 ;;60312014558
 ;;9002226.02101,"1005,60312014558 ",.02)
 ;;60312014558
 ;;9002226.02101,"1005,60312020754 ",.01)
 ;;60312020754
 ;;9002226.02101,"1005,60312020754 ",.02)
 ;;60312020754
 ;;9002226.02101,"1005,60312071210 ",.01)
 ;;60312071210
 ;;9002226.02101,"1005,60312071210 ",.02)
 ;;60312071210
 ;;9002226.02101,"1005,60312071230 ",.01)
 ;;60312071230
 ;;9002226.02101,"1005,60312071230 ",.02)
 ;;60312071230
 ;;9002226.02101,"1005,60312071290 ",.01)
 ;;60312071290
 ;;9002226.02101,"1005,60312071290 ",.02)
 ;;60312071290
 ;;9002226.02101,"1005,60312071310 ",.01)
 ;;60312071310
 ;;9002226.02101,"1005,60312071310 ",.02)
 ;;60312071310
 ;;9002226.02101,"1005,60312071330 ",.01)
 ;;60312071330
 ;;9002226.02101,"1005,60312071330 ",.02)
 ;;60312071330
