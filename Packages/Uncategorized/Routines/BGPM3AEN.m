BGPM3AEN ;IHS/MSC/SAT-CREATED BY ^ATXSTX ON APR 21, 2011;
 ;;11.0;IHS CLINICAL REPORTING;**4**;JAN 06, 2011;Build 84
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"799,00686001105 ",.02)
 ;;00686001105
 ;;9002226.02101,"799,00686001910 ",.01)
 ;;00686001910
 ;;9002226.02101,"799,00686001910 ",.02)
 ;;00686001910
 ;;9002226.02101,"799,00814365046 ",.01)
 ;;00814365046
 ;;9002226.02101,"799,00814365046 ",.02)
 ;;00814365046
 ;;9002226.02101,"799,00814365540 ",.01)
 ;;00814365540
 ;;9002226.02101,"799,00814365540 ",.02)
 ;;00814365540
 ;;9002226.02101,"799,00839517530 ",.01)
 ;;00839517530
 ;;9002226.02101,"799,00839517530 ",.02)
 ;;00839517530
 ;;9002226.02101,"799,00839558930 ",.01)
 ;;00839558930
 ;;9002226.02101,"799,00839558930 ",.02)
 ;;00839558930
 ;;9002226.02101,"799,00839559025 ",.01)
 ;;00839559025
 ;;9002226.02101,"799,00839559025 ",.02)
 ;;00839559025
 ;;9002226.02101,"799,08290037003 ",.01)
 ;;08290037003
 ;;9002226.02101,"799,08290037003 ",.02)
 ;;08290037003
 ;;9002226.02101,"799,08290038003 ",.01)
 ;;08290038003
 ;;9002226.02101,"799,08290038003 ",.02)
 ;;08290038003
 ;;9002226.02101,"799,08290038005 ",.01)
 ;;08290038005
 ;;9002226.02101,"799,08290038005 ",.02)
 ;;08290038005
 ;;9002226.02101,"799,08290039003 ",.01)
 ;;08290039003
 ;;9002226.02101,"799,08290039003 ",.02)
 ;;08290039003
 ;;9002226.02101,"799,08290039005 ",.01)
 ;;08290039005
 ;;9002226.02101,"799,08290039005 ",.02)
 ;;08290039005
 ;;9002226.02101,"799,08290039105 ",.01)
 ;;08290039105
 ;;9002226.02101,"799,08290039105 ",.02)
 ;;08290039105
 ;;9002226.02101,"799,10719004542 ",.01)
 ;;10719004542
 ;;9002226.02101,"799,10719004542 ",.02)
 ;;10719004542
 ;;9002226.02101,"799,10719004642 ",.01)
 ;;10719004642
 ;;9002226.02101,"799,10719004642 ",.02)
 ;;10719004642
 ;;9002226.02101,"799,10719004731 ",.01)
 ;;10719004731
 ;;9002226.02101,"799,10719004731 ",.02)
 ;;10719004731
 ;;9002226.02101,"799,10719004742 ",.01)
 ;;10719004742
 ;;9002226.02101,"799,10719004742 ",.02)
 ;;10719004742
 ;;9002226.02101,"799,10974000204 ",.01)
 ;;10974000204
 ;;9002226.02101,"799,10974000204 ",.02)
 ;;10974000204
 ;;9002226.02101,"799,10974000205 ",.01)
 ;;10974000205
 ;;9002226.02101,"799,10974000205 ",.02)
 ;;10974000205
 ;;9002226.02101,"799,10974000405 ",.01)
 ;;10974000405
 ;;9002226.02101,"799,10974000405 ",.02)
 ;;10974000405
 ;;9002226.02101,"799,10974000805 ",.01)
 ;;10974000805
 ;;9002226.02101,"799,10974000805 ",.02)
 ;;10974000805
 ;;9002226.02101,"799,10974001010 ",.01)
 ;;10974001010
 ;;9002226.02101,"799,10974001010 ",.02)
 ;;10974001010
 ;;9002226.02101,"799,10974030605 ",.01)
 ;;10974030605
 ;;9002226.02101,"799,10974030605 ",.02)
 ;;10974030605
 ;;9002226.02101,"799,11743021002 ",.01)
 ;;11743021002
 ;;9002226.02101,"799,11743021002 ",.02)
 ;;11743021002
 ;;9002226.02101,"799,12671002403 ",.01)
 ;;12671002403
 ;;9002226.02101,"799,12671002403 ",.02)
 ;;12671002403
 ;;9002226.02101,"799,12671002407 ",.01)
 ;;12671002407
 ;;9002226.02101,"799,12671002407 ",.02)
 ;;12671002407
 ;;9002226.02101,"799,12671002503 ",.01)
 ;;12671002503
 ;;9002226.02101,"799,12671002503 ",.02)
 ;;12671002503
 ;;9002226.02101,"799,12671002601 ",.01)
 ;;12671002601
 ;;9002226.02101,"799,12671002601 ",.02)
 ;;12671002601
 ;;9002226.02101,"799,12671002603 ",.01)
 ;;12671002603
 ;;9002226.02101,"799,12671002603 ",.02)
 ;;12671002603
 ;;9002226.02101,"799,12671006303 ",.01)
 ;;12671006303
 ;;9002226.02101,"799,12671006303 ",.02)
 ;;12671006303
 ;;9002226.02101,"799,12671006307 ",.01)
 ;;12671006307
 ;;9002226.02101,"799,12671006307 ",.02)
 ;;12671006307
 ;;9002226.02101,"799,12671006403 ",.01)
 ;;12671006403
 ;;9002226.02101,"799,12671006403 ",.02)
 ;;12671006403
 ;;9002226.02101,"799,12671006501 ",.01)
 ;;12671006501
 ;;9002226.02101,"799,12671006501 ",.02)
 ;;12671006501
 ;;9002226.02101,"799,12671006515 ",.01)
 ;;12671006515
 ;;9002226.02101,"799,12671006515 ",.02)
 ;;12671006515
 ;;9002226.02101,"799,25021040001 ",.01)
 ;;25021040001
 ;;9002226.02101,"799,25021040001 ",.02)
 ;;25021040001
 ;;9002226.02101,"799,25021040010 ",.01)
 ;;25021040010
 ;;9002226.02101,"799,25021040010 ",.02)
 ;;25021040010
 ;;9002226.02101,"799,25021040030 ",.01)
 ;;25021040030
 ;;9002226.02101,"799,25021040030 ",.02)
 ;;25021040030
 ;;9002226.02101,"799,25021040102 ",.01)
 ;;25021040102
 ;;9002226.02101,"799,25021040102 ",.02)
 ;;25021040102
 ;;9002226.02101,"799,25021040201 ",.01)
 ;;25021040201
 ;;9002226.02101,"799,25021040201 ",.02)
 ;;25021040201
 ;;9002226.02101,"799,25021040210 ",.01)
 ;;25021040210
 ;;9002226.02101,"799,25021040210 ",.02)
 ;;25021040210
 ;;9002226.02101,"799,25021040301 ",.01)
 ;;25021040301
 ;;9002226.02101,"799,25021040301 ",.02)
 ;;25021040301
 ;;9002226.02101,"799,25021040304 ",.01)
 ;;25021040304
 ;;9002226.02101,"799,25021040304 ",.02)
 ;;25021040304
 ;;9002226.02101,"799,25021040401 ",.01)
 ;;25021040401
 ;;9002226.02101,"799,25021040401 ",.02)
 ;;25021040401
 ;;9002226.02101,"799,39769001101 ",.01)
 ;;39769001101
 ;;9002226.02101,"799,39769001101 ",.02)
 ;;39769001101
 ;;9002226.02101,"799,39769001102 ",.01)
 ;;39769001102
 ;;9002226.02101,"799,39769001102 ",.02)
 ;;39769001102
 ;;9002226.02101,"799,39769001105 ",.01)
 ;;39769001105
 ;;9002226.02101,"799,39769001105 ",.02)
 ;;39769001105
 ;;9002226.02101,"799,39769001171 ",.01)
 ;;39769001171
 ;;9002226.02101,"799,39769001171 ",.02)
 ;;39769001171
 ;;9002226.02101,"799,39769001173 ",.01)
 ;;39769001173
 ;;9002226.02101,"799,39769001173 ",.02)
 ;;39769001173
 ;;9002226.02101,"799,39769001175 ",.01)
 ;;39769001175
 ;;9002226.02101,"799,39769001175 ",.02)
 ;;39769001175
 ;;9002226.02101,"799,39769001910 ",.01)
 ;;39769001910
 ;;9002226.02101,"799,39769001910 ",.02)
 ;;39769001910
 ;;9002226.02101,"799,39769001930 ",.01)
 ;;39769001930
 ;;9002226.02101,"799,39769001930 ",.02)
 ;;39769001930
 ;;9002226.02101,"799,39769002601 ",.01)
 ;;39769002601
 ;;9002226.02101,"799,39769002601 ",.02)
 ;;39769002601
 ;;9002226.02101,"799,39769002701 ",.01)
 ;;39769002701
 ;;9002226.02101,"799,39769002701 ",.02)
 ;;39769002701
 ;;9002226.02101,"799,39769002801 ",.01)
 ;;39769002801
 ;;9002226.02101,"799,39769002801 ",.02)
 ;;39769002801
 ;;9002226.02101,"799,39769002905 ",.01)
 ;;39769002905
 ;;9002226.02101,"799,39769002905 ",.02)
 ;;39769002905
 ;;9002226.02101,"799,39769003005 ",.01)
 ;;39769003005
 ;;9002226.02101,"799,39769003005 ",.02)
 ;;39769003005
 ;;9002226.02101,"799,39769003610 ",.01)
 ;;39769003610
 ;;9002226.02101,"799,39769003610 ",.02)
 ;;39769003610
 ;;9002226.02101,"799,39769003630 ",.01)
 ;;39769003630
 ;;9002226.02101,"799,39769003630 ",.02)
 ;;39769003630
 ;;9002226.02101,"799,39769003671 ",.01)
 ;;39769003671
 ;;9002226.02101,"799,39769003671 ",.02)
 ;;39769003671
 ;;9002226.02101,"799,39769010771 ",.01)
 ;;39769010771
 ;;9002226.02101,"799,39769010771 ",.02)
 ;;39769010771
 ;;9002226.02101,"799,39769010773 ",.01)
 ;;39769010773
 ;;9002226.02101,"799,39769010773 ",.02)
 ;;39769010773
 ;;9002226.02101,"799,39769010775 ",.01)
 ;;39769010775
 ;;9002226.02101,"799,39769010775 ",.02)
 ;;39769010775
 ;;9002226.02101,"799,39769011871 ",.01)
 ;;39769011871
 ;;9002226.02101,"799,39769011871 ",.02)
 ;;39769011871
 ;;9002226.02101,"799,39769011873 ",.01)
 ;;39769011873
 ;;9002226.02101,"799,39769011873 ",.02)
 ;;39769011873
 ;;9002226.02101,"799,39769011875 ",.01)
 ;;39769011875
 ;;9002226.02101,"799,39769011875 ",.02)
 ;;39769011875
 ;;9002226.02101,"799,49072029130 ",.01)
 ;;49072029130
 ;;9002226.02101,"799,49072029130 ",.02)
 ;;49072029130
 ;;9002226.02101,"799,49072029710 ",.01)
 ;;49072029710
 ;;9002226.02101,"799,49072029710 ",.02)
 ;;49072029710
 ;;9002226.02101,"799,49910000606 ",.01)
 ;;49910000606
 ;;9002226.02101,"799,49910000606 ",.02)
 ;;49910000606
 ;;9002226.02101,"799,51698004910 ",.01)
 ;;51698004910
 ;;9002226.02101,"799,51698004910 ",.02)
 ;;51698004910
 ;;9002226.02101,"799,52584015270 ",.01)
 ;;52584015270
 ;;9002226.02101,"799,52584015270 ",.02)
 ;;52584015270
 ;;9002226.02101,"799,52584026201 ",.01)
 ;;52584026201
 ;;9002226.02101,"799,52584026201 ",.02)
 ;;52584026201
 ;;9002226.02101,"799,52584054001 ",.01)
 ;;52584054001
 ;;9002226.02101,"799,52584054001 ",.02)
 ;;52584054001
 ;;9002226.02101,"799,52584054201 ",.01)
 ;;52584054201
 ;;9002226.02101,"799,52584054201 ",.02)
 ;;52584054201
 ;;9002226.02101,"799,52584058102 ",.01)
 ;;52584058102
 ;;9002226.02101,"799,52584058102 ",.02)
 ;;52584058102
 ;;9002226.02101,"799,52958032004 ",.01)
 ;;52958032004
 ;;9002226.02101,"799,52958032004 ",.02)
 ;;52958032004
 ;;9002226.02101,"799,52958033008 ",.01)
 ;;52958033008
 ;;9002226.02101,"799,52958033008 ",.02)
 ;;52958033008
 ;;9002226.02101,"799,52958033012 ",.01)
 ;;52958033012
 ;;9002226.02101,"799,52958033012 ",.02)
 ;;52958033012
 ;;9002226.02101,"799,52958034012 ",.01)
 ;;52958034012
 ;;9002226.02101,"799,52958034012 ",.02)
 ;;52958034012
 ;;9002226.02101,"799,53792014004 ",.01)
 ;;53792014004
 ;;9002226.02101,"799,53792014004 ",.02)
 ;;53792014004
 ;;9002226.02101,"799,53978205207 ",.01)
 ;;53978205207
 ;;9002226.02101,"799,53978205207 ",.02)
 ;;53978205207
 ;;9002226.02101,"799,55154014105 ",.01)
 ;;55154014105
 ;;9002226.02101,"799,55154014105 ",.02)
 ;;55154014105
 ;;9002226.02101,"799,55154236205 ",.01)
 ;;55154236205
 ;;9002226.02101,"799,55154236205 ",.02)
 ;;55154236205
 ;;9002226.02101,"799,55154239705 ",.01)
 ;;55154239705
 ;;9002226.02101,"799,55154239705 ",.02)
 ;;55154239705
 ;;9002226.02101,"799,55154420507 ",.01)
 ;;55154420507
 ;;9002226.02101,"799,55154420507 ",.02)
 ;;55154420507
 ;;9002226.02101,"799,55154510105 ",.01)
 ;;55154510105
 ;;9002226.02101,"799,55154510105 ",.02)
 ;;55154510105
 ;;9002226.02101,"799,55154510107 ",.01)
 ;;55154510107
 ;;9002226.02101,"799,55154510107 ",.02)
 ;;55154510107
 ;;9002226.02101,"799,55154510305 ",.01)
 ;;55154510305
 ;;9002226.02101,"799,55154510305 ",.02)
 ;;55154510305
 ;;9002226.02101,"799,55154510307 ",.01)
 ;;55154510307
 ;;9002226.02101,"799,55154510307 ",.02)
 ;;55154510307
 ;;9002226.02101,"799,55154510905 ",.01)
 ;;55154510905
 ;;9002226.02101,"799,55154510905 ",.02)
 ;;55154510905
 ;;9002226.02101,"799,55154512205 ",.01)
 ;;55154512205
 ;;9002226.02101,"799,55154512205 ",.02)
 ;;55154512205
 ;;9002226.02101,"799,55154512207 ",.01)
 ;;55154512207
 ;;9002226.02101,"799,55154512207 ",.02)
 ;;55154512207
 ;;9002226.02101,"799,55154512605 ",.01)
 ;;55154512605
 ;;9002226.02101,"799,55154512605 ",.02)
 ;;55154512605
 ;;9002226.02101,"799,55154870107 ",.01)
 ;;55154870107
 ;;9002226.02101,"799,55154870107 ",.02)
 ;;55154870107
 ;;9002226.02101,"799,55154935105 ",.01)
 ;;55154935105
 ;;9002226.02101,"799,55154935105 ",.02)
 ;;55154935105
 ;;9002226.02101,"799,55154935305 ",.01)
 ;;55154935305
 ;;9002226.02101,"799,55154935305 ",.02)
 ;;55154935305
 ;;9002226.02101,"799,55154935405 ",.01)
 ;;55154935405
 ;;9002226.02101,"799,55154935405 ",.02)
 ;;55154935405
 ;;9002226.02101,"799,55154935505 ",.01)
 ;;55154935505
 ;;9002226.02101,"799,55154935505 ",.02)
 ;;55154935505
 ;;9002226.02101,"799,55154935905 ",.01)
 ;;55154935905
 ;;9002226.02101,"799,55154935905 ",.02)
 ;;55154935905
 ;;9002226.02101,"799,55154936005 ",.01)
 ;;55154936005
 ;;9002226.02101,"799,55154936005 ",.02)
 ;;55154936005
 ;;9002226.02101,"799,55154937305 ",.01)
 ;;55154937305
 ;;9002226.02101,"799,55154937305 ",.02)
 ;;55154937305
 ;;9002226.02101,"799,55154937705 ",.01)
 ;;55154937705
 ;;9002226.02101,"799,55154937705 ",.02)
 ;;55154937705
 ;;9002226.02101,"799,62338313701 ",.01)
 ;;62338313701
 ;;9002226.02101,"799,62338313701 ",.02)
 ;;62338313701
 ;;9002226.02101,"799,62338332701 ",.01)
 ;;62338332701
