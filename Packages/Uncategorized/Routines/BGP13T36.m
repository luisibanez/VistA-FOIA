BGP13T36 ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"992,49999-0613-30 ",.02)
 ;;49999-0613-30
 ;;9002226.02101,"992,49999-0618-30 ",.01)
 ;;49999-0618-30
 ;;9002226.02101,"992,49999-0618-30 ",.02)
 ;;49999-0618-30
 ;;9002226.02101,"992,49999-0618-60 ",.01)
 ;;49999-0618-60
 ;;9002226.02101,"992,49999-0618-60 ",.02)
 ;;49999-0618-60
 ;;9002226.02101,"992,49999-0619-30 ",.01)
 ;;49999-0619-30
 ;;9002226.02101,"992,49999-0619-30 ",.02)
 ;;49999-0619-30
 ;;9002226.02101,"992,49999-0619-60 ",.01)
 ;;49999-0619-60
 ;;9002226.02101,"992,49999-0619-60 ",.02)
 ;;49999-0619-60
 ;;9002226.02101,"992,49999-0627-00 ",.01)
 ;;49999-0627-00
 ;;9002226.02101,"992,49999-0627-00 ",.02)
 ;;49999-0627-00
 ;;9002226.02101,"992,49999-0627-30 ",.01)
 ;;49999-0627-30
 ;;9002226.02101,"992,49999-0627-30 ",.02)
 ;;49999-0627-30
 ;;9002226.02101,"992,49999-0627-60 ",.01)
 ;;49999-0627-60
 ;;9002226.02101,"992,49999-0627-60 ",.02)
 ;;49999-0627-60
 ;;9002226.02101,"992,49999-0629-30 ",.01)
 ;;49999-0629-30
 ;;9002226.02101,"992,49999-0629-30 ",.02)
 ;;49999-0629-30
 ;;9002226.02101,"992,49999-0630-30 ",.01)
 ;;49999-0630-30
 ;;9002226.02101,"992,49999-0630-30 ",.02)
 ;;49999-0630-30
 ;;9002226.02101,"992,49999-0631-30 ",.01)
 ;;49999-0631-30
 ;;9002226.02101,"992,49999-0631-30 ",.02)
 ;;49999-0631-30
 ;;9002226.02101,"992,49999-0631-60 ",.01)
 ;;49999-0631-60
 ;;9002226.02101,"992,49999-0631-60 ",.02)
 ;;49999-0631-60
 ;;9002226.02101,"992,49999-0632-00 ",.01)
 ;;49999-0632-00
 ;;9002226.02101,"992,49999-0632-00 ",.02)
 ;;49999-0632-00
 ;;9002226.02101,"992,49999-0632-30 ",.01)
 ;;49999-0632-30
 ;;9002226.02101,"992,49999-0632-30 ",.02)
 ;;49999-0632-30
 ;;9002226.02101,"992,49999-0632-60 ",.01)
 ;;49999-0632-60
 ;;9002226.02101,"992,49999-0632-60 ",.02)
 ;;49999-0632-60
 ;;9002226.02101,"992,49999-0654-00 ",.01)
 ;;49999-0654-00
 ;;9002226.02101,"992,49999-0654-00 ",.02)
 ;;49999-0654-00
 ;;9002226.02101,"992,49999-0654-30 ",.01)
 ;;49999-0654-30
 ;;9002226.02101,"992,49999-0654-30 ",.02)
 ;;49999-0654-30
 ;;9002226.02101,"992,49999-0690-30 ",.01)
 ;;49999-0690-30
 ;;9002226.02101,"992,49999-0690-30 ",.02)
 ;;49999-0690-30
 ;;9002226.02101,"992,49999-0774-30 ",.01)
 ;;49999-0774-30
 ;;9002226.02101,"992,49999-0774-30 ",.02)
 ;;49999-0774-30
 ;;9002226.02101,"992,49999-0774-60 ",.01)
 ;;49999-0774-60
 ;;9002226.02101,"992,49999-0774-60 ",.02)
 ;;49999-0774-60
 ;;9002226.02101,"992,49999-0774-90 ",.01)
 ;;49999-0774-90
 ;;9002226.02101,"992,49999-0774-90 ",.02)
 ;;49999-0774-90
 ;;9002226.02101,"992,49999-0776-30 ",.01)
 ;;49999-0776-30
 ;;9002226.02101,"992,49999-0776-30 ",.02)
 ;;49999-0776-30
 ;;9002226.02101,"992,49999-0776-50 ",.01)
 ;;49999-0776-50
 ;;9002226.02101,"992,49999-0776-50 ",.02)
 ;;49999-0776-50
 ;;9002226.02101,"992,49999-0780-30 ",.01)
 ;;49999-0780-30
 ;;9002226.02101,"992,49999-0780-30 ",.02)
 ;;49999-0780-30
 ;;9002226.02101,"992,49999-0789-30 ",.01)
 ;;49999-0789-30
 ;;9002226.02101,"992,49999-0789-30 ",.02)
 ;;49999-0789-30
 ;;9002226.02101,"992,49999-0789-60 ",.01)
 ;;49999-0789-60
 ;;9002226.02101,"992,49999-0789-60 ",.02)
 ;;49999-0789-60
 ;;9002226.02101,"992,49999-0789-90 ",.01)
 ;;49999-0789-90
 ;;9002226.02101,"992,49999-0789-90 ",.02)
 ;;49999-0789-90
 ;;9002226.02101,"992,49999-0828-30 ",.01)
 ;;49999-0828-30
 ;;9002226.02101,"992,49999-0828-30 ",.02)
 ;;49999-0828-30
 ;;9002226.02101,"992,49999-0860-30 ",.01)
 ;;49999-0860-30
 ;;9002226.02101,"992,49999-0860-30 ",.02)
 ;;49999-0860-30
 ;;9002226.02101,"992,49999-0860-60 ",.01)
 ;;49999-0860-60
 ;;9002226.02101,"992,49999-0860-60 ",.02)
 ;;49999-0860-60
 ;;9002226.02101,"992,49999-0861-30 ",.01)
 ;;49999-0861-30
 ;;9002226.02101,"992,49999-0861-30 ",.02)
 ;;49999-0861-30
 ;;9002226.02101,"992,49999-0861-60 ",.01)
 ;;49999-0861-60
 ;;9002226.02101,"992,49999-0861-60 ",.02)
 ;;49999-0861-60
 ;;9002226.02101,"992,49999-0861-90 ",.01)
 ;;49999-0861-90
 ;;9002226.02101,"992,49999-0861-90 ",.02)
 ;;49999-0861-90
 ;;9002226.02101,"992,49999-0886-30 ",.01)
 ;;49999-0886-30
 ;;9002226.02101,"992,49999-0886-30 ",.02)
 ;;49999-0886-30
 ;;9002226.02101,"992,49999-0909-00 ",.01)
 ;;49999-0909-00
 ;;9002226.02101,"992,49999-0909-00 ",.02)
 ;;49999-0909-00
 ;;9002226.02101,"992,49999-0909-30 ",.01)
 ;;49999-0909-30
 ;;9002226.02101,"992,49999-0909-30 ",.02)
 ;;49999-0909-30
 ;;9002226.02101,"992,49999-0913-30 ",.01)
 ;;49999-0913-30
 ;;9002226.02101,"992,49999-0913-30 ",.02)
 ;;49999-0913-30
 ;;9002226.02101,"992,49999-0915-90 ",.01)
 ;;49999-0915-90
 ;;9002226.02101,"992,49999-0915-90 ",.02)
 ;;49999-0915-90
 ;;9002226.02101,"992,49999-0918-30 ",.01)
 ;;49999-0918-30
 ;;9002226.02101,"992,49999-0918-30 ",.02)
 ;;49999-0918-30
 ;;9002226.02101,"992,49999-0965-30 ",.01)
 ;;49999-0965-30
 ;;9002226.02101,"992,49999-0965-30 ",.02)
 ;;49999-0965-30
 ;;9002226.02101,"992,49999-0965-60 ",.01)
 ;;49999-0965-60
 ;;9002226.02101,"992,49999-0965-60 ",.02)
 ;;49999-0965-60
 ;;9002226.02101,"992,50111-0433-01 ",.01)
 ;;50111-0433-01
 ;;9002226.02101,"992,50111-0433-01 ",.02)
 ;;50111-0433-01
 ;;9002226.02101,"992,50111-0433-02 ",.01)
 ;;50111-0433-02
 ;;9002226.02101,"992,50111-0433-02 ",.02)
 ;;50111-0433-02
 ;;9002226.02101,"992,50111-0433-03 ",.01)
 ;;50111-0433-03
 ;;9002226.02101,"992,50111-0433-03 ",.02)
 ;;50111-0433-03
 ;;9002226.02101,"992,50111-0434-01 ",.01)
 ;;50111-0434-01
 ;;9002226.02101,"992,50111-0434-01 ",.02)
 ;;50111-0434-01
 ;;9002226.02101,"992,50111-0434-02 ",.01)
 ;;50111-0434-02
 ;;9002226.02101,"992,50111-0434-02 ",.02)
 ;;50111-0434-02
 ;;9002226.02101,"992,50111-0434-03 ",.01)
 ;;50111-0434-03
 ;;9002226.02101,"992,50111-0434-03 ",.02)
 ;;50111-0434-03
 ;;9002226.02101,"992,50111-0441-01 ",.01)
 ;;50111-0441-01
 ;;9002226.02101,"992,50111-0441-01 ",.02)
 ;;50111-0441-01
 ;;9002226.02101,"992,50111-0441-02 ",.01)
 ;;50111-0441-02
 ;;9002226.02101,"992,50111-0441-02 ",.02)
 ;;50111-0441-02
 ;;9002226.02101,"992,50111-0523-03 ",.01)
 ;;50111-0523-03
 ;;9002226.02101,"992,50111-0523-03 ",.02)
 ;;50111-0523-03
 ;;9002226.02101,"992,50111-0524-03 ",.01)
 ;;50111-0524-03
 ;;9002226.02101,"992,50111-0524-03 ",.02)
 ;;50111-0524-03
 ;;9002226.02101,"992,50111-0647-01 ",.01)
 ;;50111-0647-01
 ;;9002226.02101,"992,50111-0647-01 ",.02)
 ;;50111-0647-01
 ;;9002226.02101,"992,50111-0647-02 ",.01)
 ;;50111-0647-02
 ;;9002226.02101,"992,50111-0647-02 ",.02)
 ;;50111-0647-02
 ;;9002226.02101,"992,50111-0647-03 ",.01)
 ;;50111-0647-03
 ;;9002226.02101,"992,50111-0647-03 ",.02)
 ;;50111-0647-03
 ;;9002226.02101,"992,50111-0648-01 ",.01)
 ;;50111-0648-01
 ;;9002226.02101,"992,50111-0648-01 ",.02)
 ;;50111-0648-01
 ;;9002226.02101,"992,50111-0648-02 ",.01)
 ;;50111-0648-02
 ;;9002226.02101,"992,50111-0648-02 ",.02)
 ;;50111-0648-02
 ;;9002226.02101,"992,50111-0648-03 ",.01)
 ;;50111-0648-03
 ;;9002226.02101,"992,50111-0648-03 ",.02)
 ;;50111-0648-03
 ;;9002226.02101,"992,50111-0648-10 ",.01)
 ;;50111-0648-10
 ;;9002226.02101,"992,50111-0648-10 ",.02)
 ;;50111-0648-10
 ;;9002226.02101,"992,50111-0648-44 ",.01)
 ;;50111-0648-44
 ;;9002226.02101,"992,50111-0648-44 ",.02)
 ;;50111-0648-44
 ;;9002226.02101,"992,50111-0930-10 ",.01)
 ;;50111-0930-10
 ;;9002226.02101,"992,50111-0930-10 ",.02)
 ;;50111-0930-10
 ;;9002226.02101,"992,50111-0931-01 ",.01)
 ;;50111-0931-01
 ;;9002226.02101,"992,50111-0931-01 ",.02)
 ;;50111-0931-01
 ;;9002226.02101,"992,50111-0931-02 ",.01)
 ;;50111-0931-02
 ;;9002226.02101,"992,50111-0931-02 ",.02)
 ;;50111-0931-02
 ;;9002226.02101,"992,50111-0931-10 ",.01)
 ;;50111-0931-10
 ;;9002226.02101,"992,50111-0931-10 ",.02)
 ;;50111-0931-10
 ;;9002226.02101,"992,50111-0932-01 ",.01)
 ;;50111-0932-01
 ;;9002226.02101,"992,50111-0932-01 ",.02)
 ;;50111-0932-01
 ;;9002226.02101,"992,50111-0932-02 ",.01)
 ;;50111-0932-02
 ;;9002226.02101,"992,50111-0932-02 ",.02)
 ;;50111-0932-02
 ;;9002226.02101,"992,50111-0932-10 ",.01)
 ;;50111-0932-10
 ;;9002226.02101,"992,50111-0932-10 ",.02)
 ;;50111-0932-10
 ;;9002226.02101,"992,50962-0500-60 ",.01)
 ;;50962-0500-60
 ;;9002226.02101,"992,50962-0500-60 ",.02)
 ;;50962-0500-60
 ;;9002226.02101,"992,51079-0086-01 ",.01)
 ;;51079-0086-01
 ;;9002226.02101,"992,51079-0086-01 ",.02)
 ;;51079-0086-01
 ;;9002226.02101,"992,51079-0086-20 ",.01)
 ;;51079-0086-20
 ;;9002226.02101,"992,51079-0086-20 ",.02)
 ;;51079-0086-20
 ;;9002226.02101,"992,51079-0086-30 ",.01)
 ;;51079-0086-30
 ;;9002226.02101,"992,51079-0086-30 ",.02)
 ;;51079-0086-30
 ;;9002226.02101,"992,51079-0086-56 ",.01)
 ;;51079-0086-56
 ;;9002226.02101,"992,51079-0086-56 ",.02)
 ;;51079-0086-56
 ;;9002226.02101,"992,51079-0087-01 ",.01)
 ;;51079-0087-01
 ;;9002226.02101,"992,51079-0087-01 ",.02)
 ;;51079-0087-01
 ;;9002226.02101,"992,51079-0087-20 ",.01)
 ;;51079-0087-20
 ;;9002226.02101,"992,51079-0087-20 ",.02)
 ;;51079-0087-20
 ;;9002226.02101,"992,51079-0087-30 ",.01)
 ;;51079-0087-30
 ;;9002226.02101,"992,51079-0087-30 ",.02)
 ;;51079-0087-30
 ;;9002226.02101,"992,51079-0087-56 ",.01)
 ;;51079-0087-56
 ;;9002226.02101,"992,51079-0087-56 ",.02)
 ;;51079-0087-56
 ;;9002226.02101,"992,51079-0088-01 ",.01)
 ;;51079-0088-01
 ;;9002226.02101,"992,51079-0088-01 ",.02)
 ;;51079-0088-01
 ;;9002226.02101,"992,51079-0088-20 ",.01)
 ;;51079-0088-20
 ;;9002226.02101,"992,51079-0088-20 ",.02)
 ;;51079-0088-20
 ;;9002226.02101,"992,51079-0088-56 ",.01)
 ;;51079-0088-56
 ;;9002226.02101,"992,51079-0088-56 ",.02)
 ;;51079-0088-56
 ;;9002226.02101,"992,51079-0107-01 ",.01)
 ;;51079-0107-01
 ;;9002226.02101,"992,51079-0107-01 ",.02)
 ;;51079-0107-01
 ;;9002226.02101,"992,51079-0107-19 ",.01)
 ;;51079-0107-19
 ;;9002226.02101,"992,51079-0107-19 ",.02)
 ;;51079-0107-19
 ;;9002226.02101,"992,51079-0107-20 ",.01)
 ;;51079-0107-20
 ;;9002226.02101,"992,51079-0107-20 ",.02)
 ;;51079-0107-20
 ;;9002226.02101,"992,51079-0107-63 ",.01)
 ;;51079-0107-63
 ;;9002226.02101,"992,51079-0107-63 ",.02)
 ;;51079-0107-63
 ;;9002226.02101,"992,51079-0131-01 ",.01)
 ;;51079-0131-01
 ;;9002226.02101,"992,51079-0131-01 ",.02)
 ;;51079-0131-01
 ;;9002226.02101,"992,51079-0131-20 ",.01)
 ;;51079-0131-20
 ;;9002226.02101,"992,51079-0131-20 ",.02)
 ;;51079-0131-20
 ;;9002226.02101,"992,51079-0131-63 ",.01)
 ;;51079-0131-63
 ;;9002226.02101,"992,51079-0131-63 ",.02)
 ;;51079-0131-63
 ;;9002226.02101,"992,51079-0133-01 ",.01)
 ;;51079-0133-01
 ;;9002226.02101,"992,51079-0133-01 ",.02)
 ;;51079-0133-01
 ;;9002226.02101,"992,51079-0133-20 ",.01)
 ;;51079-0133-20
 ;;9002226.02101,"992,51079-0133-20 ",.02)
 ;;51079-0133-20
 ;;9002226.02101,"992,51079-0133-63 ",.01)
 ;;51079-0133-63
 ;;9002226.02101,"992,51079-0133-63 ",.02)
 ;;51079-0133-63
 ;;9002226.02101,"992,51079-0147-01 ",.01)
 ;;51079-0147-01
 ;;9002226.02101,"992,51079-0147-01 ",.02)
 ;;51079-0147-01
 ;;9002226.02101,"992,51079-0147-20 ",.01)
 ;;51079-0147-20
 ;;9002226.02101,"992,51079-0147-20 ",.02)
 ;;51079-0147-20
 ;;9002226.02101,"992,51079-0391-20 ",.01)
 ;;51079-0391-20
 ;;9002226.02101,"992,51079-0391-20 ",.02)
 ;;51079-0391-20
 ;;9002226.02101,"992,51079-0392-01 ",.01)
 ;;51079-0392-01
 ;;9002226.02101,"992,51079-0392-01 ",.02)
 ;;51079-0392-01
 ;;9002226.02101,"992,51079-0392-20 ",.01)
 ;;51079-0392-20
 ;;9002226.02101,"992,51079-0392-20 ",.02)
 ;;51079-0392-20
 ;;9002226.02101,"992,51079-0427-01 ",.01)
 ;;51079-0427-01
 ;;9002226.02101,"992,51079-0427-01 ",.02)
 ;;51079-0427-01
 ;;9002226.02101,"992,51079-0427-19 ",.01)
 ;;51079-0427-19
 ;;9002226.02101,"992,51079-0427-19 ",.02)
 ;;51079-0427-19
 ;;9002226.02101,"992,51079-0427-20 ",.01)
 ;;51079-0427-20
 ;;9002226.02101,"992,51079-0427-20 ",.02)
 ;;51079-0427-20
 ;;9002226.02101,"992,51079-0428-01 ",.01)
 ;;51079-0428-01
 ;;9002226.02101,"992,51079-0428-01 ",.02)
 ;;51079-0428-01
 ;;9002226.02101,"992,51079-0428-19 ",.01)
 ;;51079-0428-19
 ;;9002226.02101,"992,51079-0428-19 ",.02)
 ;;51079-0428-19
 ;;9002226.02101,"992,51079-0428-20 ",.01)
 ;;51079-0428-20
 ;;9002226.02101,"992,51079-0428-20 ",.02)
 ;;51079-0428-20
 ;;9002226.02101,"992,51079-0436-01 ",.01)
 ;;51079-0436-01
 ;;9002226.02101,"992,51079-0436-01 ",.02)
 ;;51079-0436-01
 ;;9002226.02101,"992,51079-0436-20 ",.01)
 ;;51079-0436-20
 ;;9002226.02101,"992,51079-0436-20 ",.02)
 ;;51079-0436-20
 ;;9002226.02101,"992,51079-0437-01 ",.01)
 ;;51079-0437-01
 ;;9002226.02101,"992,51079-0437-01 ",.02)
 ;;51079-0437-01
 ;;9002226.02101,"992,51079-0437-20 ",.01)
 ;;51079-0437-20
 ;;9002226.02101,"992,51079-0437-20 ",.02)
 ;;51079-0437-20
 ;;9002226.02101,"992,51079-0438-01 ",.01)
 ;;51079-0438-01
 ;;9002226.02101,"992,51079-0438-01 ",.02)
 ;;51079-0438-01
