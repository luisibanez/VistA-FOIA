BGP06A19 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"974,00015-7346-39 ",.01)
 ;;00015-7346-39
 ;;9002226.02101,"974,00015-7346-39 ",.02)
 ;;00015-7346-39
 ;;9002226.02101,"974,00015-7346-97 ",.01)
 ;;00015-7346-97
 ;;9002226.02101,"974,00015-7346-97 ",.02)
 ;;00015-7346-97
 ;;9002226.02101,"974,00015-7401-20 ",.01)
 ;;00015-7401-20
 ;;9002226.02101,"974,00015-7401-20 ",.02)
 ;;00015-7401-20
 ;;9002226.02101,"974,00015-7401-99 ",.01)
 ;;00015-7401-99
 ;;9002226.02101,"974,00015-7401-99 ",.02)
 ;;00015-7401-99
 ;;9002226.02101,"974,00015-7402-20 ",.01)
 ;;00015-7402-20
 ;;9002226.02101,"974,00015-7402-20 ",.02)
 ;;00015-7402-20
 ;;9002226.02101,"974,00015-7402-99 ",.01)
 ;;00015-7402-99
 ;;9002226.02101,"974,00015-7402-99 ",.02)
 ;;00015-7402-99
 ;;9002226.02101,"974,00015-7403-20 ",.01)
 ;;00015-7403-20
 ;;9002226.02101,"974,00015-7403-20 ",.02)
 ;;00015-7403-20
 ;;9002226.02101,"974,00015-7403-30 ",.01)
 ;;00015-7403-30
 ;;9002226.02101,"974,00015-7403-30 ",.02)
 ;;00015-7403-30
 ;;9002226.02101,"974,00015-7403-94 ",.01)
 ;;00015-7403-94
 ;;9002226.02101,"974,00015-7403-94 ",.02)
 ;;00015-7403-94
 ;;9002226.02101,"974,00015-7403-99 ",.01)
 ;;00015-7403-99
 ;;9002226.02101,"974,00015-7403-99 ",.02)
 ;;00015-7403-99
 ;;9002226.02101,"974,00015-7404-18 ",.01)
 ;;00015-7404-18
 ;;9002226.02101,"974,00015-7404-18 ",.02)
 ;;00015-7404-18
 ;;9002226.02101,"974,00015-7404-20 ",.01)
 ;;00015-7404-20
 ;;9002226.02101,"974,00015-7404-20 ",.02)
 ;;00015-7404-20
 ;;9002226.02101,"974,00015-7404-28 ",.01)
 ;;00015-7404-28
 ;;9002226.02101,"974,00015-7404-28 ",.02)
 ;;00015-7404-28
 ;;9002226.02101,"974,00015-7404-29 ",.01)
 ;;00015-7404-29
 ;;9002226.02101,"974,00015-7404-29 ",.02)
 ;;00015-7404-29
 ;;9002226.02101,"974,00015-7404-36 ",.01)
 ;;00015-7404-36
 ;;9002226.02101,"974,00015-7404-36 ",.02)
 ;;00015-7404-36
 ;;9002226.02101,"974,00015-7404-89 ",.01)
 ;;00015-7404-89
 ;;9002226.02101,"974,00015-7404-89 ",.02)
 ;;00015-7404-89
 ;;9002226.02101,"974,00015-7404-94 ",.01)
 ;;00015-7404-94
 ;;9002226.02101,"974,00015-7404-94 ",.02)
 ;;00015-7404-94
 ;;9002226.02101,"974,00015-7404-99 ",.01)
 ;;00015-7404-99
 ;;9002226.02101,"974,00015-7404-99 ",.02)
 ;;00015-7404-99
 ;;9002226.02101,"974,00015-7405-18 ",.01)
 ;;00015-7405-18
 ;;9002226.02101,"974,00015-7405-18 ",.02)
 ;;00015-7405-18
 ;;9002226.02101,"974,00015-7405-20 ",.01)
 ;;00015-7405-20
 ;;9002226.02101,"974,00015-7405-20 ",.02)
 ;;00015-7405-20
 ;;9002226.02101,"974,00015-7405-28 ",.01)
 ;;00015-7405-28
 ;;9002226.02101,"974,00015-7405-28 ",.02)
 ;;00015-7405-28
 ;;9002226.02101,"974,00015-7405-29 ",.01)
 ;;00015-7405-29
 ;;9002226.02101,"974,00015-7405-29 ",.02)
 ;;00015-7405-29
 ;;9002226.02101,"974,00015-7405-89 ",.01)
 ;;00015-7405-89
 ;;9002226.02101,"974,00015-7405-89 ",.02)
 ;;00015-7405-89
 ;;9002226.02101,"974,00015-7405-95 ",.01)
 ;;00015-7405-95
 ;;9002226.02101,"974,00015-7405-95 ",.02)
 ;;00015-7405-95
 ;;9002226.02101,"974,00015-7405-99 ",.01)
 ;;00015-7405-99
 ;;9002226.02101,"974,00015-7405-99 ",.02)
 ;;00015-7405-99
 ;;9002226.02101,"974,00015-7856-40 ",.01)
 ;;00015-7856-40
 ;;9002226.02101,"974,00015-7856-40 ",.02)
 ;;00015-7856-40
 ;;9002226.02101,"974,00015-7856-64 ",.01)
 ;;00015-7856-64
 ;;9002226.02101,"974,00015-7856-64 ",.02)
 ;;00015-7856-64
 ;;9002226.02101,"974,00015-7988-67 ",.01)
 ;;00015-7988-67
 ;;9002226.02101,"974,00015-7988-67 ",.02)
 ;;00015-7988-67
 ;;9002226.02101,"974,00015-7992-65 ",.01)
 ;;00015-7992-65
 ;;9002226.02101,"974,00015-7992-65 ",.02)
 ;;00015-7992-65
 ;;9002226.02101,"974,00015-7992-68 ",.01)
 ;;00015-7992-68
 ;;9002226.02101,"974,00015-7992-68 ",.02)
 ;;00015-7992-68
 ;;9002226.02101,"974,00015-7993-68 ",.01)
 ;;00015-7993-68
 ;;9002226.02101,"974,00015-7993-68 ",.02)
 ;;00015-7993-68
 ;;9002226.02101,"974,00025-5501-01 ",.01)
 ;;00025-5501-01
 ;;9002226.02101,"974,00025-5501-01 ",.02)
 ;;00025-5501-01
 ;;9002226.02101,"974,00026-8511-06 ",.01)
 ;;00026-8511-06
 ;;9002226.02101,"974,00026-8511-06 ",.02)
 ;;00026-8511-06
 ;;9002226.02101,"974,00026-8512-48 ",.01)
 ;;00026-8512-48
 ;;9002226.02101,"974,00026-8512-48 ",.02)
 ;;00026-8512-48
 ;;9002226.02101,"974,00026-8512-51 ",.01)
 ;;00026-8512-51
 ;;9002226.02101,"974,00026-8512-51 ",.02)
 ;;00026-8512-51
 ;;9002226.02101,"974,00026-8513-48 ",.01)
 ;;00026-8513-48
 ;;9002226.02101,"974,00026-8513-48 ",.02)
 ;;00026-8513-48
 ;;9002226.02101,"974,00026-8513-51 ",.01)
 ;;00026-8513-51
 ;;9002226.02101,"974,00026-8513-51 ",.02)
 ;;00026-8513-51
 ;;9002226.02101,"974,00026-8514-48 ",.01)
 ;;00026-8514-48
 ;;9002226.02101,"974,00026-8514-48 ",.02)
 ;;00026-8514-48
 ;;9002226.02101,"974,00026-8514-50 ",.01)
 ;;00026-8514-50
 ;;9002226.02101,"974,00026-8514-50 ",.02)
 ;;00026-8514-50
 ;;9002226.02101,"974,00026-8527-36 ",.01)
 ;;00026-8527-36
 ;;9002226.02101,"974,00026-8527-36 ",.02)
 ;;00026-8527-36
 ;;9002226.02101,"974,00026-8527-63 ",.01)
 ;;00026-8527-63
 ;;9002226.02101,"974,00026-8527-63 ",.02)
 ;;00026-8527-63
 ;;9002226.02101,"974,00026-8551-36 ",.01)
 ;;00026-8551-36
 ;;9002226.02101,"974,00026-8551-36 ",.02)
 ;;00026-8551-36
 ;;9002226.02101,"974,00026-8552-36 ",.01)
 ;;00026-8552-36
 ;;9002226.02101,"974,00026-8552-36 ",.02)
 ;;00026-8552-36
 ;;9002226.02101,"974,00026-8553-36 ",.01)
 ;;00026-8553-36
 ;;9002226.02101,"974,00026-8553-36 ",.02)
 ;;00026-8553-36
 ;;9002226.02101,"974,00026-8554-63 ",.01)
 ;;00026-8554-63
 ;;9002226.02101,"974,00026-8554-63 ",.02)
 ;;00026-8554-63
 ;;9002226.02101,"974,00026-8562-20 ",.01)
 ;;00026-8562-20
 ;;9002226.02101,"974,00026-8562-20 ",.02)
 ;;00026-8562-20
 ;;9002226.02101,"974,00026-8564-64 ",.01)
 ;;00026-8564-64
 ;;9002226.02101,"974,00026-8564-64 ",.02)
 ;;00026-8564-64
 ;;9002226.02101,"974,00026-8566-65 ",.01)
 ;;00026-8566-65
 ;;9002226.02101,"974,00026-8566-65 ",.02)
 ;;00026-8566-65
 ;;9002226.02101,"974,00026-8889-50 ",.01)
 ;;00026-8889-50
 ;;9002226.02101,"974,00026-8889-50 ",.02)
 ;;00026-8889-50
 ;;9002226.02101,"974,00026-8889-51 ",.01)
 ;;00026-8889-51
 ;;9002226.02101,"974,00026-8889-51 ",.02)
 ;;00026-8889-51
 ;;9002226.02101,"974,00026-8897-50 ",.01)
 ;;00026-8897-50
 ;;9002226.02101,"974,00026-8897-50 ",.02)
 ;;00026-8897-50
 ;;9002226.02101,"974,00026-8897-51 ",.01)
 ;;00026-8897-51
 ;;9002226.02101,"974,00026-8897-51 ",.02)
 ;;00026-8897-51
 ;;9002226.02101,"974,00026-8897-69 ",.01)
 ;;00026-8897-69
 ;;9002226.02101,"974,00026-8897-69 ",.02)
 ;;00026-8897-69
 ;;9002226.02101,"974,00029-6006-30 ",.01)
 ;;00029-6006-30
 ;;9002226.02101,"974,00029-6006-30 ",.02)
 ;;00029-6006-30
 ;;9002226.02101,"974,00029-6006-32 ",.01)
 ;;00029-6006-32
 ;;9002226.02101,"974,00029-6006-32 ",.02)
 ;;00029-6006-32
 ;;9002226.02101,"974,00029-6007-30 ",.01)
 ;;00029-6007-30
 ;;9002226.02101,"974,00029-6007-30 ",.02)
 ;;00029-6007-30
 ;;9002226.02101,"974,00029-6007-32 ",.01)
 ;;00029-6007-32
 ;;9002226.02101,"974,00029-6007-32 ",.02)
 ;;00029-6007-32
 ;;9002226.02101,"974,00029-6008-21 ",.01)
 ;;00029-6008-21
 ;;9002226.02101,"974,00029-6008-21 ",.02)
 ;;00029-6008-21
 ;;9002226.02101,"974,00029-6008-22 ",.01)
 ;;00029-6008-22
 ;;9002226.02101,"974,00029-6008-22 ",.02)
 ;;00029-6008-22
 ;;9002226.02101,"974,00029-6008-23 ",.01)
 ;;00029-6008-23
 ;;9002226.02101,"974,00029-6008-23 ",.02)
 ;;00029-6008-23
 ;;9002226.02101,"974,00029-6009-18 ",.01)
 ;;00029-6009-18
 ;;9002226.02101,"974,00029-6009-18 ",.02)
 ;;00029-6009-18
 ;;9002226.02101,"974,00029-6009-21 ",.01)
 ;;00029-6009-21
 ;;9002226.02101,"974,00029-6009-21 ",.02)
 ;;00029-6009-21
 ;;9002226.02101,"974,00029-6009-22 ",.01)
 ;;00029-6009-22
 ;;9002226.02101,"974,00029-6009-22 ",.02)
 ;;00029-6009-22
 ;;9002226.02101,"974,00029-6009-23 ",.01)
 ;;00029-6009-23
 ;;9002226.02101,"974,00029-6009-23 ",.02)
 ;;00029-6009-23
 ;;9002226.02101,"974,00029-6035-20 ",.01)
 ;;00029-6035-20
 ;;9002226.02101,"974,00029-6035-20 ",.02)
 ;;00029-6035-20
 ;;9002226.02101,"974,00029-6038-39 ",.01)
 ;;00029-6038-39
 ;;9002226.02101,"974,00029-6038-39 ",.02)
 ;;00029-6038-39
 ;;9002226.02101,"974,00029-6044-12 ",.01)
 ;;00029-6044-12
 ;;9002226.02101,"974,00029-6044-12 ",.02)
 ;;00029-6044-12
 ;;9002226.02101,"974,00029-6044-20 ",.01)
 ;;00029-6044-20
 ;;9002226.02101,"974,00029-6044-20 ",.02)
 ;;00029-6044-20
 ;;9002226.02101,"974,00029-6045-12 ",.01)
 ;;00029-6045-12
 ;;9002226.02101,"974,00029-6045-12 ",.02)
 ;;00029-6045-12
 ;;9002226.02101,"974,00029-6045-20 ",.01)
 ;;00029-6045-20
 ;;9002226.02101,"974,00029-6045-20 ",.02)
 ;;00029-6045-20
 ;;9002226.02101,"974,00029-6046-12 ",.01)
 ;;00029-6046-12
 ;;9002226.02101,"974,00029-6046-12 ",.02)
 ;;00029-6046-12
 ;;9002226.02101,"974,00029-6046-20 ",.01)
 ;;00029-6046-20
 ;;9002226.02101,"974,00029-6046-20 ",.02)
 ;;00029-6046-20
 ;;9002226.02101,"974,00029-6046-25 ",.01)
 ;;00029-6046-25
 ;;9002226.02101,"974,00029-6046-25 ",.02)
 ;;00029-6046-25
 ;;9002226.02101,"974,00029-6047-12 ",.01)
 ;;00029-6047-12
 ;;9002226.02101,"974,00029-6047-12 ",.02)
 ;;00029-6047-12
 ;;9002226.02101,"974,00029-6047-20 ",.01)
 ;;00029-6047-20
 ;;9002226.02101,"974,00029-6047-20 ",.02)
 ;;00029-6047-20
 ;;9002226.02101,"974,00029-6047-25 ",.01)
 ;;00029-6047-25
 ;;9002226.02101,"974,00029-6047-25 ",.02)
 ;;00029-6047-25
 ;;9002226.02101,"974,00029-6048-18 ",.01)
 ;;00029-6048-18
 ;;9002226.02101,"974,00029-6048-18 ",.02)
 ;;00029-6048-18
 ;;9002226.02101,"974,00029-6048-54 ",.01)
 ;;00029-6048-54
 ;;9002226.02101,"974,00029-6048-54 ",.02)
 ;;00029-6048-54
 ;;9002226.02101,"974,00029-6048-55 ",.01)
 ;;00029-6048-55
 ;;9002226.02101,"974,00029-6048-55 ",.02)
 ;;00029-6048-55
 ;;9002226.02101,"974,00029-6048-59 ",.01)
 ;;00029-6048-59
 ;;9002226.02101,"974,00029-6048-59 ",.02)
 ;;00029-6048-59
 ;;9002226.02101,"974,00029-6049-18 ",.01)
 ;;00029-6049-18
 ;;9002226.02101,"974,00029-6049-18 ",.02)
 ;;00029-6049-18
 ;;9002226.02101,"974,00029-6049-54 ",.01)
 ;;00029-6049-54
 ;;9002226.02101,"974,00029-6049-54 ",.02)
 ;;00029-6049-54
 ;;9002226.02101,"974,00029-6049-55 ",.01)
 ;;00029-6049-55
 ;;9002226.02101,"974,00029-6049-55 ",.02)
 ;;00029-6049-55
 ;;9002226.02101,"974,00029-6049-59 ",.01)
 ;;00029-6049-59
 ;;9002226.02101,"974,00029-6049-59 ",.02)
 ;;00029-6049-59
 ;;9002226.02101,"974,00029-6071-12 ",.01)
 ;;00029-6071-12
 ;;9002226.02101,"974,00029-6071-12 ",.02)
 ;;00029-6071-12
 ;;9002226.02101,"974,00029-6072-12 ",.01)
 ;;00029-6072-12
 ;;9002226.02101,"974,00029-6072-12 ",.02)
 ;;00029-6072-12
 ;;9002226.02101,"974,00029-6073-47 ",.01)
 ;;00029-6073-47
 ;;9002226.02101,"974,00029-6073-47 ",.02)
 ;;00029-6073-47
 ;;9002226.02101,"974,00029-6074-47 ",.01)
 ;;00029-6074-47
 ;;9002226.02101,"974,00029-6074-47 ",.02)
 ;;00029-6074-47
 ;;9002226.02101,"974,00029-6075-27 ",.01)
 ;;00029-6075-27
 ;;9002226.02101,"974,00029-6075-27 ",.02)
 ;;00029-6075-27
 ;;9002226.02101,"974,00029-6075-31 ",.01)
 ;;00029-6075-31
 ;;9002226.02101,"974,00029-6075-31 ",.02)
 ;;00029-6075-31
 ;;9002226.02101,"974,00029-6080-12 ",.01)
 ;;00029-6080-12
 ;;9002226.02101,"974,00029-6080-12 ",.02)
 ;;00029-6080-12
 ;;9002226.02101,"974,00029-6080-27 ",.01)
 ;;00029-6080-27
 ;;9002226.02101,"974,00029-6080-27 ",.02)
 ;;00029-6080-27
 ;;9002226.02101,"974,00029-6080-31 ",.01)
 ;;00029-6080-31
 ;;9002226.02101,"974,00029-6080-31 ",.02)
 ;;00029-6080-31
 ;;9002226.02101,"974,00029-6085-22 ",.01)
 ;;00029-6085-22
 ;;9002226.02101,"974,00029-6085-22 ",.02)
 ;;00029-6085-22
 ;;9002226.02101,"974,00029-6085-23 ",.01)
 ;;00029-6085-23
 ;;9002226.02101,"974,00029-6085-23 ",.02)
 ;;00029-6085-23
 ;;9002226.02101,"974,00029-6085-39 ",.01)
 ;;00029-6085-39
 ;;9002226.02101,"974,00029-6085-39 ",.02)
 ;;00029-6085-39
 ;;9002226.02101,"974,00029-6086-12 ",.01)
 ;;00029-6086-12
 ;;9002226.02101,"974,00029-6086-12 ",.02)
 ;;00029-6086-12
 ;;9002226.02101,"974,00029-6086-21 ",.01)
 ;;00029-6086-21
 ;;9002226.02101,"974,00029-6086-21 ",.02)
 ;;00029-6086-21
 ;;9002226.02101,"974,00029-6087-29 ",.01)
 ;;00029-6087-29
 ;;9002226.02101,"974,00029-6087-29 ",.02)
 ;;00029-6087-29
 ;;9002226.02101,"974,00029-6087-39 ",.01)
 ;;00029-6087-39
 ;;9002226.02101,"974,00029-6087-39 ",.02)
 ;;00029-6087-39
 ;;9002226.02101,"974,00029-6087-51 ",.01)
 ;;00029-6087-51
 ;;9002226.02101,"974,00029-6087-51 ",.02)
 ;;00029-6087-51
 ;;9002226.02101,"974,00029-6090-22 ",.01)
 ;;00029-6090-22
 ;;9002226.02101,"974,00029-6090-22 ",.02)
 ;;00029-6090-22
 ;;9002226.02101,"974,00029-6090-23 ",.01)
 ;;00029-6090-23
 ;;9002226.02101,"974,00029-6090-23 ",.02)
 ;;00029-6090-23
 ;;9002226.02101,"974,00029-6090-39 ",.01)
 ;;00029-6090-39
 ;;9002226.02101,"974,00029-6090-39 ",.02)
 ;;00029-6090-39
 ;;9002226.02101,"974,00029-6092-29 ",.01)
 ;;00029-6092-29
 ;;9002226.02101,"974,00029-6092-29 ",.02)
 ;;00029-6092-29
 ;;9002226.02101,"974,00029-6092-39 ",.01)
 ;;00029-6092-39
 ;;9002226.02101,"974,00029-6092-39 ",.02)
 ;;00029-6092-39
 ;;9002226.02101,"974,00029-6092-51 ",.01)
 ;;00029-6092-51
 ;;9002226.02101,"974,00029-6092-51 ",.02)
 ;;00029-6092-51
 ;;9002226.02101,"974,00029-6094-22 ",.01)
 ;;00029-6094-22
 ;;9002226.02101,"974,00029-6094-22 ",.02)
 ;;00029-6094-22
 ;;9002226.02101,"974,00029-6094-24 ",.01)
 ;;00029-6094-24
 ;;9002226.02101,"974,00029-6094-24 ",.02)
 ;;00029-6094-24
 ;;9002226.02101,"974,00029-6094-25 ",.01)
 ;;00029-6094-25
 ;;9002226.02101,"974,00029-6094-25 ",.02)
 ;;00029-6094-25
 ;;9002226.02101,"974,00029-6094-29 ",.01)
 ;;00029-6094-29
 ;;9002226.02101,"974,00029-6094-29 ",.02)
 ;;00029-6094-29
