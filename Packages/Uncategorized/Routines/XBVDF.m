XBVDF ; IHS/ASDST/DMJ - VIDEO DISPLAY FEATURES ;   [ 10/07/2004  3:00 PM ]
 ;;3.0;IHS/VA UTILITIES;**10**;JUN 12, 2003
EN(X) ;EP
 I X="" Q X
 I '$L($T(@X)) S X="" Q X
 S XB1("X")=$X
 I '$G(IOST(0)) S IOP=0 D ^%ZIS
 I '$D(XBVDF(+IOST(0),X)) D
 .S XB1("LN")=$T(@X),XB1(1)=$P(XB1("LN"),";;",2),XB1(2)=$P(XB1("LN"),";;",3),XB1(3)=$P(XB1("LN"),";;",4)
 .S XBVDF(+IOST(0),X)=$P($G(^%ZIS(2,+IOST(0),XB1(1))),"^",XB1(2),XB1(3))
 .I XBVDF(+IOST(0),X)="" S XBVDF(+IOST(0),X)="*0"
 W @XBVDF(+IOST(0),X)
 S $X=XB1("X")
 S X=""
 K XB1
 Q X
 ;GLOBAL LOCATIONS TO FOLLOW
HIN ;;7;;1;;1;;HI INTENSITY ON
HIX ;;7;;2;;2;;HI INTENSITY OFF
RVN ;;5;;4;;4;;REVERSE VIDEO ON
RVX ;;5;;5;;5;;REVERSE VIDEO OFF
ULN ;;6;;4;;4;;UNDERLINE ON
ULX ;;6;;5;;5;;UNDERLINE OFF
DTP ;;17;;1;;1;;DOUBLE HIGH TOP HALF
DTB ;;17;;2;;2;;DOUBLE HIGH BOTTOM HALF
BLN ;;5;;8;;8;;BLINK ON
BLX ;;5;;9;;9;;BLINK OFF
CUP ;;8;;1;;1;;CURSOR UP
IOF ;;1;;2;;2;;FORM FEED/CLEAR SCREEN
10 ;;5;;1;;1;;TEN PITCH
12 ;;5;;2;;2;;TWELVE PITCH
16 ;;12.1;;1;;250;;SIXTEEN PITCH
BKF ;;CLRBKF;;1;;1;;BLACK FOREGROUND
BKB ;;CLRBKB;;1;;1;;BLACK BACKGROUND
REF ;;CLRREF;;1;;1;;RED FOREGROUND
REB ;;CLRREB;;1;;1;;RED BACKGROUND
GRF ;;CLRGRF;;1;;1;;GREEN FOREGROUND
GRB ;;CLRGRB;;1;;1;;GREEN BACKGROUND
YEF ;;CLRYEF;;1;;1;;YELLOW FOREGROUND
YEB ;;CLRYEB;;1;;1;;YELLOW BACKGROUND
BLF ;;CLRBLF;;1;;1;;BLUE FOREGROUND
BLB ;;CLRBLB;;1;;1;;BLUE BACKGROUND
MGF ;;CLRMGF;;1;;1;;MAGENTA FOREGROUND
MGB ;;CLRMGB;;1;;1;;MAGENTA BACKGROUND
CYF ;;CLRCYF;;1;;1;;CYAN FOREGROUND
CYB ;;CLRCYB;;1;;1;;CYAN BACKGROUND
WHF ;;CLRWHF;;1;;1;;WHITE FOREGROUND
WHB ;;CLRWHB;;1;;1;;WHITE BACKGROUND
CLR ;;6;;1;;1;;RESET
HOM ;;5;;3;;3;;HOME CURSOR