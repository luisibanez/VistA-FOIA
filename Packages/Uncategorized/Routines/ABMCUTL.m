ABMCUTL ; IHS/SD/SDR - Clearinghouse functions;  
 ;;2.6;IHS 3P BILLING SYSTEM;**6**;NOV 12, 2009
 ; NEW routine abm*2.6*6
 ;
GETCHS ;
 S ABMCHIEN=0
 F  S ABMCHIEN=$O(^ABMRECVR(ABMCHIEN)) Q:'ABMCHIEN  D
 .S ABMCHINS=0
 .F  S ABMCHINS=$O(^ABMRECVR(ABMCHIEN,1,ABMCHINS)) Q:'ABMCHINS  D
 ..S ABMCHLST(ABMCHIEN,ABMCHINS)=""
 Q
