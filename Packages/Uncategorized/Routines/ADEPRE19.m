ADEPRE19 ; IHS/OIT/ENM - ADE6.0 PATCH 19 ENVIRONMENT CHECK [ 04/23/2009  9:05 AM ]
 ;;6.0;ADE;**19**;MAR 25, 1999
 S X="ADE6P181" X ^%ZOSF("TEST")
 I '$T S ADEMSG="Dental ADE v6.0 Patch 'ade_0600.18k' MUST be be installed!" D GETUP(ADEMSG,1)
 D ENV ;DUZ VARIABLE CHECK
 Q
GETUP(ADEMSG,ADEACT)       ;NOTE ADEACT IS THE XPDQUIT VALUE OF 1
 ;
 K DIFQ
 S XPDQUIT=ADEACT
 I $T W !,$$CJ^XLFSTR(ADEMSG,IOM)
 W *7,!,$$CJ^XLFSTR("Sorry.....",IOM),$$DIR^XBDIR("E","Press Return")
 Q
ENV ;Environment check
 I '$G(IOM) D HOME^%ZIS
 ;
 I '$G(DUZ) W !,"YOUR DUZ VARIABLE IS UNDEFINED!! Please login with your Access & Verify." D SORRY(2) Q
 ;
 I '$L($G(DUZ(0))) W !,"Your DUZ(0) VARIABLE IS UNDEFINED OR NULL." D SORRY(2) Q
 ;
 I '(DUZ(0)["@") W:'$D(ZTQUEUED) !,"YOUR DUZ(0) VARIABLE DOES NOT CONTAIN AN '@'." D SORRY(2)
 Q
SORRY(X) ;
 K DIFQ
 S XPDQUIT=X
 W *7,!,$$CJ^XLFSTR("Sorry....Please fix it.",40)
 Q
