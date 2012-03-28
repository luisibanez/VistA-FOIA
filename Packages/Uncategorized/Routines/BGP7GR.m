BGP7GR ; IHS/CMI/LAB - BGPG Visual CRS Reports 12/30/2004 12:29:35 PM 27 Apr 2007 10:30 PM ; 
 ;;8.0;IHS CLINICAL REPORTING;;MAR 25, 2008
 ;
DEBUG(RETVAL,BGPSTR) ;
 D DEBUG^%Serenji("HED^BGP7GR(.RETVAL,.BGPSTR)")
 Q
 ;
NTL(RETVAL,BGPSTR) ;-- queue National GPRA Report
 S X="MERR^BGP7GU",@^%ZOSF("TRAP") ; m error trap
 N BGPI,BGPJ,BGPDATA,BGPDA,P,BGPERR,BGPCT,BGPYN,BGPOT,BGPOPT,BGPRT,R
 S P="|",R="~"
 S BGPI=0
 S BGPERR=""
 S BGPCT=$P($P(BGPSTR,P),R)
 I $P(BGPCT,R)'?.N S BGPCT=$O(^ATXAX("B",BGPCT,0))
 S BGPYN=$P(BGPSTR,P,2)
 S BGPOT=$P(BGPSTR,P,3)
 S BGPOPT=$P(BGPSTR,P,4)
 S BGPRT=$P(BGPSTR,P,5)
 S BGPMFITI=$P(BGPSTR,P,6)
 S BGPYWCHW=$P(BGPSTR,P,7)
 S BGPONEF=$P(BGPSTR,P,8)  ;added for 07
 K ^BGPTMP($J)
 S RETVAL="^BGPTMP("_$J_")"
 S ^BGPTMP($J,BGPI)="T00250DATA"_$C(30)
 D EP^BGP7GNTL(.BGPERR,DUZ,DUZ(2),BGPOPT,BGPCT,BGPYN,BGPOT,BGPRT,BGPMFITI,BGPYWCHW,BGPONEF)
 S BGPI=BGPI+1
 S ^BGPTMP($J,BGPI)=+$G(BGPERR)_$C(30)
 S ^BGPTMP($J,BGPI+1)=$C(31)
 D EN^XBVK("BGP")
 Q
 ;
NPL(RETVAL,BGPSTR) ;-- queue national patient lists
 S X="MERR^BGP7GU",@^%ZOSF("TRAP") ; m error trap
 N BGPI,BGPJ,BGPDATA,BGPDA,P,BGPERR,BGPCT,BGPDT,BGPOT,BGPOPT,BGPRT,BGPPIEN,BGPPRV,BGPQTR,BGPLST,R,BGPIND,BGPINDL
 S P="|",R="~"
 S BGPI=0
 S BGPERR=""
 I $G(BGPSTR)="" D CATSTR(.BGPSTR,.BGPSTR)
 S BGPCT=$P($P(BGPSTR,P),R)
 I $P(BGPCT,R)'?.N S BGPCT=$O(^ATXAX("B",BGPCT,0))
 ;S BGPCT=$O(^ATXAX("B",BGPCT,0))
 S BGPDT=$P(BGPSTR,P,2)
 S BGPPIEN=$P($P(BGPSTR,P,3),R)
 S BGPPRV=$P($P(BGPSTR,P,3),R,2)
 S BGPOPT="BGP 07 NATIONAL PAT LISTS"
 S BGPOT=$P(BGPSTR,P,4)
 S BGPRT=$P(BGPSTR,P,5)
 S BGPQTR=$P(BGPSTR,P,6)
 S BGPLST=$P(BGPSTR,P,7)
 S BGPMFITI=$P(BGPSTR,P,8)
 N I
 ;F I=10:1 D  Q:$P(BGPSTR,P,I)=""
 F I=12:1 D  Q:$P(BGPSTR,P,I)=""
 . Q:$P(BGPSTR,P,I)=""
 . N BGPNSTR
 . S BGPNSTR=$P(BGPSTR,P,I)
 . S BGPINDI=$P(BGPNSTR,R)
 . S BGPIND(BGPINDI)=""
 . N J
 . F J=2:1 D  Q:$P(BGPNSTR,R,J)=""
 .. Q:$P(BGPNSTR,R,J)=""
 .. N BGPSIND
 .. S BGPSIND=$P(BGPNSTR,R,J)
 .. S BGPINDL(BGPINDI,BGPSIND)=""
 K ^BGPTMP($J)
 S RETVAL="^BGPTMP("_$J_")"
 S ^BGPTMP($J,BGPI)="T00250DATA"_$C(30)
 D EP^BGP7GNPL(.BGPERR,DUZ,DUZ(2),BGPOPT,BGPCT,.BGPIND,.BGPINDL,BGPQTR,BGPDT,BGPLST,BGPPIEN,BGPPRV,BGPOT,BGPRT,BGPMFITI)
 S BGPI=BGPI+1
 S ^BGPTMP($J,BGPI)=+$G(BGPERR)_$C(30)
 S ^BGPTMP($J,BGPI+1)=$C(31)
 D EN^XBVK("BGP")
 Q
