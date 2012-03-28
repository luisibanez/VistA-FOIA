BWPTCH11 ;IHS/CMI/LAB - BW PATCH 11 ;6-Jan-2009 12:14;PLS
 ;;2.0;WOMEN'S HEALTH;**11**;MAY 16, 1996
 ;
 ;
PRE ;
 S DIU=9002086.34,DIU(0)="" D EN^DIU2
 Q
POST ;
 ; Add version 6.0 to the MDE multiple in the race mappings file.
 N BWRIEN,BWCODE,BWSITE,DR,BWREC,BWDAT,BWNEWDX,BWUSEDX,BWUIEN,BWDX0,NBWDX0,J,NEWIEN,I,BWPIEN
 I $$PATCH^XPDUTL("BW*2.0*11") W "POST INSTALL WILL NOT RUN AGAIN" Q
 S BWRIEN=0 F  S BWRIEN=$O(^BWRACE(BWRIEN)) Q:'BWRIEN  D
 .I $D(^BWRACE(BWRIEN,1,"AC",50)) D
 ..S BWCODE=$O(^BWRACE(BWRIEN,1,"AC",50,0)) Q:'BWCODE
 ..S FDA(9002086.341,"+1,"_BWRIEN_",",.01)=60 D UPDATE^DIE(,"FDA","NEWIEN") K FDA
 ..I $D(NEWIEN) D
 ...S FDA(9002086.341,NEWIEN(1)_","_BWRIEN_",",1)=BWCODE D FILE^DIE(,"FDA") K NEWIEN,FDA
 ;
 ; Add 6.0 to the MDE Version multiple in the BW SITE PARAMETER file.
 S BWSITE=0 F  S BWSITE=$O(^BWSITE(BWSITE)) Q:'BWSITE  D
 .;I $$GET1^DIQ(9002086.02,BWSITE,.18,"I")'=50 Q
 .S DR=".18///"_60 D DIE^BWFMAN(9002086.02,DR,BWSITE,.BWPOP)
 ;
 ; Update the BW RESULTS/DIAGNOSIS file with new BI-RAD codes.
P2 F I=25,26,28 D CLN(I)
 F I=1:1 D  Q:BWREC=" Q"
 .S BWREC=$T(DIAG+I) Q:'$L(BWREC)
 .S BWDAT=$P(BWREC,";;",2)
 .S BWNEWDX=$P(BWDAT,":"),BWUSEDX=$P(BWDAT,":",2),BWDXPRCS=$P(BWDAT,":",3) Q:BWNEWDX=""
 .; If the new DX already exists, do not create another entry. Update the existing entry
 .; to be sure that the data in the entry is correct.
 .I $D(^BWDIAG("B",BWNEWDX)) D  Q
 ..S BWPIEN=$O(^BWDIAG("B",BWNEWDX,0))
 ..D ADDPRCS(BWDXPRCS,.BWDX0)
 ..S $P(^BWDIAG(BWPIEN,0),U,3)=BWDX0
 ..S $P(^BWDIAG(BWPIEN,0),U,20)=0
 ..S $P(^BWDIAG(BWPIEN,0),U,25)=$P(BWDAT,":",5)
 ..D REINDEX(BWPIEN)
 .I BWUSEDX="" D  Q
 ..S BWDX0=""
 ..S FDA(9002086.31,"+1,",.01)=BWNEWDX
 ..S FDA(9002086.31,"+1,",.02)=$P(BWDAT,":",4) D UPDATE^DIE(,"FDA","NEWIEN") K FDA
 ..I $D(NEWIEN) D
 ...D ADDPRCS(BWDXPRCS,.BWDX0)
 ...S $P(^BWDIAG(NEWIEN(1),0),U,3)=BWDX0
 ...S $P(^BWDIAG(NEWIEN(1),0),U,20)=0
 ...S $P(^BWDIAG(NEWIEN(1),0),U,25)=$P(BWDAT,":",5)
 ...S DIK="^BWDIAG(",DA=NEWIEN(1) D IX^DIK K NEWIEN
 .S BWUIEN=$O(^BWDIAG("B",BWUSEDX,0)) Q:'BWUIEN
 .S BWPRI=$P(^BWDIAG(BWUIEN,0),U,2)
 .S BWDX0=$P(^BWDIAG(BWUIEN,0),U,3,99)
 .S BWPRC=""
 .D ADDPRCS(BWDXPRCS,.BWDX0)
 .S FDA(9002086.31,"+1,",.01)=BWNEWDX
 .S FDA(9002086.31,"+1,",.02)=BWPRI
 .D UPDATE^DIE(,"FDA","NEWIEN") K FDA
 .I $D(NEWIEN) D
 ..S $P(^BWDIAG(NEWIEN(1),0),U,3)=BWDX0
 .D REINDEX(NEWIEN(1))
 .D REINDEX(BWUIEN)
 .K BWDX0,NEWIEN,DIK,DA
 D UPDHPV
 K ^BWDIAG("P")
 S DIK="^BWDIAG(" D IXALL^DIK
 Q
 ; Add CDC Equiv. HPV results. If the result type already exists, just update the new field value.
