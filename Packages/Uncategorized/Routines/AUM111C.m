AUM111C ;IHS/SD/RNB - ICD 9 CODES FOR FY 2011 ; [ 09/09/2010   8:30 AM ]
 ;;11.0;TABLE MAINTENANCE;;OCT 15,2010
 ;
ICD9REV ;;ICD 9 DIAGNOSIS, MODIFIED CODE TITLES: CODE NUMBER(#.01)^DIAGNOSIS(#3)^DESCRIPTION(#10)^USE ONLY WITH SEX(#9.5)^MDC(#5)^DRG(#60-65)
 ;;307.0^Adt onset fluency disord^Adult onset fluency disorder^^19^887^
 ;;629.81^Recur preg loss w/o curr preg^Recurrent pregnancy loss without current pregnancy^^13^742,743,760,761^
 ;;646.30^Recur pg loss unsp care epi/NA^Recurrent pregnancy loss, unspecified as to episode of care or not applicable^^14^998^
 ;;646.31^Recur pg loss, deliv, antepar^Recurrent pregnancy loss, delivered, with or without mention of antepartum condition^^14^765,766,767,768,774,775^1
 ;;646.33^Recur preg loss, antepar c/c^Recurrent pregnancy loss, antepartum condition or complication^^14^781,782^
 ;;724.02^Spin stenos, lumb w/o neurogen^Spinal stenosis, lumbar region, without neurogenic claudication^^8^551,552^
 ;;781.8^Neurologic neglect syndrome^Neurologic neglect syndrome^^1^91,92,93^1
 ;;E017.0^Roller coaster riding^Roller coaster riding^^^^
 ;;V07.51^Use selectiv estro recep modul^Use of selective estrogen receptor modulators (SERMs)^^23^951^
 ;;V07.52^Use of aromatase inhibitors^Use of aromatase inhibitors^^23^951^
 ;;V07.59^Use oth agents affect estrogen^Use of other agents affecting estrogen receptors and estrogen levels^^23^951^
 ;;V07.8^Oth spec prophylac or tx meas^Other specified prophylactic or treatment measure^^23^951^
 ;;V07.9^Unspe prophylac or tx measure^Unspecified prophylactic or treatment measure^^23^951^
 ;;V13.61^Hx of corrected hypospadias^Personal history of (corrected) hypospadias^^23^951^
 ;;V13.69^Hx oth corr congenital malform^Personal history of other (corrected) congenital malformations^^23^951^
 ;;V26.35^Test male partn of fem pg loss^Encounter for testing of male partner of female with recurrent pregnancy loss^^23^951^
 ;;END
 ;
ICD9OREV ;;ICD 9 DIAGNOSIS, OTHER MODIFIED CODE TITLES: CODE NUMBER(#.01)^DIAGNOSIS(#3)^DESCRIPTION(#10)^USE ONLY WITH SEX(#9.5)^MDC(#5)^DRG(#60-65)^LOWER AGE(#9999999.01)^UPPER AGE(#9999999.02)
 ;;END
ICD0OREV ;;ICD OPERATION/PROCEDURE, OTHER REVISED CODES: CODE NUMBER(#.01)^OPERATION/PROCEDURE(#4)^DESCRIPTION(#10)^MDC(#80.12)-DRG(#80.12,1-6) (Multiple MDCs/DRGs separated by "~")
 ;;END
PRNT ;
 S U="^"
 W !," CODE",?10,"DIAGNOSIS",!?10,"DESCRIPTION",!," -----",?10,"-----------"
 NEW X,Y,P2,P3
 F X=1:1 S Y=$P($T(ICD9NEW+X),";;",3),P2=$P(Y,U,2),P3=$P(Y,U,3) Q:Y="END"  W !," ",$P(Y,U,1),?10,$S($L(P3):P3,1:P2),!?10,P2
 Q
