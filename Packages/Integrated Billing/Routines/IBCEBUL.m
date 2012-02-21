IBCEBUL ;ALB/TMP - 837 EDI SPECIAL BULLETINS PROCESSING ;19-SEP-96
 ;;2.0;INTEGRATED BILLING;**137,250**;21-MAR-94
 ;
NOTSENT ; Check for batches in pending status (no confirmation from Austin)
 ;  from yesterday or before
 N XMTO,XMSUBJ,XMBODY,XMDUZ,IBT,IB,IBE,IBCT,IBI,IB0,IB1,Z,IBDTM
 K ^TMP($J,"IBNOTSENT")
 D NOW^%DTC S IBDTM=%
 S (IBCT,IBI)=0
 F  S IBI=$O(^IBA(364.1,"ASTAT","P",IBI)) Q:'IBI  S IBTYP=$P($G(^IBA(364.1,IBI,0)),U,7),IBDAYS=(IBDTM-$P($G(^(1)),U,6)) I IBDAYS>1,IBDAYS'=IBDTM,$O(^IBA(364,"C",IBI,0)) D
 .S IBCT=IBCT+1,IBCT(+IBTYP)=$G(IBCT(+IBTYP))+1
 .I IBCT'>10 S ^TMP($J,"IBNOTSENT",IBTYP,IBI)=""
 I IBCT D
 .S IBT(1)="There are "_IBCT_" EDI batch(es) still pending Austin receipt "
 .S IBT(2)="for more than 1 day.  Please investigate why they have not yet been confirmed"
 .S IBT(3)="as being received by Austin."
 .S IBT(4)=" "
 .I IBCT>10 S IBT(5)="Since there were more than 10 batches found, please run the ",IBT(6)="  EDI BATCHES WAITING FOR AUSTIN RECEIPT OVER 1-DAY report to get a list of these batches."
 .I IBCT'>10 D
 ..S IBT(5)="      BATCH #      PENDING SINCE             MAIL MESSAGE #",IBT(6)="",$P(IBT(6),"-",76)="",IBT(6)="  "_IBT(6),IBE=6
 ..S IBTYP=""
 ..F  S IBTYP=$O(^TMP($J,"IBNOTSENT",IBTYP)) Q:IBTYP=""  D
 ...S Z=$$EXPAND^IBTRE(364.1,.07,IBTYP) S:Z="" Z="??"
 ...I $O(^TMP($J,"IBNOTSENT",IBTYP),-1)'="" S IBE=IBE+1,IBT(IBE)=" "
 ...S IBE=IBE+1,IBT(IBE)="  BATCH TYPE: "_Z
 ...S IBI=0 F  S IBI=$O(^TMP($J,"IBNOTSENT",IBTYP,IBI)) Q:'IBI  D
 ....S IBE=IBE+1,IB0=$G(^IBA(364.1,IBI,0)),IB1=$G(^(1))
 ....S IBT(IBE)="      "_$E($P(IB0,U)_$J("",10),1,10)_"   "_$E($$FMTE^XLFDT($P(IB1,U,6),1)_$J("",20),1,20)_"      "_$P(IB0,U,4),IBE=IBE+1,IBT(IBE)=$J("",8)_$E($P(IB0,U,8),1,72)
 .S XMSUBJ="EDI BATCHES WAITING AUSTIN RECEIPT FOR OVER 1 DAY",XMBODY="IBT",XMDUZ="",XMTO("I:G.IB EDI")=""
 .D SENDMSG^XMXAPI(XMDUZ,XMSUBJ,XMBODY,.XMTO,,.XMZ)
 K ^TMP($J,"IBNOTSENT")
 Q
 ;
