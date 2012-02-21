DGENUPLA ;ALB/CKN,TDM,PJR,RGL - PROCESS INCOMING (Z11 EVENT TYPE) HL7 MESSAGES ; 10/6/05 1:44pm
 ;;5.3;REGISTRATION;**397,379,497,451,564,672**;Aug 13,1993
 ;
 ;***************************************************************
 ; This routine was created because DGENUPL2 had reached it's
 ; maximum size, therefore no new code could not be added.  All
 ; code that existed in the ZEL and OBX tags of DGENUPL2 has
 ; been moved to the ZEL and OBX tags of DGENUPLA.  A line of code
 ; was placed in ZEL^DGENUPL2 to call ZEL^DGENUPLA.  A line of
 ; code was placed in OBX^DGENUPL2 to call OBX^DGENUPLA.
 ; Any routine that calls ZEL^DGENUPL2 or OBX^DGENUPL2 will not
 ; be affected by this change.
 ;***************************************************************
 ;
 ;***************************************************************
 ;The following procedures parse particular segment types.
 ;Input:SEG(),MSGID
 ;Output:DGPAT(),DGELG(),DGENR(),DGNTR(),DGMST(),ERROR
 ;***************************************************************
 ;
 ;
ZEL(COUNT) ;
 N CODE
 S CODE=$$CONVERT^DGENUPL1(SEG(2),"ELIGIBILITY",.ERROR)
 I ERROR D  Q
 .D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"ELIGIBILITY CODE "_SEG(2)_" NOT FOUND IN ELIGIBILTIY CODE FILE",.ERRCOUNT)
 I COUNT=1 D
 .S DGELG("ELIG","CODE")=CODE
 .;S DGELG("DISRET")=$$CONVERT^DGENUPL1(SEG(5))
 .S DGELG("DISRET")=$$DISCONV(SEG(5)) ;DG*5.3*672
 .I ERROR D  Q
 ..D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZEL SEGMENT, SEQ 5",.ERRCOUNT)
 .S DGELG("CLAIMNUM")=$$CONVERT^DGENUPL1(SEG(6))
 .;
 .;** removed **
 .;S DGELG("CLAIMLOC")=$$CONVERT^DGENUPL1(SEG(7))
 .;
 .S DGPAT("VETERAN")=$$CONVERT^DGENUPL1(SEG(8),"Y/N",.ERROR)
 .I ERROR D  Q
 ..D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZEL SEGMENT, SEQ 8",.ERRCOUNT)
 .S DGELG("ELIGSTA")=$$CONVERT^DGENUPL1(SEG(10))
 .S DGELG("ELIGSTADATE")=$$CONVERT^DGENUPL1(SEG(11),"DATE",.ERROR)
 .I ERROR D  Q
 ..D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZEL SEGMENT, SEQ 11",.ERRCOUNT)
 .S DGELG("ELIGVERIF")=$$CONVERT^DGENUPL1(SEG(13))
 .S DGELG("A&A")=$$CONVERT^DGENUPL1(SEG(14),"Y/N",.ERROR)
 .I ERROR D  Q
 ..D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZEL SEGMENT, SEQ 14",.ERRCOUNT)
 .S DGELG("HB")=$$CONVERT^DGENUPL1(SEG(15),"Y/N",.ERROR)
 .I ERROR D  Q
 ..D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZEL SEGMENT, SEQ 15",.ERRCOUNT)
 .S DGELG("VAPEN")=$$CONVERT^DGENUPL1(SEG(16),"Y/N",.ERROR)
 .I ERROR D  Q
 ..D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZEL SEGMENT, SEQ 16",.ERRCOUNT)
 .S DGELG("VADISAB")=$$CONVERT^DGENUPL1(SEG(17),"Y/N",.ERROR)
 .I ERROR D  Q
 ..D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZEL SEGMENT, SEQ 17",.ERRCOUNT)
 .S DGELG("AO")=$$CONVERT^DGENUPL1(SEG(18),"Y/N",.ERROR)
 .N AOERR S AOERR=ERROR            ;  See SEG(29) below.
 .I ERROR D  Q
 ..D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZEL SEGMENT, SEQ 18",.ERRCOUNT)
 .S DGELG("IR")=$$CONVERT^DGENUPL1(SEG(19),"Y/N",.ERROR)
 .I ERROR D  Q
 ..D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZEL SEGMENT, SEQ 19",.ERRCOUNT)
 .S DGELG("EC")=$$CONVERT^DGENUPL1(SEG(20),"Y/N",.ERROR)
 .I ERROR D  Q
 ..D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZEL SEGMENT, SEQ 20",.ERROR)
 .;
 .S DGELG("VACKAMT")=$$CONVERT^DGENUPL1(SEG(21))
 .;
 .;Parse MST data into DGMST array from sequences 23, 24, 25 of ZEL segment
 . S DGMST("MSTSTAT")=SEG(23)
 . S DGMST("MSTDT")=$$CONVERT^DGENUPL1(SEG(24),"TS",.ERROR)
 . I ERROR D  Q
 . . D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZEL SEGMENT, SEQ 24",.ERROR)
 . S DGMST("MSTST")=$$CONVERT^DGENUPL1(SEG(25),"INSTITUTION",.ERROR)
 . I ERROR D  Q
 . . D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZEL SEGMENT, SEQ 25",.ERROR)
 .;
 . S DGELG("AOEXPLOC")=SEG(29)
 .; Logic enhanced during SQA of patch 451.  AOERR from SEG(18) above.
 . I 'AOERR,DGELG("AO")'="Y",DGELG("AOEXPLOC")="" S DGELG("AOEXPLOC")="@"
 . S DGELG("UEYEAR")=$$CONVERT^DGENUPL1(SEG(34),"DATE",.ERROR)
 . I ERROR D  Q
 . . D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZEL SEGMENT, SEQ 34",.ERRCOUNT)
 . S DGELG("UESITE")=$$CONVERT^DGENUPL1(SEG(35),"INSTITUTION",.ERROR)
 . I ERROR D  Q
 . . D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZEL SEGMENT, SEQ 35",.ERRCOUNT)
 . S DGELG("CVELEDT")=$$CONVERT^DGENUPL1(SEG(38),"DATE",.ERROR)
 . I ERROR D  Q
 . . D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZEL SEGMENT, SEQ 38",.ERRCOUNT)
 . I $G(DGELG("DISLOD"))="" S DGELG("DISLOD")=$$CONVERT^DGENUPL1(SEG(39),"1/0",.ERROR) ;Discharge due to Disability - DG*5.3*672
 . I ERROR D  Q
 . . D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZEL SEGMENT, SEQ 39",.ERRCOUNT)
 ;
 I COUNT>1 D
 .S DGELG("ELIG","CODE",CODE)=""
 Q
 ;
