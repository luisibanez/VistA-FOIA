LRAPV ; IHS/DIR/AAB - ANAT PATH REPORTS NOT VERIFIED 2/13/98 09:57 ; [ 07/09/1998 9:18 AM ]
 ;;5.2;LR;**1002,1006**;SEP 01, 1998
 ;
 ;;5.2;LAB SERVICE;**72,201**;Sep 27, 1994
A D ^LRAP G:'$D(Y) END S LR("AU1")=$S(LRSS="AU":1,1:0) I LR("AU1") S LRB=1 G DEV
ASK W !!?3,"1) List of unverified ",LRO(68)," reports",!?3,"2) List of unverified ",LRO(68)," supplementary reports",!,"Select 1 or 2: " R X:DTIME G:X=""!(X[U) END I X'=1,X'=2 W $C(7),!!,"Enter a '1' or a '2'" G ASK
DEV S:'LR("AU1") LRB=X D B^LRU G:Y<0 END
 S ZTRTN="QUE^LRAPV" D BEG^LRUTL G:POP!($D(ZTSK)) END
QUE U IO S LRSDT=LRSDT-.01,LRLDT=LRLDT+.99 D XR^LRU,L^LRU,S^LRU,H S LR("F")=1
 F  S LRSDT=$O(^LR(LRXR,LRSDT)) Q:'LRSDT!(LRSDT>LRLDT)!(LR("Q"))  D Y
 D END^LRUTL,END Q
Y ;F P=0:0 S P=$O(^LR(LRXR,LRSDT,P)) Q:'P!(LR("Q"))  S X=^LR(P,0),Y=$P(X,"^",3),(LRDPF,X)=$P(X,"^",2),X=^DIC(X,0,"GL"),X=@(X_Y_",0)") S LRP=$P(X,"^"),SSN=$P(X,"^",9) D SSN^LRU,I
 F P=0:0 S P=$O(^LR(LRXR,LRSDT,P)) Q:'P!(LR("Q"))  S X=^LR(P,0),(DFN,Y)=$P(X,"^",3),(LRDPF,X)=$P(X,"^",2),X=^DIC(X,0,"GL"),X=@(X_Y_",0)") S LRP=$P(X,"^"),SSN=$P(X,"^",9) D SSN^LRU,I  ;IHS/ANMC/CLS 11/1/95
 Q
I I LR("AU1") S X=$G(^LR(P,LRSS)) Q:'+X!($P($P(X,"^",6)," ")'=LRABV)  I '$P(X,"^",15) S LRDATE=X D W Q
 F I=0:0 S I=$O(^LR(LRXR,LRSDT,P,I)) Q:'I!(LR("Q"))  D:$Y>(IOSL-6) H Q:LR("Q")  D @LRB
 Q
N ;
 Q
1 S X=$G(^LR(P,LRSS,I,0)) Q:$P($P(X,"^",6)," ")'=LRABV  I $L(X),'$P(X,"^",11) S LRDATE=^(0) D W
 Q
W ;W !,$$FMTE^XLFDT(LRDATE,"D"),?19,$J($P(LRDATE,"^",6),5),?32,LRP,?63,SSN S A=0 F  S A=$O(^LR(P,LRSS,+$G(I),97,A)) Q:'A!(LR("Q"))  S B=^(A,0) D:$Y>(IOSL-6) H1 Q:LR("Q")  W !?3,B
 W !,$$FMTE^XLFDT(LRDATE,"D"),?19,$J($P(LRDATE,"^",6),5),?32,LRP,?63,HRCN S A=0 F  S A=$O(^LR(P,LRSS,+$G(I),97,A)) Q:'A!(LR("Q"))  S B=^(A,0) D:$Y>(IOSL-6) H1 Q:LR("Q")  W !?3,B  ;IHS/ANMC/CLS 11/1/95
 Q
 ;
2 Q:$P($P($G(^LR(P,LRSS,I,0)),"^",6)," ")'=LRABV  S LRC=0 F A=0:0 S A=$O(^LR(P,LRSS,I,1.2,A)) Q:'A  I '$P(^(A,0),"^",2) S LRC=1 Q
 I LRC S LRDATE=^LR(P,LRSS,I,0) D W
 Q
H I $D(LR("F")),IOST?1"C".E D M^LRU Q:LR("Q")
 D F^LRU W !,LRO(68)," (",LRABV,") UNVERIFIED" W:LRB=2 " SUPPLEMENTARY" W " REPORTS",!,"BY DATE SPECIMEN TAKEN FROM ",LRSTR," TO ",LRLST,!,"DATE",?15,"Accession number",?32,"Patient",?66,"SSN",!,LR("%") Q
 ;
H1 ;D H Q:LR("Q")  W !?19,$J($P(LRDATE,"^",6),5),?32,LRP,?63,SSN Q
 D H Q:LR("Q")  W !?19,$J($P(LRDATE,"^",6),5),?32,LRP,?63,HRCN Q  ;IHS/ANMC/CLS 11/1/95
END D V^LRU Q
