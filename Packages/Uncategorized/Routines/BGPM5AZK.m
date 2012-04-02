BGPM5AZK ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON SEP 03, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;;BGPMU ENC OUTPT BEHAVIOR HLTH
 ;
 ; This routine loads Taxonomy BGPMU ENC OUTPT BEHAVIOR HLTH
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
 ;;21,"90804 ")
 ;;1
 ;;21,"90805 ")
 ;;2
 ;;21,"90806 ")
 ;;3
 ;;21,"90807 ")
 ;;4
 ;;21,"90808 ")
 ;;5
 ;;21,"90809 ")
 ;;6
 ;;21,"90810 ")
 ;;7
 ;;21,"90811 ")
 ;;8
 ;;21,"90812 ")
 ;;9
 ;;21,"90813 ")
 ;;10
 ;;21,"90814 ")
 ;;11
 ;;21,"90815 ")
 ;;12
 ;;21,"98960 ")
 ;;13
 ;;21,"98961 ")
 ;;14
 ;;21,"98962 ")
 ;;15
 ;;21,"99078 ")
 ;;16
 ;;21,"99201 ")
 ;;17
 ;;21,"99202 ")
 ;;18
 ;;21,"99203 ")
 ;;19
 ;;21,"99204 ")
 ;;20
 ;;21,"99205 ")
 ;;21
 ;;21,"99211 ")
 ;;22
 ;;21,"99212 ")
 ;;23
 ;;21,"99213 ")
 ;;24
 ;;21,"99214 ")
 ;;25
 ;;21,"99215 ")
 ;;26
 ;;21,"99217 ")
 ;;27
 ;;21,"99218 ")
 ;;28
 ;;21,"99219 ")
 ;;29
 ;;21,"99220 ")
 ;;30
 ;;21,"99241 ")
 ;;31
 ;;21,"99242 ")
 ;;32
 ;;21,"99243 ")
 ;;33
 ;;21,"99244 ")
 ;;34
 ;;21,"99245 ")
 ;;35
 ;;21,"99341 ")
 ;;36
 ;;21,"99342 ")
 ;;37
 ;;21,"99343 ")
 ;;38
 ;;21,"99344 ")
 ;;39
 ;;21,"99345 ")
 ;;40
 ;;21,"99347 ")
 ;;41
 ;;21,"99348 ")
 ;;42
 ;;21,"99349 ")
 ;;43
 ;;21,"99350 ")
 ;;44
 ;;21,"99384 ")
 ;;45
 ;;21,"99385 ")
 ;;46
 ;;21,"99386 ")
 ;;47
 ;;21,"99387 ")
 ;;48
 ;;21,"99394 ")
 ;;49
 ;;21,"99395 ")
 ;;50
 ;;21,"99396 ")
 ;;51
 ;;21,"99397 ")
 ;;52
 ;;21,"99401 ")
 ;;53
 ;;21,"99402 ")
 ;;54
 ;;21,"99403 ")
 ;;55
 ;;21,"99404 ")
 ;;56
 ;;21,"99408 ")
 ;;57
 ;;21,"99409 ")
 ;;58
 ;;21,"99411 ")
 ;;59
 ;;21,"99412 ")
 ;;60
 ;;21,"99510 ")
 ;;61
 ;;9002226,1058,.01)
 ;;BGPMU ENC OUTPT BEHAVIOR HLTH
 ;;9002226,1058,.02)
 ;;Behav Hlth OP E&M
 ;;9002226,1058,.04)
 ;;@
 ;;9002226,1058,.06)
 ;;@
 ;;9002226,1058,.08)
 ;;@
 ;;9002226,1058,.09)
 ;;@
 ;;9002226,1058,.11)
 ;;@
 ;;9002226,1058,.12)
 ;;@
 ;;9002226,1058,.13)
 ;;@
 ;;9002226,1058,.14)
 ;;@
 ;;9002226,1058,.15)
 ;;81
 ;;9002226,1058,.16)
 ;;@
 ;;9002226,1058,.17)
 ;;@
 ;;9002226,1058,3101)
 ;;@
 ;;9002226.02101,"1058,90804 ",.01)
 ;;90804
 ;;9002226.02101,"1058,90804 ",.02)
 ;;90804
 ;;9002226.02101,"1058,90805 ",.01)
 ;;90805
 ;;9002226.02101,"1058,90805 ",.02)
 ;;90805
 ;;9002226.02101,"1058,90806 ",.01)
 ;;90806
 ;;9002226.02101,"1058,90806 ",.02)
 ;;90806
 ;;9002226.02101,"1058,90807 ",.01)
 ;;90807
 ;;9002226.02101,"1058,90807 ",.02)
 ;;90807
 ;;9002226.02101,"1058,90808 ",.01)
 ;;90808
 ;;9002226.02101,"1058,90808 ",.02)
 ;;90808
 ;;9002226.02101,"1058,90809 ",.01)
 ;;90809
 ;;9002226.02101,"1058,90809 ",.02)
 ;;90809
 ;;9002226.02101,"1058,90810 ",.01)
 ;;90810
 ;;9002226.02101,"1058,90810 ",.02)
 ;;90810
 ;;9002226.02101,"1058,90811 ",.01)
 ;;90811
 ;;9002226.02101,"1058,90811 ",.02)
 ;;90811
 ;;9002226.02101,"1058,90812 ",.01)
 ;;90812
 ;;9002226.02101,"1058,90812 ",.02)
 ;;90812
 ;;9002226.02101,"1058,90813 ",.01)
 ;;90813
 ;;9002226.02101,"1058,90813 ",.02)
 ;;90813
 ;;9002226.02101,"1058,90814 ",.01)
 ;;90814
 ;;9002226.02101,"1058,90814 ",.02)
 ;;90814
 ;;9002226.02101,"1058,90815 ",.01)
 ;;90815
 ;;9002226.02101,"1058,90815 ",.02)
 ;;90815
 ;;9002226.02101,"1058,98960 ",.01)
 ;;98960
 ;;9002226.02101,"1058,98960 ",.02)
 ;;98960
 ;;9002226.02101,"1058,98961 ",.01)
 ;;98961
 ;;9002226.02101,"1058,98961 ",.02)
 ;;98961
 ;;9002226.02101,"1058,98962 ",.01)
 ;;98962
 ;;9002226.02101,"1058,98962 ",.02)
 ;;98962
 ;;9002226.02101,"1058,99078 ",.01)
 ;;99078
 ;;9002226.02101,"1058,99078 ",.02)
 ;;99078
 ;;9002226.02101,"1058,99201 ",.01)
 ;;99201
 ;;9002226.02101,"1058,99201 ",.02)
 ;;99201
 ;;9002226.02101,"1058,99202 ",.01)
 ;;99202
 ;;9002226.02101,"1058,99202 ",.02)
 ;;99202
 ;;9002226.02101,"1058,99203 ",.01)
 ;;99203
 ;;9002226.02101,"1058,99203 ",.02)
 ;;99203
 ;;9002226.02101,"1058,99204 ",.01)
 ;;99204
 ;;9002226.02101,"1058,99204 ",.02)
 ;;99204
 ;;9002226.02101,"1058,99205 ",.01)
 ;;99205
 ;;9002226.02101,"1058,99205 ",.02)
 ;;99205
 ;;9002226.02101,"1058,99211 ",.01)
 ;;99211
 ;;9002226.02101,"1058,99211 ",.02)
 ;;99211
 ;;9002226.02101,"1058,99212 ",.01)
 ;;99212
 ;;9002226.02101,"1058,99212 ",.02)
 ;;99212
 ;;9002226.02101,"1058,99213 ",.01)
 ;;99213
 ;;9002226.02101,"1058,99213 ",.02)
 ;;99213
 ;;9002226.02101,"1058,99214 ",.01)
 ;;99214
 ;;9002226.02101,"1058,99214 ",.02)
 ;;99214
 ;;9002226.02101,"1058,99215 ",.01)
 ;;99215
 ;;9002226.02101,"1058,99215 ",.02)
 ;;99215
 ;;9002226.02101,"1058,99217 ",.01)
 ;;99217
 ;;9002226.02101,"1058,99217 ",.02)
 ;;99217
 ;;9002226.02101,"1058,99218 ",.01)
 ;;99218
 ;;9002226.02101,"1058,99218 ",.02)
 ;;99218
 ;;9002226.02101,"1058,99219 ",.01)
 ;;99219
 ;;9002226.02101,"1058,99219 ",.02)
 ;;99219
 ;;9002226.02101,"1058,99220 ",.01)
 ;;99220
 ;;9002226.02101,"1058,99220 ",.02)
 ;;99220
 ;;9002226.02101,"1058,99241 ",.01)
 ;;99241
 ;;9002226.02101,"1058,99241 ",.02)
 ;;99241
 ;;9002226.02101,"1058,99242 ",.01)
 ;;99242
 ;;9002226.02101,"1058,99242 ",.02)
 ;;99242
 ;;9002226.02101,"1058,99243 ",.01)
 ;;99243
 ;;9002226.02101,"1058,99243 ",.02)
 ;;99243
 ;;9002226.02101,"1058,99244 ",.01)
 ;;99244
 ;;9002226.02101,"1058,99244 ",.02)
 ;;99244
 ;;9002226.02101,"1058,99245 ",.01)
 ;;99245
 ;;9002226.02101,"1058,99245 ",.02)
 ;;99245
 ;;9002226.02101,"1058,99341 ",.01)
 ;;99341
 ;;9002226.02101,"1058,99341 ",.02)
 ;;99341
 ;;9002226.02101,"1058,99342 ",.01)
 ;;99342
 ;;9002226.02101,"1058,99342 ",.02)
 ;;99342
 ;;9002226.02101,"1058,99343 ",.01)
 ;;99343
 ;;9002226.02101,"1058,99343 ",.02)
 ;;99343
 ;;9002226.02101,"1058,99344 ",.01)
 ;;99344
 ;;9002226.02101,"1058,99344 ",.02)
 ;;99344
 ;;9002226.02101,"1058,99345 ",.01)
 ;;99345
 ;;9002226.02101,"1058,99345 ",.02)
 ;;99345
 ;;9002226.02101,"1058,99347 ",.01)
 ;;99347
 ;;9002226.02101,"1058,99347 ",.02)
 ;;99347
 ;;9002226.02101,"1058,99348 ",.01)
 ;;99348
 ;;9002226.02101,"1058,99348 ",.02)
 ;;99348
 ;;9002226.02101,"1058,99349 ",.01)
 ;;99349
 ;;9002226.02101,"1058,99349 ",.02)
 ;;99349
 ;;9002226.02101,"1058,99350 ",.01)
 ;;99350
 ;;9002226.02101,"1058,99350 ",.02)
 ;;99350
 ;;9002226.02101,"1058,99384 ",.01)
 ;;99384
 ;;9002226.02101,"1058,99384 ",.02)
 ;;99384
 ;;9002226.02101,"1058,99385 ",.01)
 ;;99385
 ;;9002226.02101,"1058,99385 ",.02)
 ;;99385
 ;;9002226.02101,"1058,99386 ",.01)
 ;;99386
 ;;9002226.02101,"1058,99386 ",.02)
 ;;99386
 ;;9002226.02101,"1058,99387 ",.01)
 ;;99387
 ;;9002226.02101,"1058,99387 ",.02)
 ;;99387
 ;;9002226.02101,"1058,99394 ",.01)
 ;;99394
 ;;9002226.02101,"1058,99394 ",.02)
 ;;99394
 ;;9002226.02101,"1058,99395 ",.01)
 ;;99395
 ;;9002226.02101,"1058,99395 ",.02)
 ;;99395
 ;;9002226.02101,"1058,99396 ",.01)
 ;;99396
 ;;9002226.02101,"1058,99396 ",.02)
 ;;99396
 ;;9002226.02101,"1058,99397 ",.01)
 ;;99397
 ;;9002226.02101,"1058,99397 ",.02)
 ;;99397
 ;;9002226.02101,"1058,99401 ",.01)
 ;;99401
 ;;9002226.02101,"1058,99401 ",.02)
 ;;99401
 ;;9002226.02101,"1058,99402 ",.01)
 ;;99402
 ;;9002226.02101,"1058,99402 ",.02)
 ;;99402
 ;;9002226.02101,"1058,99403 ",.01)
 ;;99403
 ;;9002226.02101,"1058,99403 ",.02)
 ;;99403
 ;;9002226.02101,"1058,99404 ",.01)
 ;;99404
 ;;9002226.02101,"1058,99404 ",.02)
 ;;99404
 ;;9002226.02101,"1058,99408 ",.01)
 ;;99408
 ;;9002226.02101,"1058,99408 ",.02)
 ;;99408
 ;;9002226.02101,"1058,99409 ",.01)
 ;;99409
 ;;9002226.02101,"1058,99409 ",.02)
 ;;99409
 ;;9002226.02101,"1058,99411 ",.01)
 ;;99411
 ;;9002226.02101,"1058,99411 ",.02)
 ;;99411
 ;;9002226.02101,"1058,99412 ",.01)
 ;;99412
 ;;9002226.02101,"1058,99412 ",.02)
 ;;99412
 ;;9002226.02101,"1058,99510 ",.01)
 ;;99510
 ;;9002226.02101,"1058,99510 ",.02)
 ;;99510
 ;
OTHER ; OTHER ROUTINES
 Q
