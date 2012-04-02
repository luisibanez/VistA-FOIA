BADESND ;IHS/MSC/MGH - Dentrix HL7 interface (cont) ;30-Jun-2009 12:49;PLS
 ;;1.0;DENTAL/EDR INTERFACE;;Oct 13, 2009
 Q
RESEND ;EP Resend one HL7 message
 N MSGIEN,DIC,DT,NEWIEN,ERROR,Y
 S DIC=778,DIC(0)="AEQ",DIC("A")="Select Message Number: ",DT=$$DT^XLFDT D ^DIC I +Y>0 D
 .S MSGIEN=+Y
 .S NEWIEN=$$RESEND^HLOAPI3(MSGIEN,.ERROR)
 .I '$D(ERROR) W !,"Message Resent, New Number: "_NEWIEN H 2
 .I $D(ERROR) W !,ERROR H 2
 Q
REPROC ;EP Reprocess one message
 N MSGIEN,DIC,DT,NEWIEN,ERROR,Y
 S DIC=778,DIC(0)="AEQ",DIC("A")="Select Message Number: ",DT=$$DT^XLFDT D ^DIC I +Y>0 D
 .S MSGIEN=+Y
 .S NEWIEN=$$REPROC^HLOAPI3(MSGIEN,.ERROR)
 .I NEWIEN=1 W !,"Message Reprocessed successfully" H 2
 .I NEWIEN=0 W !,ERROR H 2
 Q
SNDACK ;
 N MIEN,HLMSTATE,HLST,Y,MSA,MSGIEN,MSGBDY,APPARMS,X,DIC,DT,Y,ACK,ERR,ARY
 S DIC=778,DIC(0)="AEQ",DIC("A")="Select Message Number: ",DT=$$DT^XLFDT D ^DIC I +Y>0 D
 .S MIEN=+Y
 .;S MIEN=$P($G(^HLB(MSGIEN,0)),U,2)
 .;S MIEN=MSGIEN_"^"_MSGBDY
 .S APPARMS("QUEUE")="DENT ERX"
 .S APPARMS("ACK CODE")="AA"
 .S X=$$STARTMSG^HLOPRS(.HLMSTATE,MIEN)
 .I X=0 W !,"Unable to setup application" H 2 Q
 .I '$$ACK^HLOAPI2(.HLMSTATE,.APPARMS,.ACK,.ERR) W !,ERR H 2 Q
 .D SET^BADEHL1(.ARY,"MSA",0)
 .D SET^BADEHL1(.ARY,APPARMS("ACK CODE"),1)
 .S MSA=$$ADDSEG^HLOAPI(.HLST,.ARY)
 .I '$$SENDACK^HLOAPI2(.ACK,.ERR) W !,ERR H 2
 .E  W !,"Message sent"
 Q