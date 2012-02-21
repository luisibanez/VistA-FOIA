BPSOSCA ;BHAM ISC/FCS/DRS - Create 9002313.02 entries ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 ;
 ; Create 9002313.02 entries for RXILIST(*) claims.
 ; Called from PACKET^BPSOSQG
 ;
 ; Input:
 ;      RXILIST(IEN59)  array of pointers to 9002313.59
 ;         A list of prescriptions for the same visit/patient/etc.
 ;         to be bundled into one or more 9002313.02 claims
 ;
 ; Outputs:
 ;      CLAIMIEN(CLAIMIEN)="", pointers to the ^BPSC(CLAIMIEN,
 ;                             claim records created.
 ;      ERROR
 ;
 ; BPSOSCA calls:
 ;   BPSOSCB to build BPS(*) array
 ;      (and BPSOSCB calls BPSOSCC)
 ;   BPSOSCD to build the ^BPSC( entry
 ;
EN(DIALOUT)        ;EP - from BPSOSQG
 I $D(RXILIST)<10  D
 .N RETVAL S RETVAL=$$IMPOSS^BPSOSUE("P","TI","bad RXILIST",,,$T(+0))
 ;Manage local variables
 N BPS,START,END,TOTAL,NCLAIMS,CLAIMN
 S ERROR=$$BPS^BPSOSCB(DIALOUT,.BPS)
 I ERROR D LOG2LIST^BPSOSQ($T(+0)_" - $$BPS^BPSOSCB("_DIALOUT_",.BPS) returned "_ERROR)
 I $G(BPS("RX",0))="" S:'ERROR ERROR=301 Q
 I $G(BPS("NCPDP","# Meds/Claim"))="" S ERROR=302 Q
 ;
 ; Override any BPS() nodes that you need to override.
 ;
 D  ; NDC #s - Translate POSTAGE (may be insurer-dependent someday)
 .N N F N=1:1:BPS("RX",0) D
 ..N X,Y S X=$TR(BPS("RX",N,"NDC"),"-",""),Y=BPS("RX",N,"IEN59")
 ..N Z S Z=$P(^BPST(Y,1),U,2)
 ..I Z="POSTAGE" S Z=99999999981 ; 06/21/2000
 ..; This next part should never happen; it should already be correct
 ..;    BPSOSQ1 already put the correct NDC # into the ^PSRX
 ..;    and BPSOSCE will pick it out from there.
 ..I X'=Z,Z'="POSTAGE",Z'="" D  ; $TR inserted above, 03/07/2000
 ...S BPS("RX",N,"NDC")=Z
 ...D LOG59^BPSOSQ("CLAIM - NDC # on `"_Y_" sent as "_Z_", not "_X,Y)
 ;
 ;Calculate number of claim records to be generated for Billing Item
 S NCLAIMS=((BPS("RX",0)-1)\BPS("NCPDP","# Meds/Claim"))+1
 I NCLAIMS=0 S ERROR=303 Q
 ;
 ;Generate claim submission records
 F CLAIMN=1:1:NCLAIMS D  Q:$G(ERROR)
 .S START=((CLAIMN-1)*BPS("NCPDP","# Meds/Claim"))+1
 .S END=START+BPS("NCPDP","# Meds/Claim")-1
 .S:END>BPS("RX",0) END=BPS("RX",0)
 .S TOTAL=END-START+1
 .D NEWCLAIM^BPSOSCE(START,END,TOTAL)
 .S CLAIMIEN=BPS(9002313.02)
 .S CLAIMIEN(CLAIMIEN)=""
 .; Mark each of the .59s with the claim number and position within
 .F I=START:1:END D
 ..;IEN59 handling 06/23/2000. The ELSE should never happen again.
 ..; and the $G() can probably be gotten rid of, safely.
 ..N IEN59 S IEN59=$G(BPS("RX",I,"IEN59"))
 ..I IEN59 D
 ...N DIE,DA,DR S DIE=9002313.59
 ...; Field (#3) CLAIM (#14) POSITION
 ...S DA=IEN59,DR=3_"////"_CLAIMIEN_";14////"_I N I D ^DIE
 ..E  D
 ...S $P(^BPST(BPS("RX",I,"RX IEN"),0),"^",4)=CLAIMIEN
 ...S ^BPST("AE",CLAIMIEN,BPS("RX",I,"RX IEN"))=""
 ...S $P(^BPST(BPS("RX",I,"RX IEN"),0),"^",9)=I
 ..; POSITION:  Not the relative position within the packet,
 ..; but the index in BPS("RX",n,....  This is the position in which
 ..; it will be stored in ^BPSC(ien,400,POSITION
 ..; and likewise for 9002313.03 when the response comes in.
 Q
