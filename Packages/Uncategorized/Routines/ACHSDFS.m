ACHSDFS ; IHS/ITSC/PMF - ACCRUED DEFERRED SERVICES REPORT ;7/27/10  16:07
 ;;3.1;CONTRACT HEALTH MGMT SYSTEM;**18**;JUN 11, 2001
 ;;ACHD*3*1T;Y2K FIX;CS 2991221
 ;ACHS*3.1*18 4/1/2010;IHS/OIT/ABK;Change every occurrance of Deferred to Unmet Need
 ;
BEG ; --- Select Begin/End dates for report.
 ;{ABK, 4/1/10}S ACHDBDT=$$DATE^ACHS("B","ACCRUED DEFERRED SERVICES")
 S ACHDBDT=$$DATE^ACHS("B","ACCRUED UNMET NEEDS")
 G END:ACHDBDT<1
 ;{ABK, 4/1/10}S ACHDEDT=$$DATE^ACHS("E","ACCRUED DEFERRED SERVICES")
 S ACHDEDT=$$DATE^ACHS("E","ACCRUED UNMET NEEDS")
 G BEG:ACHDEDT<1
 I $$EBB^ACHS(ACHDBDT,ACHDEDT) G BEG
 S ACHDHAT=""
DEV ; --- Select device for report.
 S %ZIS="OPQ"
 D ^%ZIS
 I POP D HOME^%ZIS D END Q
 G:'$D(IO("Q")) START
 K IO("Q")
 I $D(IO("S"))!($E(IOST)'="P") W *7,!,"Please queue to system printers." D ^%ZISC G DEV
 ;
 ;
 S ZTRTN="START^ACHSDFS",ZTDESC=$P($P($T(ACHSDFS),";",2)," ",4,99)_(ACHDBDT+17000000)_" TO "_(ACHDEDT+17000000),ACHSQIO=ION_";"_IOST_";"_IOM_";"_IOST  ;Y2000
 ;
 F %="ACHSQIO","ACHDBDT","ACHDEDT","ACHDCFY" S ZTSAVE(%)=""
 D ^%ZTLOAD
 G:'$D(ZTSK) DEV
END ; --- KILL vars, close device, quit.
 K ACHD,ACHDBDT,ACHDCHS,ACHDCOST,ACHDEDT,ACHDHAT,ACHSQIO,ACHDUNIT,ZTIO,ZTSK
 D ^%ZISC
 Q
 ;
START ;EP - From TaskMan.
 N ACHDFT,ACHDSU,ACHDCAT,ACHDSUB,ACHDTYPE,ACHDCNT,ACHDTOT
 K ^TMP($J,"ACHSDFS")
 ;
 ;{ABK, 4/1/10}S ACHDCHS=$$C^ACHS("CHS DENIAL/DEFERRED SERVICES",80)
 S ACHDCHS=$$C^ACHS("CHS UNMET NEEDS",80)
 ;{ABK, 4/1/10}S ACHDTITL=$$C^ACHS("ACCRUED DEFERRED SERVICES REPORT",80)
 S ACHDTITL=$$C^ACHS("ACCRUED UNMET NEEDS REPORT",80)
 S ACHDFT=$$C^ACHS("From "_$$FMTE^XLFDT(ACHDBDT)_" To "_$$FMTE^XLFDT(ACHDEDT),80),ACHDSU=$$LOC^ACHS,ACHDUSR=$$USR^ACHS
 S ACHDISDT=ACHDBDT-1
 S ACHDFY=$E(ACHDISDT,1,3)+1700
ISSUEDT ; --- Move thru Issue date x-ref.
 S ACHDISDT=$O(^ACHSDEF(DUZ(2),"D","AISSUE",ACHDISDT))
 G PRINT:+ACHDISDT=0!(ACHDISDT>ACHDEDT)
 S ACHDFY(1)=$E(ACHDISDT,1,3)+1700
 S (ACHSA,ACHDCAT,ACHDSUB,ACHDTYPE)=0
IEN ; --- Process a document.
 S ACHSA=$O(^ACHSDEF(DUZ(2),"D","AISSUE",ACHDISDT,ACHSA))
 G ISSUEDT:+ACHSA=0,IEN:'$D(^ACHSDEF(DUZ(2),"D",ACHSA,0))
 G IEN:$$DF^ACHS(0,14)="Y",IEN:$E($$DF^ACHS(0,1))="#"
 ;
 S X=$G(^ACHSDEF(DUZ(2),"D",ACHSA,100))
 S ACHDTYPE=$P(X,U,2)
 S ACHDCOST=$P(X,U,5)
 S ACHDUNIT=$P(X,U,3)
 G IEN:$P(X,U)<1,IEN:$P(X,U,4)<1
 S ACHDCAT="C"_$P(X,U),ACHDSUB="S"_$P(X,U,4)
 S ACHDCNT(ACHDCAT)=$G(ACHDCNT(ACHDCAT))+ACHDUNIT
 S ACHDTOT(ACHDCAT)=$G(ACHDTOT(ACHDCAT))+ACHDCOST
 S ACHDCNT(ACHDCAT,ACHDSUB)=$G(ACHDCNT(ACHDCAT,ACHDSUB))+ACHDUNIT
 S ACHDTOT(ACHDCAT,ACHDSUB)=$G(ACHDTOT(ACHDCAT,ACHDSUB))+ACHDCOST
 G IEN
 ;
PRINT ;
 S X=""
 F  S X=$O(ACHDCNT(X)) Q:X=""  S ^TMP($J,"ACHSDFS",X,"TOTAL")=ACHDCNT(X)_U_ACHDTOT(X) S Y="" F  S Y=$O(ACHDCNT(X,Y)) Q:Y=""  S ^TMP($J,"ACHSDFS",X,Y,"TOTAL")=ACHDCNT(X,Y)_U_ACHDTOT(X,Y)
 D BRPT^ACHS
 S ACHDX=""
 F  S ACHDX=$O(^TMP($J,"ACHSDFS",ACHDX)) Q:ACHDX=""  S ACHDCAT=$P($G(^ACHSDFC($E(ACHDX,2),0)),U) W @IOF D HDR,PRNT1,HDR1,PRNTX,CATTOT
 D RTRN^ACHS,ERPT^ACHS
 D END
 Q
 ;
PRNTX ;
 S ACHDY=""
 F  S ACHDY=$O(^TMP($J,"ACHSDFS",ACHDX,ACHDY)) Q:ACHDY=""!(ACHDY="TOTAL")  S ACHDSUB=$P($G(^ACHSDFC($E(ACHDX,2,99),1,$E(ACHDY,2,99),0)),U) D
 . W !?7,ACHDSUB,?60,$J($FN($P($G(^TMP($J,"ACHSDFS",ACHDX,ACHDY,"TOTAL")),U),","),5),$J($FN($P($G(^TMP($J,"ACHSDFS",ACHDX,ACHDY,"TOTAL")),U,2),","),14),!
 . I $Y>ACHSBM D HDR,HDR1
 ;
 Q
 ;
PRNT1 ;
 W !!?5,"CATEGORY OF SERVICE:  ",ACHDCAT,!
 Q
 ;
CATTOT ;
 W !!,$$REPEAT^XLFSTR("-",79),!!?12,"TOTAL CATEGORY ",ACHDCAT,?60,$J($FN($P($G(^TMP($J,"ACHSDFS",ACHDX,"TOTAL")),U),","),5),$J("$"_$FN($P($G(^TMP($J,"ACHSDFS",ACHDX,"TOTAL")),U,2),","),14)
 Q
 ;
HDR ; --- Report pagination control.
 D RTRN^ACHS
 I ACHDFY(1) S:ACHDFY(1)'=ACHDFY ACHDFY=ACHDFY_" TO "_ACHDFY(1)
 W !!,ACHDCHS,!,ACHDTITL,!,$$C^ACHS("FISCAL YEAR "_ACHDFY,80),!,ACHDFT,!!!,"FACILITY: ",ACHDSU,?(66-$L(ACHDUSR)),"PREPARED BY: ",ACHDUSR,!!!,"CLINICAL DIRECTOR SIGNATURE:",$$REPEAT^XLFSTR("_",51),!!,$$REPEAT^XLFSTR("*",79),!!
 Q
 ;
HDR1 ;    
 W !?7,"SUBCATEGORY OF SERVICE",?60,"UNITS",?70,"EST. COST",!,$$REPEAT^XLFSTR("-",79),!
 Q
 ;