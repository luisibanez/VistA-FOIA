BGP6ELP1 ; IHS/CMI/LAB - print ind 1 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
 ;
I1 ;EP ; diabetes prevalence
 D H1^BGP6DPH ;column headers
I1A1 ;001.A, 001.B, 001.C
 F BGPPC1="1.1","1.2","1.3" Q:BGPQUIT  D PI
 D I1AGE
 Q
I2 ;EP
 I $Y>(BGPIOSL-13) D HEADER^BGP6DPH Q:BGPQUIT  W !!,^BGPELIS(BGPIC,53,1,0)
 D H1^BGP6DPH
 F BGPPC1="2.1" Q:BGPQUIT  D PI
 D I1AGE^BGP6EL12
 Q
I3 ;EP
 I $Y>(BGPIOSL-13) D HEADER^BGP6DPH Q:BGPQUIT  W !!,^BGPELIS(BGPIC,53,1,0)
 D H1^BGP6DPH
 F BGPPC1="3.1" Q:BGPQUIT  D PI
 D I1AGE^BGP6EL13
 Q
I4 ;EP
 I $Y>(BGPIOSL-13) D HEADER^BGP6DPH Q:BGPQUIT  W !!,^BGPELIS(BGPIC,53,1,0)
 D H1^BGP6DPH
 F BGPPC1="4.1" Q:BGPQUIT  D PI
 D I1AGE^BGP6EL14
 Q
I5 ;EP
 I $Y>(BGPIOSL-13) D HEADER^BGP6DPH Q:BGPQUIT  W !!,^BGPELIS(BGPIC,53,1,0)
 D H1^BGP6DPH
 F BGPPC1="5.1" Q:BGPQUIT  D PI
 D I1AGE^BGP6EL15
 Q
I6 ;EP
 I $Y>(BGPIOSL-13) D HEADER^BGP6DPH Q:BGPQUIT  W !!,^BGPELIS(BGPIC,53,1,0)
 D H1^BGP6DPH
 F BGPPC1="6.1" Q:BGPQUIT  D PI
 D I1AGE^BGP6EL16
 Q
I7 ;EP
 D H1^BGP6DPH
 F BGPPC1="7.1" Q:BGPQUIT  D PI
 D I1AGE^BGP6EL17
 Q
I8 ;
 D H1^BGP6DPH
 F BGPPC1="8.1" Q:BGPQUIT  D PI
 D I1AGE^BGP6EL18
 Q
I9 ;EP
 D H1^BGP6DPH
 F BGPPC1="9.1" Q:BGPQUIT  D PI
 D I1AGE^BGP6EL19
 Q
I10 ;EP
 D H1^BGP6DPH
 F BGPPC1="10.1" Q:BGPQUIT  D PI
 D I1AGE^BGP6EL10
 Q
I11 ;EP
 D H1^BGP6DPH
 F BGPPC1="11.1" Q:BGPQUIT  D PI
 D I1AGE^BGP6EL1A
 Q
I12 ;EP
 D H1^BGP6DPH
 F BGPPC1="12.1","12.2","12.3" Q:BGPQUIT  D PI
 D I1AGE^BGP6EL1B
 Q
I13 ;EP
 D H1^BGP6DPH
 F BGPPC1="13.1","13.2","13.3" Q:BGPQUIT  D PI
 D I1AGE^BGP6EL1C
 Q
I14 ;EP
 D H1^BGP6DPH
 F BGPPC1="14.1" Q:BGPQUIT  D PI
 D I1AGE^BGP6EL1D
 Q
I15 ;EP
 D H1^BGP6DPH
 F BGPPC1="15.1","15.2","15.3" Q:BGPQUIT  D PI
 D I1AGE^BGP6EL1E
 Q
I16 ;EP
 D H1^BGP6DPH
 F BGPPC1="16.1","16.2","16.3" Q:BGPQUIT  D PI
 D I1AGE^BGP6EL1F
 Q
I17 ;EP
 D H1^BGP6DPH
 F BGPPC1="17.1","17.2","17.3" Q:BGPQUIT  D PI
 D I1AGE^BGP6EL1G
 Q
I18 ;EP
 D H1^BGP6DPH
 F BGPPC1="18.1","18.2","18.3" Q:BGPQUIT  D PI
 D I1AGE^BGP6EL1H
 Q
I19 ;EP
 D H1^BGP6DPH
 F BGPPC1="19.1" Q:BGPQUIT  D PI
 D I1AGE^BGP6EL1I
 Q
IELDFSA ;EP
 D H1^BGP6DPH
 F BGPPC1="22.1","22.2","22.3" Q:BGPQUIT  D PI
 D I1AGE^BGP6EL1J
 Q
