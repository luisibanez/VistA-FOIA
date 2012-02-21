IBCEOB00 ;ALB/ESG - 835 EDI EOB MSG PROCESSING CONT ;30-JUN-2003
 ;;2.0;INTEGRATED BILLING;**155**;21-MAR-94
 Q
 ;
RCRU(IBZDATA,IB0,IBLN) ; Revenue Code Roll-up procedure check -
 ; Total up outbound line items by revenue code and compare with
 ; incoming EOB 40 record to see if it has been rolled up
 ;
 ; IBZDATA - ub92 output formatter array, passed by reference
 ; IB0     - 40 record data
 ; IBLN    - output parameter, passed by reference
 ;
 NEW Z,LN,REV,UN,CH,RUD,RUD2,UCH,MRAUCH
 I $P(IB0,U,4)="" G RCRUX
 S IBLN="",Z=0
 F  S Z=$O(IBZDATA(Z)) Q:'Z  S LN=IBZDATA(Z) D
 . S REV=$P(LN,U,1),UN=$P(LN,U,4),CH=$P(LN,U,5),UCH=+$P(LN,U,3)
 . I REV="" Q
 . ;
 . S RUD=$G(RUD(REV))                 ; roll up data array for rev code
 . S $P(RUD,U,1)=$P(RUD,U,1)+CH       ; total charges
 . S $P(RUD,U,2)=$P(RUD,U,2)+UN       ; total units
 . S $P(RUD,U,3)=$P(RUD,U,3)+1        ; total line items
 . S RUD(REV)=RUD
 . S RUD(REV,Z)=""
 . ;
 . S RUD2=$G(RUD2(REV,UCH))           ; roll up data array for rev code
 . S $P(RUD2,U,1)=$P(RUD2,U,1)+CH     ; total charges
 . S $P(RUD2,U,2)=$P(RUD2,U,2)+UN     ; total units
 . S $P(RUD2,U,3)=$P(RUD2,U,3)+1      ; total line items
 . S RUD2(REV,UCH)=RUD2
 . S RUD2(REV,UCH,Z)=""
 . ;
 . Q
 ;
 I '$D(RUD),'$D(RUD2) G RCRUX
 ;
 ; delete the revenue code roll-up, if only 1 line item.
 S REV=""     ; this is not a roll up situation
 F  S REV=$O(RUD(REV)) Q:REV=""  I $P(RUD(REV),U,3)=1 KILL RUD(REV)
 ;
 S (REV,UCH)=""
 F  S REV=$O(RUD2(REV)) Q:REV=""  F  S UCH=$O(RUD2(REV,UCH)) Q:UCH=""  I $P(RUD2(REV,UCH),U,3)=1 KILL RUD2(REV,UCH)
 ;
 I '$D(RUD),'$D(RUD2) G RCRUX
 ;
 S RUD=$G(RUD($P(IB0,U,4)))      ; compare with 40 record data
 I RUD="" G RCRU2                ; make sure it exists
 I $P(RUD,U,1)'=+$$DOLLAR^IBCEOB($P(IB0,U,15)) G RCRU2    ; charges
 I $P(RUD,U,2)'=$P(IB0,U,16) G RCRU2                      ; units
 S IBLN=$O(RUD($P(IB0,U,4),""))  ; use the first line# found
 G RCRUX
 ;
RCRU2 ; check roll-up data by rev code and unit charge
 S MRAUCH=0
 I $P(IB0,U,16) S MRAUCH=+$$DOLLAR^IBCEOB($P(IB0,U,15))/$P(IB0,U,16)
 S RUD2=$G(RUD2($P(IB0,U,4),MRAUCH))     ; compare with 40 record data
 I RUD2="" G RCRUX                       ; make sure it exists
 I $P(RUD2,U,1)'=+$$DOLLAR^IBCEOB($P(IB0,U,15)) G RCRUX   ; charges
 I $P(RUD2,U,2)'=$P(IB0,U,16) G RCRUX                     ; units
 S IBLN=$O(RUD2($P(IB0,U,4),MRAUCH,""))  ; use the first line# found
 ;