REINDEX(IEN) ;
 S DIK="^BWDIAG(",DA=IEN D IX^DIK
 Q
UPDHPV ;
 N I,DATA,RESDAT,RES,CDCVAL,PRIO,DR,FDA
 D CLN(40)
 F I=1:1 D  Q:DATA=" Q"
 .S DATA=$T(HPV+I) Q:DATA=" Q"
 .S RESDAT=$P(DATA,";;",2) Q:RESDAT=""
 .S RES=$P(RESDAT,":"),CDCVAL=$P(RESDAT,":",2),PRIO=$P(RESDAT,":",3)
 .I $D(^BWDIAG("B",RES)) D  Q
 ..S RESIEN=$O(^BWDIAG("B",RES,0))
 ..S DR="1///"_CDCVAL D DIE^BWFMAN(9002086.31,DR,RESIEN,.BWPOP)
 ..D ADDHPV(RESIEN)
 ..S DIK="^BWDIAG(",DA=RESIEN D IX^DIK
 .S FDA(9002086.31,"+1,",.01)=RES
 .S FDA(9002086.31,"+1,",.02)=PRIO
 .S FDA(9002086.31,"+1,",1)=CDCVAL
 .D UPDATE^DIE(,"FDA","NEWIEN") K FDA
 .I '$D(NEWIEN) Q
 .S RESIEN=$G(NEWIEN(1))
 .D ADDHPV(RESIEN)
 .S DIK="^BWDIAG(",DA=RESIEN D IX^DIK
 .K NEWIEN
 Q
 ; Clean up old entries with pointers to value passed in.
 ; INPUT : PRIEN - The value pointed to by the ASSOCIATED PROCEDURE portion of the BW RESULT/DIAGNOSIS file.
CLN(PRIEN) ;
 N BWIEN,I,VAL,J,NODE,DIK,DA,ARY
 Q:'PRIEN
 S BWIEN=0 F  S BWIEN=$O(^BWDIAG(BWIEN)) Q:'BWIEN  D
 .K ARY
 .F I=3:1:19 D
 ..S VAL=$P(^BWDIAG(BWIEN,0),U,I) I VAL S ARY(VAL)=""
 .I '$D(ARY(PRIEN)) Q
 .F I=3:1:19 S $P(^BWDIAG(BWIEN,0),U,I)=""
 .K ARY(PRIEN) I '$O(ARY(0)) Q
 .S NODE=3
 .S J=0 F  S J=$O(ARY(J)) Q:'J  D
 ..S $P(^BWDIAG(BWIEN,0),U,NODE)=J,NODE=NODE+1
 .;S DIK="^BWDIAG(",DA=BWIEN D IX^DIK
 Q
 ; Add HPV procedure to this diagnosis
ADDHPV(RESIEN) ;
 N I,VAL,DONE,SETPC
 S (DONE,SETPC)=0
 F I=3:1:19 D  Q:DONE
 .S VAL=$P(^BWDIAG(RESIEN,0),U,I)
 .I VAL=$O(^BWPN("B","HPV SCREEN",0)) S DONE=1 Q
 .I 'VAL S DONE=1,SETPC=I Q
 Q:'SETPC
 S $P(^BWDIAG(RESIEN,0),U,SETPC)=$O(^BWPN("B","HPV SCREEN",0))
 Q
 ; Add procedures to new code
