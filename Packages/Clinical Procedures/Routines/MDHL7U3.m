MDHL7U3 ; HOIFO/WAA -Utilities for CP to process HL7 messages  ; 7/26/00
 ;;1.0;CLINICAL PROCEDURES;;Apr 01, 2004
 ; Reference DBIA #4262 [Supported] for HL7 call.
 ;
PURGE(MDD7031) ;
 ; This sub-routine will delete HL7 772 Message text after a message
 ; been processed by Imaging.
 Q:'$D(^MDD(703.1,MDD7031,0))  ; No entry found
 S MDD772=$P(^MDD(703.1,MDD7031,0),U,6) Q:MDD772=""
 D DELBODY^HLUOPT2(MDD772,"CLINICAL PROCEDURES message purge","^TMP($J,""IN"")")
 S $P(^MDD(703.1,MDD7031,0),U,6)=""
 Q
