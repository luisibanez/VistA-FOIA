IBCEQ1A ;ALB/BSL,TMK - PROVIDER ID QUERY REPORT ;25-AUG-03
 ;;2.0;INTEGRATED BILLING;**232**;21-MAR-94
 ;
RPTOUT ; Print from data in ^XTMP
 N IBP,IBA,IBI,IBIN,IBPNM,IBPNUM,IBSTOP,IBX,IBZ,IBPG,IBICONT,Z
 K ^TMP($J,"IBZ232")
 F Z=1:1:6 S ^TMP($J,"IBZ232",Z)=""
 S (IBPG,IBSTOP)=0
 S IBA=0 F  S IBA=$O(^XTMP("IB_PLAN232",1,IBA)) Q:'IBA  D
 . S IBX=$G(^XTMP("IB_PLAN232",1,IBA,0))
 . ; Sort by err type, ins co ien
 . S ^TMP($J,"IBZ232",+$P(IBX,U,16),+$P(IBX,U,11),IBA)=IBX
 ;
 S IBZ=0 F  S IBZ=$O(^TMP($J,"IBZ232",IBZ)) Q:'IBZ!IBSTOP!(IBZ>6)  D HDR1(.IBPG,.IBSTOP,IBZ,0) S IBI=0 F  S IBI=$O(^TMP($J,"IBZ232",IBZ,IBI)) Q:'IBI!IBSTOP  D
 . S IBIN=$P($G(^DIC(36,+IBI,0)),U)_" ("_$S(+$G(^(3))=1:"",1:"NOT ")_"SET TO TRANSMIT LIVE)"
 . D INSHDR(.IBPG,.IBSTOP,IBIN,IBZ,0) S IBICONT=0
 . S IBA=0 F  S IBA=$O(^TMP($J,"IBZ232",IBZ,IBI,IBA)) Q:'IBA!IBSTOP  S IBX=$G(^(IBA)) D
 .. I ($Y+5)>IOSL D INSHDR(.IBPG,.IBSTOP,IBIN,IBZ,IBICONT) Q:IBSTOP
 .. ;
 .. I IBZ'=4,IBZ'=5 D
 ... S IBP=+$P(IBX,U,14)
 ... I $P(IBX,U,14)[".91" S IBPNM="ALL PROVIDERS"
 ... I $P(IBX,U,14)'[".91" D
 .... N Z
 .... S Z=$P($G(^IBA(355.9,IBP,0)),U)
 .... S IBPNM=$S(Z["VA(200":"",1:"#")_$$EXTERNAL^DILFD(355.9,.01,"",Z)
 ... S IBPNUM=$P($G(^IBA(+$P($P(IBX,U,14),";",2),IBP,0)),U,7)
 ... D WRT(1,"   "_$E($P("BOTH^UB92^HCFA 1500",U,$P(IBX,U,4)+1)_$J("",9),1,9)_"  "_$E($P(IBX,U,15)_$J("",23),1,23)_" "_$E(IBPNM_$J("",28),1,28)_"  "_$E(IBPNUM,1,11))
 .. ;
 .. I IBZ=4!(IBZ=5) D
 ... N Z
 ... S Z=$G(^IBA(355.3,+$P(IBX,U,13),0))
 ... D WRT(1,"   "_$E($P(Z,U,3)_$J("",20),1,20)_"  "_$E($P(Z,U,4)_$J("",17),1,17)_"  "_$$EXTERNAL^DILFD(355.3,.15,"",$P(Z,U,15)))
 .. S:'IBICONT IBICONT=1
 ;
 I 'IBSTOP D  ;Totals
 . N Z
 . S Z=$G(^XTMP("IB_PLAN232"))
 . I ($Y+10)>IOSL!'IBPG D HDR(.IBPG,.IBSTOP,"") Q:IBSTOP
 . D WRT(2,$J("",25)_"TOTAL # OF IDs CHECKED: "_+$P(Z,U,4))
 . D WRT(1,$J("",14)_"TOT # BLUE CROSS/SHIELD IDS FOUND: "_+$P(Z,U,5))
 . D WRT(1,"TOTAL # OF INS CO. W/BLUE PLANS AND NO BLUE IDS: "_+$P(Z,U,3))
 . D WRT(1,$J("",21)_"TOTAL # OF ERRORS/WARNINGS: "_+$P(Z,U,6))
 ;
 I '$D(ZTQUEUED) D ^%ZISC I 'IBSTOP,IBPG D ASK()
 I $D(ZTQUEUED),'IBSTOP S ZTREQ="@"
 I $G(^TMP($J,"SENDMSG")),'IBSTOP D
 . N XMDUZ,XMSUBJ,XMBODY,XMTO,XMZ
 . S XMDUZ=DUZ,XMSUBJ=$E("PROVIDER ID QUERY FROM "_$P($G(^DIC(4,+$P($G(^IBE(350.9,1,0)),U,2),0)),U),1,65),XMBODY="^TMP($J,""SENDMSG"",1)"
 . M XMTO=^TMP($J,"SENDMSG",0)
 . S Z="" F  S Z=$O(^TMP($J,"SENDMSG",0,Z)) Q:Z=""  S XMZ(Z)=""
 . D SENDMSG^XMXAPI(XMDUZ,XMSUBJ,XMBODY,.XMTO,"",.XMZ)
 K ^TMP($J,"IBZ232"),^TMP($J,"SENDMSG")
 Q
 ;
HDR(IBPG,IBSTOP,IBZ,FF) ; Main hdr
 ; FF = 0 if continuation pg so it writes it to report, but not mail msg
 N Z,IBT
 Q:$G(IBSTOP)
 I $D(ZTQUEUED),$$S^%ZTLOAD S (IBSTOP,ZTSTOP)=1 K ZTREQ I +$G(IBPG) D WRT(2,"***TASK STOPPED BY USER***") Q
 I IBPG&($E(IOST,1,2)="C-") D ASK(.IBSTOP) Q:IBSTOP
 S IBT=$S(IBPG:1,1:0)
 S IBPG=IBPG+1
 S Z="PROVIDER ID VERIFICATION QUERY REPORT"
 S Z=$$SETSTR^VALM1($J("",80-$L(Z)\2)_Z,"",1,79)
 S Z=$$SETSTR^VALM1("Page: "_IBPG,Z,70,10)
 D WRT(0,"@IOF",$G(FF))
 D WRT(1,Z,$G(FF))
 S Z="RUN DATE: "_$$FMTE^XLFDT(DT,2),Z=$J("",80-$L(Z)\2)_Z
 D WRT(1,Z,$G(FF))
 I IBZ'="",IBZ'=4,IBZ'=5 D
 . D WRT(2,"   FORM TYPE  PROV ID TYPE"_$J("",12)_"PROVIDER NAME (#=Non-VA)"_$J("",6)_"PROV ID",$G(FF))
 I IBZ=4!(IBZ=5) D
 . D WRT(2,"   GROUP NAME"_$J("",12)_"GROUP NUMBER"_$J("",7)_"ELECTRONIC PLAN TYPE",$G(FF))
 D WRT(1,$TR($J("",IOM-1)," ","-"),$G(FF))
 Q
 ;
HDR1(IBPG,IBSTOP,IBZ,IBCONT) ; Hdr err typ
 N Z,Z0,Z1
 D HDR(.IBPG,.IBSTOP,IBZ,IBCONT) Q:IBSTOP
 S Z="",$P(Z,"*",80)="" D WRT(1,Z,IBCONT)
 S Z0="* "_$S(IBZ>1:"WARNING: ",1:"ERROR: ")
 ;
 I IBZ'=4,IBZ'=5 D
 . N X
 . S X="BLUE CROSS ID FOUND FOR A HCFA FORM TYPE ONLY^BLUE SHIELD ID FOUND FOR A UB92 FORM TYPE ONLY^BLUE CROSS ID FOUND FOR BOTH FORM TYPES^BL CROSS/BL SHIELD IDs FOUND FOR PLANS NOT HAVING 'BL' ELECTRONIC PLAN TYPE"
 . S Z0=Z0_$S(IBZ<6:$P(X,U,IBZ),IBZ=6:"""VAD000"" PROVIDER ID FOUND NOT SET UP AS A UPIN PROVIDER ID TYPE",1:"")
 I IBZ=4 D
 . S Z0=Z0_"BL CROSS/BL SHIELD IDs FOUND FOR PLANS NOT HAVING 'BL' ELECTRONIC" D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 . S Z0="*"_$J("",10)_"PLAN TYPE"
 ;
 I IBZ=5 D
 . S Z0=Z0_"INSURANCE CO HAS BL CROSS/SHIELD PLANS, BUT NO BL CROSS/SHIELD IDs"
 ;
 S Z0=Z0_$S(IBCONT:" (CONT)",1:"")
 D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 ;
 I 'IBCONT D
 . I IBZ=1 D
 .. D WRT(1,"*"_$J("",77)_"*",IBCONT)
 .. S Z0="* SOLUTION: THIS ID WILL NEVER BE USED ELECTRONICALLY." D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 .. S Z0="*"_$J("",11)_"CHANGE PROVIDER ID TYPE TO BLUE SHIELD IF THIS ID SHOULD BE" D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 .. S Z0="*"_$J("",11)_"TRANSMITTED ON A HCFA." D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 . ;
 . I IBZ=2 D
 .. D WRT(1,"*"_$J("",77)_"*",IBCONT)
 .. S Z0="* SUGGESTION: VISTA WILL TRANSMIT THIS ID ELECTRONICALLY, BUT IT IS OPTIMAL"  D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 .. S Z0="*"_$J("",13)_"TO HAVE THIS ID SET UP AS BLUE CROSS." D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 . ;
 . I IBZ=3 D
 .. D WRT(1,"*"_$J("",77)_"*",IBCONT)
 .. S Z0="* SUGGESTION: A BLUE CROSS ID CAN ONLY BE APPLIED TO A UB92 FORM TYPE." D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 .. S Z0="*"_$J("",13)_"EDIT THE 'APPLIED TO FORM TYPE' FOR THE ID TO BE UB92 ONLY." D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 .. S Z0="*"_$J("",13)_"IF YOU NEED THIS ID ON A HCFA, SET IT UP AS A BLUE SHIELD ID" D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 .. S Z0="*"_$J("",13)_"APPLIED TO A HCFA 1500 FORM TYPE." D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 . ;
 . I IBZ=4 D
 .. D WRT(1,"*"_$J("",77)_"*",IBCONT)
 .. S Z0="* SUGGESTION: A BLUE CROSS OR BLUE SHIELD ID IS DEFINED FOR THE INSURANCE" D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 .. S Z0="*"_$J("",13)_"COMPANY, BUT THE ELECTRONIC PLAN TYPE FOR ONE OR MORE OF THE" D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 .. S Z0="*"_$J("",13)_"COMPANY'S PLANS IS NOT SET TO 'BL' (BLUE CROSS/BLUE SHIELD)." D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 .. S Z0="*"_$J("",13)_"IF BLUE CROSS/BLUE SHIELD IDs ARE NEEDED TO PRINT FOR ANY" D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 .. S Z0="*"_$J("",13)_"OF THESE PLANS, ITS ELECTRONIC PLAN TYPE MUST BE CHANGED TO BL." D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 . ;
 . I IBZ=5 D
 .. D WRT(1,"*"_$J("",77)_"*",IBCONT)
 .. S Z0="* SUGGESTION: A BLUE CROSS OR BLUE SHIELD PLAN IS DEFINED FOR THE INSURANCE" D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 .. S Z0="*"_$J("",13)_"COMPANY, BUT YOU HAVE ONLY NON-BLUE CROSS/SHIELD IDS SET UP." D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 .. S Z0="*"_$J("",13)_"YOU MUST SET UP THE APPROPRIATE BLUE CROSS/BLUE SHIELD IDs" D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 .. S Z0="*"_$J("",13)_"FOR THE INSURANCE COMPANY." D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 . ;
 . I IBZ=6 D
 .. D WRT(1,"*"_$J("",77)_"*",IBCONT)
 .. S Z0="* SUGGESTION: CHANGE PROVIDER ID TYPE TO UPIN."
 .. D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 .. S Z0="*"_$J("",13)_"ONCE ALL PAYERS FULLY IMPLEMENT HIPAA EDITS, YOU"
 .. D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 .. S Z0="*"_$J("",13)_"MUST USE THE CORRECT ID TYPE FOR THE ID ENTERED."
 .. D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 . ;
 . D WRT(1,"*"_$J("",77)_"*",IBCONT)
 . S Z1="*"_$J("",$S(IBZ'=1:13,1:11))_"VISTA OPTION TO USE: "
 . I IBZ'=4 D
 .. S Z0=Z1_"PROVIDER ID MAINTENANCE"
 . I IBZ=4 D
 .. S Z0=Z1_"INSURANCE COMPANY ENTRY/EDIT"
 . D WRT(1,Z0_$J("",78-$L(Z0))_"*",IBCONT)
 ;
 D WRT(1,Z,IBCONT)
 ;
 I '$O(^TMP($J,"IBZ232",IBZ,0)) D WRT(2,"***** NOTHING FOUND FOR THIS ERROR/WARNING *****",IBCONT)
 Q
 ;
INSHDR(IBPG,IBSTOP,IBINM,IBZ,IBICONT) ; Ins Co info
 I ($Y+7)>IOSL D HDR1(.IBPG,.IBSTOP,IBZ,1)
 Q:IBSTOP
 D WRT(2,"INSURANCE CO NAME: "_IBINM_$S($G(IBICONT):" (Continued)",1:""),IBICONT)
 Q
 ;
ASK(IBSTOP) ; Ask continue
 ; If passed by ref, IBSTOP returned = 1 if print aborted
 I $E(IOST,1,2)'["C-" Q
 N DIR,DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="E" W ! D ^DIR
 I ($D(DIRUT))!($D(DUOUT)) S IBSTOP=1 Q
 Q
 ;
WRT(FF,TEXT,NOT) ; Wrt/store line
 N Z,A
 S A=+$O(^TMP($J,"SENDMSG",1,""),-1),NOT=$G(NOT)
 I FF F Z=1:1:FF W ! I $G(^TMP($J,"SENDMSG")),'NOT,Z>1 S A=A+1,^TMP($J,"SENDMSG",1,A)=" "
 ;
 I TEXT="@IOF" D  Q
 . W @IOF
 . I $G(^TMP($J,"SENDMSG")),'NOT,IBPG>1 D
 .. S A=A+1,^TMP($J,"SENDMSG",1,A)=" "
 .. F Z=1:1:2 S A=A+1,^TMP($J,"SENDMSG",1,A)="*** TOP OF NEW PAGE ***"
 .. S A=A+1,^TMP($J,"SENDMSG",1,A)=" "
 ;
 W TEXT
 I $G(^TMP($J,"SENDMSG")),'NOT S A=A+1,^TMP($J,"SENDMSG",1,A)=TEXT
 Q
 ;
