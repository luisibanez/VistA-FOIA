BGPM5AWD ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON AUG 29, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1033,59762153701 ",.01)
 ;;59762153701
 ;;9002226.02101,"1033,59762153701 ",.02)
 ;;59762153701
 ;;9002226.02101,"1033,59762153702 ",.01)
 ;;59762153702
 ;;9002226.02101,"1033,59762153702 ",.02)
 ;;59762153702
 ;;9002226.02101,"1033,59762153703 ",.01)
 ;;59762153703
 ;;9002226.02101,"1033,59762153703 ",.02)
 ;;59762153703
 ;;9002226.02101,"1033,59762200001 ",.01)
 ;;59762200001
 ;;9002226.02101,"1033,59762200001 ",.02)
 ;;59762200001
 ;;9002226.02101,"1033,59762200004 ",.01)
 ;;59762200004
 ;;9002226.02101,"1033,59762200004 ",.02)
 ;;59762200004
 ;;9002226.02101,"1033,59762218001 ",.01)
 ;;59762218001
 ;;9002226.02101,"1033,59762218001 ",.02)
 ;;59762218001
 ;;9002226.02101,"1033,59762222002 ",.01)
 ;;59762222002
 ;;9002226.02101,"1033,59762222002 ",.02)
 ;;59762222002
 ;;9002226.02101,"1033,59762222101 ",.01)
 ;;59762222101
 ;;9002226.02101,"1033,59762222101 ",.02)
 ;;59762222101
 ;;9002226.02101,"1033,59762222102 ",.01)
 ;;59762222102
 ;;9002226.02101,"1033,59762222102 ",.02)
 ;;59762222102
 ;;9002226.02101,"1033,59762302001 ",.01)
 ;;59762302001
 ;;9002226.02101,"1033,59762302001 ",.02)
 ;;59762302001
 ;;9002226.02101,"1033,59762302002 ",.01)
 ;;59762302002
 ;;9002226.02101,"1033,59762302002 ",.02)
 ;;59762302002
 ;;9002226.02101,"1033,59762302101 ",.01)
 ;;59762302101
 ;;9002226.02101,"1033,59762302101 ",.02)
 ;;59762302101
 ;;9002226.02101,"1033,59762302102 ",.01)
 ;;59762302102
 ;;9002226.02101,"1033,59762302102 ",.02)
 ;;59762302102
 ;;9002226.02101,"1033,59762305101 ",.01)
 ;;59762305101
 ;;9002226.02101,"1033,59762305101 ",.02)
 ;;59762305101
 ;;9002226.02101,"1033,59762305102 ",.01)
 ;;59762305102
 ;;9002226.02101,"1033,59762305102 ",.02)
 ;;59762305102
 ;;9002226.02101,"1033,59762306002 ",.01)
 ;;59762306002
 ;;9002226.02101,"1033,59762306002 ",.02)
 ;;59762306002
 ;;9002226.02101,"1033,59762306003 ",.01)
 ;;59762306003
 ;;9002226.02101,"1033,59762306003 ",.02)
 ;;59762306003
 ;;9002226.02101,"1033,59762311001 ",.01)
 ;;59762311001
 ;;9002226.02101,"1033,59762311001 ",.02)
 ;;59762311001
 ;;9002226.02101,"1033,59762312001 ",.01)
 ;;59762312001
 ;;9002226.02101,"1033,59762312001 ",.02)
 ;;59762312001
 ;;9002226.02101,"1033,59762313001 ",.01)
 ;;59762313001
 ;;9002226.02101,"1033,59762313001 ",.02)
 ;;59762313001
 ;;9002226.02101,"1033,59762314001 ",.01)
 ;;59762314001
 ;;9002226.02101,"1033,59762314001 ",.02)
 ;;59762314001
 ;;9002226.02101,"1033,59762332801 ",.01)
 ;;59762332801
 ;;9002226.02101,"1033,59762332801 ",.02)
 ;;59762332801
 ;;9002226.02101,"1033,59762372801 ",.01)
 ;;59762372801
 ;;9002226.02101,"1033,59762372801 ",.02)
 ;;59762372801
 ;;9002226.02101,"1033,59762372802 ",.01)
 ;;59762372802
 ;;9002226.02101,"1033,59762372802 ",.02)
 ;;59762372802
 ;;9002226.02101,"1033,59762372803 ",.01)
 ;;59762372803
 ;;9002226.02101,"1033,59762372803 ",.02)
 ;;59762372803
 ;;9002226.02101,"1033,59762374301 ",.01)
 ;;59762374301
 ;;9002226.02101,"1033,59762374301 ",.02)
 ;;59762374301
 ;;9002226.02101,"1033,59762374302 ",.01)
 ;;59762374302
 ;;9002226.02101,"1033,59762374302 ",.02)
 ;;59762374302
 ;;9002226.02101,"1033,59762374401 ",.01)
 ;;59762374401
 ;;9002226.02101,"1033,59762374401 ",.02)
 ;;59762374401
 ;;9002226.02101,"1033,59762408001 ",.01)
 ;;59762408001
 ;;9002226.02101,"1033,59762408001 ",.02)
 ;;59762408001
 ;;9002226.02101,"1033,59762408002 ",.01)
 ;;59762408002
 ;;9002226.02101,"1033,59762408002 ",.02)
 ;;59762408002
 ;;9002226.02101,"1033,59762408101 ",.01)
 ;;59762408101
 ;;9002226.02101,"1033,59762408101 ",.02)
 ;;59762408101
 ;;9002226.02101,"1033,59762408102 ",.01)
 ;;59762408102
 ;;9002226.02101,"1033,59762408102 ",.02)
 ;;59762408102
 ;;9002226.02101,"1033,59762500901 ",.01)
 ;;59762500901
 ;;9002226.02101,"1033,59762500901 ",.02)
 ;;59762500901
 ;;9002226.02101,"1033,59762501001 ",.01)
 ;;59762501001
 ;;9002226.02101,"1033,59762501001 ",.02)
 ;;59762501001
 ;;9002226.02101,"1033,59762501002 ",.01)
 ;;59762501002
 ;;9002226.02101,"1033,59762501002 ",.02)
 ;;59762501002
 ;;9002226.02101,"1033,59772013901 ",.01)
 ;;59772013901
 ;;9002226.02101,"1033,59772013901 ",.02)
 ;;59772013901
 ;;9002226.02101,"1033,59772013902 ",.01)
 ;;59772013902
 ;;9002226.02101,"1033,59772013902 ",.02)
 ;;59772013902
 ;;9002226.02101,"1033,59772017001 ",.01)
 ;;59772017001
 ;;9002226.02101,"1033,59772017001 ",.02)
 ;;59772017001
 ;;9002226.02101,"1033,59772017401 ",.01)
 ;;59772017401
 ;;9002226.02101,"1033,59772017401 ",.02)
 ;;59772017401
 ;;9002226.02101,"1033,59772017402 ",.01)
 ;;59772017402
 ;;9002226.02101,"1033,59772017402 ",.02)
 ;;59772017402
 ;;9002226.02101,"1033,59772017420 ",.01)
 ;;59772017420
 ;;9002226.02101,"1033,59772017420 ",.02)
 ;;59772017420
 ;;9002226.02101,"1033,59772080202 ",.01)
 ;;59772080202
 ;;9002226.02101,"1033,59772080202 ",.02)
 ;;59772080202
 ;;9002226.02101,"1033,59772080301 ",.01)
 ;;59772080301
 ;;9002226.02101,"1033,59772080301 ",.02)
 ;;59772080301
 ;;9002226.02101,"1033,59772080302 ",.01)
 ;;59772080302
 ;;9002226.02101,"1033,59772080302 ",.02)
 ;;59772080302
 ;;9002226.02101,"1033,59772080801 ",.01)
 ;;59772080801
 ;;9002226.02101,"1033,59772080801 ",.02)
 ;;59772080801
 ;;9002226.02101,"1033,59772094001 ",.01)
 ;;59772094001
 ;;9002226.02101,"1033,59772094001 ",.02)
 ;;59772094001
 ;;9002226.02101,"1033,59772094002 ",.01)
 ;;59772094002
 ;;9002226.02101,"1033,59772094002 ",.02)
 ;;59772094002
 ;;9002226.02101,"1033,59772604801 ",.01)
 ;;59772604801
 ;;9002226.02101,"1033,59772604801 ",.02)
 ;;59772604801
 ;;9002226.02101,"1033,59772605801 ",.01)
 ;;59772605801
 ;;9002226.02101,"1033,59772605801 ",.02)
 ;;59772605801
 ;;9002226.02101,"1033,59772727103 ",.01)
 ;;59772727103
 ;;9002226.02101,"1033,59772727103 ",.02)
 ;;59772727103
 ;;9002226.02101,"1033,59772727104 ",.01)
 ;;59772727104
 ;;9002226.02101,"1033,59772727104 ",.02)
 ;;59772727104
 ;;9002226.02101,"1033,59772727107 ",.01)
 ;;59772727107
 ;;9002226.02101,"1033,59772727107 ",.02)
 ;;59772727107
 ;;9002226.02101,"1033,59772749002 ",.01)
 ;;59772749002
 ;;9002226.02101,"1033,59772749002 ",.02)
 ;;59772749002
 ;;9002226.02101,"1033,59772749004 ",.01)
 ;;59772749004
 ;;9002226.02101,"1033,59772749004 ",.02)
 ;;59772749004
 ;;9002226.02101,"1033,59772749104 ",.01)
 ;;59772749104
 ;;9002226.02101,"1033,59772749104 ",.02)
 ;;59772749104
 ;;9002226.02101,"1033,59772749202 ",.01)
 ;;59772749202
 ;;9002226.02101,"1033,59772749202 ",.02)
 ;;59772749202
 ;;9002226.02101,"1033,59772749204 ",.01)
 ;;59772749204
 ;;9002226.02101,"1033,59772749204 ",.02)
 ;;59772749204
 ;;9002226.02101,"1033,59772749301 ",.01)
 ;;59772749301
 ;;9002226.02101,"1033,59772749301 ",.02)
 ;;59772749301
 ;;9002226.02101,"1033,59772749303 ",.01)
 ;;59772749303
 ;;9002226.02101,"1033,59772749303 ",.02)
 ;;59772749303
 ;;9002226.02101,"1033,59772749404 ",.01)
 ;;59772749404
 ;;9002226.02101,"1033,59772749404 ",.02)
 ;;59772749404
 ;;9002226.02101,"1033,59772749701 ",.01)
 ;;59772749701
 ;;9002226.02101,"1033,59772749701 ",.02)
 ;;59772749701
 ;;9002226.02101,"1033,59772749703 ",.01)
 ;;59772749703
 ;;9002226.02101,"1033,59772749703 ",.02)
 ;;59772749703
 ;;9002226.02101,"1033,59987010124 ",.01)
 ;;59987010124
 ;;9002226.02101,"1033,59987010124 ",.02)
 ;;59987010124
 ;;9002226.02101,"1033,60238001001 ",.01)
 ;;60238001001
 ;;9002226.02101,"1033,60238001001 ",.02)
 ;;60238001001
 ;;9002226.02101,"1033,60238001009 ",.01)
 ;;60238001009
 ;;9002226.02101,"1033,60238001009 ",.02)
 ;;60238001009
 ;;9002226.02101,"1033,60238003201 ",.01)
 ;;60238003201
 ;;9002226.02101,"1033,60238003201 ",.02)
 ;;60238003201
 ;;9002226.02101,"1033,60238003403 ",.01)
 ;;60238003403
 ;;9002226.02101,"1033,60238003403 ",.02)
 ;;60238003403
 ;;9002226.02101,"1033,60238003504 ",.01)
 ;;60238003504
 ;;9002226.02101,"1033,60238003504 ",.02)
 ;;60238003504
 ;;9002226.02101,"1033,60238003705 ",.01)
 ;;60238003705
 ;;9002226.02101,"1033,60238003705 ",.02)
 ;;60238003705
 ;;9002226.02101,"1033,60346065506 ",.01)
 ;;60346065506
 ;;9002226.02101,"1033,60346065506 ",.02)
 ;;60346065506
 ;;9002226.02101,"1033,60346065510 ",.01)
 ;;60346065510
 ;;9002226.02101,"1033,60346065510 ",.02)
 ;;60346065510
 ;;9002226.02101,"1033,60346065515 ",.01)
 ;;60346065515
 ;;9002226.02101,"1033,60346065515 ",.02)
 ;;60346065515
 ;;9002226.02101,"1033,60429002101 ",.01)
 ;;60429002101
 ;;9002226.02101,"1033,60429002101 ",.02)
 ;;60429002101
 ;;9002226.02101,"1033,60429002105 ",.01)
 ;;60429002105
 ;;9002226.02101,"1033,60429002105 ",.02)
 ;;60429002105
 ;;9002226.02101,"1033,60429002130 ",.01)
 ;;60429002130
 ;;9002226.02101,"1033,60429002130 ",.02)
 ;;60429002130
 ;;9002226.02101,"1033,60429002201 ",.01)
 ;;60429002201
 ;;9002226.02101,"1033,60429002201 ",.02)
 ;;60429002201
 ;;9002226.02101,"1033,60429002205 ",.01)
 ;;60429002205
 ;;9002226.02101,"1033,60429002205 ",.02)
 ;;60429002205
 ;;9002226.02101,"1033,60429002230 ",.01)
 ;;60429002230
 ;;9002226.02101,"1033,60429002230 ",.02)
 ;;60429002230
 ;;9002226.02101,"1033,60429002301 ",.01)
 ;;60429002301
 ;;9002226.02101,"1033,60429002301 ",.02)
 ;;60429002301
 ;;9002226.02101,"1033,60429002305 ",.01)
 ;;60429002305
 ;;9002226.02101,"1033,60429002305 ",.02)
 ;;60429002305
 ;;9002226.02101,"1033,60429002401 ",.01)
 ;;60429002401
 ;;9002226.02101,"1033,60429002401 ",.02)
 ;;60429002401
 ;;9002226.02101,"1033,60429002405 ",.01)
 ;;60429002405
 ;;9002226.02101,"1033,60429002405 ",.02)
 ;;60429002405
 ;;9002226.02101,"1033,60429003640 ",.01)
 ;;60429003640
 ;;9002226.02101,"1033,60429003640 ",.02)
 ;;60429003640
 ;;9002226.02101,"1033,60429003740 ",.01)
 ;;60429003740
 ;;9002226.02101,"1033,60429003740 ",.02)
 ;;60429003740
 ;;9002226.02101,"1033,60429005940 ",.01)
 ;;60429005940
 ;;9002226.02101,"1033,60429005940 ",.02)
 ;;60429005940
 ;;9002226.02101,"1033,60429006920 ",.01)
 ;;60429006920
 ;;9002226.02101,"1033,60429006920 ",.02)
 ;;60429006920
 ;;9002226.02101,"1033,60429006992 ",.01)
 ;;60429006992
 ;;9002226.02101,"1033,60429006992 ",.02)
 ;;60429006992
 ;;9002226.02101,"1033,60429014701 ",.01)
 ;;60429014701
 ;;9002226.02101,"1033,60429014701 ",.02)
 ;;60429014701
 ;;9002226.02101,"1033,60429014710 ",.01)
 ;;60429014710
 ;;9002226.02101,"1033,60429014710 ",.02)
 ;;60429014710
 ;;9002226.02101,"1033,60429014730 ",.01)
 ;;60429014730
 ;;9002226.02101,"1033,60429014730 ",.02)
 ;;60429014730
 ;;9002226.02101,"1033,60429014740 ",.01)
 ;;60429014740
 ;;9002226.02101,"1033,60429014740 ",.02)
 ;;60429014740
 ;;9002226.02101,"1033,60429014801 ",.01)
 ;;60429014801
 ;;9002226.02101,"1033,60429014801 ",.02)
 ;;60429014801
 ;;9002226.02101,"1033,60429014805 ",.01)
 ;;60429014805
 ;;9002226.02101,"1033,60429014805 ",.02)
 ;;60429014805
 ;;9002226.02101,"1033,60429014830 ",.01)
 ;;60429014830
 ;;9002226.02101,"1033,60429014830 ",.02)
 ;;60429014830
 ;;9002226.02101,"1033,60429014840 ",.01)
 ;;60429014840
 ;;9002226.02101,"1033,60429014840 ",.02)
 ;;60429014840
 ;;9002226.02101,"1033,60429017014 ",.01)
 ;;60429017014
 ;;9002226.02101,"1033,60429017014 ",.02)
 ;;60429017014
 ;;9002226.02101,"1033,60429017020 ",.01)
 ;;60429017020
 ;;9002226.02101,"1033,60429017020 ",.02)
 ;;60429017020
 ;;9002226.02101,"1033,60429020840 ",.01)
 ;;60429020840
 ;;9002226.02101,"1033,60429020840 ",.02)
 ;;60429020840
 ;;9002226.02101,"1033,60429020940 ",.01)
 ;;60429020940
 ;;9002226.02101,"1033,60429020940 ",.02)
 ;;60429020940
 ;;9002226.02101,"1033,60429074201 ",.01)
 ;;60429074201
 ;;9002226.02101,"1033,60429074201 ",.02)
 ;;60429074201
 ;;9002226.02101,"1033,60429074301 ",.01)
 ;;60429074301
