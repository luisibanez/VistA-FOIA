ADEPV1 ; IHS/HQT/MJL - DENTAL VISIT REPORT PT 2 ;09:25 AM  [ 03/24/1999   9:04 AM ]
 ;;6.0;ADE;;APRIL 1999
START ;EP - TASKMAN PROCESSING PHASE
 I $D(ZTQUEUED) L +@ADEGBL:1 I '$T S ZTREQ="@" G END
 D ^XBKVAR S ADEDT=ADEBDT-1,ADEDT=ADEDT_".9999"
 W:'$D(ZTQUEUED) !,"Please wait while I scan the records"
 S ADEFV=$O(^AUTTADA("B","0000",0)),ADEREV=$O(^AUTTADA("B","0190",0)),ADEBA=$O(^AUTTADA("B","9130",0)),ADECA=$O(^AUTTADA("B","9140",0)),ADEPTC=$O(^AUTTADA("B","9990",0))
ROLL S ADEDFN=0,ADEDT=$O(^ADEPCD("AC",ADEDT)) G:(ADEDT="")!(ADEDT>ADEND) ROLLEND I '$D(ZTQUEUED) W "."
RO1 S ADEDFN=$O(^ADEPCD("AC",ADEDT,ADEDFN)) G:ADEDFN="" ROLL
 G:'$D(^ADEPCD(ADEDFN,0)) RO1
 S ADEPAT=$P(^ADEPCD(ADEDFN,0),U)
 S ADELOE=$P(^ADEPCD(ADEDFN,0),U,3) G:ADELOE=""!('$D(^AUTTLOC(ADELOE))) RO1
 D:ADETITL["TRIB" TRIBE D:ADETITL["COMM" COMMUN D:ADETITL["FACI" FAC G:'ADEY RO1
 S:'$D(@ADEGBL@(ADELOE,ADECOM)) @ADEGBL@(ADELOE,ADECOM)="0^0^0^0"
 I $D(^ADEPCD(ADEDFN,"ADA","B",ADEREV)) S $P(@ADEGBL@(ADELOE,ADECOM),U,2)=$P(@ADEGBL@(ADELOE,ADECOM),U,2)+1
 I $D(^ADEPCD(ADEDFN,"ADA","B",ADEFV)) S $P(@ADEGBL@(ADELOE,ADECOM),U)=$P(@ADEGBL@(ADELOE,ADECOM),U)+1
 ;I $D(^ADEPCD(ADEDFN,"ADA","B",ADECA)) S $P(@ADEGBL@(ADELOE,ADECOM),U,3)=$P(@ADEGBL@(ADELOE,ADECOM),U,3)+1 G RO1
 I $D(^ADEPCD(ADEDFN,"ADA","B",ADEBA)) S $P(@ADEGBL@(ADELOE,ADECOM),U,3)=$P(@ADEGBL@(ADELOE,ADECOM),U,3)+1 ;G RO1
 I $D(^ADEPCD(ADEDFN,"ADA","B",ADEPTC)) S $P(@ADEGBL@(ADELOE,ADECOM),U,4)=$P(@ADEGBL@(ADELOE,ADECOM),U,4)+1
 G RO1
 ;
ROLLEND S @ADEGBL@(0)=ADEBDT_U_ADEND_U_DT_U_ADETITL
 ;
 I $D(ZTQUEUED),$D(IOT),IOT'="HFS" D  G END2
 . L -@ADEGBL
 . S ZTREQ=$H_U_ADEIOP_U_"DENTAL VISIT REPT PRINTING"_U_"PRINT^ADEPV1"
 I $D(ZTQUEUED) L -@ADEGBL ;MUST BE HFS
 ;
PRINT ;EP - TASKMAN PRINT PHASE
 I $D(ZTQUEUED) L +@ADEGBL:1 I '$T S ADENOLOK=1 G END
 S IOP=ADEIOP
 S %ZIS("IOPAR")=ADEIOPAR
 D ^%ZIS
 U IO
 S (ADEFVTT,ADERVTT,ADEBATT,ADENOCT,ADELOE)=0,ADEPAG=1,$P(ADELIN,"-",79)="",ADEBDT=$P(@ADEGBL@(0),U),ADEND=$P(@ADEGBL@(0),U,2)
 S Y=ADEBDT X ^DD("DD") S ADEBDT=Y,Y=ADEND X ^DD("DD") S ADEND=Y
P1 S ADECOM=0,ADELOE=$O(@ADEGBL@(ADELOE)) G:ADELOE="" FACTOT S ADEFAC=$P(^AUTTLOC(ADELOE,0),U,2)
 S (ADEFVT,ADERVT,ADEBAT,ADENOC,ADEQIT)=0 D EOP1 G:ADEQIT=1 END
P2 S ADECOM=$O(@ADEGBL@(ADELOE,ADECOM)) I ADECOM="" D TOTAL G P1
 W !,ADECOM S ADEDAT=@ADEGBL@(ADELOE,ADECOM)
 S ADEFVT=ADEFVT+$P(ADEDAT,U),ADERVT=ADERVT+$P(ADEDAT,U,2),ADEBAT=ADEBAT+$P(ADEDAT,U,3),ADENOC=ADENOC+$P(ADEDAT,U,4)
 W ?31,$J($P(ADEDAT,U),9),?41,$J($P(ADEDAT,U,2),9),?51,$J($P(ADEDAT,U,3),9),?61,$J($P(ADEDAT,U,4),9)
 S ADEQIT=0 D EOP G:ADEQIT=1 END G P2
FACTOT S ADEQIT=0 D EOP1 G:ADEQIT=1 END W @IOF,"TOTAL FOR ALL FACILITIES",?65,"PAGE ",ADEPAG
 W !,?35,"FIRST",?55,"BROKEN",!?35,"VISIT",?45,"REVISIT",?55,"APPTS",?65,"PTC",!,ADELIN
 W !!,?31,$J(ADEFVTT,9),?41,$J(ADERVTT,9),?51,$J(ADEBATT,9),?61,$J(ADENOCT,9)
 ;
END I $D(ZTQUEUED) S ZTREQ="@"
 L -@ADEGBL
 I '$D(ADENOLOK) K @ADEGBL
END2 ;
 D ^%ZISC
 K ADENOLOK,ADEIOP,ADEIOPAR
 K ADENOC,ADENOCT,ADEFAC,ADEFVT,ADEFVTT,ADERVT,ADERVTT,ADEBAT,ADEBATT,ADELOE,ADEOLD,ADELIN,ADEPAG,ADECOM,ADERPD,ADEDAT,ADEDT,ADEBDT,ADEND,ADEQIT
 K ADEBA,ADECA,ADEFV,ADEDFN,ADEREV,ADEVIS,ADEGBL,ADETITL,ADEPAT,ADEPTC,ADEY,ZTSK Q
 ;
EOP Q:$Y'>(IOSL-5)
EOP1 I ADEPAG'=1,$P(IOST,"-")["C" W *7 R !,X:DTIME I ('$T)!(X["^") S ADEQIT=1 Q
 D:ADELOE'="" HEADER Q
HEADER W @IOF,ADEFAC,"  ",ADETITL,?65,"PAGE ",ADEPAG,!,"FOR VISITS BETWEEN ",ADEBDT," AND ",$P(ADEND,"@")
 W !!,?35,"FIRST",?55,"BROKEN",!
 W $S(ADETITL["TRIB":"TRIBE",ADETITL["FACIL":"DENTIST",1:"COMMUNITY"),?35,"VISIT",?45,"REVISIT",?55,"APPTS",?65,"PTC",!,ADELIN
 S ADEPAG=ADEPAG+1 Q
TOTAL W !!,"TOTAL:",?31,$J(ADEFVT,9),?41,$J(ADERVT,9),?51,$J(ADEBAT,9),?61,$J(ADENOC,9) S ADEFVTT=ADEFVT+ADEFVTT,ADERVTT=ADERVT+ADERVTT,ADEBATT=ADEBAT+ADEBATT,ADENOCT=ADENOC+ADENOCT Q
 ;
TRIBE S ADEY=0
 Q:'$D(^ADEPCD(ADEDFN,0))
 S ADEPAT=$P(^ADEPCD(ADEDFN,0),U)
 Q:'$D(^AUPNPAT(ADEPAT,11))
 S ADECOM=$P(^AUPNPAT(ADEPAT,11),U,8) Q:ADECOM=""
 Q:'$D(^AUTTTRI(ADECOM,0))
 S ADECOM=$P(^AUTTTRI(ADECOM,0),U),ADECOM=$E(ADECOM,1,30)
 S ADEY=1
 Q
COMMUN S ADEY=0
 S ADEPAT=$P(^ADEPCD(ADEDFN,0),U)
 Q:'$D(^AUPNPAT(ADEPAT,11))
 S ADECOM=$P(^AUPNPAT(ADEPAT,11),U,18) Q:ADECOM=""
 S ADEY=1
 Q
FAC S ADEY=0
 S ADECOM=$P(^ADEPCD(ADEDFN,0),U,4) Q:ADECOM=""
 Q:'$D(^DIC(16,ADECOM,0))
 S ADECOM=$P(^DIC(16,ADECOM,0),U)
 S ADEY=1
 Q
