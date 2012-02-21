BPSECA8 ;BHAM ISC/FCS/DRS/VA/DLF - construct a claim reversal ;05/17/04
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 Q
 ; The way we build the claim reversal is to take the source data
 ; from the original claim (IEN) and position therein (RX).
 ; $$ returns pointer to 9002313.02 of the new entry.
 ;
 ; Future:  want to use new database server calls to create the
 ; 9002313.02 entry.  It would be soooo much cleaner.
 ;
 ; Remember, you have two 401 fields - one in header, one in prescript.
 ;
 ;IHS/SD/lwj 08/15/02 NCPDP 5.1 changes
 ; There are new fields to consider in the 5.1 reversal process, in
 ; addition to a new value for the transaction code (noe B2 as opposed
 ; to 11 in 3.2).
 ; Changes made as needed.
 ;
 ;IHS/SD/lwj 10/23/02 NCPDP 5.1 changes
 ; New code added to account for a mixed reversal.  A mixed reversal is
 ; a claim that was created in 3.x format & needs to be reversed in 5.1
 ; format.  This requires field reformatting.
 ;
REVERSE(IEN,RX) ;EP - from BPSOS6D, BPSOSC2
 ; IEN=original claim, RX = prescription # subscript therein
 ; returns IEN of the reversal claim created
 ;
 ; extract needed data
 N VARX S VARX=0
 I '$P($G(^BPS(9002313.99,1,"SITE TYPE")),"^",1) S VARX=1  ;VA;08/02/03
 N CLAIM,RXMULT S CLAIM=9002313.02,RXMULT=9002313.0201 ; file #s
 N DIC,DR,DA,DIQ,TMP,I,X
 ; This field list is repeated below.
 S DIC=CLAIM
 ;
 ;IHS/SD/lwj 8/15/02 NCPDP 5.1 new fields need to be used
 S DR="**"
 S DA=IEN
 S DIQ="TMP",DIQ(0)="I"
 D GETS^DIQ(CLAIM,IEN,DR,DIQ(0),DIQ)
 S IEN=IEN_","   ;tack on the comma
 ;
 ;IHS/SD/lwj 10/23/02 NCPDP 5.1 changes
 ; check for a mixed claim (3.x claim - 5.1 reversal)-reformat if needed
 ;
 D:$G(TMP(CLAIM,IEN,102,"I"))[3!($G(VARX)) CKVERS  ;VA;8/2/03
 ;
 ;IHS/SD/lwj 10/23/02 end mixed claim check
 ;
 ; Create a new 9002313.02 record
 ; 7/29/2005-Use function to get unique ID.  Note that we are passing the IEN for the billing
 ;   payer sheet, but it should not matter as the BIN will be the same for the billing and
 ;   reversal
 N DIC,X,DLAYGO,REVIEN,Y,UERETVAL
R2 S DIC=9002313.02,DIC(0)="LX"
 S X=$$CLAIMID^BPSECX1($G(TMP(CLAIM,IEN,.02,"I")),"P"),DLAYGO=CLAIM
 D ^DIC S REVIEN=+Y I REVIEN<1 D  G:UERETVAL R2
 . S UERETVAL=$$IMPOSS^BPSOSUE("FM,P",,"call to ^DIC",,,$T(+0))
R4 ; create a new prescription multiple therein
 S DIC="^BPSC("_REVIEN_",400,",DIC(0)="LX"
 S DIC("P")=$P(^DD(CLAIM,400,0),U,2)
 S DA(1)=REVIEN,DLAYGO=RXMULT
 S X=1 D ^DIC I +Y'=1 D  G:UERETVAL R4
 . S UERETVAL=$$IMPOSS^BPSOSUE("FM,P",,"call to ^DIC","for multiple",,$T(+0))
 ; set data values
 N DIE
 S DIE=CLAIM,DA=REVIEN
 S TMP(CLAIM,IEN,103,"I")=11 ; change transaction code to REVERSAL
 ;
 ;IHS/SD/lwj 8/15/02 NCPDP 5.1 changes
 ; if the version is 5.1, the transaction code needs to be B2 not 11
 ; following line added
 S:$G(TMP(CLAIM,IEN,102,"I"))[5 TMP(CLAIM,IEN,103,"I")="B2"
 ; Must agree with field list above.
 ;IHS/SD/lwj 8/15/02 NCPDP 5.1 new fields need to be used
 S DR="" N I
 F I=.02,.03,1.01,1.02,1.03,101,102,103,104,109,110,201,202,302,304,305,310,311,331,332,401 D
 .S DR=DR_I_"////"_$G(TMP(CLAIM,IEN,I,"I"))_";"
 ; Transmit flag - it's 2 for POS and Created On fields
 S DR=DR_".04////2;.06////"_$$NOWFM^BPSOSU1()
 D ^DIE
 S DIE="^BPSC("_REVIEN_",400,"
 S DA(1)=REVIEN,DA=1,DR=""
 ; Must agree with field list above
 ;IHS/SD/lwj 8/15/02 NCPDP 5.1 new fields need to be used
 F I=.05,308,401,402,403,407,418,420,436,438,439,440,441,455 D
 .S DR=DR_I_"////"_$G(TMP(RXMULT,RX_","_IEN,I,"I"))_";"
 S DR=$E(DR,1,$L(DR)-1) ; get rid of extra trailing ";"
 D ^DIE
 ;
 Q REVIEN
 ;
CKVERS ;check the version of the current format - if it's 5.1 then we've hit a
 ; "mixed claim."  (Originally created in 3.2 - reverse in 5.1)
 ;
 N BPSINS,BPSFORM,BPSVER,BPSCFRM
 S (BPSINS,BPSFORM,BPSVER,BPSCFRM)=""
 ;
 S BPSINS=$G(TMP(9002313.02,IEN,.02,"I"))
 Q:BPSINS=""
 ;
 I '$G(VARX) S BPSCFRM=$P($G(^BPSEI(BPSINS,100)),U)  ;claim format
 E  S BPSCFRM=$G(TMP(CLAIM,IEN,.02,"I"))  ;VA;8/2/03
 Q:BPSCFRM=""
 ;
 I '$G(VARX) S BPSFORM=$P($G(^BPSF(9002313.92,BPSCFRM,"REVERSAL")),U)
 S BPSFORM=$$GET1^DIQ(9002313.59902,"1,"_IEN59_",","902.19","I")  ;VA;10/22/04
 Q:BPSFORM=""
 ;
 S BPSVER=$P($G(^BPSF(9002313.92,BPSFORM,1)),U,2)
 I BPSVER[5 D
 . S TMP(9002313.02,IEN,102,"I")=51
 . D REFORM^BPSOSHR(BPSFORM)
 ;
 Q
