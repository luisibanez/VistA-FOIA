DGENUPLB ;TDM - PROCESS INCOMING (Z11 EVENT TYPE) HL7 MESSAGES ; 10/26/04 2:01pm
 ;;5.3;REGISTRATION;**625**;Aug 13,1993
 ;
EP N MSGARY
 D CHECK,SNDMSG
 Q
 ;
CHECK ;Perform C&P and SC status checks and generate mailman messages
 ;for MCCR eligibility & billing staff.
 Q:'$D(OLDELG)
 N RDOCC,TMPARY,RD,RDOCC1,RDOCC2,RDFLG
 ;
 ;Change in SC Indicator
 I OLDELG("SC")'=DGELG("SC") D
 .Q:(OLDELG("SC")="")&(DGELG("SC")="N")
 .Q:(OLDELG("SC")="N")&(DGELG("SC")="")
 .D ADDMSG^DGENUPL3(.MSGARY,"VETERAN SC INDICATOR CHANGED",1)
 ;
 ;SC% change to 50% or greater
 I (OLDELG("SCPER")<50),(DGELG("SCPER")>49) D ADDMSG^DGENUPL3(.MSGARY,"VETERAN SC% CHANGED TO 50% OR GREATER",1)
 ;
 ;Change in VA Pension
 I OLDELG("VAPEN")'=DGELG("VAPEN") D
 .Q:(OLDELG("VAPEN")="")&(DGELG("VAPEN")="N")
 .Q:(OLDELG("VAPEN")="N")&(DGELG("VAPEN")="")
 .D ADDMSG^DGENUPL3(.MSGARY,"VETERAN VA PENSION CHANGED",1)
 ;
 ;Change in Rated Disabilities
 I $D(OLDELG("RATEDIS")) D
 .S RDOCC=0 F  S RDOCC=$O(OLDELG("RATEDIS",RDOCC)) Q:RDOCC=""  D
 ..S RD=$P(OLDELG("RATEDIS",RDOCC,"RD"),"^") Q:RD=""
 ..S TMPARY(RD)=RDOCC
 ;
 I $D(DGELG("RATEDIS")) D
 .S RDOCC=0 F  S RDOCC=$O(DGELG("RATEDIS",RDOCC)) Q:RDOCC=""  D
 ..S RD=$P(DGELG("RATEDIS",RDOCC,"RD"),"^") Q:RD=""
 ..S $P(TMPARY(RD),"^",2)=RDOCC
 ;
 I $D(TMPARY) D
 .S RD="",RDFLG=0
 .F  S RD=$O(TMPARY(RD)) Q:RD=""  D
 ..S RDOCC1=+$P(TMPARY(RD),"^"),RDOCC2=+$P(TMPARY(RD),"^",2)
 ..I $G(OLDELG("RATEDIS",RDOCC1,"RD"))'=$G(DGELG("RATEDIS",RDOCC2,"RD")) S RDFLG=1
 .I RDFLG D ADDMSG^DGENUPL3(.MSGARY,"VETERAN RATED DISABILITIES CHANGED",1)
 Q
 ;
SNDMSG ;Description: Send messages generated above to the G.IB MEANS TEST
 ;mail group.
 ;
 N TEXT,XMDUZ,XMTEXT,XMSUB,XMSTRIP,XMROU,XMY,XMZ,XMDF,COUNT
 N HEADER,NSC,POW,TMPSTR,XMGROUP,ELIG,CD
 ;
 ;if there are no alerts, then quit
 Q:'$D(MSGARY)
 S HEADER="C&P Alert: ",XMDF="",(XMDUN,XMDUZ)="Registration Enrollment Module"
 ;DGPAT("SSN") is built by the parser. DGPAT("NAME"),DGPAT("SEX"),DGPAT("DOB")(are merged into DGPAT from OLDPAT.
 ;The checks below are to setup the DGPAT elements from OLDPAT if NOTIFY is called before the merge.
 I '$D(DGPAT("NAME")) S DGPAT("NAME")=$G(OLDPAT("NAME"))
 I '$D(DGPAT("SEX")) S DGPAT("SEX")=$G(OLDPAT("SEX"))
 I '$D(DGPAT("DOB")) S DGPAT("DOB")=$G(OLDPAT("DOB"))
 S TMPSTR=" ("_$E(DGPAT("NAME"),1,1)
 S TMPSTR=TMPSTR_$E(DGPAT("SSN"),$L(DGPAT("SSN"))-3,1000)_")"
 S XMSUB=HEADER_$E(DGPAT("NAME"),1,25)_TMPSTR
 ;
 ; send msg to mail group in IB SITE PARAMETERS (#350.9) file
 S XMY("G.IB MEANS TEST")=""    ; Means Test billing Group
 ;
 S XMTEXT="TEXT("
 S TEXT(1)="The enrollment/eligibility upload produced the following alerts:"
 S TEXT(2)="  "
 S TEXT(3)="Patient Name   :     "_DGPAT("NAME")
 S TEXT(4)="SSN            :     "_DGPAT("SSN")
 S TEXT(5)="DOB            :     "_$$EXTERNAL^DILFD(2,$$FIELD^DGENPTA1("DOB"),"F",DGPAT("DOB"))
 S TEXT(6)="SEX            :     "_$$EXTERNAL^DILFD(2,$$FIELD^DGENPTA1("SEX"),"F",DGPAT("SEX"))
 S TEXT(7)=" "
 ;
 S TEXT(8)=" ** Alerts **"
 S TEXT(9)=" "
 S COUNT=0 F  S COUNT=$O(MSGARY(COUNT)) Q:'COUNT  S TEXT(10+COUNT)=COUNT_") "_MSGARY(COUNT)
 ;
 D ^XMD
 Q
