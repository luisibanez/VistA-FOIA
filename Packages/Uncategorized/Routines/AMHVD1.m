AMHVD1  ; IHS/TUCSON/LAB -VISIT DISPLAY ;         
 ;;4.0;IHS BEHAVIORAL HEALTH;;MAY 14, 2010
 ;
INTAKE ;EP
 Q
BUILD1 ;
 S AMHSTR=$E(AMHH,1,21)_":",AMHSTR=$$SETSTR^VALM1(AMHVAL,AMHSTR,24,$L(AMHVAL))
 D S^AMHVD(AMHSTR)
 Q
SAN ;EP
 Q
 Q:$P(^AMHREC(AMHV,0),U,33)=""
 I "SU"'[$P(^AMHREC(AMHV,0),U,33) Q
 S AMHSTR="=============== "_"BH SAN DATA ITEMS"_" ===============",X=(80-$L(AMHSTR)\2) D S^AMHVD(AMHSTR,1) ;$J("",X)_AMHSTR D S^AMHVD(AMHSTR)
 I $P(^AMHREC(AMHV,0),U,33)="U" D SANU Q
1 ;
 K AMHAR
 D ENP^XBDIQ1(9002011,AMHV,"7701;7702;7703;7704;7706;7707;7901","AMHAR(","E")
 S F=0 F  S F=$O(AMHAR(F)) Q:F'=+F  I AMHAR(F)]"" D
 .S AMHH=$P(^DD(9002011,F,0),U)
 .S AMHVAL=AMHAR(F)
 .D BUILD1
2 ;
 K AMHAR
 F AMHX=7709,7717,7711,7712 I $D(^DD(9002011,AMHX,0)),$O(^AMHREC(AMHV,AMHX,0)) D
 .S AMHSTR=$P(^DD(9002011,AMHX,0),U) D S^AMHVD(AMHSTR)
 .K AMHAR D ENP^XBDIQ1(9002011,AMHV,AMHX,"AMHAR(","E")
 .S F=0 F  S F=$O(AMHAR(AMHX,F)) Q:F'=+F  S AMHSTR=AMHAR(AMHX,F) D S^AMHVD(AMHSTR)
 .S AMHSTR="" D S^AMHVD(AMHSTR)
 .Q
3 ;
 K AMHAR
 D ENP^XBDIQ1(9002011,AMHV,7713,"AMHAR(","E")
 S F=0 F  S F=$O(AMHAR(F)) Q:F'=+F  I AMHAR(F)]"" D
 .S AMHH=$P(^DD(9002011,F,0),U)
 .S AMHVAL=AMHAR(F)
 .D BUILD1
4 ;
 K AMHAR
 F AMHX=7715 I $D(^DD(9002011,AMHX,0)),$O(^AMHREC(AMHV,AMHX,0)) D
 .S AMHSTR=$P(^DD(9002011,AMHX,0),U) D S^AMHVD(AMHSTR)
 .K AMHAR D ENP^XBDIQ1(9002011,AMHV,AMHX,"AMHAR(","E")
 .S F=0 F  S F=$O(AMHAR(AMHX,F)) Q:F'=+F  S AMHSTR=AMHAR(AMHX,F) D S^AMHVD(AMHSTR)
 .S AMHSTR="" D S^AMHVD(AMHSTR)
5 ;
 K AMHAR
 D ENP^XBDIQ1(9002011,AMHV,"7902;7719;7721;7722;7903;7904;7905","AMHAR(","E")
 S F=0 F  S F=$O(AMHAR(F)) Q:F'=+F  I AMHAR(F)]"" D
 .S AMHH=$P(^DD(9002011,F,0),U)
 .S AMHVAL=AMHAR(F)
 .D BUILD1
6 ;
 K AMHAR
 F AMHX=7724 I $D(^DD(9002011,AMHX,0)),$O(^AMHREC(AMHV,AMHX,0)) D
 .S AMHSTR=$P(^DD(9002011,AMHX,0),U) D S^AMHVD(AMHSTR)
 .K AMHAR D ENP^XBDIQ1(9002011,AMHV,AMHX,"AMHAR(","E")
 .S F=0 F  S F=$O(AMHAR(AMHX,F)) Q:F'=+F  S AMHSTR=AMHAR(AMHX,F) D S^AMHVD(AMHSTR)
 .S AMHSTR="" D S^AMHVD(AMHSTR)
 .Q
 S AMHSTR="" D S^AMHVD(AMHSTR)
 K AMHAR
 Q