RCRUX ;
 Q
 ;
ICN(IBEOB,ICN,COBN,IBOK) ; File the 835 ICN into the Bill
 ;
 ; Input parameters
 ;   IBEOB - ien to file 361.1
 ;   ICN   - the ICN# from the 835 transmission
 ;   COBN  - the insurance sequence#
 ;
 ; Output parameter
 ;   IBOK  - returns as 0 if we get a filing error here
 ;
 ; The field in file 399 depends on the current payer sequence
 ;     399,453 - primary ICN
 ;     399,454 - secondary ICN
 ;     399,455 - tertiary ICN
 ;
 NEW IBIFN,FIELD,D,D0,DA,DI,DIC,DIE,DQ,DR,X,Y
 S IBEOB=+$G(IBEOB),COBN=+$G(COBN)
 I 'IBEOB!'COBN G ICNX
 S IBIFN=+$P($G(^IBM(361.1,IBEOB,0)),U,1)
 I '$D(^DGCR(399,IBIFN)) G ICNX
 I $G(ICN)="" G ICNX
 I '$F(".1.2.3.","."_COBN_".") G ICNX
 ;
 S FIELD=452+COBN
 S DIE=399,DA=IBIFN,DR=FIELD_"////"_ICN D ^DIE
 S IBOK=($D(Y)=0)
 I 'IBOK S ^TMP(IBEGBL,$J,+$O(^TMP(IBEGBL,$J,""),-1)+1)="Error in filing the ICN into the Bill/Claims file"
ICNX ;
 Q
 ;
35(IB0,IBEGBL,IBEOB) ; Record '35'
 ;
 N A,IBOK
 ;
 S A="3;4.12;1;0;0^4;4.13;1;0;0^5;4.14;0;1;1^6;4.15;1;0;0^7;4.16;1;0;0^8;4.17;1;0;0^9;4.18;1;0;0^10;4.04;1;0;0^11;3.01;0;1;1^12;3.02;1;0;0^13;3.08;1;0;0^14;3.09;1;0;0"
 ;
 S IBOK=$$STORE^IBCEOB1(A,IB0,IBEOB)
 I 'IBOK S ^TMP(IBEGBL,$J,+$O(^TMP(IBEGBL,$J,""),-1)+1)="Bad MEDICARE Inpt Adjudication data"
Q35 Q $G(IBOK)
 ;
