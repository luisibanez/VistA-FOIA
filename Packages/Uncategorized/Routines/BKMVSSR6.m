BKMVSSR6 ;PRXM/HC/CJS - STATE SURV. REPORT PRINT CONTINUED ; 14 Jul 2005  3:55 PM
 ;;2.1;HIV MANAGEMENT SYSTEM;;Feb 07, 2011
 ;
 ;
EN ;EP - PRIMARY ROUTINE ENTRY POINT
 D HDR^BKMVSSR3 Q:BKMX
 D HDR1^BKMVSSR3
 D SECTVII Q:BKMX
 D HDR^BKMVSSR3 Q:BKMX
 D HDR1^BKMVSSR3
 D SECTVIII Q:BKMX
 Q
SECTVII ;SECTION VII PRINT
 Q:$P(^BKM(90456,1,2,7,0),U,4)'="Y"
 W !?1,"SECTION VII: ",$P(^BKM(90456,1,2,7,0),U,2),!?1
 S BKMLINE=$P(^BKM(90456,1,2,7,1,1,1,1,0),U,1) W !?1,BKMLINE
 S BKM0="" F  S BKM0=$O(BKMICD(BKM0),-1) Q:BKM0=""  D  Q:BKMX
 .S BKMDT=$$FMTE^XLFDT(BKM0\1,"5Z")
 .S BKM1="" F  S BKM1=$O(BKMICD(BKM0,BKM1)) Q:BKM1=""  D  Q:BKMX
 ..S BKM2="" F  S BKM2=$O(BKMICD(BKM0,BKM1,BKM2)) Q:BKM2=""  D  Q:BKMX
 ...I BKM2="POV" S BKMVLN=$$GET1^DIQ(9000010.07,BKM1,.01,"E")
 ...I BKM2="PROB" S BKMVLN=$$GET1^DIQ(9000011,BKM1,.01,"E")
 ...I $Y>(IOSL-4) D HDR^BKMVSSR3 Q:BKMX  D HDR1^BKMVSSR3
 ...W !?5,BKMDT,?17,BKMVLN,?27,$P(BKMICD(BKM0,BKM1,BKM2),U)
VIIA ;SECONDARY ENTRY IN SECTION VII
 I $Y>(IOSL-4) D HDR^BKMVSSR3 Q:BKMX  D HDR1^BKMVSSR3
 W !!?1,"Patient shows the following register diagnoses:"
 ; PRX/DLS 4/3/2006 Changed lookup for register diagnosis' to be in reverse.
 I $G(IEN)]"" S BKM="" F  S BKM=$O(^BKMV(90455,"C",IEN,BKM),-1) Q:BKM=""  D  Q:BKMX
 .Q:$$GET1^DIQ(90455,BKM,3,"I")'=3
 .S BKMDT=$$GET1^DIQ(90455,BKM,.01,"I"),BKM1=$$GET1^DIQ(90455,BKM,4.5,"E") Q:BKM1=""
 .I '$D(^BKMV(90451.7,BKM1,0)) S BKM1=$$FIND1^DIC(90451.7,,"Q",BKM1,"B") Q:BKM1=""
 .S BKMCC=$$GET1^DIQ(90451.7,BKM1,.01,"E")_"  "_$$GET1^DIQ(90451.7,BKM1,1,"E") Q:BKMCC="  "
 .S BKMNDT=$$FMTE^XLFDT(BKMDT\1,"5Z")
 .I $Y>(IOSL-4) D HDR^BKMVSSR3 Q:BKMX  D HDR1^BKMVSSR3
 .W !?5,BKMNDT,?17,BKMCC
 I $Y>(IOSL-4) D HDR^BKMVSSR3 Q:BKMX  D HDR1^BKMVSSR3
 W !?1
 F BKM=2:1:3 S BKMLINE=$P(^BKM(90456,1,2,7,1,BKM,0),U,1) D  Q:BKMX
 .W:$P(^BKM(90456,1,2,7,1,BKM,0),U,2)="Y" !?1,BKMLINE,": "
 .I $D(^BKM(90456,1,2,7,1,BKM,1)) D
 ..I $Y>(IOSL-$P(^BKM(90456,1,2,7,1,BKM,1,0),U,4)-2) D HDR^BKMVSSR3 Q:BKMX  D HDR1^BKMVSSR3
 ..S BKM1=0
 ..F  S BKM1=$O(^BKM(90456,1,2,7,1,BKM,1,BKM1)) Q:'BKM1  S BKMLINE1=$P(^BKM(90456,1,2,7,1,BKM,1,BKM1,0),U) W !?1,BKMLINE1
