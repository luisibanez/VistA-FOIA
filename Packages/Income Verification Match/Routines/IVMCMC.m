IVMCMC ;ALB/SEK,BRM,GN - CHECK INCOME TEST TRANSMISSION SEGMENTS ; 9/17/03 12:54pm
 ;;2.0;INCOME VERIFICATION MATCH;**17,34,49,51,90**;21-OCT-94
 ;
 ;IVM*2*90 - stop upload of LTC type 4 test when staus code not valid
 ;
EN ; Check segment structure of Income Test (Z10) transmission.
 ;  Variable input:
 ;      IVMDA  --  pointer to an incoming message line in file #772
 ;     IVMORF  --  [optional]: set to 1 if Z10 is an ORF message
 ;     IVMSEG  --  the MSH segment string
 ; 
 ;     plus the usual HL7 variables: HLDA, HLFS, HLQ, HLECH
 ; 
 ;  Variable output:
 ;        DFN  --  pointer to the patient in file #2
 ;       DGLY  --  Income Year
 ;    IVMFLGC  --  Number of Dependent Children
 ;    IVMMCI   --  HL7 message control id of query sent to IVM Center
 ; 
 ;    and the global array ^TMP($J,"IVMCM" which holds the message.
 ;
 N ERRMSG,DOBP,SEXP,X,Y
 ;
 ; - message control id from MSH segment
 S MSGID=$P(IVMSEG,HLFS,10)
 ;
 ; - if query response (ORF), do additional edit checks
 I $G(IVMORF) D ADDL I $D(HLERR) G ENQ
 ;
 ; - check the PID segment and get a match on patient
 D GET("PIDV") I IVMSEG1'="PID" D PROB("Missing PID segment") G ENQ
 S DOBP=$P(IVMSEG,HLFS,8),SEXP=$P(IVMSEG,HLFS,9)
 I SEXP'="F"&(SEXP'="M") D PROB("Incorrect value for Sex") G ENQ
 S X=$$FMDATE^HLFNC(DOBP),%DT=X D ^%DT I Y<0 D PROB("Invalid Date of Birth") G ENQ
 S DFN=$$LOOKUP^IVMUFNC($P(IVMSEG,HLFS,20),Y,SEXP,.ERRMSG)
 I 'DFN D PROB(ERRMSG) G ENQ
 ;
 ; - check for veteran's ZIC and ZIR segments
 D GET("ZICV") I IVMSEG1'="ZIC" D PROB("Missing veteran's ZIC segment") G ENQ
 S DGLY=$$FMDATE^HLFNC($P(IVMSEG,"^",3)) ; income year
 I 'DGLY D PROB("Missing veteran's Income Year") G ENQ
 D GET("ZIRV") I IVMSEG1'="ZIR" D PROB("Missing veteran's ZIR segment") G ENQ
 ;
 ; - check for spouse's ZDP, ZIC, ZIR segments
 D GET("ZDPS") I IVMSEG1'="ZDP" D PROB("Missing spouse's ZDP segment") G ENQ
 D GET("ZICS") I IVMSEG1'="ZIC" D PROB("Missing spouse's ZIC segment") G ENQ
 D GET("ZIRS") I IVMSEG1'="ZIR" D PROB("Missing spouse's ZIR segment") G ENQ
 ;
 ; - check for dependent children's ZDP, ZIC, ZIR segments and ZMT segment
 S IVMFLGC=0
 F IVMNBR=1:1 D  I $D(HLERR)!(IVMSEG1="ZMT") Q
 .D GET("ZDPC",IVMNBR) I IVMSEG1'="ZDP",IVMSEG1'="ZMT" D PROB("Missing child's ZDP segment or ZMT segment") Q
 .I IVMSEG1="ZMT" Q
 .I $P(IVMSEG,"^",2)=""!($P(IVMSEG,"^",3)="")!($P(IVMSEG,"^",4)="") D PROB("Missing child data from ZDP segment") Q
 .D GET("ZICC",IVMNBR) I IVMSEG1'="ZIC" D PROB("Missing child's ZIC segment") Q
 .D GET("ZIRC",IVMNBR) I IVMSEG1'="ZIR" D PROB("Missing child's ZIR segment") Q
 .S IVMFLGC=IVMFLGC+1 ; # of children
 ;
 I $D(HLERR) G ENQ
 ;
 ; - check for remaining ZMT and ZBT segments
 D GET("ZMT2") I IVMSEG1'="ZMT" D PROB("Missing Copay Test ZMT segment") G ENQ
 ;
 ; ** added ZMT4 lines for LTC phase II (IVM*2*49)
 ; uncomment after all sites have installed to enable consistency chk
 D GET("ZMT4") I IVMSEG1'="ZMT" D PROB("Missing LTC Test ZMT segment") G ENQ
 ;
 ; remove next line after all sites have installed
 ;D GET("ZMT4") I IVMSEG1'="ZMT" K ^TMP($J,"IVMCM","ZMT4") S IVMDA=IVMDA-1
 ;
 D GET("ZBT") I IVMSEG1'="ZBT" D PROB("Missing Beneficiary Travel ZBT segment") G ENQ
 ;
