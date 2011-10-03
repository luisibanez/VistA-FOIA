SROERR0 ;B'HAM ISC/ADM - ORDER ENTRY ROUTINE ;02/03/05
 ;;3.0; Surgery ;**4,67,73,41,86,107,147,144**;24 Jun 93
 ;
 ; Reference to RETURN^ORX supported by DBIA #866
 ; Reference to ^TMP("CSLSUR1" supported by DBIA #3498
 ; Reference to UPD^VPRSR supported by DBIA #4750
 ;
 N SROP,SROPER,SRDYNOTE,SRTYPE S SRTYPE=0
 I $P($G(^SRO(133,SRSITE,0)),"^",22)="Y",$D(^TMP("CSLSUR1",$J)) D
 .S SROP=SROERR,SROPER="" D ^SROP1 S SRDYNOTE=$P($G(^SRF(SROERR,31)),"^",10)
 .I SROPER["REQUESTED",'SRDYNOTE Q
 .I SROPER["CANCELLED"!(SROPER["ABORTED") S SRTYPE=3
 .I 'SRTYPE,'SRDYNOTE S SRTYPE=1
 .I 'SRTYPE,SRDYNOTE=1 S SRTYPE=2
 .I '$P($G(^SRF(SROERR,.2)),"^",10),'$P($G(^SRF(SROERR,"OP")),"^",2) D
 ..W !!,"  This Surgery case does not have a Principal CPT Code entered. The ",!,"  information sent to SPD for creation of a case cart may not contain ",!,"  enough information for processing."
 .D ST^SRSCOR(SROERR)
 D SERR^SROPFSS(SROERR,"SROERR0")
 D STATUS
 I '$D(SREVENT) N SREVENT S SREVENT=$S(SRSTATUS="(CANCELLED)":"S15",1:"S14")
 D MSG^SRHLZIU(SROERR,SRSTATUS,SREVENT)
 I SRSTATUS="(COMPLETED)"!(SRSTATUS="(NOT COMPLETE)")!(SRSTATUS="(ABORTED)") D MSG^SRHLOORU(SROERR,SRSTATUS,SREVENT)
 I $L($T(UPD^VPRSR)) D UPD^VPRSR(SROERR,$G(DFN),SRSTATUS) Q  ;CPRS-R
 I +$$VERSION^XPDUTL("ORDER ENTRY/RESULTS REPORTING")>2.5 D END Q
 S:'$G(ORIFN) ORIFN=$P(^SRF(SROERR,0),"^",14) I 'ORIFN K ORIFN D END Q
 S ORNP=$S($P($G(^SRF(SROERR,"NON")),"^")="Y":$P(^("NON"),"^",6),1:$P(^(.1),"^",4)),SRSOP=$P(^("OP"),"^")
 S ORTX=SRSOP_"|>> Case #"_SROERR_" "_SRSTATUS,ORSTRT=$P(^SRF(SROERR,0),"^",9)
 I DT<$E(ORSTRT,1,7) S X1=ORSTRT,X2=DT D ^%DTC S ORPURG=X+30
 D RETURN^ORX
END K SROERR
 Q
STATUS ; case status
 I $P($G(^SRF(SROERR,"NON")),"^")="Y" S:+$$VERSION^XPDUTL("ORDER ENTRY/RESULTS REPORTING")>2.5 ORSTS=2 S SRSTATUS=$S($P($G(^(30)),"^"):"(ABORTED)",$P($G(^("NON")),"^",5):"(COMPLETED)",1:"(NOT COMPLETE)") Q
 I $P($G(^SRF(SROERR,30)),"^")'="" D CAN Q
 I $P($G(^SRF(SROERR,31)),"^",8)'="" D CAN Q
 I $P($G(^SRF(SROERR,.2)),"^",12) S:+$$VERSION^XPDUTL("ORDER ENTRY/RESULTS REPORTING")>2.5 ORSTS=2 S SRSTATUS="(COMPLETED)" Q
 I $D(^SRF(SROERR,.2)),$P(^(.2),"^",12)="" S SRSTAT=0 D SCH I SRST=0 D REQ Q:SRST  G NO
 I '$D(^SRF(SROERR,.2)) S SRSTAT=0 D SCH I SRST=0 D REQ Q:SRST=1  G NO
 Q
NO ; not requested or scheduled
 I +$$VERSION^XPDUTL("ORDER ENTRY/RESULTS REPORTING")>2.5 S ORSTS=9
 S SRSTATUS="(NOT COMPLETE)"
 Q
CAN ; cancelled or aborted
 I +$$VERSION^XPDUTL("ORDER ENTRY/RESULTS REPORTING")>2.5 S ORSTS=1
 S SR(.2)=$G(^SRF(SROERR,.2)) I $P(SR(.2),"^")!($P(SR(.2),"^",10)) S SRSTATUS="(ABORTED)" Q
 S SRSTATUS="(CANCELLED)"
 Q
SCH ; check to see if case is scheduled
 I '$D(^SRF(SROERR,31)) S SRST=0 Q
 I $P($G(^SRF(SROERR,31)),"^",4)="" S SRST=0 Q
 I $P($G(^SRF(SROERR,31)),"^",4) D:SRSTAT=0 TIM0 D:SRSTAT=1 TIM1 S SRST=1 Q
 Q
TIM0 I '$D(^SRF(SROERR,.2)) S:+$$VERSION^XPDUTL("ORDER ENTRY/RESULTS REPORTING")>2.5 ORSTS=8 S SRSTATUS="(SCHEDULED)" Q
 I $P(^SRF(SROERR,.2),"^",2) S:+$$VERSION^XPDUTL("ORDER ENTRY/RESULTS REPORTING")>2.5 ORSTS=9 S SRSTATUS="(NOT COMPLETE)" Q
 I $P(^SRF(SROERR,.2),"^",2)="" S:+$$VERSION^XPDUTL("ORDER ENTRY/RESULTS REPORTING")>2.5 ORSTS=8 S SRSTATUS="(SCHEDULED)"
 Q
TIM1 S:+$$VERSION^XPDUTL("ORDER ENTRY/RESULTS REPORTING")>2.5 ORSTS=8 S SRSTATUS="(SCHEDULED)" Q
REQ ; check to see if case has been requested
 I $P($G(^SRF(SROERR,"REQ")),"^")=1,'$D(^SRF(SROERR,.2)) S:+$$VERSION^XPDUTL("ORDER ENTRY/RESULTS REPORTING")>2.5 ORSTS=5 S SRSTATUS="(REQUESTED)",SRST=1 Q
 I $P($G(^SRF(SROERR,"REQ")),"^")=1,$P($G(^(.2)),"^",2)="" S:+$$VERSION^XPDUTL("ORDER ENTRY/RESULTS REPORTING")>2.5 ORSTS=5 S SRSTATUS="(REQUESTED)",SRST=1
 Q