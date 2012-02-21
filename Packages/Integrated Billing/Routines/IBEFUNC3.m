IBEFUNC3 ;ALB/ARH - EXTRINSIC FUNCTIONS ;26-FEB-02
 ;;2.0;INTEGRATED BILLING;**174**;21-MAR-94
 ;
BDSRC(IBVIFN) ; Check if billable Visit Data Source (9000010,81203)
 ; only 'PROSTHETICS DATA' is non-billable (patch IB*2*174) (these are item, not visits)
 ; Input:   IBVIFN pointer to Visit (9000010)
 ; Returns: true if Billable Data Source
 N IBDS,IBDSN,IBFLG S IBDSN="",IBFLG=1
 ;
 I +$G(IBVIFN) S IBDS=$P($G(^AUPNVSIT(+IBVIFN,812)),U,3) I +IBDS S IBDSN=$P($G(^PX(839.7,+IBDS,0)),U,1) D
 . I IBDSN="PROSTHETICS DATA" S IBFLG=0
 Q IBFLG
