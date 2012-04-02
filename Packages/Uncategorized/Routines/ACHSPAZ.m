ACHSPAZ ; IHS/ITSC/PMF - DOCUMENT PAYMENT - ENTER SVDT,WKLD,FULP,3RDP,VAMT ;    [ 02/02/2005  11:12 AM ]
 ;;3.1;CONTRACT HEALTH MGMT SYSTEM;**12,19**;JUN 11, 2001
 ;
 S (ACHSADDT,ACHSDIDT,ACHSDITY,ACHSSVDT,ACHSWKLD,ACHSFULP,ACHS3RDP,ACHS3RDS,ACHSVAMT,ACHSCTL,ACHSCHK,ACHSREM,ACHSSV,ACHSOB,ACHSPACC)=""
A1 ;
 W !!,"Date Of Service: "
 I ACHSSVDT W $$FMTE^XLFDT(ACHSSVDT),"// "
 D READ^ACHSFU
 I $G(ACHSQUIT) D END Q
 I Y?1"?".E W !,"  Enter The Date The Patient First Received Treatment" G A1
 I Y="" G A3:ACHSSVDT W !!,"Must enter Date of Service" G A1
 S X=Y,%DT="EXQP"
 D ^%DT
 I Y<1 S ACHSSVDT="" G A1
 I Y<ACHSODT S ACHSSVDT=Y W *7,!,"SERVICE date is before ORDER date.",! G A2
 S ACHSSVDT=Y
 G A3
 ;
