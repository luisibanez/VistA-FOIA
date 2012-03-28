ACHSAJ1 ; IHS/ITSC/PMF - ADJUST A PAID DOCUMENT ;    [ 10/15/2004  3:01 PM ]
 ;;3.1;CONTRACT HEALTH MGMT SYSTEM;**6**;JUNE 11, 2001
 ;ACHS*3.1*6 3.27.03 IHS/SET/FCJ WRONG VARIABLE SET IN "T" AND "ZA" NODE
 ;
 ;
D1 ;EP
 ;SET THE TRANSACTION 0 NODE
 ;ACHS*3.1*6 3.27.03 IHS/SET/FCJ CHANGED ACHS3PA TO ACHS3TAJ
 ;S T=DT_"^ZA^"_$G(DFN)_U_ACHSESDO_"^^^^"_ACHS3PA_"^^"_ACHSSVDT_U_DUZ_U_ACHS3RDS_U_ACHSPDAT_U_ACHSPSQN_U_ACHSPIND  ;ACHS*3.1*6
 S T=DT_"^ZA^"_$G(DFN)_U_ACHSESDO_"^^^^"_ACHS3TAJ_"^^"_ACHSSVDT_U_DUZ_U_ACHS3RDS_U_ACHSPDAT_U_ACHSPSQN_U_ACHSPIND  ;ACHS*3.1*6
 ;
 ;IF 'DOCUMENT DESTINATION' NOT EQUAL TO IHS
 I $P(^ACHSF(DUZ(2),"D",ACHSDIEN,0),U,17)'="I" D
 .S T=T_U_U_ACHSCTL_U_ACHSCHK_U_ACHSREM_U_ACHSSV_U_ACHSOB
 ;
 S ACHSDOC0=$G(ACHSDOC0)
 I ACHSDOC0="" S ACHSDOC0=ACHSDOCR
 ;
 ;S X=$G(^ACHSF(DUZ(2),"D",ACHSDIEN,0))                ;DOCUMENT 0 NODE
 S ACHSDCR=$P(ACHSDOC0,U,19) ;DCR ACCOUNT #  ;ACHSDOC0 FROM INIT^ACHSRP2
 ;
 I ACHSDCR<1 W:'$D(ACHSISAO) !,"DCR ACCOUNT ERROR " G:'$D(ACHSISAO) ENDC I $D(ACHSISAO) S ACHSERRE=26,ACHSEDAT=ACHSDCR,ACHSERRA=1 D K Q
 ;
 ;IF AREA OFFICE AND 'INTEREST PAID'  OR  'INTEREST ADDTNL PENALTY PAID'
 I $D(ACHSISAO),$G(ACHSEOBR("I",12))!$G(ACHSEOBR("I",13)) D
 . N C,D,O
 . ; Find the DCReg for the Interest payment
 . S ACHSDCR=7                            ;MISC CHARGES CATEGORY
 .;
 .S C=""
 .I $G(ACHSEOBR("I",8))'="" D
 .. S C=$O(^ACHS(2,"B",ACHSEOBR("I",8),0)) ;USE 'INTEREST CAN'
 .                                         ;IN "B" NAME X-REF TO GET
 .                                         ;TO GET THE COST CENTER PTR
 . Q:'C
 .;
 . S C=$P($G(^ACHS(2,C,0)),U,2)            ;'COST CENTER' 
 . Q:'C
 . S C=$P($G(^ACHS(1,C,0)),U)              ;COST CENTER 'CODE'
 . Q:'C
 .S O=""
 .I $G(ACHSEOBR("I",9))'="" D
 .. S O=$O(^ACHS(3,DUZ(2),1,"B",ACHSEOBR("I",9),0)) ;USE 'INTEREST OBJECT
 .;
 .                                                 ;CLASS CODE IN "B"
 .                                                 ;X-REF TO GET 'OBJECT
 .                                                 ;CLASSIFICATION' PTR
 . Q:'O                                            ;TO
 . S C=$O(^ACHS(3,DUZ(2),1,O,"CC","B",C,0))        ;GET 
 . Q:'C                                            ;THE
 . S D=$P($G(^ACHS(3,DUZ(2),1,O,"CC",C,0)),U,2)    ;DCR ACCOUNT #
 . I D>0,D<8 S ACHSDCR=D                           ;IF DCR IS 1-7
 .                                                 ;USE IT ELSE DCR=7
 .Q
 ;
 K ACHSCNC                           ;CLEAR ERROR FLAG
 D AJ1
 ;
 I '$D(ACHSISAO) D ENTER^ACHSPAM     ;ENTER/EDIT MEDICAL DATA
 I $D(ACHSISAO) D K Q                ;KILL OFF VARIABLES AND QUIT
 ;
