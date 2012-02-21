IBCEF3 ;ALB/TMP - FORMATTER SPECIFIC BILL FLD FUNCTIONS ;17-JUNE-96
 ;;2.0;INTEGRATED BILLING;**52,84,121,51,152,210,155**;21-MAR-94
 ;
MPG(PG,FLDS,FORM) ; Set static flds on pages after page 1
 ;        for either HCFA 1500 or UB92
 ;  PG = page #
 ; FORM= 1 for UB-92, otherwise for 1500
 ;  FLDS: array passed by reference and containing lines OR
 ;        line/column from pg 1 to repeat on subsequent pgs
 ;        Format: FLDS(LINE,COL)  or  FLDS(LINE) for whole line
 ;   HCFA 1500:       LINES 1-5,7-43,57 from col 1 to 49, 58-63
 ;   UB-92:           LINE 2-5/COL 1 (FACILITY NAME/ADDRESS)
 ;                    LINE 3/COL 57,78 (BILL#, TYPE OF BILL)
 ;                    LINE 7 (PATIENT NAME, ADDRESS)
 ;                    LINE 9/COL 1 (PATIENT BIRTHDATE)
 ;                    LINE 62-64/COL 1 (BOX 84 DATA)
 N Z,Z0,Z1,LPG
 S FORM=$S($G(FORM)=1:3,1:2)
 I FORM=2 D  ; print page # on each pg, totals on last page of 1500
 . S LPG=+$O(^TMP("IBXDATA",$J,IBXREC,""),-1)
 . S Z="[Page "_PG_" of "_LPG_"]"
 . I $L($G(IBXSAVE("INDENT")))'>40 S Z=$J("",(80-$L(Z))\2)_Z
 . I $L($G(IBXSAVE("INDENT")))>40 S Z=$J("",10)_Z
 . D SETGBL^IBCEFG(PG,6,1,Z,.IBXSIZE)
 . I PG=2 S Z=$P(Z,"[")_"[Page 1 of "_LPG_"]" D SETGBL^IBCEFG(1,6,1,Z,.IBXSIZE)
 . I LPG=PG D
 .. D SETGBL^IBCEFG(PG,57,50,$J($G(IBXSAVE("TOT")),10,2),.IBXSIZE)
 .. D SETGBL^IBCEFG(PG,57,63,$G(IBXSAVE("PAID")),.IBXSIZE)
 .. D SETGBL^IBCEFG(PG,57,72,$G(IBXSAVE("BDUE")),.IBXSIZE)
 .. K IBXSAVE("PTOT"),IBXSAVE("TOT"),IBXSAVE("BDUE"),IBXSAVE("PAID")
 ;
 S Z=0 F  S Z=$O(FLDS(Z)) Q:'Z  D
 . I $O(FLDS(Z,""))="" D  Q  ;repeats line
 .. S Z0=0 F  S Z0=$O(^TMP("IBXDATA",$J,IBXREC,1,Z,Z0)) Q:'Z0  S Z1=$G(^(Z0)) I Z1'="" D SETGBL^IBCEFG(PG,Z,Z0,Z1,.IBXSIZE)
 . S Z0=0 F  S Z0=$O(FLDS(Z,Z0)) Q:'Z0  S Z1=$G(^TMP("IBXDATA",$J,IBXREC,1,Z,Z0)) I Z1'="" D SETGBL^IBCEFG(PG,Z,Z0,Z1,.IBXSIZE)
 . I FORM=2,LPG'=PG D
 .. D SETGBL^IBCEFG(PG,57,50,"",.IBXSIZE)
 .. D SETGBL^IBCEFG(PG,57,72,"",.IBXSIZE)
 Q
 ;
NONSERV(Z,Z0) ; Set variable if non-service/non-text data is present for box
 ;  24 of HCFA 1500
 ; Z = sequence of IBXSAVE being processed
 ; Z0 = sequnce within IBXDATA to indicate actual line #
 I $P(IBXSAVE("BOX24",Z),U)="" S IBXSAVE("NON-SERV",Z0)=""
 Q
 ;
PG(VAL,LNCT) ;Set next pg for HCFA 1500 lines
 ;VAL = value of fld
 ;LNCT = line # from IBXSAVE("BOX24") array
 N IBP,IBL
 S IBP=LNCT\12+(LNCT#12>0),IBL=LNCT-(12*(IBP-1))-1
 I IBL'<0 S VAL=$$FORMAT(VAL,$G(IBXLOOP("IBX0")),$G(IBXDA)) D SETGBL^IBCEFG(IBP,IBXLN+IBL,IBXCOL,VAL,.IBXSIZE)
 K IBXDATA(LNCT)
 Q
 ;
MPG92(PG,OFFSET,VAL,IBLN,IBCOL,NOFORM) ; Set up pgs > 1 for UB92 overflows
 ; PG = Page # to set (REQUIRED)
 ; OFFSET = offset from first line this should be extracted into
 ;          0 = first line (REQUIRED)
 ; VAL = value to set (REQUIRED)
 ; IBLN = line to set data at (if null, uses IBXLN)
 ; IBCOL = column to set data at (if null, uses IBXCOL)
 ; NOFORM = don't format, just output data as passed
 ; Assumes formatter IBXLN,IBXCOL variables exist
 ;
 I $G(IBLN)="" S IBLN=IBXLN
 I $G(IBCOL)="" S IBCOL=IBXCOL
 S:'$G(NOFORM) VAL=$$FORMAT(VAL,$G(IBXLOOP("IBX0")),$G(IBXDA))
 D SETGBL^IBCEFG(PG,IBLN+OFFSET,IBCOL,VAL,.IBXSIZE)
 Q
 ;
CKREV(CT,VAL) ; Check too many rev code lines to fit on pg
 ; 
 I CT'>23,$O(^TMP($J,"IBC-RC",""),-1)'>23 S IBXDATA(CT)=VAL Q  ;If up to 23 rev codes, output on first page
 D MPG92((CT-1)\21+1,CT-1#21,VAL) ; 21 on a pg, blank line, pg ref
 Q
 ;
CKPG92 ; Check to see if multiple UB92 pgs are needed then populate
 ; static flds from page 1, add page numbers
 Q:'$O(^TMP("IBXDATA",$J,IBXREC,1))
 ;
 N FLDS,LPG,IBPG,IBP,Z,Z0
 S LPG=$O(^TMP("IBXDATA",$J,IBXREC,""),-1),IBP=0
 S Z="" F  S Z=$O(^TMP("IBXDATA",$J,IBXREC,LPG,Z),-1) Q:'Z  S Z0=0 F  S Z0=$O(^TMP("IBXDATA",$J,IBXREC,LPG,Z,Z0)) Q:'Z0  I $G(^(Z0))'="" S IBP=1 Q
 I 'IBP K ^TMP("IBXDATA",$J,IBXREC,LPG) S LPG=$O(^TMP("IBXDATA",$J,IBXREC,""),-1) Q:LPG=1
 ; Static flds
 S FLDS(7)="" F Z=2,9,4,5,62,63,64 S FLDS(Z,1)=""
 F Z=1,58,77:1:80 S FLDS(3,Z)=""
 F IBPG=1:1:LPG D
 . ; Add pg # to last line of rev codes if multiple pages
 . N IB,IBP
 . S IB=$G(^TMP("IBXDATA",$J,IBXREC,IBPG,41,6))
 . D MPG92(IBPG,22,$J("",20)_"PAGE",19,6,1)
 . D MPG92(IBPG,22,IBPG_" OF "_LPG,19,31,1)
 . D:IBPG>1 MPG(IBPG,.FLDS,1)
 ;
 Q
 ;
HCPC(R) ;FORMAT HCPC fld FOR UB92 (returns formatted value)
 ; R = flag for type of fld (1/2/3) being printed in rev code block
 Q R  ;No longer used as of patch IB*2.0*51
 ;
PROS(IBIFN) ; Extract billable prosthetics for 837
 N IBARRAY,Z,Z0,CT,PROS
 D SET^IBCSC5B(IBIFN,.IBARRAY)
 I '$P(IBARRAY,U,2) S CT="" G PROSQ
 S Z="",CT=0
 F  S Z=$O(IBARRAY(Z)) Q:Z=""  S Z0="" F  S Z0=$O(IBARRAY(Z,Z0)) Q:Z0=""  S CT=CT+1 D
 .S PROS=$P($$PIN^IBCSC5B(+$P($G(^IBA(362.5,+IBARRAY(Z,Z0),0)),U,3)),U,2)
 .;date^item ptr file 661^short descr from file 441^entry # in file 362.5
 .S IBXDATA(CT)=Z_U_Z0_U_PROS_U_+IBARRAY(Z,Z0)
PROSQ Q CT
 ;
B24(IBXSV,IBIFN,IBNOSHOW) ; Code to execute to set up IBXSV("BOX24") for
 ;   print or IBXSAVE("OUTPT") for transmit - called by output formatter
 ; IBNOSHOW = 1 if not to show error/warning text lines
 ; Pass IBXSV by reference
 N IBSUB
 S IBSUB=$S('$G(^TMP("IBTX",$J,IBIFN)):"BOX24",1:"OUTPT")
 K IBXSV(IBSUB)
 I '$D(IBIFN) S IBIFN=$G(IBXIEN)
 I IBIFN D F^IBCEF("N-HCFA 1500 SERVICE"_$S(IBSUB["24":"S (PRINT",1:" LINE (EDI")_")",,,IBIFN)
 I $S(IBSUB'["24":1,1:'$G(IBNOSHOW)) D
 . M IBXSV(IBSUB)=IBXDATA
 E  D
 . N Z,CT
 . S (Z,CT)=0 F  S Z=$O(IBXDATA(Z)) Q:'Z  I '$D(IBXDATA(Z,"ARX")) S CT=CT+1 M IBXSV(IBSUB,CT)=IBXDATA(Z)
 Q
 ;
 ; esg - 11/14/03 - Moved the below functions due to space constraints
 ;
ALLTYP(IBIFN) Q $$ALLTYP^IBCEF31(IBIFN)
INSTYP(IBIFN,SEQ) Q $$INSTYP^IBCEF31(IBIFN,$G(SEQ))
POLTYP(IBIFN,IBSEQ) Q $$POLTYP^IBCEF31(IBIFN,$G(IBSEQ))
ALLPTYP(IBIFN) Q $$ALLPTYP^IBCEF31(IBIFN)
 ;
FILL(Z) ;
 Q
 ;
 ;  ***** 
 ;  The following code performs the multi-page set up for
 ;  printing overflow data on the UB-92
 ;  *****
 ;
XPROC(DATA,CT) ; Output any UB92 procedures after 6 on new page(s)
 ; DATA = output data from IBXSAVE("PROC",CT)
 ; CT = array sequence # of the procedure being output
 ; Only used for local prints
 N OFFSET,PG,COL,PRCODE,Q
 S Q=(CT-1)\3#2,OFFSET=$S('Q:0,1:2)
 S PG=(CT-1)\6+1,COL=4+(CT-1#3*15)
 D MPG92(PG,OFFSET,$P(DATA,U),58,COL),MPG92(PG,OFFSET,$P(DATA,U,2),58,COL+8)
 Q
 ;
XDIAG(DATA,CT) ; Output any UB92 other diagnoses after 8 on new page(s)
 ; DATA = output data from IBXSAVE("DX",CT)
 ; CT = array sequence # of the diagnosis being output
 ; Only used for local prints
 N COL,PG
 S PG=(CT-1)\8+1,COL=8+(CT-1#9*7)
 S DATA=$P($$ICD9^IBACSV(+DATA),U)
 D MPG92(PG,0,DATA,56,COL)
 Q
 ;
XVAL(DATA,CT) ; Output any UB92 value codes after 12 on new page(s)
 ; DATA = output data from IBXSAVE("VC",CT)
 ; CT = array sequence # of the value code being output
 ;
 N COL,PG,OFFSET
 S PG=(CT-1)\12+1,COL=44+(CT-1#3*13),OFFSET=(CT-(12*(PG-1))-1)\3
 D MPG92(PG,OFFSET,$P(DATA,U),14,COL),MPG92(PG,OFFSET,$P(DATA,U,2),14,COL+2)
 Q
 ;
XCC(DATA,CT) ; Output any UB92 condition codes after 7 on new page(s)
 ; DATA = output data from IBXSAVE("CC",CT)
 ; CT = array sequence # of the condition code being output
 ;
 N COL,PG
 S PG=(CT-1)\7+1,COL=55+(CT-1#7*3)
 D MPG92(PG,0,DATA,9,COL)
 Q
 ;
XOCC(DATA,CT,FL) ; Output any UB92 occurrence codes after 8 (2 per form
 ;  locators 32-35) on new page(s)
 ; DATA = data from IBXSAVE("OCC",CT) to be output
 ; CT = array sequence # of occurrence code being output
 ; FL = # of form locator being populated with the occ code
 ;
 N COL,PG,OFFSET
 S PG=(CT-1)\2+1,COL=4+((FL-32)*10),OFFSET=$S(CT#2:0,1:1)
 D MPG92(PG,OFFSET,$P(DATA,U),11,COL),MPG92(PG,OFFSET,$P(DATA,U,2),11,COL+3)
 Q
XOCCS(DATA,CT) ; Output any UB92 occurrence span codes after 2 on new page(s)
 ; DATA = data from IBXSAVE("OCCS",CT) to be output
 ; CT = array sequence # of occurrence span code being output
 ;
 N PG,OFFSET
 S PG=(CT-1)\2+1,OFFSET=$S(CT#2:0,1:1)
 D MPG92(PG,OFFSET,$P(DATA,U),11,41),MPG92(PG,OFFSET,$P(DATA,U,2),11,44),MPG92(PG,OFFSET,$P(DATA,U,3),11,51)
 Q
 ;
FORMAT(VAL,IBX0,IBXDA) ;
 I IBX0'="",IBXDA S VAL=$$FORMAT^IBCEFG(VAL,$P($G(^IBA(364.6,+IBXDA,0)),U,9),$P(IBX0,U,7),IBX0)
 Q VAL
 ;
OUTPDT(IBIFN,IBXSAVE,IBXDATA) ; Returns outpatient service to date
 ;  formatted CCYYMMDD for UB92 837
 ; IBIFN = ien of bill (file 399)
 ; IBXSAVE = pass by reference for IBXSAVE("INPT") and IBXSAVE("DATE")
 ; IBXDATA = array with formatted date or each line item - CCYYMMDD
 N Z
 S Z=0 F  S Z=$O(IBXSAVE("INPT",Z)) Q:'Z  S IBXDATA(Z)=$S($P(IBXSAVE("INPT",Z),U,10):$$DT^IBCEFG1($P(IBXSAVE("INPT",Z),U,10),,"D8"),1:IBXSAVE("DATE"))
 K IBXSAVE("DATE")
 Q
 ;
