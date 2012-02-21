PSOPRI ;BIR/JLC - INTERNET PRESCRIPTION REFILL PROCESSOR ;3/27/06 2:23pm
 ;;7.0;OUTPATIENT PHARMACY;**116,204,242**;DEC 1997
 ;
 ;Reference to ^PPPPDA1 supported by DBIA 1374
 ;Reference to ^PSSLOCK supported by DBIA 2789
 ;
 ;PSO*242 do not init PSODFN, it should only be set by label print
 ;
START S PSOVEX=1
 K PSOVEXI,PSOISITE,PSOVEXFL,PSONOF
 S PSOVX=0 F  S PSOVX=$O(^PS(59,PSOVX)) Q:'PSOVX  I $P($G(^PS(59,PSOVX,"I")),"^"),DT>$P($G(^("I")),"^") S PSOVEXI(PSOVX)=""
 I $O(PSOVEXI(0)) W !,"Looking for refill requests for inactive Outpatient divisions..." D
 . S PSOVIN=0 F  S PSOVIN=$O(^PS(52.43,"AINST",PSOVIN)) Q:'PSOVIN  S PSOVXLP="" F  S PSOVXLP=$O(^PS(52.43,"AINST",PSOVIN,PSOVXLP)) Q:PSOVXLP=""  D
 .. S PSOIEN=$O(^PS(52.43,"AINST",PSOVIN,PSOVXLP,""))
 .. S PSOISITE=$P($G(^PSRX(PSOVXLP,2)),"^",9) Q:$G(PSOVEXI(+$G(PSOISITE)))
 .. I PSOISITE,$D(PSOVEXI(PSOISITE)),$P($G(^PS(52.43,PSOIEN,0)),"^",5)="" S PSOVEXI(PSOISITE)=1,PSOVEXFL=1
 . I '$G(PSOVEXFL) W ".none found.",!
 I $G(PSOVEXFL) W !!,"The following Inactive Outpatient sites have refill requests:",! D  I Y'=1 G END
 . S PSOVX=0 F  S PSOVX=$O(PSOVEXI(PSOVX)) Q:'PSOVX  I $G(PSOVEXI(PSOVX)) W !?5,$P($G(^PS(59,+$G(PSOVX),0)),"^")
 . K DIR W ! S DIR(0)="E",DIR("A")="Press Return to Continue, '^' to exit" D ^DIR W ! I Y'=1 Q
 D:'$D(PSOPAR) ^PSOLSET G:'$D(PSOPAR) END
 W !!!?20,"Division: "_$P(^PS(59,PSOSITE,0),"^"),!!
 S PSOBBC1("FROM")="REFILL",PSOBBC("QFLG")=0,PSOBBC("DFLG")=0
 I '$D(^PS(52.43,"AINST",PSOINST)) S PSOANS="N" W !!?7,$C(7),"There are no internet refills to process." G END
 D ASK^PSOBBC W:PSOBBC("QFLG")=1 !?7,$C(7),"No internet refills were processed." G:PSOBBC("QFLG")=1 END
