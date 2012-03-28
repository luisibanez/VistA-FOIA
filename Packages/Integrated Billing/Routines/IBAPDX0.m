IBAPDX0	;ALB/CPM - EXTRACT MEANS TEST BILLING DATA FOR PDX (CON'T) ; 05-MAY-93
	;;Version 2.0 ; INTEGRATED BILLING ;; 21-MAR-94
	;;Per VHA Directive 10-93-142, this routine should not be modified.
	;
ENCR	; Set variables for encryption.
	;DETERMINE IF ENCRYPTION IS ON - SAVE POINTER TO ENCRYPTION METHOD
	S:('TRAN) IBENCPT=$$NCRYPTON^VAQUTL2(1)
	S:(TRAN) IBENCPT=$$TRANENC^VAQUTL3(TRAN,2)
	;SET UP EXECUTABLE CALL TO ENCRYPT
	S:(IBENCPT) IBCRYP=$$ENCMTHD^VAQUTL2(IBENCPT,0)
	S:('IBENCPT) IBCRYP=""
	S:(IBCRYP'="") IBCRYP=("S IBENC="_IBCRYP)
	S:(IBCRYP="") IBCRYP="S IBENC=STRING"
	;DETERMINE PRIMARY KEY
	I (TRAN) S IBSNDR=$$SENDER^VAQCON2(TRAN) I ($P(IBSNDR,"^",1)="-1") S ERR="-1^Could not determine encryption keys" G ENCRQ
	S:(TRAN) IBSNDR=$P(IBSNDR,"^",1)
	S:(TRAN) KEY1=$$NAMEKEY^VAQUTL3(IBSNDR,1)
	S:('TRAN) KEY1=$$DUZKEY^VAQUTL3($G(DUZ),1)
	;DETERMINE SECONDARY KEY
	S:(TRAN) KEY2=$$NAMEKEY^VAQUTL3(IBSNDR,0)
	S:('TRAN) KEY2=$$DUZKEY^VAQUTL3($G(DUZ),0)
	I (IBENCPT) I ((KEY1="")!(KEY2="")) S ERR="-1^Could not determine encryption keys"
ENCRQ	Q
	;
CHG	; Build the array of Means Test charges.
	S (IBD,IBSEQ)=0 F  S IBD=$O(IBARR(IBD)) Q:'IBD  S IBN=0 F  S IBN=$O(IBARR(IBD,IBN)) Q:'IBN  D
	.S IBND=$G(^IB(IBN,0)) Q:'IBND
	.S (IBENC,STRING)=+IBND X:$$NCRPFLD^VAQUTL2(350,.01) IBCRYP
	.S (IBREF,@ARR@("VALUE",350,.01,IBSEQ))=IBENC,@ARR@("ID",350,.01,IBSEQ)=IBID
	.S IBATYP=$P($G(^IBE(350.1,+$P(IBND,"^",3),0)),"^") S:$E(IBATYP,1,2)="DG" IBATYP=$E(IBATYP,4,99)
	.S (IBENC,STRING)=IBATYP X:$$NCRPFLD^VAQUTL2(350,.03) IBCRYP
	.S @ARR@("VALUE",350,.03,IBSEQ)=IBENC,@ARR@("ID",350,.03,IBSEQ)=IBREF
	.S Y=$P(IBND,"^",5),C=$P(^DD(350,.05,0),"^",2) D Y^DIQ
	.S (IBENC,STRING)=Y X:$$NCRPFLD^VAQUTL2(350,.05) IBCRYP
	.S @ARR@("VALUE",350,.05,IBSEQ)=IBENC,@ARR@("ID",350,.05,IBSEQ)=IBREF
	.S (IBENC,STRING)=+$P(IBND,"^",7) X:$$NCRPFLD^VAQUTL2(350,.07) IBCRYP
	.S @ARR@("VALUE",350,.07,IBSEQ)=IBENC,@ARR@("ID",350,.07,IBSEQ)=IBREF
	.F IBI=14,15 D
	..S (IBENC,STRING)=$$DAT1^IBOUTL(+$P(IBND,"^",IBI)) X:$$NCRPFLD^VAQUTL2(350,"."_IBI) IBCRYP
	..S @ARR@("VALUE",350,"."_IBI,IBSEQ)=IBENC,@ARR@("ID",350,"."_IBI,IBSEQ)=IBREF
	.S IBSEQ=IBSEQ+1
	Q
