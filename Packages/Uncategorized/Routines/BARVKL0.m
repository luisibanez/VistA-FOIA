BARVKL0 ; IHS/SD/LSL - KILL NAME SPACE VARIABLES (BAR) ;
 ;;1.8;IHS ACCOUNTS RECEIVABLE;;OCT 26, 2005
 ;
 ;XQJMP=1 IF THE USER IS MENU JUMPING
 ;XQCH="HALT" if they typed halt
 ;B:DUZ=398 "S+"
 I $G(XQJMP) D
 .Q:'$G(XQJP)
 .S JUMPTO=$P(XQJP,",",$L(XQJP,",")-1)
 .S JUMPTO=$P($G(^DIC(19,JUMPTO,0)),U)
 I $G(UFMSESID),($G(XQCH)="HALT") D SIGNOUT^BARUFLOG Q
 I $G(UFMSESID),$G(XQJMP),($E($G(JUMPTO),1,3)'="BAR") D SIGNOUT^BARUFLOG Q
 I $G(UFMSESID),($P($G(XQSV),U,3)="BARMENU") D SIGNOUT^BARUFLOG Q
 I $G(UFMSESID),($G(XQUR)="Y") D SIGNOUT^BARUFLOG Q
 K DIR,DIC,DIQ
 D EN^XBVK("BAR")
 Q
