XTPMKPP ;OAK/BP - PATCH MONITOR PURGING; [8/2/05 6:41am]
 ;;7.3;TOOLKIT;**98**; Apr 25, 1995
 ;
EN D DT^DICRW
 ; number of days to keep data in param file
 Q:+$P($G(^XPD(9.95,1,0)),U,3)=0  ; quit if not keeping records on file
 S XTBPDAYS=$P($G(^XPD(9.95,1,0)),U,2)
 I +XTBPDAYS=0 S XTBPDAYS=365 ; minimum of 365 days
 S X1=DT,X2=-XTBPDAYS D C^%DTC S XTBEND=X+.2359,XTBX=""
 F  S XTBX=$O(^XPD(9.9,"B",XTBX)) Q:XTBX=""  F XTBDA=0:0 S XTBDA=$O(^XPD(9.9,"B",XTBX,XTBDA)) Q:XTBDA=""  DO
 .S XTBDTA=$G(^XPD(9.9,XTBDA,0)) Q:XTBDTA=""
 .S XTBINST=$P(XTBDTA,U,8) ; install name
 .S XTBXX=$O(^XPD(9.7,"B",XTBINST,0),-1) Q:$P($G(^XPD(9.7,+XTBXX,0)),U,9)'=3  ; not installed
 .S XTBCMPDT=$P(XTBDTA,U,9) ; compliance date
 .I XTBCMPDT<XTBEND S DIK="^XPD(9.9,",DA=XTBDA D ^DIK
 K XTBPDAYS,X1,X2,XTBEND,XTBX,XTBXX,XTBDA,XTBCMPDT,DIK,DA,XTBINST,XTBDTA,X
 Q
