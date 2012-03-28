ACHSCPTH ; IHS/ITSC/PMF - PRINT CHS CPT CODE REPORT-BY VENDOR/DETAILED ;   [ 10/16/2001   8:16 AM ]
 ;;3.1;CONTRACT HEALTH MGMT SYSTEM;;JUN 11, 2001
 ;
 D BRPT^ACHSFU
 S (C,ACHSCHBS,ACHSCHBT,ACHSDOCS,ACHSCHAS,ACHSCHAT,ACHSDOCT,ACHS43T,ACHS57T,ACHS64T)=0
 S (ACHS43,ACHS57,ACHS64,ACHSV43,ACHSV57,ACHSV64)=0
 S (ACHSDOC,ACHSFLG,ACHSPAGE,ACHSVDCT,ACHSVCBT,ACHSVCAT)=0
 S (ACHS43S,ACHS57S,ACHS64S)=0
 S (ACHSDOCA,ACHSVNDR)=""
P1 ;EP
 S ACHSVNDR=$O(^TMP("ACHSCPT",$J,ACHSVNDR))
 G:ACHSVNDR="" TOTL
 I ACHSVNDR=0 S ACHSPAGE=0 G NODATA1^ACHSCPTI
 I $D(^TMP("ACHSCPT",$J,ACHSVNDR,0)) S ACHSPAGE=0 G NODATA^ACHSCPTI
 S ACHSCODE=""
P2 ;
 S ACHSCODE=$O(^TMP("ACHSCPT",$J,ACHSVNDR,ACHSCODE))
 G:ACHSCODE="" VNDRTOT
 S ACHSDOC=""
 D HEADER^ACHSCPTI
P3 ;
 S ACHSDOC=$O(^TMP("ACHSCPT",$J,ACHSVNDR,ACHSCODE,ACHSDOC))
 G:ACHSDOC="" SUBTOTL
 S ACHSDEN=""
P4 ;
 S ACHSDEN=$O(^TMP("ACHSCPT",$J,ACHSVNDR,ACHSCODE,ACHSDOC,ACHSDEN))
 G:ACHSDEN="" P3
GETADD ;Vendor address
 S ACHSVEN=$P($G(^TMP("ACHSCPT",$J,ACHSVNDR,ACHSCODE,ACHSDOC,ACHSDEN)),U,10)
 S Z=$G(^AUTTVNDR(ACHSVEN,13))
 S ACHSVADD=$S(Z="":"NOT ON FILE",1:$P(Z,U,1)),ACHSVCIT=$S(Z="":Z,1:$P(Z,U,2)),ACHSVST=$S(Z="":Z,1:$P(Z,U,3)),ACHSVST=$S(Z="":Z,1:$P($G(^DIC(5,ACHSVST,0)),U)),ACHSZIP=$S(Z="":Z,1:$P(Z,U,4))
 D HEADER1^ACHSCPTI:ACHSFLG=0
 S X=$G(^TMP("ACHSCPT",$J,ACHSVNDR,ACHSCODE,ACHSDOC,ACHSDEN))
GETSERV ;
 S ACHSSER=$P(X,U,1),ACHSSERV=$S(ACHSSER=1:"HOSP",ACHSSER=2:"DENT",ACHSSER=3:"OUTP",1:"UNKN")
 I ACHSSER=1 S ACHS43S=ACHS43S+1
 I ACHSSER=2 S ACHS57S=ACHS57S+1
 I ACHSSER=3 S ACHS64S=ACHS64S+1
 S ACHSFROM=$E($P(X,U,2),4,5)_"/"_$E($P(X,U,2),6,7)_"/"_$E($P(X,U,2),2,3)
 S ACHSTO=$E($P(X,U,3),4,5)_"/"_$E($P(X,U,3),6,7)_"/"_$E($P(X,U,3),2,3)
 S ACHSWLU=$P(X,U,4),ACHSCHB=$P(X,U,5),ACHSCHA=$P(X,U,6)
 S ACHSMSG=$P(X,U,7),ACHS2TH=$P(X,U,8),ACHSSURF=$P(X,U,9)
