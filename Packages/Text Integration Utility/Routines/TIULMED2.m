TIULMED2 ; SLC/JMH - used for transition to pharmacy APIs ;4/5/2005 [6/27/05 10:51am]
 ;;1.0;TEXT INTEGRATION UTILITIES;**193,197**;Jun 20, 1997
 ;
IENNAME(NAME) ; 
 N LIST,OUT
 S LIST="TIULMED"
 D ARWS^PSS50("",NAME,LIST)
 S OUT=$O(^TMP($J,LIST,"B",NAME,""))
 K ^TMP($J,LIST)
 Q OUT
DRGIEN(IEN) ;
 N LIST,OUT
 S LIST="TIULMED"
 D ZERO^PSS52P6(IEN,"","",LIST)
 S OUT=+$G(^TMP($J,LIST,1,1))
 K ^TMP($J,LIST)
 Q OUT
DRGCLASS(IEN) ;
 N LIST,OUT
 S LIST="TIULMED"
 D ZERO^PSS50(IEN,"","","","",LIST)
 S OUT=$G(^TMP($J,LIST,IEN,2))
 K ^TMP($J,LIST)
 Q OUT
DEA(IEN) ;
 N LIST,OUT
 S LIST="TIULMED"
 D ZERO^PSS50(IEN,"","","","",LIST)
 S OUT=$G(^TMP($J,LIST,IEN,3))
 K ^TMP($J,LIST)
 Q OUT
