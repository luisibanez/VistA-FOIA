BGPM5BGI ;IHS/MSC/SAT-CREATED BY ^ATXSTX ON OCT 28, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"768,00536311337 ",.01)
 ;;00536311337
 ;;9002226.02101,"768,00536311337 ",.02)
 ;;00536311337
 ;;9002226.02101,"768,00536338601 ",.01)
 ;;00536338601
 ;;9002226.02101,"768,00536338601 ",.02)
 ;;00536338601
 ;;9002226.02101,"768,00536338637 ",.01)
 ;;00536338637
 ;;9002226.02101,"768,00536338637 ",.02)
 ;;00536338637
 ;;9002226.02101,"768,00536338701 ",.01)
 ;;00536338701
 ;;9002226.02101,"768,00536338701 ",.02)
 ;;00536338701
 ;;9002226.02101,"768,00536338737 ",.01)
 ;;00536338737
 ;;9002226.02101,"768,00536338737 ",.02)
 ;;00536338737
 ;;9002226.02101,"768,00536340401 ",.01)
 ;;00536340401
 ;;9002226.02101,"768,00536340401 ",.02)
 ;;00536340401
 ;;9002226.02101,"768,00536340407 ",.01)
 ;;00536340407
 ;;9002226.02101,"768,00536340407 ",.02)
 ;;00536340407
 ;;9002226.02101,"768,00536340437 ",.01)
 ;;00536340437
 ;;9002226.02101,"768,00536340437 ",.02)
 ;;00536340437
 ;;9002226.02101,"768,00536340501 ",.01)
 ;;00536340501
 ;;9002226.02101,"768,00536340501 ",.02)
 ;;00536340501
 ;;9002226.02101,"768,00536340537 ",.01)
 ;;00536340537
 ;;9002226.02101,"768,00536340537 ",.02)
 ;;00536340537
 ;;9002226.02101,"768,00536589488 ",.01)
 ;;00536589488
 ;;9002226.02101,"768,00536589488 ",.02)
 ;;00536589488
 ;;9002226.02101,"768,00536589588 ",.01)
 ;;00536589588
 ;;9002226.02101,"768,00536589588 ",.02)
 ;;00536589588
 ;;9002226.02101,"768,00536589688 ",.01)
 ;;00536589688
 ;;9002226.02101,"768,00536589688 ",.02)
 ;;00536589688
 ;;9002226.02101,"768,00591289030 ",.01)
 ;;00591289030
 ;;9002226.02101,"768,00591289030 ",.02)
 ;;00591289030
 ;;9002226.02101,"768,00591289330 ",.01)
 ;;00591289330
 ;;9002226.02101,"768,00591289330 ",.02)
 ;;00591289330
 ;;9002226.02101,"768,00591290130 ",.01)
 ;;00591290130
 ;;9002226.02101,"768,00591290130 ",.02)
 ;;00591290130
 ;;9002226.02101,"768,00591290154 ",.01)
 ;;00591290154
 ;;9002226.02101,"768,00591290154 ",.02)
 ;;00591290154
 ;;9002226.02101,"768,00766150010 ",.01)
 ;;00766150010
 ;;9002226.02101,"768,00766150010 ",.02)
 ;;00766150010
 ;;9002226.02101,"768,00766150020 ",.01)
 ;;00766150020
 ;;9002226.02101,"768,00766150020 ",.02)
 ;;00766150020
 ;;9002226.02101,"768,00766150030 ",.01)
 ;;00766150030
 ;;9002226.02101,"768,00766150030 ",.02)
 ;;00766150030
 ;;9002226.02101,"768,00766150040 ",.01)
 ;;00766150040
 ;;9002226.02101,"768,00766150040 ",.02)
 ;;00766150040
 ;;9002226.02101,"768,00766155170 ",.01)
 ;;00766155170
 ;;9002226.02101,"768,00766155170 ",.02)
 ;;00766155170
 ;;9002226.02101,"768,05888783026 ",.01)
 ;;05888783026
 ;;9002226.02101,"768,05888783026 ",.02)
 ;;05888783026
 ;;9002226.02101,"768,11673019401 ",.01)
 ;;11673019401
 ;;9002226.02101,"768,11673019401 ",.02)
 ;;11673019401
 ;;9002226.02101,"768,11673019402 ",.01)
 ;;11673019402
 ;;9002226.02101,"768,11673019402 ",.02)
 ;;11673019402
 ;;9002226.02101,"768,11673019502 ",.01)
 ;;11673019502
 ;;9002226.02101,"768,11673019502 ",.02)
 ;;11673019502
 ;;9002226.02101,"768,11673019602 ",.01)
 ;;11673019602
 ;;9002226.02101,"768,11673019602 ",.02)
 ;;11673019602
 ;;9002226.02101,"768,11673022904 ",.01)
 ;;11673022904
 ;;9002226.02101,"768,11673022904 ",.02)
 ;;11673022904
 ;;9002226.02101,"768,11673022905 ",.01)
 ;;11673022905
 ;;9002226.02101,"768,11673022905 ",.02)
 ;;11673022905
 ;;9002226.02101,"768,11673023004 ",.01)
 ;;11673023004
 ;;9002226.02101,"768,11673023004 ",.02)
 ;;11673023004
 ;;9002226.02101,"768,11673023005 ",.01)
 ;;11673023005
 ;;9002226.02101,"768,11673023005 ",.02)
 ;;11673023005
 ;;9002226.02101,"768,11673034405 ",.01)
 ;;11673034405
 ;;9002226.02101,"768,11673034405 ",.02)
 ;;11673034405
 ;;9002226.02101,"768,11673034406 ",.01)
 ;;11673034406
 ;;9002226.02101,"768,11673034406 ",.02)
 ;;11673034406
 ;;9002226.02101,"768,11673034416 ",.01)
 ;;11673034416
 ;;9002226.02101,"768,11673034416 ",.02)
 ;;11673034416
 ;;9002226.02101,"768,11673065702 ",.01)
 ;;11673065702
 ;;9002226.02101,"768,11673065702 ",.02)
 ;;11673065702
 ;;9002226.02101,"768,11673065703 ",.01)
 ;;11673065703
 ;;9002226.02101,"768,11673065703 ",.02)
 ;;11673065703
 ;;9002226.02101,"768,11673065802 ",.01)
 ;;11673065802
 ;;9002226.02101,"768,11673065802 ",.02)
 ;;11673065802
 ;;9002226.02101,"768,11673065803 ",.01)
 ;;11673065803
 ;;9002226.02101,"768,11673065803 ",.02)
 ;;11673065803
 ;;9002226.02101,"768,11673087305 ",.01)
 ;;11673087305
 ;;9002226.02101,"768,11673087305 ",.02)
 ;;11673087305
 ;;9002226.02101,"768,11673087306 ",.01)
 ;;11673087306
 ;;9002226.02101,"768,11673087306 ",.02)
 ;;11673087306
 ;;9002226.02101,"768,11673087308 ",.01)
 ;;11673087308
 ;;9002226.02101,"768,11673087308 ",.02)
 ;;11673087308
 ;;9002226.02101,"768,11673087310 ",.01)
 ;;11673087310
 ;;9002226.02101,"768,11673087310 ",.02)
 ;;11673087310
 ;;9002226.02101,"768,11673087316 ",.01)
 ;;11673087316
 ;;9002226.02101,"768,11673087316 ",.02)
 ;;11673087316
 ;;9002226.02101,"768,11822087301 ",.01)
 ;;11822087301
 ;;9002226.02101,"768,11822087301 ",.02)
 ;;11822087301
 ;;9002226.02101,"768,21130034405 ",.01)
 ;;21130034405
 ;;9002226.02101,"768,21130034405 ",.02)
 ;;21130034405
 ;;9002226.02101,"768,24385017158 ",.01)
 ;;24385017158
 ;;9002226.02101,"768,24385017158 ",.02)
 ;;24385017158
 ;;9002226.02101,"768,24385059471 ",.01)
 ;;24385059471
 ;;9002226.02101,"768,24385059471 ",.02)
 ;;24385059471
 ;;9002226.02101,"768,24385097567 ",.01)
 ;;24385097567
 ;;9002226.02101,"768,24385097567 ",.02)
 ;;24385097567
 ;;9002226.02101,"768,24385097667 ",.01)
 ;;24385097667
 ;;9002226.02101,"768,24385097667 ",.02)
 ;;24385097667
 ;;9002226.02101,"768,30142034405 ",.01)
 ;;30142034405
 ;;9002226.02101,"768,30142034405 ",.02)
 ;;30142034405
 ;;9002226.02101,"768,30142034406 ",.01)
 ;;30142034406
 ;;9002226.02101,"768,30142034406 ",.02)
 ;;30142034406
 ;;9002226.02101,"768,30142087305 ",.01)
 ;;30142087305
 ;;9002226.02101,"768,30142087305 ",.02)
 ;;30142087305
 ;;9002226.02101,"768,30142087306 ",.01)
 ;;30142087306
 ;;9002226.02101,"768,30142087306 ",.02)
 ;;30142087306
 ;;9002226.02101,"768,36800002925 ",.01)
 ;;36800002925
 ;;9002226.02101,"768,36800002925 ",.02)
 ;;36800002925
 ;;9002226.02101,"768,36800017025 ",.01)
 ;;36800017025
 ;;9002226.02101,"768,36800017025 ",.02)
 ;;36800017025
 ;;9002226.02101,"768,36800017071 ",.01)
 ;;36800017071
 ;;9002226.02101,"768,36800017071 ",.02)
 ;;36800017071
 ;;9002226.02101,"768,36800020625 ",.01)
 ;;36800020625
 ;;9002226.02101,"768,36800020625 ",.02)
 ;;36800020625
 ;;9002226.02101,"768,36800034405 ",.01)
 ;;36800034405
 ;;9002226.02101,"768,36800034405 ",.02)
 ;;36800034405
 ;;9002226.02101,"768,36800042260 ",.01)
 ;;36800042260
 ;;9002226.02101,"768,36800042260 ",.02)
 ;;36800042260
 ;;9002226.02101,"768,36800042271 ",.01)
 ;;36800042271
 ;;9002226.02101,"768,36800042271 ",.02)
 ;;36800042271
 ;;9002226.02101,"768,36800045676 ",.01)
 ;;36800045676
 ;;9002226.02101,"768,36800045676 ",.02)
 ;;36800045676
 ;;9002226.02101,"768,36800045678 ",.01)
 ;;36800045678
 ;;9002226.02101,"768,36800045678 ",.02)
 ;;36800045678
 ;;9002226.02101,"768,36800053276 ",.01)
 ;;36800053276
 ;;9002226.02101,"768,36800053276 ",.02)
 ;;36800053276
 ;;9002226.02101,"768,36800053278 ",.01)
 ;;36800053278
 ;;9002226.02101,"768,36800053278 ",.02)
 ;;36800053278
 ;;9002226.02101,"768,36800087305 ",.01)
 ;;36800087305
 ;;9002226.02101,"768,36800087305 ",.02)
 ;;36800087305
 ;;9002226.02101,"768,37205020371 ",.01)
 ;;37205020371
 ;;9002226.02101,"768,37205020371 ",.02)
 ;;37205020371
 ;;9002226.02101,"768,37205020377 ",.01)
 ;;37205020377
 ;;9002226.02101,"768,37205020377 ",.02)
 ;;37205020377
 ;;9002226.02101,"768,37205020467 ",.01)
 ;;37205020467
 ;;9002226.02101,"768,37205020467 ",.02)
 ;;37205020467
 ;;9002226.02101,"768,37205036374 ",.01)
 ;;37205036374
 ;;9002226.02101,"768,37205036374 ",.02)
 ;;37205036374
 ;;9002226.02101,"768,37808034403 ",.01)
 ;;37808034403
 ;;9002226.02101,"768,37808034403 ",.02)
 ;;37808034403
 ;;9002226.02101,"768,37808034405 ",.01)
 ;;37808034405
 ;;9002226.02101,"768,37808034405 ",.02)
 ;;37808034405
 ;;9002226.02101,"768,37808034406 ",.01)
 ;;37808034406
 ;;9002226.02101,"768,37808034406 ",.02)
 ;;37808034406
 ;;9002226.02101,"768,41163034405 ",.01)
 ;;41163034405
 ;;9002226.02101,"768,41163034405 ",.02)
 ;;41163034405
 ;;9002226.02101,"768,41163087305 ",.01)
 ;;41163087305
 ;;9002226.02101,"768,41163087305 ",.02)
 ;;41163087305
 ;;9002226.02101,"768,41250019003 ",.01)
 ;;41250019003
 ;;9002226.02101,"768,41250019003 ",.02)
 ;;41250019003
 ;;9002226.02101,"768,41250019005 ",.01)
 ;;41250019005
 ;;9002226.02101,"768,41250019005 ",.02)
 ;;41250019005
 ;;9002226.02101,"768,41250042403 ",.01)
 ;;41250042403
 ;;9002226.02101,"768,41250042403 ",.02)
 ;;41250042403
 ;;9002226.02101,"768,41250042405 ",.01)
 ;;41250042405
 ;;9002226.02101,"768,41250042405 ",.02)
 ;;41250042405
 ;;9002226.02101,"768,41250089488 ",.01)
 ;;41250089488
 ;;9002226.02101,"768,41250089488 ",.02)
 ;;41250089488
 ;;9002226.02101,"768,41250089588 ",.01)
 ;;41250089588
 ;;9002226.02101,"768,41250089588 ",.02)
 ;;41250089588
 ;;9002226.02101,"768,41250089688 ",.01)
 ;;41250089688
 ;;9002226.02101,"768,41250089688 ",.02)
 ;;41250089688
 ;;9002226.02101,"768,41268034404 ",.01)
 ;;41268034404
 ;;9002226.02101,"768,41268034404 ",.02)
 ;;41268034404
 ;;9002226.02101,"768,49035012410 ",.01)
 ;;49035012410
 ;;9002226.02101,"768,49035012410 ",.02)
 ;;49035012410
 ;;9002226.02101,"768,49035019010 ",.01)
 ;;49035019010
 ;;9002226.02101,"768,49035019010 ",.02)
 ;;49035019010
 ;;9002226.02101,"768,49035083007 ",.01)
 ;;49035083007
 ;;9002226.02101,"768,49035083007 ",.02)
 ;;49035083007
 ;;9002226.02101,"768,49035083014 ",.01)
 ;;49035083014
 ;;9002226.02101,"768,49035083014 ",.02)
 ;;49035083014
 ;;9002226.02101,"768,49035084007 ",.01)
 ;;49035084007
 ;;9002226.02101,"768,49035084007 ",.02)
 ;;49035084007
 ;;9002226.02101,"768,49035084014 ",.01)
 ;;49035084014
 ;;9002226.02101,"768,49035084014 ",.02)
 ;;49035084014
 ;;9002226.02101,"768,49035089488 ",.01)
 ;;49035089488
 ;;9002226.02101,"768,49035089488 ",.02)
 ;;49035089488
 ;;9002226.02101,"768,49035089588 ",.01)
 ;;49035089588
 ;;9002226.02101,"768,49035089588 ",.02)
 ;;49035089588
 ;;9002226.02101,"768,49035089653 ",.01)
 ;;49035089653
 ;;9002226.02101,"768,49035089653 ",.02)
 ;;49035089653
 ;;9002226.02101,"768,49035089688 ",.01)
 ;;49035089688
 ;;9002226.02101,"768,49035089688 ",.02)
 ;;49035089688
 ;;9002226.02101,"768,49348057208 ",.01)
 ;;49348057208
 ;;9002226.02101,"768,49348057208 ",.02)
 ;;49348057208
 ;;9002226.02101,"768,49348057236 ",.01)
 ;;49348057236
 ;;9002226.02101,"768,49348057236 ",.02)
 ;;49348057236
 ;;9002226.02101,"768,49348057308 ",.01)
 ;;49348057308
 ;;9002226.02101,"768,49348057308 ",.02)
 ;;49348057308
 ;;9002226.02101,"768,49348057336 ",.01)
 ;;49348057336
 ;;9002226.02101,"768,49348057336 ",.02)
 ;;49348057336
 ;;9002226.02101,"768,49348069109 ",.01)
 ;;49348069109
 ;;9002226.02101,"768,49348069109 ",.02)
 ;;49348069109
 ;;9002226.02101,"768,49348069136 ",.01)
 ;;49348069136
 ;;9002226.02101,"768,49348069136 ",.02)
 ;;49348069136
 ;;9002226.02101,"768,49348069164 ",.01)
 ;;49348069164
 ;;9002226.02101,"768,49348069164 ",.02)
 ;;49348069164
 ;;9002226.02101,"768,49348069209 ",.01)
 ;;49348069209
 ;;9002226.02101,"768,49348069209 ",.02)
 ;;49348069209
 ;;9002226.02101,"768,49348069236 ",.01)
 ;;49348069236
 ;;9002226.02101,"768,49348069236 ",.02)
 ;;49348069236
 ;;9002226.02101,"768,49348069264 ",.01)
 ;;49348069264
 ;;9002226.02101,"768,49348069264 ",.02)
 ;;49348069264
