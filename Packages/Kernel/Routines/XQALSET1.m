XQALSET1 ;ISC-SF.SEA/JLI - SETUP ALERTS (OVERFLOW) ;10/20/03  15:03
 ;;8.0;KERNEL;**285**;Jul 10, 1995
 ;;
 Q
GROUP ; 
 N XQI,XQL,XQL1,XQL2,XQLIST
 S XQL="" F XQI=3:1:$L(XQJ) S XQL1=$E(XQJ,XQI) S:XQL1?1L XQL1=$C($A(XQL1)-32) S XQL=XQL_XQL1
 ;S XQI=$O(^XMB(3.8,"B",XQL,0)) I XQI'>0 S XQL1=$O(^XMB(3.8,"B",XQL)) I $E(XQL1,1,$L(XQL))=XQL S XQL2=$O(^(XQL1)) I $E(XQL2,1,$L(XQL))'=XQL S XQI=$O(^(XQL1,0))
 ;I XQI>0 F XQL=0:0 S XQL=$O(^XMB(3.8,XQI,1,XQL)) Q:XQL'>0  S XQA(+^(XQL,0))=""
 ;  Above code replaced to use Fileman calls, also code added to walk through member groups as well  030203 JLI P285
 S XQI=$$FIND1^DIC(3.8,,"X",XQL) Q:XQI'>0
 N XQLIST D LIST^DIC(3.81,","_XQI_",",".01","I",,,,,,,.XQLIST) I XQLIST("ORDER")>0 D
 . N XQI F XQI=0:0 S XQI=$O(@XQLIST@("ID",XQI)) Q:XQI'>0  S XQA(^(XQI,.01))=""
 . Q
 K @XQLIST,XQLIST D LIST^DIC(3.811,","_XQI_",",".01",,,,,,,,.XQLIST) I XQLIST("ORDER")>0 D
 . N XQI F XQI=0:0 S XQI=$O(@XQLIST@("ID",XQI)) Q:XQI'>0  N XQJ S XQJ="G."_^(XQI,.01) D GROUP
 . Q
 K XQA(XQJ)
 D CHEKACTV(.XQA)
 Q
 ;
 ; Check and remove any entries in array that don't have active surrogates and aren't active
CHEKACTV(XQARRAY) ;
 N XQJ
 F XQJ=0:0 S XQJ=$O(XQARRAY(XQJ)) Q:XQJ'>0  I $$CHEKUSER(XQJ)'>0 K XQARRAY(XQJ)
 Q
 ;
CHEKUSER(XQAUSER) ;SR. Returns 0 if no valid user or surrogate, otherwise returns IEN of user or surrogate
 N VALUE
 S VALUE=$$ACTVSURO^XQALSURO(XQAUSER)
 I VALUE'>0 S VALUE=XQAUSER I '$$ACTIVE^XUSER(XQAUSER) Q 0
 Q VALUE
 ;
