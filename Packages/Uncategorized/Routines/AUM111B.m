AUM111B ; IHS/SD/RNB - ICD 9 E CODES FOR FY 2011 ; [ 09/09/2010  8:30 AM ]
 ;;11.0;TABLE MAINTENANCE;;OCT 15,2010
ICD9ENEW ;;ICD 9, NEW/REVISED E-CODES: CODE#(#.01)^DIAG(#3)^DESC(#10)^Use only w/sex(#9.5)
 ;;E000.2^Volunteer activity^Volunteer activity^^^^
 ;;END
PRNT ;
 S U="^"
 W !," CODE",?10,"DIAGNOSIS",!?10,"DESCRIPTION",!," -----",?10,"-----------"
 NEW X,Y,P2,P3
 F X=1:1 S Y=$P($T(ICD9NEW+X),";;",3),P2=$P(Y,U,2),P3=$P(Y,U,3) Q:Y="END"  W !," ",$P(Y,U,1),?10,$S($L(P3):P3,1:P2),!?10,P2
 Q