SANU ;
 K AMHAR
 F AMHX=7801 I $D(^DD(9002011,AMHX,0)),$O(^AMHREC(AMHV,AMHX,0)) D
 .S AMHSTR=$P(^DD(9002011,AMHX,0),U) D S^AMHVD(AMHSTR)
 .K AMHAR D ENP^XBDIQ1(9002011,AMHV,AMHX,"AMHAR(","E")
 .S F=0 F  S F=$O(AMHAR(AMHX,F)) Q:F'=+F  S AMHSTR=AMHAR(AMHX,F) D S^AMHVD(AMHSTR)
 .S AMHSTR="" D S^AMHVD(AMHSTR)
 .Q
78 ;
 K AMHAR
 D ENP^XBDIQ1(9002011,AMHV,7802,"AMHAR(","E")
 S F=0 F  S F=$O(AMHAR(F)) Q:F'=+F  I AMHAR(F)]"" D
 .S AMHH=$P(^DD(9002011,F,0),U)
 .S AMHVAL=AMHAR(F)
 .D BUILD1
783 ;
 K AMHAR
 F AMHX=7803:1:7805 I $D(^DD(9002011,AMHX,0)),$O(^AMHREC(AMHV,AMHX,0)) D
 .S AMHSTR=$P(^DD(9002011,AMHX,0),U) D S^AMHVD(AMHSTR)
 .K AMHAR D ENP^XBDIQ1(9002011,AMHV,AMHX,"AMHAR(","E")
 .S F=0 F  S F=$O(AMHAR(AMHX,F)) Q:F'=+F  S AMHSTR=AMHAR(AMHX,F) D S^AMHVD(AMHSTR)
 .S AMHSTR="" D S^AMHVD(AMHSTR)
 .Q
786 ; 
 K AMHAR
 D ENP^XBDIQ1(9002011,AMHV,7806,"AMHAR(","E")
 S F=0 F  S F=$O(AMHAR(F)) Q:F'=+F  I AMHAR(F)]"" D
 .S AMHH=$P(^DD(9002011,F,0),U)
 .S AMHVAL=AMHAR(F)
 .D BUILD1
787 ;
 K AMHAR
 F AMHX=7808:1:7809 I $D(^DD(9002011,AMHX,0)),$O(^AMHREC(AMHV,AMHX,0)) D
 .S AMHSTR=$P(^DD(9002011,AMHX,0),U) D S^AMHVD(AMHSTR)
 .K AMHAR D ENP^XBDIQ1(9002011,AMHV,AMHX,"AMHAR(","E")
 .S F=0 F  S F=$O(AMHAR(AMHX,F)) Q:F'=+F  S AMHSTR=AMHAR(AMHX,F) D S^AMHVD(AMHSTR)
 .S AMHSTR="" D S^AMHVD(AMHSTR)
 .Q
7811 ;
 K AMHAR
 D ENP^XBDIQ1(9002011,AMHV,"7811;7812","AMHAR(","E")
 S F=0 F  S F=$O(AMHAR(F)) Q:F'=+F  I AMHAR(F)]"" D
 .S AMHH=$P(^DD(9002011,F,0),U)
 .S AMHVAL=AMHAR(F)
 .D BUILD1
7813 ;
 K AMHAR
 F AMHX=7813 I $D(^DD(9002011,AMHX,0)),$O(^AMHREC(AMHV,AMHX,0)) D
 .S AMHSTR=$P(^DD(9002011,AMHX,0),U) D S^AMHVD(AMHSTR)
 .K AMHAR D ENP^XBDIQ1(9002011,AMHV,AMHX,"AMHAR(","E")
 .S F=0 F  S F=$O(AMHAR(AMHX,F)) Q:F'=+F  S AMHSTR=AMHAR(AMHX,F) D S^AMHVD(AMHSTR)
 .S AMHSTR="" D S^AMHVD(AMHSTR)
 .Q
XIT ;
 K AMHAR
 Q