VIIB ;SECONDARY ENTRY POINT
 F BKM=4:1:30 S BKMLINE=$P(^BKM(90456,1,2,7,1,BKM,0),U,1) D  Q:BKMX
 .I $Y>(IOSL-7) D HDR^BKMVSSR3 Q:BKMX  D HDR1^BKMVSSR3
 .W:$P(^BKM(90456,1,2,7,1,BKM,0),U,2)="Y" !?1,BKMLINE
 .W:BKM'=5 ": "
 .W:$P(^BKM(90456,1,2,7,1,BKM,0),U,4)'="" !?1,$P(^BKM(90456,1,2,7,1,BKM,0),U,4),!?1
 .D SECT7  Q:BKMX
 Q
SECT7 ;PRINT BLANK FIELDS FOR SECTION VII
 I BKM=4 W !?1 D  Q:BKMX
 .S BKM1=0 F  S BKM1=$O(^BKM(90456,1,2,7,1,BKM,1,BKM1)) Q:'BKM1  D  Q:BKMX
 ..I $Y>(IOSL-4) D HDR^BKMVSSR3 Q:BKMX  D HDR1^BKMVSSR3
 ..S BKMLINE1=^BKM(90456,1,2,7,1,BKM,1,BKM1,0)
 ..W !?1,BKMLINE1
 .S BKM0=0 F  S BKM0=$O(BKMSICD(BKM0)) Q:BKM0=""  D  Q:BKMX
 ..S BKMDT=$$FMTE^XLFDT(BKM0\1,"5Z")
 ..S BKM1="" F  S BKM1=$O(BKMSICD(BKM0,BKM1)) Q:BKM1=""  D  Q:BKMX
 ...S BKM2="" F  S BKM2=$O(BKMSICD(BKM0,BKM1,BKM2)) Q:BKM2=""  D  Q:BKMX
 ....I BKM2="POV" S BKMVLN=$$GET1^DIQ(9000010.07,BKM1,.01,"E")
 ....I BKM2="PROB" S BKMVLN=$$GET1^DIQ(9000011,BKM1,.01,"E")
 ....I $Y>(IOSL-4) D HDR^BKMVSSR3 Q:BKMX  D HDR1^BKMVSSR3
 ....W !?5,BKMDT,?17,BKMVLN,?27,$P(BKMSICD(BKM0,BKM1,BKM2),U)
 I $D(^BKM(90456,1,2,7,1,BKM,1)) D:BKM>4  Q:BKMX
 .I $Y>(IOSL-$P(^BKM(90456,1,2,7,1,BKM,1,0),U,4)-2) D HDR^BKMVSSR3 Q:BKMX  D HDR1^BKMVSSR3
 .S BKM1=0 F  S BKM1=$O(^BKM(90456,1,2,7,1,BKM,1,BKM1)) Q:'BKM1  D  Q:BKMX
 ..I $Y>(IOSL-4) D HDR^BKMVSSR3 Q:BKMX  D HDR1^BKMVSSR3
 ..S BKMLINE1=$P(^BKM(90456,1,2,7,1,BKM,1,BKM1,0),U,1)
 ..W !?1,BKMLINE1
 I BKM>5&(BKM<30) W !?5,"____Definitive  ____Presumptive  ____Not Applicable    Date:________",!?1
 Q
