ACHSPA0 ; IHS/ITSC/PMF - DOCUMENT PAYMENT ;
 ;;3.1;CONTRACT HEALTH MGMT SYSTEM;**11,12,13**;JUN 11,2001
 ;ACHS*3.1*11 8.27.04 IHS/OIT/FCJ SET DUOUT IF DOC NODE FAILS LOCK
 ;ACHS*3.1*13 ITSC/SET/JVK 3/31/05 ACHSPACC VAR NOT SET
 ;
 ;SET THE TRANSACTION 0 NODE
 S T=DT_"^P^"_DFN_U_$G(ACHSIPA)_U_$G(ACHSFULP)_"^^^"_$G(ACHS3RDP)_U_$G(ACHSWKLD)_U_$G(ACHSSVDT)_U_DUZ_U_$G(ACHS3RDS)
 ;
 S:'$D(ACHSEOBD) ACHSEOBD=ACHSPDAT
 ;
 ;ADD SOME MORE STUFF TO TRANSACTION 0 NODE
 S T=T_U_ACHSPDAT_U_$G(ACHSPSQN)_U_ACHSPIND_U_U_ACHSCTL_U_ACHSCHK_U_ACHSREM_U_ACHSSV_U_ACHSOB
 ;ACHS*3.1*13 ITSC/SET/JVK 3/31/05 ACHSPACC VAR NOT SET
 S ACHSF638=$P($G(^ACHSF(DUZ(2),0)),U,8) I '$D(ACHSPACC) S ACHSPACC=""
 ;ITSC/SET/JVK ACHS*3.1*12
 I ACHSF638="Y",ACHSPACC'="" S $P(^ACHSF(DUZ(2),"D",ACHSDIEN,1),U,3)=ACHSPACC
 ;
 S X=$G(^ACHSF(DUZ(2),"D",ACHSDIEN,0))           ;GET DOCUMENT 0 NODE
 S N=$P(X,U,6)                               ;COMMON ACCT #
 S O=$P(X,U,7)                               ;OBJECT CLASSIFICATION
 S ACHSX=$P(X,U,14)                          ;FISCAL YEAR
 ;
 D FYCVT^ACHSFU                              ;COMPUTE FISCAL YEAR
 ;
 S R=$P(X,U,19)                              ;DCR ACCT. #
 S (ACHSACFY,F)=ACHSY
 S ACHSACWK=+ACHSFYWK(DUZ(2),ACHSACFY)
 S A=ACHSPAMT-ACHSTAO                        ;
 I $D(ACHSISAO) G A1
LOC1 ;
 I '$$LOCK^ACHS("^ACHS(9,DUZ(2),""FY"",ACHSACFY,0)","+") W !,"LOCK on '^ACHS(9,",DUZ(2),"""FY"",",ACHSACFY,",0)' at LOC1^ACHSPA0 failed.",!,"Someone else is using it. Try again later." D RTRN^ACHS Q
 ;
 S X=$G(^ACHS(9,DUZ(2),"FY",ACHSACFY,0))    ;FISCAL YEAR 0 NODE
 S X1=$P(X,U,2)                      ;CURRENT ADVICE OF ALLOWANCE
 S X2=$P(X,U,3)                      ;TOTAL OBLIGATED FYTD
 I $$PARM^ACHS(2,2)="Y",ACHSACFY<ACHSCFY G A1 ;NEG. UNOBLIGATED BAL. PRIOR FY?
 I (X2+A)'>X1 G A1                     ;IF WE STILL HAVE MONEY 
 ;
 W:'$D(ACHSISAO) *7,!,"Funds are not available for this overpayment",!,"Transaction Cancelled"
 I ACHSACFY<ACHSCFY,'$D(ACHSISAO) W !!,"'",$P(^DD(9002080,14.02,0),U),"' parameter = '",$$PARM^ACHS(2,2),"'.",!!
 I $$LOCK^ACHS("^ACHS(9,DUZ(2),""FY"",ACHSACFY,0)","-")
 Q
 ;
