IVMPTRNA ;ALB/CKN/BRM - HL7 FULL DATA TRANSMISSION (Z07) BUILDER(CONTINUED);30 AUG 2001 ; 3/20/03 11:07am
 ;;2.0;INCOME VERIFICATION MATCH;**46,58,76**; 21-OCT-94
 Q
NTROBX(DGNTARR) ;
 N NTRTEMP,I,CS,RS,SS
 I $G(HLECH)'="~|\&" N HLECH S HLECH="~|\&"
 I $G(HLFS)'="^" N HLFS S HLFS="^"
 S CS=$E(HLECH,1),SS=$E(HLECH,4),RS=$E(HLECH,2)
 S NTRTEMP("NTR","Y")="1"_CS_"Received NTR Trmt"_CS_"VA0053"
 S NTRTEMP("AVI","Y")="2"_CS_"Aviator Pre 1955"_CS_"VA0053"
 S NTRTEMP("SUB","Y")="3"_CS_"Sub Trainee pre 1965"_CS_"VA0053"
 S NTRTEMP("HNC","Y")="4"_CS_"Dx With Head Neck Cancer"_CS_"VA0053"
 S NTRTEMP("NTR","N")="5"_CS_"No NTR Trmt"_CS_"VA0053"
 S NTRTEMP("AVI","N")="6"_CS_"Not Aviator Pre 1955"_CS_"VA0053"
 S NTRTEMP("SUB","N")="7"_CS_"Not Sub Trainee pre 1965"_CS_"VA0053"
 S NTRTEMP("HNC","N")="8"_CS_"Not Dx With Head Neck Cancer"_CS_"VA0053"
 S NTRTEMP("NTR","U")="9"_CS_"NTR Trmt Unknown"_CS_"VA0053"
 S NTRTEMP("VER","M")="M"_CS_"Military Med Rec"_CS_"VA0052"
 S NTRTEMP("VER","S")="S"_CS_"Qual Military Srvc"_CS_"VA0052"
 S NTRTEMP("VER","N")="N"_CS_"Not Qualified"_CS_"VA0052"
 S NTROBX(2)="CE",NTROBX(3)="VISTA"_CS_"28.11"
 S NTROBX(5)=""
 F I="NTR","AVI","SUB","HNC" D
 . I $G(DGNTARR(I))="" Q
 . I NTROBX(5)'="" S NTROBX(5)=$G(NTROBX(5))_RS
 . S NTROBX(5)=$G(NTROBX(5))_$G(NTRTEMP(I,$G(DGNTARR(I))))
 S NTROBX(11)="F"
 S NTROBX(12)=$G(DGNTARR("HDT"))
 S NTROBX(14)=$G(DGNTARR("VDT"))
 I $G(DGNTARR("VSIT"))'="" D
 . S NTROBX(15)=$P($G(^DIC(4,DGNTARR("VSIT"),99)),"^")
 S NTROBX(16)=""
 I $G(DGNTARR("HSIT"))'="" D
 . S $P(NTROBX(16),CS,14)=SS_$P($G(^DIC(4,DGNTARR("HSIT"),99)),"^")
 I $G(DGNTARR("VER"))'="" S NTROBX(17)=$G(NTRTEMP("VER",$G(DGNTARR("VER"))))
 Q
RF1(DFN) ; create RF1 segment
 N X,Y,ADDRSRC,ADRSRC,ADRSIT,ADTDT,I,CS,RS,SS,RETURN,RFDAT,ERR
 I $G(HLECH)'="~|\&" N HLECH S HLECH="~|\&"
 I $G(HLFS)'="^" N HLFS S HLFS="^"
 S CS=$E(HLECH,1),SS=$E(HLECH,4),RS=$E(HLECH,2)
 ; initialize the RETURN variable
 S RETURN="RF1",$P(RETURN,HLFS,11)=""
 Q:'$G(DFN) RETURN
 Q:$$BADADR^DGUTL3(DFN) RETURN
 ; get patient data to be used in this message
 D GETS^DIQ(2,DFN_",",".118;.119;.12","IE","RFDAT","ERR")
 Q:$D(ERR) RETURN
 S ADRDT=$$FMTHL7^XLFDT($G(RFDAT(2,DFN_",",.118,"I")))
 S ADRSRC=$$EXTERNAL^DILFD(2,.119,"",$G(RFDAT(2,DFN_",",.119,"I")))
 ; only populate the Address Change Site if the Source = VAMC
 I ADRSRC="VAMC" S ADRSIT=$G(RFDAT(2,DFN_",",.12,"I")) S:ADRSIT]"" ADRSIT=$$GET1^DIQ(4,ADRSIT_",",99)
 S ADRSRC=$$ADDRCNV(ADRSRC)  ;convert source to HL7 format
 ; RF1 SEQ 1-5 are not currently used
 ; RF1 SEQ 6
 S $P(RETURN,HLFS,7)=$G(ADRSIT)_CS_$G(ADRSRC)
 ; RF1 SEQ 7
 S $P(RETURN,HLFS,8)=$G(ADRDT)
 ; RF1 SEQ 8-11 are not currently used
 ; quit with completed RF1 segment
 Q RETURN
 ;
ADDRCNV(ADDRSRC) ;convert Address Source to HL7 format
 Q:$G(ADDRSRC)']"" ""
 Q:ADDRSRC="HEC" "USVAHEC"
 Q:ADDRSRC="VAMC" "USVAMC"
 Q:ADDRSRC="HBSC" "USVAHBSC"
 Q:ADDRSRC="NCOA" "USNCOA"
 Q:ADDRSRC="BVA" "USVABVA"
 Q:ADDRSRC="VAINS" "USVAINS"
 Q:ADDRSRC="USPS" "USPS"
 Q ""