END ;EP
 I '$D(ACHSCNC) D
 .W !!," ***  Document Updated  ***"
 .D ACT^ACHSACT(ACHSDIEN,$$NOW^XLFDT,"<ADJUSTMENT>") ;SET ACTION TAKEN
 ;
 ;
ENDC ;EP
 W !
 D RTRN^ACHS                     ;PRESS RETURN TO CONT.
K ;EP - Unlock, kill vars, quit.
 I $D(ACHSDIEN),'$$LOCK^ACHS("^ACHSF(DUZ(2),""D"",ACHSDIEN)","-")
 K ACHSADJ,ACHSAPA,ACHSJERR,ACHSNADJ,ACHSSIGN,ACHSTADJ,DA,X2,X3
 K ACHSSV,ACHSCTL,ACHSCHK,ACHSREM,ACHSOB,ACHS3RDP,ACHS3AJ,ACHS3PA,ACHS3TAJ
 Q
 ;
AJ1 ;
 ;S X=$G(^ACHSF(DUZ(2),"D",ACHSDIEN,0))   ;DOCUMENT 0 NODE
 S ACHSX=$P(ACHSDOC0,U,14)            ;FISCAL YEAR LAST DIGIT
 ;
 D FYCVT^ACHSFU                      ;COMPUTE FISCAL YEAR
 ;
 S R=$P(ACHSDOC0,U,19)                      ;DCR ACCOUNT NUMBER
 S (ACHSACFY,F)=ACHSY
 S ACHSACWK=+ACHSFYWK(DUZ(2),ACHSACFY)
 S A=ACHSAMT                          ;WHERE IS ACHSAMT SET?????
                                      ;COULD BE 'IHS PAYMENT AMOUNT'
                                      ;OR 'THIRD PARTY PAY AMT' OR
                                      ;'PAYMENT OBLIG ADJUST'
 I '$$LOCK^ACHS("^ACHS(9,DUZ(2),""FY"",ACHSACFY)","+") D  Q
 . W !,"LOCK FAILED AT AJ1+4^ACHSAJ1"
 . S ACHSCNC=""                       ;SET CANCEL FLAG
 ;
 S X=$G(^ACHS(9,DUZ(2),"FY",ACHSACFY,0))  ;FISCAL YEAR 0 NODE
 S X1=$P(X,U,2)                       ;'CURRENT ADVICE OF ALLOWANCE'
 S X2=$P(X,U,3)                       ;'TOTAL OBLIGATED FYTD'
 I $D(ACHSISAO) G SBF5                ;IF AREA OFFICE
 ;
 ;IF 'NEG. UNOBLIGATED BAL. PRIOR FY' AND THIS FY < CURRENT FY?????
 I $$PARM^ACHS(2,2)="Y",ACHSACFY<ACHSCFY G SBF5
 ;
 ;
 I X2+A>X1 D  Q
 . W *7,!,"Funds are not available for this adjustment",!,"Transanction Cancelled"
 . W:ACHSACFY<ACHSCFY !!,"'",$P($G(^DD(9002080,14.02,0)),U),"' parameter = '",$$PARM^ACHS(2,2),"'.",!!
 . S ACHSCNC=""
 . I '$$LOCK^ACHS("^ACHS(9,DUZ(2),""FY"",ACHSACFY)","-")
 ;
