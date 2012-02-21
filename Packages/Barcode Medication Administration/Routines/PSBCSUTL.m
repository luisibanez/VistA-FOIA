PSBCSUTL	;BIRMINGHAM/TEJ- BCMA-HSC COVER SHEET UTILITIES ;Mar 2004
	;;3.0;BAR CODE MED ADMIN;**16,13**;Mar 2004
	;
	; Reference/IA
	;
	; EN^PSJBCMA/2828
	; IN5^VADPT/10061
	; $$GET^XPAR/2263
	; ^%DTC/10000
	; $$FMADD^XLFDT/10103
	; $$GET1^DIQ/2056
	;
RPC(RESULTS,DFN)	;
	K RESULTS,^TMP("PSB",$J),^TMP("PSJ",$J)
	S PSBTAB="CVRSHT"
	N PSBCNT S PSBTRFL=0,PSBDFNX=DFN
	S RESULTS=$NAME(^TMP("PSB",$J,PSBTAB))
	K ^TMP("PSB",$J,PSBTAB) S ^TMP("PSB",$J,PSBTAB,0)=1 D LIGHTS(PSBDFNX)
	S ^TMP("PSB",$J,PSBTAB,0)=1,^TMP("PSB",$J,PSBTAB,1)=^TMP("PSB",$J,PSBTAB,1)
	Q:$P(^TMP("PSB",$J,PSBTAB,1),U,4)=-1
	D NOW^%DTC S PSBNOW=+$E(%,1,10),PSBDT=$P(%,".",1)
	;set range
	S PSBWBEG=$$FMADD^XLFDT(PSBNOW,"",-24),PSBWEND=$$FMADD^XLFDT(PSBNOW,"",24)
	S PSBTBEG=$$FMADD^XLFDT(PSBNOW,"",-12),PSBTEND=$$FMADD^XLFDT(PSBNOW,"",12)
	S PSBWADM=$$GET^XPAR("DIV","PSB ADMIN BEFORE"),PSBMHBCK=$$GET^XPAR("ALL","PSB MED HIST DAYS BACK",,"B") I +PSBMHBCK=0 S PSBMHBCK=30
	D NOW^%DTC S PSBWADM=$$FMADD^XLFDT(%,"","",+PSBWADM),PSBMHBCK=$$FMADD^XLFDT(%,-1*(PSBMHBCK))
	;use lst movemnt for API
	S VAIP("D")="LAST" D IN5^VADPT S PSBTRDT=+VAIP(3),PSBTRTYP=$P(VAIP(2),U,2),PSBMVTYP=$P(VAIP(4),U,2) K VAIP
	S PSBPTTR=$$GET^XPAR("DIV","PSB PATIENT TRANSFER") I PSBPTTR="" S PSBPTTR=72
	D NOW^%DTC S PSBNTDT=$$FMADD^XLFDT(%,"",-PSBPTTR) I PSBNTDT'>PSBTRDT S PSBTRFL=1
	S X1=$P(PSBNOW,"."),X2=-3 D C^%DTC
	D EN^PSJBCMA(PSBDFNX,X,PSBMHBCK)
	;Devlop Outp
	S PSBTBOUT=0
	I ^TMP("PSJ",$J,1,0)>0 F PSBX=0:0 S PSBX=$O(^TMP("PSJ",$J,PSBX)) Q:('PSBX)!(PSBTBOUT)  D
	.S:(PSBTAB'="CVRSHT")&($G(^TMP("PSB",$J,"CVRSHT",2))>0) PSBTBOUT=1
	.D CLEAN^PSBVT,PSJ^PSBVT(PSBX),NOW^%DTC
	.Q:PSBONX["P"  Q:(PSBOSP<PSBWBEG)&'(PSBONX["V")  ;in rnge?
	.S (PSBREC,PSBONTAB)=""
	.S $P(PSBREC,U,1)=PSBDFN ;Dfn
	.S $P(PSBREC,U,2)=PSBONX ;Ordr 
	.S $P(PSBREC,U,3)=PSBON ;OrdrIen
	.S $P(PSBREC,U,4)=PSBOTYP ;iv/ud/pend
	.S $P(PSBREC,U,5)=PSBSCHT ;Schdtype
	.S $P(PSBREC,U,6)=PSBSCH ;Schd
	.S $P(PSBREC,U,7)=$S(PSBHSM:"HSM",PSBSM:"SM",1:"") ; selfmed
	.S $P(PSBREC,U,8)=PSBOITX ;Drgname
	.S $P(PSBREC,U,9)=PSBDOSE_" "_PSBIFR ;Dose
	.S $P(PSBREC,U,10)=PSBMR ;Rout
	.;Lst Gvn - AOIP xRef
	.S (PSBCNT,PSBFLAG)=0,(Y,PSBSTUS)="" K PSBHSTA,PSBHSTAX
	.F XZ=1:1:20 S Y=$O(^PSB(53.79,"AOIP",PSBDFN,PSBOIT,Y),-1),(PSBCNT,PSBFLAG)=0 Q:Y=""  D
	..S:Y>0 $P(PSBREC,U,11)=Y
	..S X="" F  S X=$O(^PSB(53.79,"AOIP",PSBDFN,PSBOIT,Y,X),-1) Q:X=""  D
	...S PSBSTUS=$P(^PSB(53.79,X,0),U,9) S:$G(PSBSTUS)="" PSBSTUS="X" I (PSBSTUS'="N") S PSBFLAG=1,PSBHSTA(Y,$G(PSBSTUS))="ORIG"_U_X
	...D:PSBSTUS="N"
	....S ($P(PSBREC,U,11),Z)=""
	....F  S Z=$O(^PSB(53.79,X,.9,Z),-1) Q:'Z  Q:PSBFLAG=1  S PSBDATA=$G(^(Z,0)) D
	.....I (PSBDATA["Set to 'NOT GIVEN'")!(PSBDATA["Set to 'GIVEN'")!(PSBDATA["Set to 'REFUSED'")!(PSBDATA["Set to 'HELD'")!(PSBDATA["Set to 'MISSING DOSE'")!(PSBDATA["Set to 'REMOVED'") S PSBCNT=PSBCNT+1
	.....I (PSBDATA["STATUS 'HELD'")!(PSBDATA["STATUS 'GIVEN'")!(PSBDATA["STATUS 'REFUSED'")!(PSBDATA["STATUS 'MISSING DOSE'")!(PSBDATA["STATUS 'REMOVED'") S PSBCNT=PSBCNT+1
	.....I PSBCNT#2=0,PSBDATA["'REFUSED'" S PSBSTUS="R" D LAST^PSBVDLU1
	.....I PSBCNT#2=0,PSBDATA["'HELD'" S PSBSTUS="H" D LAST^PSBVDLU1
	.....I PSBCNT#2=0,PSBDATA["'MISSING DOSE'" S PSBSTUS="M" D LAST^PSBVDLU1
	.....I PSBCNT#2=0,PSBDATA["'REMOVED'" S PSBSTUS="RM" D LAST^PSBVDLU1
	.....I PSBFLAG=1,'$D(PSBHSTA($P(PSBREC,U,11),$G(PSBSTUS))) S PSBHSTA($P(PSBREC,U,11),$G(PSBSTUS))=Z_U_X
	.I $D(PSBHSTA) S $P(PSBREC,U,11)=$O(PSBHSTA(""),-1),PSBSTUS=$O(PSBHSTA($P(PSBREC,U,11),""),-1) M PSBHSTAX(PSBOIT)=PSBHSTA K PSBHSTA  ;last action date/time
	.S $P(PSBREC,U,12)="" ;ien - below
	.S $P(PSBREC,U,13)="" ;sttus - below
	.S $P(PSBREC,U,14)="" ;admn dte - below
	.S $P(PSBREC,U,15)=PSBOIT ;OI Pointer
	.S $P(PSBREC,U,16)=0  ;Deflt no-inject
	.F X="ID","IV","IM","SC","SQ" D  Q:$P(PSBREC,U,16)
	..I PSBMR?@(".E1"""_X_""".E"),PSBMR'["MISC" S $P(PSBREC,U,16)=1
	.;Vari dosg
	.I $P(PSBREC,U,9)?1.4N1"-"1.4N.E S $P(PSBREC,U,17)=1
	.E  S $P(PSBREC,U,17)=0
	.S:PSBDOSEF?1"CAP".E!(PSBDOSEF?1"TAB".E)!(PSBDOSEF="PATCH") $P(PSBREC,U,18)=PSBDOSEF ;DosgFrm
	.D PSJ1^PSBVT(PSBDFN,PSBONX)
	.S PSBPB=$$IVPTAB^PSBVDLU3(PSBOTYP,PSBIVT,PSBISYR,PSBCHEMT,$G(PSBMR)),PSBLVIV=0
	.Q:PSBPB&(PSBOSP<PSBWBEG)
	.S:(PSBONX["V"&'PSBPB) PSBLVIV=1
	.S $P(PSBREC,U,19)=$S(PSBVNI]"":PSBVNI,PSBVNI']"":"***") ;VerfNrsIntls
	.S $P(PSBREC,U,20)=PSBSTUS S:$P(PSBREC,U,11)="" $P(PSBREC,U,20)=""  ;LstActnSts
	.S $P(PSBREC,U,21)=PSBOST
	.S $P(PSBREC,U,22)=PSBOSTS
	.S $P(PSBREC,U,25)=0 I $G(PSBTRFL),$P(PSBREC,U,11)]"",$P(PSBREC,U,11)'<$G(PSBNTDT),$P(PSBREC,U,11)'>$G(PSBTRDT) S $P(PSBREC,U,25)=1
	.S $P(PSBREC,U,26)=PSBOSP  ;OrdrStpDt/Tm
	.S $P(PSBREC,U,27)=$$LASTG($P(PSBREC,U,1),$P(PSBREC,U,15))
	.S $P(PSBREC,U,28)=$S((PSBONX["U")&('PSBPB):1,PSBPB:2,(PSBONX["V")&'PSBPB:3,1:"")
	.;get all Admn(s) pr ordr
	.;DD info.
	.S (PSBDDS,PSBSOLS,PSBADDS,PSBFLAG)="0"
	.I PSBLVIV D XFERBAGS^PSBCSUTY,LVIV^PSBCSUTY I $G(PSBEXPRD) S X1=$O(^TMP("PSB",$J,PSBTAB,""),-1) S:^TMP("PSB",$J,PSBTAB,X1)'="END" ^TMP("PSB",$J,PSBTAB,X1+1)="END" Q
	.D GETADMX^PSBCSUTY
	.F Y=0:0 S Y=$O(PSBDDA(Y)) Q:'Y  D
	..I $P(PSBDDA(Y),U,5)=$P(%,".") S PSBFLAG=1  ;drug nactvted
	..Q:$P(PSBDDA(Y),U,5)&($P(PSBDDA(Y),U,5)<%)  ;nactv
	..S:$P(PSBDDA(Y),U,4)="" $P(PSBDDA(Y),U,4)=1
	..S PSBDDS=PSBDDS_U_$P(PSBDDA(Y),U,1,4),$P(PSBDDS,U,1)=PSBDDS+1
	.;OnCallOneTmPRN
	.I ("^O^OC^P^"[(U_PSBSCHT_U))!(PSBLVIV) D  S ($P(PSBREC,U,12),$P(PSBREC,U,14))=""  Q
	..S (PSBIENX,PSBGOT1)="",PSBADMTM="" F  S PSBADMTM=$O(^PSB(53.79,"AORDX",PSBDFNX,PSBONX,PSBADMTM)) Q:(PSBADMTM="")  D
	...Q:(PSBADMTM<PSBMHBCK)&'PSBLVIV
	...F  S PSBIENX=$O(^PSB(53.79,"AORDX",PSBDFNX,PSBONX,PSBADMTM,PSBIENX)) Q:PSBIENX=""  D
	....S $P(PSBREC,U,12)=PSBIENX,$P(PSBREC,U,14)=PSBADMTM,$P(PSBREC,U,23)=$$GET1^DIQ(53.79,PSBIENX_",","IV UNIQUE ID")
	....S PSBQRR=1 D ADD^PSBVDLU1(PSBREC,PSBOTXT,PSBADMTM,PSBDDS,PSBSOLS,PSBADDS,"CVRSHT") S PSBGOT1=1
	..I ('+PSBGOT1)&(PSBOSP'<PSBWBEG) D ADD^PSBVDLU1(PSBREC,PSBOTXT,PSBNOW\1_".",PSBDDS,PSBSOLS,PSBADDS,"CVRSHT") S PSBGOT1=1
	..I ('+PSBGOT1)&($D(PSBADMX(PSBONX))) D ADD^PSBVDLU1(PSBREC,PSBOTXT,PSBNOW\1_".",PSBDDS,PSBSOLS,PSBADDS,"CVRSHT")
	..S PSBGLBX=$O(^TMP("PSB",$J,PSBTAB,""),-1) S:^TMP("PSB",$J,PSBTAB,PSBGLBX)'="END" ^TMP("PSB",$J,PSBTAB,PSBGLBX+1)="END"
	.;continu - proces AdmnTm
	.S (PSBYES,PSBODD,PSBYTF)=0 S:$$PSBDCHK1^PSBVT1(PSBSCH) PSBYES=1
	.I PSBYES,PSBADST="" Q
	.F I=1:1 Q:$P(PSBSCH,"-",I)=""  I $P(PSBSCH,"-",I)?2N!($P(PSBSCH,"-",I)?4N) S PSBYES=1,PSBYTF=1
	.I PSBSCHT="C",PSBYTF="1",PSBADST="" Q
	.S PSBFREQ=$$GETFREQ^PSBVDLU1(DFN,PSBONX)
	.I PSBFREQ="O" S PSBFREQ=1440
	.I PSBFREQ="D" S PSBFREQ=""
	.S:PSBLVIV PSBYES=1
	.I 'PSBYES,PSBFREQ<1 Q
	.I (PSBADST="")&(+PSBFREQ>0) D ODDSCH^PSBVDLU1(PSBTAB) Q
	.I +PSBFREQ>0 I (PSBFREQ#1440'=0),(1440#PSBFREQ'=0) S PSBODD=1
	.I PSBODD,PSBADST'="" Q
	.S PSBDTX=PSBWBEG\1,PSBGOT1=0
	.F PSBXX=1:1:2 D  S PSBDTX=$$FMADD^XLFDT(PSBDTX,"",24)  ;incrmnt 1 day!
	..F PSBY=1:1:$L(PSBADST,"-") Q:$P(PSBADST,"-",PSBY)=""  D
	...S PSB=+(PSBDTX_"."_$P(PSBADST,"-",PSBY))
	...I (PSB'<PSBWBEG)&(PSB'>PSBWEND) D  ;wndow?
	....D:(PSB'<PSBOST)&(PSB<PSBOSP)      ;actv?
	.....D:$$OKAY^PSBVDLU1(PSBOST,PSB,PSBSCH,PSBONX,PSBOITX,PSBFREQ,PSBOSTS)  ;dt?
	......D ADD^PSBVDLU1(PSBREC,PSBOTXT,PSB,PSBDDS,PSBSOLS,PSBADDS,"CVRSHT") S PSBGOT1=1
	...S PSB=+(PSBWEND\1_"."_$P(PSBADST,"-",PSBY))
	...I (PSB'<PSBWBEG)&(PSB'>PSBWEND) D  ;wndow?
	....D:(PSB'<PSBOST)&(PSB<PSBOSP)      ;actv?
	.....D:$$OKAY^PSBVDLU1(PSBOST,PSB,PSBSCH,PSBONX,PSBOITX,PSBFREQ,PSBOSTS)  ;dt?
	......D ADD^PSBVDLU1(PSBREC,PSBOTXT,PSB,PSBDDS,PSBSOLS,PSBADDS,"CVRSHT") S PSBGOT1=1
	.I ('PSBGOT1)&(PSBOSP'<PSBWBEG) D ADD^PSBVDLU1(PSBREC,PSBOTXT,+(PSBWEND\1_"."_$P(PSBADST,"-")),PSBDDS,PSBSOLS,PSBADDS,"CVRSHT")
	.K PSBSTUS
	D EN^PSBVDLPA
	I $G(^TMP("PSB",$J,PSBTAB,2))]"" S PSBI1=$O(^TMP("PSB",$J,PSBTAB,""),-1) I ^TMP("PSB",$J,PSBTAB,PSBI1)'="END" S ^TMP("PSB",$J,PSBTAB,PSBI1+1)="END"
	S ^TMP("PSB",$J,PSBTAB,0)=$O(^TMP("PSB",$J,PSBTAB,""),-1)
	I $G(^TMP("PSB",$J,PSBTAB,2))']"" S $P(^TMP("PSB",$J,PSBTAB,1),U,4)="-1^No orders To display on Coversheet"
	I $G(^TMP("PSB",$J,PSBTAB,2))]"" S $P(^TMP("PSB",$J,PSBTAB,1),U,4)="1^COVERSHEET DATA FOLLOWS" D ADD^PSBCSUTX
	D CLEAN
	Q
LASTG(PSBPATPT,PSBOIPT)	;LstGvn-(inpt: DFN,OrdrblItm IEN)
	K PSBHSTG S Y="",LASTG="" F XZ=1:1:20 S Y=$O(^PSB(53.79,"AOIP",PSBPATPT,PSBOIPT,Y),-1),(PSBCNT,PSBFLAG)=0 Q:Y=""  D
	.S:Y>0 LASTG="",X="" F  S X=$O(^PSB(53.79,"AOIP",PSBPATPT,PSBOIPT,Y,X),-1) Q:X=""  D
	..S PSBSTX=$P(^PSB(53.79,X,0),U,9) S:PSBSTX']"" PSBHSTG(Y)=-1 I PSBSTX="G"  S PSBHSTG(Y)=""
	..Q:PSBSTX="N"
	..D:(PSBSTX'="G")
	...S Z="" F  S Z=$O(^PSB(53.79,X,.9,Z),-1) Q:'Z  Q:PSBFLAG=1  S PSBDATA=$G(^(Z,0)) D
	....I (PSBDATA["Set to 'GIVEN'") S PSBCNT=PSBCNT+1
	....I (PSBDATA["STATUS 'GIVEN'") S PSBCNT=PSBCNT+1
	....I PSBCNT#2=0,PSBDATA'["'GIVEN'" Q
	....I '$D(PSBHSTG($P(PSBDATA,U))) S PSBFLAG=1,PSBHSTG($P(PSBDATA,U))=""
	S:$D(PSBHSTG) LASTG="",LASTG=$O(PSBHSTG(LASTG),-1) I LASTG]"" I PSBHSTG(LASTG)=-1 S LASTG=""
	Q LASTG
LIGHTS(PSBDFN)	;
	D RPC^PSBVDLTB(,PSBDFN,"NO TAB",) S PSBTAB="CVRSHT"
	M ^TMP("PSB",$J,PSBTAB,1)=^TMP("PSB",$J,"NO TAB",1) K ^TMP("PSB",$J,"NO TAB")
	Q
CLEAN	;
	D CLEAN^PSBVT
	K PSBACT,PSBACTBY,PSBACTDT,PSBACTPT,PSBADDS,PSBBAGID,PSBCHDT,PSBCHKV,PSBCNT1,PSBCNT2,PSBDDS,PSBDFNX,PSBWEND
	K PSBDT,PSBFLAG,PSBHSTAX,PSBI1,PSBIEN,PSBIENX,PSBLSTS,PSBMAUD,PSBMVTYP,PSBMWC,PSBNOW,PSBNTDT,PSBONMBR,PSBY,PSBXX
	K PSBONXS,PSBORREC,PSBPDT,PSBPRNRE,PSBPTTR,PSBQR,PSBRDOW,PSBREC,PSBRECHD,PSBSCHBR,PSBSCHTM,PSBSOLS,PSBTAB,PSBADMTM,PSBDTX
	K PSBTBOUT,PSBTRDT,PSBTRFL,PSBTRTYP,PSBUID,PSBUIDS,PSBX,PSBXIEN,PSBX2,PSBYEA,PSBYEA1,PSBYTF,PSBYES,VAIP,PSBWADM,PSBWBEG
	K PSBXREC,PSBGOT1,PSBCDT,PSBQUIT,PSBUSED,PSBLST4X,PSBADMX,PSBI2,PSBXXX,PSBI,PSBPB,PSBSHWTB,PSBONTAB,PSBDONE,^TMP("PSJ",$J)
	K PSBNXTDU,LASTG,LSTTIME,PSBMHBCK,PSBHSTG,PSBNXTDT,NEXTADM,PSBLVIV
	Q