IPR W ! S DIR("B")="YES",DIR("A")="Process internet refill requests at this time",DIR(0)="Y" D ^DIR K DIR S PSOANS="N" I $G(DIRUT) S PSOPTRX="" G END
 G:Y=0 END S PSOPTRX="" I Y=1 S PSOANS="Y"
 I PSOANS["Y" S DIR("B")="NO",DIR("A")="Process internet refills for all divisions",DIR(0)="Y" D ^DIR K DIR S PSOANS2="S" S:Y=1 PSOANS2="M" I $G(DIRUT) S PSOANS="N" G END
IPR6 I PSOANS["Y",$G(PSOPTRX),'$G(PSOMHV) D IPR5 ;MARK PROCESSED NODES
 D IPR3 I $G(PSOANS)="N" D ULK G END
 ;I $P(X,"-")'=PSOINST W !?7,$C(7),$C(7),$C(7),"Not from this institution.",! D ULK G IPR6
 S (PSOBBC("IRXN"),PSOBBC("OIRXN"))=$P(X,"-",2)
 I $G(^PSRX(PSOBBC("IRXN"),0))']"" W !,$C(7),"Rx data is not on file!",! D ULK G IPR6
 I $P($G(^PSRX(PSOBBC("IRXN"),"STA")),"^")=13 W !,$C(7),"Rx has already been deleted." D ULK G IPR6
 I $G(PSOBBC("DONE"))[PSOBBC("IRXN")_"," W !,$C(7),"Rx has already been entered." D ULK G IPR6
 K X,Y D:PSOBBC("QFLG") PROCESSX^PSOBBC
 S PSOSELSE=0 I $G(PSODFN)'=$P(^PSRX(PSOBBC("IRXN"),0),"^",2) S PSOSELSE=1 D PT^PSOBBC I $G(PSOBBC("DFLG")) K PSOSELSE D ULK G IPR6
 I '$G(PSOSELSE) D PTC^PSOBBC I $G(PSOBBC("DFLG")) K PSOSELSE D ULK G IPR6
 K PSOSELSE D PROFILE^PSORX1 S X="PPPPDA1" X ^%ZOSF("TEST") I  S X=$$PDA^PPPPDA1(PSODFN) W !!
 S PSOBBC("DONE")=PSOBBC("IRXN")_",",PSOMHV=0 D REFILL^PSOBBC D ULK G IPR6
 Q
IPR3 K PSOBBC("IRXN"),PSOXFLAG F  S PSOPTRX=$O(^PS(52.43,"AINST",PSOINST,PSOPTRX)) D  Q:PSOANS="N"!($G(PSOXFLAG))
 .I PSOPTRX="" S PSOANS="N" Q
 .S PSOIEN=$O(^PS(52.43,"AINST",PSOINST,PSOPTRX,""))
 .I '$D(^PSRX(+PSOPTRX,0)),$P(^PS(52.43,PSOIEN,0),"^",5)="" S PSONOF=1 D IPR5 K PSONOF Q  ;SKIPS ERRONEOUS ENTRIES
IPR4 .I PSOANS["Y" Q:$P(^PS(52.43,PSOIEN,0),"^",5)'=""  S X=PSOINST_"-"_PSOPTRX     ;SKIPS ENTRIES ALREADY PROCESSED AND FORMATS VARIABLE X
IPR10 .I PSOANS2["S",$D(^PSRX(+PSOPTRX,0)),PSOSITE'=$P($G(^PSRX(+PSOPTRX,2)),"^",9) Q
 .S PSOPSORX=+$G(PSOPTRX) I PSOPSORX D PSOL^PSSLOCK(PSOPSORX) I '$G(PSOMSG) K PSOPSORX,PSOMSG Q
 .K PSOMSG S PSOXFLAG=1
 Q
 ;LINES CALLED TO MARK PROCESSED NODES
IPR5 K DA,DR,DIE S DA=$O(^PS(52.43,"AINST",PSOINST,PSOPTRX,""))
 S DIE="^PS(52.43,",DR="5////"_DT_";6///"_$S($G(PSOBBC("DFLG"))=1:"NOT FILLED",$G(PSONOF)=1:"NOT FILLED",1:"FILLED") D ^DIE ; MARKS NODE AS PROCESSED
 K ^PS(52.43,"AINST",PSOINST,PSOPTRX,DA)
 Q
END D PROCESSX^PSOBBC
 I $P($G(^PS(59,+$G(PSOSITE),"I")),"^"),DT>$P($G(^("I")),"^") D FINAL^PSOLSET W !!,"Your Outpatient Site parameters have been deleted because you selected an",!,"inactive Outpatient Site!",!
 K DIR,PSOBBC,PSOBBC1,PSOVIN,PSOISITE,PSOVEXFL,PSOVXLP,PSOVEX,PSOVX,PSOVEXI,PSOANS,PSOANS2,PSOPTRX,PSOXFLAG,PSOPSORX,X,Y,PSODFN,PSOMHV
 Q
ULK ;
 I '$G(PSOPSORX) Q
 D PSOUL^PSSLOCK(PSOPSORX)
 K PSOPSORX
 Q