IELDASA ;EP
 D H1^BGP6DPH
 F BGPPC1="23.1" Q:BGPQUIT  D PI
 S BGPNODEN=1 S BGPPC1="23.2" Q:BGPQUIT  D PI K BGPNODEN
 D I1AGE^BGP6EL1K
 Q
IELDPHA ;EP
 D IELDPHA^BGP6EL1L
 Q
IRAO ;EP
 D H1^BGP6DPH
 F BGPPC1="20.1" Q:BGPQUIT  D PI
 D I1AGE^BGP6EL1M
 Q
IRAA ;EP
 D H1^BGP6DPH
 F BGPPC1=$P(^BGPELIS(BGPIC,0),U,6)_".1" Q:BGPQUIT  D PI
 D I1AGE^BGP6EL1N
 Q
PI ;EP
 S BGPDENP=0
 S BGPPC2=0 F  S BGPPC2=$O(^BGPELIIS("AB",BGPPC1,BGPPC2)) Q:BGPPC2=""  S BGPPC=$O(^BGPELIIS("AB",BGPPC1,BGPPC2,0)) D PI1
 Q
PI1 ;
 S BGPDF=$P(^BGPELIIS(BGPPC,0),U,8)
 ;get denominator value of measure
 S BGPNP=$P(^DD(90376.03,BGPDF,0),U,4),N=$P(BGPNP,";"),P=$P(BGPNP,";",2)
 S BGPCYD=$$V(1,BGPRPT,N,P)
 S BGPPRD=$$V(2,BGPRPT,N,P)
 S BGPBLD=$$V(3,BGPRPT,N,P)
 ;write out denominator
 I 'BGPDENP D
 .Q:$G(BGPNODEN)  ;no denominator to display
 .I $Y>(BGPIOSL-13) D HEADER^BGP6DPH Q:BGPQUIT  W !!,^BGPELIS(BGPIC,53,1,0) D H1^BGP6DPH
 .W !!,$P(^BGPELIIS(BGPPC,0),U,17)
 .I $P(^BGPELIIS(BGPPC,0),U,18)]"" D
 ..W !,$P(^BGPELIIS(BGPPC,0),U,18)
 .I $P(^BGPELIIS(BGPPC,0),U,21)]""  D
 ..W !,$P(^BGPELIIS(BGPPC,0),U,21)
 .W ?20,$$C(BGPCYD,0,8),?35,$$C(BGPPRD,0,8),?58,$$C(BGPBLD,0,8),!
 .S BGPDENP=1
 S BGPNF=$P(^BGPELIIS(BGPPC,0),U,9)
 S BGPNP=$P(^DD(90376.03,BGPNF,0),U,4),N=$P(BGPNP,";"),P=$P(BGPNP,";",2)
 D SETN
 ;write header
 W !,$P(^BGPELIIS(BGPPC,0),U,15)
 I $P(^BGPELIIS(BGPPC,0),U,16)]"" W !?1,$P(^BGPELIIS(BGPPC,0),U,16)
 I $P(^BGPELIIS(BGPPC,0),U,19)]"" W !?1,$P(^BGPELIIS(BGPPC,0),U,19)
 D H2^BGP6DPH
 Q
SETN ;EP set numerator fields
 S BGPCYN=$$V(1,BGPRPT,N,P)
 S BGPPRN=$$V(2,BGPRPT,N,P)
 S BGPBLN=$$V(3,BGPRPT,N,P)
 S BGPCYP=$S(BGPCYD:((BGPCYN/BGPCYD)*100),1:"")
 S BGPPRP=$S(BGPPRD:((BGPPRN/BGPPRD)*100),1:"")
 S BGPBLP=$S(BGPBLD:((BGPBLN/BGPBLD)*100),1:"")
 Q
I1AGE ; special age tallies
 D I1AGE^BGP6EL11
 Q
SL(V) ;
 I V="" S V=0
 Q $$STRIP^XLFSTR($J(V,5,1)," ")
V(T,R,N,P) ;EP
 I $G(BGPAREAA) G VA
 I T=1 Q $P($G(^BGPELDCS(R,N)),U,P)
 I T=2 Q $P($G(^BGPELDPS(R,N)),U,P)
 I T=3 Q $P($G(^BGPELDBS(R,N)),U,P)
 Q ""
VA ;
 NEW X,V,C S X=0,C="" F  S X=$O(BGPSUL(X)) Q:X'=+X  D
 .I T=1 S C=C+$P($G(^BGPELDCS(X,N)),U,P)
 .I T=2 S C=C+$P($G(^BGPELDPS(X,N)),U,P)
 .I T=3 S C=C+$P($G(^BGPELDBS(X,N)),U,P)
 .Q
 Q C
C(X,X2,X3) ;
 D COMMA^%DTC
 Q X
