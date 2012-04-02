ABME8SBR ; IHS/ASDST/DMJ - 837 SBR Segment 
 ;;2.6;IHS 3P BILLING SYSTEM;**8**;NOV 12, 2009
 ;Transaction Set Header
 ;
 ; IHS/SD/SDR - v2.5 p8 - IM15307/IM14092
 ;    Modified to check MSP reason if Medicare
 ;
 ; IHS/SD/SDR/LSL - v2.5 p8 - IM13693/IM17856
 ;    Send SBR06 for 837D only in loop 2000B (Subscriber)
 ;    Not in loop 2320 (Other Subscriber) or other 837 formats
 ;
 ; IHS/SD/SDR - v2.5 p10 - COB issue
 ;   Added code to check if COB
 ;
 ; IHS/SD/SDR - v2.5 p13 - IM25436
 ;   SBR05 s/b C1 when Medicare Suppl insurer type
 ;
EP(X) ;EP
 ;x=1 (primary), 2 (secondary) or 3 (tertiary)
 K ABMREC("SBR"),ABMR("SBR")
 S ABME("RTYPE")="SBR"
 S ABMPST=X
 D LOOP
 K ABME,ABM
 Q
LOOP ;LOOP HERE
 F I=10:10:100 D
 .D @I
 .I $D(^ABMEXLM("AA",+$G(ABMP("INS")),+$G(ABMP("EXP")),ABME("RTYPE"),I)) D @(^(I))
 .I $G(ABMREC("SBR"))'="" S ABMREC("SBR")=ABMREC("SBR")_"*"
 .S ABMREC("SBR")=$G(ABMREC("SBR"))_ABMR("SBR",I)
 Q
10 ;segment
 S ABMR("SBR",10)="SBR"
 Q
20 ;SBR01 - Payer Responsibility Sequence Number Code
 S ABMR("SBR",20)=$S(ABMPST=1:"P",ABMPST=2:"S",ABMPST=3:"T",1:"P")
 Q
30 ;SBR02 - Individual Relationship Code
 S ABMR("SBR",30)=$G(ABMP("REL",ABMPST))
 I $G(ABMHL)=22 D
 .I $G(ABMCHILD)=0 S ABMR("SBR",30)=18
 .I $G(ABMCHILD)=1 S ABMR("SBR",30)=""
 Q
40 ;SBR03 - Reference Identification (Group Number)
 S ABMR("SBR",40)=$G(ABMP("GRP#",ABMPST))
 Q
50 ;SBR04 - Group Name
 I ABMR("SBR",40)'="" D  Q
 .S ABMR("SBR",50)=""
 S ABMR("SBR",50)=$G(ABMP("GRPNM",ABMPST))
 Q
60 ;SBR05 - Insurance Type Code
 S ABMR("SBR",60)=""
 D PREV^ABMDFUTL
 I (ABMPST=1)&(+$G(ABMP("PD"))=0)&(+$G(ABMP("DED"))=0)&(+$G(ABMP("COI"))=0)&(+$G(ABMP("NONC"))=0) Q
 Q:ABMP("EXP")'=22
 I $P(ABMP("INS",ABMPST),U,2)="R",(ABMPST'=1) S ABMR("SBR",60)=$P($G(^ABMDBILL(DUZ(2),ABMP("BDFN"),12)),U)
 I $P(ABMP("INS",ABMPST),U,2)="R",(ABMPST=1),($G(ABMLOOP)=2320) S ABMR("SBR",60)=$G(ABMP("SOP",ABMPST))
 I ($G(ABMR("SBR",60))=""),($G(ABMLOOP)=2320) S ABMR("SBR",60)=$G(ABMP("SOP",ABMPST))
 S:ABMR("SBR",60)="CI" ABMR("SBR",60)="C1"
 S:ABMR("SBR",60)="BL" ABMR("SBR",60)="C1"
 Q
70 ;SBR06 - Coordination of Benefits Code
 S ABMR("SBR",70)=""
 I ABMI=1,ABMP("EXP")=23 D
 .I $G(ABMP("INS",2)) S ABMR("SBR",70)=1
 .I '$G(ABMP("INS",2)) S ABMR("SBR",70)=6
 .I ABMPST=1 S ABMR("SBR",70)=""  ;abm*2.6*8 HEAT28632 - Removes "1" from SBR06 for primary payer when 2ndry payer billed
 Q
80 ;SBR07 - Yes/No Condition or Response Code
 S ABMR("SBR",80)=""
 Q
90 ;SBR08 - Employment Status Code
 S ABMR("SBR",90)=""
 Q
100 ;SBR09 - Claim Filing Indicator Code
 S ABMR("SBR",100)=$G(ABMP("SOP",ABMPST))
 S:ABMR("SBR",100)="SP" ABMR("SBR",100)="CI"
 Q
