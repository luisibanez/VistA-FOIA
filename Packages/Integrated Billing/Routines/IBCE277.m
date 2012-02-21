IBCE277 ;ALB/TMP - 277 EDI CLAIM STATUS MESSAGE PROCESSING ;15-JUL-98
 ;;2.0;INTEGRATED BILLING;**137,155**;21-MAR-94
 Q
 ; MESSAGE HEADER DATA STRING =
 ;   type of message^msg queue^msg #^bill #^REF NUM/Batch #^date/time
 ;
HDR(ENTITY,ENTVAL,IBTYPE,IBD) ;Process header data
 ; INPUT:
 ;   ENTITY = "BATCH" if batch level message
 ;            "CLAIM" if claim level message
 ;   ENTVAL = batch # or claim #
 ;   IBTYPE = the type of status msg this piece of the message represents
 ;             (837REC1, 837REJ1)
 ;   ^TMP("IBMSGH",$J,0) = header message text
 ;
 ; OUTPUT:
 ;   IBD array returned with processed data
 ;      "LINE" = The last line # populated in the message
 ;      "DATE" = Date/Time of status (Fileman format)
 ;      "MRA" =  1 if MRA, 0 if not         "X12" = 1 if X12, 0 if not
 ;      "BATCH" = Batch ien for batch level calls
 ;      "SOURCE" = Source of message code^source name, if known
 ;
 ;   ^TMP("IBMSG",$J,"BATCH",batch #,0)=MESSAGE HEADER DATA STRING
 ;                                      if called from batch level
 ;                                  ,"D",0,1)=header record raw data
 ;                                  ,line #)=batch status message lines
 ;
 ;   ^TMP("IBMSG",$J,"CLAIM",claim #,0)=MESSAGE HEADER DATA STRING
 ;                                      if called from claim level
 ;                                  ,"D",0,1)=header record raw data
 ;                                  ,line #)=claim status message lines
 ;
 N CT,CT1,IBBILL,IBD0,L,LINE,PC,Z,X,Y
 S IBD0=$G(^TMP("IBMSGH",$J,0)),IBD("LINE")=0
 Q:IBD0=""
 S Y=0,X=$$DATE($P(IBD0,U,3))_"@"_$E($P(IBD0,U,4)_"0000",1,4)
 I X S %DT="XTS" D ^%DT
 S IBD("DATE")=$S(Y>0:Y,1:"")
 S IBD("MRA")=$P(IBD0,U,5),IBD("X12")=($P(IBD0,U,2)="X")
 S IBD("SOURCE")=$P(IBD0,U,12,13)
 S CT=0
 ;
 I ENTITY="BATCH",ENTVAL'="" D  ;Only pertinent for batch level extract
 . S IBD("BATCH")=$O(^IBA(364.1,"B",ENTVAL,0))
 . F PC=6:1:9 D
 .. I $P(IBD0,U,PC)'="" S DATA=$P("# Claims Submitted^# Claims Rejected^Total Charges Submitted^Total Charges Rejected",U,PC-5)_": "_$S(PC<8:+$P(IBD0,U,PC),1:$FNUMBER($P(IBD0,U,PC)/100,"",2))_"  "
 .. I CT,$L($G(LINE(CT)))+$L(DATA)>80 S CT=CT+1
 .. S:'CT CT=1 S LINE(CT)=$G(LINE(CT))_DATA
 ;
 I ENTVAL'="",$TR($P(IBD0,U,10,13),U)'="" S CT1=CT,CT=CT+1 F PC=10,11,12 D  ;Both batch, claim levels extract
 . Q:$P(IBD0,U,PC)=""
 . I PC<12 S LINE(CT)=$G(LINE(CT))_$P("Payer Name^Payer ID",U,PC-9)_": "_$P(IBD0,U,PC)_"  ",CT1=CT Q
 . I $P(IBD0,U,12)'=""!($P(IBD0,U,13)'="") S:$P(IBD0,U,10)'=""!($P(IBD0,U,11)'="") CT=CT+1 S LINE(CT)="Source: "_$S($P(IBD0,U,12)="Y":"Sent by payer",$P(IBD0,U,13)'="":"Sent by non-payer ("_$P(IBD0,U,13)_")",1:"UNKNOWN")_"  "
 ;
 I CT D
 . S (L,Z)=0
 . F  S Z=$O(LINE(Z)) Q:'Z  S L=L+1,^TMP("IBMSG-H",$J,ENTITY,ENTVAL,L)=LINE(Z)
 . ;S IBD("LINE")=$G(IBD("LINE"))+CT
 ;
 I ENTITY="CLAIM" D
 . N Z0
 . S Z0=+$O(^DGCR(399,"B",ENTVAL,0))
 . I $G(IBD("BATCH")) S IBBILL=$O(^IBA(364,"ABABI",+$G(IBD("BATCH")),Z0,""),-1) Q
 . S IBBILL=$$LAST364^IBCEF4(Z0)
 S ^TMP("IBMSG",$J,ENTITY,ENTVAL,0)=IBTYPE_U_$G(IBD("MSG#"))_U_$G(IBD("SUBJ"))_U_$S(ENTITY="CLAIM":IBBILL,1:"")_U_$S(ENTITY="BATCH":ENTVAL,1:"")_U_IBD("DATE")_U_IBD("SOURCE")
 ;
 S ^TMP("IBMSG",$J,ENTITY,ENTVAL,"D",0,1)="##RAW DATA: "_IBD0
 Q
 ;
5(IBD) ; Process batch status data
 ; INPUT:
 ;   IBD must be passed by reference = entire message line
 ; OUTPUT:
 ;   IBD array returned with processed data
 ;      "LINE" = The last line # populated in the message
 ;
 ;   ^TMP("IBMSG",$J,"BATCH",batch #,line#)=batch status message lines
 ;                                  ,"D",5,msg seq #)=
 ;                                       batch status message raw data
 ;
 N CT,DATA,IBBTCH,IBTYPE,L,LINE,Z
 K ^TMP("IBCONF",$J)
 S IBBTCH=+$P(IBD,U,2)
 S IBTYPE=$S($P(IBD,U,3)="R":"837REJ1",1:"837REC1")
 I '$D(^TMP("IBMSG",$J,"BATCH",IBBTCH)) D HDR("BATCH",IBBTCH,IBTYPE,.IBD) ;Process header data if not already done for batch
 S CT=0,LINE(1)=""
 S DATA=$P(IBD,U,4)
 I DATA'="",$TR($P(IBD,U,5,7),U)'="" D
 . Q:$G(^TMP("IBMSG",$J,"BATCH",IBBTCH))=DATA
 . S:'CT CT=CT+1 S LINE(CT)=$G(LINE(CT))_$S(DATA="W":"Warning",DATA="E":"Error",1:"Informational")_"  "
 S ^TMP("IBMSG",$J,"BATCH",IBBTCH)=DATA
 I $P(IBD,U,5)'="" S:'CT CT=CT+1 S LINE(CT)=$G(LINE(CT))_"Code: "_$P(IBD,U,5)
 I $P(IBD,U,6)'="" S:'CT CT=CT+1 S LINE(CT)=$G(LINE(CT))_"  "_$P(IBD,U,6),CT=CT+1
 I $P(IBD,U,7)'="" S:'CT CT=CT+1 S LINE(CT)=$G(LINE(CT))_"  "_$P(IBD,U,7)
 I CT D
 . S L=$G(IBD("LINE")),Z=0
 . F  S Z=$O(LINE(Z)) Q:'Z  S L=L+1,^TMP("IBMSG",$J,"BATCH",IBBTCH,L)=LINE(Z)
 . S ^TMP("IBMSG",$J,"BATCH",IBBTCH,"D",5,$O(^TMP("IBMSG",$J,"BATCH",IBBTCH,"D",5,""),-1)+1)="##RAW DATA: "_IBD
 . S IBD("LINE")=$G(IBD("LINE"))+CT
 Q
 ;
10(IBD) ; Process claim status data
 ; INPUT:
 ;   IBD must be passed by reference = entire message line
 ; OUTPUT:
 ;   IBD array returned with processed data
 ;      "CLAIM" = The claim #
 ;      "LINE" = The last line # populated in the message
 ;
 ;   ^TMP("IBMSG",$J,"CLAIM",claim #,line#)=claim status message lines
 ;                                  ,"D",10,msg seq #)=
 ;                                       claim status raw data
 ;   ^TMP("IBCONF",$J,claim #")="" for invalid claims within the batch
 ;
 N CT,DATA,IBCLM,IBTYPE,L,LINE,Z
 S IBCLM=$$GETCLM($P(IBD,U,2))
 Q:IBCLM=""
 S:$P(IBD,U,3)="R" ^TMP("IBCONF",$J,+$O(^DGCR(399,"B",IBCLM,0)))=""
 S IBTYPE=$S($P(IBD,U,3)="R":"837REJ1",1:"837REC1")
 I '$D(^TMP("IBMSG",$J,"CLAIM",IBCLM)) D HDR("CLAIM",IBCLM,IBTYPE,.IBD) ;Process header data if not already done for claim
 I IBTYPE="837REJ1",$P($G(^TMP("IBMSG",$J,"CLAIM",IBCLM,0)),U,1)'="837REJ1" D HDR("CLAIM",IBCLM,IBTYPE,.IBD)
 S CT=0,DATA=$P(IBD,U,4)
 I DATA'="",$TR($P(IBD,U,5,7),U)'="" D
 . Q:$G(^TMP("IBMSG",$J,"CLAIM",IBCLM))=DATA
 . S ^TMP("IBMSG",$J,"CLAIM",IBCLM)=DATA
 . S CT=CT+1,LINE(CT)=$G(LINE(CT))_$S(DATA="W":"Warning",DATA="E":"Error",1:"Informational")_"  "
 I $P(IBD,U,5)'="" S CT=$S('CT:1,1:CT),LINE(CT)=$G(LINE(CT))_"Code: "_$P(IBD,U,5)
 I $P(IBD,U,6)'="" S CT=$S('CT:1,1:CT),LINE(CT)=$G(LINE(CT))_"  "_$P(IBD,U,6)
 I $P(IBD,U,7)'="" S CT=CT+1,LINE(CT)="  "_$P(IBD,U,7)
 I CT D
 . S L=$G(IBD("LINE")),Z=0
 . F  S Z=$O(LINE(Z)) Q:'Z  S L=L+1,^TMP("IBMSG",$J,"CLAIM",IBCLM,L)=LINE(Z)
 . S ^TMP("IBMSG",$J,"CLAIM",IBCLM,"D",10,$O(^TMP("IBMSG",$J,"CLAIM",IBCLM,"D",10,""),-1)+1)="##RAW DATA: "_IBD
 . S IBD("LINE")=$G(IBD("LINE"))+CT
 Q
 ;
15(IBD) ; Process subscriber/patient data
 ; Claim must have been referenced by a previous '10' level
 ; INPUT:
 ;   IBD must be passed by reference = entire message line
 ;
 ; OUTPUT:
 ;      IBD("LINE") = The last line # populated in the message
 ;
 ;     ^TMP("IBMSG",$J,"CLAIM",claim #,line#)=formatted service dates
 ;                                    ,"D",15,msg seq #)=
 ;                                         subscr/patient raw data
 ;
 N CT,Z,L,LINE,DATA,IBCLM,IBNM,IBNUM,IBDFN
 S IBCLM=$$GETCLM($P(IBD,U,2)),CT=0,L=$G(IBD("LINE"))
 Q:$S(IBCLM="":1,1:'$D(^TMP("IBMSG",$J,"CLAIM",IBCLM)))
 S IBDFN=+$G(^DGCR(+$O(^DGCR(399,"B",IBCLM,0)),0))
 S IBNM=$S($P(IBD,U,3)'="":$P(IBD,U,3)_","_$P(IBD,U,4)_$S($P(IBD,U,5)'="":" "_$P(IBD,U,5),1:""),1:$P($G(^DPT(IBDFN,0)),U))
 S IBNUM=$S($P(IBD,U,6)'="":$P(IBD,U,6),1:$P($G(^DPT(IBDFN,0)),U,9))
 S CT=CT+1,LINE(CT)="Patient: "_IBNM_"   "_IBNUM
 I $P(IBD,U,11) D
 . S DATA=$$DATE($P(IBD,U,11)),CT=CT+1
 . S LINE(CT)="Service Dates: "_DATA_" - "_$S($P(IBD,U,12):$$DATE($P(IBD,U,12)),1:DATA)_"  "
 . ; Add additional lines of display data here for record 15
 S Z=0 F  S Z=$O(LINE(Z)) Q:'Z  S L=L+1,^TMP("IBMSG",$J,"CLAIM",IBCLM,L)=LINE(Z)
 S ^TMP("IBMSG",$J,"CLAIM",IBCLM,"D",15,$O(^TMP("IBMSG",$J,"CLAIM",IBCLM,"D",15,""),-1)+1)="##RAW DATA: "_IBD
 S IBD("LINE")=$G(IBD("LINE"))+CT
 Q
 ;
20(IBD) ; Process service line status data
 ; Claim must have been referenced by a previous '10' level
 ; INPUT:
 ;   IBD must be passed by reference = entire message line
 ; OUTPUT:
 ;   IBD array returned with processed data
 ;      "LINE" = The last line # populated in the message
 ;      "TYPE" = The msg type of status record (Confirmation/rejection)
 ;             Note: returned if not already set at batch or claim level
 ;
 ;   ^TMP("IBMSG",$J,"CLAIM",claim #)=""
 ;                                  ,line#)=service line status msg lines
 ;                                  ,"D",20,msg seq #)=
 ;                                       service line status raw data
 ;
 N CT,DATA,L,LINE,Z,IBCLM,IBLNUM
 S IBCLM=$$GETCLM($P(IBD,U,2)),IBLNUM=$P(IBD,U,8)
 Q:'$D(^TMP("IBMSG",$J,"CLAIM",IBCLM))
 S CT=0
 I IBLNUM'="" S CT=CT+1,LINE(CT)="Claim Line: "_IBLNUM,^TMP("IBMSG",$J,"LINE",IBCLM,IBLNUM)=""
 S DATA=$P(IBD,U,4)
 I DATA'="",$TR($P(IBD,U,5,7),U)'="" S:'CT CT=CT+1 S LINE(CT)=$S(DATA="W":"Warning",DATA="E":"Error",1:"Informational")_"  "_$G(LINE(CT))
 S:$G(IBD("TYPE"))="" IBD("TYPE")=$S(DATA="E":"837REJ1",1:"837REC1")
 I $P(IBD,U,5)'="" S:'CT CT=CT+1 S LINE(CT)=LINE(CT)_$P(IBD,U,5)
 I $P(IBD,U,6)'="" S CT=CT+1,LINE(CT)="  "_$P(IBD,U,6)
 I $P(IBD,U,7)'="" S CT=CT+1,LINE(CT)="  "_$P(IBD,U,7)
 I CT D
 . S L=$G(IBD("LINE")),Z=0
 . F  S Z=$O(LINE(Z)) Q:'Z  S L=L+1,^TMP("IBMSG",$J,"CLAIM",IBCLM,L)=LINE(Z)
 . S ^TMP("IBMSG",$J,"CLAIM",IBCLM,"D",20,$O(^TMP("IBMSG",$J,"CLAIM",IBCLM,"D",20,""),-1)+1)="##RAW DATA: "_IBD
 . S IBD("LINE")=$G(IBD("LINE"))+CT
 Q
 ;
21(IBD) ; Process service line ID data
 ; Moved for size too big
 D 21^IBCE277A(IBD)
 Q
 ;
DATE(DT) ; Convert YYMMDD Date into MM/DD/YY or YYYYMMDD into MM/DD/YYYY
 N D,Y
 S D=DT,Y=""
 I $L(DT)=8 S D=$E(DT,3,8),Y=$E(DT,1,2)
 Q ($E(D,3,4)_"/"_$E(D,5,6)_"/"_Y_$E(D,1,2))
 ;
GETCLM(X) ; Extract the claim # without site id from the data in X
 N IBCLM
 S IBCLM=$P(X,"-",2)
 I IBCLM="",X'="" S IBCLM=$E(X,$S($L(X)>7:4,1:1),$L(X))
 ;S IBCLM=$E(X,$L(IBCLM)-6,$L(IBCLM)) ; Only take last 7 char
 Q IBCLM
 ;
