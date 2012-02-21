SROAMEAS ;B'HAM ISC/MAM - INPUT TRANSFORMS, HEIGHT & WEIGHT ; [ 03/29/04  9:41 AM ]
 ;;3.0; Surgery ;**38,125**;24 Jun 93
H Q:'$D(X)  I X'?.N1"C",(+X'=X) K X Q
 I +X=X S X=X+.5\1 I X'>47.9!(X'<86.1) K X Q
 I X?.N1"C",(X'>121.9!(X'<218.1)) K X
 Q
W Q:'$D(X)  I +X'=X,(X'?.N1"K") K X Q
 I +X=X S X=X+.5\1 I X'>49.9!(X'<700.1) K X Q
 I X?.N1"K",(X'>22.9!(X'<318.1)) K X
 Q
