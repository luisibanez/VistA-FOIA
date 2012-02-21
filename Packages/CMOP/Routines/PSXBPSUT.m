PSXBPSUT ;BIR/MFR - BPS (ECME) Utilities ;13 Mar 2002  10:31 AM
 ;;2.0;CMOP;**48**;11 Apr 97
 ;Reference to ^PS(52.5, supported by DBIA #1978
 ;
XMIT(REC) ; Checks if the prescription will be transmitted to CMOP or not
 ; Input:  REC  - Pointer to SUSPENSE file (#52.5)
 ; Output: XMIT - 0 - NO  /  1 - YES 
 N VADM,DFN,RX
 I '$D(^PS(52.5,REC,0)) Q 0
 I $P(^PS(52.5,REC,0),"^",7)="" Q 0
 S RX=$P($G(^PS(52.5,REC,0)),"^",1) I RX="" Q 0
 S DFN=$$GET1^DIQ(52,RX,2,"I") D DEM^VADPT I $G(VADM(6))'="" Q 0
 I ($P(^PS(52.5,REC,0),"^",3)'=XDFN) Q 0
 S DFN=$$GET1^DIQ(52,RX,2,"I") D DEM^VADPT I $G(VADM(6))'="" Q 0
 S PSXOK=0 D CHKDATA^PSXMISC1 I PSXOK Q 0
 Q 1