A2 ;
 S Y=$$DIR^XBDIR("Y","Are You Sure This Is Correct ","NO","","","",2)
 I $D(DTOUT) D END Q
 G A1:$D(DUOUT)!('Y)
A3 ;
 S Y=$$DIR^XBDIR("N^1:9999:0","Workload Units",$G(ACHSWKLD),""," Enter # of Visits, Days &/or Tests","",2)
 I $D(DTOUT) D END Q
 G A1:$D(DUOUT)
 S ACHSWKLD=Y
 ;
A3A ; Set O/P visit to Hospital node
 ;
 ;GET OBJECT CLASSIFICATION PTR THEN GET CODE
 ;254D = PHYS OUTP NON-IHS
 I $$DOC^ACHS(0,7) I $P(^ACHS(3,DUZ(2),1,$$DOC^ACHS(0,7),0),U)'="254D" G A4
 ;GET PROVIDER (VENDOR) PTR THEN GET PROVIDER TYPE
 I $$DOC^ACHS(0,8) I +$P(^AUTTVNDR($$DOC^ACHS(0,8),11),U,3)'="" I $D(^AUTTVTYP(+$P($G(^AUTTVNDR($$DOC^ACHS(0,8),11)),U,3),0)) S %=$P(^(0),U) I (%="05")!(%="06") G A4
 D DIR("9002080.02,9.1^O",$P($G(^ACHSF(DUZ(2),"D",ACHSDIEN,"T",ACHSTDA,0)),U,16))
 I $D(DTOUT) D END Q
 G A3:$D(DUOUT)
 S $P(^ACHSF(DUZ(2),"D",ACHSDIEN,"T",ACHSTDA,0),U,16)=Y  ;HOSPITAL OUTPATIENT
A4 ;
 ;
 D ^ACHSPAA                   ;DOCUMENT PAYMENT ENTER/EDIT AMOUNT
 I $D(DTOUT) D END Q          ;RETURNED VARS ACHSIPA,ACHSVAMT,ACHSPAMT   
 G A3:$D(DUOUT)
 ;
 I +ACHSVAMT=0 S ACHSFULP="P" G A6
A5 ;
 S ACHSFULP=$$DIR^XBDIR("9002080.02,4","Payment Status",$G(ACHSFULP),"","","",2)
 G A4:$D(DUOUT),END:$D(DTOUT)
 I '$L(ACHSFULP) W "  Required" G A5
A6 ;
 I ACHSFULP="F" S (ACHS3RDP,ACHS3RDS)="" G A7A
A7 ;
 W !!,"Enter Amount Paid by all Third Parties: "
 I ACHS3RDP S X=ACHS3RDP D FMT^ACHS W "//"
 D READ^ACHSFU
 I $D(DTOUT) D END Q
 G A5:$D(DUOUT)
 I Y?1"?".E W !," Enter difference between total bill and amount paid by IHS" G A6
 I Y="" G SRC:ACHS3RDP
 S ACHS3RDP=$J(Y,0,2)
 W "   ("
 S X=ACHS3RDP
 D FMT^ACHS
 W ")"
SRC ; 3P source
 S ACHS3RDS=$P($G(^AUTNINS(+$G(ACHS3RDS),0)),U)  ;'NAME' FROM 'INSURER'
 D DIR("9002080.02,12^O",$G(ACHS3RDS))
 I $D(DTOUT) D END Q
 G A5:$D(DUOUT)
 S ACHS3RDS=$S(+Y>0:+Y,1:"")
 ;
A7A ; Pay indicator: Final/Interim
 S:'$D(ACHSF638) ACHSF638=$P(^ACHSF(DUZ(2),0),U,8)
 I $$DOC^ACHS(0,17)="I" S ACHSPIND="F" G A7C
 D DIR("9002080.02,15",$$EXTSET^XBFUNC(9002080.02,15,$G(ACHSPIND)))
 G A5:$D(DUOUT),END:$D(DTOUT)
 I '$L(Y) W *7,"  Required" G A7A
 S ACHSPIND=Y
 ;
A7C ; EOBR pay date
 ;I ACHSF638="Y" S ACHSPDAT=DT G A8
 I $$PARM^ACHS(2,11)'="Y",ACHSF638="Y" S ACHSPDAT=DT G A8    ;ACHS*3.1*19 IHS/OIT.FCJ ADDED FOR TRIBAL SITES USING THE FI
 D DIR("9002080.02,13",$$FMTE^XLFDT($G(ACHSPDAT),1))
 I $D(DTOUT) D END Q
 G A5:$D(DUOUT)
 I '$L(Y) W *7,"  Required" G A7C
 S ACHSPDAT=Y
 G:$$DOC^ACHS(0,17)'="F" A8   ;DOCUMENT DESTINATION  F= FI
 ;
A7D ; EOBR Control Number
 ;G:ACHSF638="Y" A8
 I $$PARM^ACHS(2,11)'="Y",ACHSF638="Y" S ACHSPDAT=DT G A8    ;ACHS*3.1*19 IHS/OIT.FCJ ADDED FOR TRIBAL SITES USING THE FI
 D DIR("9002080.02,16",$G(ACHSCTL))
 I $D(DTOUT) D END Q
 G A5:$D(DUOUT)
 I '$L(Y) W *7,"  Required" G A7D
 S ACHSCTL=Y
 ;
A7E ; EOBR Check number
 D DIR("9002080.02,17",$G(ACHSCHK))
 I $D(DTOUT) D END Q
 G A5:$D(DUOUT)
 I '$L(Y) W *7,"  Required" G A7E
 S ACHSCHK=Y
 ;
A7F ; EOBR Remittance number
 D DIR("9002080.02,18",$G(ACHSREM))
 I $D(DTOUT) D END Q
 G A5:$D(DUOUT)
 I '$L(Y) W *7,"  Required" G A7F
 S ACHSREM=Y
 ;
A7G ; EOBR Services
 D DIR("9002080.02,19",$$EXTSET^XBFUNC(9002080.02,19,$G(ACHSSV)))
 I $D(DTOUT) D END Q
 G A5:$D(DUOUT)
 I '$L(Y) W *7,"  Required" G A7G
 S ACHSSV=Y
 ;
A7H ; EOBR Obligation type
 D DIR("9002080.02,20",$$EXTSET^XBFUNC(9002080.02,20,$G(ACHSOB)))
 I $D(DTOUT) D END Q
 G A5:$D(DUOUT)
 I '$L(Y) W *7,"  Required" G A7H
 S ACHSOB=Y
 ;
A8 ;
 ;ITSC/SET/JVK 1.25.05 ACHS*3.1*12 NXT 4 LINES PATIENT ACCT NO
 I ACHSF638="Y" D
 .S DIR(0)="9002080.01,26.01"
 .S DIR("A")="Patient Account #"
 .D ^DIR
 .S ACHSPACC=Y
 .K DIR
 .Q
 S ACHSPSQN=$G(^ACHSF(DUZ(2),"SEQN"))+1
 S ^ACHSF(DUZ(2),"SEQN")=ACHSPSQN
 S Y=$$DIR^XBDIR("Y","Are All Entries Correct","NO","","","",2)
 G END:$D(DTOUT),A3:$D(DUOUT),A1:'Y
 S ACHSSET=1
 W !!,"***  Document Paid  ***"
 I $P(^ACHSF(DUZ(2),0),U,8)="Y",$P(^(0),U,9)="Y" S ^ACHS(7,"CHS 638 CHECKS",DUZ(2),ACHSDIEN)="" W !!,"***  Document added to Check-print list.  ***"
END ;
 K ACHSVAMT,X2,X3
 Q
 ;
DIR(ACHS,ACHS1) ; ( <DIR(0)> , <DIR("B")> )
 W !
 K DIR,DUOUT,DTOUT,DIRUT
 S DIR(0)=ACHS
 I $L($G(ACHS1)) S DIR("B")=ACHS1
 D ^DIR
 K DIR
 Q
 ;