37(IB0,IBEGBL,IBEOB) ; Record '37'
 ;
 N IBOK,IBCT
 S IBCT=$G(^TMP($J,37))+1
 I IBCT>5 S ^TMP(IBEGBL,$J,+$O(^TMP(IBEGBL,$J,""),-1)+1)="Too many Medicare Claim Level Adjudication Remarks" G Q37    ; Max 5 allowed
 S A="4;"_$S($P(IB0,U,3)="O":"3.0"_(IBCT+2),1:"5.0"_IBCT)_";0;0;0^5;5.0"_IBCT_"1;0;0;0"
 S IBOK=$$STORE^IBCEOB1(A,IB0,IBEOB)
 I 'IBOK S ^TMP(IBEGBL,$J,+$O(^TMP(IBEGBL,$J,""),-1)+1)="Bad Medicare Claim Level Adjudication Remarks data"
 ;
 ; 4/22/03 - esg - If claim level remark code MA15 is reported, then
 ;         this is a split EOB and we need to change the REVIEW STATUS
 ;         of this EOB to be ACCEPTED-INTERIM EOB.
 ;
 I $P(IB0,U,4)["MA15" D
 . N DA,DIE,DR,DIC
 . S DA=IBEOB,DIE=361.1,DR=".16////2" D ^DIE S IBOK=($D(Y)=0)
 . I 'IBOK S ^TMP(IBEGBL,$J,+$O(^TMP(IBEGBL,$J,""),-1)+1)="Split EOB, but review status was not updated correctly"
 . Q
 ;
Q37 S ^TMP($J,37)=$G(^TMP($J,37))+1 ; Saves the # of entries for 37 records
 Q $G(IBOK)
 ;
 ;
DET40(IB0,ARRAY) ; Format important details of record 40 for error
 ; IB0 = data on 40 record (some pieces pre-formatted)
 ;  ARRAY(n)=formatted line is returned if passed by ref
 N Q
 S ARRAY(1)="Payer reported the following was billed to them:"
 S ARRAY(2)=" "_$S($P(IB0,U,21)="NU":"Rev Cd",1:"Proc")_": "_$S($P(IB0,U,10)'="":$P(IB0,U,10),1:"Same as adjudicated")_"  Chg: "_$J($P(IB0,U,15)/100,"",2)_"  Units: "_$S($P(IB0,U,16):$P(IB0,U,16),1:1)
 S ARRAY(3)="  Svc Date(s): "_$S($P(IB0,U,19)'="":$$FDT($P(IB0,U,19)),1:"??")_$S($P(IB0,U,20)'="":"-"_$$FDT($P(IB0,U,20)),1:"")
 I $P(IB0,U,11)'="" S ARRAY(3)=ARRAY(3)_"  Mods: " F Q=11:1:14 I $P(IB0,U,Q)'="" S ARRAY(3)=ARRAY(3)_$P(IB0,U,Q)_$S(Q=14:"",$P(IB0,U,Q+1)'="":",",1:"")
 S ARRAY(4)="Payer reported adjudication on:"
 S ARRAY(5)=" "_$S($P(IB0,U,21)="NU":"Rev Cd",1:"Proc")_": "_$S($P(IB0,U,3)'="":$P(IB0,U,3),1:$P(IB0,U,4))
 S ARRAY(5)=ARRAY(5)_"  Type: "_$P(IB0,U,21)_$S($P(IB0,U,21)'="NU":"  Rev Cd: "_$P(IB0,U,4),1:"")_"  Units: "_$S($P(IB0,U,18):$P(IB0,U,18)/100,1:1)_"  Amt: "_$J($P(IB0,U,17)/100,"",2)
 I $P(IB0,U,5)'="" S ARRAY(5)=ARRAY(5)_"  Mods: " F Q=5:1:8 I $P(IB0,U,Q)'="" S ARRAY(5)=ARRAY(5)_$P(IB0,U,Q)_$S(Q=8:"",$P(IB0,U,Q+1)'="":",",1:"")
 Q
 ;
DET4X(RECID,IB0,ARRAY) ; Format important details of record 41-45 for error
 ; RECID = 41,42,45
 ; IB0 = data on RECID record
 ;  ARRAY(n)=formatted line is returned if passed by ref
 N CT,Q
 I RECID=41 D  Q
 . S ARRAY(1)="Allowed Amt: "_$J($P(IB0,U,3)/100,"",2)_"  Per Diem Amt: "_$J($P(IB0,U,4)/100,"",2)
 ;
 I RECID=42 D  Q
 . S ARRAY(1)="Line Item Remark Code: "_$P(IB0,U,3)
 . I $P(IB0,U,4)'="" S CT=1 F Q=0:80:190 I $E($P(IB0,U,4),Q+1,Q+80)'="" S CT=CT+1,ARRAY(CT)=$E($P(IB0,U,4),Q+1,Q+80)
 ;
 I RECID=45 D
 . S ARRAY(1)="Adj Group Cd: "_$P(IB0,U,3)_"  Reason Cd: "_$P(IB0,U,4)_"  Amt: "_$J($P(IB0,U,5)/100,"",2)_"  Quantity: "_+$P(IB0,U,6)
 . I $P(IB0,U,7)'="" S CT=1 F Q=0:80:190 I $E($P(IB0,U,7),Q+1,Q+80)'="" S CT=CT+1,ARRAY(CT)=$E($P(IB0,U,7),Q+1,Q+80)
 Q
 ; 
FDT(X) ; Format date in X (YYYYMMDD) to MM/DD/YYYY
 S:X'="" X=$E(X,5,6)_"/"_$E(X,7,8)_"/"_$E(X,1,4)
 Q X
 ;
UPDNM(IBEOB,IB0,IBBULL,IBDR) ; Update name on claim if it comes back changed
 ; IBEOB = the internal entry # of the entry in file 361.1
 ; IB0 = the raw data returned from the 835 flat file
 ; IBBULL = holds result of name change check in piece 1 - if name
 ;          changed, first '^' piece is 1, 3rd '^' piece is the old
 ;          insured's name
 ; IBDR = returned as the updated 'DR' string with the name changed
 ;       fields to use to update the EOB file (361.1) - pass by reference
 ;
 N IBCHGED,IBIFN,IBNEW,IBCOB,DIE,DR,X,Y
 I $P(IB0,U,7) D
 . S IBNEW=$P(IB0,U,3)_","_$P(IB0,U,4)_$S($P(IB0,U,5)'="":" "_$P(IB0,U,5),1:""),$P(IBBULL,U)=1
 . S IBCOB=+$P($G(^IBM(361.1,IBEOB,0)),U,15)
 . S IBIFN=+$G(^IBM(361.1,+IBEOB,0))
 . S IB=$G(^DGCR(399,IBIFN,"I"_IBCOB))
 . ;
 . I IB'="",$P(IB,U,17)'=IBNEW D
 .. ; Update the claim data only
 .. S $P(IBBULL,U,3)=$P(IB,U,17) ; save old value
 .. S $P(IB,U,17)=IBNEW
 .. S DIE="^DGCR(399,",DA=IBIFN,DR="30"_IBCOB_"////"_IB
 .. D:DA ^DIE
 .. S IBCHGED=1
 . S IBDR=$G(IBDR)_"6.01////"_$P(IB0,U,3)_","_$P(IB0,U,4)_" "_$P(IB0,U,5)_";"
 ;
 Q $G(IBCHGED)
 ;
UPDID(IBEOB,IB0,IBBULL,IBDR) ; Update id # on claim and policy if it comes back
 ;   changed
 ; IBEOB = the internal entry # of the entry in file 361.1
 ; IB0 = the raw data returned from the 835 flat file
 ; IBBULL = holds result of id change check in piece 2 - if id changed,
 ;          second '^' piece = 1,4th '^' piece is the old insured's id
 ; IBDR = returned as the updated 'DR' string with the id changed fields
 ;        to use to update the EOB file (361.1) - pass by reference
 ;
 N IBCHGED,IBNEW,IBCOB,IB,DIE,DR,DA,X,Y
 I $P(IB0,U,8) D
 . S IBNEW=$P(IB0,U,6),$P(IBBULL,U,2)=1
 . S IBIFN=+$G(^IBM(361.1,+IBEOB,0))
 . S IBCOB=+$P($G(^IBM(361.1,IBEOB,0)),U,15)
 . S IB=$G(^DGCR(399,IBIFN,"I"_IBCOB))
 . ;
 . I IB'="",$P(IB,U,2)'=IBNEW D
 .. ; Update the claim
 .. S $P(IBBULL,U,4)=$P(IB,U,2) ; save old value
 .. S $P(IB,U,2)=IBNEW
 .. S DIE="^DGCR(399,",DA=IBIFN,DR="30"_IBCOB_"////"_IB D ^DIE
 .. ;
 .. ; Update the policy
 .. S DA(1)=$P($G(^DGCR(399,IBIFN,0)),U,2),DA=$P($G(^("M")),U,(11+IBCOB)),DR="1////"_IBNEW,DIE="^DPT("_DA(1)_",.312,"
 .. I DA(1),DA D ^DIE
 .. S IBCHGED=1
 . S IBDR=$G(IBDR)_"6.02////"_$P(IB0,U,6)_";"
 ;
 Q $G(IBCHGED)
 ;