A1 ;
 I ACHSPIND="I" S $P(T,U,2)="IP"         ;TRANSACTION TYPE
 S ^ACHSF(DUZ(2),"D",ACHSDIEN,"T",ACHSTDA,0)=T
 ;
 S ^ACHSF(DUZ(2),"TB",DT,$S(ACHSPIND="I":"IP",ACHSPIND="F":"P"),ACHSDIEN,ACHSTDA)=""
 S:+DFN ^ACHSF("AC",DFN,DUZ(2),ACHSDIEN,ACHSTDA)=""
 ;
 ;ACHSPIND = 'EOBR PAY TYPE'
 I ACHSPIND="F" D FINAL G EOBRCX ; Reset obligation at final payment.
 I ACHSPIND="I" D INTRM^ACHSPA0A ; Don't reset obligation at Interim.
 ;
EOBRCX ;
 I $$LOCK^ACHS("^ACHS(9,DUZ(2),""FY"",ACHSACFY,0)","-")
 ;;SET CROSS REFERENCES FOR EOBR HERE
 ;
 ;AGAIN HERE WE SET ALL THE CRAP THAT SHOULD BE SET BY FILEMAN
 S $P(^ACHSF(DUZ(2),"D",ACHSDIEN,"T",ACHSTDA,0),U,13)=ACHSPDAT,$P(^(0),U,14)=ACHSPSQN,$P(^(0),U,15)=ACHSPIND
 S ^ACHSF(DUZ(2),"D",ACHSDIEN,"EB1",ACHSPDAT,ACHSPSQN,ACHSTDA)=""
 S ^ACHSF(DUZ(2),"PDOS",ACHSSVDT,ACHSDIEN,ACHSTDA)=""
 S:$D(ACHSISAO) ^ACHSF(DUZ(2),"EOBD",9999999-ACHSPDAT,ACHSDIEN,ACHSTDA)=""
 S ^ACHSF(DUZ(2),"EOBR",ACHSDIEN,ACHSTDA,9999999-ACHSPDAT)=""
 S:$G(DFN) ^ACHSF(DUZ(2),"EOBP",DFN,ACHSDIEN,ACHSTDA,9999999-ACHSPDAT)=""
 ;
 ; Following 2 lines for auto EOBR processing after all 4
 ; fields are available.  Presently, only DRG comes from
 ; the auto EOBR.  Other items are entered manually after
 ; document is paid, or from menu pick.
C1 S Y="ACHSDRG^ACHSADDT^ACHSDIDT^ACHSDITY"
 F %=1:1:4 I $G(@($P(Y,U,%))) D        ;SET ALL PIECES FOR 8 NODE
 .S X=$P($G(^ACHSF(DUZ(2),"D",ACHSDIEN,8)),U,%),$P(^(8),U,%)=$S(X:X,1:@($P(Y,U,%)))
 ;
 I ACHSPROV,'$D(^AUTTVNDR(ACHSPROV)) W:'$D(ACHSISAO) *7,!!,"Vendor Amount Paid Not Updated:  Vendor not found.",! G END
 I $G(ACHSISAO)=0,$D(^ACHSEOBR("ER",ACHSZFPT,ACHSCTR(1),36)) D END Q
 ;
 ;ACHSIPA='IHS PAYMENT AMOUNT"
 S ACHSDAP=ACHSIPA
 ;
 D ^ACHSVPT      ;UPDATE VENDOR PAYMENT FILE  ^ACHSVPMT
                 ;CHS VENDOR PAYMENTS^9002075
 D END
 Q
END ;
 S ACHSTIEN=ACHSTDA
 Q
 ;
