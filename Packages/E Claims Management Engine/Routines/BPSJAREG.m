BPSJAREG ;BHAM ISC/LJF - HL7 Application Registration MFN Message ;21-NOV-2003
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
 ;  This program will process the outgoing registration MFN message
 ;
 ;  Variables
 ; HL      = HL7 parameters
 ; HL7DTG  = Date time in HL7 format
 ; HLECH   = HL7 Encoding Characters
 ; HLEID   = HL7 Link id
 ; HLFS    = HL7 Field separator
 ; HLLNK   = HL7 E-Pharm Link
 ; HLRESET = HL7 generate results
 ; IPP     = IP Port
 ; IPA     = IP Address
 ; MCT     = Message Count
 ; MGRP    = E-Mail message group
 ; MSG     = Message
 ;
INI ;
INIT ; Unconditional jump....
 G ^BPSJINIT
 Q
 ;
BPSJVAL(BPSJVAL) ; Validation entry point - HL7 message processing prevented
 ;
TASKMAN ; Entry point for taskman to run this routine
 ;
 N HL,HL7DTG,HLECH,HLEID,HLFS,HLLNK,HLRESET,HLPRO
 N IPA,IPP
 N MGRP,MSG,MCT,BPSJARES
 ;
 S MCT=0,BPSJVAL=+$G(BPSJVAL)
 K ^TMP("HLS",$J)
 ;
 ;  Get Link data from HL7 table
 S HLPRO="BPSJ REGISTER",(IPA,IPP)=""
 S HLLNK=$$FIND1^DIC(870,"",,"EPHARM OUT","B")
 I HLLNK S IPA=$$GET1^DIQ(870,HLLNK_",",400.01),IPP=$$GET1^DIQ(870,HLLNK_",",400.02)
 ;
 ;  Error if any missing data
 I IPA=""!(IPP="") S MCT=MCT+1,MSG(MCT)="IP Address or Port is not defined.  "
 ;
 I MCT,'BPSJVAL D MSG^BPSJUTL(.MSG,"BPSJAREG") Q
 ;
 ;  Initialize the HL7
 D INIT^HLFNC2(HLPRO,.HL)
 S HLFS=$G(HL("FS")) I HLFS="" S HLFS="|"
 S HLECH=$E($G(HL("ECH")),1) I HLECH="" S HLECH="^"
 S HL("SITE")=$$SITE^VASITE,HL("SAF")=$P(HL("SITE"),U,2,3)
 S HL("EPPORT")=IPP,HLEID=$$HLP^BPSJUTL(HLPRO)
 ;
 ;Get fileman date/time, ensuring seconds are included: 3031029.135636
 S HL7DTG=$E($$HTFM^XLFDT($H)_"000000",1,14)
 ;Set HL7 Date/Time format: 20031029135636-0400
 S HL7DTG=$$FMTHL7^XLFDT(HL7DTG)
 ;
 ;   Set the MFI segment
 S ^TMP("HLS",$J,1)="MFI"_HLFS_"Facility Table"_HLFS_HLFS_"UPD"_HLFS
 S ^TMP("HLS",$J,1)=^TMP("HLS",$J,1)_HL7DTG_HLFS_HL7DTG_HLFS_"NE"
 ;
 ;  Set the MFE segment
 S ^TMP("HLS",$J,2)="MFE"_HLFS_"MUP"_HLFS_HLFS_HL7DTG_HLFS
 S ^TMP("HLS",$J,2)=^TMP("HLS",$J,2)_+HL("SITE")_HLFS_"ST"
 ;
 ; Set the ZQR segment
 S ^TMP("HLS",$J,3)=$$EN^BPSJZQR(.HL)
 ;
 S BPSJARES=$$VAL1^BPSJVAL(BPSJVAL)  ; 0 = ok,
 I BPSJVAL=3 G FINI   ; Just checking to see if data valid.
 ;
 ;-Check if msg valid.
 I 'BPSJARES D  G FINI
 . K HLRESLT
 . D GENERATE^HLMA(HLEID,"GM",1,.HLRESLT,"")
 . I $P($G(HLRESLT),U,2)]"" D  Q
 .. I BPSJVAL D  Q   ; Interactive: show no success
 ... W !!,"HL7 E-Pharm Application Registration Message not created: "_HLRESLT
 .. S MCT=MCT+1,MSG(MCT)="HL7 E-Pharm Application Registration Message not created."
 .. S MCT=MCT+1,MSG(MCT)=HLRESLT
 .. D MSG^BPSJUTL(.MSG,"BPSJAREG")
 . I BPSJVAL D    ;Interactive: show success
 .. W !!,"HL7 E-Pharm Application Registration Message successfully created."
 ;
FINI ; Clean up
 K ^TMP("HLS",$J)
 Q
