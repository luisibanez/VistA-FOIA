BPSOSCE ;BHAM ISC/FCS/DRS/DLF - New entry in 9002313.02 ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 ;----------------------------------------------------------------------
 ;----------------------------------------------------------------------
 ;Creates an Electronic Claim Submission record
 ;
 ;Parameters:  START     - START Medication Number
 ;             END       - END Medication Number
 ;             TOTAL     - TOTAL Medications in Claim
 ;   the BPS(*) array pointed to by START, END
 ;
 ;----------------------------------------------------------------------
 ; NEWCLAIM^BPSOSCE called from BPSOSCA from BPSOSQG from BPSOSQ2
 ;
 ;IHS/SD/lwj  08/01/02  NCPDP 5.1 changes
 ; This routine is responsible for creating a new entry in the 
 ; claims file, and for calling the routines that then populate
 ; that new entry.
 ; 
 ; For 5.1 we needed to adjust this routine just a little.  In 3.2
 ; there were only 4 segments to a claim, in 5.1 there are 14, so
 ; as we loop through the calling of BPSOSCF to populate the claim
 ; file we will verify which version of claim we are working with
 ; and adjust the calling appropriately.  Worthy of noting is that
 ; the "header" portion of the claim in 5.1 is comprised of 3 
 ; segments - 100 (Header), 110 (Insurance) and 120 (Patient).  The
 ; "detail" or "rx" portion of the claim will hold the remaining
 ; 11 segments.
 ;
 ; I also had to create a new BPS field (i.e. "Transaction Count")
 ; to track the number of transactions per claim.
 ;
 Q
 ;
NEWCLAIM(START,END,TOTAL) ;EP
 ;Manage local variables
 N CLAIMID,DIC,DLAYGO,X,Y,COUNT,INDEX,DIK,DA,NODE0,ROU S ROU=$T(+0)
 ;
 S VARX=0 I '$P($G(^BPS(9002313.99,1,"SITE TYPE")),"^",1) S VARX=1
 ;Create new record in Claim Submission File (9002313.02)