ADDPRCS(BWDXPRCS,BWDX0) ;
 N J,PC,BWPRC,DONE
 S BWPRC=""
 F J=1:1:17 D  Q:BWPRC=""
 .S BWPRC=$P(BWDXPRCS,",",J) Q:BWPRC=""
 .S BWPRCIEN=$O(^BWPN("B",BWPRC,0))
 .S $P(BWDX0,U,J)=BWPRCIEN
 ; find the first blank entry and add IEN for VAGINAL ULTRASOUND
 S DONE=0
 F K=1:1:17 D  Q:DONE
 .; If this is already part of the BU result set, quit.
 .I $P(BWDX0,U,K)=$O(^BWPN("B","BREAST ULTRASOUND",0)) S DONE=1 Q
 .I $P(BWDX0,U,K) Q
 .S $P(BWDX0,U,K)=$O(^BWPN("B","BREAST ULTRASOUND",0)),DONE=1
 Q
 ; Remove procedure from old code
REMPRCS(BWDXPRCS,BWUIEN) ;
 N I,ARY,BWPRC,BWPRCIEN,A,TARY,PIECE,ITEM,LOOP
 ; build array of items to be removed
 F A=1:1:17 D  Q:BWPRC=""
 .S BWPRC=$P(BWDXPRCS,",",A) Q:BWPRC=""
 .S BWPRCIEN=$O(^BWPN("B",BWPRC,0))
 .S TARY(BWPRCIEN)=""
 ; build array of items currently defined for the result/diagnosis and remove all items from this result/diagnosis
 F I=3:1:19 D
 .S VAL=$P(^BWDIAG(BWUIEN,0),U,I) Q:'VAL
 .S ARY(I)=VAL,$P(^BWDIAG(BWUIEN,0),U,I)="" S DIK="^BWDIAG(",DA=BWUIEN D IX2^DIK Q
 ; put the diagnosis items back in, but if the ARY contains one of the values in TARY, skip it, as this is to be removed.
 S PIECE=3
 S LOOP=0 F  S LOOP=$O(ARY(LOOP)) Q:'LOOP  D
 .S ITEM=$G(ARY(LOOP))
 .I $D(TARY(ITEM)) Q
 .S $P(^BWDIAG(BWUIEN,0),U,PIECE)=$G(ARY(LOOP))
 .S PIECE=PIECE+1
 Q
DIAG ;
 ;;BI-RADS 0-Add Imag Eval Needed::MAMMOGRAM DX BILAT,MAMMOGRAM DX UNILAT,MAMMOGRAM SCREENING:6:13
 ;;BI-RADS 1:Negative:MAMMOGRAM DX BILAT,MAMMOGRAM DX UNILAT,MAMMOGRAM SCREENING
 ;;BI-RADS 2:Benign Finding, Negative:MAMMOGRAM DX BILAT,MAMMOGRAM DX UNILAT,MAMMOGRAM SCREENING
 ;;BI-RADS 3:Prbly Benign, Short Int F/U:MAMMOGRAM DX BILAT,MAMMOGRAM DX UNILAT,MAMMOGRAM SCREENING
 ;;BI-RADS 4:Suspicious Abnorm, Consider Bx:MAMMOGRAM DX BILAT,MAMMOGRAM DX UNILAT,MAMMOGRAM SCREENING
 ;;BI-RADS 5:Highly Sug of Malig, Tk Action:MAMMOGRAM DX BILAT,MAMMOGRAM DX UNILAT,MAMMOGRAM SCREENING
 ;;BI-RADS 0-Prev Films Req:Incomplete, Previous Films Req:MAMMOGRAM DX BILAT,MAMMOGRAM DX UNILAT,MAMMOGRAM SCREENING:7
 Q
HPV ;
 ;;Positive:1:10
 ;;Negative:2:20
 ;;Test Not Done:3:30
 ;;Unknown:9:90
 Q
