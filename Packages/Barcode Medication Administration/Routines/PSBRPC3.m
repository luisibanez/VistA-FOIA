PSBRPC3	;BIRMINGHAM/VRN-BCMA RPC BROKER CALLS ;Mar 2004
	;;3.0;BAR CODE MED ADMIN;**6,3,4,16,13**;Mar 2004
	;
GUICHK(RESULTS,DUMMY)	;
	;
	; RPC : PSB VERSION CHECK
	;
	K RESULTS
	N PSBCURR,PSBPREV,PSBCNT
	S PSBCURR="3.0.13.*",PSBPREV="",PSBCNT=0
	S PSBCNT=PSBCNT+1
	S RESULTS(PSBCNT)=PSBCURR_U_PSBPREV
	S RESULTS(0)=PSBCNT
	Q
	;
