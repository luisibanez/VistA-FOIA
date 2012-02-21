IVMCMF1 ;ALB/RMM - CHECK ANNUAL INCOME DATA ; 04/28/2005
 ;;2.0;INCOME VERIFICATION MATCH;**71,82,107**;21-OCT-94
 ;
 ; This routine is called from IVMCMF.
 ;
 ;
ZIC(STRING,DEPIEN) ; Check validity of ZIC segment
 ;
 ; Input:  STRING as ZIC segment
 ;         DEPIEN as the IEN of the dependent in the array, if applicable
 ;
 N X S X=$P(STRING,HLFS,2)
 I $G(DEPIEN) I DEPIEN'=SPOUSE D
 .I $P(STRING,HLFS,15)>0 S X=$P(^DG(43,1,"MT",(X-17000000),0),U,17) I X'<$P(STRING,HLFS,9) S CNT=CNT+1,IVMERR(CNT)="Income does not exceed child exclusion amount-educational expense not allowed"
ZICQ Q
 ;
ZIR(STRING,DEPIEN) ; Check validity of ZIR segment
 ;
 ; Input:  STRING as ZIR segment
 ;         DEPIEN as the IEN of the dependent in the array, if applicable
 ;
 N I,FND1
 I '$G(DEPIEN) D
 .I '$P(STRING,HLFS,3),SPOUSE,($P(STRING,HLFS,4)<600) S FND1=0 F I=3:1:20 Q:FND1  I $P(ARRAY(SPOUSE,"ZIC"),HLFS,I) S FND1=1,CNT=CNT+1,IVMERR(CNT)="No income data allowed if spouse didn't live w/vet & amt contributed <$600"
 I $G(DEPIEN),(DEPIEN'=SPOUSE) D
 .I '$P(STRING,HLFS,8) S FND1=0 F I=3:1:20 Q:FND1  I $P(ARRAY(DEPIEN,"ZIC"),HLFS,I) S CNT=CNT+1,IVMERR(CNT)="Shouldn't have income data if Child Had Income is NO",FND1=1
ZIRQ Q