SECTVIII ;SECTION VIII PRINT
 Q:$P(^BKM(90456,1,2,8,0),U,4)'="Y"
 W !?1,"SECTION VIII: ",$P(^BKM(90456,1,2,8,0),U,2)
 F BKM=1:1:13 S BKMLINE=$P(^BKM(90456,1,2,8,1,BKM,0),U,1) D  Q:BKMX
 .I $Y>(IOSL-6) D HDR^BKMVSSR3 Q:BKMX  D HDR1^BKMVSSR3
 .W:$P(^BKM(90456,1,2,8,1,BKM,0),U,2)="Y" !!?1,BKMLINE," "
 .I $P(^BKM(90456,1,2,8,1,BKM,0),U,4)'="" W !?1,$P(^BKM(90456,1,2,8,1,BKM,0),U,4)
 .D SECT8 Q:BKMX
 Q
SECT8 ;SECTION 8 BLANK FIELD PRINT
 I BKM=4 D  Q
 .S BKM0=0 F  S BKM0=$O(BKMHAART(BKM0)) Q:BKM0=""  D  Q:BKMX
 ..S BKMDT=$$FMTE^XLFDT(BKM0\1,"5Z")
 ..S BKM1="" F  S BKM1=$O(BKMHAART(BKM0,BKM1)) Q:BKM1=""  D  Q:BKMX
 ...S BKMVLN=$P(BKMHAART(BKM0,BKM1),U,1)
 ...S BKMSIG=$P(BKMHAART(BKM0,BKM1),U,2)
 ...S BKMQTY=$P(BKMHAART(BKM0,BKM1),U,3)
 ...S BKMDAY=$P(BKMHAART(BKM0,BKM1),U,4)
 ...I $Y>(IOSL-4) D HDR^BKMVSSR3 Q:BKMX  D HDR1^BKMVSSR3
 ...W !?5,$E(BKMVLN,1,24),?30,"QTY: ",BKMQTY,?39,"DAYS: ",BKMDAY
 ...W ?49,"SIG: ",$E(BKMSIG,1,13),?68,BKMDT
 I BKM=5 D  Q
 .S BKM0=0 F  S BKM0=$O(BKMPCP(BKM0)) Q:BKM0=""  D  Q:BKMX
 ..S BKMDT=$$FMTE^XLFDT(BKM0\1,"5Z")
 ..S BKM1="" F  S BKM1=$O(BKMPCP(BKM0,BKM1)) Q:BKM1=""  D  Q:BKMX
 ...S BKMVLN=$P(BKMPCP(BKM0,BKM1),U,1)
 ...S BKMSIG=$P(BKMPCP(BKM0,BKM1),U,2)
 ...S BKMQTY=$P(BKMPCP(BKM0,BKM1),U,3)
 ...S BKMDAY=$P(BKMPCP(BKM0,BKM1),U,4)
 ...I $Y>(IOSL-4) D HDR^BKMVSSR3 Q:BKMX  D HDR1^BKMVSSR3
 ...W !?5,$E(BKMVLN,1,24),?30,"QTY: ",BKMQTY,?39,"DAYS: ",BKMDAY
 ...W ?49,"SIG: ",$E(BKMSIG,1,13),?68,BKMDT
 I BKM=10 ;Add information on current pregnancy, if any. Update next line with sub-section 10, depending on how much data can be gathered.
 I $D(^BKM(90456,1,2,8,1,BKM,1)) D:BKM'=4&(BKM'=5)  Q:BKMX
 .I $Y>(IOSL-$P(^BKM(90456,1,2,8,1,BKM,1,0),U,4)-2) D HDR^BKMVSSR3 Q:BKMX  D HDR1^BKMVSSR3
 .S BKM1=0 F  S BKM1=$O(^BKM(90456,1,2,8,1,BKM,1,BKM1)) Q:'BKM1  D  Q:BKMX
 ..I $Y>(IOSL-4) D HDR^BKMVSSR3 Q:BKMX  D HDR1^BKMVSSR3
 ..S BKMLINE1=$P(^BKM(90456,1,2,8,1,BKM,1,BKM1,0),U,1)
 ..W !?1,BKMLINE1
 Q