NPLS(RETVAL,BGPSTR) ;-- queue national patient lists search template
 S X="MERR^BGP7GU",@^%ZOSF("TRAP") ; m error trap
 N BGPI,BGPJ,BGPDATA,BGPDA,P,B,BGPERR,BGPCT,BGPDT,BGPOT,BGPOPT,BGPRT,BGPPIEN,BGPPRV,BGPQTR,BGPLST,R,BGPIND,BGPINDL,BGPSTMP
 S P="|",R="~",B="\"
 S BGPI=0
 S BGPERR=""
 I $G(BGPSTR)="" D CATSTR(.BGPSTR,.BGPSTR)
 S BGPCT=$P($P(BGPSTR,P),R)
 I $P(BGPCT,R)'?.N S BGPCT=$O(^ATXAX("B",BGPCT,0))
 ;S BGPCT=$O(^ATXAX("B",BGPCT,0))
 S BGPDT=$P(BGPSTR,P,2)
 S BGPPIEN=$P($P(BGPSTR,P,3),R)
 S BGPPRV=$P($P(BGPSTR,P,3),R,2)
 S BGPOPT="BGP 07 NPL SEARCH TEMPLATE"
 S BGPOT=$P(BGPSTR,P,4)
 S BGPRT=$P(BGPSTR,P,5)
 S BGPQTR=$P(BGPSTR,P,6)
 S BGPLST=$P(BGPSTR,P,7)
 S BGPMFITI=$P(BGPSTR,P,8)
 S BGPSTMP=$P(BGPSTR,B,2)
 N I
 F I=10:1 D  Q:$P(BGPSTR,P,I)=""
 . Q:$P(BGPSTR,P,I)=""
 . N BGPNSTR
 . S BGPNSTR=$P(BGPSTR,P,I)
 . S BGPINDI=$P(BGPNSTR,R)
 . S BGPIND(BGPINDI)=""
 . N J
 . F J=2:1 D  Q:$P(BGPNSTR,R,J)=""
 .. Q:$P(BGPNSTR,R,J)=""
 .. Q:$P(BGPNSTR,R,J)["\"
 .. N BGPSIND
 .. S BGPSIND=$P(BGPNSTR,R,J)
 .. S BGPINDL(BGPINDI,BGPSIND)=""
 .. S BGPINDL(BGPINDI,BGPSIND,"TEMP")=$G(BGPSTMP)  ;put search template here
 K ^BGPTMP($J)
 S RETVAL="^BGPTMP("_$J_")"
 S ^BGPTMP($J,BGPI)="T00250DATA"_$C(30)
 D EP^BGP7GNST(.BGPERR,DUZ,DUZ(2),BGPOPT,BGPCT,.BGPIND,.BGPINDL,BGPQTR,BGPDT,BGPLST,BGPPIEN,BGPPRV,BGPOT,BGPRT,BGPMFITI)
 S BGPI=BGPI+1
 S ^BGPTMP($J,BGPI)=+$G(BGPERR)_$C(30)
 S ^BGPTMP($J,BGPI+1)=$C(31)
 D EN^XBVK("BGP")
 Q
COM(RETVAL,BGPSTR) ;selected measures by community
 S X="MERR^BGP7GU",@^%ZOSF("TRAP") ; m error trap
 ;D EN^XBVK("BGP")
 N BGPI,BGPJ,BGPDATA,BGPDA,P,BGPERR,BGPCT,BGPOT,BGPOPT,BGPRT,P,R,A
 N BGPTP,BGPQTR,BGPRDT,BGPRE,BGPBAS,BGPPATT,BGPLIST,BGPPRV,BGPPROV,BGPIND,BGPINDI,BGPLSTI
 S P="|",R="~",A="*"
 I $G(BGPSTR)="" D CATSTR(.BGPSTR,.BGPSTR)
 S BGPI=0
 S BGPERR=""
 S BGPCT=$P($P(BGPSTR,P),R)
 I $P(BGPCT,R)'?.N S BGPCT=$O(^ATXAX("B",BGPCT,0))
 ;S BGPCT=$O(^ATXAX("B",BGPCT,0))
 S BGPTP=$P(BGPSTR,P,2)
 S BGPQTR=$P(BGPSTR,P,3)
 S BGPRDT=$P(BGPSTR,P,4)
 S BGPRE=$P(BGPSTR,P,5)
 S BGPOPT="BGP 07 SELECTED IND REPORT"
 S BGPBAS=$P(BGPSTR,P,6)
 S BGPPATT=$P(BGPSTR,P,7)
 S BGPLIST=$P(BGPSTR,P,8)
 S BGPPRV=$P($P(BGPSTR,P,9),R)
 S BGPPROV=$P($P(BGPSTR,P,9),R,2)
 S BGPOT=$P(BGPSTR,P,10)
 S BGPINDI=$P(BGPSTR,P,12)
 S BGPMFITI=$P(BGPSTR,P,13)
 S BGPLSTI=$P(BGPSTR,P,11)
 N I
 F I=2:1 D  Q:$P(BGPLSTI,A,I)=""
 . Q:$P(BGPLSTI,A,I)=""
 . N BGPL
 . S BGPL=$P($P(BGPLSTI,A,I),R)
 . S BGPLIST(BGPL)=""
 N J
 F J=2:1 D  Q:$P(BGPINDI,A,J)=""
 . Q:$P(BGPINDI,A,J)=""
 . N BGPL
 . S BGPL=$P($P(BGPINDI,A,J),R)
 . S BGPIND(BGPL)=""
 K ^BGPTMP($J)
 S RETVAL="^BGPTMP("_$J_")"
 S ^BGPTMP($J,BGPI)="T00250DATA"_$C(30)
 D EP^BGP7GCOM(.BGPERR,DUZ,DUZ(2),BGPOPT,BGPCT,BGPTP,.BGPIND,BGPQTR,BGPRE,BGPBAS,BGPPATT,BGPLIST,.BGPLIST,BGPPRV,BGPPROV,BGPOT,BGPRDT,BGPMFITI)
 S BGPI=BGPI+1
 S ^BGPTMP($J,BGPI)=+$G(BGPERR)_$C(30)
 S ^BGPTMP($J,BGPI+1)=$C(31)
 D EN^XBVK("BGP")
 Q
 ;
PP(RETVAL,BGPSTR) ;-- queue National GPRA Report
 S X="MERR^BGP7GU",@^%ZOSF("TRAP") ; m error trap
 N BGPI,BGPJ,BGPDATA,BGPDA,P,BGPERR,BGPSEAT,BGPOT,BGPOPT,BGPRT,P,R,A
 N BGPTP,BGPQTR,BGPRDT,BGPRE,BGPBAS,BGPPATT,BGPLIST,BGPPRV,BGPPROV,BGPSEAT,BGPIND,BGPINDT,BGPINDI,BGPLSTI
 S P="|",R="~",A="*"
 I $G(BGPSTR)="" D CATSTR(.BGPSTR,.BGPSTR)
 S BGPI=0
 S BGPERR=""
 S BGPTP=$P(BGPSTR,P,2)
 S BGPQTR=$P(BGPSTR,P,3)
 S BGPRDT=$P(BGPSTR,P,4)
 S BGPRE=$P(BGPSTR,P,5)
 S BGPOPT="BGP 07 SEL PATIENT PANEL"
 S BGPBAS=$P(BGPSTR,P,6)
 S BGPSEAT=$P($P(BGPSTR,P,7),R)
 S BGPLIST=$P(BGPSTR,P,8)
 S BGPPRV=$P($P(BGPSTR,P,9),R)
 S BGPPROV=$P($P(BGPSTR,P,9),R,2)
 S BGPOT=$P(BGPSTR,P,10)
 S BGPINDI=$P(BGPSTR,P,12)
 S BGPLSTI=$P(BGPSTR,P,11)
 N I
 F I=2:1 D  Q:$P(BGPLSTI,A,I)=""
 . Q:$P(BGPLSTI,A,I)=""
 . N BGPL
 . S BGPL=$P($P(BGPLSTI,A,I),R)
 . S BGPLIST(BGPL)=""
 N J
 F J=2:1 D  Q:$P(BGPINDI,A,J)=""
 . Q:$P(BGPINDI,A,J)=""
 . N BGPL
 . S BGPL=$P($P(BGPINDI,A,J),R)
 . S BGPIND(BGPL)=""
 K ^BGPTMP($J)
 S RETVAL="^BGPTMP("_$J_")"
 S ^BGPTMP($J,BGPI)="T00250DATA"_$C(30)
 D EP^BGP7GPP(.BGPERR,DUZ,DUZ(2),BGPOPT,BGPTP,.BGPIND,BGPQTR,BGPRE,BGPBAS,BGPSEAT,BGPLIST,.BGPLIST,BGPPRV,BGPPROV,BGPOT,BGPRDT)
 S BGPI=BGPI+1
 S ^BGPTMP($J,BGPI)=+$G(BGPERR)_$C(30)
 S ^BGPTMP($J,BGPI+1)=$C(31)
 D EN^XBVK("BGP")
 Q
 ;
ALL(RETVAL,BGPSTR) ;-- selected measures with all communities
 S X="MERR^BGP7GU",@^%ZOSF("TRAP") ; m error trap
 N BGPI,BGPJ,BGPDATA,BGPDA,P,BGPERR,BGPCT,BGPOT,BGPOPT,BGPRT,P,R,A
 N BGPTP,BGPQTR,BGPRDT,BGPRE,BGPBAS,BGPPATT,BGPLIST,BGPPRV,BGPPROV,BGPIND,BGPINDT,BGPLSTI,BGPINDI
 S P="|",R="~",A="*"
 I $G(BGPSTR)="" D CATSTR(.BGPSTR,.BGPSTR)
 S BGPI=0
 S BGPERR=""
 S BGPTP=$P(BGPSTR,P,2)
 S BGPQTR=$P(BGPSTR,P,3)
 S BGPRDT=$P(BGPSTR,P,4)
 S BGPRE=$P(BGPSTR,P,5)
 S BGPOPT="BGP 07 SEL ALL PATS"
 S BGPBAS=$P(BGPSTR,P,6)
 S BGPPATT=$P(BGPSTR,P,7)
 S BGPLIST=$P(BGPSTR,P,8)
 S BGPPRV=$P($P(BGPSTR,P,9),R)
 S BGPPROV=$P($P(BGPSTR,P,9),R,2)
 S BGPOT=$P(BGPSTR,P,10)
 S BGPINDI=$P(BGPSTR,P,12)
 S BGPLSTI=$P(BGPSTR,P,11)
 S BGPMFITI=$P(BGPSTR,P,13)
 N I
 F I=2:1 D  Q:$P(BGPLSTI,A,I)=""
 . Q:$P(BGPLSTI,A,I)=""
 . N BGPL
 . S BGPL=$P($P(BGPLSTI,A,I),R)
 . S BGPLIST(BGPL)=""
 N J
 F J=2:1 D  Q:$P(BGPINDI,A,J)=""
 . Q:$P(BGPINDI,A,J)=""
 . N BGPL
 . S BGPL=$P($P(BGPINDI,A,J),R)
 . S BGPIND(BGPL)=""
 K ^BGPTMP($J)
 S RETVAL="^BGPTMP("_$J_")"
 S ^BGPTMP($J,BGPI)="T00250DATA"_$C(30)
 D EP^BGP7GALL(.BGPERR,DUZ,DUZ(2),BGPOPT,BGPTP,.BGPIND,BGPQTR,BGPRE,BGPBAS,BGPPATT,BGPLIST,.BGPLIST,BGPPRV,BGPPROV,BGPOT,BGPRDT,BGPMFITI)
 S BGPI=BGPI+1
 S ^BGPTMP($J,BGPI)=+$G(BGPERR)_$C(30)
 S ^BGPTMP($J,BGPI+1)=$C(31)
 D EN^XBVK("BGP")
 Q
 ;
CMS(RETVAL,BGPSTR) ;
 S X="MERR^BGP7GU",@^%ZOSF("TRAP") ; m error trap
 N BGPI,BGPJ,BGPDATA,BGPDA,P,BGPERR,BGPCT,BGPDT,BGPOT,BGPOPT,BGPRT,BGPPIEN,BGPPRV,BGPQTR,BGPLST,R,BGPIND
 N BGPEDT,BGPBDT
 S P="|",R="~"
 S BGPI=0
 S BGPERR=""
 I $G(BGPSTR)="" D CATSTR(.BGPSTR,.BGPSTR)
 S BGPCT=$P(BGPSTR,P)
 I $P(BGPCT,R)'?.N S BGPCT=$O(^DIC(4,"B",BGPCT,0))
 ;S BGPCT=$O(^ATXAX("B",BGPCT,0))
 S BGPDT=$P(BGPSTR,P,2)
 S BGPBDT=$P(BGPSTR,P,3)
 S BGPEDT=$P(BGPSTR,P,4)
 S BGPOPT="BGP 07 CMS PERF REPORT"
 S BGPRT=$P(BGPSTR,P,6)
 S BGPQTR=$P(BGPSTR,P,5)
 N I
 F I=8:1 D  Q:$P(BGPSTR,P,I)=""
 . Q:$P(BGPSTR,P,I)=""
 . N BGPNSTR
 . S BGPNSTR=$P(BGPSTR,P,I)
 . S BGPINDI=$P(BGPNSTR,R)
 . S BGPIND(BGPINDI)=""
 K ^BGPTMP($J)
 S RETVAL="^BGPTMP("_$J_")"
 S ^BGPTMP($J,BGPI)="T00250DATA"_$C(30)
 D EP^BGP7GCMS(.BGPERR,DUZ,DUZ(2),BGPOPT,BGPCT,.BGPIND,BGPQTR,BGPDT,BGPRT,BGPBDT,BGPEDT)
 S BGPI=BGPI+1
 S ^BGPTMP($J,BGPI)=+$G(BGPERR)_$C(30)
 S ^BGPTMP($J,BGPI+1)=$C(31)
 D EN^XBVK("BGP")
 Q
GPU(RETVAL,BGPSTR) ;-- queue National GPRA Report
 S X="MERR^BGP7GU",@^%ZOSF("TRAP") ; m error trap
 N BGPI,BGPJ,BGPDATA,BGPDA,P,BGPERR,BGPCT,BGPYN,BGPOT,BGPOPT,BGPRT,BGPIND,BGPLIST
 N BGPQTR,BGPRE,BGPBAS,BGPBEN,BGPINDI,R
 S P="|",R="~"
 S BGPI=0
 S BGPERR=""
 S BGPCT=$P($P(BGPSTR,P),R)
 I $P(BGPCT,R)'?.N S BGPCT=$O(^ATXAX("B",BGPCT,0))
 ;S BGPCT=$O(^ATXAX("B",BGPCT,0))
 S BGPYN=$P(BGPSTR,P,2)
 S BGPQTR=$P(BGPSTR,P,3)
 S BGPRT=$P(BGPSTR,P,4)
 S BGPRE=$P(BGPSTR,P,5)
 S BGPBAS=$P(BGPSTR,P,6)
 S BGPBEN=$P(BGPSTR,P,7)
 S BGPOT=$P(BGPSTR,P,8)
 S BGPMFITI=$P(BGPSTR,P,9)
 S BGPOPT="BGP 07 GPU GPRA PERFORMANCE"
 K ^BGPTMP($J)
 S RETVAL="^BGPTMP("_$J_")"
 S ^BGPTMP($J,BGPI)="T00250DATA"_$C(30)
 D EP^BGP7GGPU(.BGPERR,DUZ,DUZ(2),BGPOPT,BGPCT,BGPQTR,BGPRE,BGPBAS,BGPBEN,BGPYN,BGPOT,BGPRT,BGPMFITI)
 S BGPI=BGPI+1
 S ^BGPTMP($J,BGPI)=+$G(BGPERR)_$C(30)
 S ^BGPTMP($J,BGPI+1)=$C(31)
 D EN^XBVK("BGP")
 Q
 ;
HED(RETVAL,BGPSTR) ;-- HEDIS Report
 S X="MERR^BGP7GU",@^%ZOSF("TRAP") ; m error trap
 N BGPI,BGPJ,BGPDATA,BGPDA,P,BGPERR,BGPCT,BGPOT,BGPOPT,BGPRT,P,R,A
 N BGPTP,BGPQTR,BGPRDT,BGPRE,BGPBAS,BGPPATT,BGPLIST,BGPPRV,BGPPROV,BGPYN,BGPIND,BGPLIST
 S P="|",R="~",A="*"
 I $G(BGPSTR)="" D CATSTR(.BGPSTR,.BGPSTR)
 S BGPI=0
 S BGPERR=""
 S BGPCT=$P($P(BGPSTR,P),R)
 I $P(BGPCT,R)'?.N S BGPCT=$O(^ATXAX("B",BGPCT,0))
 ;S BGPCT=$O(^ATXAX("B",BGPCT,0))
 S BGPYN=$P(BGPSTR,P,2)
 S BGPQTR=$P(BGPSTR,P,3)
 S BGPRDT=$P(BGPSTR,P,4)
 S BGPRE=$P(BGPSTR,P,5)
 S BGPOPT="BGP 07 HEDIS REPORT"
 S BGPBAS=$P(BGPSTR,P,6)
 S BGPPATT=$P(BGPSTR,P,7)
 S BGPLIST=$P(BGPSTR,P,8)
 S BGPPRV=$P($P(BGPSTR,P,9),R)
 S BGPPROV=$P($P(BGPSTR,P,9),R,2)
 S BGPOT=$P(BGPSTR,P,10)
 S BGPLSTI=$P(BGPSTR,P,11)
 S BGPMFITI=$P(BGPSTR,P,12)
 N I
 F I=2:1 D  Q:$P(BGPLSTI,A,I)=""
 . Q:$P(BGPLSTI,A,I)=""
 . N BGPL
 . S BGPL=$P($P(BGPLSTI,A,I),R)
 . S BGPLIST(BGPL)=""
 K ^BGPTMP($J)
 S RETVAL="^BGPTMP("_$J_")"
 S ^BGPTMP($J,BGPI)="T00250DATA"_$C(30)
 D EP^BGP7GHED(.BGPERR,DUZ,DUZ(2),BGPOPT,BGPCT,BGPQTR,BGPRE,BGPBAS,BGPPATT,BGPYN,BGPLIST,.BGPLIST,BGPPRV,BGPPROV,BGPOT,BGPRDT,BGPMFITI)
 S BGPI=BGPI+1
 S ^BGPTMP($J,BGPI)=+$G(BGPERR)_$C(30)
 S ^BGPTMP($J,BGPI+1)=$C(31)
 D EN^XBVK("BGP")
 Q
 ;
LST(RETVAL,BGPSTR) ;-- list files
 S X="MERR^BGP7GU",@^%ZOSF("TRAP") ; m error trap
 N BGPI,BGPJ,BGPDATA,BGPDA,P,BGPERR,BGPCT,BGPYN,BGPOT,BGPOPT,BGPRT,R
 S P="|",R="~"
 S BGPI=0
 S BGPERR=""
 S BGPCT=$P($P(BGPSTR,P),R)
 I $P(BGPCT,R)'?.N S BGPCT=$O(^ATXAX("B",BGPCT,0))
 ;S BGPCT=$O(^ATXAX("B",BGPCT,0))
 S BGPYN=$P(BGPSTR,P,2)
 S BGPOT=$P(BGPSTR,P,3)
 S BGPOPT=$P(BGPSTR,P,4)
 S BGPRT=$P(BGPSTR,P,5)
 K ^BGPTMP($J)
 S RETVAL="^BGPTMP("_$J_")"
 S ^BGPTMP($J,BGPI)="T00250DATA"_$C(30)
 D EP^BGP7GNPL(.BGPERR,DUZ,DUZ(2),BGPOPT,BGPCT,BGPYN,BGPOT,BGPRT)
 S BGPI=BGPI+1
 S ^BGPTMP($J,BGPI)=+$G(BGPERR)_$C(30)
 S ^BGPTMP($J,BGPI+1)=$C(31)
 D EN^XBVK("BGP")
 Q
 ;
NPLST(RETVAL,BGPSTR) ;-- list files
 S X="MERR^BGP7GU",@^%ZOSF("TRAP") ; m error trap
 N BGPI,BGPJ,BGPDATA,BGPDA,P,BGPERR,BGPCT,BGPYN,BGPOT,BGPOPT,BGPRT,R
 S P="|",R="~"
 S BGPI=0
 S BGPERR=""
 S BGPCT=$P($P(BGPSTR,P),R)
 I $P(BGPCT,R)'?.N S BGPCT=$O(^ATXAX("B",BGPCT,0))
 ;S BGPCT=$O(^ATXAX("B",BGPCT,0))
 S BGPYN=$P(BGPSTR,P,2)
 S BGPOT=$P(BGPSTR,P,3)
 S BGPOPT=$P(BGPSTR,P,4)
 S BGPRT=$P(BGPSTR,P,5)
 S BGPMFITI=$P(BGPSTR,P,6)
 K ^BGPTMP($J)
 S RETVAL="^BGPTMP("_$J_")"
 S ^BGPTMP($J,BGPI)="T00250DATA"_$C(30)
 D EP^BGP7GNST(.BGPERR,DUZ,DUZ(2),BGPOPT,BGPCT,BGPYN,BGPOT,BGPRT,BGPMFITI)
 S BGPI=BGPI+1
 S ^BGPTMP($J,BGPI)=+$G(BGPERR)_$C(30)
 S ^BGPTMP($J,BGPI+1)=$C(31)
 D EN^XBVK("BGP")
 Q
ELD(RETVAL,BGPSTR) ;
 G ELD^BGP7GR1
ONTL(RETVAL,BGPSTR) ;
 S X="MERR^BGP7GU",@^%ZOSF("TRAP") ; m error trap
 N P,BGPI,BGPDA,BGPRIEN
 S P="|"
 S BGPRIEN=$P(BGPSTR,P)
 S RETVAL="^BGPTMP("_$J_")"
 S BGPI=0
 S ^BGPTMP($J,BGPI)="T00250DATA"_$C(30)
 S BGPDA=0 F  S BGPDA=$O(^BGPGUIA(BGPRIEN,11,BGPDA)) Q:'BGPDA  D
 . S BGPI=BGPI+1
 . S ^BGPTMP($J,BGPI)=$G(^BGPGUIA(BGPRIEN,11,BGPDA,0))_$C(30)
 S ^BGPTMP($J,BGPI+1)=$C(31)_$G(X)
 D EN^XBVK("BGP")
 Q
 ;
DNTL(RETVAL,BGPSTR) ;
 S X="MERR^BGP7GU",@^%ZOSF("TRAP") ; m error trap
 N P,BGPI,BGPDA,BGPRIEN
 S P="|"
 S BGPRIEN=$P(BGPSTR,P)
 S RETVAL="^BGPTMP("_$J_")"
 S BGPI=0
 S ^BGPTMP($J,BGPI)="T00250DATA"_$C(30)
 S BGPDA=0 F  S BGPDA=$O(^BGPGUIA(BGPRIEN,12,BGPDA)) Q:'BGPDA  D
 . S BGPI=BGPI+1
 . S ^BGPTMP($J,BGPI)=$TR($G(^BGPGUIA(BGPRIEN,12,BGPDA,0)),"^","~")_$C(30)
 S ^BGPTMP($J,BGPI+1)=$C(31)_$G(BGPERR)
 D EN^XBVK("BGP")
 Q
 ;
CATSTR(BGPSRET,STR) ;EP
 N BGPDA
 S BGPSRET=""
 S BGPDA=0 F  S BGPDA=$O(STR(BGPDA)) Q:'BGPDA  D
 . S BGPSRET=BGPSRET_$G(STR(BGPDA))
 Q
 ;
CMP(RETVAL,BGPSTR) ;EP
 S X="MERR^BGP7GU",@^%ZOSF("TRAP")
 N BGPI,BGPJ,BGPDATA,BGPDA,P,BGPERR,BGPCT,BGPQTR,BGPRDT,BGPRE,BGPLIST,BGPPRV,BGPPROV,BGPOT,BGPOPT,BGPRT,R
 S P="|",R="~"
 S BGPI=0
 S BGPERR=""
 S BGPCT=$P($P(BGPSTR,P),R)
 I $P(BGPCT,R)'?.N S BGPCT=$O(^ATXAX("B",BGPCT,0))
 ;S BGPCT=$O(^ATXAX("B",BGPCT,0))
 S BGPQTR=$P(BGPSTR,P,2)
 S BGPRDT=$P(BGPSTR,P,3)
 S BGPRE=$P(BGPSTR,P,4)
 S BGPOPT="BGP 07 COMPREHENSIVE PAT LIST"
 S BGPLIST=$P(BGPSTR,P,5)
 S BGPPRV=$P($P(BGPSTR,P,6),R)
 S BGPPROV=$P($P(BGPSTR,P,6),R,2)
 S BGPOT=$P(BGPSTR,P,7)
 S BGPMFITI=$P(BGPSTR,P,8)  ;added for mfi v6.1
 K ^BGPTMP($J)
 S RETVAL="^BGPTMP("_$J_")"
 S ^BGPTMP($J,BGPI)="T00250DATA"_$C(30)
 D EP^BGP7GCMP(.BGPERR,DUZ,DUZ(2),BGPOPT,BGPLIST,BGPPRV,BGPPROV,BGPQTR,BGPRE,BGPCT,BGPOT,BGPRDT,BGPMFITI)
 S BGPI=BGPI+1
 S ^BGPTMP($J,BGPI)=+$G(BGPERR)_$C(30)
 S ^BGPTMP($J,BGPI+1)=$C(31)
 D EN^XBVK("BGP")
 Q
 ;
