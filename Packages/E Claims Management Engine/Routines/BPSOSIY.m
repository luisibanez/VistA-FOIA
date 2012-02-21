BPSOSIY ;BHAM ISC/FCS/DRS/DLF - Filing with .51,.59 ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 Q
IEN59() ;EP - given INPUT(), what should we use for an IEN in file 9002313.59?
 N RXI,RET
 S RXI=$P(INPUT(1),U)
 I RXI D
 . S RXR=$P(INPUT(1),U,2)
 . I RXR>9000 D
 . . D IMPOSS^BPSOSUE("DB","TI","Refill number near overflow point","RXI="_RXI,"IEN59",$T(+0))
 . ; you can raise the limit and be thinking of how to get around it
 . S RET=RXI_"."_$TR($J(RXR,4)," ","0")
 . S RET=RET_$S($P(INPUT(0),U,3)?1"POSTAGE".E:2,1:1)
 E  D
 . N VIS,CPT S VIS=$P(INPUT(1),U,6),CPT=$P(INPUT(1),U,8)
 . I 'VIS D  ; visit IEN, must not be zero
 . . D IMPOSS^BPSOSUE("P","TI","Visit IEN missing; should have been detected by now",,"IEN59",$T(+0))
 . . S VIS="MISSING"
 . I 'CPT D  ; CPT IEN, must not be zero
 . . D IMPOSS^BPSOSUE("P","TI","CPT IEN missing; should have been detected by now",,"IEN59",$T(+0))
 . . S CPT="MISSING"
 . S RET=VIS_"."_$TR($J(CPT,6)," ","0")_3
 Q RET
