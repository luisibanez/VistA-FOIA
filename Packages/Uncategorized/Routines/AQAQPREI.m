AQAQPREI ;CREATED BY AUBPI ON NOV 6,1989
 ;1.1
 K ^UTILITY("AUDSET",$J) F AUBPI=1:1 S AUBPIX=$P($T(Q+AUBPI),";;",2) Q:AUBPIX=""  S AUBPIY=$P(AUBPIX,"=",2,99),AUBPIX=$P(AUBPIX,"=",1) S @AUBPIX=AUBPIY
 K AUBPI,AUBPIX,AUBPIY D EN2^%AUKD
Q Q
 ;;^UTILITY("AUDSET",$J,9002155)=S^S
 ;;^UTILITY("AUDSET",$J,9002156)=S^S