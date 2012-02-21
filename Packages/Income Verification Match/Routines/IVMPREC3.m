IVMPREC3 ;ALB/KCL - PROCESS INCOMING (Z04 EVENT TYPE) HL7 MESSAGES ; 3/6/01 4:33pm
 ;;2.0;INCOME VERIFICATION MATCH;**3,17,34**;21-OCT-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
 ; This routine will process batch ORU insurance(event type Z04) HL7
 ; messages received from the IVM center.  Format of batch:
 ;       BHS
 ;       {MSH
 ;        PID
 ;        IN1    could be a continuation of IN1
 ;        ZIV
 ;       }
 ;       BTS
 ;
EN ; - entry point to process insurance messages
 ;
 S IVMBULL=0
 F IVMDA=1:0 S IVMDA=$O(^TMP($J,IVMRTN,IVMDA)) Q:'IVMDA  S IVMSEG=$G(^(IVMDA,0)) I $E(IVMSEG,1,3)="MSH" D
 .K HLERR
 .;
 .; - message control id from MSH segment
 .S MSGID=$P(IVMSEG,HLFS,10)
 .;
 .; - get message segments from (#772) file
 .S IVMDA=$O(^TMP($J,IVMRTN,IVMDA)),IVMSEG=$G(^(+IVMDA,0)) I $E(IVMSEG,1,3)'="PID" D  Q
 ..S HLERR="Missing PID segment" D ACK^IVMPREC
 .S DFN=$P($P(IVMSEG,HLFS,4),$E(HLECH),1)
 .I ('DFN!(DFN'=+DFN)!('$D(^DPT(+DFN,0)))) D  Q
 ..S HLERR="Invalid DFN" D ACK^IVMPREC
 .I $P(IVMSEG,HLFS,20)'=$P(^DPT(DFN,0),"^",9) D  Q
 ..S HLERR="Couldn't match IVM SSN with DHCP SSN" D ACK^IVMPREC
 .S IVMDA=$O(^TMP($J,IVMRTN,IVMDA)),IVMSEG=$G(^(+IVMDA,0)) I $E(IVMSEG,1,3)'="IN1" D  Q
 ..S HLERR="Missing IN1 segment" D ACK^IVMPREC
 .S IVMSEG1=$P(IVMSEG,HLFS,2,999)
 .I $P(IVMSEG1,HLFS,4)']"" D  Q
 ..S HLERR="Missing insurance company name" D ACK^IVMPREC
 .I $P(IVMSEG1,HLFS,8)']"",($P(IVMSEG1,HLFS,9)']"") D  Q
 ..S HLERR=$S($P(IVMSEG1,HLFS,7)']"":"Missing group number",1:"Missing group name") D ACK^IVMPREC
 .I $P(IVMSEG1,HLFS,17)']"" D  Q
 ..S HLERR="Missing insured's relation to patient" D ACK^IVMPREC
 .I $P(IVMSEG1,HLFS,17)'="v",($P(IVMSEG1,HLFS,16)']"") D  Q
 ..S HLERR="Missing name of insured" D ACK^IVMPREC
 .S IVMDA=$O(^TMP($J,IVMRTN,IVMDA)),IVMSEG=$G(^(+IVMDA,0)) I $E(IVMSEG,1,3)'="ZIV",$L(IVMSEG1)'=241 D  Q
 ..S HLERR="Missing ZIV segment" D ACK^IVMPREC
 .I $P(IVMSEG,HLFS,10)']"" D  Q
 ..S HLERR="Missing IVM internal entry number" D ACK^IVMPREC
 .I $L(IVMSEG1)=241 D  Q:$D(IVMERR)
 ..K IVMERR
 ..S IVMSEG3=IVMSEG
 ..S IVMDA=$O(^TMP($J,IVMRTN,IVMDA)),IVMSEG=$G(^(+IVMDA,0))
 ..I $E(IVMSEG,1,3)'="ZIV" S HLERR="Missing ZIV segment",IVMERR="" D ACK^IVMPREC
 .;S IVMSEG2=$P(IVMSEG,"^",10)
 .;
 .; - check for date of death from IVM
 .I $P(IVMSEG,"^",13)]"" S $P(IVMSEG,"^",13)=$$FMDATE^HLFNC($P(IVMSEG,"^",13))
 .;
 .; - ivm ien/fm date of death
 .S IVMSEG2=$S($P(IVMSEG,"^",13)']"":$P(IVMSEG,"^",10),1:$P(IVMSEG,"^",10)_"/"_$P(IVMSEG,"^",13))
 .S IVMDOD=IVMSEG2
 .;
 .; - if no error encountered - store insurance fields
 .I '$D(HLERR) D STORE
 ;
 ; - send notification if uploadable insurance info
 I IVMBULL D MAIL^IVMUFNC()
 Q
 ;
 ;
STORE ; - store IN1 segment fields in (#301.5) file for uploading
 ;
 S DA(1)=$O(^IVM(301.5,"B",DFN,0)),X=$$IEN^IVMUFNC4("IN1")
 I DA(1)']"" S HLERR="patient missing from IVM PATIENT file" D ACK^IVMPREC Q
 I X<0 S HLERR="IN1 segment not in HL7 SEGMENT NAME file" D ACK^IVMPREC Q
 I $G(^IVM(301.5,DA(1),"IN",0))']"" S ^(0)="^301.501PA^^"
 S DIC="^IVM(301.5,"_DA(1)_",""IN"",",DIC(0)="L"
 S DIC("DR")=".03///NOW;.07////^S X=IVMSEG2;10////^S X=IVMSEG1",DLAYGO=301.501
 S:$D(IVMSEG3) DIC("DR")=".03///NOW;.07////^S X=IVMSEG2;10////^S X=IVMSEG1;11////^S X=IVMSEG3"
 K DD,DO D FILE^DICN
 K DA,DIC,DLAYGO,X,Y
 ;
 ; - build mail message if SUPPRESS INSURANCE NOTIFICATION is not set
 Q:$P($G(^IVM(301.9,1,0)),"^",4)
 ;
 ; - patient name and last 4 of ssn from zeroth node of Patient (#2) file
 S IVMPTID=$$PT^IVMUFNC4(DFN)
 ;
 I IVMBULL G COUNT
 ;
IN1BULL ; - Build mail message for transmission to IVM mail group notifying them
 ;   that patients with updated insurance data have been received from
 ;   the IVM Center, and may now be uploaded into DHCP.
 ;
 ; - set flag so mail message text is only set up once 
 S IVMBULL=1
 ;
 S XMSUB="IVM - INSURANCE UPLOAD for "_$P($P(IVMPTID,"^"),",")_" ("_$P(IVMPTID,"^",3)_")"
 ;
 ; - mail message (NOTIFICATION) text
 S IVMTEXT(1)="The Income Verification Match Center has identified patients"
 S IVMTEXT(2)="having updated insurance information.  Please select the"
 S IVMTEXT(3)="'Insurance Upload' option from the IVM Upload Menu in order"
 S IVMTEXT(4)="to take action against this updated insurance information."
 S IVMTEXT(5)="If you have any questions concerning updated insurance information"
 S IVMTEXT(6)="please contact the Income Verification Match Center."
 S IVMTEXT(7)=""
 S IVMTEXT(8)=""
 S IVMTEXT(9)="The Income Verification Match Center has identified the"
 S IVMTEXT(10)="following patients as having updated insurance information: "
 S IVMTEXT(11)=""
 ;
COUNT ; - set counter and build list of patients for notification
 S IVMCNTR=IVMCNTR+1
 ;
 ; - list of patient names
 S IVMTEXT(IVMCNTR+11)=$J(IVMCNTR_")",5)_"  "_$P(IVMPTID,"^")_" ("_$P(IVMPTID,"^",3)_")"
 Q
