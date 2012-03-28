AZQ2RXP1 ;IHS/ASU/RPL;PRINT PVT INS. AND PRESCRIPTION INFO; ; 8/31/89  10:33 AM
 ;Version 1.1
 ;Called from AZQ2RXP
START ;
 S AZQ280D="--------------------------------------------------------------------------------" ;80 DASHES
 S Y=AZQ2SD X ^DD("DD") S AZQ2SDY=Y S Y=AZQ2FD X ^DD("DD") S AZQ2FDY=Y S Y=DT X ^DD("DD") S AZQ2DTP=Y
 S AZQ2PG=0 D HEAD
 S AZQ2DFN="" F I=0:0 S AZQ2DFN=$O(^UTILITY($J,AZQ2DFN)) G:AZQ2DFN=""!($D(AZQ2QUIT)) DONE D C1
C1 S AZQ2HRN=$P(AZQ2DFN,"."),DFN=$P(AZQ2DFN,".",2)
 S AZQ2DPT=^DPT(DFN,0),AZQ2NAME=$P(AZQ2DPT,"^"),Y=$P(AZQ2DPT,"^",3) X ^DD("DD")
 I $Y>(IOSL-8) D HEAD Q:$D(AZQ2QUIT)
 W !!,$J(AZQ2HRN,6),?8,AZQ2NAME,?40,Y
SCRIP S AZQ2DT="" F K=0:0 S AZQ2DT=$O(^UTILITY($J,AZQ2DFN,AZQ2DT)) Q:AZQ2DT'=+AZQ2DT!($D(AZQ2QUIT))  D C2
 Q
C2 S AZQ2PRVI=0 F J=0:0 S AZQ2PRVI=$O(^AUPNPRVT(DFN,11,AZQ2PRVI)) Q:AZQ2PRVI'=+AZQ2PRVI!($D(AZQ2QUIT))  D PI
 D SUBHD Q:$D(AZQ2QUIT)
 S AZQ2PDFN="" F L=0:0 S AZQ2PDFN=$O(^UTILITY($J,AZQ2DFN,AZQ2DT,AZQ2PDFN)) Q:AZQ2PDFN'=+AZQ2PDFN!($D(AZQ2QUIT))  D PRNT
 W ! Q
PI S AZQ2PRV=^AUPNPRVT(DFN,11,AZQ2PRVI,0)
 S AZQ2PRVE=$P(AZQ2PRV,"^",7),AZQ2PRVS=$P(AZQ2PRV,"^",6) I AZQ2PRVE]"",AZQ2PRVE<AZQ2S Q
 Q:AZQ2PRVS>AZQ2DT
 I $Y>(IOSL-6) D HEAD
 W !!,?8,$P(^AUTNINS(+AZQ2PRV,0),"^"),?40,$P(AZQ2PRV,"^",2)
 W !,?8,$P(AZQ2PRV,"^",4) I $P(AZQ2PRV,"^",5)]"" W ?40,$P(^AUTTRLSH($P(AZQ2PRV,"^",5),0),"^")
 W ! Q
PRNT I $Y>(IOSL-5) D HEAD Q:$D(AZQ2QUIT)
 S AZQ2N0=^PSRX(AZQ2PDFN,0),AZQ2DDFN=$P(AZQ2N0,"^",6),AZQ2QTY=$P(AZQ2N0,"^",7)
 S Y=AZQ2DT X ^DD("DD")
 W !,?8,Y
 W ?21,$P(^PSDRUG(AZQ2DDFN,0),"^")
 I $D(^PSDRUG(AZQ2DDFN,2)) S AZQ2NDC=$P(^(2),"^",4) W ?50,AZQ2NDC
 S AZQ2PPDU=$S($P(^PSRX(AZQ2PDFN,0),"^",17)>0:$P(^(0),"^",17),$D(^PSDRUG(AZQ2DDFN,660)):$P(^(660),"^",6),1:0),AZQ2CST=AZQ2QTY*AZQ2PPDU,AZQ2DU=$S($D(^PSDRUG(AZQ2DDFN,660)):$P(^(660),"^",8),1:""),AZQ2BILL=4.5+AZQ2CST
 W !,?21,AZQ2QTY_" "_AZQ2DU_" at $"_$J(AZQ2PPDU,6,3)_" each",?64,$J(AZQ2CST,6,2),?72,$J(AZQ2BILL,6,2),!
 Q
HEAD S AZQ2PG=AZQ2PG+1 G:AZQ2PG=1 HEAD1
 I $E(IOST)="C",IO=IO(0) R "Press <RETURN> to continue. ",X:DTIME I $E(X)="^"!('$T) S AZQ2QUIT="" Q
HEAD1 W @IOF
 W $P(^DIC(4,DUZ(2),0),"^"),?59,AZQ2DTP,?73,"Page ",AZQ2PG,!
 W !,"Prescriptions between "_AZQ2SDY_" and "_AZQ2FDY_" for Prvt. Insurance Eligibles."
 W !!,?2,"HRCN",?8,"Patient Name",?40,"DOB",!!,?8,"Insurer",?40,"Policy Number",!,?8,"Name of Insured",?40,"Relationship"
 W !,AZQ280D
 Q
SUBHD I $Y>(IOSL-8) D HEAD Q:$D(AZQ2QUIT)
 W !,?8,"Fill Date",?21,"Drug",?50,"NDC Code",?66,"Cost",?74,"Bill",!,?8,"-----------",?21,"---------------------------",?50,"------------",?64,"------",?72,"------"
 Q
DONE Q:$D(AZQ2QUIT)  I $E(IOST)="C",IO=IO(0) R "End of Report. Press <RETURN> to continue. ",X:DTIME
 Q
