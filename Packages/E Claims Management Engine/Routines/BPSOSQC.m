BPSOSQC ;BHAM ISC/FCS/DRS/FLS - ECME background, Part 1 ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 ;External reference private DBIA 4303
 Q
 ;  GETPHARM, GETDIV, VISIT subroutines
 ;
GETPHARM ;EP -  given ABSBPDIV, ABSBSDIV, ABSBRXI, ABSBRXR
 S BPSHARM=0 ; want to set this value
 N SUB S SUB=$P("OPSITE^",U,ABSBSDIV) Q:SUB=""  ; which list to check
 N X S X=0 F  S X=$O(^BPS(9002313.56,X)) Q:'X  D  Q:BPSHARM
 . Q:'$D(^BPS(9002313.56,X,SUB,"B",ABSBPDIV))
 . N Y S Y=$O(^BPS(9002313.56,X,SUB,"B",ABSBPDIV,0))
 . S BPSHARM=X
 Q
GETDIV ;EP - Var setup: Given ABSBRXI, ABSBRXR, Set ABSBPDIV, ABSBSDIV
 S (ABSBSDIV,ABSBPDIV)=0 N X1,X
 I ABSBRXR D  ; if refill, get the (PRESCRIPTION,REFILL DATE,DIVISION)
 . S X=$P($G(^PSRX(ABSBRXI,1,ABSBRXR,0)),U,9)
 E  I ABSBRXI D  ; if not refill, get the (PRESCRIPTION,DIVISION)
 . S X=$P($G(^PSRX(ABSBRXI,2)),U,9)
 E  Q  ; must be a supply item - no prescription file entry
 ;       for supply item, leave division as 0, it's okay
 S ABSBPDIV=X ;$P($G(^PS(59,ABSBPDIV,0)),U,6) points to institution
 S ABSBSDIV=1 ; file 59 is where this points
 ;   $P(^PS(59,ABSBPDIV,"INI"),U) points to related institution
 I 'ABSBPDIV D  Q
 .D LOG^BPSOSL("DIVISION - Incorrect or missing for "_ABSBRXI_","_ABSBRXR) Q
 ; and a lot of early ANMC complexity deleted
 Q
VISIT ;EP -  Var setup:  pointers ^AUPNVSIT(ABSBVISI and ^AUPNVMED(VMEDDFN
 ; We assume that the visit is already created,
 ; we assume that the prescription is already entered,
 ; we assume that the PCC link is already created.
 ; Isn't VMEDDFN required for us?  Or is the prescription # good enough?
 ;  (have to look at claim assembly code to know for sure)
 ; ANMC tally as of 03/10/2000 5:15PM EST:
 ;   4675 found via PCC link;  0 found by date@12;  2 visits created
 ; So we don't really need or want all that extra baggage, do we?
 S ABSBVISI="",VMEDDFN=""
 N X
VIS1 ;get PCC link for last refill, if any; otherwise for first fill
 N LINKSRC,PCCLINK,RESULT
 ; Start by getting the appropriate PCC link
 I ABSBRXR D
 . S PCCLINK=$P($G(^PSRX(ABSBRXI,1,ABSBRXR,999999911)),U) ;refill
 . S LINKSRC="#"_ABSBRXR
 E  D
 . S PCCLINK=$P($G(^PSRX(ABSBRXI,999999911)),U) ;first fill
 . S LINKSRC="#0"
 S RESULT="VISIT - PCC LINK "_LINKSRC_"->"
VIS2 I PCCLINK D  ; yes, a PCC link was found
 .S VMEDDFN=PCCLINK ; remember IEN into V MEDICATION
 I 'ABSBVISI S RESULT=RESULT_":FAILURE"
 D LOG^BPSOSL(RESULT)
 D INCSTAT^BPSOSUD("V",$S(ABSBVISI:1,1:2)) ; 1 success, 2 failure
 Q
 ; - - - - - - - - - - - - -
