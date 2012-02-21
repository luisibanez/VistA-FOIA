MHVXRXR ;WAS/GPM - Prescription refill request ; [8/23/05 12:34am]
 ;;1.0;My HealtheVet;;Aug 23, 2005
 ;;Per VHA Directive 2004-038, this routine should not be modified.
 ;
 Q
 ;
REQUEST(QRY,ERR,DATAROOT) ; Entry point to extract appointment data
 ; Retrieves requested appointment data and returns it in DATAROOT
 ;
 ;  Integration Agreements:
 ;         3768 : AP1^PSOPRA
 ;
 ;  Input:
 ;       QRY - Query array
 ;          QRY(DFN) - (required) Pointer to PATIENT (#2) file
 ;  DATAROOT - Root of array to hold extract data
 ;
 ;  Output:
 ;  DATAROOT - Populated data array, includes # of hits
 ;       ERR - Errors during extraction
 ;
 N CNT,RX,PORDERN,ORDERTM,STATUS,DIV,DFN,U
 ;
 D LOG^MHV7U("MHVXRXR","BEGIN","S",0)
 S U="^"
 S ERR=0
 K @DATAROOT
 S DFN=$G(QRY("DFN"))
 ;
 F CNT=1:1 Q:'$D(QRY("RX",CNT))  D
 . S RX=$G(QRY("RX",CNT))
 . S PORDERN=$P(RX,"^",2)
 . S ORDERTM=$P(RX,"^",3)
 . S RX=$P(RX,"^")
 . S STATUS=$$AP1^PSOPRA(DFN,RX)
 . S @DATAROOT@(CNT)=RX_U_STATUS_U_PORDERN_U_ORDERTM
 . Q
 ;
 S @DATAROOT=CNT-1
 D LOG^MHV7U("MHVXRXR","END","S",0)
 Q