FINAL ; Adjust obligated FYTD at Final
 S ACHSADJ=0
 S $P(^ACHSF(DUZ(2),"D",ACHSDIEN,"PA"),U,6)=ACHSPAMT  ;FINAL PAY AMT.
 S $P(^ACHSF(DUZ(2),"D",ACHSDIEN,"PA"),U)=ACHSPAMT     ;TOT PAY AMT
 ;
 ;IF WE HAVE BLANKET FORM PUT 'COMMENTS (OPTIONAL) INTO 'STATUS'
 ;OTHERWISE PUT 3 = "PAID"
 S $P(^ACHSF(DUZ(2),"D",ACHSDIEN,0),U,12)=$S($D(ACHSISAO)&$D(ACHSBLKF):$P(^ACHSF(DUZ(2),"D",ACHSDIEN,0),U,12),1:3)
 S $P(^ACHSF(DUZ(2),"D",ACHSDIEN,"PA"),U,2)=A       ;PAYMENT OBLIG. ADJ.
 S $P(^ACHSF(DUZ(2),"D",ACHSDIEN,"PA"),U,3)=ACHSPDAT ;FINAL PAY. DATE 
 S $P(^ACHSF(DUZ(2),"D",ACHSDIEN,"PA"),U,4)=ACHSPIND ;LAST PAYMENT TYPE
 S $P(^ACHSF(DUZ(2),"D",ACHSDIEN,"PA"),U,5)=ACHS3RDP ;PAY. AMT 3RD PARTY
 S ACHSDOCT=ACHSPAMT
 ;
 I $D(^ACHSF(DUZ(2),"D",ACHSDIEN,"IP")) D
 .S ACHSDOCT=$P(^ACHSF(DUZ(2),"D",ACHSDIEN,"IP"),U)+ACHSPAMT  ;INTERIM PAYMENT TOTAL
 .S $P(^ACHSF(DUZ(2),"D",ACHSDIEN,"PA"),U)=ACHSDOCT   ;TOT PAY AMT
 S ACHSADJ=ACHSDOCT-($P(^ACHSF(DUZ(2),"D",ACHSDIEN,0),U,9))  ;PRIOR PAY. POSTING DATE
 S $P(^ACHSF(DUZ(2),"D",ACHSDIEN,"PA"),U,2)=ACHSADJ   ;PAY OBLIG ADJ
 ;
 S ACHSOBL=$P(^ACHS(9,DUZ(2),"FY",ACHSACFY,0),U,3)      ;TOT OBLIG FYTD
 S ACHSREG=$P(^ACHSF(DUZ(2),"D",ACHSDIEN,0),U,19)       ;DCR ACCT #
 ;
 S ACHSACWK=$P(^ACHS(9,DUZ(2),"FY",ACHSACFY,"W",0),U,3) ;LAST ENTRY 
 S $P(^ACHS(9,DUZ(2),"FY",ACHSACFY,0),U,3)=ACHSOBL+ACHSADJ  ;TOT OBLIG AMT
 S Y=$P(^ACHS(9,DUZ(2),"FY",ACHSACFY,"W",ACHSACWK,1),U,ACHSREG) ;GET REGISTER BALANCE
 S $P(^ACHS(9,DUZ(2),"FY",ACHSACFY,"W",ACHSACWK,1),U,ACHSREG)=Y+ACHSADJ
 ;
 I '$D(ACHSISAO) W !,"*** OBLIGATION REGISTER UPDATED ***",! Q
 Q:ACHSISAO
 ;
 I '$D(ACHSSUM(ACHSY)) S ACHSSUM(ACHSY)="0^0^0^0^0^0^0"
 S $P(ACHSSUM(ACHSY),U,ACHSREG)=$P(ACHSSUM(ACHSY),U,ACHSREG)+ACHSADJ
 I '$D(ACHSSUM(ACHSY,"-")) S ACHSSUM(ACHSY,"-")=0
 I $E(ACHSADJ,1)="-",ACHSADJ<O S $P(ACHSSUM(ACHSY,"-"),U,ACHSREG)=$P(ACHSSUM(ACHSY,"-"),U,ACHSREG)+ACHSADJ G TOT
 I '$D(ACHSSUM(ACHSY,"+")) S ACHSSUM(ACHSY,"+")=0
 I ACHSADJ>0 S $P(ACHSSUM(ACHSY,"+"),U,ACHSREG)=$P(ACHSSUM(ACHSY,"+"),U,ACHSREG)+ACHSADJ