SETUP59(IEN51,IEN59,ORIGIN) ;EP - from BPSOSIZ
 ; You don't have to set null fields, so long as you have called
 ; CLEAR, or if this is a NEW entry.
 ; INPUT is defined in FILE1^BPSOSIZ
 N FLAGS,FDA,MSG,FN,REC,X,I,VARX,TYPE
 S VARX=0
 I '$P($G(^BPS(9002313.99,1,"SITE TYPE")),"^",1) S VARX=1
 S FN=9002313.59,REC=IEN59_","
 ; TYPE = 1 for prescription, = 2 for mailing prescription,
 ;      = 3 for non-prescription items
 S TYPE=$E(IEN59,$L(IEN59))
 S FDA(FN,REC,.13)=TYPE
 S FDA(FN,REC,.14)=ORIGIN
 S FDA(FN,REC,1)=0 ; STATUS - waiting to start
 ; Field 1.06 - copied from field 701, below
 S FDA(FN,REC,1.08)=1 ; PINS piece
 I TYPE=1!(TYPE=2) S FDA(FN,REC,1.11)=$P(INPUT(1),U) ; RXI
 I $P($G(^BPST(IEN59,1)),U,12)=1 S FDA(FN,REC,1.12)=2  ; Resubmit after reversal
 S X=$G(^BPS(9002313.51,IEN51,3))
 S FDA(FN,REC,1201)=$P(X,"^",1)                             ; RX Action
 S FDA(FN,REC,1202)=$P(X,"^",2)                             ; Date of Service
 S FDA(FN,REC,13)=$P($G(^BPS(9002313.51,IEN51,0)),"^",2)    ; User
 ;
 ;IHS/SD/lwj 8/30/02 NCPDP 5.1 changes
 ; the prior authorization code is now two fields - type and number
 ; begin changes to capture both values
 ;
 I $D(INPUT(2)),$P(INPUT(2),U,2)]"" D
 . S FDA(FN,REC,1.09)=$P(INPUT(2),U)    ; prior authorization number 
 . S FDA(FN,REC,1.15)=$P(INPUT(2),U,2)  ; prior auth type code 
 ;
 ;IHS/SD/lwj 8/30/02 end NCPDP 5.1 prior authorization changes
 ;
 S FDA(FN,REC,5)=$P(INPUT(1),U,4) ; Patient
 S FDA(FN,REC,7)=$$NOW ; LAST UPDATE
 S FDA(FN,REC,9)=$P(INPUT(1),U,2) ; RXR - refill index
 I TYPE=1 S FDA(FN,REC,10)=$P(INPUT(0),U,3) ; NDC
 I TYPE=1&(VARX) S FDA(FN,REC,10)=$P($G(INPUT(9)),"^",8)  ;LJE
 I TYPE=1!(TYPE=2) S FDA(FN,REC,12)=$P(INPUT(1),U,6) ; Visit
 S FDA(FN,REC,15)=FDA(FN,REC,7) ; START TIME
 F I=1:1:6 S X=$P($G(INPUT(5)),U,I) I X]"" S FDA(FN,REC,500+I)=X
 I $G(INPUT(6))]""!($G(INPUT(7))]"") D
 . F I=1:1:3 D
 . . I $P(INPUT(6),U,I)]"" S FDA(FN,REC,600+I)=$P($G(INPUT(6)),U,I)
 . . I $P(INPUT(7),U,I)]"" S FDA(FN,REC,700+I)=$P($G(INPUT(7)),U,I)
 I $D(FDA(FN,REC,701)) D
 . S FDA(FN,REC,1.06)=FDA(FN,REC,701) ; INSURER
 ; 500's, 600's, 700's done above
 ; 
 ;LJE;6/26/03; Set initial insurance to work with
 I $D(INPUT(8)) D
 . S FDA(FN,REC,901)=1  ;first insurance ien
 . S FDA(FN,REC,504)=$P($G(INPUT(9)),"^",1)  ;DISPENSE FEE
 . S FDA(FN,REC,505)=$P($G(INPUT(9)),"^",3)  ;GROSS AMOUNT DUE/USUAL & CUSTOMARY
 . S FDA(FN,REC,507)=$P($G(INPUT(9)),"^",5)  ;ADMINISTRATIVE FEE
 . S FDA(FN,REC,501)=$P($G(INPUT(9)),"^",6)  ;Drug QUANTITY
 . S FDA(FN,REC,502)=$P($G(INPUT(9)),"^",7)  ;INGREDIENT COST
 . S FDA(FN,REC,10)=$P($G(INPUT(9)),"^",8)   ;NDC - last NDC billed for this drug
 I FDA(FN,REC,10)'["-" S FDA(FN,REC,10)=$E(FDA(FN,REC,10),1,5)_"-"_$E(FDA(FN,REC,10),6,9)_"-"_$E(FDA(FN,REC,10),10,11)
 ;
 D FILE^DIE("","FDA","MSG") ; NO "E" FLAG - DATA IS IN INTERNAL FORMAT!
 ;
 ;LJE;6/24/03;Added VA sets to .59 file; continuing sets throughout process in order to
 ;                       ; not lose any data should an error occur.
 ;
 S VA59IEN="+1,"
 S ISTHERE="",ISTHERE=$$GET1^DIQ(9002313.59902,"1,"_REC_",",".01","","","MSG")
 I ISTHERE'=""&('$D(MSG)) S VA59IEN="1,"
 K MSG
 S FN=9002313.59902
 ; Note: The INPUT array is from 8 and 9 node of 9002313.51 and the FDA array is for the 10 node of 9002313.59
 ; Create/edit the multiple  The Plan ID is in internal format.
 I $D(INPUT(8)) D
 . S FDA(FN,VA59IEN_REC,.01)=$P($G(INPUT(8)),"^",1)               ;PLAN ID
 . I VA59IEN'["+" D FILE^DIE("","FDA","MSG")
 . I VA59IEN["+"  D UPDATE^DIE("","FDA","VAIEN","MSG")
 . ; 
 . ; Include the rest of the fields, which are in external format
 . S VA59IEN="1,"
 . S FDA(FN,VA59IEN_REC,902.03)=$P($G(INPUT(8)),"^",2)            ;BIN
 . S FDA(FN,VA59IEN_REC,902.04)=$P($G(INPUT(8)),"^",3)            ;PCN
 . S FDA(FN,VA59IEN_REC,902.02)=$P($G(INPUT(8)),"^",4)            ;PAYER SHEET IEN 
 . S FDA(FN,VA59IEN_REC,902.05)=$P($G(INPUT(8)),"^",5)            ;GROUP ID
 . S FDA(FN,VA59IEN_REC,902.06)=$P($G(INPUT(8)),"^",6)            ;CARDHOLDER ID
 . S FDA(FN,VA59IEN_REC,902.07)=$P($G(INPUT(8)),"^",7)            ;PATIENT RELATIONSHIP CODE
 . S FDA(FN,VA59IEN_REC,902.08)=$P($P($G(INPUT(8)),"^",8)," ")    ;CARDHOLDER FIRST NAME
 . S FDA(FN,VA59IEN_REC,902.09)=$P($G(INPUT(8)),"^",9)            ;CARDHOLDER LAST NAME
 . S FDA(FN,VA59IEN_REC,902.11)=$P($G(INPUT(8)),"^",10)           ;HOME PLAN STATE
 . S FDA(FN,VA59IEN_REC,902.18)=$P($G(INPUT(8)),"^",13)           ;Software/Vendor Cert ID
 . S FDA(FN,VA59IEN_REC,902.19)=$P($G(INPUT(8)),"^",11)           ;B2 PAYER SHEET REVERSAL
 . S FDA(FN,VA59IEN_REC,902.21)=$P($G(INPUT(8)),"^",12)           ;B3 PAYER SHEET REBILL
 . S FDA(FN,VA59IEN_REC,902.22)=$P($G(INPUT(8)),"^",16)           ;CERTIFY MODE
 . S FDA(FN,VA59IEN_REC,902.23)=$P($G(INPUT(8)),"^",15)           ;CERTIFICATION IEN TO USE FROM 9002313.31
 . S FDA(FN,VA59IEN_REC,902.24)=$P($G(INPUT(8)),"^",14)           ;PLAN NAME
 . S FDA(FN,VA59IEN_REC,902.12)=$P($G(INPUT(9)),"^",1)            ;DISPENSE FEE
 . S FDA(FN,VA59IEN_REC,902.13)=$P($G(INPUT(9)),"^",2)            ;BASIS OF COST DETERMINATION
 . S FDA(FN,VA59IEN_REC,902.14)=$P($G(INPUT(9)),"^",3)            ;USUAL & CUSTOMARY CHARGE
 . S FDA(FN,VA59IEN_REC,902.15)=$P($G(INPUT(9)),"^",4)            ;GROSS AMOUNT DUE
 . S FDA(FN,VA59IEN_REC,902.16)=$P($G(INPUT(9)),"^",5)            ;ADMINISTRATIVE FEE
 . S FDA(FN,VA59IEN_REC,902.17)=$P($G(INPUT(9)),"^",9)            ;FILL NUMBER
 . S FDA(FN,VA59IEN_REC,902.25)=$P($G(INPUT(10)),"^",1)           ;GROUP NAME
 . S FDA(FN,VA59IEN_REC,902.26)=$P($G(INPUT(10)),"^",2)           ;INSURANCE CO PHONE #
 . S FDA(FN,VA59IEN_REC,902.27)=$P($G(INPUT(10)),"^",3)           ;PHARMACY PLAN IEN
 . ; File the data
 . D FILE^DIE("E","FDA","MSG")
 ;
 ; Store DUR multiple if it exists
 I +$P($G(^BPS(9002313.51,IEN51,4,0)),U,4) D
 . K FDA
 . N DUR,DURREC,IENS
 . S FN=9002313.5913,DUR=0
 . F  S DUR=$O(^BPS(9002313.51,IEN51,4,DUR)) Q:+DUR=0  D
 .. S DURREC=$G(^BPS(9002313.51,IEN51,4,DUR,0))
 .. S IENS="+1,"_REC,IENS(1)=DUR
 .. S FDA(FN,IENS,.01)=$P(DURREC,U,1)  ; DUR Counter
 .. S FDA(FN,IENS,1)=$P(DURREC,U,2)    ; DUR Professional Service Code
 .. S FDA(FN,IENS,2)=$P(DURREC,U,3)    ; DUR Reason for Service Code
 .. S FDA(FN,IENS,3)=$P(DURREC,U,4)    ; DUR Result of Service Code
 . I $D(FDA) D UPDATE^DIE("","FDA","IENS","MSG")
 ;
 S FN=9002313.59 ; SET IT BACK TO ORIGINAL, JUST IN CASE
 K ISTHERE,VA59IEN
 Q $S($D(MSG):0,1:1)
ACTIVEWT(IEN59,IEN51,IEN512) ;EP - from BPSOSIZ
 ; Return 0 = forget about it, don't wait, just skip this one
 ;        1 = yes, wait and check again in several seconds from now
 ;        
 N PROMPT,Y
 ; An opportunity to wait for the active prescription to finish
 ; processing.  Return 1 if you do want to wait; 0 if you do not. 
 I '$G(ECHO) Q 1  ; not interactive, you can't ask - assume YES, wait
 W ?5,"There is currently an active transaction for this item"
 W ".",!
 W ?5,"So this item will be skipped.",! H 1 ; 03/22/2001
 Q 0 ; 03/22/2001
ACWTA S PROMPT="Do you want to wait for the active transaction to finish"
 S Y=$$YESNO^BPSOSU3(PROMPT,"YES",1) W !
 I Y=1 Q 1
 S PROMPT="Do you want to forget about this one"
 S Y=$$YESNO^BPSOSU3(PROMPT,"NO",1) W !
 I Y=1 Q 0
 G ACWTA
RXPREV(IEN,ENTRY)  ; has this item previously been through ECME?
 ; return false if not
 ; return pointer to 9002313.57 if true
 N RXI,RXR,VIS,CPT,INDEX,A,B
 S RXI=$$RXI(IEN,ENTRY)
 I RXI D
 . S RXR=$$RXR(IEN,ENTRY)
 . S INDEX=$S($$NDC(IEN,ENTRY)?1"POSTAGE".E:"POSTAGE",1:"RXIRXR")
 . S A=RXI,B=RXR
 E  D
 . S VIS=$$VIS(IEN,ENTRY)
 . S CPT=$$CPTIEN(IEN,ENTRY)
 . S A=VIS,B=CPT,INDEX="OTHERS"
 Q $O(^BPSTL("NON-FILEMAN",INDEX,A,B,""),-1)
RXPAID(IEN,ENTRY)  ;EP - from BPSOSIZ 
 ; return true if the prescription and fill has a "paid"
 ; status as far as ECME is concerned
 ; A paper claim counts as a ECME "paid" for this purpose
 ; Return 1 = POS, paid
 ; Return 2 = paper
 N N57 S N57=$$RXPREV(IEN,ENTRY)
 I 'N57 Q ""  ; no ECME record of this
 ; If it's a reversal, then our result depends on the reversal:
 ;    Was the reversal accepted?   If so, then No, not paid.
 ;    Was the reversal rejected?   Assume Paid, since we try to
 ;         allow reversals only in the case of a paid original.
 I $$ISREVERS^BPSOS57(N57) Q $S($$REVACC^BPSOS57(N57):0,1:1)
 ; Not a reversal:
 N X S X=$$CATEG^BPSOSUC(N57)
 Q $S(X="E PAYABLE":1,X="PAPER":2,X="E DUPLICATE":3,1:0)
RXI(IEN,ENTRY)     Q $P(^BPS(9002313.51,IEN,2,ENTRY,1),U)
RXR(IEN,ENTRY)     Q $P(^BPS(9002313.51,IEN,2,ENTRY,1),U,2)
VIS(IEN,ENTRY)     Q $P(^BPS(9002313.51,IEN,2,ENTRY,1),U,6)
NDC(IEN,ENTRY)     Q $P(^BPS(9002313.51,IEN,2,ENTRY,0),U,3)
CPTIEN(IEN,ENTRY)  Q $P(^BPS(9002313.51,IEN,2,ENTRY,1),U,8)
WANTREV()         ;EP - from BPSOSIZ 
 Q 0 ; TO BE IMPLEMENTED
NOW() N %,%H,%I,X D NOW^%DTC Q %