L L +^TMP($J,"BPSOSCE"):300 I '$T G L:$$IMPOSS^BPSOSUE("L","RTI","Single-threaded routine",,,$T(+0))
 S CLAIMID=$$CLAIMID^BPSECX1(BPS("NCPDP","IEN"),"P")
 S DLAYGO=9002313.02,DIC="^BPSC(",DIC(0)="LXZ",X=CLAIMID
 D ^DIC S Y=+Y
 L -^TMP($J,"BPSOSCE")
 I Y<1 D  S ERROR=8002 Q
 .D LOG(ROU_" - Failed to create an entry in file 9002313.02")
 ;
 S BPS(9002313.02)=Y
 D LOG(ROU_" - Created claim ID "_CLAIMID_" (IEN "_BPS(9002313.02)_")")
 S NODE0=$G(^BPSC(BPS(9002313.02),0))
 S $P(NODE0,U,2)=BPS("Insurer","IEN")
 S $P(NODE0,U,4)=2 ; TRANSMIT FLAG - use 2 instead of 1 because
 ;  ANMC is running ECME and Traditional batch file together and we
 ;  want to be entirely sure of no conflicts
 S $P(NODE0,U,6)=$$NOWFM^BPSOSU1()
 S ^BPSC(BPS(9002313.02),0)=NODE0
 S $P(^BPSC(BPS(9002313.02),1),U)=BPS("Patient","Name")
 ;
 S:BPS("NCPDP","Version")[3 BPS("Transaction Code")=TOTAL
 ;       
 I TOTAL'<1,TOTAL'>4 S BPS("Transaction Code")="B1"  ;LJE;7/21/03
 I (TOTAL=11)!(TOTAL="B2") S BPS("Transaction Code")="B2"  ;LJE;7/21/03
 ;
 ; IHS/SD/lwj 8/5/02 NCPDP 5.1 - the value of field 103 changed
 ;  from being either the number of transactions for billing, or
 ;  an 11 for reversal, to a B1 for billing or a B2 for reversal
 ;  5.1 also requires that we send the number of transactions in
 ;  the claim.  So...for reversals we will set this to 1, and for
 ;  all others, we can still use TOTAL
 ;
 S BPS("Transaction Count")=TOTAL
 I TOTAL=11 S BPS("Transaction Count")=1   ;only 1 rev at a time
 ;
 ; IHS/SD/lwj 8/1/02  begin the 5.1 changes for the "header" section
 ; If the claim type is 3.2 we will call BPSOSCF with nodes 10
 ; and 20 - if it is 5.1, we will call with 100,110 and 120.
 ;
 D
 . N SEG,SEGBEG,SEGEND
 . I BPS("NCPDP","Version")[3 S SEGBEG=10,SEGEND=20
 . I BPS("NCPDP","Version")[5 S SEGBEG=100,SEGEND=120
 . F SEG=SEGBEG:10:SEGEND D
 .. D XLOOP^BPSOSCF(BPS("NCPDP","IEN"),SEG)
 ;
 ;Create multiple zero node
 S ^BPSC(BPS(9002313.02),400,0)="^9002313.0201PA^^"
 ;
 S COUNT=0
 F INDEX=START:1:END D
 .;Create prescription record
 .S COUNT=COUNT+1
 .S NODE0=""
 .S $P(NODE0,U,1)=INDEX
 .S $P(NODE0,U,2)=$G(BPS("RX",INDEX,"VCPT IEN"))
 .S $P(NODE0,U,3)=INDEX
 .S $P(NODE0,U,4)=$G(BPS("RX",INDEX,"Drug Name"))
 .I ^BPS(9002313.99,1,"CERTIFIER")'=DUZ S $P(NODEO,U,5)=BPS("RX",INDEX,"RX IEN") ;LJE;7/27/03  FOR SOME REASON IT GETS OVERLAYED ELSEWHERE
 .S ^BPSC(BPS(9002313.02),400,INDEX,0)=NODE0
 . I ^BPS(9002313.99,1,"CERTIFIER")=DUZ S INDEX=1 ;LJE
 . I 'VARX S $P(^BPSC(BPS(9002313.02),400,INDEX,400),U,1)=$$DTF1^BPSECFM($G(BPS("RX",INDEX,"Date Filled")))
 . E  D
 . . S $P(^BPSC(BPS(9002313.02),400,INDEX,400),U,1)=BPS("RX",INDEX,"Date Filled")
 .S BPS(9002313.0201)=INDEX ;07/28/96.
 .;
 .; IHS/SD/lwj 8/1/02 begin changes for NCPDP 5.1 - subroutine called 
 .; to lessen the looping here
 .; First we will remark out the old code
 .;       Execute claim information (required) code
 .;       D XLOOP^BPSOSCF(BPS("NCPDP","IEN"),30,INDEX)
 .;
 .;       Execute claim information (optional) code
 .;       D XLOOP^BPSOSCF(BPS("NCPDP","IEN"),40,INDEX)
 .;
 .; Now let's call the subroutine to process
 . D PROCRX
 .;
 .; IHS/SD/lwj end changes for 5.1 rx detail
 .;
 .S ^BPSC(BPS(9002313.02),400,"B",INDEX,INDEX)=""
 .S ^BPSC(BPS(9002313.02),400,"AC",INDEX,INDEX)=""
 .S NODE0=$G(^BPSC(BPS(9002313.02),400,0))
 .S $P(NODE0,U,4)=COUNT
 .S $P(NODE0,U,3)=$O(^BPSC(BPS(9002313.02),400,"A"),-1)
 .S ^BPSC(BPS(9002313.02),400,0)=NODE0
 .S $P(^BPSC(BPS(9002313.02),400,INDEX,0),"^",4)=$G(BPS("RX",INDEX,"Drug Name"))
 .S $P(^BPSC(BPS(9002313.02),400,INDEX,0),"^",5)=$G(BPS("RX",INDEX,"RX IEN")) ;LJE
 ;
 ;Cross-Reference Claim Submission Record
 S DIK="^BPSC("
 S DA=BPS(9002313.02)
 D IX1^DIK
 Q
LOG(X) ; write the message to all of the log files for the IEN59's
 ; being bundled into this 9002313.02 claim (usually, up to 4 presc's)
 N IEN59,I
 F I=START:1:END D
 . S IEN59=BPS("RX",I,"IEN59")
 . D LOG59^BPSOSQ(X,IEN59)
 Q
 ;
PROCRX ;IHS/SD/lwj  8/1/02  This routine contains the calls to 
 ; BPSOSCF needed to actually get the values, and store them
 ; in the claim file.  It was created as a result of the major
 ; segment changes that took place in NCPDP 5.1.  For 3.2 claims
 ; we will still only call BPSOSCF with nodes 30 and 40, but for
 ; 5.1 claims, we will call the routine with nodes 130, 140, 150,
 ; 160, 170, 180, 190, 200, 210, 220, 230.  These nodes are defined
 ; in the BPSF(9002313.92 file.
 ;
 N SEG,SEGBEG,SEGEND
 I BPS("NCPDP","Version")[3 S SEGBEG=30,SEGEND=40
 I BPS("NCPDP","Version")[5 S SEGBEG=130,SEGEND=230
 F SEG=SEGBEG:10:SEGEND D
 . D XLOOP^BPSOSCF(BPS("NCPDP","IEN"),SEG,INDEX)
 ;
 Q
