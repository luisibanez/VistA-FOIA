IVMPREC8 ;ALB/KCL/BRM/PJR - PROCESS INCOMING (Z05 EVENT TYPE) HL7 MESSAGES (CON'T) ; 11/24/04 9:58am
 ;;2.0; INCOME VERIFICATION MATCH ;**5,6,12,58,73,79,102**; 21-OCT-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
 ; This routine is called from IVMPREC6.
 ; This routine will process batch ORU demographic (event type Z05) HL7
 ; messages received from the IVM center.
 ;
 ;
 ;
PID ; - compare PID segment fields with DHCP fields
 N COMPPH1,COMPPH2
 ;
 ; - strip off segment name
 S IVMPIECE=$E(IVMXREF,4,7)
 ;
 I $P(IVMSEG,HLFS,$E(IVMPIECE,1,2))]"" D
 .;
 .; - if PID field is the address field - parse address
 .S IVMADFLG=0
 .I IVMXREF["PID11" D  Q:IVMFLD=""
 ..; - get PID address field containing 5 pieces seperated by HLECH (~)
 ..S IVMADDR=$P(IVMSEG,HLFS,$E(IVMPIECE,1,2))
 ..; - get piece of address field, and set IVMFLD
 ..S IVMPIECE=$E(IVMPIECE,3,4),IVMFLD=$P(IVMADDR,$E(HLECH),IVMPIECE)
 ..Q:IVMFLD=""
 ..; - convert state abbrev. to pointer
 ..I IVMPIECE=4 S (IVMSTPTR,IVMFLD)=+$O(^DIC(5,"C",IVMFLD,0))
 ..I IVMPIECE=5 S X=IVMFLD D ZIPIN^VAFADDR S IVMFLD=X
 ..S IVMADFLG=1
 .;
 .I IVMXREF["PID12" S IVMADFLG=1,IVMFLD=+$O(^DIC(5,IVMSTPTR,1,"C",$P(IVMSEG,HLFS,12),0))
 .; line remove so that the phone number is compared 
 .; before saving to 301.5.
 .;I IVMXREF["PID13" S IVMFLD=$P(IVMSEG,HLFS,13) D STORE^IVMPREC9 S IVMADFLG=1 Q
 .;
 .; - file address fields and quit
 .I IVMADFLG D STORE^IVMPREC9 Q
 .;
 .; - otherwise, set IVMFLD to field rec'd from IVM
 .;   for comparison with DHCP field
 .S IVMFLD=$P(IVMSEG,HLFS,IVMPIECE)
 .;
 .; - if HL7 date convert to FM date and set IVMFLD
 .I IVMXREF["PID07" S IVMFLD=$$FMDATE^HLFNC(IVMFLD)
 .;
 .; - call VADPT routine to return DHCP demographics
 .D DEM^VADPT,ADD^VADPT
 .;
 .; - execute code on the 1 node and get DHCP field for comparison
 .S IVMDHCP="" X:$D(^IVM(301.92,+IVMDEMDA,1)) ^(1) S IVMDHCP=Y
 .;
 .; - special logic for phone number processing
 .; - if different, then store the actual value received, then quit
 .I IVMXREF["PID13",IVMFLD]"" D  Q
 ..S COMPPH1=$$CONVPH(IVMFLD)
 ..S COMPPH2=$$CONVPH(IVMDHCP)
 ..I COMPPH1'=COMPPH2 D STORE^IVMPREC9
 .;
 .; - if field from IVM does not equal DHCP field - store for uploading
 .I IVMFLD]"",(IVMFLD'=IVMDHCP) D STORE^IVMPREC9
 Q
 ;
 ;
ZPD ; - compare ZPD segment fields with DHCP fields
 S IVMPIECE=$E(IVMXREF,4,5)
 I $P(IVMSEG,HLFS,IVMPIECE)]"" D
 .;
 .; - set var to HL7 field
 .S IVMFLD=$P(IVMSEG,HLFS,IVMPIECE)
 .;
 .; - if HL7 date convert to FM date
 .I IVMXREF["ZPD09"!(IVMXREF["ZPD13")!(IVMXREF["ZPD32") S IVMFLD=$$FMDATE^HLFNC(IVMFLD)
 .;
 .; - execute code on the 1 node and get DHCP field
 .S IVMDHCP="" X:$D(^IVM(301.92,+IVMDEMDA,1)) ^(1) S IVMDHCP=Y
 .;
 .; - if field from IVM does not equal DHCP field - store for uploading 
 .I IVMFLD]"",(IVMFLD'=IVMDHCP) D STORE^IVMPREC9 Q
 .I IVMXREF["ZPD09"!(IVMXREF["ZPD31")!(IVMXREF["ZPD32") D STORE^IVMPREC9
 I IVMXREF["ZPD32",$$AUTODOD^IVMLDEMD(DFN)
 Q
 ;
 ;
ZGD ; - compare ZGD segment fields with DHCP fields
 S IVMADFLG=0
 S IVMPIECE=$E(IVMXREF,4,7)
 I $P(IVMSEG,HLFS,$E(IVMPIECE,1,2))]"" D
 .;
 .; - set var IVMFLD to incoming HL7 field
 .I 'IVMADFLG S IVMFLD=$P(IVMSEG,HLFS,IVMPIECE)
 .;
 .; - ZGD06 as the ZGD address field containing 5 pieces seperated by HLECH (~)
 .I IVMXREF["ZGD06" D
 ..S IVMADDR=$P(IVMSEG,HLFS,$E(IVMPIECE,1,2)),IVMPIECE=$E(IVMPIECE,3)
 ..S IVMFLD=$P(IVMADDR,$E(HLECH),IVMPIECE),IVMADFLG=1
 ..I IVMFLD]"",IVMPIECE=4 S IVMFLD=$O(^DIC(5,"C",IVMFLD,0))
 ..I IVMFLD]"",IVMPIECE=5 S X=IVMFLD D ZIPIN^VAFADDR S IVMFLD=$G(X)
 .;
 .; - if HL7 date convert to FM date
 .I IVMXREF["ZGD08" S IVMFLD=$$FMDATE^HLFNC(IVMFLD)
 .;
 .; - execute code on the 1 node and get DHCP field
 .S IVMDHCP="" X:$D(^IVM(301.92,+IVMDEMDA,1)) ^(1) S IVMDHCP=Y
 .;
 .; if field from IVM does not equal DHCP field - store for uploading
 .I IVMFLD]"",(IVMFLD'=IVMDHCP) D STORE^IVMPREC9
 Q
RF1 ; - compare RF1 segment fields with DHCP fields
 S IVMPIECE=$E(IVMXREF,4),IVMADFLG=1
 I $P(IVMSEG,HLFS,IVMPIECE)]"" D
 .;if RF1 field is SEQ6, then parse subcomponents
 .I IVMXREF["RF16" D  Q
 ..;- get data containing 4 pieces seperated by HLECH (~)
 ..S IVMRFDAT=$P(IVMSEG,HLFS,6)
 ..S IVMPIECE=$E(IVMXREF,5),IVMFLD=$P(IVMRFDAT,"~",IVMPIECE)
 ..I IVMPIECE=2 S IVMFLD=$$ADDRCNV(IVMFLD)
 ..Q:IVMFLD=""
 ..D STORE^IVMPREC9
 .I IVMXREF["RF17" D  Q
 ..;get address change date/tm field
 ..S IVMFLD=$$FMDATE^HLFNC($P(IVMSEG,HLFS,7))
 ..Q:IVMFLD=""
 ..D STORE^IVMPREC9
 ..; check for auto-upload
 ..S NOUPDT=0,IVMDHCP=$P($G(^DPT(DFN,.11)),HLFS,13)
 ..I IVMFLD]"",(IVMFLD'>IVMDHCP) S NOUPDT=1
 ..I $$AUTOADDR^IVMLDEM6(DFN,1,NOUPDT)
 Q
 ;
ADDRCNV(ADDRSRC) ;convert Address Source from HL7 to DHCP format
 ;
 Q:$G(ADDRSRC)']"" ""
 Q:ADDRSRC="USVAHEC" "HEC"
 Q:ADDRSRC="USVAMC" "VAMC"
 Q:ADDRSRC="USVAHBSC" "HBSC"
 Q:ADDRSRC="USNCOA" "NCOA"
 Q:ADDRSRC="USVABVA" "BVA"
 Q:ADDRSRC="USVAINS" "VAINS"
 Q:ADDRSRC="USPS" "USPS"
 Q ""
CONVPH(PH) ;remove special chars/spaces from Phone number
 Q $TR(PH," )(/#\-","")
