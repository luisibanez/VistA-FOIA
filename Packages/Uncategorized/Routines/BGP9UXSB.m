BGP9UXSB ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"332,39972-5 ",.02)
 ;;39972-5
 ;;9002226.02101,"332,39973-3 ",.01)
 ;;39973-3
 ;;9002226.02101,"332,39973-3 ",.02)
 ;;39973-3
 ;;9002226.02101,"332,39974-1 ",.01)
 ;;39974-1
 ;;9002226.02101,"332,39974-1 ",.02)
 ;;39974-1
 ;;9002226.02101,"332,39975-8 ",.01)
 ;;39975-8
 ;;9002226.02101,"332,39975-8 ",.02)
 ;;39975-8
 ;;9002226.02101,"332,39976-6 ",.01)
 ;;39976-6
 ;;9002226.02101,"332,39976-6 ",.02)
 ;;39976-6
 ;;9002226.02101,"332,40112-5 ",.01)
 ;;40112-5
 ;;9002226.02101,"332,40112-5 ",.02)
 ;;40112-5
 ;;9002226.02101,"332,40113-3 ",.01)
 ;;40113-3
 ;;9002226.02101,"332,40113-3 ",.02)
 ;;40113-3
 ;;9002226.02101,"332,40114-1 ",.01)
 ;;40114-1
 ;;9002226.02101,"332,40114-1 ",.02)
 ;;40114-1
 ;;9002226.02101,"332,40115-8 ",.01)
 ;;40115-8
 ;;9002226.02101,"332,40115-8 ",.02)
 ;;40115-8
 ;;9002226.02101,"332,40116-6 ",.01)
 ;;40116-6
 ;;9002226.02101,"332,40116-6 ",.02)
 ;;40116-6
 ;;9002226.02101,"332,40117-4 ",.01)
 ;;40117-4
 ;;9002226.02101,"332,40117-4 ",.02)
 ;;40117-4
 ;;9002226.02101,"332,40118-2 ",.01)
 ;;40118-2
 ;;9002226.02101,"332,40118-2 ",.02)
 ;;40118-2
 ;;9002226.02101,"332,40119-0 ",.01)
 ;;40119-0
 ;;9002226.02101,"332,40119-0 ",.02)
 ;;40119-0
 ;;9002226.02101,"332,40120-8 ",.01)
 ;;40120-8
 ;;9002226.02101,"332,40120-8 ",.02)
 ;;40120-8
 ;;9002226.02101,"332,40121-6 ",.01)
 ;;40121-6
 ;;9002226.02101,"332,40121-6 ",.02)
 ;;40121-6
 ;;9002226.02101,"332,40122-4 ",.01)
 ;;40122-4
 ;;9002226.02101,"332,40122-4 ",.02)
 ;;40122-4
 ;;9002226.02101,"332,40123-2 ",.01)
 ;;40123-2
 ;;9002226.02101,"332,40123-2 ",.02)
 ;;40123-2
 ;;9002226.02101,"332,40124-0 ",.01)
 ;;40124-0
 ;;9002226.02101,"332,40124-0 ",.02)
 ;;40124-0
 ;;9002226.02101,"332,40125-7 ",.01)
 ;;40125-7
 ;;9002226.02101,"332,40125-7 ",.02)
 ;;40125-7
 ;;9002226.02101,"332,40126-5 ",.01)
 ;;40126-5
 ;;9002226.02101,"332,40126-5 ",.02)
 ;;40126-5
 ;;9002226.02101,"332,40127-3 ",.01)
 ;;40127-3
 ;;9002226.02101,"332,40127-3 ",.02)
 ;;40127-3
 ;;9002226.02101,"332,40128-1 ",.01)
 ;;40128-1
 ;;9002226.02101,"332,40128-1 ",.02)
 ;;40128-1
 ;;9002226.02101,"332,40248-7 ",.01)
 ;;40248-7
 ;;9002226.02101,"332,40248-7 ",.02)
 ;;40248-7
 ;;9002226.02101,"332,40249-5 ",.01)
 ;;40249-5
 ;;9002226.02101,"332,40249-5 ",.02)
 ;;40249-5
 ;;9002226.02101,"332,40250-3 ",.01)
 ;;40250-3
 ;;9002226.02101,"332,40250-3 ",.02)
 ;;40250-3
 ;;9002226.02101,"332,40251-1 ",.01)
 ;;40251-1
 ;;9002226.02101,"332,40251-1 ",.02)
 ;;40251-1
 ;;9002226.02101,"332,40252-9 ",.01)
 ;;40252-9
 ;;9002226.02101,"332,40252-9 ",.02)
 ;;40252-9
 ;;9002226.02101,"332,40253-7 ",.01)
 ;;40253-7
 ;;9002226.02101,"332,40253-7 ",.02)
 ;;40253-7
 ;;9002226.02101,"332,40254-5 ",.01)
 ;;40254-5
 ;;9002226.02101,"332,40254-5 ",.02)
 ;;40254-5
 ;;9002226.02101,"332,40255-2 ",.01)
 ;;40255-2
 ;;9002226.02101,"332,40255-2 ",.02)
 ;;40255-2
 ;;9002226.02101,"332,40256-0 ",.01)
 ;;40256-0
 ;;9002226.02101,"332,40256-0 ",.02)
 ;;40256-0
 ;;9002226.02101,"332,40257-8 ",.01)
 ;;40257-8
 ;;9002226.02101,"332,40257-8 ",.02)
 ;;40257-8
 ;;9002226.02101,"332,40258-6 ",.01)
 ;;40258-6
 ;;9002226.02101,"332,40258-6 ",.02)
 ;;40258-6
 ;;9002226.02101,"332,40264-4 ",.01)
 ;;40264-4
 ;;9002226.02101,"332,40264-4 ",.02)
 ;;40264-4
 ;;9002226.02101,"332,40265-1 ",.01)
 ;;40265-1
 ;;9002226.02101,"332,40265-1 ",.02)
 ;;40265-1
 ;;9002226.02101,"332,40266-9 ",.01)
 ;;40266-9
 ;;9002226.02101,"332,40266-9 ",.02)
 ;;40266-9
 ;;9002226.02101,"332,40267-7 ",.01)
 ;;40267-7
 ;;9002226.02101,"332,40267-7 ",.02)
 ;;40267-7
 ;;9002226.02101,"332,40268-5 ",.01)
 ;;40268-5
 ;;9002226.02101,"332,40268-5 ",.02)
 ;;40268-5
 ;;9002226.02101,"332,40269-3 ",.01)
 ;;40269-3
 ;;9002226.02101,"332,40269-3 ",.02)
 ;;40269-3
 ;;9002226.02101,"332,40270-1 ",.01)
 ;;40270-1
 ;;9002226.02101,"332,40270-1 ",.02)
 ;;40270-1
 ;;9002226.02101,"332,40271-9 ",.01)
 ;;40271-9
 ;;9002226.02101,"332,40271-9 ",.02)
 ;;40271-9
 ;;9002226.02101,"332,40272-7 ",.01)
 ;;40272-7
 ;;9002226.02101,"332,40272-7 ",.02)
 ;;40272-7
 ;;9002226.02101,"332,40273-5 ",.01)
 ;;40273-5
 ;;9002226.02101,"332,40273-5 ",.02)
 ;;40273-5
 ;;9002226.02101,"332,44784-7 ",.01)
 ;;44784-7
 ;;9002226.02101,"332,44784-7 ",.02)
 ;;44784-7
 ;;9002226.02101,"332,45066-8 ",.01)
 ;;45066-8
 ;;9002226.02101,"332,45066-8 ",.02)
 ;;45066-8
