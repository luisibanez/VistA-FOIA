PRSASR1 ; HISC/MGD-Display VCS, Fee, ED ;09/04/2003
 ;;4.0;PAID;**6,21,82**;Sep 21, 1995
VCS ; Display VCS Sales/Fee Basis
 ;
 N OLDPP
 S PAYP=$P($G(^PRSPC(DFN,0)),"^",21)
 ; Check the pay plan for the pay period we are dealing with
 ; in case it's a previous pay period where an employee
 ; had a different pay plan.
 ;  1st put pay period in YY-PP format 4 call 2 lookup old pay plan.
 ;Only check if called from option Display employee pay period PPERIOD
 ;will be defined.
 I $G(PPERIOD) D
 .;S PPERIOD=$S(Y["-":$P(Y,"^",2),1:$P(^PRST(458,$P(Y,"^"),0),"^"))
 .S OLDPP=$$OLDPP^PRS8UT(PPERIOD,DFN)
 .I OLDPP'=0,(OLDPP'=PAYP) D
 .. S PAYP=OLDPP
 .. W !,"Employee is NOT currently under this pay plan."
 ;
 W !!?30,$S(PAYP="F":"Fee Basis Appointee",1:"VCS Commission Sales")
 W !!?13,"Sun       Mon       Tue       Wed       Thu       Fri       Sat",!
 W !,"Week 1" S L1=1 F K=1:1:7 S L1=L1+10,Z1=$P(Z,"^",K) I Z1'="" W ?L1,$J(Z1,7,2)
 W !,"Week 2" S L1=1 F K=8:1:14 S L1=L1+10,Z1=$P(Z,"^",K) I Z1'="" W ?L1,$J(Z1,7,2)
 I PAYP="F" W !! F K=19:1:21 S Z1=$P(Z,"^",K) W "Total ",$P("Hours Days Procedures"," ",K-18),": ",Z1,"    "
 Q
ED ; Display Envir. Diff.
 W !!?26,"Environmental Differentials",!
 S Y="" F K=1:2:5 S Z1=$P(Z,"^",K) Q:'Z1  S:Y'="" Y=Y_"; " S Y=Y_$P($G(^PRST(457.6,+Z1,0)),"^",1)_" "_$P(Z,"^",K+1)_" Hrs."
 I Y'="" W !,"Week 1: ",Y
 S Y="" F K=7:2:11 S Z1=$P(Z,"^",K) Q:'Z1  S:Y'="" Y=Y_"; " S Y=Y_$P($G(^PRST(457.6,+Z1,0)),"^",1)_" "_$P(Z,"^",K+1)_" Hrs."
 I Y'="" W !,"Week 2: ",Y
 Q
 ;
LD ; Display changes to the Labor Distribution Codes within the Pay
 ; Period.
 ;
 N DASH,DESC,IENS,LDCC,LDCCB,LDCCEX,LDCODE,LDCNT,LDDOA,LDFCP
 N LDHOLD,LDPCT,LDTOI,PRSLD,Y
 S $P(DASH,"-",80)=""
 W !
 D LDHOLD
 W !,"Current Labor Distribution Values:"
 S LDDOA=$$GET1^DIQ(450,DFN,756,"E")
 S LDCCB=$$GET1^DIQ(450,DFN,755,"E")
 S LDTOI=$$GET1^DIQ(450,DFN,755.1,"E")
 W !,LDDOA,?24,LDCCB,?61,LDTOI
 F PRSLD=1:1:4 D
 . S LDCODE=$$GET1^DIQ(450.0757,PRSLD_","_DFN,1)
 . S LDPCT=$$GET1^DIQ(450.0757,PRSLD_","_DFN,2)
 . S LDCC=$$GET1^DIQ(450.0757,PRSLD_","_DFN,3)
 . S Y=LDCC,SUB454="CC"
 . D OT^PRSDUTIL K SUB454
 . S LDCCEX=$E(Y,1,30)
 . S LDFCP=$$GET1^DIQ(450.0757,PRSLD_","_DFN,4)
 . W !,"Code",PRSLD,": ",LDCODE,?12,LDPCT,?24,LDCC," - ",LDCCEX,?70,LDFCP
 ;
 W !!,"The previous Labor Distribution Values:"
 S LDCNT="A"
 S LDCNT=$O(^PRST(458,PPI,"E",DFN,"LDAUD",LDCNT),-1)
 Q:'LDCNT
 S IENS=LDCNT_","_DFN_","_PPI_","
 S LDDOA=$$GET1^DIQ(458.1105,IENS,1,"E")
 S LDCCB=$$GET1^DIQ(458.1105,IENS,2,"E")
 S LDTOI=$$GET1^DIQ(458.1105,IENS,3,"E")
 W !,LDDOA,?24,LDCCB,?61,LDTOI
 F PRSLD=1:1:4 D
 . S IENS=PRSLD_","_LDCNT_","_DFN_","_PPI_","
 . S LDCODE=$$GET1^DIQ(458.11054,IENS,1)
 . S LDPCT=$$GET1^DIQ(458.11054,IENS,2)
 . S LDCC=$$GET1^DIQ(458.11054,IENS,3)
 . S Y=LDCC,SUB454="CC"
 . D OT^PRSDUTIL K SUB454
 . S LDCCEX=$E(Y,1,30)
 . S LDFCP=$$GET1^DIQ(458.11054,IENS,4)
 . W !,"Code",PRSLD,": ",LDCODE,?12,LDPCT,?24,LDCC," - ",LDCCEX,?70,LDFCP
 Q
 ;
LDHDR ; Labor Distribution Header information
 ;
 W !?15,"Labor Distribution Changes within the Pay Period:"
 W !,"Date/Time",?24,"Changed by",?61,"Type of Interface"
 W !,"Code",?12,"Percent",?24,"Cost Center - Description"
 W ?65,"Fund Ctrl Pt"
 W !,DASH
 Q
 ;
LDHOLD ; Pause of more LD changes that will fit on 1 screen.
 ;
 N X
 S LDHOLD=$$ASK^PRSLIB00(1)
 S X=$G(^PRSPC(DFN,0))
 W !,@IOF,?3,$P(X,"^",1)
 S X=$P(X,"^",9)
 I X W ?68,$E(X,1,3),"-",$E(X,4,5),"-",$E(X,6,9)
 W !,DASH
 D LDHDR
 Q