PRINT ;Prints data totals
 W !,ACHSDOC,?12,ACHSSERV,?17,ACHSFROM_"-"_ACHSTO,?35,$J(ACHSWLU,2),?41,$J(ACHSMSG,2),?45,$J(ACHS2TH,2),?51,$J(ACHSSURF,2)
 S X=ACHSCHB,X2=2
 D COMMA^%DTC
 W ?54,X
 S X=ACHSCHA,X2=2
 D COMMA^%DTC
 W ?67,X
 S ACHSCHBS=ACHSCHBS+ACHSCHB,ACHSCHAS=ACHSCHAS+ACHSCHA
 S ACHSDOCS=ACHSDOCS+1,ACHSFLG=1
 I IOST["P-",$Y>56 S ACHSFLG=0 D HEADER^ACHSCPTI,HEADER1^ACHSCPTI
 I IOST["C-",'$D(IO("S")),$Y>24 K DIR S DIR(0)="E" D ^DIR G END:Y=0 S ACHSFLG=0
 G P4
 ;
SUBTOTL ;
 W !!,$$REPEAT^XLFSTR("-",80),!,"SUBTOTAL",?25,$J(ACHSDOCS,4)
 S X=ACHSCHBS,X2="2$"
 D COMMA^%DTC
 W ?54,X
 S X=ACHSCHAS,X2="2$"
 D COMMA^%DTC
 W ?67,X
 I ACHSCHBS>0,ACHSCHAS>0 S X=(ACHSCHAS/ACHSCHBS)*100 W !!,"PERCENTAGE OF CHGS ALLOWED TO CHGS BILLED" W ?66,$E(X,1,5)_"%"
 W !!?3,"** HOSP - "_ACHS43S_" **",?32,"** DENT - "_ACHS57S_" **",?62,"** OUTP - "_ACHS64S_" **"
 S ACHSCHBT=ACHSCHBT+ACHSCHBS,ACHSCHAT=ACHSCHAT+ACHSCHAS,ACHSDOCT=ACHSDOCT+ACHSDOCS
 S ACHS43T=ACHS43T+ACHS43S,ACHS57T=ACHS57T+ACHS57S,ACHS64T=ACHS64T+ACHS64S
 S ACHSVDCT=ACHSVDCT+ACHSDOCS,ACHSVCBT=ACHSVCBT+ACHSCHBS,ACHSVCAT=ACHSVCAT+ACHSCHAS
 S ACHSV43=ACHSV43+ACHS43S,ACHSV57=ACHSV57+ACHS57S,ACHSV64=ACHSV64+ACHS64S
 K DIR
 I IOST["C-",'$D(IO("S")) S DIR(0)="E" W !! D ^DIR G END:Y=0
 S (C,ACHSCHBS,ACHSCHAS,ACHSDOCS,ACHSFLG,ACHS43S,ACHS57S,ACHS64S)=0
 G P2
 ;
VNDRTOT ;
 W !!,$$REPEAT^XLFSTR("=",80),!,"VENDOR TOTALS",?25,$J(ACHSVDCT,4)
 S X=ACHSVCBT,X2="2$"
 D COMMA^%DTC
 W ?56,X
 S X=ACHSVCAT,X2="2$"
 D COMMA^%DTC
 W ?68,X
 I ACHSVCBT>0,ACHSVCAT>0 S X=(ACHSVCAT/ACHSVCBT)*100 W !!,"PERCENTAGE OF CHGS ALLOWED TO CHGS BILLED" W ?66,$E(X,1,5)_"%"
 W !!?3,"** HOSP - "_ACHSV43_" **",?32,"** DENT - "_ACHSV57_" **",?62,"** OUTP - "_ACHSV64_" **"
 K DIR
 I IOST["C-",'$D(IO("S")) S DIR(0)="E" W !! D ^DIR G END:Y=0
 S (ACHSVDCT,ACHSVCBT,ACHSVCAT,ACHSPAGE,ACHSV43,ACHSV57,ACHSV64)=0
 G P1
 ;
TOTL ;
 W !!!!,$$REPEAT^XLFSTR("=",80),!!,"TOTAL",?25,$J(ACHSDOCT,4)
 S X=ACHSCHBT,X2="2$"
 D COMMA^%DTC
 W ?54,X
 S X=ACHSCHAT,X2="2$"
 D COMMA^%DTC
 W ?67,X
 I ACHSCHBT>0,ACHSCHAT>0 S X=(ACHSCHAT/ACHSCHBT)*100 W !!,"PERCENTAGE OF CHGS ALLOWED TO CHGS BILLED" W ?66,$E(X,1,5)_"%"
 W !!?3,"** HOSP - "_ACHS43T_" **",?32,"** DENT - "_ACHS57T_" **",?62,"** OUTP - "_ACHS64T_" **"
 I IOST["C-",'$D(IO("S")) K DIR S DIR(0)="E" W !! D ^DIR G END:Y=0
 Q
 ;
END ;
 K ACHSPAGE,C,ACHSCHBS,ACHSCHBT,ACHSDOCS,ACHSCHBT,ACHSDOCT
 K ACHS2TH,ACHS43S,ACHS43T,ACHS57S,ACHS57T,ACHS64S,ACHS64T
 K ACHSCHA,ACHSCHAS,ACHSCHB,ACHSCHBS,ACHSV64,ACHSVA
 K ACHSDOC,ACHSCODE,ACHSDEN,ACHSDOCA
 K ACHSIOQ,ACHSCHAT,ACHSVADD,ACHSVCIT,ACHSVEN,ACHSVNDR
 K ACHSVST,ACHSZIP,I,Z,ACHSFLG,X,X2,Y,^TMP("ACHSCPT",$J),ACHSFROM
 K ACHSMSG,ACHSSER,ACHSSERV,ACHSSURF,ACHSTO,ACHSV43,ACHSV57
 K ACHSVCAT,ACHSVCBT,ACHSVDCT,ACHSWLU,DIR
 G END^ACHSCPTI ;To close device, quit
 ;