ENQ I IVMSEG1="MSH" S IVMDA=IVMDA-1,HLERR="",IVMTYPE=5
 K IVMSEG1,IVMNBR
 Q
 ;
 ;
GET(SEG,NUM) ; Get the next HL7 segment.
 ;  Formal input:
 ;        SEG  --  String with which to build ^TMP($J,"IVMCM"
 ;        NUM  --  Number to index child dependent strings [optional]
 ;  Required variable input:
 ;       HLDA  --  Pointer to the incoming message in file #772
 ;      IVMDA  --  Pointer to the next message line within file #772
 S IVMDA=$O(^TMP($J,IVMRTN,+IVMDA)),IVMSEG=$G(^(+IVMDA,0))
 S IVMSEG1=$E(IVMSEG,1,3)
 I $G(SEG)="" G GETQ
 I $G(NUM),IVMSEG1'="ZMT" S ^TMP($J,"IVMCM",SEG,NUM)=$P(IVMSEG,HLFS,2,99) G GETQ
 I IVMSEG1="ZMT",$E(SEG,1,3)'="ZMT" S SEG="ZMT1"
 ;
 ;IVM*2*90   don't allow upload of LTC with a date & a bad status code
 I SEG="ZMT4",$P(IVMSEG,HLFS,3),$P(IVMSEG,HLFS,4)'=0,$P(IVMSEG,HLFS,4)'=1,$P(IVMSEG,HLFS,4)'="""""" Q
 ;
 S ^TMP($J,"IVMCM",SEG)=$P(IVMSEG,HLFS,2,99)
GETQ Q
 ;
PROB(ERR) ; Process encountered errors.
 ;  Input:  ERR  --  Error text
 S HLERR=ERR
 D ACK^IVMPREC
 Q
 ;
ADDL ; Perform additional segment checks for ORF messages.
 ;
 N DOB,ERRMSG,IVMMSA,IVMPAT,IVMQRD,IVMQRF,QARRAY,QRYIEN,SEX,SSN
 ;
 ; edit checks for MSA, QRD, and QRF segments
 D GET("") I IVMSEG1'="MSA" D PROB("Missing required MSA segment") G ADDLQ
 S IVMMCI=$P(IVMSEG,"^",3) ; msg control id of msg being acknowledged
 S IVMMSA=IVMSEG
 ; trace reply back to the original query msg
 S QRYIEN=$$FINDMSG^IVMCQ2(IVMMCI)
 I 'QRYIEN D PROB("Query not found") G ADDLQ
 I QRYIEN,'$$GET^IVMCQ2(QRYIEN,.QARRAY) D PROB("Query not found") G ADDLQ
 S DFN=QARRAY("DFN")
 ;
 D GET("") I IVMSEG1'="QRD" D PROB("Missing required QRD segment") G ADDLQ
 S IVMQRD=IVMSEG
 S SSN=$P(IVMQRD,HLFS,9)
 ;
 D GET("") I IVMSEG1'="QRF" D PROB("Missing required QRF segment") G ADDLQ
 S IVMQRF=IVMSEG
 S DOB=$$FMDATE^HLFNC($P(IVMQRF,HLFS,5))
 S SEX=$P(IVMQRF,HLFS,6)
 ;
 ;
 ; if application reject rec'd from HEC (i.e. No income data on file)
 I $P(IVMMSA,HLFS,2)="AR" D
 .S HLERR=""
 .S IVMTYPE=7  ;type 4 is now used for LTC test (IVM*2*49)
 .; - if patient identifiers rec'd from HEC incorrect, 
 .;   queue off job to send a new query
 .I $$GETPAT^IVMUFNC(DFN,.IVMPAT),((SSN'=IVMPAT("SSN"))!(DOB'=IVMPAT("DOB"))!(SEX'=IVMPAT("SEX"))) D QRYQUE^IVMCQ2(DFN)
 ;
ADDLQ Q