TOT ;
 I '$D(ACHSTOT(ACHSY,"PAYMENTS")) S ACHSTOT(ACHSY,"PAYMENTS")="0^0"
 S $P(ACHSTOT(ACHSY,"PAYMENTS"),U)=$P(ACHSTOT(ACHSY,"PAYMENTS"),U)+ACHSADJ
 S $P(ACHSTOT(ACHSY,"PAYMENTS"),U,2)=$P(ACHSTOT(ACHSY,"PAYMENTS"),U,2)+1
 Q
 ;
 ;INITIALIZE NEW TRANSACTION ENTRY
SBTRN ;EP
 ;TRY AND LOCK THE DOCUMENT
 ;ACHS*3.1*11 8.27.04 IHS/OIT/FCJ SPLIT LINE AND ADDED SET OF ACHSQUIT
 ;I '$$LOCK^ACHS("^ACHSF(DUZ(2),""D"",ACHSDIEN)","+") W !,"LOCK on '^ACHSF(",DUZ(2),"""D"",",ACHSDIEN,")' at SBTRN^ACHSPA0 failed.",!,"Someone else is using it.  Try again later." D RTRN^ACHS Q
 I $$LOCK^ACHS("^ACHSF(DUZ(2),""D"",ACHSDIEN)","+")
 E  W !,"LOCK on '^ACHSF(",DUZ(2),"""D"",",ACHSDIEN,")' at SBTRN^ACHSPA0 failed.",!,"Someone else is using it.  Try again later." D RTRN^ACHS S DUOUT=1 Q
 ;ACHS*3.1*11 8.27.04 IHS/OIT/FCJ END OF CHANGES
 ;
 ;SET THE SUB FILE 0 NODE IF NOT THERE THEN DO ALL THE STUFF FILEMAN
 ;WOULD DO FOR YOU IF YOU HAD PROGRAMMED IT RIGHT
 S:'$D(^ACHSF(DUZ(2),"D",ACHSDIEN,"T",0)) ^ACHSF(DUZ(2),"D",ACHSDIEN,"T",0)="^9002080.02D"
 S ACHS=$G(^ACHSF(DUZ(2),"D",ACHSDIEN,"T",0))
 S ACHSTDA=$P(ACHS,U,3)
 ;
 ;GET OPEN TRANSACTION ENTRY NUMBER
SBTRN1 ;
 S ACHSTDA=ACHSTDA+1
 G SBTRN1:$D(^ACHSF(DUZ(2),"D",ACHSDIEN,"T",ACHSTDA))
 ;
 S $P(ACHS,U,3)=ACHSTDA
 S $P(ACHS,U,4)=$P(ACHS,U,4)+1
 S ^ACHSF(DUZ(2),"D",ACHSDIEN,"T",0)=ACHS
 ;ACHS*3.1*11 8.27.04 IHS/OIT/FCJ COMMENT NXT LNE, UNLOCKING DOC BEFORE ALL DATA ENTRY WAS COMPLETED
 ;I $$LOCK^ACHS("^ACHSF(DUZ(2),""D"",ACHSDIEN)","-")   ;UNLOCK DOCUMENT
 ;
 S ACHSOPAY=$P($G(^ACHSF(DUZ(2),"O",ACHSTYP,0)),U,2,3)  ;GET OVERPAYMENT
                                                        ;AND MAX OVERPAY
                                                        ;ALLOWED
 ;
 S ACHSTAO=$P($G(^ACHSF(DUZ(2),"D",ACHSDIEN,0)),U,9)    ;TOT. OBLIGATED
                                                        ;AMOUNT
 I $D(ACHSISAO) S ACHSPAMT=+$G(ACHSIPA) Q
 S ACHSPAMT=$P($G(^ACHSF(DUZ(2),"D",ACHSDIEN,"PA")),U,6) ;FINAL PAYMENT
                                                         ;AMOUNT
 S ACHSIPA=0
 Q
 ;
