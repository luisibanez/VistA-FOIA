BGP9SXAL ; IHS/CMI/LAB - AB-CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"723,53014-0903-71 ",.02)
 ;;53014-0903-71
 ;;9002226.02101,"723,53014-0903-84 ",.01)
 ;;53014-0903-84
 ;;9002226.02101,"723,53014-0903-84 ",.02)
 ;;53014-0903-84
 ;;9002226.02101,"723,53014-0904-71 ",.01)
 ;;53014-0904-71
 ;;9002226.02101,"723,53014-0904-71 ",.02)
 ;;53014-0904-71
 ;;9002226.02101,"723,53014-0904-84 ",.01)
 ;;53014-0904-84
 ;;9002226.02101,"723,53014-0904-84 ",.02)
 ;;53014-0904-84
 ;;9002226.02101,"723,53265-0253-10 ",.01)
 ;;53265-0253-10
 ;;9002226.02101,"723,53265-0253-10 ",.02)
 ;;53265-0253-10
 ;;9002226.02101,"723,53265-0253-11 ",.01)
 ;;53265-0253-11
 ;;9002226.02101,"723,53265-0253-11 ",.02)
 ;;53265-0253-11
 ;;9002226.02101,"723,53265-0254-10 ",.01)
 ;;53265-0254-10
 ;;9002226.02101,"723,53265-0254-10 ",.02)
 ;;53265-0254-10
 ;;9002226.02101,"723,53265-0254-11 ",.01)
 ;;53265-0254-11
 ;;9002226.02101,"723,53265-0254-11 ",.02)
 ;;53265-0254-11
 ;;9002226.02101,"723,53265-0255-10 ",.01)
 ;;53265-0255-10
 ;;9002226.02101,"723,53265-0255-10 ",.02)
 ;;53265-0255-10
 ;;9002226.02101,"723,53265-0257-10 ",.01)
 ;;53265-0257-10
 ;;9002226.02101,"723,53265-0257-10 ",.02)
 ;;53265-0257-10
 ;;9002226.02101,"723,53265-0257-11 ",.01)
 ;;53265-0257-11
 ;;9002226.02101,"723,53265-0257-11 ",.02)
 ;;53265-0257-11
 ;;9002226.02101,"723,53265-0257-40 ",.01)
 ;;53265-0257-40
 ;;9002226.02101,"723,53265-0257-40 ",.02)
 ;;53265-0257-40
 ;;9002226.02101,"723,53265-0258-10 ",.01)
 ;;53265-0258-10
 ;;9002226.02101,"723,53265-0258-10 ",.02)
 ;;53265-0258-10
 ;;9002226.02101,"723,53265-0258-11 ",.01)
 ;;53265-0258-11
 ;;9002226.02101,"723,53265-0258-11 ",.02)
 ;;53265-0258-11
 ;;9002226.02101,"723,53265-0259-10 ",.01)
 ;;53265-0259-10
 ;;9002226.02101,"723,53265-0259-10 ",.02)
 ;;53265-0259-10
 ;;9002226.02101,"723,53265-0262-10 ",.01)
 ;;53265-0262-10
 ;;9002226.02101,"723,53265-0262-10 ",.02)
 ;;53265-0262-10
 ;;9002226.02101,"723,53265-0346-10 ",.01)
 ;;53265-0346-10
 ;;9002226.02101,"723,53265-0346-10 ",.02)
 ;;53265-0346-10
 ;;9002226.02101,"723,53265-0346-11 ",.01)
 ;;53265-0346-11
 ;;9002226.02101,"723,53265-0346-11 ",.02)
 ;;53265-0346-11
 ;;9002226.02101,"723,53265-0396-10 ",.01)
 ;;53265-0396-10
 ;;9002226.02101,"723,53265-0396-10 ",.02)
 ;;53265-0396-10
 ;;9002226.02101,"723,53489-0406-01 ",.01)
 ;;53489-0406-01
 ;;9002226.02101,"723,53489-0406-01 ",.02)
 ;;53489-0406-01
 ;;9002226.02101,"723,53489-0406-10 ",.01)
 ;;53489-0406-10
 ;;9002226.02101,"723,53489-0406-10 ",.02)
 ;;53489-0406-10
 ;;9002226.02101,"723,53489-0433-01 ",.01)
 ;;53489-0433-01
 ;;9002226.02101,"723,53489-0433-01 ",.02)
 ;;53489-0433-01
 ;;9002226.02101,"723,53489-0433-10 ",.01)
 ;;53489-0433-10
 ;;9002226.02101,"723,53489-0433-10 ",.02)
 ;;53489-0433-10
 ;;9002226.02101,"723,53489-0564-01 ",.01)
 ;;53489-0564-01
 ;;9002226.02101,"723,53489-0564-01 ",.02)
 ;;53489-0564-01
 ;;9002226.02101,"723,53489-0565-01 ",.01)
 ;;53489-0565-01
 ;;9002226.02101,"723,53489-0565-01 ",.02)
 ;;53489-0565-01
 ;;9002226.02101,"723,53489-0566-01 ",.01)
 ;;53489-0566-01
 ;;9002226.02101,"723,53489-0566-01 ",.02)
 ;;53489-0566-01
 ;;9002226.02101,"723,53489-0567-01 ",.01)
 ;;53489-0567-01
 ;;9002226.02101,"723,53489-0567-01 ",.02)
 ;;53489-0567-01
 ;;9002226.02101,"723,53489-0568-01 ",.01)
 ;;53489-0568-01
 ;;9002226.02101,"723,53489-0568-01 ",.02)
 ;;53489-0568-01
 ;;9002226.02101,"723,53489-0569-01 ",.01)
 ;;53489-0569-01
 ;;9002226.02101,"723,53489-0569-01 ",.02)
 ;;53489-0569-01
 ;;9002226.02101,"723,53489-0570-01 ",.01)
 ;;53489-0570-01
 ;;9002226.02101,"723,53489-0570-01 ",.02)
 ;;53489-0570-01
 ;;9002226.02101,"723,54092-0371-01 ",.01)
 ;;54092-0371-01
 ;;9002226.02101,"723,54092-0371-01 ",.02)
 ;;54092-0371-01
 ;;9002226.02101,"723,54092-0372-01 ",.01)
 ;;54092-0372-01
 ;;9002226.02101,"723,54092-0372-01 ",.02)
 ;;54092-0372-01
 ;;9002226.02101,"723,54092-0373-01 ",.01)
 ;;54092-0373-01
 ;;9002226.02101,"723,54092-0373-01 ",.02)
 ;;54092-0373-01
 ;;9002226.02101,"723,54092-0374-01 ",.01)
 ;;54092-0374-01
 ;;9002226.02101,"723,54092-0374-01 ",.02)
 ;;54092-0374-01
 ;;9002226.02101,"723,54092-0375-01 ",.01)
 ;;54092-0375-01
 ;;9002226.02101,"723,54092-0375-01 ",.02)
 ;;54092-0375-01
 ;;9002226.02101,"723,54092-0376-01 ",.01)
 ;;54092-0376-01
 ;;9002226.02101,"723,54092-0376-01 ",.02)
 ;;54092-0376-01
 ;;9002226.02101,"723,54092-0377-01 ",.01)
 ;;54092-0377-01
 ;;9002226.02101,"723,54092-0377-01 ",.02)
 ;;54092-0377-01
 ;;9002226.02101,"723,54092-0381-01 ",.01)
 ;;54092-0381-01
 ;;9002226.02101,"723,54092-0381-01 ",.02)
 ;;54092-0381-01
 ;;9002226.02101,"723,54092-0383-01 ",.01)
 ;;54092-0383-01
 ;;9002226.02101,"723,54092-0383-01 ",.02)
 ;;54092-0383-01
 ;;9002226.02101,"723,54092-0385-01 ",.01)
 ;;54092-0385-01
 ;;9002226.02101,"723,54092-0385-01 ",.02)
 ;;54092-0385-01
 ;;9002226.02101,"723,54092-0387-01 ",.01)
 ;;54092-0387-01
 ;;9002226.02101,"723,54092-0387-01 ",.02)
 ;;54092-0387-01
 ;;9002226.02101,"723,54092-0389-01 ",.01)
 ;;54092-0389-01
 ;;9002226.02101,"723,54092-0389-01 ",.02)
 ;;54092-0389-01
 ;;9002226.02101,"723,54092-0391-01 ",.01)
 ;;54092-0391-01
 ;;9002226.02101,"723,54092-0391-01 ",.02)
 ;;54092-0391-01
 ;;9002226.02101,"723,54092-0448-01 ",.01)
 ;;54092-0448-01
