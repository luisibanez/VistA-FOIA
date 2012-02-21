IBCBB11 ;ALB/AAS - CONTINUATION OF EDIT CHECK ROUTINE ;23-JUL-99
 ;;2.0;INTEGRATED BILLING;**51**;21-MAR-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
WARN(IBDISP) ; Set warning in global
 ; DISP = warning text to display
 ;
 N Z
 S Z=+$O(^TMP($J,"BILL-WARN",""),-1)
 I Z=0 S ^TMP($J,"BILL-WARN",1)=$J("",5)_"**Warnings**:",Z=1
 S Z=Z+1,^TMP($J,"BILL-WARN",Z)=$J("",5)_IBDISP
 Q
 ;
MULTDIV(IBIFN,IBND0) ; Check for multiple divisions on a bill ien IBIFN
 ; IBND0 = 0-node of bill
 ;
 ;  Function returns 1 if more than 1 division found on bill
 N Z,Z0,Z1,MULT
 S MULT=0,Z1=$P(IBND0,U,22)
 I Z1 D
 . S Z=0 F  S Z=$O(^DGCR(399,IBIFN,"RC",Z)) Q:'Z  S Z0=$P(^(Z,0),U,7) I Z0,Z0'=Z1 S MULT=1 Q
 . S Z=0 F  S Z=$O(^DGCR(399,IBIFN,"CP",Z)) Q:'Z  S Z0=$P(^(Z,0),U,6) I Z0,Z0'=Z1 S MULT=2 Q
 I 'Z1 S MULT=3
 Q MULT
 ;
 ;; PREGNANCY DX CODES: V22**-V24**, V27**-V28**, 630**-677**
 ;; FLU SHOTS PROCEDURE CODES: 90724, G0008, 90732, G0009
