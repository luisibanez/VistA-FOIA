BGP9SXKN ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"729,51079-0284-21 ",.02)
 ;;51079-0284-21
 ;;9002226.02101,"729,51079-0285-20 ",.01)
 ;;51079-0285-20
 ;;9002226.02101,"729,51079-0285-20 ",.02)
 ;;51079-0285-20
 ;;9002226.02101,"729,51079-0285-21 ",.01)
 ;;51079-0285-21
 ;;9002226.02101,"729,51079-0285-21 ",.02)
 ;;51079-0285-21
 ;;9002226.02101,"729,51079-0286-20 ",.01)
 ;;51079-0286-20
 ;;9002226.02101,"729,51079-0286-20 ",.02)
 ;;51079-0286-20
 ;;9002226.02101,"729,51079-0286-21 ",.01)
 ;;51079-0286-21
 ;;9002226.02101,"729,51079-0286-21 ",.02)
 ;;51079-0286-21
 ;;9002226.02101,"729,51079-0302-20 ",.01)
 ;;51079-0302-20
 ;;9002226.02101,"729,51079-0302-20 ",.02)
 ;;51079-0302-20
 ;;9002226.02101,"729,51079-0302-21 ",.01)
 ;;51079-0302-21
 ;;9002226.02101,"729,51079-0302-21 ",.02)
 ;;51079-0302-21
 ;;9002226.02101,"729,51079-0303-20 ",.01)
 ;;51079-0303-20
 ;;9002226.02101,"729,51079-0303-20 ",.02)
 ;;51079-0303-20
 ;;9002226.02101,"729,51079-0303-21 ",.01)
 ;;51079-0303-21
 ;;9002226.02101,"729,51079-0303-21 ",.02)
 ;;51079-0303-21
 ;;9002226.02101,"729,51079-0374-20 ",.01)
 ;;51079-0374-20
 ;;9002226.02101,"729,51079-0374-20 ",.02)
 ;;51079-0374-20
 ;;9002226.02101,"729,51079-0374-21 ",.01)
 ;;51079-0374-21
 ;;9002226.02101,"729,51079-0374-21 ",.02)
 ;;51079-0374-21
 ;;9002226.02101,"729,51079-0375-20 ",.01)
 ;;51079-0375-20
 ;;9002226.02101,"729,51079-0375-20 ",.02)
 ;;51079-0375-20
 ;;9002226.02101,"729,51079-0375-21 ",.01)
 ;;51079-0375-21
 ;;9002226.02101,"729,51079-0375-21 ",.02)
 ;;51079-0375-21
 ;;9002226.02101,"729,51655-0801-24 ",.01)
 ;;51655-0801-24
 ;;9002226.02101,"729,51655-0801-24 ",.02)
 ;;51655-0801-24
 ;;9002226.02101,"729,51655-0801-25 ",.01)
 ;;51655-0801-25
 ;;9002226.02101,"729,51655-0801-25 ",.02)
 ;;51655-0801-25
 ;;9002226.02101,"729,51655-0801-26 ",.01)
 ;;51655-0801-26
 ;;9002226.02101,"729,51655-0801-26 ",.02)
 ;;51655-0801-26
 ;;9002226.02101,"729,51655-0801-82 ",.01)
 ;;51655-0801-82
 ;;9002226.02101,"729,51655-0801-82 ",.02)
 ;;51655-0801-82
 ;;9002226.02101,"729,51655-0833-24 ",.01)
 ;;51655-0833-24
 ;;9002226.02101,"729,51655-0833-24 ",.02)
 ;;51655-0833-24
 ;;9002226.02101,"729,51655-0833-25 ",.01)
 ;;51655-0833-25
 ;;9002226.02101,"729,51655-0833-25 ",.02)
 ;;51655-0833-25
 ;;9002226.02101,"729,51655-0833-26 ",.01)
 ;;51655-0833-26
 ;;9002226.02101,"729,51655-0833-26 ",.02)
 ;;51655-0833-26
 ;;9002226.02101,"729,51655-0833-82 ",.01)
 ;;51655-0833-82
 ;;9002226.02101,"729,51655-0833-82 ",.02)
 ;;51655-0833-82
 ;;9002226.02101,"729,52544-0785-01 ",.01)
 ;;52544-0785-01
 ;;9002226.02101,"729,52544-0785-01 ",.02)
 ;;52544-0785-01
 ;;9002226.02101,"729,52544-0785-05 ",.01)
 ;;52544-0785-05
 ;;9002226.02101,"729,52544-0785-05 ",.02)
 ;;52544-0785-05
 ;;9002226.02101,"729,52544-0786-01 ",.01)
 ;;52544-0786-01
 ;;9002226.02101,"729,52544-0786-01 ",.02)
 ;;52544-0786-01
 ;;9002226.02101,"729,52544-0786-05 ",.01)
 ;;52544-0786-05
 ;;9002226.02101,"729,52544-0786-05 ",.02)
 ;;52544-0786-05
 ;;9002226.02101,"729,52544-0786-10 ",.01)
 ;;52544-0786-10
 ;;9002226.02101,"729,52544-0786-10 ",.02)
 ;;52544-0786-10
 ;;9002226.02101,"729,52544-0787-01 ",.01)
 ;;52544-0787-01
 ;;9002226.02101,"729,52544-0787-01 ",.02)
 ;;52544-0787-01
 ;;9002226.02101,"729,52544-0787-05 ",.01)
 ;;52544-0787-05
 ;;9002226.02101,"729,52544-0787-05 ",.02)
 ;;52544-0787-05
 ;;9002226.02101,"729,52959-0047-03 ",.01)
 ;;52959-0047-03
 ;;9002226.02101,"729,52959-0047-03 ",.02)
 ;;52959-0047-03
 ;;9002226.02101,"729,52959-0047-05 ",.01)
 ;;52959-0047-05
 ;;9002226.02101,"729,52959-0047-05 ",.02)
 ;;52959-0047-05
 ;;9002226.02101,"729,52959-0047-06 ",.01)
 ;;52959-0047-06
 ;;9002226.02101,"729,52959-0047-06 ",.02)
 ;;52959-0047-06
 ;;9002226.02101,"729,52959-0047-10 ",.01)
 ;;52959-0047-10
 ;;9002226.02101,"729,52959-0047-10 ",.02)
 ;;52959-0047-10
 ;;9002226.02101,"729,52959-0047-12 ",.01)
 ;;52959-0047-12
 ;;9002226.02101,"729,52959-0047-12 ",.02)
 ;;52959-0047-12
 ;;9002226.02101,"729,52959-0047-15 ",.01)
 ;;52959-0047-15
 ;;9002226.02101,"729,52959-0047-15 ",.02)
 ;;52959-0047-15
 ;;9002226.02101,"729,52959-0047-20 ",.01)
 ;;52959-0047-20
 ;;9002226.02101,"729,52959-0047-20 ",.02)
 ;;52959-0047-20
 ;;9002226.02101,"729,52959-0047-21 ",.01)
 ;;52959-0047-21
 ;;9002226.02101,"729,52959-0047-21 ",.02)
 ;;52959-0047-21
 ;;9002226.02101,"729,52959-0047-25 ",.01)
 ;;52959-0047-25
 ;;9002226.02101,"729,52959-0047-25 ",.02)
 ;;52959-0047-25
 ;;9002226.02101,"729,52959-0047-30 ",.01)
 ;;52959-0047-30
 ;;9002226.02101,"729,52959-0047-30 ",.02)
 ;;52959-0047-30
 ;;9002226.02101,"729,52959-0047-45 ",.01)
 ;;52959-0047-45
 ;;9002226.02101,"729,52959-0047-45 ",.02)
 ;;52959-0047-45
 ;;9002226.02101,"729,52959-0047-50 ",.01)
 ;;52959-0047-50
 ;;9002226.02101,"729,52959-0047-50 ",.02)
 ;;52959-0047-50
 ;;9002226.02101,"729,52959-0047-60 ",.01)
 ;;52959-0047-60
 ;;9002226.02101,"729,52959-0047-60 ",.02)
 ;;52959-0047-60
 ;;9002226.02101,"729,52959-0236-60 ",.01)
 ;;52959-0236-60
 ;;9002226.02101,"729,52959-0236-60 ",.02)
 ;;52959-0236-60
 ;;9002226.02101,"729,52959-0295-30 ",.01)
 ;;52959-0295-30
 ;;9002226.02101,"729,52959-0295-30 ",.02)
 ;;52959-0295-30
 ;;9002226.02101,"729,52959-0295-50 ",.01)
 ;;52959-0295-50
