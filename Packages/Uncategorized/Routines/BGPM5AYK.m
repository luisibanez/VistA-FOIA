BGPM5AYK ;IHS/MSC/SAT-CREATED BY ^ATXSTX ON AUG 31, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;;BGPMU CONTRACEPTIVE EDU
 ;
 ; This routine loads Taxonomy BGPMU CONTRACEPTIVE EDU
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
 ;;21,"FP-ABST ")
 ;;1
 ;;21,"FP-DPH ")
 ;;3
 ;;21,"FP-DPO ")
 ;;2
 ;;21,"FP-EC ")
 ;;4
 ;;21,"FP-FC ")
 ;;5
 ;;21,"FP-FU ")
 ;;6
 ;;21,"FP-HPDP ")
 ;;7
 ;;21,"FP-HY ")
 ;;8
 ;;21,"FP-IC ")
 ;;9
 ;;21,"FP-IR ")
 ;;10
 ;;21,"FP-IUD ")
 ;;11
 ;;21,"FP-L ")
 ;;12
 ;;21,"FP-M ")
 ;;13
 ;;21,"FP-MT ")
 ;;14
 ;;21,"FP-OC ")
 ;;15
 ;;21,"FP-PCC ")
 ;;16
 ;;21,"FP-ST ")
 ;;17
 ;;21,"FP-TD ")
 ;;19
 ;;21,"FP-TE ")
 ;;18
 ;;9002226,1023,.01)
 ;;BGPMU CONTRACEPTIVE EDU
 ;;9002226,1023,.02)
 ;;EDU CODES FOR CONTRACEPTIVES
 ;;9002226,1023,.04)
 ;;@
 ;;9002226,1023,.06)
 ;;@
 ;;9002226,1023,.08)
 ;;@
 ;;9002226,1023,.09)
 ;;3110824
 ;;9002226,1023,.11)
 ;;@
 ;;9002226,1023,.12)
 ;;@
 ;;9002226,1023,.13)
 ;;@
 ;;9002226,1023,.14)
 ;;@
 ;;9002226,1023,.15)
 ;;9999999.09
 ;;9002226,1023,.16)
 ;;1
 ;;9002226,1023,.17)
 ;;@
 ;;9002226,1023,3101)
 ;;@
 ;;9002226.02101,"1023,FP-ABST ",.01)
 ;;FP-ABST
 ;;9002226.02101,"1023,FP-ABST ",.02)
 ;;FP-ABST
 ;;9002226.02101,"1023,FP-DPH ",.01)
 ;;FP-DPH
 ;;9002226.02101,"1023,FP-DPH ",.02)
 ;;FP-DPH
 ;;9002226.02101,"1023,FP-DPO ",.01)
 ;;FP-DPO
 ;;9002226.02101,"1023,FP-DPO ",.02)
 ;;FP-DPO
 ;;9002226.02101,"1023,FP-EC ",.01)
 ;;FP-EC
 ;;9002226.02101,"1023,FP-EC ",.02)
 ;;FP-EC
 ;;9002226.02101,"1023,FP-FC ",.01)
 ;;FP-FC
 ;;9002226.02101,"1023,FP-FC ",.02)
 ;;FP-FC
 ;;9002226.02101,"1023,FP-FU ",.01)
 ;;FP-FU
 ;;9002226.02101,"1023,FP-FU ",.02)
 ;;FP-FU
 ;;9002226.02101,"1023,FP-HPDP ",.01)
 ;;FP-HPDP
 ;;9002226.02101,"1023,FP-HPDP ",.02)
 ;;FP-HPDP
 ;;9002226.02101,"1023,FP-HY ",.01)
 ;;FP-HY
 ;;9002226.02101,"1023,FP-HY ",.02)
 ;;FP-HY
 ;;9002226.02101,"1023,FP-IC ",.01)
 ;;FP-IC
 ;;9002226.02101,"1023,FP-IC ",.02)
 ;;FP-IC
 ;;9002226.02101,"1023,FP-IR ",.01)
 ;;FP-IR
 ;;9002226.02101,"1023,FP-IR ",.02)
 ;;FP-IR
 ;;9002226.02101,"1023,FP-IUD ",.01)
 ;;FP-IUD
 ;;9002226.02101,"1023,FP-IUD ",.02)
 ;;FP-IUD
 ;;9002226.02101,"1023,FP-L ",.01)
 ;;FP-L
 ;;9002226.02101,"1023,FP-L ",.02)
 ;;FP-L
 ;;9002226.02101,"1023,FP-M ",.01)
 ;;FP-M
 ;;9002226.02101,"1023,FP-M ",.02)
 ;;FP-M
 ;;9002226.02101,"1023,FP-MT ",.01)
 ;;FP-MT
 ;;9002226.02101,"1023,FP-MT ",.02)
 ;;FP-MT
 ;;9002226.02101,"1023,FP-OC ",.01)
 ;;FP-OC
 ;;9002226.02101,"1023,FP-OC ",.02)
 ;;FP-OC
 ;;9002226.02101,"1023,FP-PCC ",.01)
 ;;FP-PCC
 ;;9002226.02101,"1023,FP-PCC ",.02)
 ;;FP-PCC
 ;;9002226.02101,"1023,FP-ST ",.01)
 ;;FP-ST
 ;;9002226.02101,"1023,FP-ST ",.02)
 ;;FP-ST
 ;;9002226.02101,"1023,FP-TD ",.01)
 ;;FP-TD
 ;;9002226.02101,"1023,FP-TD ",.02)
 ;;FP-TD
 ;;9002226.02101,"1023,FP-TE ",.01)
 ;;FP-TE
 ;;9002226.02101,"1023,FP-TE ",.02)
 ;;FP-TE
 ;
OTHER ; OTHER ROUTINES
 Q
