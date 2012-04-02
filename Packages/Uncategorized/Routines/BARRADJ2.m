BARRADJ2 ; IHS/SD/TPF - TRANSACTION/ADJUSTMENT REPORT ;08/20/2008
 ;;1.8;IHS ACCOUNTS RECEIVABLE;**6,7,19.20**;MAY 26, 2008
 ; MODIFIED XTMP FILE NAME TO TMP TO MEET SAC REQUIREMENTS;MRS:BAR*1.8*7 IM29892
 ; TMM 08/19/2010 V1.8*19 - Added new functionality to TSR report for STATUS CHANGE
 ;   trans Type and Adj Category SENT TO COLLECTIONS
 Q
 ; ***********
DETAIL ; EP
 N BARBILL,BARBILLO  ;BAR*1.8*6
 ; Print Detail
 N TT S TT=$O(BARY("TRANS TYPE",""))
 ;TT = 40 FOR PAYMENT TRANSACTION TYPE
 ;AND 43 FOR AN ADJUST ACCOUNT
 ;AND 993 FOR 'STATUS CHANGE' TRANSACTION TYPE  ;bar*1.8*19*ADD*TMM
 I 'TT W !!,"TRANSACTION TYPE PARAMETER MUST BE DEFINED!" H 2 Q
 I 'SUMMARY D
 .S BAR("COL")="W !,""Bill"",?15,""Transaction"",?26,"""",?45,""Amount"",?56,""Transaction"""_$S(TT=40:"",1:",?69,""Adjustment""")
 .S BAR("COL",0)="W !,""Number"",?19,""Date"",?32,""Insurer"",?45,""Billed"",?59,""Amount"""_$S(TT=40:"",1:",?73,""Type""")
 .S BAR("HD",0)="DETAIL Transaction"_$P(BAR("HD",0),"Transaction",2,99)
 E  D
 .S BAR("COL")="W !,"""",?15,"""",?32,""Bill"",?45,""Amount"",?56,""Transaction"",?69,"""""
 .S BAR("COL",0)="W !,"""",?5,""Insurer"",?32,""Count"",?45,""Billed"",?59,""Amount"",?73,"""""
 .S BAR("HD",0)="SUMMARY Transaction"_$P(BAR("HD",0),"Transaction",2,99)
 ;IHS/SD/AR RQMNT bar*1.8*18
 ;D HDB  ;Page and column header
 D:'BARTEXT HDB  ;Page and column header
 I $D(DTOUT)!$D(DUOUT)!$D(DIROUT) S BAR("F1")=1  ;bar*1.8*19*ADD*TMM
 Q:$G(BAR("F1"))  ;bar*1.8*19*ADD*TMM
 ;INITIALIZE TOTALS
 K VLOCBTOT,TRANBTOT,ADJTBTOT,SORTBTOT,ARBTOT
 K VLOCTTOT,TRANTTOT,ADJTTTOT,SORTTTOT,ARTTOT
 S TOTBILLS=0  ;BILL COUNT
 S GRANBILL=0  ;BILL AMT GRAND TOT
 S GRANTRAN=0  ;TRANS AMT GRAND TOT
 ;
 K I,Y,X
 S BARDASH="                                          ----------     ----------"
 S BAREQUAL="                                         ==========     =========="
 S BAR("AR")=""   ;Initialize A/R Clerk (1)
 S BAR("L")=""    ;Initialize location  (2)
 S BAR("TRANS")=""  ;Initialize transaction  (3)
 S BAR("B")=""     ;Initialize Batch (3)
 S BAR("IT")=""    ;Initialize Item  (4)
 S BAR("SORT")=""  ;Initialize sort  (5)
 S BAR("ACCT")=""  ;Initialize A/R account (6)
 S BAR("ADJCAT")=""
 S BAR("OINS")=""  ;OLD INSURER
 S BAR("O11")=""  ;OLD INS IEN
 S BARTR("DATA SRC")=""  ;bar*1.8*20 REQ10
 ;IHS/SD/AR RQMNT bar*1.8*18
 S BARPREV="BEGIN"
 S BAR("Z")="TMP("_$J_",""BAR-TSR"""
 S BAR="^"_BAR("Z")_")"
 I '$D(@BAR) D  Q         ; No data, message, quit
 . W $$CJ^XLFSTR("*** NO DATA TO PRINT FOR "_$P($G(^DIC(4,DUZ(2),0)),U)_" ***",IOM)
 . D EOP^BARUTL(0)
 . I $D(DTOUT)!$D(DUOUT)!$D(DIROUT) S BAR("F1")=1 Q   ;IHS/SD/AR 1.8*19
 ; traverse the temp global...
 S BARBILLO=""  ;BAR*1.8*6
 F  S BAR=$Q(@BAR) Q:BAR[("BAR-TSRS")  D  Q:$G(BAR("F1"))
 .I $Y>(IOSL-5) D HD Q:$G(BAR("F1"))  D SUBHD
 .S BAR("TXT")=$P($P(BAR,",",4,99),"""",2)
 .S BAR("TXT")=$P(BAR,",",3)_U_BAR("TXT")  ; Subscript
 .S BAR("TXTO")=BAR("TXT")  ;NOW THIS IS THE SAME ORDER AS IN ^BARRADJ
 .;THIS NEXT LINE TAKES DUZ(2) AND STICKS IT AT THE END OF THE STRING  ???
 .S BAR("TXT")=$P(BAR("TXTO"),U)_U_$P(BAR("TXTO"),U,3,99)_U_$P(BAR("TXTO"),U,2)
 .S BAR("NODE")=@BAR                       ; Data
 .;
 .;S BARBILL=$P(BAR("TXT"),U,6)  ;BAR*1.8*6  ;bar*1.8*20 REQ10
 .S BARBILL=$P(BAR("TXT"),U,7)  ;BAR*1.8*6  ;bar*1.8*20 REQ10
 .S BAR(1)=$P(BAR("NODE"),U)   ; Bill number
 .S BAR(2)=$P(BAR("NODE"),U,2)  ; PAY-AMT
 .S BAR(3)=$P(BAR("NODE"),U,3)  ; PRV-CRD
 .S BAR(4)=$P(BAR("NODE"),U,4)  ; Refund
 .S BAR(5)=$P(BAR("NODE"),U,5)  ; Payment
 .S BAR(6)=$P(BAR("NODE"),U,6)  ; Bill Amount
 .S BAR(7)=$P(BAR("NODE"),U,7)  ; Adjustment
 .S BAR(8)=$P(BAR("NODE"),U,8)  ; transaction type
 .S BAR(9)=$P(BAR("NODE"),U,9)  ; insurer
 .S BAR(10)=$P(BAR("NODE"),U,10)  ;transaction date
 .S BAR(11)=$P(BAR("NODE"),U,11)  ;A/R ACCT PTR (INSURER PTR)
 .S BAR(12)=$P(BAR("NODE"),U,12)  ;Adjustment category
 .S BAR(13)=$P(BAR("NODE"),U,13)  ;Adjustment Type
 .;
 .;IHS/SD/AR PATCH 18 RQMNT
 .I BARTEXT D
 ..Q:$L(BAR("NODE"),U)<10
 ..N BARDLMTD
 ..S BARDLMTD("CLINICVISIT")="NONE"
 ..S BARDLMTD("VISIT")=$P(BAR("TXT"),U,2)
 ..I BARY("SORT")="C" D
 ...I $P(BAR("TXT"),U,5)=99999 S BARDLMTD("CLINICVISIT")="NO CLINIC"
 ...S BARDLMTD("CLINICVISIT")=$P(^DIC(40.7,$P(BAR("TXT"),U,5),0),U)
 ..I BARY("SORT")="V" D
 ...I $P(BAR("TXT"),U,5)=99999 S BARDLMTD("CLINICVISIT")="NO VISIT TYPE"
 ...S BARDLMTD("CLINICVISIT")=$P($G(^ABMDVTYP($P(BAR("TXT"),U,5),0)),U)
 ..S BARDLMTD("BILLNUM")=BAR(1)
 ..S BARDLMTD("TRANSDATE")=BAR(10)
 ..S BARDLMTD("INSURER")=BAR(9)
 ..S BARDLMTD("BILLAMT")=$FN(BAR(6),",",2)
 ..S BARDLMTD("TRXNAMT")=$FN(BAR(3)+BAR(4)+BAR(5)+BAR(7),",",2)
 ..;I $D(BARY("TRANS TYPE",43)) D   ;M819*DEL*TMM
 ..I $D(BARY("TRANS TYPE",43))!$D(BARY("TRANS TYPE",993)) D  ;M819*ADD*TMM
 ...I '$P(BAR("TXT"),U,3) S BARDLMTD("ADJCAT")=$P(BAR("TXT"),U,3)
 ...E  S BARDLMTD("ADJCAT")=$$GET1^DIQ(90052.01,$P(BAR("TXT"),U,3)_",",.01,"E")
 ...S BARDLMTD("ADJTYPE")=$E($$GET1^DIQ(90052.02,BAR(12)_",",.01),1,12)
 ...W:BARY("SORT")="N" !,BARDLMTD("VISIT")_U_BARDLMTD("ADJCAT")_U_BARDLMTD("BILLNUM")_U_BARDLMTD("TRANSDATE")_U_BARDLMTD("INSURER")_U_BARDLMTD("BILLAMT")_U_BARDLMTD("TRXNAMT")_U_BARDLMTD("ADJTYPE")
 ...W:BARY("SORT")'="N" !,BARDLMTD("VISIT")_U_BARDLMTD("CLINICVISIT")_U_BARDLMTD("ADJCAT")_U_BARDLMTD("BILLNUM")_U_BARDLMTD("TRANSDATE")_U_BARDLMTD("INSURER")_U_BARDLMTD("BILLAMT")_U_BARDLMTD("TRXNAMT")_U_BARDLMTD("ADJTYPE")
 ..E  D
 ...W:BARY("SORT")="N" !,BARDLMTD("VISIT")_U_BARDLMTD("BILLNUM")_U_BARDLMTD("TRANSDATE")_U_BARDLMTD("INSURER")_U_BARDLMTD("BILLAMT")_U_BARDLMTD("TRXNAMT")
 ...W:BARY("SORT")'="N" !,BARDLMTD("VISIT")_U_BARDLMTD("CLINICVISIT")_U_BARDLMTD("BILLNUM")_U_BARDLMTD("TRANSDATE")_U_BARDLMTD("INSURER")_U_BARDLMTD("BILLAMT")_U_BARDLMTD("TRXNAMT")
 .Q:BARTEXT
 .I BARPREV="BEGIN" D
 ..S BARPREV=BAR(12)
 .E  D
 ..;I BARPREV'=BAR(12),$D(BARY("TRANS TYPE",43)) D  ;M819*DEL*TMM
 ..I BARPREV'=BAR(12),$D(BARY("TRANS TYPE",43))!$D(BARY("TRANS TYPE",993)) D  ;M819*ADD*TMM
 ...S BARPREV=BAR(12)
 ...D SUBTYPE
 .;IHS/SD/AR PATCH 18 RQMNT
 .I $D(BARY("AR")),BAR("AR")'=$P(BAR("TXT"),U) D
 ..S BAR("L")=""
 ..D SUBHD
 .S BAR("AR")=$P(BAR("TXT"),U)
 .;
 .I BAR("L")'=$P(BAR("TXT"),U,2) D
 ..I BAR("L")]"" D
 ...I SUMMARY D GETCOUNT
 ...Q:$G(BAR("F1"))
 ...W !,BARDASH
 ...D SUBLOC
 ...W !
 ..W !?1,"Visit Location.......: ",$P(BAR("TXT"),U,2)
 ..S (BAR("TRANS"))=""
 ..S (TRANBTOT,TRANTTOT)=0
 .S BAR("L")=$P(BAR("TXT"),U,2)
 .;
 .I BAR("TRANS")'=$P(BAR("TXT"),U,3) D
 ..I BAR("TRANS")]"" D
 ...Q:$G(BAR("F1"))
 ...I SUMMARY D GETCOUNT
 ...W !,BARDASH
 ...D SUBTRAN
 ...W !
 ..I $D(BARY("TRANS TYPE",43)) W !?5,"Adjustment Category.......: "
 ..I $D(BARY("TRANS TYPE",993)) W !?5,"Adjustment Category.......: "   ;M819*ADD*TMM
 ..;E  W !?5,"Transaction Type.......: " IHS/SD/PKD 1/18/11 commented out bar*1.8*19
 ..I '$P(BAR("TXT"),U,3) W $P(BAR("TXT"),U,3)
 ..E  D
 ...;I $D(BARY("TRANS TYPE",43)) W $$GET1^DIQ(90052.01,$P(BAR("TXT"),U,3)_",",.01,"E")   ;M819*DEL*TMM
 ...I $D(BARY("TRANS TYPE",43))!$D(BARY("TRANS TYPE",993)) W $$GET1^DIQ(90052.01,$P(BAR("TXT"),U,3)_",",.01,"E")   ;M819*ADD*TMM
 ...E  W $$GET1^DIQ(90052.02,$P(BAR("TXT"),U,3)_",",.01,"E")
 ..;S (BAR("SORT"))=""  ;WASN'T TOTALING VISIT/CLINIC CORRECTLY- WHY RESET AT SAME TIME AS ADJUSTMENT RESET?
 ..;S (SORTBTOT,SORTTTOT)=0
 .S BAR("TRANS")=$P(BAR("TXT"),U,3)
 .;
 .;I BAR("SORT")'=$P(BAR("TXT"),U,5) D  ;bar*1.8*20 REQ10
 .I BAR("SORT")'=$P(BAR("TXT"),U,6) D  ;bar*1.8*20 REQ10
 ..I BAR("SORT")]"" D
 ...;I $Y>(IOSL-5) D HD Q:$G(BAR("F1"))  D SUBHD
 ...Q:$G(BAR("F1"))
 ...I SUMMARY D GETCOUNT
 ...W !,BARDASH
 ...D SUBSORT
 ...W !
 ..;start new code bar*1.8*20 REQ10
 ..I BARTR("DATA SRC")'=$P(BAR("TXT"),U,5) D
 ...I BARTR("DATA SRC")]"" D
 ....I SUMMARY D GETCOUNT
 ....Q:$G(BAR("F1"))
 ....W !,BARDASH
 ....D SUBDSRC
 ....W !
 ...W !?10,"Data Source..........: ",$S($P(BAR("TXT"),U,5)="e":"ELECTRONIC",1:"MANUAL")
 ..S BARTR("DATA SRC")=$P(BAR("TXT"),U,5)
 ..;end new code REQ10
 ..I BARY("SORT")="C" D
 ...;I $Y>(IOSL-5) D HD Q:$G(BAR("F1"))  D SUBHD
 ...W !?10,"Clinic Type..........: "
 ...;I $P(BAR("TXT"),U,5)=99999 W "NO CLINIC" Q  ;bar*1.8*20 REQ10
 ...I $P(BAR("TXT"),U,6)=99999 W "NO CLINIC" Q  ;bar*1.8*20 REQ10
 ...;W $P(^DIC(40.7,$P(BAR("TXT"),U,5),0),U),!  ;bar*1.8*20 REQ10
 ...W $P(^DIC(40.7,$P(BAR("TXT"),U,6),0),U),!  ;bar*1.8*20 REQ10
 ..;E  D   IHS/SD/AR BAR*1.8*19 06.14.2010
 ..I BARY("SORT")="V" D
 ...;I $Y>(IOSL-5) D HD Q:$G(BAR("F1"))  D SUBHD
 ...W !?10,"Visit Type...........: "
 ...;I $P(BAR("TXT"),U,5)=99999 W "NO VISIT TYPE" Q  ;bar*1.8*20 REQ10
 ...I $P(BAR("TXT"),U,6)=99999 W "NO VISIT TYPE" Q  ;bar*1.8*20 REQ10
 ...;W $P($G(^ABMDVTYP($P(BAR("TXT"),U,5),0)),U),!  ;bar*1.8*20 REQ10
 ...W $P($G(^ABMDVTYP($P(BAR("TXT"),U,6),0)),U),!  ;bar*1.8*20 REQ10
 ..;
 .;S BAR("SORT")=$P(BAR("TXT"),U,5)  ;bar*1.8*20 REQ10
 .S BAR("SORT")=$P(BAR("TXT"),U,6)  ;bar*1.8*20 REQ10
 .I 'SUMMARY W !,$E(BAR(1),1,15)  ; A/R Bill ;BAR*1.8*1 item 1 page 12
 .I 'SUMMARY W ?15,BAR(10)   ;TRANS DATE
 .I SUMMARY S OFFSET=10
 .E  S OFFSET=27
 .I $L($E(BAR(9),1,15))<15 D
 ..K FILL
 ..S $P(FILL," ",16-$L(BAR(9)))=""
 ..W:'SUMMARY ?OFFSET,$E(BAR(9),1,15)_FILL
 .E  W:'SUMMARY ?OFFSET,$E(BAR(9),1,15)  ;INSURER
 .I 'SUMMARY D
 ..Q:BARBILL=BARBILLO
 ..W ?41,$J($FN(BAR(6),",",2),10)       ; Bill Amt
 .I 'SUMMARY W ?55,$J($FN(BAR(3)+BAR(4)+BAR(5)+BAR(7),",",2),10)  ;GET ALL ADJS
 .I 'SUMMARY W $P(BAR("TXT"),U,5)  ;bar*1.8*20 REQ10
 .I 'SUMMARY,'$D(BARY("TRANS TYPE",40)) W ?67,$E($$GET1^DIQ(90052.02,BAR(12)_",",.01),1,12)   ;ADJ TYPE
 .;ADD THE SUBTOTALS ONLY IFA NEW BILL. AND DON'T ADD IF THE BILL AMT FOR A BILL HAS ALREADY BEEN COUNTED
 .I BARBILL'=BARBILLO D
 ..S VLOCBTOT=$G(VLOCBTOT)+BAR(6)
 ..S TRANBTOT=$G(TRANBTOT)+BAR(6)
 ..S ADJTBTOT=$G(ADJTBTOT)+BAR(6)
 ..S SORTBTOT=$G(SORTBTOT)+BAR(6)
 ..S ARBTOT=$G(ARBTOT)+BAR(6)
 ..S DSRCBTOT=$G(DSRCBTOT)+BAR(6)  ;bar*1.8*20 REQ10
 ..S BARBILLO=BARBILL
 .S VLOCTTOT=$G(VLOCTTOT)+BAR(3)+BAR(4)+BAR(5)+BAR(7)  ;WAS ADDING BAR(2)
 .S TRANTTOT=$G(TRANTTOT)+BAR(3)+BAR(4)+BAR(5)+BAR(7)
 .S ADJTTTOT=$G(ADJTTTOT)+BAR(3)+BAR(4)+BAR(5)+BAR(7)
 .S SORTTTOT=$G(SORTTTOT)+BAR(3)+BAR(4)+BAR(5)+BAR(7)
 .S ARTTOT=$G(ARTTOT)+BAR(3)+BAR(4)+BAR(5)+BAR(7)
 .S DSRCTTOT=$G(DSRCTTOT)+BAR(3)+BAR(4)+BAR(5)+BAR(7)  ;bar*1.8*20 REQ10
 .S GRANBILL=GRANBILL+BAR(6)
 .S GRANTRAN=GRANTRAN+BAR(3)+BAR(4)+BAR(5)+BAR(7)
 ;IHS/SD/AR 1.8*19 05/04/2010
 ;Q:$G(BAR("F1"))
 Q:$G(BAR("F1"))!BARTEXT
 I SUMMARY D GETCOUNT
 W !,BARDASH
 D SUBDSRC  ;bar*1.8*20 REQ10
 D SUBSORT
 W ! D SUBTRAN
 W ! D SUBLOC
 D TOT
 Q
 ; ********
HD ; EP
 D PAZ^BARRUTL
 I $D(DTOUT)!$D(DUOUT)!$D(DIROUT) S BAR("F1")=1 Q
HDB ; EP
 ; Page and column header
 S BAR("PG")=BAR("PG")+1
 S BAR("I")=""
 D WHD^BARRHD                   ; Report header
 X BAR("COL")
 X BAR("COL",0)
 S $P(BAR("DASH"),"=",$S($D(BAR(132)):132,1:80))=""
 W !,BAR("DASH")
 Q
 ; ************************************
SUBHD ;
 ; If A/R clerk specified
 Q:'$D(BARY("AR"))
 Q:'+$P(BAR("TXT"),U)
 W !!,"A/R Entry Clerk: ",$P(^VA(200,$P(BAR("TXT"),U),0),U)
 Q
 ; ***********************************
SUBTRAN ;EP - TOTALS BY TRANSACTION TYPE
 ;I $Y>(IOSL-5) D HD Q:$G(BAR("F1"))  D SUBHD
 I $D(BARY("TRANS TYPE",40)) W !?10,"Totals by Transaction type:"
 E  W !?10,"Totals by Adjustment Category:"
 W ?42,$J($FN(TRANBTOT,",",2),10)
 W ?55,$J($FN(TRANTTOT,",",2),10)
 S (TRANBTOT,TRANTTOT)=0
 Q
SUBLOC ;
 ; Totals by Visit location.
 ;I $Y>(IOSL-5) D HD Q:$G(BAR("F1"))  D SUBHD
 W !,"Location Tot:"
 W ?42,$J($FN(VLOCBTOT,",",2),10)
 W ?55,$J($FN(VLOCTTOT,",",2),10)
 S (VLOCBTOT,VLOCTTOT)=0
 Q
 ; ******************************
SUBADJ ;
 ;I $Y>(IOSL-5) D HD Q:$G(BAR("F1"))  D SUBHD
 ; Totals by adjustment category
 W !,"Adjustment Category Tot:"
 W ?41,$J($FN(ADJTBTOT,",",2),10)
 W ?55,$J($FN(ADJTTTOT,",",2),10)
 S (ADJTBTOT,ADJTTTOT)=0
 Q
SUB2 ;
 ; Totals by Collection Batch
 Q
 Q:'BAR("BTOT2")
 W !,"   Batch Tot:"
 ;W ?15,$J($FN(BAR("PATOT2"),",",2),10)
 ;W ?26,$J($FN(BAR("PCTOT2"),",",2),10)
 ;W ?37,$J($FN(BAR("RTOT2"),",",2),10)
 ;W ?48,$J($FN(BAR("PTOT2"),",",2),10)
 W ?41,$J($FN(BAR("BTOT2"),",",2),10)
 W ?55,$J($FN(BAR("ATOT2"),",",2),10)
 S (BAR("PATOT2"),BAR("PCTOT2"),BAR("RTOT2"),BAR("PTOT2"),BAR("BTOT2"),BAR("ATOT2"))=0
 Q
 ; *******************************
SUB3 ;
 Q
 ; Totals by Collection Batch Item
 Q:'BAR("BTOT3")
 W !,"    Item Tot:"
 ;W ?15,$J($FN(BAR("PATOT3"),",",2),10)
 ;W ?26,$J($FN(BAR("PCTOT3"),",",2),10)
 ;W ?37,$J($FN(BAR("RTOT3"),",",2),10)
 ;W ?48,$J($FN(BAR("PTOT3"),",",2),10)
 W ?41,$J($FN(BAR("BTOT3"),",",2),10)
 W ?55,$J($FN(BAR("ATOT3"),",",2),10)
 S (BAR("PATOT3"),BAR("PCTOT3"),BAR("RTOT3"),BAR("PTOT3"),BAR("BTOT3"),BAR("ATOT3"))=0
 Q
 ; ****************************
 ;start new code bar*1.8*20 REQ10
SUBDSRC ;
 ; Totals by Data Source
 W !?25,"Data Source Tot:"
 I SUMMARY W !?5,"Subtotal:",?33,$J(DSRCTOT,5,0)
 W ?42,$J($FN(DSRCBTOT,",",2),10)
 W ?55,$J($FN(DSRCTTOT,",",2),10)
 S (DSRCBTOT,DSRCTTOT)=0
 Q
 ;end new code REQ10
SUBSORT ;
 ; Totals by Sort type
 ;I $Y>(IOSL-5) D HD Q:$G(BAR("F1"))  D SUBHD
 I BARY("SORT")="C",'SUMMARY W !?25,"Clinic Tot:"
 I BARY("SORT")="V",'SUMMARY  W !?25,"Visit Type Tot:"
 ;IHS/SD/AR BAR*1.8*19
 I BARY("SORT")'="N" D
 .I SUMMARY W !?5,"Subtotal:",?33,$J(SUBTOT,5,0)
 .W ?42,$J($FN(SORTBTOT,",",2),10)
 .W ?55,$J($FN(SORTTTOT,",",2),10)
 S (SORTBTOT,SORTTTOT)=0
 Q
 ; *************************
SUB5 ;
 Q
 ; totals by A/R Account
 Q:'BAR("BTOT5")
 W !,"A/R Acct Tot:"
 W ?41,$J($FN(BAR("BTOT5"),",",2),10)
 W ?55,$J($FN(BAR("ATOT5"),",",2),10)
 S (BAR("PATOT5"),BAR("PCTOT5"),BAR("RTOT5"),BAR("PTOT5"),BAR("BTOT5"),BAR("ATOT5"))=0
 Q
 ; ***********************
TOT ;
 ; Report (a/r clerk) totals
 ;I $Y>(IOSL-5) D HD Q:$G(BAR("F1"))  D SUBHD
 W !!,BAREQUAL
 I 'SUMMARY W !,"REPORT TOTAL"
 E  W !,"Total:"
 I SUMMARY W ?33,$J($G(TOTBILLS),5,0)
 W ?42,$J($FN(GRANBILL,",",2),10)
 W ?55,$J($FN(GRANTRAN,",",2),10)
 ;IHS/SD/AR 1.8*19
 S BAR("ST")=1
 Q
GETCOUNT ;
 N BILL,INSURER
 S SUBTOT=0
 ;S SUBS=$P(BAR("TXTO"),U,1,6)  ;bar*1.8*20 REQ10
 S SUBS=$P(BAR("TXTO"),U,1,7)  ;bar*1.8*20 REQ10
 ;S $P(SUBS,U,6)=BAR("SORT")  ;bar*1.8*20 REQ10
 S $P(SUBS,U,7)=BAR("SORT")  ;bar*1.8*20 REQ10
 S INSURER=""
 F  S INSURER=$O(^TMP($J,"BAR-TSRS-INS",SUBS,INSURER)) Q:INSURER=""  D
 .W !?5,$E($$GET1^DIQ(90050.02,INSURER_",",.01,"E"),1,25)
 .S BILL=""
 .F CNT=0:1 S BILL=$O(^TMP($J,"BAR-TSRS-INS",SUBS,INSURER,BILL)) Q:BILL=""
 .W ?33,$J(CNT,5,0)
 .S TOTBILLS=TOTBILLS+CNT
 .S SUBTOT=SUBTOT+CNT
 Q
 ;IHS/SD/AR RQMNT PATCH 18
SUBTYPE ;
 W !,BARDASH
 W !,?20,"Adjustment Type Tot:"
 W ?41,$J($FN(ADJTBTOT,",",2),10)
 W ?55,$J($FN(ADJTTTOT,",",2),10)
 W !
 S (ADJTBTOT,ADJTTTOT)=0
 Q