OBX ;
 N OBXPCE,OBXVAL,OBXTBL,I,CS,SS,RS
 I $G(HLECH)'="~|\&" N HLECH S HLECH="~|\&"
 I $G(HLFS)="" N HLFS S HLFS="^"
 S CS=$E(HLECH,1),SS=$E(HLECH,4),RS=$E(HLECH,2)
 I $G(SEG(3))=("38.1"_$E(HLECH)_"SECURITY LOG") D
 . N LEVEL
 . S LEVEL=$P(SEG(5),$E(HLECH))
 . S DGSEC("LEVEL")=$$CONVERT^DGENUPL1(LEVEL,"1/0",.ERROR)
 . I ERROR D  Q
 . . D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, OBX SEGMENT, SEQ 5",.ERRCOUNT)
 . S DGSEC("SOURCE")=$$CONVERT^DGENUPL1(SEG(16))
 ;
 I $G(SEG(3))=("VISTA"_CS_"28.11") D
 . S OBXTBL(1)="NTR^Y",OBXTBL(2)="AVI^Y",OBXTBL(3)="SUB^Y"
 . S OBXTBL(4)="HNC^Y",OBXTBL(5)="NTR^N",OBXTBL(6)="AVI^N"
 . S OBXTBL(7)="SUB^N",OBXTBL(8)="HNC^N",OBXTBL(9)="NTR^U"
 . F I=1:1:$L($G(SEG(5)),RS) D
 . . S OBXPCE=$P($G(SEG(5)),RS,I),OBXVAL=$P($G(OBXPCE),CS)
 . . S DGNTR($P($G(OBXTBL(OBXVAL)),"^"))=$P($G(OBXTBL(OBXVAL)),"^",2)
 . I $G(SEG(12))'="" S DGNTR("HDT")=$$CONVERT^DGENUPL1(SEG(12),"TS",.ERROR)
 . S DGNTR("VDT")=$$CONVERT^DGENUPL1(SEG(14),"TS",.ERROR)
 . S DGNTR("VSIT")=$$CONVERT^DGENUPL1(SEG(15),"INSTITUTION",.ERROR)
 . S DGNTR("HSIT")=$P($P($G(SEG(16)),CS,14),SS,2)
 . I DGNTR("HSIT")'="" S DGNTR("HSIT")=$$CONVERT^DGENUPL1($G(DGNTR("HSIT")),"INSTITUTION",.ERROR)
 . S DGNTR("VER")=$P($G(SEG(17)),CS)
 Q
DISCONV(VAL,ERROR) ;
 ;DG*5.3*672 - Military Disability conversion to new values
 N DISRET
 S ERROR=0
 I VAL="" Q VAL
 I VAL="""""" S VAL="@" Q VAL
 I ((VAL="Y")!(VAL="N")) D  Q DISRET
 . S DISRET=$$CONVERT^DGENUPL1(VAL,"1/0",.ERROR)
 S (DISRET,DGELG("DISLOD"))=$S(VAL=0:0,VAL=1:1,VAL=2:1,VAL=3:0,1:"")
 I DISRET="" S ERROR=1 Q VAL
 Q DISRET
