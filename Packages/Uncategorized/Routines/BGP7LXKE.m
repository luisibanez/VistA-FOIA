BGP7LXKE ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON AUG 29, 2006 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"628,00517-0401-25 ",.01)
 ;;00517-0401-25
 ;;9002226.02101,"628,00517-0401-25 ",.02)
 ;;00517-0401-25
 ;;9002226.02101,"628,00517-0805-25 ",.01)
 ;;00517-0805-25
 ;;9002226.02101,"628,00517-0805-25 ",.02)
 ;;00517-0805-25
 ;;9002226.02101,"628,00517-1010-25 ",.01)
 ;;00517-1010-25
 ;;9002226.02101,"628,00517-1010-25 ",.02)
 ;;00517-1010-25
 ;;9002226.02101,"628,00527-1170-01 ",.01)
 ;;00527-1170-01
 ;;9002226.02101,"628,00527-1170-01 ",.02)
 ;;00527-1170-01
 ;;9002226.02101,"628,00527-1170-10 ",.01)
 ;;00527-1170-10
 ;;9002226.02101,"628,00527-1170-10 ",.02)
 ;;00527-1170-10
 ;;9002226.02101,"628,00536-5575-01 ",.01)
 ;;00536-5575-01
 ;;9002226.02101,"628,00536-5575-01 ",.02)
 ;;00536-5575-01
 ;;9002226.02101,"628,00536-5592-01 ",.01)
 ;;00536-5592-01
 ;;9002226.02101,"628,00536-5592-01 ",.02)
 ;;00536-5592-01
 ;;9002226.02101,"628,00536-5900-01 ",.01)
 ;;00536-5900-01
 ;;9002226.02101,"628,00536-5900-01 ",.02)
 ;;00536-5900-01
 ;;9002226.02101,"628,00539-0708-01 ",.01)
 ;;00539-0708-01
 ;;9002226.02101,"628,00539-0708-01 ",.02)
 ;;00539-0708-01
 ;;9002226.02101,"628,00548-1038-00 ",.01)
 ;;00548-1038-00
 ;;9002226.02101,"628,00548-1038-00 ",.02)
 ;;00548-1038-00
 ;;9002226.02101,"628,00548-1039-00 ",.01)
 ;;00548-1039-00
 ;;9002226.02101,"628,00548-1039-00 ",.02)
 ;;00548-1039-00
 ;;9002226.02101,"628,00548-2039-00 ",.01)
 ;;00548-2039-00
 ;;9002226.02101,"628,00548-2039-00 ",.02)
 ;;00548-2039-00
 ;;9002226.02101,"628,00548-3338-00 ",.01)
 ;;00548-3338-00
 ;;9002226.02101,"628,00548-3338-00 ",.02)
 ;;00548-3338-00
 ;;9002226.02101,"628,00548-3339-00 ",.01)
 ;;00548-3339-00
 ;;9002226.02101,"628,00548-3339-00 ",.02)
 ;;00548-3339-00
 ;;9002226.02101,"628,00551-0195-01 ",.01)
 ;;00551-0195-01
 ;;9002226.02101,"628,00551-0195-01 ",.02)
 ;;00551-0195-01
 ;;9002226.02101,"628,00556-0053-04 ",.01)
 ;;00556-0053-04
 ;;9002226.02101,"628,00556-0053-04 ",.02)
 ;;00556-0053-04
 ;;9002226.02101,"628,00556-0053-16 ",.01)
 ;;00556-0053-16
 ;;9002226.02101,"628,00556-0053-16 ",.02)
 ;;00556-0053-16
 ;;9002226.02101,"628,00556-0053-28 ",.01)
 ;;00556-0053-28
 ;;9002226.02101,"628,00556-0053-28 ",.02)
 ;;00556-0053-28
 ;;9002226.02101,"628,00556-0058-01 ",.01)
 ;;00556-0058-01
 ;;9002226.02101,"628,00556-0058-01 ",.02)
 ;;00556-0058-01
 ;;9002226.02101,"628,00556-0058-10 ",.01)
 ;;00556-0058-10
 ;;9002226.02101,"628,00556-0058-10 ",.02)
 ;;00556-0058-10
 ;;9002226.02101,"628,00556-0059-01 ",.01)
 ;;00556-0059-01
 ;;9002226.02101,"628,00556-0059-01 ",.02)
 ;;00556-0059-01
 ;;9002226.02101,"628,00556-0059-10 ",.01)
 ;;00556-0059-10
 ;;9002226.02101,"628,00556-0059-10 ",.02)
 ;;00556-0059-10
 ;;9002226.02101,"628,00574-7040-12 ",.01)
 ;;00574-7040-12
 ;;9002226.02101,"628,00574-7040-12 ",.02)
 ;;00574-7040-12
 ;;9002226.02101,"628,00574-7040-20 ",.01)
 ;;00574-7040-20
 ;;9002226.02101,"628,00574-7040-20 ",.02)
 ;;00574-7040-20
 ;;9002226.02101,"628,00574-7045-12 ",.01)
 ;;00574-7045-12
 ;;9002226.02101,"628,00574-7045-12 ",.02)
 ;;00574-7045-12
 ;;9002226.02101,"628,00591-5002-01 ",.01)
 ;;00591-5002-01
 ;;9002226.02101,"628,00591-5002-01 ",.02)
 ;;00591-5002-01
 ;;9002226.02101,"628,00591-5003-01 ",.01)
 ;;00591-5003-01
 ;;9002226.02101,"628,00591-5003-01 ",.02)
 ;;00591-5003-01
 ;;9002226.02101,"628,00591-5003-04 ",.01)
 ;;00591-5003-04
 ;;9002226.02101,"628,00591-5003-04 ",.02)
 ;;00591-5003-04
 ;;9002226.02101,"628,00603-1030-58 ",.01)
 ;;00603-1030-58
 ;;9002226.02101,"628,00603-1030-58 ",.02)
 ;;00603-1030-58
 ;;9002226.02101,"628,00603-1314-73 ",.01)
 ;;00603-1314-73
 ;;9002226.02101,"628,00603-1314-73 ",.02)
 ;;00603-1314-73
 ;;9002226.02101,"628,00603-1315-58 ",.01)
 ;;00603-1315-58
 ;;9002226.02101,"628,00603-1315-58 ",.02)
 ;;00603-1315-58
 ;;9002226.02101,"628,00603-2418-21 ",.01)
 ;;00603-2418-21
 ;;9002226.02101,"628,00603-2418-21 ",.02)
 ;;00603-2418-21
 ;;9002226.02101,"628,00603-2418-32 ",.01)
 ;;00603-2418-32
 ;;9002226.02101,"628,00603-2418-32 ",.02)
 ;;00603-2418-32
 ;;9002226.02101,"628,00603-2423-21 ",.01)
 ;;00603-2423-21
 ;;9002226.02101,"628,00603-2423-21 ",.02)
 ;;00603-2423-21
 ;;9002226.02101,"628,00603-2423-28 ",.01)
 ;;00603-2423-28
 ;;9002226.02101,"628,00603-2423-28 ",.02)
 ;;00603-2423-28
 ;;9002226.02101,"628,00603-2424-21 ",.01)
 ;;00603-2424-21
 ;;9002226.02101,"628,00603-2424-21 ",.02)
 ;;00603-2424-21
 ;;9002226.02101,"628,00603-3360-21 ",.01)
 ;;00603-3360-21
 ;;9002226.02101,"628,00603-3360-21 ",.02)
 ;;00603-3360-21
 ;;9002226.02101,"628,00603-3360-32 ",.01)
 ;;00603-3360-32
 ;;9002226.02101,"628,00603-3360-32 ",.02)
 ;;00603-3360-32
 ;;9002226.02101,"628,00603-4002-21 ",.01)
 ;;00603-4002-21
 ;;9002226.02101,"628,00603-4002-21 ",.02)
 ;;00603-4002-21
 ;;9002226.02101,"628,00603-4003-21 ",.01)
 ;;00603-4003-21
 ;;9002226.02101,"628,00603-4003-21 ",.02)
 ;;00603-4003-21
 ;;9002226.02101,"628,00603-4004-21 ",.01)
 ;;00603-4004-21
 ;;9002226.02101,"628,00603-4004-21 ",.02)
 ;;00603-4004-21
 ;;9002226.02101,"628,00603-4005-21 ",.01)
 ;;00603-4005-21
 ;;9002226.02101,"628,00603-4005-21 ",.02)
 ;;00603-4005-21
 ;;9002226.02101,"628,00603-5549-21 ",.01)
 ;;00603-5549-21
 ;;9002226.02101,"628,00603-5549-21 ",.02)
 ;;00603-5549-21
 ;;9002226.02101,"628,00603-5549-28 ",.01)
 ;;00603-5549-28
 ;;9002226.02101,"628,00603-5549-28 ",.02)
 ;;00603-5549-28
 ;;9002226.02101,"628,00603-6311-21 ",.01)
 ;;00603-6311-21
 ;;9002226.02101,"628,00603-6311-21 ",.02)
 ;;00603-6311-21
 ;;9002226.02101,"628,00603-6311-32 ",.01)
 ;;00603-6311-32
 ;;9002226.02101,"628,00603-6311-32 ",.02)
 ;;00603-6311-32
 ;;9002226.02101,"628,00615-0368-29 ",.01)
 ;;00615-0368-29
 ;;9002226.02101,"628,00615-0368-29 ",.02)
 ;;00615-0368-29
 ;;9002226.02101,"628,00615-0368-43 ",.01)
 ;;00615-0368-43
 ;;9002226.02101,"628,00615-0368-43 ",.02)
 ;;00615-0368-43
 ;;9002226.02101,"628,00615-0368-53 ",.01)
 ;;00615-0368-53
 ;;9002226.02101,"628,00615-0368-53 ",.02)
 ;;00615-0368-53
 ;;9002226.02101,"628,00615-0368-63 ",.01)
 ;;00615-0368-63
 ;;9002226.02101,"628,00615-0368-63 ",.02)
 ;;00615-0368-63
 ;;9002226.02101,"628,00615-0369-29 ",.01)
 ;;00615-0369-29
 ;;9002226.02101,"628,00615-0369-29 ",.02)
 ;;00615-0369-29
 ;;9002226.02101,"628,00615-0369-43 ",.01)
 ;;00615-0369-43
 ;;9002226.02101,"628,00615-0369-43 ",.02)
 ;;00615-0369-43
 ;;9002226.02101,"628,00615-0429-01 ",.01)
 ;;00615-0429-01
 ;;9002226.02101,"628,00615-0429-01 ",.02)
 ;;00615-0429-01
 ;;9002226.02101,"628,00615-0429-10 ",.01)
 ;;00615-0429-10
 ;;9002226.02101,"628,00615-0429-10 ",.02)
 ;;00615-0429-10
 ;;9002226.02101,"628,00615-3502-29 ",.01)
 ;;00615-3502-29
 ;;9002226.02101,"628,00615-3502-29 ",.02)
 ;;00615-3502-29
 ;;9002226.02101,"628,00615-3502-43 ",.01)
 ;;00615-3502-43
 ;;9002226.02101,"628,00615-3502-43 ",.02)
 ;;00615-3502-43
 ;;9002226.02101,"628,00615-3502-53 ",.01)
 ;;00615-3502-53
 ;;9002226.02101,"628,00615-3502-53 ",.02)
 ;;00615-3502-53
 ;;9002226.02101,"628,00615-3502-63 ",.01)
 ;;00615-3502-63
 ;;9002226.02101,"628,00615-3502-63 ",.02)
 ;;00615-3502-63
 ;;9002226.02101,"628,00641-1380-35 ",.01)
 ;;00641-1380-35
 ;;9002226.02101,"628,00641-1380-35 ",.02)
 ;;00641-1380-35
 ;;9002226.02101,"628,00672-0185-01 ",.01)
 ;;00672-0185-01
 ;;9002226.02101,"628,00672-0185-01 ",.02)
 ;;00672-0185-01
 ;;9002226.02101,"628,00672-0333-26 ",.01)
 ;;00672-0333-26
 ;;9002226.02101,"628,00672-0333-26 ",.02)
 ;;00672-0333-26
 ;;9002226.02101,"628,00672-0462-62 ",.01)
 ;;00672-0462-62
 ;;9002226.02101,"628,00672-0462-62 ",.02)
 ;;00672-0462-62
 ;;9002226.02101,"628,00672-0462-67 ",.01)
 ;;00672-0462-67
 ;;9002226.02101,"628,00672-0462-67 ",.02)
 ;;00672-0462-67
 ;;9002226.02101,"628,00672-0479-62 ",.01)
 ;;00672-0479-62
 ;;9002226.02101,"628,00672-0479-62 ",.02)
 ;;00672-0479-62
 ;;9002226.02101,"628,00675-0501-07 ",.01)
 ;;00675-0501-07
 ;;9002226.02101,"628,00675-0501-07 ",.02)
 ;;00675-0501-07
 ;;9002226.02101,"628,00675-0501-12 ",.01)
 ;;00675-0501-12
 ;;9002226.02101,"628,00675-0501-12 ",.02)
 ;;00675-0501-12
 ;;9002226.02101,"628,00675-0502-07 ",.01)
 ;;00675-0502-07
 ;;9002226.02101,"628,00675-0502-07 ",.02)
 ;;00675-0502-07
 ;;9002226.02101,"628,00675-0502-12 ",.01)
 ;;00675-0502-12
 ;;9002226.02101,"628,00675-0502-12 ",.02)
 ;;00675-0502-12
 ;;9002226.02101,"628,00677-1171-01 ",.01)
 ;;00677-1171-01
 ;;9002226.02101,"628,00677-1171-01 ",.02)
 ;;00677-1171-01
 ;;9002226.02101,"628,00677-1393-01 ",.01)
 ;;00677-1393-01
 ;;9002226.02101,"628,00677-1393-01 ",.02)
 ;;00677-1393-01
 ;;9002226.02101,"628,00677-1566-33 ",.01)
 ;;00677-1566-33
 ;;9002226.02101,"628,00677-1566-33 ",.02)
 ;;00677-1566-33
 ;;9002226.02101,"628,00677-1660-01 ",.01)
 ;;00677-1660-01
 ;;9002226.02101,"628,00677-1660-01 ",.02)
 ;;00677-1660-01
 ;;9002226.02101,"628,00677-1662-01 ",.01)
 ;;00677-1662-01
 ;;9002226.02101,"628,00677-1662-01 ",.02)
 ;;00677-1662-01
 ;;9002226.02101,"628,00677-1665-01 ",.01)
 ;;00677-1665-01
 ;;9002226.02101,"628,00677-1665-01 ",.02)
 ;;00677-1665-01
 ;;9002226.02101,"628,00677-1685-10 ",.01)
 ;;00677-1685-10
 ;;9002226.02101,"628,00677-1685-10 ",.02)
 ;;00677-1685-10
 ;;9002226.02101,"628,00677-1717-01 ",.01)
 ;;00677-1717-01
 ;;9002226.02101,"628,00677-1717-01 ",.02)
 ;;00677-1717-01
 ;;9002226.02101,"628,00677-1740-01 ",.01)
 ;;00677-1740-01
 ;;9002226.02101,"628,00677-1740-01 ",.02)
 ;;00677-1740-01
 ;;9002226.02101,"628,00677-1753-01 ",.01)
 ;;00677-1753-01
 ;;9002226.02101,"628,00677-1753-01 ",.02)
 ;;00677-1753-01
 ;;9002226.02101,"628,00677-1754-01 ",.01)
 ;;00677-1754-01
 ;;9002226.02101,"628,00677-1754-01 ",.02)
 ;;00677-1754-01
 ;;9002226.02101,"628,00677-1775-01 ",.01)
 ;;00677-1775-01
 ;;9002226.02101,"628,00677-1775-01 ",.02)
 ;;00677-1775-01
 ;;9002226.02101,"628,00682-0106-01 ",.01)
 ;;00682-0106-01
 ;;9002226.02101,"628,00682-0106-01 ",.02)
 ;;00682-0106-01
 ;;9002226.02101,"628,00686-0805-25 ",.01)
 ;;00686-0805-25
 ;;9002226.02101,"628,00686-0805-25 ",.02)
 ;;00686-0805-25
 ;;9002226.02101,"628,00686-1010-25 ",.01)
 ;;00686-1010-25
 ;;9002226.02101,"628,00686-1010-25 ",.02)
 ;;00686-1010-25
 ;;9002226.02101,"628,00686-3137-25 ",.01)
 ;;00686-3137-25
 ;;9002226.02101,"628,00686-3137-25 ",.02)
 ;;00686-3137-25
 ;;9002226.02101,"628,00722-5105-01 ",.01)
 ;;00722-5105-01
 ;;9002226.02101,"628,00722-5105-01 ",.02)
 ;;00722-5105-01
 ;;9002226.02101,"628,00722-5105-02 ",.01)
 ;;00722-5105-02
 ;;9002226.02101,"628,00722-5105-02 ",.02)
 ;;00722-5105-02
 ;;9002226.02101,"628,00722-5410-01 ",.01)
 ;;00722-5410-01
 ;;9002226.02101,"628,00722-5410-01 ",.02)
 ;;00722-5410-01
 ;;9002226.02101,"628,00722-5410-02 ",.01)
 ;;00722-5410-02
 ;;9002226.02101,"628,00722-5410-02 ",.02)
 ;;00722-5410-02
 ;;9002226.02101,"628,00761-0316-20 ",.01)
 ;;00761-0316-20
 ;;9002226.02101,"628,00761-0316-20 ",.02)
 ;;00761-0316-20
 ;;9002226.02101,"628,00781-1262-01 ",.01)
 ;;00781-1262-01
 ;;9002226.02101,"628,00781-1262-01 ",.02)
 ;;00781-1262-01
 ;;9002226.02101,"628,00781-1262-05 ",.01)
 ;;00781-1262-05
 ;;9002226.02101,"628,00781-1262-05 ",.02)
 ;;00781-1262-05
 ;;9002226.02101,"628,00781-1262-10 ",.01)
 ;;00781-1262-10
 ;;9002226.02101,"628,00781-1262-10 ",.02)
 ;;00781-1262-10
 ;;9002226.02101,"628,00781-1262-13 ",.01)
 ;;00781-1262-13
 ;;9002226.02101,"628,00781-1262-13 ",.02)
 ;;00781-1262-13
 ;;9002226.02101,"628,00781-1341-01 ",.01)
 ;;00781-1341-01
 ;;9002226.02101,"628,00781-1341-01 ",.02)
 ;;00781-1341-01
 ;;9002226.02101,"628,00781-1341-10 ",.01)
 ;;00781-1341-10
 ;;9002226.02101,"628,00781-1341-10 ",.02)
 ;;00781-1341-10
 ;;9002226.02101,"628,00781-1701-01 ",.01)
 ;;00781-1701-01
 ;;9002226.02101,"628,00781-1701-01 ",.02)
 ;;00781-1701-01
 ;;9002226.02101,"628,00781-1710-01 ",.01)
 ;;00781-1710-01
 ;;9002226.02101,"628,00781-1710-01 ",.02)
 ;;00781-1710-01
 ;;9002226.02101,"628,00781-1711-01 ",.01)
 ;;00781-1711-01
 ;;9002226.02101,"628,00781-1711-01 ",.02)
 ;;00781-1711-01
 ;;9002226.02101,"628,00781-6397-16 ",.01)
 ;;00781-6397-16
 ;;9002226.02101,"628,00781-6397-16 ",.02)
 ;;00781-6397-16
 ;;9002226.02101,"628,00832-8539-16 ",.01)
 ;;00832-8539-16
 ;;9002226.02101,"628,00832-8539-16 ",.02)
 ;;00832-8539-16
 ;;9002226.02101,"628,00832-8539-28 ",.01)
 ;;00832-8539-28
 ;;9002226.02101,"628,00832-8539-28 ",.02)
 ;;00832-8539-28
 ;;9002226.02101,"628,00832-8634-16 ",.01)
 ;;00832-8634-16
 ;;9002226.02101,"628,00832-8634-16 ",.02)
 ;;00832-8634-16
 ;;9002226.02101,"628,00832-8634-28 ",.01)
 ;;00832-8634-28
 ;;9002226.02101,"628,00832-8634-28 ",.02)
 ;;00832-8634-28
 ;;9002226.02101,"628,00839-5018-69 ",.01)
 ;;00839-5018-69
 ;;9002226.02101,"628,00839-5018-69 ",.02)
 ;;00839-5018-69
 ;;9002226.02101,"628,00839-5055-06 ",.01)
 ;;00839-5055-06
 ;;9002226.02101,"628,00839-5055-06 ",.02)
 ;;00839-5055-06
 ;;9002226.02101,"628,00839-5055-16 ",.01)
 ;;00839-5055-16
 ;;9002226.02101,"628,00839-5055-16 ",.02)
 ;;00839-5055-16
 ;;9002226.02101,"628,00839-5055-20 ",.01)
 ;;00839-5055-20
 ;;9002226.02101,"628,00839-5055-20 ",.02)
 ;;00839-5055-20
 ;;9002226.02101,"628,00839-6120-06 ",.01)
 ;;00839-6120-06
 ;;9002226.02101,"628,00839-6120-06 ",.02)
 ;;00839-6120-06
 ;;9002226.02101,"628,00839-6120-16 ",.01)
 ;;00839-6120-16
 ;;9002226.02101,"628,00839-6120-16 ",.02)
 ;;00839-6120-16
 ;;9002226.02101,"628,00839-7370-06 ",.01)
 ;;00839-7370-06
 ;;9002226.02101,"628,00839-7370-06 ",.02)
 ;;00839-7370-06
 ;;9002226.02101,"628,00839-7440-06 ",.01)
 ;;00839-7440-06
 ;;9002226.02101,"628,00839-7440-06 ",.02)
 ;;00839-7440-06
