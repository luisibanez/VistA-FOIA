AQAQRE1 ;IHS/ASU/RPL 4/17/89 ;Staff Credentials Recredentialing Due Report-Part 2 ; 11/7/89  10:07 AM [ 07/26/1999  10:21 AM ]
 ;;2.2;STAFF CREDENTIALS;**8**;01 OCT 1992
 ;;AQAQ*2*8;Y2K FIX;CS;2990708
 ;
START S AQAQ80D="--------------------------------------------------------------------------------"
 S Y=DT X ^DD("DD") S AQAQDTP=Y
 S AQAQSTRT=""
 S AQAQPG=0 D HEAD
 S AQAQRCDU="" F I=0:0 S AQAQRCDU=$O(^UTILITY($J,AQAQRCDU)) Q:AQAQRCDU=""!($D(AQAQQUIT))  D P1
 G QUIT
P1 S Y=AQAQRCDU X ^DD("DD") S AQAQRCDY=Y I AQAQRCDY=0 S AQAQRCDY="Never Credentialed"
 S AQAQDFN="" F J=0:0 S AQAQDFN=$O(^UTILITY($J,AQAQRCDU,AQAQDFN)) Q:AQAQDFN=""!($D(AQAQQUIT))  D P15
 Q
P15 D:$Y>(IOSL-12) HEAD Q:$D(AQAQQUIT)
 S AQAQ=^UTILITY($J,AQAQRCDU,AQAQDFN)
 S AQAQNM=$P(AQAQ,"^"),AQAQSC=$P(AQAQ,"^",2),AQAQMLE=$P(AQAQ,"^",3),AQAQCME=$P(AQAQ,"^",4),AQAQHSV=$P(AQAQ,"^",5),AQAQCAD=$P(AQAQ,"^",6)
 S Y=AQAQMLE D DTCV S AQAQMLEY=Y
 S X1=AQAQMLE,X2=365+1 D C^%DTC S AQAQMLED=X,AQAQMLEO=$S(DT<X:"",1:"*******")
 S Y=AQAQMLED D DTCV S AQAQMLED=Y
 S Y=AQAQCME D DTCV S AQAQCMEY=Y
 S AQAQ1CAD=0 I 'AQAQCME S AQAQ1CAD=$O(^AQAQ(AQAQDFN,9,0)) S:AQAQ1CAD="" AQAQ1CAD=0
 I AQAQ1CAD S AQAQ1CAD=$P(^AQAQ(AQAQDFN,9,AQAQ1CAD,0),"^")
 S X1=$S(AQAQCME>0:AQAQCME,1:AQAQ1CAD),X2=365+1 D C^%DTC S AQAQCMED=X,AQAQCMEO=$S(X=0:"",DT<X:"",1:"*******")
 S Y=AQAQCMED D DTCV S AQAQCMED=Y
 S Y=AQAQHSV D DTCV S AQAQHSVY=Y
 S X1=AQAQHSV,X2=(365*2)+1 D C^%DTC S AQAQHSVD=X,AQAQHSVO=$S(DT<X:"",1:"*******")
 S Y=AQAQHSVD D DTCV S AQAQHSVD=Y
 S Y=AQAQCAD X ^DD("DD") S AQAQCADY=Y I AQAQCADY=0 S AQAQCADY="Pending Approval"
 W $E(AQAQNM,1,26),?28,$E(AQAQSC,1,20),?50,AQAQRCDY
 W !!,?48,"Current",?60,"Due",?70,"Overdue",!,?48,"--------",?60,"--------",?71,"-------"
 W !,?5,"Medical License Expires",?48,AQAQMLEY,?60,AQAQMLED,?71,AQAQMLEO,!
 W ?5,"CME Summary Last Updated",?48,AQAQCMEY,?60,AQAQCMED,?71,AQAQCMEO,!
 W ?5,"Last Health Status Verification",?48,AQAQHSVY,?60,AQAQHSVD,?71,AQAQHSVO,!
 W !,?5,"Board Certification:" I '$D(^AQAQ(AQAQDFN,1)) W " No Board Certification on file." G P2
 W ?33,"Certification",?50,"Verification",!,?5,"--------------------------",?33,"-------------",?50,"------------"
 S AQAQBC=0 F L=0:0 S AQAQBC=$O(^AQAQ(AQAQDFN,1,AQAQBC)) Q:AQAQBC=""  D P3
P2 W !!,?5,"Credentials Last Approved: ",AQAQCADY,!!!
 Q
P3 S AQAQBRD=^AQAQ(AQAQDFN,1,AQAQBC,0) Q:AQAQBRD=""
 S Y=$P(AQAQBRD,"^") X ^DD("DD") S AQAQBRDY=Y I AQAQBRDY=0 S AQAQBRDY=""
P31 S Y=$P(AQAQBRD,"^",3) X ^DD("DD") S AQAQBRDD=Y I AQAQBRDD=0 S AQAQBRDD=""
 S AQAQBRD=$P(AQAQBRD,"^",2) Q:AQAQBRD=""  S AQAQBRD=$P(^AQAQBD(AQAQBRD,0),"^")
 W !,?5,$E(AQAQBRD,1,20),?33,AQAQBRDY,?48,AQAQBRDD
 Q
HEAD S AQAQPG=AQAQPG+1 I $D(AQAQSTRT) K AQAQSTRT G HEAD1
 I $E(IOST)="C",IO=IO(0) R X:DTIME I $E(X)="^"!('$T) S AQAQQUIT="" Q
HEAD1 W @IOF
 W AQAQSITE,?58,AQAQDTP,?72,"Page ",AQAQPG,!
 W !,?26,"RECREDENTIALING DUE REPORT",!
 W !,"Name",?28,"Staff Category",?48,"Recredentialing Due Date"
 W !,AQAQ80D,!!
 Q
DTCV I Y=0 S Y="" Q
 ;BEGIN Y2K FIX BLOCK
 ;S Y=$E(Y,4,5)_"/"_$E(Y,6,7)_"/"_$E(Y,2,3) Q
 S Y=$E(Y,4,5)_"/"_$E(Y,6,7)_"/"_($E(Y,1,3)+1700) Q  ; Y2000
 ;END Y2K FIX BLOCK
QUIT Q
