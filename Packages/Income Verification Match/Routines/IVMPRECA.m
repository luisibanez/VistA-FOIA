IVMPRECA ;ALB/KCL/BRM/PJR/RGL - DEMOGRAPHICS MESSAGE CONSISTENCY CHECK ; 2/4/04 10:00am
 ;;2.0; INCOME VERIFICATION MATCH ;**5,6,12,34,58,56**; 21-OCT-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
 ; This routine will perform data validation checks on uploadable
 ; demographic fields received from the IVM Center to ensure they
 ; are acurate prior to their upload into DHCP.
 ;
 ;
 ; Called from routine IVMPREC6 before uploadable demographic fields
 ; are stored in DHCP.
 ;
 ;
EN ; - Entry point to create temp array and perform msg consistency checks
 ;
 N DFN,IVMCNTY,IVMCR,IVMEG,IVMFLAG,IVMFLD,IVMNUM,IVMSTR,IVMSTPTR,X
 S IVMNUM=IVMDA ; 'current' line in ^HL(772,"IN",...
 ;
 ; - check the format of the HL7 demographic message
 D NEXT I $E(IVMSTR,1,3)'="PID" S HLERR="Missing PID segment" G ENQ
 S IVMSTR("PID")=$P(IVMSTR,HLFS,2,999)
 D NEXT I $E(IVMSTR,1,3)'="ZPD" S HLERR="Missing ZPD segment" G ENQ
 S IVMSTR("ZPD")=$P(IVMSTR,HLFS,2,999)
 D NEXT I $E(IVMSTR,1,3)="ZEL" S HLERR="ZEL segment should not be sent in Z05 message" G ENQ
 I $E(IVMSTR,1,3)'="ZGD" S HLERR="Missing ZGD segment" G ENQ
 S IVMSTR("ZGD")=$P(IVMSTR,HLFS,2,999)
 ;
 ; - perform field validation checks for PID segment
 S DFN=$P($P(IVMSTR("PID"),HLFS,3),$E(HLECH),1)
 I ('DFN!(DFN'=+DFN)!('$D(^DPT(+DFN,0)))) S HLERR="Invalid DFN" G ENQ
 I $P(IVMSTR("PID"),HLFS,19)'=$P(^DPT(DFN,0),"^",9) S HLERR="Couldn't match IVM SSN with DHCP SSN" G ENQ
 ;
 S X=$P(IVMSTR("PID"),HLFS,7) I X]"",($$FMDATE^HLFNC(X)>DT) S HLERR="Date of Birth greater than current date" G ENQ
 ;
 S X=$P(IVMSTR("PID"),HLFS,8) I X]"",X'="M",X'="F" S HLERR="Invalid code sent for Patient sex" G ENQ
 ;
 ; - if address - perform validation checks on addr fields
 S X=$P(IVMSTR("PID"),HLFS,11)
 S IVMFLAG=0 F IVMFLD=1:1:5 I $P(X,$E(HLECH),IVMFLD)]"" S IVMFLAG=1 Q
 I IVMFLAG D ADDRCHK
 G ENQ:$D(HLERR)
 ;
 S X=$P(IVMSTR("PID"),HLFS,13) I X]"",(($L(X)>20)!($L(X)<4)) S HLERR="Invalid phone number" G ENQ
 ;
 ; - perform field validation check for ZPD and ZGD segment
 ; - I X]"" was changed to I X below for IVM*2*56
 S X=$P(IVMSTR("ZPD"),HLFS,9) I X,($$FMDATE^HLFNC(X)<$P($G(^DPT(+DFN,0)),"^",3))!($$FMDATE^HLFNC(X)>$$DT^XLFDT) S HLERR="Invalid date of death" G ENQ
 S X=$P(IVMSTR("ZGD"),HLFS,2) I X,X'=1 S HLERR="Invalid Guardian Type" G ENQ
 ;
 ;
ENQ ; - send acknowledgement (ACK) 'AE' msg to the IVM Center
 I $D(HLERR) D ACK^IVMPREC
 Q
 ;
 ;
ADDRCHK ; - validate address fields sent by IVM Center
 ;
 I $P(X,$E(HLECH),1)']"" S HLERR="Invalid address - Missing street address [line 1]" Q
 I $P(X,$E(HLECH),3)']"" S HLERR="Invalid address - Missing city" Q
 I $P(X,$E(HLECH),4)']"" S HLERR="Invalid address - Missing state abbreviation" Q
 I $P(X,$E(HLECH),5)']"" S HLERR="Invalid address - Missing zip code" Q
 S IVMCNTY=$P(IVMSTR("PID"),HLFS,12)
 I IVMCNTY']"" S HLERR="Invalid address - Missing county code" Q
 I $L($P(X,$E(HLECH),1))>35!($L($P(X,$E(HLECH),1))<3) S HLERR="Invalid street address [line 1]" Q
 I $P(X,$E(HLECH),2)]"",(($L($P(X,$E(HLECH),2))>30)!($L($P(X,$E(HLECH),2))<3)) S HLERR="Invalid street address [line 2]" Q
 I $L($P(X,$E(HLECH),3))>15!($L($P(X,$E(HLECH),3))<2) S HLERR="Invalid city" Q
 ;
 ; - save state pointer for county code validation
 S IVMSTPTR=+$O(^DIC(5,"C",$P(X,$E(HLECH),4),0))
 I 'IVMSTPTR S HLERR="Invalid state abbreviation" Q
 I '$O(^DIC(5,IVMSTPTR,1,"C",IVMCNTY,0)) D  Q:$G(HLERR)]""
 .N STFIPS
 .S STFIPS=IVMSTPTR
 .S:$L(STFIPS)<2 STFIPS="0"_STFIPS
 .Q:$$FIPSCHK^XIPUTIL(STFIPS_IVMCNTY)  ;county code is valid
 .S HLERR="Invalid county code"
 ;
 S X=$P(X,$E(HLECH),5) D ZIPIN^VAFADDR I $D(X)[0 S HLERR="Invalid zip code" Q
 Q
 ;
 ;
NEXT ; - get the next HL7 segment in the message from HL7 Transmission (#772) file
 S IVMNUM=$O(^TMP($J,IVMRTN,IVMNUM)),IVMSTR=$G(^(+IVMNUM,0))
 Q
