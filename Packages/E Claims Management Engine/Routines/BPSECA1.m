BPSECA1 ;BHAM ISC/FCS/DRS/VA/DLF - Assemble formatted claim ;05/14/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 ;----------------------------------------------------------------------
 ;Assemble ASCII formatted claim submission record
 ;
 ;Input Variables:   CLAIMIEN - pointer into 9002313.02
 ;     The claim must be complete and well-constructed;
 ;     we do some paranoiac checks below.
 ;
 ;     $$ Returns:   - Formatted NCPDP ASCII record
 ;----------------------------------------------------------------------
 ;
 ;IHS/SD/lwj 8/1/02  NCPDP 5.1 changes
 ; These is major differences in 3.2 vs 5.1 in the actual creation
 ; of the claim.  Of significance:
 ;     3.2 had 4 claim segments (hdr req, hdr opt, det req, det opt)
 ;     5.1 has 14 claim segments (header, patient, insurance, claim
 ;                                pharmacy provider, prescriber,
 ;                                COB, workers comp, DUR, Pricing,
 ;                                coupon, compound, prior auth,
 ;                                clinical)
 ;
 ;    3.2 required only field identifiers and separators on optional
 ;        fields
 ;    5.1 requires field identifiers and separators on all fields
 ;        other than the header
 ;
 ;    3.2 there were no segment separators 
 ;    5.1 segment separators are required prior to each segment 
 ;        following the header
 ;
 ;    3.2/5.1  Group separators appear at the end of each
 ;        transaction (prescription)
 ;
 ;  The first thing added to this routine is the retrieval of the
 ;  version from the claim file.  If the version is 3.2, we will 
 ;  process just like we used to.  If it is 5.1, we will alter the
 ;  creation of the claim to include the above differences.
 ;
 ;  Adjustments were also made to the reversal logic as well.
 ;
 ;
 ;
