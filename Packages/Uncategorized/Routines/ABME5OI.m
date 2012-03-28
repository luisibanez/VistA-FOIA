ABME5OI ; IHS/ASDST/DMJ - 837 OI Segment 
 ;;2.6;IHS Third Party Billing System;**6**;NOV 12, 2009
 ;Transaction Set Header
 ;
START ;START HERE
 K ABMREC("OI"),ABMR("OI")
 S ABME("RTYPE")="OI"
 D LOOP
 K ABME,ABM
 Q
LOOP ;LOOP HERE
 F I=10:10:70 D
 .D @I
 .I $D(^ABMEXLM("AA",+$G(ABMP("INS")),+$G(ABMP("EXP")),ABME("RTYPE"),I)) D @(^(I))
 .I $G(ABMREC("OI"))'="" S ABMREC("OI")=ABMREC("OI")_"*"
 .S ABMREC("OI")=$G(ABMREC("OI"))_ABMR("OI",I)
 Q
10 ;segment
 S ABMR("OI",10)="OI"
 Q
20 ;OI01 - Claim Filing Indicator Code
 S ABMR("OI",20)=""
 Q
30 ;OI02 - Claim Submission Reason Code
 S ABMR("OI",30)=""
 Q
40 ;OI03 - Assignment of Benefits
 S ABMR("OI",40)=$P(ABMB7,"^",5)
 Q
50 ;OI04 - Patient Signature Source Code
 S ABMR("OI",50)=""
 Q
60 ;OI05 - Provider Agreement Code
 S ABMR("OI",60)=""
 Q
70 ;OI06 - Release of Information Code
 S ABMR("OI",70)=$P(ABMB7,"^",4)
 I ABMR("OI",70)'="Y" S ABMR("OI",70)="I"
 Q
