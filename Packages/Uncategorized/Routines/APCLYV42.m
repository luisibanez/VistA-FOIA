APCLYV42 ; IHS/CMI/LAB - CLINIC VISIT COUNTS PRINT ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;
INIT ;initialize variables
 I APCLBD=APCLED,(APCLCL="A") G ^APCLYV43 ;print rtn for one date & all clinics
 I '$D(^XTMP("APCLYV4",APCLJOB,APCLBT)) S APCLPAGE=0,APCLSTOP="" D HEAD0
 S APCLPAGE=0,APCLSTOP="",APCLTOT=0 ;total count
 ;
SET ;set up print fields
 S APCLCLP=0
SET0 S APCLCLP=$O(^XTMP("APCLYV4",APCLJOB,APCLBT,APCLCLP)) G FINAL:APCLCLP=""
 S APCLCLX=0
SET1 S APCLCLX=$O(^XTMP("APCLYV4",APCLJOB,APCLBT,APCLCLP,APCLCLX)) G SET0:APCLCLX=""
 S (APCLVDT,APCLCTOT)=0 D HEAD
SET2 S APCLVDT=$O(^XTMP("APCLYV4",APCLJOB,APCLBT,APCLCLP,APCLCLX,APCLVDT))
 I APCLVDT="" D TOTALS G END:APCLSTOP="^",SET1
 S APCLCNT=^XTMP("APCLYV4",APCLJOB,APCLBT,APCLCLP,APCLCLX,APCLVDT),APCLCTOT=APCLCTOT+APCLCNT
 I $Y>(IOSL-5) D PAGE G:APCLSTOP="^" END
 W !?21,$E(APCLVDT,4,5),"/",$E(APCLVDT,6,7),"/",$E(APCLVDT,2,3)
 W ?45,$J(APCLCNT,5) G SET2
 ;
FINAL ;print grand totals
 G END:APCLCL'="A"
 I $Y>(IOSL-5) D PAGE G:APCLSTOP="^" END
 W !!?30,"TOTAL VISITS: ",$J(APCLTOT,5),!!
END ;
 D DONE^APCLOSUT
 K APCLCTOT,APCLTOT,APCLCLX,APCLVDT,APCLPAGE,APCLSTOP,APCLCNT,APCLCLP
 W:IOST'?1"C-".E @IOF
 K ^XTMP("APCLYV4",APCLJOB,APCLBT)
 Q
 ;
TOTALS ;print totals
 I $Y>(IOSL-5) D PAGE G:APCLSTOP="^" END
 W !!?21,"TOTAL VISITS FOR CLINIC:",?45,$J(APCLCTOT,5)
 S APCLTOT=APCLTOT+APCLCTOT
 ;
 I $E(IOST)="C",IO=IO(0) W ! S DIR(0)="E" D ^DIR K DIR I Y=0!(Y="^")!($D(DTOUT)) S APCLSTOP="^" Q
 Q
 ;
HEAD W:$D(IOF) @IOF S X=$P(^DIC(4,DUZ(2),0),"^"),APCLPAGE=APCLPAGE+1
 W !!,$P(^VA(200,DUZ,0),"^",2),?(80-$L(X)/2),X,?70,"Page ",APCLPAGE
 S X=$P($H,",",2) D TIME W !,Y
 S Y="" I $G(APCLCLX)]"" S Y=$S($D(^DIC(40.7,APCLCLX,0)):$P(^(0),"^",2),1:"??") ;clinic code
 S X="VISIT COUNTS FOR "_APCLCLP_" ("_Y_") "_"CLINIC"
 W ?(80-$L(X)/2),X
 S Y=DT X ^DD("DD") W !,Y
 W ?28,"for ",$E(APCLBD,4,5),"/",$E(APCLBD,6,7),"/",$E(APCLBD,2,3)
 W " to ",$E(APCLED,4,5),"/",$E(APCLED,6,7),"/",$E(APCLED,2,3)
 W !!?20,"VISIT DATES",?41,"NUMBER OF VISITS"
 Q
 ;
HEAD0 ;EP
 W:$D(IOF) @IOF S X=$P(^DIC(4,DUZ(2),0),"^"),APCLPAGE=APCLPAGE+1
 W !!,$P(^VA(200,DUZ,0),"^",2),?(80-$L(X)/2),X,?70,"Page ",APCLPAGE
 S X=$P($H,",",2) D TIME W !,Y
 S Y="" I $G(APCLCLX)]"" S Y=$S($D(^DIC(40.7,APCLCLX,0)):$P(^(0),"^",2),1:"??") ;clinic code
 S Y=DT X ^DD("DD") W !,Y
 W ?28,"for ",$E(APCLBD,4,5),"/",$E(APCLBD,6,7),"/",$E(APCLBD,2,3)
 W " to ",$E(APCLED,4,5),"/",$E(APCLED,6,7),"/",$E(APCLED,2,3)
 W !!!!,"NUMBER OF VISITS:  ","No visits to report." G END
PAGE ;form feed to new page
 I IOST'?1"C-".E D HEAD Q
 ;
 I $E(IOST)="C",IO=IO(0) W ! S DIR(0)="E" D ^DIR K DIR I Y=0!(Y="^")!($D(DTOUT)) S APCLSTOP="^" Q
 I APCLSTOP'="^" D HEAD
 Q
TIME S Y="" Q:'$D(X)  Q:X<0!(X>86400)
 S %A=X\60,%B=%A\60 S:%B>12 %B=%B-12 S:%B=0 %B=12 S:%B<10 %B=" "_%B
 S %C=$S(%A=0:"M ",%A=720:"N ",%A=1440:"M ",%A<720:"am",1:"pm")
 S Y=%B_":"_$E(%A#60+100,2,3)_" "_%C K %A,%B,%C Q
