BPSOSCF ;BHAM ISC/FCS/DRS/DLF - Low-level format of .02 ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 ;
 ; FORMAT is a pointer to 9002313.92
 ; NODE = 100  (5.1 Transaction Header Segment)
 ;        110  (5.1 Patient Segment)
 ;        120  (5.1 Insurance Segment)
 ;        130  (5.1 Claim Segment)
 ;        140  (5.1 Pharmacy Provider Segment)
 ;        150  (5.1 Prescriber Segment)
 ;        160  (5.1 COB/Other Payments Segment)
 ;        170  (5.1 Worker's Compensation Segment)
 ;        180  (5.1 DUR/PPS Segment)
 ;        190  (5.1 Pricing Segment)
 ;        200  (5.1 Coupon Segment)
 ;        210  (5.1 Compound Segment)
 ;        220  (5.1 Prior Authorization Segment)
 ;        230  (5.1 Clinical Segment)
 ; MEDN set to reflect the prescription for nodes 130 - 230
 ;
 ; For 5.1 there is only one significant change to this routine - 
 ; the values used in the NODE field in the XFLDCODE subroutine
 ; will be now based on the version of claim we are processing.
 ; For 3.2 claims, we will process the 10, 20, and 30 nodes from
 ; from the NCPDP Field defs dictionary.  
 ; For 5.1, we will process 10, 25 and 30.
 ;
XLOOP(FORMAT,NODE,MEDN) ;EP
 N ORDER,RECMIEN,MDATA,FLDIEN,PMODE,FLAG
 ;
 ;IHS/SD/lwj 8/1/02 for 5.1, segments won't always be defined-just quit
 Q:(BPS("NCPDP","Version")[5)&('$D(^BPSF(9002313.92,FORMAT,NODE,0)))
 ;
 ;IHS/SD/lwj 8/20/01 for 5.1 segment 180 is the DUR/PPS segment
 ; this is a repeating field segment, and must be handled differently
 ; than the regular sections
 S HEADER=",1,2,3,4,92,75,5,13,76,"  ;header seg fields don't get qualifiers
 I ",230,220,210,200,170,160,"[NODE Q  ;210=Compound,200=coupon,170=workers comp,160=cob/other payments ;ITERATION 3 WON'T DO THESE. ;LJE
 I NODE=180 D DURPPS^BPSOSHF(FORMAT,NODE,MEDN) Q
 ;
 I '$D(^BPSF(9002313.92,FORMAT,NODE,0)) D IMPOSS^BPSOSUE("DB,P","TI","FORMAT="_FORMAT,"NODE="_NODE,1,$T(+0))
 ;
 S ORDER=0
 F  D  Q:'ORDER
 .S ORDER=$O(^BPSF(9002313.92,FORMAT,NODE,"B",ORDER)) Q:'ORDER
 .S RECMIEN=$O(^BPSF(9002313.92,FORMAT,NODE,"B",ORDER,0))
 .I 'RECMIEN D IMPOSS^BPSOSUE("DB","TI","NODE="_NODE,"ORDER="_ORDER,2,$T(+0))
 .S MDATA=^BPSF(9002313.92,FORMAT,NODE,RECMIEN,0)
 .S FLDIEN=$P(MDATA,U,2)
 .I VARX Q:FLDIEN=241!(FLDIEN=240)!(FLDIEN=93)  ;LJE;7/21/03
 .I 'FLDIEN D IMPOSS^BPSOSUE("DB","TI","NODE="_NODE,"RECMIEN="_RECMIEN,3,$T(+0)) ; corrupt or erroneous format file
 .S PMODE=$P(MDATA,U,3)
 .I PMODE="" S PMODE="S" ;default it
 .I PMODE="X",$P(^BPSF(9002313.91,FLDIEN,0),U)=104 D
 . . ; Processor control number is different for Envoy
 . . ; It's always the Envoy Terminal ID, regardless of payor
 . . ; The XECUTE special code is only for non-Envoy
 . . ; Change it to "standard" mode for Envoy
 . . I BPS("Site","Switch Type")="ENVOY" S PMODE="S"
 . S FLAG=$S(PMODE="S":"GFS",1:"FS")
 . ; Apply any override values, as needed.
 . N OVERRIDE ; the override value, if any
 . I $D(MEDN) D  ; for a prescription detail
 . . I $D(BPS("OVERRIDE","RX",MEDN,FLDIEN)) D
 . . . S OVERRIDE=BPS("OVERRIDE","RX",MEDN,FLDIEN)
 . E  D  ; for patient/header info
 . . I $D(BPS("OVERRIDE",FLDIEN)) D
 . . . S OVERRIDE=BPS("OVERRIDE",FLDIEN)
 . ; BPS("X") is the field value as it's being computed
 . S BPS("X")=""
 . I PMODE="X" D  ; special Xecute code, in lieu of the field's Get code
 . . I $D(OVERRIDE) S BPS("X")=OVERRIDE
 . . E  D XSPCCODE(FORMAT,NODE,RECMIEN)
 . I $D(OVERRIDE) D
 . . D XFLDCODE(FLDIEN,FLAG,OVERRIDE)
 . E  D
 . . D XFLDCODE(FLDIEN,FLAG)
 Q
 ;Execute Get, Format and/or Set MUMPS code for a NCPDP Field
 ;
 ;Parameters:   FLDIEN  -  NCPDP Field Definitions IEN
 ;              FLAG    -  If variable contains:
 ;                         "G" - Execute Get Code
 ;                         "F" - Execute Format Code
 ;                         "S" - Execute S Code
 ;              OVERRIDE - if defined, it's used instead of Get Code
 ;---------------------------------------------------------------------
XFLDCODE(FLDIEN,FLAG,OVERRIDE) ;EP 
 ;Manage local variables
 ;IHS/SD/lwj  8/1/02  added logic to work with the 5.1 format
 ; code instead of the 3.2 format code.  If the claim is for 
 ; 5.1, we will loop with 10, 25, 30 and if it is 3.2 we will 
 ; loop with 10, 20, 30.
 ;
 ; This subroutine was flagged as an entry point with the NCPDP 
 ; 5.1 changes.  The only call to this subroutine from outside 
 ; of this program is done in BPSOSHF.
 ;
 N NODE,INDEX,MCODE
 N FNODE                    ;IHS/SD/lwj 8/1/02 format node
 S FNODE=25                 ;IHS/SD/lwj 8/1/02 default to 5.1 node
 ;Check if record exist and FLAG variable is set correctly
 ; (Changed from Q: to give fatal error  10/18/2000)
 I 'FLDIEN D IMPOSS^BPSOSUE("DB,P","TI","FLDIEN="_FLDIEN,,"XFLDCODE",$T(+0))
 I '$D(^BPSF(9002313.91,FLDIEN,0)) D IMPOSS^BPSOSUE("DB,P","TI","FLDIEN="_FLDIEN,,"XFLDCODE",$T(+0))
 I FLAG="" D IMPOSS^BPSOSUE("DB,P","TI","FLAG null",,"XFLDCODE",$T(+0))
 ;
 ; IHS/SD/lwj 8/1/02  added next line of code
 I BPS("NCPDP","Version")[3 S FNODE=20
 ;
 ;Loop through Get, Format and Set Code fields and execute code
 ;
 ; IHS/SD/lwj 8/1/02  nxt line remarked out - new line added
 F NODE=10,FNODE,30 D
 .;
 .; IHS/SD/lwj 8/21/02 nxt line remarked out- new line added
 .Q:FLAG'[$S(NODE=10:"G",NODE=20:"F",NODE=25:"F",NODE=30:"S",1:"")
 .I VARX Q:FLDIEN=241!(FLDIEN=240)!(FLDIEN=93)  ;LJE;7/21/03
 .I '$D(^BPSF(9002313.91,FLDIEN,NODE,0)) D IMPOSS^BPSOSUE("DB","TI","FLDIEN="_FLDIEN,"NODE="_NODE,"XFLDCODE",$T(+0))
 . ;If value is being overridden, just take the override value & get out
 .I NODE=10,$D(OVERRIDE) S BPS("X")=OVERRIDE Q
 .S INDEX=0
 .F  D  Q:'+INDEX
 ..S INDEX=$O(^BPSF(9002313.91,FLDIEN,NODE,INDEX))
 .. Q:'+INDEX
 ..S QUAL="" I $G(VARX)&(NODE=30) S QUAL=$P(^BPSF(9002313.91,FLDIEN,5),"^",1) ;LJE
 ..I NODE=30&($G(VARX)) I $E(BPS("X"),1,2)'=QUAL&(HEADER'[(","_FLDIEN_",")) S BPS("X")=QUAL_BPS("X") ;LJE;7/16/03
 ..S MCODE=$G(^BPSF(9002313.91,FLDIEN,NODE,INDEX,0))
 ..Q:MCODE=""
 ..Q:$E(MCODE,1)=";"
 ..X MCODE
 Q
 ;----------------------------------------------------------------------
 ;Execute Special Code (for a NCPDP Field within a NCPDP Record)
 ;
 ;Parameters:    FORMAT  - NCPDP Record Format IEN (9002313.92)
 ;               NODE     - Global node value (10,20,30,40)
 ;               RECMIEN  - Field Multiple IEN
 ;---------------------------------------------------------------------
XSPCCODE(FORMAT,NODE,RECMIEN) ;EP
 ;Manage local variables
 ;
 ; This subroutine was flagged as an entry point with the NCPDP 
 ; 5.1 changes.  The only call to this subroutine from outside 
 ; of this program is done in BPSOSHR.
 ;
 N INDEX,MCODE
 I '$D(^BPSF(9002313.92,FORMAT,NODE,RECMIEN,0)) D IMPOSS^BPSOSUE("DB,P","TI","no special code there to XECUTE","FORMAT="_FORMAT,"XSPCCODE",$T(+0))
 ;
 S INDEX=0
 F  D  Q:'+INDEX
 .S INDEX=$O(^BPSF(9002313.92,FORMAT,NODE,RECMIEN,1,INDEX))
 . Q:'+INDEX   ;I '+INDEX S BPX("X")=""  ;LJE  ;Q:'+INDEX
 .S MCODE=$G(^BPSF(9002313.92,FORMAT,NODE,RECMIEN,1,INDEX,0))
 .Q:MCODE=""
 .Q:$E(MCODE,1)=";"
 .X MCODE
 Q
 ;
