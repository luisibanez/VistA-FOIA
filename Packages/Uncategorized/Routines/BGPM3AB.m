BGPM3AB ;IHS/MSC/SAT-CREATED BY ^ATXSTX ON APR 21, 2011;
 ;;11.0;IHS CLINICAL REPORTING;**4**;JAN 06, 2011;Build 84
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"775,00074131613 ",.01)
 ;;00074131613
 ;;9002226.02101,"775,00074131613 ",.02)
 ;;00074131613
 ;;9002226.02101,"775,00074131614 ",.01)
 ;;00074131614
 ;;9002226.02101,"775,00074131614 ",.02)
 ;;00074131614
 ;;9002226.02101,"775,00074131632 ",.01)
 ;;00074131632
 ;;9002226.02101,"775,00074131632 ",.02)
 ;;00074131632
 ;;9002226.02101,"775,00074131666 ",.01)
 ;;00074131666
 ;;9002226.02101,"775,00074131666 ",.02)
 ;;00074131666
 ;;9002226.02101,"775,00074140201 ",.01)
 ;;00074140201
 ;;9002226.02101,"775,00074140201 ",.02)
 ;;00074140201
 ;;9002226.02101,"775,00074140211 ",.01)
 ;;00074140211
 ;;9002226.02101,"775,00074140211 ",.02)
 ;;00074140211
 ;;9002226.02101,"775,00074140231 ",.01)
 ;;00074140231
 ;;9002226.02101,"775,00074140231 ",.02)
 ;;00074140231
 ;;9002226.02101,"775,00074258202 ",.01)
 ;;00074258202
 ;;9002226.02101,"775,00074258202 ",.02)
 ;;00074258202
 ;;9002226.02101,"775,00074258302 ",.01)
 ;;00074258302
 ;;9002226.02101,"775,00074258302 ",.02)
 ;;00074258302
 ;;9002226.02101,"775,00074258402 ",.01)
 ;;00074258402
 ;;9002226.02101,"775,00074258402 ",.02)
 ;;00074258402
 ;;9002226.02101,"775,00074628602 ",.01)
 ;;00074628602
 ;;9002226.02101,"775,00074628602 ",.02)
 ;;00074628602
 ;;9002226.02101,"775,00074628611 ",.01)
 ;;00074628611
 ;;9002226.02101,"775,00074628611 ",.02)
 ;;00074628611
 ;;9002226.02101,"775,00074628702 ",.01)
 ;;00074628702
 ;;9002226.02101,"775,00074628702 ",.02)
 ;;00074628702
 ;;9002226.02101,"775,00074628703 ",.01)
 ;;00074628703
 ;;9002226.02101,"775,00074628703 ",.02)
 ;;00074628703
 ;;9002226.02101,"775,00074629202 ",.01)
 ;;00074629202
 ;;9002226.02101,"775,00074629202 ",.02)
 ;;00074629202
 ;;9002226.02101,"775,00074629302 ",.01)
 ;;00074629302
 ;;9002226.02101,"775,00074629302 ",.02)
 ;;00074629302
 ;;9002226.02101,"775,00074629303 ",.01)
 ;;00074629303
 ;;9002226.02101,"775,00074629303 ",.02)
 ;;00074629303
 ;;9002226.02101,"775,00074662603 ",.01)
 ;;00074662603
 ;;9002226.02101,"775,00074662603 ",.02)
 ;;00074662603
 ;;9002226.02101,"775,00074662607 ",.01)
 ;;00074662607
 ;;9002226.02101,"775,00074662607 ",.02)
 ;;00074662607
 ;;9002226.02101,"775,00074663803 ",.01)
 ;;00074663803
 ;;9002226.02101,"775,00074663803 ",.02)
 ;;00074663803
 ;;9002226.02101,"775,00074663807 ",.01)
 ;;00074663807
 ;;9002226.02101,"775,00074663807 ",.02)
 ;;00074663807
 ;;9002226.02101,"775,00074720201 ",.01)
 ;;00074720201
 ;;9002226.02101,"775,00074720201 ",.02)
 ;;00074720201
 ;;9002226.02101,"775,00074720205 ",.01)
 ;;00074720205
 ;;9002226.02101,"775,00074720205 ",.02)
 ;;00074720205
 ;;9002226.02101,"775,00074721001 ",.01)
 ;;00074721001
 ;;9002226.02101,"775,00074721001 ",.02)
 ;;00074721001
 ;;9002226.02101,"775,00074721005 ",.01)
 ;;00074721005
 ;;9002226.02101,"775,00074721005 ",.02)
 ;;00074721005
 ;;9002226.02101,"775,00074721009 ",.01)
 ;;00074721009
 ;;9002226.02101,"775,00074721009 ",.02)
 ;;00074721009
 ;;9002226.02101,"775,00074721801 ",.01)
 ;;00074721801
 ;;9002226.02101,"775,00074721801 ",.02)
 ;;00074721801
 ;;9002226.02101,"775,00074721805 ",.01)
 ;;00074721805
 ;;9002226.02101,"775,00074721805 ",.02)
 ;;00074721805
 ;;9002226.02101,"775,00074765002 ",.01)
 ;;00074765002
 ;;9002226.02101,"775,00074765002 ",.02)
 ;;00074765002
 ;;9002226.02101,"775,00074765062 ",.01)
 ;;00074765062
 ;;9002226.02101,"775,00074765062 ",.02)
 ;;00074765062
 ;;9002226.02101,"775,00074765102 ",.01)
 ;;00074765102
 ;;9002226.02101,"775,00074765102 ",.02)
 ;;00074765102
 ;;9002226.02101,"775,00074765103 ",.01)
 ;;00074765103
 ;;9002226.02101,"775,00074765103 ",.02)
 ;;00074765103
 ;;9002226.02101,"775,00074765162 ",.01)
 ;;00074765162
 ;;9002226.02101,"775,00074765162 ",.02)
 ;;00074765162
 ;;9002226.02101,"775,00074776003 ",.01)
 ;;00074776003
 ;;9002226.02101,"775,00074776003 ",.02)
 ;;00074776003
 ;;9002226.02101,"775,00074776103 ",.01)
 ;;00074776103
 ;;9002226.02101,"775,00074776103 ",.02)
 ;;00074776103
 ;;9002226.02101,"775,00074776130 ",.01)
 ;;00074776130
 ;;9002226.02101,"775,00074776130 ",.02)
 ;;00074776130
 ;;9002226.02101,"775,00074779224 ",.01)
 ;;00074779224
 ;;9002226.02101,"775,00074779224 ",.02)
 ;;00074779224
 ;;9002226.02101,"775,00074779312 ",.01)
 ;;00074779312
 ;;9002226.02101,"775,00074779312 ",.02)
 ;;00074779312
 ;;9002226.02101,"775,00074779323 ",.01)
 ;;00074779323
 ;;9002226.02101,"775,00074779323 ",.02)
 ;;00074779323
 ;;9002226.02101,"775,00074779361 ",.01)
 ;;00074779361
 ;;9002226.02101,"775,00074779361 ",.02)
 ;;00074779361
 ;;9002226.02101,"775,00074779362 ",.01)
 ;;00074779362
 ;;9002226.02101,"775,00074779362 ",.02)
 ;;00074779362
 ;;9002226.02101,"775,00074779412 ",.01)
 ;;00074779412
 ;;9002226.02101,"775,00074779412 ",.02)
 ;;00074779412
 ;;9002226.02101,"775,00074779423 ",.01)
 ;;00074779423
 ;;9002226.02101,"775,00074779423 ",.02)
 ;;00074779423
 ;;9002226.02101,"775,00074779462 ",.01)
 ;;00074779462
 ;;9002226.02101,"775,00074779462 ",.02)
 ;;00074779462
 ;;9002226.02101,"775,00081021065 ",.01)
 ;;00081021065
 ;;9002226.02101,"775,00081021065 ",.02)
 ;;00081021065
 ;;9002226.02101,"775,00084005701 ",.01)
 ;;00084005701
 ;;9002226.02101,"775,00084005701 ",.02)
 ;;00084005701
 ;;9002226.02101,"775,00084005718 ",.01)
 ;;00084005718
 ;;9002226.02101,"775,00084005718 ",.02)
 ;;00084005718
 ;;9002226.02101,"775,00084007314 ",.01)
 ;;00084007314
 ;;9002226.02101,"775,00084007314 ",.02)
 ;;00084007314
 ;;9002226.02101,"775,00084008912 ",.01)
 ;;00084008912
 ;;9002226.02101,"775,00084008912 ",.02)
 ;;00084008912
 ;;9002226.02101,"775,00084019514 ",.01)
 ;;00084019514
 ;;9002226.02101,"775,00084019514 ",.02)
 ;;00084019514
 ;;9002226.02101,"775,00084019614 ",.01)
 ;;00084019614
 ;;9002226.02101,"775,00084019614 ",.02)
 ;;00084019614
 ;;9002226.02101,"775,00084019623 ",.01)
 ;;00084019623
 ;;9002226.02101,"775,00084019623 ",.02)
 ;;00084019623
 ;;9002226.02101,"775,00084040803 ",.01)
 ;;00084040803
 ;;9002226.02101,"775,00084040803 ",.02)
 ;;00084040803
 ;;9002226.02101,"775,00084040814 ",.01)
 ;;00084040814
 ;;9002226.02101,"775,00084040814 ",.02)
 ;;00084040814
 ;;9002226.02101,"775,00084040816 ",.01)
 ;;00084040816
 ;;9002226.02101,"775,00084040816 ",.02)
 ;;00084040816
 ;;9002226.02101,"775,00085016875 ",.01)
 ;;00085016875
 ;;9002226.02101,"775,00085016875 ",.02)
 ;;00085016875
 ;;9002226.02101,"775,00089041001 ",.01)
 ;;00089041001
 ;;9002226.02101,"775,00089041001 ",.02)
 ;;00089041001
 ;;9002226.02101,"775,00089042501 ",.01)
 ;;00089042501
 ;;9002226.02101,"775,00089042501 ",.02)
 ;;00089042501
 ;;9002226.02101,"775,00093014301 ",.01)
 ;;00093014301
 ;;9002226.02101,"775,00093014301 ",.02)
 ;;00093014301
 ;;9002226.02101,"775,00093014401 ",.01)
 ;;00093014401
 ;;9002226.02101,"775,00093014401 ",.02)
 ;;00093014401
 ;;9002226.02101,"775,00093014501 ",.01)
 ;;00093014501
 ;;9002226.02101,"775,00093014501 ",.02)
 ;;00093014501
 ;;9002226.02101,"775,00093014510 ",.01)
 ;;00093014510
 ;;9002226.02101,"775,00093014510 ",.02)
 ;;00093014510
 ;;9002226.02101,"775,00093015401 ",.01)
 ;;00093015401
 ;;9002226.02101,"775,00093015401 ",.02)
 ;;00093015401
 ;;9002226.02101,"775,00093015405 ",.01)
 ;;00093015405
 ;;9002226.02101,"775,00093015405 ",.02)
 ;;00093015405
 ;;9002226.02101,"775,00094014501 ",.01)
 ;;00094014501
 ;;9002226.02101,"775,00094014501 ",.02)
 ;;00094014501
 ;;9002226.02101,"775,00094014510 ",.01)
 ;;00094014510
 ;;9002226.02101,"775,00094014510 ",.02)
 ;;00094014510
 ;;9002226.02101,"775,00094014561 ",.01)
 ;;00094014561
 ;;9002226.02101,"775,00094014561 ",.02)
 ;;00094014561
 ;;9002226.02101,"775,00106143030 ",.01)
 ;;00106143030
 ;;9002226.02101,"775,00106143030 ",.02)
 ;;00106143030
 ;;9002226.02101,"775,00113025968 ",.01)
 ;;00113025968
 ;;9002226.02101,"775,00113025968 ",.02)
 ;;00113025968
 ;;9002226.02101,"775,00113041178 ",.01)
 ;;00113041178
 ;;9002226.02101,"775,00113041178 ",.02)
 ;;00113041178
 ;;9002226.02101,"775,00113041187 ",.01)
 ;;00113041187
 ;;9002226.02101,"775,00113041187 ",.02)
 ;;00113041187
 ;;9002226.02101,"775,00113041190 ",.01)
 ;;00113041190
 ;;9002226.02101,"775,00113041190 ",.02)
 ;;00113041190
 ;;9002226.02101,"775,00113041660 ",.01)
 ;;00113041660
 ;;9002226.02101,"775,00113041660 ",.02)
 ;;00113041660
 ;;9002226.02101,"775,00113041678 ",.01)
 ;;00113041678
 ;;9002226.02101,"775,00113041678 ",.02)
 ;;00113041678
 ;;9002226.02101,"775,00113041693 ",.01)
 ;;00113041693
 ;;9002226.02101,"775,00113041693 ",.02)
 ;;00113041693
 ;;9002226.02101,"775,00113046768 ",.01)
 ;;00113046768
 ;;9002226.02101,"775,00113046768 ",.02)
 ;;00113046768
 ;;9002226.02101,"775,00113064274 ",.01)
 ;;00113064274
 ;;9002226.02101,"775,00113064274 ",.02)
 ;;00113064274
 ;;9002226.02101,"775,00113064278 ",.01)
 ;;00113064278
 ;;9002226.02101,"775,00113064278 ",.02)
 ;;00113064278
 ;;9002226.02101,"775,00113064282 ",.01)
 ;;00113064282
 ;;9002226.02101,"775,00113064282 ",.02)
 ;;00113064282
 ;;9002226.02101,"775,00115230001 ",.01)
 ;;00115230001
 ;;9002226.02101,"775,00115230001 ",.02)
 ;;00115230001
 ;;9002226.02101,"775,00115230003 ",.01)
 ;;00115230003
 ;;9002226.02101,"775,00115230003 ",.02)
 ;;00115230003
 ;;9002226.02101,"775,00115230501 ",.01)
 ;;00115230501
 ;;9002226.02101,"775,00115230501 ",.02)
 ;;00115230501
 ;;9002226.02101,"775,00115230503 ",.01)
 ;;00115230503
 ;;9002226.02101,"775,00115230503 ",.02)
 ;;00115230503
 ;;9002226.02101,"775,00115230601 ",.01)
 ;;00115230601
 ;;9002226.02101,"775,00115230601 ",.02)
 ;;00115230601
 ;;9002226.02101,"775,00115230603 ",.01)
 ;;00115230603
 ;;9002226.02101,"775,00115230603 ",.02)
 ;;00115230603
 ;;9002226.02101,"775,00115706001 ",.01)
 ;;00115706001
 ;;9002226.02101,"775,00115706001 ",.02)
 ;;00115706001
 ;;9002226.02101,"775,00115706003 ",.01)
 ;;00115706003
 ;;9002226.02101,"775,00115706003 ",.02)
 ;;00115706003
 ;;9002226.02101,"775,00122080166 ",.01)
 ;;00122080166
 ;;9002226.02101,"775,00122080166 ",.02)
 ;;00122080166
 ;;9002226.02101,"775,00122085066 ",.01)
 ;;00122085066
 ;;9002226.02101,"775,00122085066 ",.02)
 ;;00122085066
 ;;9002226.02101,"775,00122086266 ",.01)
 ;;00122086266
 ;;9002226.02101,"775,00122086266 ",.02)
 ;;00122086266
 ;;9002226.02101,"775,00143109510 ",.01)
 ;;00143109510
 ;;9002226.02101,"775,00143109510 ",.02)
 ;;00143109510
 ;;9002226.02101,"775,00143109525 ",.01)
 ;;00143109525
 ;;9002226.02101,"775,00143109525 ",.02)
 ;;00143109525
 ;;9002226.02101,"775,00143206201 ",.01)
 ;;00143206201
 ;;9002226.02101,"775,00143206201 ",.02)
 ;;00143206201
 ;;9002226.02101,"775,00143206210 ",.01)
 ;;00143206210
 ;;9002226.02101,"775,00143206210 ",.02)
 ;;00143206210
 ;;9002226.02101,"775,00143206225 ",.01)
 ;;00143206225
 ;;9002226.02101,"775,00143206225 ",.02)
 ;;00143206225
 ;;9002226.02101,"775,00149009311 ",.01)
 ;;00149009311
 ;;9002226.02101,"775,00149009311 ",.02)
 ;;00149009311
 ;;9002226.02101,"775,00157028301 ",.01)
 ;;00157028301
 ;;9002226.02101,"775,00157028301 ",.02)
 ;;00157028301
 ;;9002226.02101,"775,00157028401 ",.01)
 ;;00157028401
 ;;9002226.02101,"775,00157028401 ",.02)
 ;;00157028401
 ;;9002226.02101,"775,00157028510 ",.01)
 ;;00157028510
 ;;9002226.02101,"775,00157028510 ",.02)
 ;;00157028510
 ;;9002226.02101,"775,00157028601 ",.01)
 ;;00157028601
 ;;9002226.02101,"775,00157028601 ",.02)
 ;;00157028601
 ;;9002226.02101,"775,00157028701 ",.01)
 ;;00157028701
 ;;9002226.02101,"775,00157028701 ",.02)
 ;;00157028701
 ;;9002226.02101,"775,00166034406 ",.01)
 ;;00166034406
 ;;9002226.02101,"775,00166034406 ",.02)
 ;;00166034406