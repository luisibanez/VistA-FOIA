ACHSPCC6 ; IHS/ITSC/PMF - COPY ^ACHSPCC GLOBAL TO ^ACHSBCBS GLOBAL ;   [ 10/16/2001   8:16 AM ]
 ;;3.1;CONTRACT HEALTH MGMT SYSTEM;;JUN 11, 2001
 ;
 W !!,"NOT AN ENTRY POINT"
 Q
 ;
COPY ;EP - Copy DHR records for export to the FI (Inactive, 04-17-96).
 N X,Y,Z
 W !!,"COPYING DHR RECORD TYPE 2 RECORDS FOR EXPORT TO BCBS.",!
 S Z=500000,(X,Y)=0
COPY1 ;
 S X=$O(^ACHSPCC(X))
 G COPYEND:+X=0
 S Y=0
COPY2 ;
 S Y=$O(^ACHSPCC(X,Y))
 G COPY1:+Y=0
 S Z=Z+1,^ACHSBCBS(Z)=$G(^ACHSPCC(X,Y))
 G COPY2
 ;
COPYEND ;
 U IO(0)
 W !!,Z-500000," TYPE 2 RECORDS COPIED TO BLUE-CROSS FILE",!!
 Q
 ;