SBF5 ;EP from ACHSAJ for auto updates
 S ACHS("CHK")=0,ACHSUFLG=""
 ;
 D SBAENT^ACHSUUP           ;Update Current Advice of Allowance
                            ;and Total Obligated FYTD
 ;
 K ACHSUFLG
 ;
 ;AGAIN HE BYPASSES FILEMAN AND SETS THE TRANSACTION INTO THE FILE
 ;MANUALLY??????
 ;SET ZERO NODE IF NOT THERE
 S:'$D(^ACHSF(DUZ(2),"D",ACHSDIEN,"T",0)) ^ACHSF(DUZ(2),"D",ACHSDIEN,"T",0)=$$ZEROTH^ACHS(9002080,100,100)
 ;
 S Y=$G(^ACHSF(DUZ(2),"D",ACHSDIEN,"T",0))   ;GET TRANSACTION ZERO NODE
 S DA(1)=$P(Y,U,3)
 ;
 F  S DA(1)=DA(1)+1 Q:'$D(^ACHSF(DUZ(2),"D",ACHSDIEN,"T",DA(1)))
 ;
 S $P(Y,U,3)=DA(1)
 S $P(Y,U,4)=DA(1)
 S ^ACHSF(DUZ(2),"D",ACHSDIEN,"T",0)=Y
 S ^ACHSF(DUZ(2),"D",ACHSDIEN,"T",DA(1),0)=T
 S ^ACHSF(DUZ(2),"TB",DT,"ZA",ACHSDIEN,DA(1))=""
 S $P(^ACHSF(DUZ(2),"D",ACHSDIEN,"ZA"),U)=ACHSAPA+ACHSAMT
 S $P(^ACHSF(DUZ(2),"D",ACHSDIEN,"ZA"),U,2)=ACHSTADJ+ACHSAMT
 S $P(^ACHSF(DUZ(2),"D",ACHSDIEN,"ZA"),U,3)=ACHSNADJ+1
 ;ACHS*3.1*6 3.27.03 IHS/SET/FCJ CHANGED ACHS3TAJ TO ACHS3AJ NXT LINE
 ;S $P(^ACHSF(DUZ(2),"D",ACHSDIEN,"ZA"),U,4)=ACHS3TAJ  ;ACHS*3.1*6
 S $P(^ACHSF(DUZ(2),"D",ACHSDIEN,"ZA"),U,4)=ACHS3AJ ;ACHS*3.1*6
 S ^ACHSF(DUZ(2),"D",ACHSDIEN,"EB1",ACHSPDAT,ACHSPSQN,DA(1))=""
 S ^ACHSF(DUZ(2),"PDOS",ACHSSVDT,ACHSDIEN,DA(1))=""
 ;
 ;IF THIS IS AREA OFFICE
 S:$D(ACHSISAO) ^ACHSF(DUZ(2),"EOBD",9999999-ACHSEOBD,ACHSDIEN,DA(1))=""
 ;
 S ^ACHSF(DUZ(2),"EOBR",ACHSDIEN,DA(1),9999999-ACHSEOBD)=""
 S:$G(DFN) ^ACHSF(DUZ(2),"EOBP",DFN,ACHSDIEN,DA(1),9999999-ACHSEOBD)=""
 S (ACHSTDA,ACHSTIEN)=DA(1)
 I '$$LOCK^ACHS("^ACHS(9,DUZ(2),""FY"",ACHSACFY)","-")
 ;
 I '$D(^AUTTVNDR(ACHSPROV)) W:'$D(ACHSISAO) *7,!!,"Vendor Amount Paid Not Updated" Q
 ;
 ;ERROR 36 = VENDOR MISMATCH;W
 I $G(ACHSISAO)=0,$D(^ACHSEOBR("ER",ACHSZFPT,ACHSCTR(1),36)) Q
 S ACHSDAP=ACHSAMT
 ;
 D ^ACHSVPT     ;UPDATE VENDOR PAYMENTS FILE
 Q
 ;
