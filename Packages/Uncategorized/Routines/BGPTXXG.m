BGPTXXG ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 19, 2004 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"781,13710-9 ",.02)
 ;;13710-9
 ;;9002226.02101,"781,13711-7 ",.01)
 ;;13711-7
 ;;9002226.02101,"781,13711-7 ",.02)
 ;;13711-7
 ;;9002226.02101,"781,13712-5 ",.01)
 ;;13712-5
 ;;9002226.02101,"781,13712-5 ",.02)
 ;;13712-5
 ;;9002226.02101,"781,13713-3 ",.01)
 ;;13713-3
 ;;9002226.02101,"781,13713-3 ",.02)
 ;;13713-3
 ;;9002226.02101,"781,13714-1 ",.01)
 ;;13714-1
 ;;9002226.02101,"781,13714-1 ",.02)
 ;;13714-1
 ;;9002226.02101,"781,13715-8 ",.01)
 ;;13715-8
 ;;9002226.02101,"781,13715-8 ",.02)
 ;;13715-8
 ;;9002226.02101,"781,13716-6 ",.01)
 ;;13716-6
 ;;9002226.02101,"781,13716-6 ",.02)
 ;;13716-6
 ;;9002226.02101,"781,13717-4 ",.01)
 ;;13717-4
 ;;9002226.02101,"781,13717-4 ",.02)
 ;;13717-4
 ;;9002226.02101,"781,13718-2 ",.01)
 ;;13718-2
 ;;9002226.02101,"781,13718-2 ",.02)
 ;;13718-2
 ;;9002226.02101,"781,13719-0 ",.01)
 ;;13719-0
 ;;9002226.02101,"781,13719-0 ",.02)
 ;;13719-0
 ;;9002226.02101,"781,13720-8 ",.01)
 ;;13720-8
 ;;9002226.02101,"781,13720-8 ",.02)
 ;;13720-8
 ;;9002226.02101,"781,13721-6 ",.01)
 ;;13721-6
 ;;9002226.02101,"781,13721-6 ",.02)
 ;;13721-6
 ;;9002226.02101,"781,13722-4 ",.01)
 ;;13722-4
 ;;9002226.02101,"781,13722-4 ",.02)
 ;;13722-4
 ;;9002226.02101,"781,13723-2 ",.01)
 ;;13723-2
 ;;9002226.02101,"781,13723-2 ",.02)
 ;;13723-2
 ;;9002226.02101,"781,13724-0 ",.01)
 ;;13724-0
 ;;9002226.02101,"781,13724-0 ",.02)
 ;;13724-0
 ;;9002226.02101,"781,13725-7 ",.01)
 ;;13725-7
 ;;9002226.02101,"781,13725-7 ",.02)
 ;;13725-7
 ;;9002226.02101,"781,13726-5 ",.01)
 ;;13726-5
 ;;9002226.02101,"781,13726-5 ",.02)
 ;;13726-5
 ;;9002226.02101,"781,13727-3 ",.01)
 ;;13727-3
 ;;9002226.02101,"781,13727-3 ",.02)
 ;;13727-3
 ;;9002226.02101,"781,13728-1 ",.01)
 ;;13728-1
 ;;9002226.02101,"781,13728-1 ",.02)
 ;;13728-1
 ;;9002226.02101,"781,13729-9 ",.01)
 ;;13729-9
 ;;9002226.02101,"781,13729-9 ",.02)
 ;;13729-9
 ;;9002226.02101,"781,13730-7 ",.01)
 ;;13730-7
 ;;9002226.02101,"781,13730-7 ",.02)
 ;;13730-7
 ;;9002226.02101,"781,13731-5 ",.01)
 ;;13731-5
 ;;9002226.02101,"781,13731-5 ",.02)
 ;;13731-5
 ;;9002226.02101,"781,13732-3 ",.01)
 ;;13732-3
 ;;9002226.02101,"781,13732-3 ",.02)
 ;;13732-3
 ;;9002226.02101,"781,13733-1 ",.01)
 ;;13733-1
 ;;9002226.02101,"781,13733-1 ",.02)
 ;;13733-1
 ;;9002226.02101,"781,13734-9 ",.01)
 ;;13734-9
 ;;9002226.02101,"781,13734-9 ",.02)
 ;;13734-9
 ;;9002226.02101,"781,13735-6 ",.01)
 ;;13735-6
 ;;9002226.02101,"781,13735-6 ",.02)
 ;;13735-6
 ;;9002226.02101,"781,13736-4 ",.01)
 ;;13736-4
 ;;9002226.02101,"781,13736-4 ",.02)
 ;;13736-4
 ;;9002226.02101,"781,13737-2 ",.01)
 ;;13737-2
 ;;9002226.02101,"781,13737-2 ",.02)
 ;;13737-2
 ;;9002226.02101,"781,13738-0 ",.01)
 ;;13738-0
 ;;9002226.02101,"781,13738-0 ",.02)
 ;;13738-0
 ;;9002226.02101,"781,13739-8 ",.01)
 ;;13739-8
 ;;9002226.02101,"781,13739-8 ",.02)
 ;;13739-8
 ;;9002226.02101,"781,13740-6 ",.01)
 ;;13740-6
 ;;9002226.02101,"781,13740-6 ",.02)
 ;;13740-6
 ;;9002226.02101,"781,13741-4 ",.01)
 ;;13741-4
 ;;9002226.02101,"781,13741-4 ",.02)
 ;;13741-4
 ;;9002226.02101,"781,13742-2 ",.01)
 ;;13742-2
 ;;9002226.02101,"781,13742-2 ",.02)
 ;;13742-2
 ;;9002226.02101,"781,13743-0 ",.01)
 ;;13743-0
 ;;9002226.02101,"781,13743-0 ",.02)
 ;;13743-0
 ;;9002226.02101,"781,13744-8 ",.01)
 ;;13744-8
 ;;9002226.02101,"781,13744-8 ",.02)
 ;;13744-8
 ;;9002226.02101,"781,13745-5 ",.01)
 ;;13745-5
 ;;9002226.02101,"781,13745-5 ",.02)
 ;;13745-5
 ;;9002226.02101,"781,13746-3 ",.01)
 ;;13746-3
 ;;9002226.02101,"781,13746-3 ",.02)
 ;;13746-3
 ;;9002226.02101,"781,13747-1 ",.01)
 ;;13747-1
 ;;9002226.02101,"781,13747-1 ",.02)
 ;;13747-1
 ;;9002226.02101,"781,13748-9 ",.01)
 ;;13748-9
 ;;9002226.02101,"781,13748-9 ",.02)
 ;;13748-9
 ;;9002226.02101,"781,13749-7 ",.01)
 ;;13749-7
 ;;9002226.02101,"781,13749-7 ",.02)
 ;;13749-7
 ;;9002226.02101,"781,13750-5 ",.01)
 ;;13750-5
 ;;9002226.02101,"781,13750-5 ",.02)
 ;;13750-5
 ;;9002226.02101,"781,13751-3 ",.01)
 ;;13751-3
 ;;9002226.02101,"781,13751-3 ",.02)
 ;;13751-3
 ;;9002226.02101,"781,13752-1 ",.01)
 ;;13752-1
 ;;9002226.02101,"781,13752-1 ",.02)
 ;;13752-1
 ;;9002226.02101,"781,13753-9 ",.01)
 ;;13753-9
 ;;9002226.02101,"781,13753-9 ",.02)
 ;;13753-9
 ;;9002226.02101,"781,13754-7 ",.01)
 ;;13754-7
 ;;9002226.02101,"781,13754-7 ",.02)
 ;;13754-7
 ;;9002226.02101,"781,13755-4 ",.01)
 ;;13755-4
 ;;9002226.02101,"781,13755-4 ",.02)
 ;;13755-4
 ;;9002226.02101,"781,13756-2 ",.01)
 ;;13756-2
 ;;9002226.02101,"781,13756-2 ",.02)
 ;;13756-2
 ;;9002226.02101,"781,13757-0 ",.01)
 ;;13757-0
 ;;9002226.02101,"781,13757-0 ",.02)
 ;;13757-0
 ;;9002226.02101,"781,13758-8 ",.01)
 ;;13758-8
 ;;9002226.02101,"781,13758-8 ",.02)
 ;;13758-8
 ;;9002226.02101,"781,13759-6 ",.01)
 ;;13759-6
 ;;9002226.02101,"781,13759-6 ",.02)
 ;;13759-6
 ;;9002226.02101,"781,13760-4 ",.01)
 ;;13760-4
 ;;9002226.02101,"781,13760-4 ",.02)
 ;;13760-4
 ;;9002226.02101,"781,13761-2 ",.01)
 ;;13761-2
 ;;9002226.02101,"781,13761-2 ",.02)
 ;;13761-2
 ;;9002226.02101,"781,13762-0 ",.01)
 ;;13762-0
 ;;9002226.02101,"781,13762-0 ",.02)
 ;;13762-0