BGPM5AXB ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON AUG 29, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1033,68084027830 ",.01)
 ;;68084027830
 ;;9002226.02101,"1033,68084027830 ",.02)
 ;;68084027830
 ;;9002226.02101,"1033,68084027865 ",.01)
 ;;68084027865
 ;;9002226.02101,"1033,68084027865 ",.02)
 ;;68084027865
 ;;9002226.02101,"1033,68084027889 ",.01)
 ;;68084027889
 ;;9002226.02101,"1033,68084027889 ",.02)
 ;;68084027889
 ;;9002226.02101,"1033,68084028901 ",.01)
 ;;68084028901
 ;;9002226.02101,"1033,68084028901 ",.02)
 ;;68084028901
 ;;9002226.02101,"1033,68084028911 ",.01)
 ;;68084028911
 ;;9002226.02101,"1033,68084028911 ",.02)
 ;;68084028911
 ;;9002226.02101,"1033,68084044311 ",.01)
 ;;68084044311
 ;;9002226.02101,"1033,68084044311 ",.02)
 ;;68084044311
 ;;9002226.02101,"1033,68084044365 ",.01)
 ;;68084044365
 ;;9002226.02101,"1033,68084044365 ",.02)
 ;;68084044365
 ;;9002226.02101,"1033,68084048301 ",.01)
 ;;68084048301
 ;;9002226.02101,"1033,68084048301 ",.02)
 ;;68084048301
 ;;9002226.02101,"1033,68084048311 ",.01)
 ;;68084048311
 ;;9002226.02101,"1033,68084048311 ",.02)
 ;;68084048311
 ;;9002226.02101,"1033,68115002606 ",.01)
 ;;68115002606
 ;;9002226.02101,"1033,68115002606 ",.02)
 ;;68115002606
 ;;9002226.02101,"1033,68115002609 ",.01)
 ;;68115002609
 ;;9002226.02101,"1033,68115002609 ",.02)
 ;;68115002609
 ;;9002226.02101,"1033,68115002615 ",.01)
 ;;68115002615
 ;;9002226.02101,"1033,68115002615 ",.02)
 ;;68115002615
 ;;9002226.02101,"1033,68115002640 ",.01)
 ;;68115002640
 ;;9002226.02101,"1033,68115002640 ",.02)
 ;;68115002640
 ;;9002226.02101,"1033,68115002920 ",.01)
 ;;68115002920
 ;;9002226.02101,"1033,68115002920 ",.02)
 ;;68115002920
 ;;9002226.02101,"1033,68115003010 ",.01)
 ;;68115003010
 ;;9002226.02101,"1033,68115003010 ",.02)
 ;;68115003010
 ;;9002226.02101,"1033,68115003240 ",.01)
 ;;68115003240
 ;;9002226.02101,"1033,68115003240 ",.02)
 ;;68115003240
 ;;9002226.02101,"1033,68115003315 ",.01)
 ;;68115003315
 ;;9002226.02101,"1033,68115003315 ",.02)
 ;;68115003315
 ;;9002226.02101,"1033,68115003340 ",.01)
 ;;68115003340
 ;;9002226.02101,"1033,68115003340 ",.02)
 ;;68115003340
 ;;9002226.02101,"1033,68115006720 ",.01)
 ;;68115006720
 ;;9002226.02101,"1033,68115006720 ",.02)
 ;;68115006720
 ;;9002226.02101,"1033,68115009020 ",.01)
 ;;68115009020
 ;;9002226.02101,"1033,68115009020 ",.02)
 ;;68115009020
 ;;9002226.02101,"1033,68115010406 ",.01)
 ;;68115010406
 ;;9002226.02101,"1033,68115010406 ",.02)
 ;;68115010406
 ;;9002226.02101,"1033,68115010440 ",.01)
 ;;68115010440
 ;;9002226.02101,"1033,68115010440 ",.02)
 ;;68115010440
 ;;9002226.02101,"1033,68115010530 ",.01)
 ;;68115010530
 ;;9002226.02101,"1033,68115010530 ",.02)
 ;;68115010530
 ;;9002226.02101,"1033,68115010540 ",.01)
 ;;68115010540
 ;;9002226.02101,"1033,68115010540 ",.02)
 ;;68115010540
 ;;9002226.02101,"1033,68115012528 ",.01)
 ;;68115012528
 ;;9002226.02101,"1033,68115012528 ",.02)
 ;;68115012528
 ;;9002226.02101,"1033,68115042128 ",.01)
 ;;68115042128
 ;;9002226.02101,"1033,68115042128 ",.02)
 ;;68115042128
 ;;9002226.02101,"1033,68115044522 ",.01)
 ;;68115044522
 ;;9002226.02101,"1033,68115044522 ",.02)
 ;;68115044522
 ;;9002226.02101,"1033,68115060110 ",.01)
 ;;68115060110
 ;;9002226.02101,"1033,68115060110 ",.02)
 ;;68115060110
 ;;9002226.02101,"1033,68164010040 ",.01)
 ;;68164010040
 ;;9002226.02101,"1033,68164010040 ",.02)
 ;;68164010040
 ;;9002226.02101,"1033,68180012101 ",.01)
 ;;68180012101
 ;;9002226.02101,"1033,68180012101 ",.02)
 ;;68180012101
 ;;9002226.02101,"1033,68180012102 ",.01)
 ;;68180012102
 ;;9002226.02101,"1033,68180012102 ",.02)
 ;;68180012102
 ;;9002226.02101,"1033,68180012201 ",.01)
 ;;68180012201
 ;;9002226.02101,"1033,68180012201 ",.02)
 ;;68180012201
 ;;9002226.02101,"1033,68180012202 ",.01)
 ;;68180012202
 ;;9002226.02101,"1033,68180012202 ",.02)
 ;;68180012202
 ;;9002226.02101,"1033,68180012301 ",.01)
 ;;68180012301
 ;;9002226.02101,"1033,68180012301 ",.02)
 ;;68180012301
 ;;9002226.02101,"1033,68180012302 ",.01)
 ;;68180012302
 ;;9002226.02101,"1033,68180012302 ",.02)
 ;;68180012302
 ;;9002226.02101,"1033,68180012401 ",.01)
 ;;68180012401
 ;;9002226.02101,"1033,68180012401 ",.02)
 ;;68180012401
 ;;9002226.02101,"1033,68180012402 ",.01)
 ;;68180012402
 ;;9002226.02101,"1033,68180012402 ",.02)
 ;;68180012402
 ;;9002226.02101,"1033,68180018001 ",.01)
 ;;68180018001
 ;;9002226.02101,"1033,68180018001 ",.02)
 ;;68180018001
 ;;9002226.02101,"1033,68180018008 ",.01)
 ;;68180018008
 ;;9002226.02101,"1033,68180018008 ",.02)
 ;;68180018008
 ;;9002226.02101,"1033,68180018101 ",.01)
 ;;68180018101
 ;;9002226.02101,"1033,68180018101 ",.02)
 ;;68180018101
 ;;9002226.02101,"1033,68180018102 ",.01)
 ;;68180018102
 ;;9002226.02101,"1033,68180018102 ",.02)
 ;;68180018102
 ;;9002226.02101,"1033,68180018201 ",.01)
 ;;68180018201
 ;;9002226.02101,"1033,68180018201 ",.02)
 ;;68180018201
 ;;9002226.02101,"1033,68180018202 ",.01)
 ;;68180018202
 ;;9002226.02101,"1033,68180018202 ",.02)
 ;;68180018202
 ;;9002226.02101,"1033,68180018203 ",.01)
 ;;68180018203
 ;;9002226.02101,"1033,68180018203 ",.02)
 ;;68180018203
 ;;9002226.02101,"1033,68180024201 ",.01)
 ;;68180024201
 ;;9002226.02101,"1033,68180024201 ",.02)
 ;;68180024201
 ;;9002226.02101,"1033,68180024202 ",.01)
 ;;68180024202
 ;;9002226.02101,"1033,68180024202 ",.02)
 ;;68180024202
 ;;9002226.02101,"1033,68180024211 ",.01)
 ;;68180024211
 ;;9002226.02101,"1033,68180024211 ",.02)
 ;;68180024211
 ;;9002226.02101,"1033,68180024220 ",.01)
 ;;68180024220
 ;;9002226.02101,"1033,68180024220 ",.02)
 ;;68180024220
 ;;9002226.02101,"1033,68180030220 ",.01)
 ;;68180030220
 ;;9002226.02101,"1033,68180030220 ",.02)
 ;;68180030220
 ;;9002226.02101,"1033,68180030260 ",.01)
 ;;68180030260
 ;;9002226.02101,"1033,68180030260 ",.02)
 ;;68180030260
 ;;9002226.02101,"1033,68180030320 ",.01)
 ;;68180030320
 ;;9002226.02101,"1033,68180030320 ",.02)
 ;;68180030320
 ;;9002226.02101,"1033,68180030360 ",.01)
 ;;68180030360
 ;;9002226.02101,"1033,68180030360 ",.02)
 ;;68180030360
 ;;9002226.02101,"1033,68180040101 ",.01)
 ;;68180040101
 ;;9002226.02101,"1033,68180040101 ",.02)
 ;;68180040101
 ;;9002226.02101,"1033,68180040102 ",.01)
 ;;68180040102
 ;;9002226.02101,"1033,68180040102 ",.02)
 ;;68180040102
 ;;9002226.02101,"1033,68180040103 ",.01)
 ;;68180040103
 ;;9002226.02101,"1033,68180040103 ",.02)
 ;;68180040103
 ;;9002226.02101,"1033,68180040201 ",.01)
 ;;68180040201
 ;;9002226.02101,"1033,68180040201 ",.02)
 ;;68180040201
 ;;9002226.02101,"1033,68180040202 ",.01)
 ;;68180040202
 ;;9002226.02101,"1033,68180040202 ",.02)
 ;;68180040202
 ;;9002226.02101,"1033,68180040203 ",.01)
 ;;68180040203
 ;;9002226.02101,"1033,68180040203 ",.02)
 ;;68180040203
 ;;9002226.02101,"1033,68180040301 ",.01)
 ;;68180040301
 ;;9002226.02101,"1033,68180040301 ",.02)
 ;;68180040301
 ;;9002226.02101,"1033,68180040401 ",.01)
 ;;68180040401
 ;;9002226.02101,"1033,68180040401 ",.02)
 ;;68180040401
 ;;9002226.02101,"1033,68180040402 ",.01)
 ;;68180040402
 ;;9002226.02101,"1033,68180040402 ",.02)
 ;;68180040402
 ;;9002226.02101,"1033,68180061101 ",.01)
 ;;68180061101
 ;;9002226.02101,"1033,68180061101 ",.02)
 ;;68180061101
 ;;9002226.02101,"1033,68180061110 ",.01)
 ;;68180061110
 ;;9002226.02101,"1033,68180061110 ",.02)
 ;;68180061110
 ;;9002226.02101,"1033,68180062201 ",.01)
 ;;68180062201
 ;;9002226.02101,"1033,68180062201 ",.02)
 ;;68180062201
 ;;9002226.02101,"1033,68180062210 ",.01)
 ;;68180062210
 ;;9002226.02101,"1033,68180062210 ",.02)
 ;;68180062210
 ;;9002226.02101,"1033,68180063301 ",.01)
 ;;68180063301
 ;;9002226.02101,"1033,68180063301 ",.02)
 ;;68180063301
 ;;9002226.02101,"1033,68180063310 ",.01)
 ;;68180063310
 ;;9002226.02101,"1033,68180063310 ",.02)
 ;;68180063310
 ;;9002226.02101,"1033,68180064401 ",.01)
 ;;68180064401
 ;;9002226.02101,"1033,68180064401 ",.02)
 ;;68180064401
 ;;9002226.02101,"1033,68180064410 ",.01)
 ;;68180064410
 ;;9002226.02101,"1033,68180064410 ",.02)
 ;;68180064410
 ;;9002226.02101,"1033,68180065501 ",.01)
 ;;68180065501
 ;;9002226.02101,"1033,68180065501 ",.02)
 ;;68180065501
 ;;9002226.02101,"1033,68180071160 ",.01)
 ;;68180071160
 ;;9002226.02101,"1033,68180071160 ",.02)
 ;;68180071160
 ;;9002226.02101,"1033,68180072210 ",.01)
 ;;68180072210
 ;;9002226.02101,"1033,68180072210 ",.02)
 ;;68180072210
 ;;9002226.02101,"1033,68180072220 ",.01)
 ;;68180072220
 ;;9002226.02101,"1033,68180072220 ",.02)
 ;;68180072220
 ;;9002226.02101,"1033,68180072310 ",.01)
 ;;68180072310
 ;;9002226.02101,"1033,68180072310 ",.02)
 ;;68180072310
 ;;9002226.02101,"1033,68180072320 ",.01)
 ;;68180072320
 ;;9002226.02101,"1033,68180072320 ",.02)
 ;;68180072320
 ;;9002226.02101,"1033,68258930002 ",.01)
 ;;68258930002
 ;;9002226.02101,"1033,68258930002 ",.02)
 ;;68258930002
 ;;9002226.02101,"1033,68289000101 ",.01)
 ;;68289000101
 ;;9002226.02101,"1033,68289000101 ",.02)
 ;;68289000101
 ;;9002226.02101,"1033,68289000155 ",.01)
 ;;68289000155
 ;;9002226.02101,"1033,68289000155 ",.02)
 ;;68289000155
 ;;9002226.02101,"1033,68289000201 ",.01)
 ;;68289000201
 ;;9002226.02101,"1033,68289000201 ",.02)
 ;;68289000201
 ;;9002226.02101,"1033,68289000255 ",.01)
 ;;68289000255
 ;;9002226.02101,"1033,68289000255 ",.02)
 ;;68289000255
 ;;9002226.02101,"1033,68289000301 ",.01)
 ;;68289000301
 ;;9002226.02101,"1033,68289000301 ",.02)
 ;;68289000301
 ;;9002226.02101,"1033,68289000350 ",.01)
 ;;68289000350
 ;;9002226.02101,"1033,68289000350 ",.02)
 ;;68289000350
 ;;9002226.02101,"1033,68289000401 ",.01)
 ;;68289000401
 ;;9002226.02101,"1033,68289000401 ",.02)
 ;;68289000401
 ;;9002226.02101,"1033,68289000415 ",.01)
 ;;68289000415
 ;;9002226.02101,"1033,68289000415 ",.02)
 ;;68289000415
 ;;9002226.02101,"1033,68289000501 ",.01)
 ;;68289000501
 ;;9002226.02101,"1033,68289000501 ",.02)
 ;;68289000501
 ;;9002226.02101,"1033,68289000515 ",.01)
 ;;68289000515
 ;;9002226.02101,"1033,68289000515 ",.02)
 ;;68289000515
 ;;9002226.02101,"1033,68289000801 ",.01)
 ;;68289000801
 ;;9002226.02101,"1033,68289000801 ",.02)
 ;;68289000801
 ;;9002226.02101,"1033,68289000820 ",.01)
 ;;68289000820
 ;;9002226.02101,"1033,68289000820 ",.02)
 ;;68289000820
 ;;9002226.02101,"1033,68289000901 ",.01)
 ;;68289000901
 ;;9002226.02101,"1033,68289000901 ",.02)
 ;;68289000901
 ;;9002226.02101,"1033,68289000920 ",.01)
 ;;68289000920
 ;;9002226.02101,"1033,68289000920 ",.02)
 ;;68289000920
 ;;9002226.02101,"1033,68289005101 ",.01)
 ;;68289005101
 ;;9002226.02101,"1033,68289005101 ",.02)
 ;;68289005101
 ;;9002226.02101,"1033,68289005122 ",.01)
 ;;68289005122
 ;;9002226.02101,"1033,68289005122 ",.02)
 ;;68289005122
 ;;9002226.02101,"1033,68289005150 ",.01)
 ;;68289005150
 ;;9002226.02101,"1033,68289005150 ",.02)
 ;;68289005150
 ;;9002226.02101,"1033,68330000101 ",.01)
 ;;68330000101
 ;;9002226.02101,"1033,68330000101 ",.02)
 ;;68330000101
 ;;9002226.02101,"1033,68330000110 ",.01)
 ;;68330000110
 ;;9002226.02101,"1033,68330000110 ",.02)
 ;;68330000110
 ;;9002226.02101,"1033,68330000201 ",.01)
 ;;68330000201
 ;;9002226.02101,"1033,68330000201 ",.02)
 ;;68330000201
 ;;9002226.02101,"1033,68330000210 ",.01)
 ;;68330000210
 ;;9002226.02101,"1033,68330000210 ",.02)
 ;;68330000210
 ;;9002226.02101,"1033,68330000301 ",.01)
 ;;68330000301
 ;;9002226.02101,"1033,68330000301 ",.02)
 ;;68330000301
 ;;9002226.02101,"1033,68330000310 ",.01)
 ;;68330000310
 ;;9002226.02101,"1033,68330000310 ",.02)
 ;;68330000310
 ;;9002226.02101,"1033,68330000401 ",.01)
 ;;68330000401
 ;;9002226.02101,"1033,68330000401 ",.02)
 ;;68330000401
 ;;9002226.02101,"1033,68330000410 ",.01)
 ;;68330000410
