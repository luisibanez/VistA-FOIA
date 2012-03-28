BGP0DPEF ; IHS/CMI/LAB - IHS gpra print ;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;
 ;
7 ;EP
 S X=""
 D S^BGP0DPED(" ",1,1) D S^BGP0DPED(" ",1,1) ;S X=$P(^BGPPEIT(BGPIC,0),U,2) D S^BGP0DPED(X,1,1)
 D H1^BGP0PDL1
 D S^BGP0DPED(" ",1,1)
 S BGPCYD=$$V^BGP0DPED(1,BGPRPT,11,19)
 S BGPPRD=$$V^BGP0DPED(2,BGPRPT,11,19)
 S BGPBLD=$$V^BGP0DPED(3,BGPRPT,11,19)
 I $G(BGPSEAT) S X=$P(^DIBT(BGPSEAT,0),U,1)_" Population w/ Pat Ed" D S^BGP0DPED(X,1,1)
 I '$G(BGPSEAT) S X="# User Pop w/ Pat Ed" D S^BGP0DPED(X,1,1)
 S Y=BGPCYD_"^^"_BGPPRD_"^^^"_BGPBLD D S^BGP0DPED(Y,,2)
 D S^BGP0DPED(" ",1,1)
 S X="Goal Setting" D S^BGP0DPED(X,1,1)
 S N=11,P=20 D SETN^BGP0DPED
 S X="# w/goal set" D S^BGP0DPED(X,1,1)
 D H2^BGP0PDL1
 S N=11,P=21 D SETN^BGP0DPED
 S X="# w/goal not set" D S^BGP0DPED(X,1,1)
 D H2^BGP0PDL1
 S N=11,P=22 D SETN^BGP0DPED
 S X="# w/goal met" D S^BGP0DPED(X,1,1)
 D H2^BGP0PDL1
 S N=11,P=23 D SETN^BGP0DPED
 S X="# w/goal not met" D S^BGP0DPED(X,1,1)
 D H2^BGP0PDL1
 Q
