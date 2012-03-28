BGP7LXLH ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON AUG 29, 2006 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"629,00247-0391-20 ",.01)
 ;;00247-0391-20
 ;;9002226.02101,"629,00247-0391-20 ",.02)
 ;;00247-0391-20
 ;;9002226.02101,"629,00247-0391-30 ",.01)
 ;;00247-0391-30
 ;;9002226.02101,"629,00247-0391-30 ",.02)
 ;;00247-0391-30
 ;;9002226.02101,"629,00247-0391-40 ",.01)
 ;;00247-0391-40
 ;;9002226.02101,"629,00247-0391-40 ",.02)
 ;;00247-0391-40
 ;;9002226.02101,"629,00252-7004-02 ",.01)
 ;;00252-7004-02
 ;;9002226.02101,"629,00252-7004-02 ",.02)
 ;;00252-7004-02
 ;;9002226.02101,"629,00252-7006-02 ",.01)
 ;;00252-7006-02
 ;;9002226.02101,"629,00252-7006-02 ",.02)
 ;;00252-7006-02
 ;;9002226.02101,"629,00252-7014-02 ",.01)
 ;;00252-7014-02
 ;;9002226.02101,"629,00252-7014-02 ",.02)
 ;;00252-7014-02
 ;;9002226.02101,"629,00254-2410-38 ",.01)
 ;;00254-2410-38
 ;;9002226.02101,"629,00254-2410-38 ",.02)
 ;;00254-2410-38
 ;;9002226.02101,"629,00256-0134-01 ",.01)
 ;;00256-0134-01
 ;;9002226.02101,"629,00256-0134-01 ",.02)
 ;;00256-0134-01
 ;;9002226.02101,"629,00256-0134-02 ",.01)
 ;;00256-0134-02
 ;;9002226.02101,"629,00256-0134-02 ",.02)
 ;;00256-0134-02
 ;;9002226.02101,"629,00256-0135-01 ",.01)
 ;;00256-0135-01
 ;;9002226.02101,"629,00256-0135-01 ",.02)
 ;;00256-0135-01
 ;;9002226.02101,"629,00256-0135-02 ",.01)
 ;;00256-0135-02
 ;;9002226.02101,"629,00256-0135-02 ",.02)
 ;;00256-0135-02
 ;;9002226.02101,"629,00256-0136-01 ",.01)
 ;;00256-0136-01
 ;;9002226.02101,"629,00256-0136-01 ",.02)
 ;;00256-0136-01
 ;;9002226.02101,"629,00256-0136-02 ",.01)
 ;;00256-0136-02
 ;;9002226.02101,"629,00256-0136-02 ",.02)
 ;;00256-0136-02
 ;;9002226.02101,"629,00259-0322-10 ",.01)
 ;;00259-0322-10
 ;;9002226.02101,"629,00259-0322-10 ",.02)
 ;;00259-0322-10
 ;;9002226.02101,"629,00298-1043-11 ",.01)
 ;;00298-1043-11
 ;;9002226.02101,"629,00298-1043-11 ",.02)
 ;;00298-1043-11
 ;;9002226.02101,"629,00298-1044-11 ",.01)
 ;;00298-1044-11
 ;;9002226.02101,"629,00298-1044-11 ",.02)
 ;;00298-1044-11
 ;;9002226.02101,"629,00298-1276-11 ",.01)
 ;;00298-1276-11
 ;;9002226.02101,"629,00298-1276-11 ",.02)
 ;;00298-1276-11
 ;;9002226.02101,"629,00298-6111-61 ",.01)
 ;;00298-6111-61
 ;;9002226.02101,"629,00298-6111-61 ",.02)
 ;;00298-6111-61
 ;;9002226.02101,"629,00302-1098-01 ",.01)
 ;;00302-1098-01
 ;;9002226.02101,"629,00302-1098-01 ",.02)
 ;;00302-1098-01
 ;;9002226.02101,"629,00302-6500-01 ",.01)
 ;;00302-6500-01
 ;;9002226.02101,"629,00302-6500-01 ",.02)
 ;;00302-6500-01
 ;;9002226.02101,"629,00302-6500-05 ",.01)
 ;;00302-6500-05
 ;;9002226.02101,"629,00302-6500-05 ",.02)
 ;;00302-6500-05
 ;;9002226.02101,"629,00302-6510-01 ",.01)
 ;;00302-6510-01
 ;;9002226.02101,"629,00302-6510-01 ",.02)
 ;;00302-6510-01
 ;;9002226.02101,"629,00302-6510-05 ",.01)
 ;;00302-6510-05
 ;;9002226.02101,"629,00302-6510-05 ",.02)
 ;;00302-6510-05
 ;;9002226.02101,"629,00302-7070-01 ",.01)
 ;;00302-7070-01
 ;;9002226.02101,"629,00302-7070-01 ",.02)
 ;;00302-7070-01
 ;;9002226.02101,"629,00302-7070-05 ",.01)
 ;;00302-7070-05
 ;;9002226.02101,"629,00302-7070-05 ",.02)
 ;;00302-7070-05
 ;;9002226.02101,"629,00314-0549-10 ",.01)
 ;;00314-0549-10
 ;;9002226.02101,"629,00314-0549-10 ",.02)
 ;;00314-0549-10
 ;;9002226.02101,"629,00339-5823-12 ",.01)
 ;;00339-5823-12
 ;;9002226.02101,"629,00339-5823-12 ",.02)
 ;;00339-5823-12
 ;;9002226.02101,"629,00349-2120-01 ",.01)
 ;;00349-2120-01
 ;;9002226.02101,"629,00349-2120-01 ",.02)
 ;;00349-2120-01
 ;;9002226.02101,"629,00349-2120-05 ",.01)
 ;;00349-2120-05
 ;;9002226.02101,"629,00349-2120-05 ",.02)
 ;;00349-2120-05
 ;;9002226.02101,"629,00349-2227-10 ",.01)
 ;;00349-2227-10
 ;;9002226.02101,"629,00349-2227-10 ",.02)
 ;;00349-2227-10
 ;;9002226.02101,"629,00349-8608-10 ",.01)
 ;;00349-8608-10
 ;;9002226.02101,"629,00349-8608-10 ",.02)
 ;;00349-8608-10
 ;;9002226.02101,"629,00349-8734-10 ",.01)
 ;;00349-8734-10
 ;;9002226.02101,"629,00349-8734-10 ",.02)
 ;;00349-8734-10
 ;;9002226.02101,"629,00349-8778-01 ",.01)
 ;;00349-8778-01
 ;;9002226.02101,"629,00349-8778-01 ",.02)
 ;;00349-8778-01
 ;;9002226.02101,"629,00349-8778-05 ",.01)
 ;;00349-8778-05
 ;;9002226.02101,"629,00349-8778-05 ",.02)
 ;;00349-8778-05
 ;;9002226.02101,"629,00364-0269-02 ",.01)
 ;;00364-0269-02
 ;;9002226.02101,"629,00364-0269-02 ",.02)
 ;;00364-0269-02
 ;;9002226.02101,"629,00364-0270-02 ",.01)
 ;;00364-0270-02
 ;;9002226.02101,"629,00364-0270-02 ",.02)
 ;;00364-0270-02
 ;;9002226.02101,"629,00364-0271-02 ",.01)
 ;;00364-0271-02
 ;;9002226.02101,"629,00364-0271-02 ",.02)
 ;;00364-0271-02
 ;;9002226.02101,"629,00364-0346-01 ",.01)
 ;;00364-0346-01
 ;;9002226.02101,"629,00364-0346-01 ",.02)
 ;;00364-0346-01
 ;;9002226.02101,"629,00364-0346-05 ",.01)
 ;;00364-0346-05
 ;;9002226.02101,"629,00364-0346-05 ",.02)
 ;;00364-0346-05
 ;;9002226.02101,"629,00364-0347-01 ",.01)
 ;;00364-0347-01
 ;;9002226.02101,"629,00364-0347-01 ",.02)
 ;;00364-0347-01
 ;;9002226.02101,"629,00364-0347-05 ",.01)
 ;;00364-0347-05
 ;;9002226.02101,"629,00364-0347-05 ",.02)
 ;;00364-0347-05
 ;;9002226.02101,"629,00364-0475-01 ",.01)
 ;;00364-0475-01
 ;;9002226.02101,"629,00364-0475-01 ",.02)
 ;;00364-0475-01
 ;;9002226.02101,"629,00364-0475-02 ",.01)
 ;;00364-0475-02
 ;;9002226.02101,"629,00364-0475-02 ",.02)
 ;;00364-0475-02
 ;;9002226.02101,"629,00364-0475-04 ",.01)
 ;;00364-0475-04
 ;;9002226.02101,"629,00364-0475-04 ",.02)
 ;;00364-0475-04
 ;;9002226.02101,"629,00364-0475-05 ",.01)
 ;;00364-0475-05
 ;;9002226.02101,"629,00364-0475-05 ",.02)
 ;;00364-0475-05
 ;;9002226.02101,"629,00364-2348-01 ",.01)
 ;;00364-2348-01
 ;;9002226.02101,"629,00364-2348-01 ",.02)
 ;;00364-2348-01
 ;;9002226.02101,"629,00364-2348-02 ",.01)
 ;;00364-2348-02
 ;;9002226.02101,"629,00364-2348-02 ",.02)
 ;;00364-2348-02
 ;;9002226.02101,"629,00364-2348-05 ",.01)
 ;;00364-2348-05
 ;;9002226.02101,"629,00364-2348-05 ",.02)
 ;;00364-2348-05
 ;;9002226.02101,"629,00364-2830-01 ",.01)
 ;;00364-2830-01
 ;;9002226.02101,"629,00364-2830-01 ",.02)
 ;;00364-2830-01
 ;;9002226.02101,"629,00364-2830-04 ",.01)
 ;;00364-2830-04
 ;;9002226.02101,"629,00364-2830-04 ",.02)
 ;;00364-2830-04
 ;;9002226.02101,"629,00364-2830-05 ",.01)
 ;;00364-2830-05
 ;;9002226.02101,"629,00364-2830-05 ",.02)
 ;;00364-2830-05
 ;;9002226.02101,"629,00378-0751-01 ",.01)
 ;;00378-0751-01
 ;;9002226.02101,"629,00378-0751-01 ",.02)
 ;;00378-0751-01
 ;;9002226.02101,"629,00378-0751-10 ",.01)
 ;;00378-0751-10
 ;;9002226.02101,"629,00378-0751-10 ",.02)
 ;;00378-0751-10
 ;;9002226.02101,"629,00378-3354-01 ",.01)
 ;;00378-3354-01
 ;;9002226.02101,"629,00378-3354-01 ",.02)
 ;;00378-3354-01
 ;;9002226.02101,"629,00378-3356-01 ",.01)
 ;;00378-3356-01
 ;;9002226.02101,"629,00378-3356-01 ",.02)
 ;;00378-3356-01
 ;;9002226.02101,"629,00378-3358-01 ",.01)
 ;;00378-3358-01
 ;;9002226.02101,"629,00378-3358-01 ",.02)
 ;;00378-3358-01
 ;;9002226.02101,"629,00378-3358-05 ",.01)
 ;;00378-3358-05
 ;;9002226.02101,"629,00378-3358-05 ",.02)
 ;;00378-3358-05
 ;;9002226.02101,"629,00403-1599-40 ",.01)
 ;;00403-1599-40
 ;;9002226.02101,"629,00403-1599-40 ",.02)
 ;;00403-1599-40
 ;;9002226.02101,"629,00403-1600-20 ",.01)
 ;;00403-1600-20
 ;;9002226.02101,"629,00403-1600-20 ",.02)
 ;;00403-1600-20
 ;;9002226.02101,"629,00403-1600-40 ",.01)
 ;;00403-1600-40
 ;;9002226.02101,"629,00403-1600-40 ",.02)
 ;;00403-1600-40
 ;;9002226.02101,"629,00403-1942-20 ",.01)
 ;;00403-1942-20
 ;;9002226.02101,"629,00403-1942-20 ",.02)
 ;;00403-1942-20
 ;;9002226.02101,"629,00403-1942-40 ",.01)
 ;;00403-1942-40
 ;;9002226.02101,"629,00403-1942-40 ",.02)
 ;;00403-1942-40
 ;;9002226.02101,"629,00403-1946-20 ",.01)
 ;;00403-1946-20
 ;;9002226.02101,"629,00403-1946-20 ",.02)
 ;;00403-1946-20
 ;;9002226.02101,"629,00403-1946-30 ",.01)
 ;;00403-1946-30
 ;;9002226.02101,"629,00403-1946-30 ",.02)
 ;;00403-1946-30
 ;;9002226.02101,"629,00403-1946-40 ",.01)
 ;;00403-1946-40
 ;;9002226.02101,"629,00403-1946-40 ",.02)
 ;;00403-1946-40
 ;;9002226.02101,"629,00403-3607-30 ",.01)
 ;;00403-3607-30
 ;;9002226.02101,"629,00403-3607-30 ",.02)
 ;;00403-3607-30
 ;;9002226.02101,"629,00405-0032-01 ",.01)
 ;;00405-0032-01
 ;;9002226.02101,"629,00405-0032-01 ",.02)
 ;;00405-0032-01
 ;;9002226.02101,"629,00405-4141-01 ",.01)
 ;;00405-4141-01
 ;;9002226.02101,"629,00405-4141-01 ",.02)
 ;;00405-4141-01
 ;;9002226.02101,"629,00405-4141-02 ",.01)
 ;;00405-4141-02
 ;;9002226.02101,"629,00405-4141-02 ",.02)
 ;;00405-4141-02
 ;;9002226.02101,"629,00405-4219-01 ",.01)
 ;;00405-4219-01
 ;;9002226.02101,"629,00405-4219-01 ",.02)
 ;;00405-4219-01
 ;;9002226.02101,"629,00405-4219-02 ",.01)
 ;;00405-4219-02
 ;;9002226.02101,"629,00405-4219-02 ",.02)
 ;;00405-4219-02
 ;;9002226.02101,"629,00405-4290-01 ",.01)
 ;;00405-4290-01
 ;;9002226.02101,"629,00405-4290-01 ",.02)
 ;;00405-4290-01
 ;;9002226.02101,"629,00405-4290-03 ",.01)
 ;;00405-4290-03
 ;;9002226.02101,"629,00405-4290-03 ",.02)
 ;;00405-4290-03
 ;;9002226.02101,"629,00405-4635-01 ",.01)
 ;;00405-4635-01
 ;;9002226.02101,"629,00405-4635-01 ",.02)
 ;;00405-4635-01
 ;;9002226.02101,"629,00405-4635-02 ",.01)
 ;;00405-4635-02
 ;;9002226.02101,"629,00405-4635-02 ",.02)
 ;;00405-4635-02
 ;;9002226.02101,"629,00405-4636-01 ",.01)
 ;;00405-4636-01
 ;;9002226.02101,"629,00405-4636-01 ",.02)
 ;;00405-4636-01
 ;;9002226.02101,"629,00405-4636-02 ",.01)
 ;;00405-4636-02
 ;;9002226.02101,"629,00405-4636-02 ",.02)
 ;;00405-4636-02
 ;;9002226.02101,"629,00405-4641-01 ",.01)
 ;;00405-4641-01
 ;;9002226.02101,"629,00405-4641-01 ",.02)
 ;;00405-4641-01
 ;;9002226.02101,"629,00440-7238-20 ",.01)
 ;;00440-7238-20
 ;;9002226.02101,"629,00440-7238-20 ",.02)
 ;;00440-7238-20
 ;;9002226.02101,"629,00440-7238-30 ",.01)
 ;;00440-7238-30
 ;;9002226.02101,"629,00440-7238-30 ",.02)
 ;;00440-7238-30
 ;;9002226.02101,"629,00440-7238-40 ",.01)
 ;;00440-7238-40
 ;;9002226.02101,"629,00440-7238-40 ",.02)
 ;;00440-7238-40
 ;;9002226.02101,"629,00440-7238-90 ",.01)
 ;;00440-7238-90
 ;;9002226.02101,"629,00440-7238-90 ",.02)
 ;;00440-7238-90
 ;;9002226.02101,"629,00440-7238-91 ",.01)
 ;;00440-7238-91
 ;;9002226.02101,"629,00440-7238-91 ",.02)
 ;;00440-7238-91
 ;;9002226.02101,"629,00440-7239-20 ",.01)
 ;;00440-7239-20
 ;;9002226.02101,"629,00440-7239-20 ",.02)
 ;;00440-7239-20
 ;;9002226.02101,"629,00440-7239-40 ",.01)
 ;;00440-7239-40
 ;;9002226.02101,"629,00440-7239-40 ",.02)
 ;;00440-7239-40
 ;;9002226.02101,"629,00440-7350-30 ",.01)
 ;;00440-7350-30
 ;;9002226.02101,"629,00440-7350-30 ",.02)
 ;;00440-7350-30
 ;;9002226.02101,"629,00440-7350-90 ",.01)
 ;;00440-7350-90
 ;;9002226.02101,"629,00440-7350-90 ",.02)
 ;;00440-7350-90
 ;;9002226.02101,"629,00440-7740-20 ",.01)
 ;;00440-7740-20
 ;;9002226.02101,"629,00440-7740-20 ",.02)
 ;;00440-7740-20
 ;;9002226.02101,"629,00440-7740-40 ",.01)
 ;;00440-7740-40
 ;;9002226.02101,"629,00440-7740-40 ",.02)
 ;;00440-7740-40
 ;;9002226.02101,"629,00440-7741-20 ",.01)
 ;;00440-7741-20
 ;;9002226.02101,"629,00440-7741-20 ",.02)
 ;;00440-7741-20
 ;;9002226.02101,"629,00440-7741-30 ",.01)
 ;;00440-7741-30
 ;;9002226.02101,"629,00440-7741-30 ",.02)
 ;;00440-7741-30
 ;;9002226.02101,"629,00440-7741-40 ",.01)
 ;;00440-7741-40
 ;;9002226.02101,"629,00440-7741-40 ",.02)
 ;;00440-7741-40
 ;;9002226.02101,"629,00456-1092-10 ",.01)
 ;;00456-1092-10
 ;;9002226.02101,"629,00456-1092-10 ",.02)
 ;;00456-1092-10
 ;;9002226.02101,"629,00463-1092-10 ",.01)
 ;;00463-1092-10
 ;;9002226.02101,"629,00463-1092-10 ",.02)
 ;;00463-1092-10
 ;;9002226.02101,"629,00463-1106-10 ",.01)
 ;;00463-1106-10
 ;;9002226.02101,"629,00463-1106-10 ",.02)
 ;;00463-1106-10
 ;;9002226.02101,"629,00527-1152-01 ",.01)
 ;;00527-1152-01
 ;;9002226.02101,"629,00527-1152-01 ",.02)
 ;;00527-1152-01
 ;;9002226.02101,"629,00527-1152-05 ",.01)
 ;;00527-1152-05
 ;;9002226.02101,"629,00527-1152-05 ",.02)
 ;;00527-1152-05
 ;;9002226.02101,"629,00527-1302-01 ",.01)
 ;;00527-1302-01
 ;;9002226.02101,"629,00527-1302-01 ",.02)
 ;;00527-1302-01
 ;;9002226.02101,"629,00527-1302-05 ",.01)
 ;;00527-1302-05
 ;;9002226.02101,"629,00527-1302-05 ",.02)
 ;;00527-1302-05
 ;;9002226.02101,"629,00536-3444-01 ",.01)
 ;;00536-3444-01
 ;;9002226.02101,"629,00536-3444-01 ",.02)
 ;;00536-3444-01
 ;;9002226.02101,"629,00536-4706-10 ",.01)
 ;;00536-4706-10
 ;;9002226.02101,"629,00536-4706-10 ",.02)
 ;;00536-4706-10
 ;;9002226.02101,"629,00555-0585-02 ",.01)
 ;;00555-0585-02
 ;;9002226.02101,"629,00555-0585-02 ",.02)
 ;;00555-0585-02
 ;;9002226.02101,"629,00555-0585-04 ",.01)
 ;;00555-0585-04
 ;;9002226.02101,"629,00555-0585-04 ",.02)
 ;;00555-0585-04
 ;;9002226.02101,"629,00556-0285-05 ",.01)
 ;;00556-0285-05
 ;;9002226.02101,"629,00556-0285-05 ",.02)
 ;;00556-0285-05
 ;;9002226.02101,"629,00556-0286-01 ",.01)
 ;;00556-0286-01
 ;;9002226.02101,"629,00556-0286-01 ",.02)
 ;;00556-0286-01
 ;;9002226.02101,"629,00556-0286-05 ",.01)
 ;;00556-0286-05
 ;;9002226.02101,"629,00556-0286-05 ",.02)
 ;;00556-0286-05
 ;;9002226.02101,"629,00591-2830-01 ",.01)
 ;;00591-2830-01
 ;;9002226.02101,"629,00591-2830-01 ",.02)
 ;;00591-2830-01
 ;;9002226.02101,"629,00591-2830-25 ",.01)
 ;;00591-2830-25
 ;;9002226.02101,"629,00591-2830-25 ",.02)
 ;;00591-2830-25
 ;;9002226.02101,"629,00591-3222-47 ",.01)
 ;;00591-3222-47
 ;;9002226.02101,"629,00591-3222-47 ",.02)
 ;;00591-3222-47
 ;;9002226.02101,"629,00591-5381-01 ",.01)
 ;;00591-5381-01
 ;;9002226.02101,"629,00591-5381-01 ",.02)
 ;;00591-5381-01
 ;;9002226.02101,"629,00591-5381-05 ",.01)
 ;;00591-5381-05
 ;;9002226.02101,"629,00591-5381-05 ",.02)
 ;;00591-5381-05
