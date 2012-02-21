FHASM3A ; HISC/REL - Frisancho Standards ;4/5/90  08:09
 ;;5.5;DIETETICS;;Jan 28, 2005
 S A=AGE\1 G:A<1 KIL I A<18 S O1=A
 E  S O1=$S(A<25:18,A<30:19,A<35:20,A<40:21,A<45:22,A<50:23,A<55:24,A<60:25,A<65:26,A<70:27,1:28)
 S O2=$S(SEX="F":3,1:1)
 F M="BMI","TSF","SCA","ACIR" S X=@M I X'="" D GET S @(M_"P")=Z
 G:BFAMA="" KIL S X=BFAMA I A<18!(FRM="") S M="AMA" D GET S BFAMAP=Z G KIL
 S O1=O1-17,O2=$S(SEX="F":7,1:1),O2=O2+$S(FRM="S":0,FRM="L":4,1:2)
 S M="BFAMA" D GET S BFAMAP=Z G KIL
GET S B=$P($T(@M+O2),";;",2),B=$P(B," ",O1)
 S S=$P($T(@M+O2+1),";;",2),S=$P(S," ",O1)
 S (Z,ZA)=X-B/S S:Z<0 ZA=-Z
 S ZA=$S(ZA<.063:0,ZA<.189:1,ZA<.319:2,ZA<.454:3,ZA<.598:4,ZA<.755:5,ZA<.935:6,ZA<1.15:7,ZA<1.44:8,ZA<1.96:9,1:9.8)*5
 S Z=50+$S(Z'<0:ZA,1:-ZA) Q
KIL K A,B,M,O1,O2,S,X,Z,ZA Q
BMI ;;
 ;;17.3 16.2 16 15.7 15.6 15.8 16.0 16.3 16.9 17.7 18.4 18.9 19.5 20.3 20.8 21.9 21.8 23.6 24.9 25.7 25.9 26.2 26.3 26.1 26.2 25.8 25.5 25.3
 ;;2.4 1.3 1.4 1.3 1.5 1.9 1.8 2.2 2.4 2.8 3.6 3.5 3.5 3.3 3.1 3.3 3.5 3.8 4.3 4.2 4 4 4.2 4.2 4.3 3.8 4 4
 ;;16.7 16 15.7 15.5 15.5 15.5 15.9 16.5 17.3 17.7 18.9 19.6 20.4 21.1 21.1 22.1 22.5 22.9 23.7 24.8 25.3 25.7 26 26.3 26.9 26.7 26.8 26.6
 ;;1.5 1.5 1.4 1.4 1.7 1.7 1.9 2.7 3.1 3.1 3.8 3.7 4.1 3.9 3.8 4 4.7 4.6 5.2 5.9 5.8 5.9 6.2 5.5 6.1 5.5 5.5 5.3
TSF ;;
 ;;10.4 10 9.9 9.2 8.9 8.9 9 9.6 10.2 11.5 12.5 12.2 11 10.4 9.8 10 9.1 11.3 12.2 13.1 12.9 13 12.9 12.6 12.4 12.5 12.1 12
 ;;2.9 2.9 2.7 2.7 3.1 3.8 4 4.4 5.1 5.7 7 6.8 6.7 6.5 6.5 5.9 5.3 6.4 6.7 6.7 6.2 6.6 6.4 6.1 6 6 5.9 5.8
 ;;10.4 10.5 10.4 10.3 10.4 10.4 11.1 12.1 13.4 13.9 15 15.1 16.4 17.1 17.3 19.2 19.1 20 21.7 23.7 24.7 25.1 26.1 26.5 26.6 26.6 25.1 24
 ;;3.1 2.9 2.9 3 3.5 3.7 4.2 5.4 5.9 6.1 6.8 6.3 7.4 7.3 7.4 7.0 8.0 8.2 8.8 9.2 9.3 9 9.3 9 9.4 8.8 8.5 8.5
SCA ;;
 ;;6.3 5.9 5.5 5.3 5.2 5.5 5.7 6 6.8 7.6 9.0 8.9 8.8 9.0 9.4 10.1 10.1 13.4 15.5 17.3 17.6 17.4 18.2 17.7 17.6 18.1 16.8 16.3
 ;;1.9 2 1.8 1.8 2.4 3.3 3.3 3.8 4.8 5.5 7.6 7.1 7 6.5 6.8 6.2 6 7.6 8.2 8.5 8.3 8.2 8.6 8.4 8.1 8.4 8.2 7.8
 ;;6.5 6.4 6.1 6 6.2 6.3 6.7 7.8 9 9.7 10.7 11.5 12.3 13 13 14.7 15.4 16.1 17.5 19.7 20.6 20.9 21.8 23 23.2 22.8 21.4 20.5
 ;;2 2.3 2.2 2.3 3 3.4 3.5 5.8 6.5 6.5 7.6 7.7 7.8 7.7 7.5 8.7 8.9 9.4 10.4 11.7 11.6 11.4 11.4 11.4 11.7 11.3 10.6 10.1
ACIR ;;
 ;;16.1 16.4 16.9 17.2 17.7 18.3 19 19.6 20.7 21.8 22.8 23.8 24.8 26.2 27.3 28.7 29 31 32.1 32.7 32.9 32.9 32.7 32.4 32.3 31.9 31.1 30.6
 ;;1.2 1.4 1.4 1.4 1.8 2.1 2.1 2.3 2.7 3 3.4 3.5 3.3 3.5 3.2 3.2 3.4 3.5 3.5 3.4 3.3 3.2 3.4 3.4 3.3 3.4 3.4 3.4
 ;;15.7 16.2 16.6 17.1 17.7 18.2 19 20 21.1 21.8 23.2 24 25 25.9 25.9 26.8 27.3 27.5 28.5 29.6 30.2 30.6 30.9 31.2 31.6 31.4 30.9 30.5
 ;;1.3 1.3 1.4 1.5 1.8 2 2.2 2.6 2.8 3.1 3.6 3.4 3.7 3.6 3.5 3.5 4.1 4 4.3 4.7 4.8 4.8 5 4.5 5.1 4.6 4.4 4.3
AMA ;;
 ;;13.2 14.1 15.2 16.3 17.8 19.3 21 22.1 24.5 26.7 28.8 31.9 36.8 42.4 46.8 52.6 54.7 50.5 54.1 55.6 56.5 56.6 55.9 55 54.7 52.8 49.8 47.8
 ;;2.3 3.2 3.1 2.7 3.7 4 4.5 4.2 5.1 5.9 6.7 7.4 9 9.1 9.6 10 10.5 11.6 11.9 12.1 12.4 11.7 12.3 12.5 11.8 11.7 11.6 11.5
 ;;12.3 13.3 14.3 15.4 16.7 18 19.3 21.1 22.9 24.3 27.6 29.7 31.9 33.9 33.8 34.8 36.1 29.8 31.1 32.8 34.2 35.2 34.9 35.6 37.1 36.3 36.3 36
 ;;2.3 2.3 2.4 2.8 3.1 3.9 4 4.7 4.6 5.5 6.7 6.5 7.4 7.7 7 8 8.8 8.4 9.1 10.4 11.5 13.3 11.8 11 13.3 11.3 11.3 10.8
BFAMA ;;
 ;;45.6 48.2 49.6 51.2 51.5 49.7 49.1 47.9 48.7 45.1 43.5
 ;;10.6 9.8 10.2 10.4 10.1 10.8 11.2 10.1 11.2 10.7 10.3
 ;;50.5 54 55 56.7 56.7 56.6 55.3 55.4 52.3 49.8 47.8
 ;;10.5 11.3 10.4 11.7 11 11.2 11.7 10.8 10.8 10.5 10.8
 ;;55.7 60.3 62.8 61.6 61.8 61.1 60.5 60.2 57.9 54.5 52
 ;;12.2 12 13.4 13.3 12.3 13 12.8 12 12.1 12.7 12.4
 ;;26.2 27.8 28.6 29.8 29.8 29.2 30.3 30.9 31.9 31.3 32
 ;;6 7.4 7.8 10.1 6.6 7.4 7.3 7.6 8.7 8.1 9.9
 ;;29.3 30 32 32.7 33.7 33.8 35 36.3 35.1 35.7 35.3
 ;;7 7.2 9.1 8.4 12.1 8.8 9.7 11.5 9.1 10 9.7
 ;;34.4 36.7 38.8 41.6 43.5 43 42.4 45.2 43.1 42.5 41.5
 ;;10.7 11.5 12.3 14.4 16.6 15.8 13.1 16.9 14.2 13.4 11.6
