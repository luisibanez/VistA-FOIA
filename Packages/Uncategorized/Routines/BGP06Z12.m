BGP06Z12 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"982,52959-0035-40 ",.02)
 ;;52959-0035-40
 ;;9002226.02101,"982,52959-0035-56 ",.01)
 ;;52959-0035-56
 ;;9002226.02101,"982,52959-0035-56 ",.02)
 ;;52959-0035-56
 ;;9002226.02101,"982,52959-0035-60 ",.01)
 ;;52959-0035-60
 ;;9002226.02101,"982,52959-0035-60 ",.02)
 ;;52959-0035-60
 ;;9002226.02101,"982,52959-0035-70 ",.01)
 ;;52959-0035-70
 ;;9002226.02101,"982,52959-0035-70 ",.02)
 ;;52959-0035-70
 ;;9002226.02101,"982,52959-0035-90 ",.01)
 ;;52959-0035-90
 ;;9002226.02101,"982,52959-0035-90 ",.02)
 ;;52959-0035-90
 ;;9002226.02101,"982,52959-0042-00 ",.01)
 ;;52959-0042-00
 ;;9002226.02101,"982,52959-0042-00 ",.02)
 ;;52959-0042-00
 ;;9002226.02101,"982,52959-0042-02 ",.01)
 ;;52959-0042-02
 ;;9002226.02101,"982,52959-0042-02 ",.02)
 ;;52959-0042-02
 ;;9002226.02101,"982,52959-0042-04 ",.01)
 ;;52959-0042-04
 ;;9002226.02101,"982,52959-0042-04 ",.02)
 ;;52959-0042-04
 ;;9002226.02101,"982,52959-0042-07 ",.01)
 ;;52959-0042-07
 ;;9002226.02101,"982,52959-0042-07 ",.02)
 ;;52959-0042-07
 ;;9002226.02101,"982,52959-0042-10 ",.01)
 ;;52959-0042-10
 ;;9002226.02101,"982,52959-0042-10 ",.02)
 ;;52959-0042-10
 ;;9002226.02101,"982,52959-0042-12 ",.01)
 ;;52959-0042-12
 ;;9002226.02101,"982,52959-0042-12 ",.02)
 ;;52959-0042-12
 ;;9002226.02101,"982,52959-0042-14 ",.01)
 ;;52959-0042-14
 ;;9002226.02101,"982,52959-0042-14 ",.02)
 ;;52959-0042-14
 ;;9002226.02101,"982,52959-0042-15 ",.01)
 ;;52959-0042-15
 ;;9002226.02101,"982,52959-0042-15 ",.02)
 ;;52959-0042-15
 ;;9002226.02101,"982,52959-0042-20 ",.01)
 ;;52959-0042-20
 ;;9002226.02101,"982,52959-0042-20 ",.02)
 ;;52959-0042-20
 ;;9002226.02101,"982,52959-0042-21 ",.01)
 ;;52959-0042-21
 ;;9002226.02101,"982,52959-0042-21 ",.02)
 ;;52959-0042-21
 ;;9002226.02101,"982,52959-0042-25 ",.01)
 ;;52959-0042-25
 ;;9002226.02101,"982,52959-0042-25 ",.02)
 ;;52959-0042-25
 ;;9002226.02101,"982,52959-0042-28 ",.01)
 ;;52959-0042-28
 ;;9002226.02101,"982,52959-0042-28 ",.02)
 ;;52959-0042-28
 ;;9002226.02101,"982,52959-0042-30 ",.01)
 ;;52959-0042-30
 ;;9002226.02101,"982,52959-0042-30 ",.02)
 ;;52959-0042-30
 ;;9002226.02101,"982,52959-0042-35 ",.01)
 ;;52959-0042-35
 ;;9002226.02101,"982,52959-0042-35 ",.02)
 ;;52959-0042-35
 ;;9002226.02101,"982,52959-0042-40 ",.01)
 ;;52959-0042-40
 ;;9002226.02101,"982,52959-0042-40 ",.02)
 ;;52959-0042-40
 ;;9002226.02101,"982,52959-0042-45 ",.01)
 ;;52959-0042-45
 ;;9002226.02101,"982,52959-0042-45 ",.02)
 ;;52959-0042-45
 ;;9002226.02101,"982,52959-0042-60 ",.01)
 ;;52959-0042-60
 ;;9002226.02101,"982,52959-0042-60 ",.02)
 ;;52959-0042-60
 ;;9002226.02101,"982,52959-0042-90 ",.01)
 ;;52959-0042-90
 ;;9002226.02101,"982,52959-0042-90 ",.02)
 ;;52959-0042-90
 ;;9002226.02101,"982,52959-0069-10 ",.01)
 ;;52959-0069-10
 ;;9002226.02101,"982,52959-0069-10 ",.02)
 ;;52959-0069-10
 ;;9002226.02101,"982,52959-0069-15 ",.01)
 ;;52959-0069-15
 ;;9002226.02101,"982,52959-0069-15 ",.02)
 ;;52959-0069-15
 ;;9002226.02101,"982,52959-0069-20 ",.01)
 ;;52959-0069-20
 ;;9002226.02101,"982,52959-0069-20 ",.02)
 ;;52959-0069-20
 ;;9002226.02101,"982,52959-0069-21 ",.01)
 ;;52959-0069-21
 ;;9002226.02101,"982,52959-0069-21 ",.02)
 ;;52959-0069-21
 ;;9002226.02101,"982,52959-0069-30 ",.01)
 ;;52959-0069-30
 ;;9002226.02101,"982,52959-0069-30 ",.02)
 ;;52959-0069-30
 ;;9002226.02101,"982,52959-0069-40 ",.01)
 ;;52959-0069-40
 ;;9002226.02101,"982,52959-0069-40 ",.02)
 ;;52959-0069-40
 ;;9002226.02101,"982,52959-0099-00 ",.01)
 ;;52959-0099-00
 ;;9002226.02101,"982,52959-0099-00 ",.02)
 ;;52959-0099-00
 ;;9002226.02101,"982,52959-0099-03 ",.01)
 ;;52959-0099-03
 ;;9002226.02101,"982,52959-0099-03 ",.02)
 ;;52959-0099-03
 ;;9002226.02101,"982,52959-0099-10 ",.01)
 ;;52959-0099-10
 ;;9002226.02101,"982,52959-0099-10 ",.02)
 ;;52959-0099-10
 ;;9002226.02101,"982,52959-0099-15 ",.01)
 ;;52959-0099-15
 ;;9002226.02101,"982,52959-0099-15 ",.02)
 ;;52959-0099-15
 ;;9002226.02101,"982,52959-0099-20 ",.01)
 ;;52959-0099-20
 ;;9002226.02101,"982,52959-0099-20 ",.02)
 ;;52959-0099-20
 ;;9002226.02101,"982,52959-0099-21 ",.01)
 ;;52959-0099-21
 ;;9002226.02101,"982,52959-0099-21 ",.02)
 ;;52959-0099-21
 ;;9002226.02101,"982,52959-0099-28 ",.01)
 ;;52959-0099-28
 ;;9002226.02101,"982,52959-0099-28 ",.02)
 ;;52959-0099-28
 ;;9002226.02101,"982,52959-0099-30 ",.01)
 ;;52959-0099-30
 ;;9002226.02101,"982,52959-0099-30 ",.02)
 ;;52959-0099-30
 ;;9002226.02101,"982,52959-0099-40 ",.01)
 ;;52959-0099-40
 ;;9002226.02101,"982,52959-0099-40 ",.02)
 ;;52959-0099-40
 ;;9002226.02101,"982,52959-0099-45 ",.01)
 ;;52959-0099-45
 ;;9002226.02101,"982,52959-0099-45 ",.02)
 ;;52959-0099-45
 ;;9002226.02101,"982,52959-0099-50 ",.01)
 ;;52959-0099-50
 ;;9002226.02101,"982,52959-0099-50 ",.02)
 ;;52959-0099-50
 ;;9002226.02101,"982,52959-0099-60 ",.01)
 ;;52959-0099-60
 ;;9002226.02101,"982,52959-0099-60 ",.02)
 ;;52959-0099-60
 ;;9002226.02101,"982,52959-0099-90 ",.01)
 ;;52959-0099-90
 ;;9002226.02101,"982,52959-0099-90 ",.02)
 ;;52959-0099-90
 ;;9002226.02101,"982,52959-0115-20 ",.01)
 ;;52959-0115-20
 ;;9002226.02101,"982,52959-0115-20 ",.02)
 ;;52959-0115-20
 ;;9002226.02101,"982,52959-0167-00 ",.01)
 ;;52959-0167-00
 ;;9002226.02101,"982,52959-0167-00 ",.02)
 ;;52959-0167-00
 ;;9002226.02101,"982,52959-0167-03 ",.01)
 ;;52959-0167-03
 ;;9002226.02101,"982,52959-0167-03 ",.02)
 ;;52959-0167-03
 ;;9002226.02101,"982,52959-0167-10 ",.01)
 ;;52959-0167-10
 ;;9002226.02101,"982,52959-0167-10 ",.02)
 ;;52959-0167-10
 ;;9002226.02101,"982,52959-0167-12 ",.01)
 ;;52959-0167-12
 ;;9002226.02101,"982,52959-0167-12 ",.02)
 ;;52959-0167-12
 ;;9002226.02101,"982,52959-0167-15 ",.01)
 ;;52959-0167-15
 ;;9002226.02101,"982,52959-0167-15 ",.02)
 ;;52959-0167-15
 ;;9002226.02101,"982,52959-0167-20 ",.01)
 ;;52959-0167-20
 ;;9002226.02101,"982,52959-0167-20 ",.02)
 ;;52959-0167-20
 ;;9002226.02101,"982,52959-0167-21 ",.01)
 ;;52959-0167-21
 ;;9002226.02101,"982,52959-0167-21 ",.02)
 ;;52959-0167-21
 ;;9002226.02101,"982,52959-0167-24 ",.01)
 ;;52959-0167-24
 ;;9002226.02101,"982,52959-0167-24 ",.02)
 ;;52959-0167-24
 ;;9002226.02101,"982,52959-0167-30 ",.01)
 ;;52959-0167-30
 ;;9002226.02101,"982,52959-0167-30 ",.02)
 ;;52959-0167-30
 ;;9002226.02101,"982,52959-0167-40 ",.01)
 ;;52959-0167-40
 ;;9002226.02101,"982,52959-0167-40 ",.02)
 ;;52959-0167-40
 ;;9002226.02101,"982,52959-0167-60 ",.01)
 ;;52959-0167-60
 ;;9002226.02101,"982,52959-0167-60 ",.02)
 ;;52959-0167-60
 ;;9002226.02101,"982,52959-0167-90 ",.01)
 ;;52959-0167-90
 ;;9002226.02101,"982,52959-0167-90 ",.02)
 ;;52959-0167-90
 ;;9002226.02101,"982,52959-0178-10 ",.01)
 ;;52959-0178-10
 ;;9002226.02101,"982,52959-0178-10 ",.02)
 ;;52959-0178-10
 ;;9002226.02101,"982,52959-0178-14 ",.01)
 ;;52959-0178-14
 ;;9002226.02101,"982,52959-0178-14 ",.02)
 ;;52959-0178-14
 ;;9002226.02101,"982,52959-0178-15 ",.01)
 ;;52959-0178-15
 ;;9002226.02101,"982,52959-0178-15 ",.02)
 ;;52959-0178-15
 ;;9002226.02101,"982,52959-0178-20 ",.01)
 ;;52959-0178-20
 ;;9002226.02101,"982,52959-0178-20 ",.02)
 ;;52959-0178-20
 ;;9002226.02101,"982,52959-0178-30 ",.01)
 ;;52959-0178-30
 ;;9002226.02101,"982,52959-0178-30 ",.02)
 ;;52959-0178-30
 ;;9002226.02101,"982,52959-0410-03 ",.01)
 ;;52959-0410-03
 ;;9002226.02101,"982,52959-0410-03 ",.02)
 ;;52959-0410-03
 ;;9002226.02101,"982,52959-0410-08 ",.01)
 ;;52959-0410-08
 ;;9002226.02101,"982,52959-0410-08 ",.02)
 ;;52959-0410-08
 ;;9002226.02101,"982,52959-0410-09 ",.01)
 ;;52959-0410-09
 ;;9002226.02101,"982,52959-0410-09 ",.02)
 ;;52959-0410-09
 ;;9002226.02101,"982,52959-0410-10 ",.01)
 ;;52959-0410-10
 ;;9002226.02101,"982,52959-0410-10 ",.02)
 ;;52959-0410-10
 ;;9002226.02101,"982,52959-0410-11 ",.01)
 ;;52959-0410-11
 ;;9002226.02101,"982,52959-0410-11 ",.02)
 ;;52959-0410-11
 ;;9002226.02101,"982,52959-0410-14 ",.01)
 ;;52959-0410-14
 ;;9002226.02101,"982,52959-0410-14 ",.02)
 ;;52959-0410-14
 ;;9002226.02101,"982,52959-0410-15 ",.01)
 ;;52959-0410-15
 ;;9002226.02101,"982,52959-0410-15 ",.02)
 ;;52959-0410-15
 ;;9002226.02101,"982,52959-0410-18 ",.01)
 ;;52959-0410-18
 ;;9002226.02101,"982,52959-0410-18 ",.02)
 ;;52959-0410-18
 ;;9002226.02101,"982,52959-0410-20 ",.01)
 ;;52959-0410-20
 ;;9002226.02101,"982,52959-0410-20 ",.02)
 ;;52959-0410-20
 ;;9002226.02101,"982,52959-0410-28 ",.01)
 ;;52959-0410-28
 ;;9002226.02101,"982,52959-0410-28 ",.02)
 ;;52959-0410-28
 ;;9002226.02101,"982,52959-0410-30 ",.01)
 ;;52959-0410-30
 ;;9002226.02101,"982,52959-0410-30 ",.02)
 ;;52959-0410-30
 ;;9002226.02101,"982,52959-0410-40 ",.01)
 ;;52959-0410-40
 ;;9002226.02101,"982,52959-0410-40 ",.02)
 ;;52959-0410-40
 ;;9002226.02101,"982,52959-0410-42 ",.01)
 ;;52959-0410-42
 ;;9002226.02101,"982,52959-0410-42 ",.02)
 ;;52959-0410-42
 ;;9002226.02101,"982,52959-0410-45 ",.01)
 ;;52959-0410-45
 ;;9002226.02101,"982,52959-0410-45 ",.02)
 ;;52959-0410-45
 ;;9002226.02101,"982,52959-0410-50 ",.01)
 ;;52959-0410-50
 ;;9002226.02101,"982,52959-0410-50 ",.02)
 ;;52959-0410-50
 ;;9002226.02101,"982,52959-0410-60 ",.01)
 ;;52959-0410-60
 ;;9002226.02101,"982,52959-0410-60 ",.02)
 ;;52959-0410-60
 ;;9002226.02101,"982,52959-0410-90 ",.01)
 ;;52959-0410-90
 ;;9002226.02101,"982,52959-0410-90 ",.02)
 ;;52959-0410-90
 ;;9002226.02101,"982,52959-0454-02 ",.01)
 ;;52959-0454-02
 ;;9002226.02101,"982,52959-0454-02 ",.02)
 ;;52959-0454-02
 ;;9002226.02101,"982,52959-0454-14 ",.01)
 ;;52959-0454-14
 ;;9002226.02101,"982,52959-0454-14 ",.02)
 ;;52959-0454-14
 ;;9002226.02101,"982,52959-0454-60 ",.01)
 ;;52959-0454-60
 ;;9002226.02101,"982,52959-0454-60 ",.02)
 ;;52959-0454-60
 ;;9002226.02101,"982,52959-0527-10 ",.01)
 ;;52959-0527-10
 ;;9002226.02101,"982,52959-0527-10 ",.02)
 ;;52959-0527-10
 ;;9002226.02101,"982,52959-0527-14 ",.01)
 ;;52959-0527-14
 ;;9002226.02101,"982,52959-0527-14 ",.02)
 ;;52959-0527-14
 ;;9002226.02101,"982,52959-0527-15 ",.01)
 ;;52959-0527-15
 ;;9002226.02101,"982,52959-0527-15 ",.02)
 ;;52959-0527-15
 ;;9002226.02101,"982,52959-0527-20 ",.01)
 ;;52959-0527-20
 ;;9002226.02101,"982,52959-0527-20 ",.02)
 ;;52959-0527-20
 ;;9002226.02101,"982,52959-0527-30 ",.01)
 ;;52959-0527-30
 ;;9002226.02101,"982,52959-0527-30 ",.02)
 ;;52959-0527-30
 ;;9002226.02101,"982,52959-0527-42 ",.01)
 ;;52959-0527-42
 ;;9002226.02101,"982,52959-0527-42 ",.02)
 ;;52959-0527-42
 ;;9002226.02101,"982,52959-0527-60 ",.01)
 ;;52959-0527-60
 ;;9002226.02101,"982,52959-0527-60 ",.02)
 ;;52959-0527-60
 ;;9002226.02101,"982,52959-0528-90 ",.01)
 ;;52959-0528-90
 ;;9002226.02101,"982,52959-0528-90 ",.02)
 ;;52959-0528-90
 ;;9002226.02101,"982,52959-0673-60 ",.01)
 ;;52959-0673-60
 ;;9002226.02101,"982,52959-0673-60 ",.02)
 ;;52959-0673-60
 ;;9002226.02101,"982,52959-0709-00 ",.01)
 ;;52959-0709-00
 ;;9002226.02101,"982,52959-0709-00 ",.02)
 ;;52959-0709-00
 ;;9002226.02101,"982,52959-0709-02 ",.01)
 ;;52959-0709-02
 ;;9002226.02101,"982,52959-0709-02 ",.02)
 ;;52959-0709-02
 ;;9002226.02101,"982,52959-0709-14 ",.01)
 ;;52959-0709-14
 ;;9002226.02101,"982,52959-0709-14 ",.02)
 ;;52959-0709-14
 ;;9002226.02101,"982,52959-0709-15 ",.01)
 ;;52959-0709-15
 ;;9002226.02101,"982,52959-0709-15 ",.02)
 ;;52959-0709-15
 ;;9002226.02101,"982,52959-0709-18 ",.01)
 ;;52959-0709-18
 ;;9002226.02101,"982,52959-0709-18 ",.02)
 ;;52959-0709-18
 ;;9002226.02101,"982,52959-0709-20 ",.01)
 ;;52959-0709-20
 ;;9002226.02101,"982,52959-0709-20 ",.02)
 ;;52959-0709-20
 ;;9002226.02101,"982,52959-0709-21 ",.01)
 ;;52959-0709-21
 ;;9002226.02101,"982,52959-0709-21 ",.02)
 ;;52959-0709-21
 ;;9002226.02101,"982,52959-0709-28 ",.01)
 ;;52959-0709-28
 ;;9002226.02101,"982,52959-0709-28 ",.02)
 ;;52959-0709-28
 ;;9002226.02101,"982,52959-0709-30 ",.01)
 ;;52959-0709-30
 ;;9002226.02101,"982,52959-0709-30 ",.02)
 ;;52959-0709-30
 ;;9002226.02101,"982,52959-0709-40 ",.01)
 ;;52959-0709-40
 ;;9002226.02101,"982,52959-0709-40 ",.02)
 ;;52959-0709-40
 ;;9002226.02101,"982,52959-0709-42 ",.01)
 ;;52959-0709-42
 ;;9002226.02101,"982,52959-0709-42 ",.02)
 ;;52959-0709-42
 ;;9002226.02101,"982,52959-0709-45 ",.01)
 ;;52959-0709-45
 ;;9002226.02101,"982,52959-0709-45 ",.02)
 ;;52959-0709-45
 ;;9002226.02101,"982,52959-0709-50 ",.01)
 ;;52959-0709-50
 ;;9002226.02101,"982,52959-0709-50 ",.02)
 ;;52959-0709-50
 ;;9002226.02101,"982,52959-0709-56 ",.01)
 ;;52959-0709-56
 ;;9002226.02101,"982,52959-0709-56 ",.02)
 ;;52959-0709-56
 ;;9002226.02101,"982,52959-0709-60 ",.01)
 ;;52959-0709-60
 ;;9002226.02101,"982,52959-0709-60 ",.02)
 ;;52959-0709-60
 ;;9002226.02101,"982,52959-0709-90 ",.01)
 ;;52959-0709-90
 ;;9002226.02101,"982,52959-0709-90 ",.02)
 ;;52959-0709-90
 ;;9002226.02101,"982,52959-0846-00 ",.01)
 ;;52959-0846-00
 ;;9002226.02101,"982,52959-0846-00 ",.02)
 ;;52959-0846-00
 ;;9002226.02101,"982,52959-0846-10 ",.01)
 ;;52959-0846-10
 ;;9002226.02101,"982,52959-0846-10 ",.02)
 ;;52959-0846-10
 ;;9002226.02101,"982,52959-0846-15 ",.01)
 ;;52959-0846-15
 ;;9002226.02101,"982,52959-0846-15 ",.02)
 ;;52959-0846-15
 ;;9002226.02101,"982,52959-0846-20 ",.01)
 ;;52959-0846-20
 ;;9002226.02101,"982,52959-0846-20 ",.02)
 ;;52959-0846-20
 ;;9002226.02101,"982,52959-0846-30 ",.01)
 ;;52959-0846-30
 ;;9002226.02101,"982,52959-0846-30 ",.02)
 ;;52959-0846-30
 ;;9002226.02101,"982,52959-0846-60 ",.01)
 ;;52959-0846-60
 ;;9002226.02101,"982,52959-0846-60 ",.02)
 ;;52959-0846-60
 ;;9002226.02101,"982,52959-0846-90 ",.01)
 ;;52959-0846-90
