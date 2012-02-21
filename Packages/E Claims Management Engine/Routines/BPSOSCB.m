BPSOSCB ;BHAM ISC/FCS/DRS/DLF - VMEDS(*) prep for BPS(*) ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 ;----------------------------------------------------------------------
 ;----------------------------------------------------------------------
 ; Called from BPSOSCA from BPSOSQG from BPSOSQ2
 ;Setup BPS() array which contains all pertinent data to create
 ;Claim Submission Records for the current Billing Item Record:
 ;
 ;Parameters:  DIALOUT   - Dial-out (9002313.55)
 ;            .BPS      - Formatted array containing data required
 ;                         to create claim submission records
 ;----------------------------------------------------------------------
 ;
 Q
BPS(DIALOUT,BPS) ;EP
 I '$P($G(^BPS(9002313.99,1,"SITE TYPE")),"^",1) S VARX=1  ;LJE
 I $D(RXILIST)<10 D IMPOSS^BPSOSUE("P","TI","bad RXILIST",,,$T(+0))
 N PATIEN,VMEDS,NMEDS,INSURER,INSPINS,VSTIEN,INDEX
 D  ; set up some vars and make very sure some basic data exists
 . N RXI,R0,R1 S RXI=$O(RXILIST(""))
 . S R0=^BPST(RXI,0),R1=^(1)
 . S PATIEN=$P(R0,U,6)
 . S VSTIEN=$P(R0,U,7)
 . S INSURER=$P(R1,U,6)
 . I $P($G(^BPS(9002313.99,1,"SITE TYPE")),"^",1) S INSPINS=$P(R1,U,8),INSPINS=$P(^BPST(RXI,6),U,INSPINS) ;LJE;6/30/03
 . E  D
 . . S INSPINS="VA3PTY"_","_RXI_","_^BPST(RXI,9),INSURER=^BPST(RXI,10,$P(INSPINS,",",3),0)  ;LJE;6/30/03
 . . K VAINFO D GETS^DIQ(9002313.59,RXI_",","902*","I","VAINFO") ;LJE;6/30/03; get all IB passed data
 . . S CERTIFY=VAINFO(9002313.59902,"1,"_RXI_",",902.22,"I")
 . I 'PATIEN D IMPOSS^BPSOSUE("DB","TI","PATIEN",,,$T(+0))
 . I '$D(^DPT(PATIEN,0)) D IMPOSS^BPSOSUE("DB","TI","^DPT(PATIEN)",,,$T(+0))
 . I $P($G(^BPS(9002313.99,1,"SITE TYPE")),"^",1) D      ;LJE;06/30/03
 . . I 'VSTIEN D IMPOSS^BPSOSUE("DB","TI","VSTIEN",,,$T(+0))
 ;
E ;Set up VMEDS(*)=a bunch of pointers to important stuff
 ; Somewhat vestigial but for now, it survives.
 D GETVMED(.VMEDS)
 I '$D(VMEDS) Q 551
 I 'VMEDS(0) Q 553
 ;
 ;Get general info and set up BPS array for Patient, Insurer, Site and
 ;NCPDP record format data 
 D GETINFO^BPSOSCC(DIALOUT,PATIEN,VSTIEN,INSPINS,INSURER,.VAINFO)
 ;
 ;Determine number of mediations returned from GetInfo procedure
 S NMEDS=+$G(VMEDS(0))
 S BPS("RX",0)=NMEDS
 Q:NMEDS=0 552
L ;Get medication and prescription data for each medication
 F INDEX=1:1:NMEDS D MEDINFO^BPSOSCD(VMEDS(INDEX),INDEX,INSPINS)
 I ^BPS(9002313.99,1,"CERTIFIER")=DUZ S ENTRY=VAINFO(9002313.59902,"1,"_IEN59_",",902.23,"I") I ENTRY,($D(^BPS(9002313.31,ENTRY))) D SETBPS^BPSOSC2(ENTRY)
 K VAINSDA,VAINSDA1,VAINFO ;LJE
 Q 0
 ;----------------------------------------------------------------------
 ;Setup VMEDS() array, which contains medication and prescription data
 ;for each medication in the billing items record:
 ;
 ;            .VMEDS     - Array of V Medication IEN #s (9000010.14)
 ;                         VMEDS(0) = <Total Number>
 ;                         VMEDS(N) = $P=1 --> <V Medication IEN>
 ;                                    $P=2 --> <RXIEN>
 ;                                    $P=3 --> <RXRFIEN>
 ;                                    $P=4 --> <VCPTIEN>
 ;                                    $P=5 --> pointer to 9002313.59
 ;----------------------------------------------------------------------
GETVMED(VMEDS) ;
 ;Manage local variables
 N NEXT,COUNT,RXIEN,RXRFIEN,VMEDIEN,VCPTIEN,ABSBRXI
 ;
 ;Loop:  RXILIST(*) -> VMED(*)
 ;
 S (NEXT,COUNT)=0
 F  D  Q:'NEXT
 .S NEXT=$O(RXILIST(NEXT)) Q:'NEXT
 .S ABSBRXI=NEXT
 .N R0,R1 S R0=^BPST(ABSBRXI,0),R1=^(1)
 .S VMEDIEN="" ; don't know, don't care
 .S RXIEN=$P(R1,U,11) I 'RXIEN D IMPOSS^BPSOSUE("DB","TI","RXIEN",,"GETVMED",$T(+0))
 .S RXRFIEN=$P(R1,U,1) I RXRFIEN="" D IMPOSS^BPSOSUE("DB","TI","RXRFIEN",,"GETVMED",$T(+0))
 .S VCPTIEN=$P(R1,U,3)
 .S COUNT=COUNT+1
 .S VMEDS(COUNT)=VMEDIEN_U_RXIEN_U_RXRFIEN_U_VCPTIEN_U_ABSBRXI
 ;
 S VMEDS(0)=COUNT
 Q
