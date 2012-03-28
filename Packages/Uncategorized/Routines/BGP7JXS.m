BGP7JXS ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON SEP 10, 2006 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;;BGP CHLAMYDIA LOINC CODES
 ;
 ; This routine loads Taxonomy BGP CHLAMYDIA LOINC CODES
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
 ;;21,"14463-4 ")
 ;;1
 ;;21,"14464-2 ")
 ;;2
 ;;21,"14467-5 ")
 ;;3
 ;;21,"14470-9 ")
 ;;4
 ;;21,"14471-7 ")
 ;;5
 ;;21,"14474-1 ")
 ;;6
 ;;21,"14509-4 ")
 ;;7
 ;;21,"14510-2 ")
 ;;8
 ;;21,"14513-6 ")
 ;;9
 ;;21,"16593-6 ")
 ;;10
 ;;21,"16600-9 ")
 ;;11
 ;;21,"16601-7 ")
 ;;12
 ;;21,"16602-5 ")
 ;;13
 ;;21,"21189-6 ")
 ;;14
 ;;21,"21190-4 ")
 ;;15
 ;;21,"21191-2 ")
 ;;16
 ;;21,"21192-0 ")
 ;;17
 ;;21,"23838-6 ")
 ;;18
 ;;21,"31765-1 ")
 ;;19
 ;;21,"31771-9 ")
 ;;20
 ;;21,"31772-7 ")
 ;;21
 ;;21,"31775-0 ")
 ;;22
 ;;21,"32001-0 ")
 ;;23
 ;;21,"32003-6 ")
 ;;24
 ;;21,"32004-4 ")
 ;;25
 ;;21,"32671-0 ")
 ;;26
 ;;21,"32774-2 ")
 ;;27
 ;;21,"34708-8 ")
 ;;28
 ;;21,"35713-7 ")
 ;;29
 ;;21,"35714-5 ")
 ;;30
 ;;21,"35715-2 ")
 ;;31
 ;;21,"35716-0 ")
 ;;32
 ;;21,"35717-8 ")
 ;;33
 ;;21,"35722-8 ")
 ;;34
 ;;21,"35726-9 ")
 ;;35
 ;;21,"35727-7 ")
 ;;36
 ;;21,"35728-5 ")
 ;;37
 ;;21,"42931-6 ")
 ;;38
 ;;21,"44806-8 ")
 ;;39
 ;;21,"44807-6 ")
 ;;40
 ;;21,"45067-6 ")
 ;;41
 ;;21,"45068-4 ")
 ;;42
 ;;21,"45069-2 ")
 ;;43
 ;;21,"45070-0 ")
 ;;44
 ;;21,"45074-2 ")
 ;;45
 ;;21,"45078-3 ")
 ;;46
 ;;21,"45079-1 ")
 ;;47
 ;;21,"45080-9 ")
 ;;48
 ;;21,"45082-5 ")
 ;;49
 ;;21,"45083-3 ")
 ;;50
 ;;21,"45084-1 ")
 ;;51
 ;;21,"45091-6 ")
 ;;52
 ;;21,"45095-7 ")
 ;;53
 ;;21,"45098-1 ")
 ;;54
 ;;21,"45100-5 ")
 ;;55
 ;;21,"45106-2 ")
 ;;56
 ;;21,"45107-0 ")
 ;;57
 ;;21,"45108-8 ")
 ;;58
 ;;21,"45112-0 ")
 ;;59
 ;;21,"557-9 ")
 ;;60
 ;;21,"6343-8 ")
 ;;61
 ;;21,"6345-3 ")
 ;;62
 ;;21,"6346-1 ")
 ;;63
 ;;21,"6356-0 ")
 ;;64
 ;;21,"6357-8 ")
 ;;65
 ;;9002226,323,.01)
 ;;BGP CHLAMYDIA LOINC CODES
 ;;9002226,323,.02)
 ;;@
 ;;9002226,323,.04)
 ;;n
 ;;9002226,323,.06)
 ;;@
 ;;9002226,323,.08)
 ;;@
 ;;9002226,323,.09)
 ;;@
 ;;9002226,323,.11)
 ;;@
 ;;9002226,323,.12)
 ;;@
 ;;9002226,323,.13)
 ;;1
 ;;9002226,323,.14)
 ;;FIHS
 ;;9002226,323,.15)
 ;;95.3
 ;;9002226,323,.16)
 ;;@
 ;;9002226,323,.17)
 ;;@
 ;;9002226,323,3101)
 ;;@
 ;;9002226.02101,"323,14463-4 ",.01)
 ;;14463-4
 ;;9002226.02101,"323,14463-4 ",.02)
 ;;14463-4
 ;;9002226.02101,"323,14464-2 ",.01)
 ;;14464-2
 ;;9002226.02101,"323,14464-2 ",.02)
 ;;14464-2
 ;;9002226.02101,"323,14467-5 ",.01)
 ;;14467-5
 ;;9002226.02101,"323,14467-5 ",.02)
 ;;14467-5
 ;;9002226.02101,"323,14470-9 ",.01)
 ;;14470-9
 ;;9002226.02101,"323,14470-9 ",.02)
 ;;14470-9
 ;;9002226.02101,"323,14471-7 ",.01)
 ;;14471-7
 ;;9002226.02101,"323,14471-7 ",.02)
 ;;14471-7
 ;;9002226.02101,"323,14474-1 ",.01)
 ;;14474-1
 ;;9002226.02101,"323,14474-1 ",.02)
 ;;14474-1
 ;;9002226.02101,"323,14509-4 ",.01)
 ;;14509-4
 ;;9002226.02101,"323,14509-4 ",.02)
 ;;14509-4
 ;;9002226.02101,"323,14510-2 ",.01)
 ;;14510-2
 ;;9002226.02101,"323,14510-2 ",.02)
 ;;14510-2
 ;;9002226.02101,"323,14513-6 ",.01)
 ;;14513-6
 ;;9002226.02101,"323,14513-6 ",.02)
 ;;14513-6
 ;;9002226.02101,"323,16593-6 ",.01)
 ;;16593-6
 ;;9002226.02101,"323,16593-6 ",.02)
 ;;16593-6
 ;;9002226.02101,"323,16600-9 ",.01)
 ;;16600-9
 ;;9002226.02101,"323,16600-9 ",.02)
 ;;16600-9
 ;;9002226.02101,"323,16601-7 ",.01)
 ;;16601-7
 ;;9002226.02101,"323,16601-7 ",.02)
 ;;16601-7
 ;;9002226.02101,"323,16602-5 ",.01)
 ;;16602-5
 ;;9002226.02101,"323,16602-5 ",.02)
 ;;16602-5
 ;;9002226.02101,"323,21189-6 ",.01)
 ;;21189-6
 ;;9002226.02101,"323,21189-6 ",.02)
 ;;21189-6
 ;;9002226.02101,"323,21190-4 ",.01)
 ;;21190-4
 ;;9002226.02101,"323,21190-4 ",.02)
 ;;21190-4
 ;;9002226.02101,"323,21191-2 ",.01)
 ;;21191-2
 ;;9002226.02101,"323,21191-2 ",.02)
 ;;21191-2
 ;;9002226.02101,"323,21192-0 ",.01)
 ;;21192-0
 ;;9002226.02101,"323,21192-0 ",.02)
 ;;21192-0
 ;;9002226.02101,"323,23838-6 ",.01)
 ;;23838-6
 ;;9002226.02101,"323,23838-6 ",.02)
 ;;23838-6
 ;;9002226.02101,"323,31765-1 ",.01)
 ;;31765-1
 ;;9002226.02101,"323,31765-1 ",.02)
 ;;31765-1
 ;;9002226.02101,"323,31771-9 ",.01)
 ;;31771-9
 ;;9002226.02101,"323,31771-9 ",.02)
 ;;31771-9
 ;;9002226.02101,"323,31772-7 ",.01)
 ;;31772-7
 ;;9002226.02101,"323,31772-7 ",.02)
 ;;31772-7
 ;;9002226.02101,"323,31775-0 ",.01)
 ;;31775-0
 ;;9002226.02101,"323,31775-0 ",.02)
 ;;31775-0
 ;;9002226.02101,"323,32001-0 ",.01)
 ;;32001-0
 ;;9002226.02101,"323,32001-0 ",.02)
 ;;32001-0
 ;;9002226.02101,"323,32003-6 ",.01)
 ;;32003-6
 ;;9002226.02101,"323,32003-6 ",.02)
 ;;32003-6
 ;;9002226.02101,"323,32004-4 ",.01)
 ;;32004-4
 ;;9002226.02101,"323,32004-4 ",.02)
 ;;32004-4
 ;;9002226.02101,"323,32671-0 ",.01)
 ;;32671-0
 ;;9002226.02101,"323,32671-0 ",.02)
 ;;32671-0
 ;;9002226.02101,"323,32774-2 ",.01)
 ;;32774-2
 ;;9002226.02101,"323,32774-2 ",.02)
 ;;32774-2
 ;;9002226.02101,"323,34708-8 ",.01)
 ;;34708-8
 ;;9002226.02101,"323,34708-8 ",.02)
 ;;34708-8
 ;;9002226.02101,"323,35713-7 ",.01)
 ;;35713-7
 ;;9002226.02101,"323,35713-7 ",.02)
 ;;35713-7
 ;;9002226.02101,"323,35714-5 ",.01)
 ;;35714-5
 ;;9002226.02101,"323,35714-5 ",.02)
 ;;35714-5
 ;;9002226.02101,"323,35715-2 ",.01)
 ;;35715-2
 ;;9002226.02101,"323,35715-2 ",.02)
 ;;35715-2
 ;;9002226.02101,"323,35716-0 ",.01)
 ;;35716-0
 ;;9002226.02101,"323,35716-0 ",.02)
 ;;35716-0
 ;;9002226.02101,"323,35717-8 ",.01)
 ;;35717-8
 ;;9002226.02101,"323,35717-8 ",.02)
 ;;35717-8
 ;;9002226.02101,"323,35722-8 ",.01)
 ;;35722-8
 ;;9002226.02101,"323,35722-8 ",.02)
 ;;35722-8
 ;;9002226.02101,"323,35726-9 ",.01)
 ;;35726-9
 ;;9002226.02101,"323,35726-9 ",.02)
 ;;35726-9
 ;;9002226.02101,"323,35727-7 ",.01)
 ;;35727-7
 ;;9002226.02101,"323,35727-7 ",.02)
 ;;35727-7
 ;;9002226.02101,"323,35728-5 ",.01)
 ;;35728-5
 ;;9002226.02101,"323,35728-5 ",.02)
 ;;35728-5
 ;;9002226.02101,"323,42931-6 ",.01)
 ;;42931-6
 ;;9002226.02101,"323,42931-6 ",.02)
 ;;42931-6
 ;;9002226.02101,"323,44806-8 ",.01)
 ;;44806-8
 ;;9002226.02101,"323,44806-8 ",.02)
 ;;44806-8
 ;;9002226.02101,"323,44807-6 ",.01)
 ;;44807-6
 ;;9002226.02101,"323,44807-6 ",.02)
 ;;44807-6
 ;;9002226.02101,"323,45067-6 ",.01)
 ;;45067-6
 ;;9002226.02101,"323,45067-6 ",.02)
 ;;45067-6
 ;;9002226.02101,"323,45068-4 ",.01)
 ;;45068-4
 ;;9002226.02101,"323,45068-4 ",.02)
 ;;45068-4
 ;;9002226.02101,"323,45069-2 ",.01)
 ;;45069-2
 ;;9002226.02101,"323,45069-2 ",.02)
 ;;45069-2
 ;;9002226.02101,"323,45070-0 ",.01)
 ;;45070-0
 ;;9002226.02101,"323,45070-0 ",.02)
 ;;45070-0
 ;;9002226.02101,"323,45074-2 ",.01)
 ;;45074-2
 ;;9002226.02101,"323,45074-2 ",.02)
 ;;45074-2
 ;;9002226.02101,"323,45078-3 ",.01)
 ;;45078-3
 ;;9002226.02101,"323,45078-3 ",.02)
 ;;45078-3
 ;;9002226.02101,"323,45079-1 ",.01)
 ;;45079-1
 ;;9002226.02101,"323,45079-1 ",.02)
 ;;45079-1
 ;;9002226.02101,"323,45080-9 ",.01)
 ;;45080-9
 ;;9002226.02101,"323,45080-9 ",.02)
 ;;45080-9
 ;;9002226.02101,"323,45082-5 ",.01)
 ;;45082-5
 ;;9002226.02101,"323,45082-5 ",.02)
 ;;45082-5
 ;;9002226.02101,"323,45083-3 ",.01)
 ;;45083-3
 ;;9002226.02101,"323,45083-3 ",.02)
 ;;45083-3
 ;;9002226.02101,"323,45084-1 ",.01)
 ;;45084-1
 ;;9002226.02101,"323,45084-1 ",.02)
 ;;45084-1
 ;;9002226.02101,"323,45091-6 ",.01)
 ;;45091-6
 ;;9002226.02101,"323,45091-6 ",.02)
 ;;45091-6
 ;;9002226.02101,"323,45095-7 ",.01)
 ;;45095-7
 ;;9002226.02101,"323,45095-7 ",.02)
 ;;45095-7
 ;;9002226.02101,"323,45098-1 ",.01)
 ;;45098-1
 ;;9002226.02101,"323,45098-1 ",.02)
 ;;45098-1
 ;;9002226.02101,"323,45100-5 ",.01)
 ;;45100-5
 ;;9002226.02101,"323,45100-5 ",.02)
 ;;45100-5
 ;;9002226.02101,"323,45106-2 ",.01)
 ;;45106-2
 ;;9002226.02101,"323,45106-2 ",.02)
 ;;45106-2
 ;;9002226.02101,"323,45107-0 ",.01)
 ;;45107-0
 ;;9002226.02101,"323,45107-0 ",.02)
 ;;45107-0
 ;;9002226.02101,"323,45108-8 ",.01)
 ;;45108-8
 ;;9002226.02101,"323,45108-8 ",.02)
 ;;45108-8
 ;;9002226.02101,"323,45112-0 ",.01)
 ;;45112-0
 ;;9002226.02101,"323,45112-0 ",.02)
 ;;45112-0
 ;;9002226.02101,"323,557-9 ",.01)
 ;;557-9
 ;;9002226.02101,"323,557-9 ",.02)
 ;;557-9
 ;;9002226.02101,"323,6343-8 ",.01)
 ;;6343-8
 ;;9002226.02101,"323,6343-8 ",.02)
 ;;6343-8
 ;;9002226.02101,"323,6345-3 ",.01)
 ;;6345-3
 ;;9002226.02101,"323,6345-3 ",.02)
 ;;6345-3
 ;;9002226.02101,"323,6346-1 ",.01)
 ;;6346-1
 ;;9002226.02101,"323,6346-1 ",.02)
 ;;6346-1
 ;;9002226.02101,"323,6356-0 ",.01)
 ;;6356-0
 ;;9002226.02101,"323,6356-0 ",.02)
 ;;6356-0
 ;;9002226.02101,"323,6357-8 ",.01)
 ;;6357-8
 ;;9002226.02101,"323,6357-8 ",.02)
 ;;6357-8
 ;
OTHER ; OTHER ROUTINES
 Q
