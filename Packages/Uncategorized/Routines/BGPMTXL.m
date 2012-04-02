BGPMTXL ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON FEB 02, 2011;
 ;;11.0;IHS CLINICAL REPORTING;**4**;JAN 06, 2011;Build 84
 ;;BGPMU COLON ENC EM
 ;
 ; This routine loads Taxonomy BGPMU COLON ENC EM
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 D OTHER
 I $O(^TMP("ATX",$J,3.6,0)) D BULL^ATXSTX2
 I $O(^TMP("ATX",$J,9002226,0)) D TAX^ATXSTX2
 D KILL^ATXSTX2
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"99201 ")
 ;;1
 ;;21,"99202 ")
 ;;2
 ;;21,"99203 ")
 ;;3
 ;;21,"99204 ")
 ;;4
 ;;21,"99205 ")
 ;;5
 ;;21,"99211 ")
 ;;6
 ;;21,"99212 ")
 ;;7
 ;;21,"99213 ")
 ;;8
 ;;21,"99214 ")
 ;;9
 ;;21,"99215 ")
 ;;10
 ;;21,"99217 ")
 ;;11
 ;;21,"99218 ")
 ;;12
 ;;21,"99219 ")
 ;;13
 ;;21,"99220 ")
 ;;14
 ;;21,"99241 ")
 ;;15
 ;;21,"99242 ")
 ;;16
 ;;21,"99243 ")
 ;;17
 ;;21,"99244 ")
 ;;18
 ;;21,"99245 ")
 ;;19
 ;;21,"99341 ")
 ;;20
 ;;21,"99342 ")
 ;;21
 ;;21,"99343 ")
 ;;22
 ;;21,"99344 ")
 ;;23
 ;;21,"99345 ")
 ;;24
 ;;21,"99347 ")
 ;;25
 ;;21,"99348 ")
 ;;26
 ;;21,"99349 ")
 ;;27
 ;;21,"99350 ")
 ;;28
 ;;21,"99384 ")
 ;;29
 ;;21,"99385 ")
 ;;30
 ;;21,"99386 ")
 ;;31
 ;;21,"99387 ")
 ;;32
 ;;21,"99394 ")
 ;;33
 ;;21,"99395 ")
 ;;34
 ;;21,"99396 ")
 ;;35
 ;;21,"99397 ")
 ;;36
 ;;21,"99401 ")
 ;;37
 ;;21,"99402 ")
 ;;38
 ;;21,"99403 ")
 ;;39
 ;;21,"99404 ")
 ;;40
 ;;21,"99411 ")
 ;;41
 ;;21,"99412 ")
 ;;42
 ;;21,"99420 ")
 ;;43
 ;;21,"99429 ")
 ;;44
 ;;21,"99455 ")
 ;;45
 ;;21,"99456 ")
 ;;46
 ;;9002226,721,.01)
 ;;BGPMU COLON ENC EM
 ;;9002226,721,.02)
 ;;Colon Encounter CPTS
 ;;9002226,721,.04)
 ;;n
 ;;9002226,721,.06)
 ;;@
 ;;9002226,721,.08)
 ;;@
 ;;9002226,721,.09)
 ;;3110107
 ;;9002226,721,.11)
 ;;@
 ;;9002226,721,.12)
 ;;@
 ;;9002226,721,.13)
 ;;@
 ;;9002226,721,.14)
 ;;@
 ;;9002226,721,.15)
 ;;81
 ;;9002226,721,.16)
 ;;1
 ;;9002226,721,.17)
 ;;@
 ;;9002226,721,3101)
 ;;@
 ;;9002226.02101,"721,99201 ",.01)
 ;;99201
 ;;9002226.02101,"721,99201 ",.02)
 ;;99201
 ;;9002226.02101,"721,99202 ",.01)
 ;;99202
 ;;9002226.02101,"721,99202 ",.02)
 ;;99202
 ;;9002226.02101,"721,99203 ",.01)
 ;;99203
 ;;9002226.02101,"721,99203 ",.02)
 ;;99203
 ;;9002226.02101,"721,99204 ",.01)
 ;;99204
 ;;9002226.02101,"721,99204 ",.02)
 ;;99204
 ;;9002226.02101,"721,99205 ",.01)
 ;;99205
 ;;9002226.02101,"721,99205 ",.02)
 ;;99205
 ;;9002226.02101,"721,99211 ",.01)
 ;;99211
 ;;9002226.02101,"721,99211 ",.02)
 ;;99211
 ;;9002226.02101,"721,99212 ",.01)
 ;;99212
 ;;9002226.02101,"721,99212 ",.02)
 ;;99212
 ;;9002226.02101,"721,99213 ",.01)
 ;;99213
 ;;9002226.02101,"721,99213 ",.02)
 ;;99213
 ;;9002226.02101,"721,99214 ",.01)
 ;;99214
 ;;9002226.02101,"721,99214 ",.02)
 ;;99214
 ;;9002226.02101,"721,99215 ",.01)
 ;;99215
 ;;9002226.02101,"721,99215 ",.02)
 ;;99215
 ;;9002226.02101,"721,99217 ",.01)
 ;;99217
 ;;9002226.02101,"721,99217 ",.02)
 ;;99217
 ;;9002226.02101,"721,99218 ",.01)
 ;;99218
 ;;9002226.02101,"721,99218 ",.02)
 ;;99218
 ;;9002226.02101,"721,99219 ",.01)
 ;;99219
 ;;9002226.02101,"721,99219 ",.02)
 ;;99219
 ;;9002226.02101,"721,99220 ",.01)
 ;;99220
 ;;9002226.02101,"721,99220 ",.02)
 ;;99220
 ;;9002226.02101,"721,99241 ",.01)
 ;;99241
 ;;9002226.02101,"721,99241 ",.02)
 ;;99241
 ;;9002226.02101,"721,99242 ",.01)
 ;;99242
 ;;9002226.02101,"721,99242 ",.02)
 ;;99242
 ;;9002226.02101,"721,99243 ",.01)
 ;;99243
 ;;9002226.02101,"721,99243 ",.02)
 ;;99243
 ;;9002226.02101,"721,99244 ",.01)
 ;;99244
 ;;9002226.02101,"721,99244 ",.02)
 ;;99244
 ;;9002226.02101,"721,99245 ",.01)
 ;;99245
 ;;9002226.02101,"721,99245 ",.02)
 ;;99245
 ;;9002226.02101,"721,99341 ",.01)
 ;;99341
 ;;9002226.02101,"721,99341 ",.02)
 ;;99341
 ;;9002226.02101,"721,99342 ",.01)
 ;;99342
 ;;9002226.02101,"721,99342 ",.02)
 ;;99342
 ;;9002226.02101,"721,99343 ",.01)
 ;;99343
 ;;9002226.02101,"721,99343 ",.02)
 ;;99343
 ;;9002226.02101,"721,99344 ",.01)
 ;;99344
 ;;9002226.02101,"721,99344 ",.02)
 ;;99344
 ;;9002226.02101,"721,99345 ",.01)
 ;;99345
 ;;9002226.02101,"721,99345 ",.02)
 ;;99345
 ;;9002226.02101,"721,99347 ",.01)
 ;;99347
 ;;9002226.02101,"721,99347 ",.02)
 ;;99347
 ;;9002226.02101,"721,99348 ",.01)
 ;;99348
 ;;9002226.02101,"721,99348 ",.02)
 ;;99348
 ;;9002226.02101,"721,99349 ",.01)
 ;;99349
 ;;9002226.02101,"721,99349 ",.02)
 ;;99349
 ;;9002226.02101,"721,99350 ",.01)
 ;;99350
 ;;9002226.02101,"721,99350 ",.02)
 ;;99350
 ;;9002226.02101,"721,99384 ",.01)
 ;;99384
 ;;9002226.02101,"721,99384 ",.02)
 ;;99384
 ;;9002226.02101,"721,99385 ",.01)
 ;;99385
 ;;9002226.02101,"721,99385 ",.02)
 ;;99385
 ;;9002226.02101,"721,99386 ",.01)
 ;;99386
 ;;9002226.02101,"721,99386 ",.02)
 ;;99386
 ;;9002226.02101,"721,99387 ",.01)
 ;;99387
 ;;9002226.02101,"721,99387 ",.02)
 ;;99387
 ;;9002226.02101,"721,99394 ",.01)
 ;;99394
 ;;9002226.02101,"721,99394 ",.02)
 ;;99394
 ;;9002226.02101,"721,99395 ",.01)
 ;;99395
 ;;9002226.02101,"721,99395 ",.02)
 ;;99395
 ;;9002226.02101,"721,99396 ",.01)
 ;;99396
 ;;9002226.02101,"721,99396 ",.02)
 ;;99396
 ;;9002226.02101,"721,99397 ",.01)
 ;;99397
 ;;9002226.02101,"721,99397 ",.02)
 ;;99397
 ;;9002226.02101,"721,99401 ",.01)
 ;;99401
 ;;9002226.02101,"721,99401 ",.02)
 ;;99401
 ;;9002226.02101,"721,99402 ",.01)
 ;;99402
 ;;9002226.02101,"721,99402 ",.02)
 ;;99402
 ;;9002226.02101,"721,99403 ",.01)
 ;;99403
 ;;9002226.02101,"721,99403 ",.02)
 ;;99403
 ;;9002226.02101,"721,99404 ",.01)
 ;;99404
 ;;9002226.02101,"721,99404 ",.02)
 ;;99404
 ;;9002226.02101,"721,99411 ",.01)
 ;;99411
 ;;9002226.02101,"721,99411 ",.02)
 ;;99411
 ;;9002226.02101,"721,99412 ",.01)
 ;;99412
 ;;9002226.02101,"721,99412 ",.02)
 ;;99412
 ;;9002226.02101,"721,99420 ",.01)
 ;;99420
 ;;9002226.02101,"721,99420 ",.02)
 ;;99420
 ;;9002226.02101,"721,99429 ",.01)
 ;;99429
 ;;9002226.02101,"721,99429 ",.02)
 ;;99429
 ;;9002226.02101,"721,99455 ",.01)
 ;;99455
 ;;9002226.02101,"721,99455 ",.02)
 ;;99455
 ;;9002226.02101,"721,99456 ",.01)
 ;;99456
 ;;9002226.02101,"721,99456 ",.02)
 ;;99456
 ;
OTHER ; OTHER ROUTINES
 Q