ASCII(CLAIMIEN) ;EP - from BPSOSQH from BPSOSQG from BPSOSQ2
 N IEN,MBPS,RECORD,BPS,REVERSAL,UERETVAL,CLMV,DET51,RTRNCD
 I '$D(^BPSC(CLAIMIEN,0)) D  G QERR  ; check for good parameter
 . S UERETVAL=$$IMPOSS^BPSOSUE("DB,P","T",CLAIMIEN,,1,$T(+0))
 ;
 ;Setup IEN variables (used when executing format code)
 S IEN(9002313.02)=CLAIMIEN
 ; Point to BPS INSURER
 S IEN(9002313.4)=$P($G(^BPSC(IEN(9002313.02),0)),U,2)
 I ^BPS(9002313.99,1,"CERTIFIER")=DUZ D
 .  S IEN(9002313.4)=$S($G(ENTRY):$G(^BPS(9002313.31,ENTRY,4)),1:64)
 I 'IEN(9002313.4) D  G QERR ; claim must have an insurer
 . S UERETVAL=$$IMPOSS^BPSOSUE("DB,P","T",CLAIMIEN,,2,$T(+0))
 ; Point to format
 I '$G(VARX) S IEN(9002313.92)=$P($G(^BPSEI(IEN(9002313.4),100)),U,1)  ;VA;7/9/03
 E  S IEN(9002313.92)=IEN(9002313.4)  ;VA;7/9/03
 I IEN(9002313.02)["^" S (BPS(9002313.02),IEN(9002313.02))=$P(IEN(9002313.02),"^",1)  ;VA
 I '$G(VARX) I 'IEN(9002313.92) D  G QERR ; insurer must have an e-format
 . S UERETVAL=$$IMPOSS^BPSOSUE("DB","T",CLAIMIEN,,3,$T(+0))
 ;
 ;
 ; But if it's a reversal claim, get the format for the reversal
 ; IHS/SD/lwj 08/15/02 NCPDP 5.1 needed to adjust reversal a little
 ; RTRNCD added - original IF stmt remarked out - new one added
 ; 5.1 transaction code for reversal is now B2 not 11
 ;
 S RTRNCD=$P(^BPSC(IEN(9002313.02),100),U,3)
 I (RTRNCD=11)!(RTRNCD="B2") D
 . S REVERSAL=1
 . I $G(VARX) S IEN(9002313.92)=$$GET1^DIQ(9002313.59902,"1,"_IEN59_",","902.19","I")  ;VA;10/22/94;get IB sent Reversal sheet.
 . E  S IEN(9002313.92)=$P($G(^BPSF(9002313.92,+IEN(9002313.92),"REVERSAL")),U)
 . I 'IEN(9002313.92) D
 . . S UERETVAL=$$IMPOSS^BPSOSUE("DB","T",CLAIMIEN,,4,$T(+0))
 E  S REVERSAL=0
 I ((RTRNCD=11)!(RTRNCD="B2")),'IEN(9002313.92) G QERR
 ;
 I '$D(^BPSF(9002313.92,+IEN(9002313.92),0)) D  G QERR
 . S UERETVAL=$$IMPOSS^BPSOSUE("P","T",CLAIMIEN,,5,$T(+0))
 ;
 ;IHS/SD/lwj 8/1/02
 ; retrieve the version number from the claim file so we know which
 ; way we have to process
 S CLMV=$P($G(^BPSC(IEN(9002313.02),100)),U,2)
 ;
 ;Retrieve claim submission record (used when executing format code)
 D GETBPS2^BPSECX0(IEN(9002313.02),.BPS)
 ;
 ;Assembler claim header required and optional format sections
 S RECORD=""
 K VARECORD S VARECORD=""
 ;
 D:CLMV[3 XLOOP^BPSECA2("10^20",.IEN,.BPS,.RECORD)   ;3.2 clms
 D:CLMV[5 XLOOP^BPSOSH2("100^110^120",.IEN,.BPS,.RECORD)   ;5.1 clms
 ;VA; had to do this because of HL7 control char constraints
 ;
 ;IHS/SD/lwj 8/1/02  NCPDP 5.1 create chain of segments
 S DET51="130^140^150^160^170^180^190^200^210^220^230"
 ;
 ;Loop through prescription multiple
 S IEN(9002313.01)=0
 F  D  Q:'IEN(9002313.01)
 .S IEN(9002313.01)=$O(^BPSC(IEN(9002313.02),400,IEN(9002313.01)))
 .Q:'IEN(9002313.01)
 .;
 .;Retrieve prescription information (used when executing format code)
 .K BPS(9002313.0201)
 .D GETBPS3^BPSECX0(IEN(9002313.02),IEN(9002313.01),.BPS)
 .;
 .;IHS/SD/lwj 8/22/02 NCPDP 5.1 handle at least the DUR repeating flds
 .D DURVALUE
 .;
 .;
 .;Append group separator character (but not in a reversal format)
 . I 'REVERSAL S RECORD=RECORD_$C(29)
 .;IHS/SD/lwj 08/15/02 NCPDP 5.1 - requires GS on reversal
 . I (REVERSAL)&(CLMV[5) S RECORD=RECORD_$C(29)
 .;
 .;Assemble claim information required and optional sections
 .;IHS/SD/lwj 8/1/02 nxt ln rmkd out - following 2 lines added
 .D:CLMV[3 XLOOP^BPSECA2("30^40",.IEN,.BPS,.RECORD)
 .D:CLMV[5 XLOOP^BPSOSH2(DET51,.IEN,.BPS,.RECORD)
 ;
 I VARX D VASTORE
 Q RECORD
 ;
VASTORE ;; Need to store by segment for VA due to HL7 constraints.  Had to changed field, group, and segment separators to control
 ;               ;  characters for Vitria/AAC processing as well as shortening the length of the xmit.
 N NNODES,INDEX,ONE,TWO,OREC
 S NNODES=0,INDEX=1 F  S NNODES=$O(RECORD(NNODES)) Q:NNODES=""  D
 . I RECORD(NNODES)[$C(29)
 . I RECORD(NNODES)[$C(30) S (ONE,TWO)="",ONE=$P(RECORD(NNODES),($C(30)_$C(28)),1),TWO=$P(RECORD(NNODES),($C(30)_$C(28)),2) D
 . . S RECORD(OREC)=RECORD(OREC)_ONE_$C(30)_$C(28),RECORD(NNODES)=TWO
 . S OREC=NNODES
 ; 
 S NNODES=""
 S INDEX=1 F  S NNODES=$O(RECORD(NNODES)) Q:NNODES=""  D
 . S ^BPSECX($J,"C",CLAIMIEN,INDEX)=RECORD(NNODES)
 . S WP(INDEX/100+1,0)=RECORD(NNODES)
 . S INDEX=INDEX+1
 D WP^DIE(9002313.02,CLAIMIEN_",",9999,"","WP")
 S ^BPSECX($J,"C",CLAIMIEN,0)=INDEX-1
 S RECORD=1
 Q
 ;
QERR Q
 ;
DURVALUE ;NCPDP 5.1 - this subroutine will loop through the DUR/PPS repeating
 ; fields and load their values into the BPS array for the claim
 ; generation process
 ;
 N DURCNT,DUR
 ;
 K BPS(9002313.1001)
 ;
 ;we depend on the "count" since we set it when we created the clm entry
 S DURCNT=$P($G(^BPSC(IEN(9002313.02),400,IEN(9002313.01),473.01,0)),U,4)
 F DUR=1:1:DURCNT  D
 . D GETBPS4^BPSECX0(IEN(9002313.02),IEN(9002313.01),DUR,.BPS)
 ;
 Q
