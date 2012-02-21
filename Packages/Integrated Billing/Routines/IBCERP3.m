IBCERP3 ;ALB/TMP - EDI BATCHES WAITING MORE THAN 1 DAY REPORT ;30-SEP-96
 ;;2.0;INTEGRATED BILLING;**137,296**;21-MAR-94
 Q
 ;
PENDING ;Report of batches not sent after the day the bills in it were extracted
 W !
 S %ZIS="QM" D ^%ZIS Q:POP
 I $D(IO("Q")) K IO("Q") S ZTRTN="EN^IBCERP3",ZTDESC="REPORT OF BILL BATCHES WAITING AUSTIN RECEIPT AFTER 1 DAY" D ^%ZTLOAD K ZTSK D HOME^%ZIS Q
 U IO
EN ; Queued job entrypoint
 N IBPAGE,IBHDRDT,IBLINE,IBSTOP,IBBA,IBBAT,IBCT,IBTYP,IBTYPN,IBV,DIR,Y,IB0,IB1
 ;
 K ^TMP($J,"IBSORT")
 S (IBPAGE,IBBA)=0
 ;
 ; esg - 5/12/05 - IB*2*296 - Additional check to make sure there are 
 ;       bills in the batch in file 364 before including it.  Similar to
 ;       existing functionality in routine ^IBCEBUL.
 ;
 F  S IBBA=$O(^IBA(364.1,"ASTAT","P",IBBA)) Q:'IBBA  S IB0=$G(^IBA(364.1,IBBA,0)),IB1=$G(^(1)) I DT-($P(IB1,U,6)\1)'<1,$P(IB0,U,7)'="",$O(^IBA(364,"C",IBBA,0)) S ^TMP($J,"IBSORT",$P(IB0,U,7),$P(IB0,U),IBBA)=$P(IB1,U,6)_U_$P(IB0,U,4)
 ;
 W:$E(IOST,1,2)["C-" @IOF ;Only initial form feed for print to screen
 I '$D(^TMP($J,"IBSORT")) D HDR1("") W !,?3,"No data found for this report"
 S (IBSTOP,IBCT)=0
 ;
 S IBTYP=""
 F  S IBTYP=$O(^TMP($J,"IBSORT",IBTYP)) Q:IBTYP=""  D  G:IBSTOP STOP
 . S IBTYPN=$$EXPAND^IBTRE(364.1,.07,IBTYP)
 . D HDR1(IBTYPN)
 . S IBBAT=""
 . F  S IBBAT=$O(^TMP($J,"IBSORT",IBTYP,IBBAT)) Q:'IBBAT!(IBSTOP)  S IBBA=0 F  S IBBA=$O(^TMP($J,"IBSORT",IBTYP,IBBAT,IBBA)) Q:'IBBA  S IBV=$G(^(IBBA)) D  Q:IBSTOP
 .. D:IBLINE>(IOSL-5) HDR1(IBTYPN) Q:IBSTOP
 .. W !,?6,IBBAT,?20,$$FMTE^XLFDT($P(IBV,U),1),?46,$P(IBV,U,2)
 .. S IBCT=IBCT+1,IBLINE=IBLINE+1
 ;
 W !!,"TOTAL # OF BATCHES: ",IBCT
 ;
 I $E(IOST,1,2)["C-"  K DIR S DIR(0)="E" D ^DIR K DIR
STOP I '$D(ZTQUEUED) D ^%ZISC
 I $D(ZTQUEUED) S ZTREQ="@"
 K ^TMP($J,"IBSORT")
 Q
 ;
HDR1(IB) ; Report header
 ; IB = the text for the type of batch
 N Z,DIR,Y
 I 'IBPAGE S IBHDRDT=$$HTE^XLFDT($H,2)
 I IBPAGE D  Q:IBSTOP
 . I $E(IOST,1,2)["C-" K DIR S DIR(0)="E" D ^DIR K DIR S IBSTOP=('Y) Q:IBSTOP
 . W @IOF
 S IBPAGE=IBPAGE+1
 W !,?14,"REPORT OF BATCHES STILL WAITING AUSTIN RECEIPT AFTER 1 DAY",?70,"PAGE: ",IBPAGE,!,?((68-$L(IB))\2),"BATCH TYPE: "_IB
 W !,?26,"RUN DATE: ",IBHDRDT,!
 W !,?6,"BATCH #",?20,"WAITING SINCE",?46,"MAIL MESSAGE #",!
 S Z="",$P(Z,"-",76)="" W ?2,Z,!
 S IBLINE=6
 Q
 ;
