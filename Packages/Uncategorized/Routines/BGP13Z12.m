BGP13Z12 ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1102,60429-0725-18 ",.02)
 ;;60429-0725-18
 ;;9002226.02101,"1102,60429-0725-60 ",.01)
 ;;60429-0725-60
 ;;9002226.02101,"1102,60429-0725-60 ",.02)
 ;;60429-0725-60
 ;;9002226.02101,"1102,60429-0725-90 ",.01)
 ;;60429-0725-90
 ;;9002226.02101,"1102,60429-0725-90 ",.02)
 ;;60429-0725-90
 ;;9002226.02101,"1102,60505-0190-00 ",.01)
 ;;60505-0190-00
 ;;9002226.02101,"1102,60505-0190-00 ",.02)
 ;;60505-0190-00
 ;;9002226.02101,"1102,60505-0190-01 ",.01)
 ;;60505-0190-01
 ;;9002226.02101,"1102,60505-0190-01 ",.02)
 ;;60505-0190-01
 ;;9002226.02101,"1102,60505-0190-04 ",.01)
 ;;60505-0190-04
 ;;9002226.02101,"1102,60505-0190-04 ",.02)
 ;;60505-0190-04
 ;;9002226.02101,"1102,60505-0190-08 ",.01)
 ;;60505-0190-08
 ;;9002226.02101,"1102,60505-0190-08 ",.02)
 ;;60505-0190-08
 ;;9002226.02101,"1102,60505-0191-00 ",.01)
 ;;60505-0191-00
 ;;9002226.02101,"1102,60505-0191-00 ",.02)
 ;;60505-0191-00
 ;;9002226.02101,"1102,60505-0191-01 ",.01)
 ;;60505-0191-01
 ;;9002226.02101,"1102,60505-0191-01 ",.02)
 ;;60505-0191-01
 ;;9002226.02101,"1102,60505-0191-04 ",.01)
 ;;60505-0191-04
 ;;9002226.02101,"1102,60505-0191-04 ",.02)
 ;;60505-0191-04
 ;;9002226.02101,"1102,60505-0191-08 ",.01)
 ;;60505-0191-08
 ;;9002226.02101,"1102,60505-0191-08 ",.02)
 ;;60505-0191-08
 ;;9002226.02101,"1102,60505-0192-00 ",.01)
 ;;60505-0192-00
 ;;9002226.02101,"1102,60505-0192-00 ",.02)
 ;;60505-0192-00
 ;;9002226.02101,"1102,60505-0192-01 ",.01)
 ;;60505-0192-01
 ;;9002226.02101,"1102,60505-0192-01 ",.02)
 ;;60505-0192-01
 ;;9002226.02101,"1102,60505-0192-04 ",.01)
 ;;60505-0192-04
 ;;9002226.02101,"1102,60505-0192-04 ",.02)
 ;;60505-0192-04
 ;;9002226.02101,"1102,60505-0192-08 ",.01)
 ;;60505-0192-08
 ;;9002226.02101,"1102,60505-0192-08 ",.02)
 ;;60505-0192-08
 ;;9002226.02101,"1102,60505-0260-01 ",.01)
 ;;60505-0260-01
 ;;9002226.02101,"1102,60505-0260-01 ",.02)
 ;;60505-0260-01
 ;;9002226.02101,"1102,60505-0260-02 ",.01)
 ;;60505-0260-02
 ;;9002226.02101,"1102,60505-0260-02 ",.02)
 ;;60505-0260-02
 ;;9002226.02101,"1102,60505-0260-07 ",.01)
 ;;60505-0260-07
 ;;9002226.02101,"1102,60505-0260-07 ",.02)
 ;;60505-0260-07
 ;;9002226.02101,"1102,60505-1329-01 ",.01)
 ;;60505-1329-01
 ;;9002226.02101,"1102,60505-1329-01 ",.02)
 ;;60505-1329-01
 ;;9002226.02101,"1102,62022-0574-60 ",.01)
 ;;62022-0574-60
 ;;9002226.02101,"1102,62022-0574-60 ",.02)
 ;;62022-0574-60
 ;;9002226.02101,"1102,62022-0575-60 ",.01)
 ;;62022-0575-60
 ;;9002226.02101,"1102,62022-0575-60 ",.02)
 ;;62022-0575-60
 ;;9002226.02101,"1102,62037-0571-01 ",.01)
 ;;62037-0571-01
 ;;9002226.02101,"1102,62037-0571-01 ",.02)
 ;;62037-0571-01
 ;;9002226.02101,"1102,62037-0571-10 ",.01)
 ;;62037-0571-10
 ;;9002226.02101,"1102,62037-0571-10 ",.02)
 ;;62037-0571-10
 ;;9002226.02101,"1102,62037-0577-01 ",.01)
 ;;62037-0577-01
 ;;9002226.02101,"1102,62037-0577-01 ",.02)
 ;;62037-0577-01
 ;;9002226.02101,"1102,62037-0577-10 ",.01)
 ;;62037-0577-10
 ;;9002226.02101,"1102,62037-0577-10 ",.02)
 ;;62037-0577-10
 ;;9002226.02101,"1102,62037-0674-01 ",.01)
 ;;62037-0674-01
 ;;9002226.02101,"1102,62037-0674-01 ",.02)
 ;;62037-0674-01
 ;;9002226.02101,"1102,62037-0674-10 ",.01)
 ;;62037-0674-10
 ;;9002226.02101,"1102,62037-0674-10 ",.02)
 ;;62037-0674-10
 ;;9002226.02101,"1102,62037-0675-01 ",.01)
 ;;62037-0675-01
 ;;9002226.02101,"1102,62037-0675-01 ",.02)
 ;;62037-0675-01
 ;;9002226.02101,"1102,62037-0675-10 ",.01)
 ;;62037-0675-10
 ;;9002226.02101,"1102,62037-0675-10 ",.02)
 ;;62037-0675-10
 ;;9002226.02101,"1102,62037-0676-01 ",.01)
 ;;62037-0676-01
 ;;9002226.02101,"1102,62037-0676-01 ",.02)
 ;;62037-0676-01
 ;;9002226.02101,"1102,62037-0676-10 ",.01)
 ;;62037-0676-10
 ;;9002226.02101,"1102,62037-0676-10 ",.02)
 ;;62037-0676-10
 ;;9002226.02101,"1102,62584-0182-08 ",.01)
 ;;62584-0182-08
 ;;9002226.02101,"1102,62584-0182-08 ",.02)
 ;;62584-0182-08
 ;;9002226.02101,"1102,62584-0259-01 ",.01)
 ;;62584-0259-01
 ;;9002226.02101,"1102,62584-0259-01 ",.02)
 ;;62584-0259-01
 ;;9002226.02101,"1102,62584-0259-11 ",.01)
 ;;62584-0259-11
 ;;9002226.02101,"1102,62584-0259-11 ",.02)
 ;;62584-0259-11
 ;;9002226.02101,"1102,62584-0259-80 ",.01)
 ;;62584-0259-80
 ;;9002226.02101,"1102,62584-0259-80 ",.02)
 ;;62584-0259-80
 ;;9002226.02101,"1102,62584-0259-85 ",.01)
 ;;62584-0259-85
 ;;9002226.02101,"1102,62584-0259-85 ",.02)
 ;;62584-0259-85
 ;;9002226.02101,"1102,62584-0332-01 ",.01)
 ;;62584-0332-01
 ;;9002226.02101,"1102,62584-0332-01 ",.02)
 ;;62584-0332-01
 ;;9002226.02101,"1102,62584-0332-11 ",.01)
 ;;62584-0332-11
 ;;9002226.02101,"1102,62584-0332-11 ",.02)
 ;;62584-0332-11
 ;;9002226.02101,"1102,62584-0452-01 ",.01)
 ;;62584-0452-01
 ;;9002226.02101,"1102,62584-0452-01 ",.02)
 ;;62584-0452-01
 ;;9002226.02101,"1102,62584-0452-11 ",.01)
 ;;62584-0452-11
 ;;9002226.02101,"1102,62584-0452-11 ",.02)
 ;;62584-0452-11
 ;;9002226.02101,"1102,62584-0452-80 ",.01)
 ;;62584-0452-80
 ;;9002226.02101,"1102,62584-0452-80 ",.02)
 ;;62584-0452-80
 ;;9002226.02101,"1102,62584-0452-85 ",.01)
 ;;62584-0452-85
 ;;9002226.02101,"1102,62584-0452-85 ",.02)
 ;;62584-0452-85
 ;;9002226.02101,"1102,62682-5005-06 ",.01)
 ;;62682-5005-06
 ;;9002226.02101,"1102,62682-5005-06 ",.02)
 ;;62682-5005-06
 ;;9002226.02101,"1102,62756-0142-01 ",.01)
 ;;62756-0142-01
 ;;9002226.02101,"1102,62756-0142-01 ",.02)
 ;;62756-0142-01
 ;;9002226.02101,"1102,62756-0142-02 ",.01)
 ;;62756-0142-02
 ;;9002226.02101,"1102,62756-0142-02 ",.02)
 ;;62756-0142-02
 ;;9002226.02101,"1102,62756-0143-01 ",.01)
 ;;62756-0143-01
 ;;9002226.02101,"1102,62756-0143-01 ",.02)
 ;;62756-0143-01
 ;;9002226.02101,"1102,63304-0206-01 ",.01)
 ;;63304-0206-01
 ;;9002226.02101,"1102,63304-0206-01 ",.02)
 ;;63304-0206-01
 ;;9002226.02101,"1102,63304-0206-02 ",.01)
 ;;63304-0206-02
 ;;9002226.02101,"1102,63304-0206-02 ",.02)
 ;;63304-0206-02
 ;;9002226.02101,"1102,63304-0767-01 ",.01)
 ;;63304-0767-01
 ;;9002226.02101,"1102,63304-0767-01 ",.02)
 ;;63304-0767-01
 ;;9002226.02101,"1102,63304-0860-01 ",.01)
 ;;63304-0860-01
 ;;9002226.02101,"1102,63304-0860-01 ",.02)
 ;;63304-0860-01
 ;;9002226.02101,"1102,63304-0860-05 ",.01)
 ;;63304-0860-05
 ;;9002226.02101,"1102,63304-0860-05 ",.02)
 ;;63304-0860-05
 ;;9002226.02101,"1102,63304-0860-30 ",.01)
 ;;63304-0860-30
 ;;9002226.02101,"1102,63304-0860-30 ",.02)
 ;;63304-0860-30
 ;;9002226.02101,"1102,63629-1392-01 ",.01)
 ;;63629-1392-01
 ;;9002226.02101,"1102,63629-1392-01 ",.02)
 ;;63629-1392-01
 ;;9002226.02101,"1102,63629-1392-02 ",.01)
 ;;63629-1392-02
 ;;9002226.02101,"1102,63629-1392-02 ",.02)
 ;;63629-1392-02
 ;;9002226.02101,"1102,63629-1392-03 ",.01)
 ;;63629-1392-03
 ;;9002226.02101,"1102,63629-1392-03 ",.02)
 ;;63629-1392-03
 ;;9002226.02101,"1102,63629-1395-01 ",.01)
 ;;63629-1395-01
 ;;9002226.02101,"1102,63629-1395-01 ",.02)
 ;;63629-1395-01
 ;;9002226.02101,"1102,63629-1395-02 ",.01)
 ;;63629-1395-02
 ;;9002226.02101,"1102,63629-1395-02 ",.02)
 ;;63629-1395-02
 ;;9002226.02101,"1102,63629-1395-03 ",.01)
 ;;63629-1395-03
 ;;9002226.02101,"1102,63629-1395-03 ",.02)
 ;;63629-1395-03
 ;;9002226.02101,"1102,63629-1396-01 ",.01)
 ;;63629-1396-01
 ;;9002226.02101,"1102,63629-1396-01 ",.02)
 ;;63629-1396-01
 ;;9002226.02101,"1102,63629-1396-02 ",.01)
 ;;63629-1396-02
 ;;9002226.02101,"1102,63629-1396-02 ",.02)
 ;;63629-1396-02
 ;;9002226.02101,"1102,63629-1397-01 ",.01)
 ;;63629-1397-01
 ;;9002226.02101,"1102,63629-1397-01 ",.02)
 ;;63629-1397-01
 ;;9002226.02101,"1102,63629-1397-02 ",.01)
 ;;63629-1397-02
 ;;9002226.02101,"1102,63629-1397-02 ",.02)
 ;;63629-1397-02
 ;;9002226.02101,"1102,63629-1397-03 ",.01)
 ;;63629-1397-03
 ;;9002226.02101,"1102,63629-1397-03 ",.02)
 ;;63629-1397-03
 ;;9002226.02101,"1102,63629-1397-04 ",.01)
 ;;63629-1397-04
 ;;9002226.02101,"1102,63629-1397-04 ",.02)
 ;;63629-1397-04
 ;;9002226.02101,"1102,63629-1397-05 ",.01)
 ;;63629-1397-05
 ;;9002226.02101,"1102,63629-1397-05 ",.02)
 ;;63629-1397-05
 ;;9002226.02101,"1102,63629-2793-01 ",.01)
 ;;63629-2793-01
 ;;9002226.02101,"1102,63629-2793-01 ",.02)
 ;;63629-2793-01
 ;;9002226.02101,"1102,63629-2793-03 ",.01)
 ;;63629-2793-03
 ;;9002226.02101,"1102,63629-2793-03 ",.02)
 ;;63629-2793-03
 ;;9002226.02101,"1102,63629-2793-04 ",.01)
 ;;63629-2793-04
 ;;9002226.02101,"1102,63629-2793-04 ",.02)
 ;;63629-2793-04
 ;;9002226.02101,"1102,63629-2793-05 ",.01)
 ;;63629-2793-05
 ;;9002226.02101,"1102,63629-2793-05 ",.02)
 ;;63629-2793-05
 ;;9002226.02101,"1102,63629-2883-01 ",.01)
 ;;63629-2883-01
 ;;9002226.02101,"1102,63629-2883-01 ",.02)
 ;;63629-2883-01
 ;;9002226.02101,"1102,63629-2883-02 ",.01)
 ;;63629-2883-02
 ;;9002226.02101,"1102,63629-2883-02 ",.02)
 ;;63629-2883-02
 ;;9002226.02101,"1102,63629-2883-03 ",.01)
 ;;63629-2883-03
 ;;9002226.02101,"1102,63629-2883-03 ",.02)
 ;;63629-2883-03
 ;;9002226.02101,"1102,63629-3998-01 ",.01)
 ;;63629-3998-01
 ;;9002226.02101,"1102,63629-3998-01 ",.02)
 ;;63629-3998-01
 ;;9002226.02101,"1102,63739-0299-10 ",.01)
 ;;63739-0299-10
 ;;9002226.02101,"1102,63739-0299-10 ",.02)
 ;;63739-0299-10
 ;;9002226.02101,"1102,63739-0300-10 ",.01)
 ;;63739-0300-10
 ;;9002226.02101,"1102,63739-0300-10 ",.02)
 ;;63739-0300-10
 ;;9002226.02101,"1102,63739-0301-10 ",.01)
 ;;63739-0301-10
 ;;9002226.02101,"1102,63739-0301-10 ",.02)
 ;;63739-0301-10
 ;;9002226.02101,"1102,63874-0501-01 ",.01)
 ;;63874-0501-01
 ;;9002226.02101,"1102,63874-0501-01 ",.02)
 ;;63874-0501-01
 ;;9002226.02101,"1102,63874-0501-04 ",.01)
 ;;63874-0501-04
 ;;9002226.02101,"1102,63874-0501-04 ",.02)
 ;;63874-0501-04
 ;;9002226.02101,"1102,63874-0501-10 ",.01)
 ;;63874-0501-10
 ;;9002226.02101,"1102,63874-0501-10 ",.02)
 ;;63874-0501-10
 ;;9002226.02101,"1102,63874-0501-14 ",.01)
 ;;63874-0501-14
 ;;9002226.02101,"1102,63874-0501-14 ",.02)
 ;;63874-0501-14
 ;;9002226.02101,"1102,63874-0501-20 ",.01)
 ;;63874-0501-20
 ;;9002226.02101,"1102,63874-0501-20 ",.02)
 ;;63874-0501-20
 ;;9002226.02101,"1102,63874-0501-24 ",.01)
 ;;63874-0501-24
 ;;9002226.02101,"1102,63874-0501-24 ",.02)
 ;;63874-0501-24
 ;;9002226.02101,"1102,63874-0501-28 ",.01)
 ;;63874-0501-28
 ;;9002226.02101,"1102,63874-0501-28 ",.02)
 ;;63874-0501-28
 ;;9002226.02101,"1102,63874-0501-30 ",.01)
 ;;63874-0501-30
 ;;9002226.02101,"1102,63874-0501-30 ",.02)
 ;;63874-0501-30
 ;;9002226.02101,"1102,63874-0501-60 ",.01)
 ;;63874-0501-60
 ;;9002226.02101,"1102,63874-0501-60 ",.02)
 ;;63874-0501-60
 ;;9002226.02101,"1102,63874-0501-90 ",.01)
 ;;63874-0501-90
 ;;9002226.02101,"1102,63874-0501-90 ",.02)
 ;;63874-0501-90
 ;;9002226.02101,"1102,63874-0635-01 ",.01)
 ;;63874-0635-01
 ;;9002226.02101,"1102,63874-0635-01 ",.02)
 ;;63874-0635-01
 ;;9002226.02101,"1102,63874-0635-10 ",.01)
 ;;63874-0635-10
 ;;9002226.02101,"1102,63874-0635-10 ",.02)
 ;;63874-0635-10
 ;;9002226.02101,"1102,63874-0635-20 ",.01)
 ;;63874-0635-20
 ;;9002226.02101,"1102,63874-0635-20 ",.02)
 ;;63874-0635-20
 ;;9002226.02101,"1102,63874-0635-28 ",.01)
 ;;63874-0635-28
 ;;9002226.02101,"1102,63874-0635-28 ",.02)
 ;;63874-0635-28
 ;;9002226.02101,"1102,63874-0635-30 ",.01)
 ;;63874-0635-30
 ;;9002226.02101,"1102,63874-0635-30 ",.02)
 ;;63874-0635-30
 ;;9002226.02101,"1102,63874-0635-60 ",.01)
 ;;63874-0635-60
 ;;9002226.02101,"1102,63874-0635-60 ",.02)
 ;;63874-0635-60
 ;;9002226.02101,"1102,63874-0635-90 ",.01)
 ;;63874-0635-90
 ;;9002226.02101,"1102,63874-0635-90 ",.02)
 ;;63874-0635-90
 ;;9002226.02101,"1102,63874-0974-01 ",.01)
 ;;63874-0974-01
 ;;9002226.02101,"1102,63874-0974-01 ",.02)
 ;;63874-0974-01
 ;;9002226.02101,"1102,63874-0974-30 ",.01)
 ;;63874-0974-30
 ;;9002226.02101,"1102,63874-0974-30 ",.02)
 ;;63874-0974-30
 ;;9002226.02101,"1102,63874-0974-60 ",.01)
 ;;63874-0974-60
 ;;9002226.02101,"1102,63874-0974-60 ",.02)
 ;;63874-0974-60
 ;;9002226.02101,"1102,64679-0528-04 ",.01)
 ;;64679-0528-04
 ;;9002226.02101,"1102,64679-0528-04 ",.02)
 ;;64679-0528-04
 ;;9002226.02101,"1102,64679-0528-05 ",.01)
 ;;64679-0528-05
 ;;9002226.02101,"1102,64679-0528-05 ",.02)
 ;;64679-0528-05
 ;;9002226.02101,"1102,64679-0529-04 ",.01)
 ;;64679-0529-04
 ;;9002226.02101,"1102,64679-0529-04 ",.02)
 ;;64679-0529-04
 ;;9002226.02101,"1102,64679-0529-05 ",.01)
 ;;64679-0529-05
 ;;9002226.02101,"1102,64679-0529-05 ",.02)
 ;;64679-0529-05
 ;;9002226.02101,"1102,64679-0530-04 ",.01)
 ;;64679-0530-04
 ;;9002226.02101,"1102,64679-0530-04 ",.02)
 ;;64679-0530-04
 ;;9002226.02101,"1102,64679-0530-05 ",.01)
 ;;64679-0530-05
 ;;9002226.02101,"1102,64679-0530-05 ",.02)
 ;;64679-0530-05
 ;;9002226.02101,"1102,64764-0155-18 ",.01)
 ;;64764-0155-18
