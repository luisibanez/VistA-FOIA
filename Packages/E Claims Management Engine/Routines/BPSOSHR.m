BPSOSHR ;BHAM ISC/SD/lwj/DLF - 3.2 to 5.1 clm reversal format ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 ;
 ;-------------------------------------------------------
 ; IHS/SD/lwj 10/22/02 NCPDP 5.1 changes
 ; We ran into a big snag - some processors are doing an all or nothing
 ; switch to 5.1 with no grace period for 3.2 and 5.1 claims.  What this
 ; means is that we have to be able to reverse a previously submitted
 ; 3.2 claim in 5.1 reversal format since they won't accept 3.2 any
 ; more.  The biggest problem with this is that 3.2 and 5.1 fields
 ; are formatted differently, and the reversal process was used to
 ; simply copy the information from the original claim into the
 ; reversal claim.  To get around this, this routine was created
 ; to try and reformat those fields that require the 5.1 format to
 ; reverse properly.
 ;
 ; This routine should only be called from within the BPSECA8 - it
 ; is dependent on variables set there.
 ;
 ; Basic logic:
 ;  Read the format for the designated segment
 ;  Read through the fields on the segment (no xref - very few fields)
 ;  Determine if there are "special" values for the field
 ;  Format the field with the proper value
 ;  Set the TMP field to the formatted value
 ;
 Q
 ;
REFORM(BPSFORM) ;EP  main driver of problem and entry point - everything
 ; should call through to here
 ;
 N BPS
 ;
 D REFRMH(BPSFORM)
 D REFRMD(BPSFORM)
 ;
 Q
REFRMH(BPSFORM) ;
 ; This routine will only attempt to reset the "header" fields that need
 ; adjusting for 5.1.  There are four fields in the header segment that
 ; need to be reformatted - we will leave the others since they may have
 ; gone through extensive formatting for the original claim and are fine
 ; the way they are.  These four fields were either new to the reversal
 ; in 5.1, or changed value/length in 5.1.  The fields are:
 ;     109  Transaction Count   (not on 3.2 reversal)
 ;     110  Software Vendor/Certificationd ID  (new field to 5.1)
 ;     201  Service Provider ID (changed length in 5.1)
 ;     202  Service Provider ID Qualifier (new to 5.1)
 ;
 ; Remember - the header is stagnate - that's the only reason we look
 ; specifically for those two fields.
 ;
 ; IEN and TMP are set in BPSECA8
 ;
 ; The header segment is small, and there isn't a xref by field #, so we
 ; will read the entire segment here.
 ;
 N FLDIEN,PMODE,ORDER,RECMIEN,FIELD
 ;
 S ORDER=0
 F  S ORDER=$O(^BPSF(9002313.92,BPSFORM,100,"B",ORDER)) Q:'ORDER  D
 . S RECMIEN=$O(^BPSF(9002313.92,BPSFORM,100,"B",ORDER,0))
 . Q:'RECMIEN
 . S FLDIEN=$P($G(^BPSF(9002313.92,BPSFORM,100,RECMIEN,0)),U,2)
 . S FIELD=$P($G(^BPSF(9002313.91,FLDIEN,0)),U)
 . Q:(FIELD'=110)&(FIELD'=202)&(FIELD'=201)&(FIELD'=109)
 . ;
 . ; check to see if the format has a "special" value for this field
 . S PMODE=$P($G(^BPSF(9002313.92,BPSFORM,100,RECMIEN,0)),U,3)
 . I PMODE="X" D XSPCCODE^BPSOSCF(BPSFORM,100,RECMIEN)
 . I PMODE'="X" S BPS("X")=$G(TMP(9002313.02,IEN,FIELD,"I"))
 . ;
 . D FORMAT
 . ;
 . S TMP(9002313.02,IEN,FIELD,"I")=BPS("X")
 ;
 ;
 Q
 ;
REFRMD(BPSFORM) ;
 ; This routine is going to try and reformat the "detail" portion of the
 ; claim. For now, the only segment we are going to look at is 130
 ; which is the claim segment.  If other reversal formats become
 ; available, and they require other segments - this section will have
 ; to change.  Since the claim segment full of optional fields, we wil
 ; read through the format and take it a field at a time.
 ;
 ; IEN, RX, and TMP were set in BPSECA8
 ;
 ;
 N FLDIEN,PMODE,ORDER,RECMIEN,NODE,IDIEN,DOFORM,FIELD
 S NODE=130
 ;
 S ORDER=0
 F  S ORDER=$O(^BPSF(9002313.92,BPSFORM,NODE,"B",ORDER)) Q:'ORDER  D
 . S RECMIEN=$O(^BPSF(9002313.92,BPSFORM,NODE,"B",ORDER,0))
 . Q:'RECMIEN
 . S FLDIEN=$P($G(^BPSF(9002313.92,BPSFORM,NODE,RECMIEN,0)),U,2)
 . S FIELD=$P($G(^BPSF(9002313.91,FLDIEN,0)),U)
 . Q:FIELD=111    ;(SEGMENT IDENTIFIER - SKIP)
 . ;
 . ; check to see if the format has a "special" value for this field
 . S PMODE=$P($G(^BPSF(9002313.92,BPSFORM,NODE,RECMIEN,0)),U,3)
 . I $G(VARX) S BPS("X")=$G(TMP(9002313.0201,RX_","_IEN,FIELD,"I")) ;LJE;8/2/03
 . I PMODE="X" D XSPCCODE^BPSOSCF(BPSFORM,NODE,RECMIEN)
 . ;
 . ; if this isn't a special value field in 5.1, we need to make sure
 . ; it wasn't an optional field in 3.2. If it was, the field ID is
 . ; already a part of the field, and we don't need to reformat it
 . ;
 . S DOFORM=1
 . I PMODE'="X" D
 .. ; DMB 4/29/2005
 .. I '$G(VARX) S:$P($G(^BPSF(9002313.91,FLDIEN,0)),U,2)'="" DOFORM=0
 .. E  I $P($G(^BPSF(9002313.91,FLDIEN,5)),U,1)'="" S DOFORM=0
 .. S:DOFORM BPS("X")=$G(TMP(9002313.0201,RX_",",IEN,FIELD,"I"))
 . ;
 . ; format it only if it needs it
 . ;
 . I DOFORM D
 .. D FORMAT
 .. S TMP(9002313.0201,RX_","_IEN,FIELD,"I")=BPS("X")
 ;
 ;
 Q
 ;
FORMAT ; This routine will format the field to 5.1 standards - remember it
 ; will set BPS("X") based on what is in the BPS NCPDP Field Defs file
 ;
 N INDEX,MCODE,NODE,QUAL,QUALFLG  ;LJE;8/2/03
 S NODE=25            ;we only want the 5.1 format code
 ;
 S QUALFLG=0,QUAL="",QUAL=$P(^BPSF(9002313.91,FLDIEN,5),"^",1) ;LJE;8/2/03
 I $E(BPS("X"),1,2)=QUAL S QUALFLG=1,BPS("X")=$P(BPS("X"),QUAL,2) ;LJE;8/2/03
 S INDEX=0
  F  D  Q:'+INDEX
 . S INDEX=$O(^BPSF(9002313.91,FLDIEN,NODE,INDEX))
 . Q:'+INDEX
 . S MCODE=$G(^BPSF(9002313.91,FLDIEN,NODE,INDEX,0))
 . Q:MCODE=""
 . Q:$E(MCODE,1)=";"
 . X MCODE
 I QUALFLG&($E(BPS("X"),1,2)'=QUAL) S BPS("X")=QUAL_BPS("X")
 ;
 ;
 Q
