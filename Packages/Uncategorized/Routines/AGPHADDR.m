AGPHADDR ; IHS/ASDS/EFG - DISPLAY/EDIT POLICY HOLDER ADDR/MEMBERS ;   
 ;;7.1;PATIENT REGISTRATION;**1,2**;JAN 31, 2007
 ;
 ;IHS/SD/TPF 9/15/2005 AG*7.1*1
 ;MODIFIED TO GET RID OF USE OF AGELP("PH")
 ;AND USE A PARAMETER INSTEAD
 ;
 Q  ;ADDED EN CALL IHS/SD/TPF 9/15/2005 AG*7.1*1
EN(POLHPTR) ;EP - DISPLAY/EDIT POLICY HOLDER ADDR/MEMBERS IHS/SD/TPF 9/15/2005 AG*7.1*1
 I 'POLHPTR W !,"POLICY HOLDER UNDEFINED FOR THIS ENTRY!" H 3 Q  ;AG*7.1*1
 K AG("FLDCNT")
 I $D(AG("TMPMBR")) K AG("TMPMBR")
 D FINDPH  ;LOAD AG("TMPMBR") WITH POLICY HOLDER FIELDS
 I Y="V" D ALLMBR  ;DISPLAY FIELDS FOR ALL MEMBERS
 I $L(Y)>1 D ONEMBR  ;DISPLAY FIELDS FOR SELECTED MEMBER
VAR ;
 D ^XBCLS
 D HDR
 D DRAW
 Q:$D(AGSEENLY)
 G END:$D(DLOUT)!($D(DUOUT))
 Q:$D(DFOUT)!$D(DTOUT)
 G VAR
END ;K AG("PH9"),AG("PH11"),AG("PH12"),AG("PH13"),AG("PH14"),DTOUT,DUOUT,DLOUT,DFOUT,DQOUT
 K AG("PH9"),AG("PH11"),AG("PH12"),AG("PH13"),AG("PH14"),DTOUT,DUOUT,DLOUT,DQOUT  ;DON'T KILL DFOUT - ^^ AND "/.," WON'T WORK
 Q:$D(AGXTERN)
 Q:$D(DIROUT)
 Q:$D(AGSEENLY)
 Q
HDR ;
 I '$D(IOF) D HOME^%ZIS
 W $$S^AGVDF("IOF"),!
 W "IHS REGISTRATION ",$S($D(AGSEENLY):"VIEW SCREEN",1:"EDITOR")
 W ?31,"Policy Holder View"
 W ?78-$L($P($G(^DIC(4,DUZ(2),0)),U)),$P($G(^DIC(4,DUZ(2),0)),U)
 S AGLINE("-")=$TR($J(" ",78)," ","-")
 S AGLINE("EQ")=$TR($J(" ",78)," ","=")
 W !,AGLINE("EQ")
 I '$D(AGPAT) S AGPAT=$P($G(^DPT(DFN,0)),U)
 W !,$E(AGPAT,1,23)
 W ?36,$$DTEST^AGUTILS(DFN)
 I $D(AGCHRT) W ?55,"HRN:",AGCHRT
 I AG("PG")>1 D
 . ;GET ELIGIBILITY STATUS
 . S AGELSTS=$P($G(^AUPNPAT(DFN,11)),U,12)
 . W ?66,$S(AGELSTS="C":"CHS & DIRECT",AGELSTS="I":"INELIGIBLE",AGELSTS="D":"DIRECT ONLY",AGELSTS="P":"PEND. VERIF",1:"NONE"),!
 W AGLINE("EQ"),!
 Q
DRAW ;EP
 N DA
 ;S DA=AGELP("PH")
 S DA=POLHPTR  ;IHS/SD/TPF AG*7.1*1
 K ^UTILITY("DIQ1",$J)
 K DIC,DA,DR
 K AG("ITEM"),AG("MBRREC"),AG("MBRSEL"),AG("REDFN")
 S AG=0
 ;S AG("DFN")=AGELP("PH")
 S AG("DFN")=POLHPTR  ;IHS/SD/TPF AG*7.1*1
 S AG("HOLD")=0
 S AG("RECCNT")=1
 F  S AG=$O(AG("TMPMBR",AG)) Q:'AG!$D(DUOUT)!$D(DFOUT)!$D(AG("ONEMBR"))  D
 . S AG("REC")=$G(AG("TMPMBR",AG))
 . S AG("RECCNT")=AG("RECCNT")+1
 . Q:AG=0
 . ;I AG=1 W !,"POLICY HOLDER : ",$P($G(^AUPN3PPH(AGELP("PH"),0)),U),!
 . I AG=1 W !,"POLICY HOLDER : ",$P($G(^AUPN3PPH(POLHPTR,0)),U),!  ;;IHS/SD/TPF AG*7.1*1
 . S AG("DFN")=$P(AG("REC"),U)
 . I AG("DFN")'=AG("HOLD")&(AG>5) D
 .. W !!,"POLICY MEMBER : ",$P($G(^DPT(AG("DFN"),0)),U)
 .. S AG("HRN")=$P($G(^AUPNPAT(AG("DFN"),41,DUZ(2),0)),U,2)
 .. W "  ( ",AG("HRN")," )",!
 .. S AG("HOLD")=AG("DFN")
 . W !,AG,". "
 . S DIC=$P(AG("REC"),U,2)
 . S DA=$P(AG("REC"),U,3)
 . S DR=$P(AG("REC"),U,4)
 . S AG("LBL")=$P(AG("REC"),U,5)
 . D MBRLBL
 . W ?29,$$GET1^DIQ(DIC,DA,DR)
 . I AG("RECCNT")=12&($D(AG("ONEMBR"))) S DIR(0)="E" D ASK S AG="" Q
 . I AG("RECCNT")=12 S AG("RECCNT")=0,DIR(0)="E" D ASK D  Q
 .. Q:$D(DUOUT)!$D(DFOUT)!($D(DTOUT))  ;AG*7.1*2 NOT EXITING POLICY MEMBER VIEW PAGE CORRECTLY
 .. I $D(AGX) D
 ... I AGX>0&(AGX<(AG("FLDCNT"))) D
 .... S AG("HOLD")=0
 .... F X=1:1:AGX I X#6=0 S AG=X-1 K AGX Q
 . I AG("RECCNT")'=12&(AG=AG("FLDCNT")) S DIR(0)="E" D ASK D  Q
 .. Q:$D(DUOUT)!$D(DFOUT)!$D(DTOUT)  ;AG*7.1*2 NOT EXITING POLICY MEMBER VIEW PAGE CORRECTLY
 .. I $D(AGX) D
 ... S AG("HOLD")=0
 ... F X=1:1:AGX I X#6=0 S AG=X-1 K AGX Q
 K AG("RECCNT"),AG("ONEMBR")
 K DIC,DA,DR,AGY,AGI,AGX,AG("LBL"),AG("DFN"),AG("HOLD"),AG("REC"),AG("HRN")
 ;AFTER EDITING THE SELECTION MUST BE UPDATED SO ANY ERRORS CORRECTED WILL BE REFLECTED ON THE REDRAWN SCREEN
 S:$G(AGSELECT)'="" AGSELECT=$$FINDPVT^AGINSUPD(AGSELECT)
 Q
ASK ;
 K DIR,DLOUT,DUOUT,DFOUT,DQOUT,Y
 S DIR("A")="CHANGE which item? (1-"_AG_") ""RETURN"" to continue // "
 S DIR("A",1)="Enter ""^"" to return to the Eligibility screen "
 ;AG*7.1*2 TOOK OUT FUNCTION BELOW. YOU CANNOT EXIT OUT TO SUMMARY PAGE BEACUSE IT
 ;WOULD ALLOW BYPASSING ERRORS.
 ;S DIR("A",2)="Enter ""^^"" to return to the Insurance Summary screen "
 D READ
 Q:$D(DLOUT)!($D(DUOUT))!(Y["N")
 Q:$D(DFOUT)!($D(DTOUT))
 I $D(DQOUT)!(+Y<1)!(+Y>AG) W !!,"You must enter a number from 1 to ",AG H 2 Q
 S AG("C")="HASTREET,HACITY,HASTATE,HAZIP,HPHONE,MEMNUM,REL,MEMDOB,FROM,THRU,PERCOD"
 S AGY=Y
 S AGX=Y
 F AGI=1:1 S AG("SEL")=+$P(AGY,",",AGI) Q:AG("SEL")<1!(AG("SEL")>AG)  D MBRSEL,@($P(AG("C"),",",AG("SEL")))  ; IHS/SD/EFG  AG*7.1  4/16/2004
 D UPDATE1^AGED(DUZ(2),DFN,3,"")
 K AGI,AGY
 Q
READ ;EP
 K DFOUT,DTOUT,DUOUT,DQOUT,DLOUT,AG("ED"),AG("ERR"),DIROUT
 S DIR(0)="FO"
 D ^DIR
 Q:$D(DTOUT)
 S:Y="/.,"!(Y="^^") DFOUT=""
 S:Y="" DLOUT=""
 S:Y="^" (DUOUT,Y)=""
 S:Y?1"?".E!(Y["^") (DQOUT,Y)=""
 Q:Y="P"
 I $E(Y,1)="p" S $E(Y,1)="P"
 I $E(Y,1)="P"&($P($G(^AUPNPAT(DFN,11)),U,12)'="") D
 . S AG("ED")=+$E(Y,2,99)
 . I AG("ED")<1!(AG("ED")>9) D
 .. W *7,!!,"Use only pages 1 through 9."
 .. H 2
 .. K AG("ED")
 .. S AG("ERR")=""
 . I $D(AG("ED"))  D
 .. I AG("ED")>0&(AG("ED")<10)  D
 ... I AG("ED")=4 S AG("ED")="4A"
 ... I AG("ED")=5 S AG("ED")="BEA"
 ... I AG("ED")=6 S AG("ED")=13
 ... I AG("ED")=8 S AG("ED")=11
 ... I AG("ED")=7 S AG("ED")=8
 ... I AG("ED")=9 S AG("ED")="11A"
 I $E(Y,1)="P"&($P($G(^AUPNPAT(DFN,11)),U,12)="") D
 . W *7,!!,"Eligibility Status must be entered." H 2
 Q
HASTREET ;POLICY HOLDER'S STREET
 W !
 K DIC,DR,DIE,DA,DIR
 S DIE="^AUPN3PPH("
 ;S DA=AGELP("PH")
 S DA=POLHPTR  ;IHS/SD/TPF AG*7.1*1
 S DR=.09
 D ^DIE
 K DIC,DR,DIE,DA,DIR
 Q
HACITY ;POLICY HOLDER'S CITY
 W !
 K DIC,DR,DIE,DA,DIR
 S DIE="^AUPN3PPH("
 ;S DA=AGELP("PH")
 S DA=POLHPTR  ;IHS/SD/TPF AG*7.1*1
 S DR=.11
 D ^DIE
 K DIC,DR,DIE,DA,DIR
 Q
HASTATE ;POLICY HOLDER'S STATE
 W !
 K DIC,DR,DIE,DA,DIR
 S DIE="^AUPN3PPH("
 ;S DA=AGELP("PH")
 S DA=POLHPTR  ;IHS/SD/TPF AG*7.1*1
 S DR=.12
 D ^DIE
 K DIC,DR,DIE,DA,DIR
 Q
HAZIP ;POLICY HOLDER'S ZIP CODE
 W !
 K DIC,DR,DIE,DA,DIR
 S DIE="^AUPN3PPH("
 ;S DA=AGELP("PH")
 S DA=POLHPTR  ;IHS/SD/TPF AG*7.1*1
 S DR=.13
 D ^DIE
 K DIC,DR,DIE,DA,DIR
 Q
HPHONE ;POLICY HOLDER'S PHONE #
 W !
 K DIC,DR,DIE,DA,DIR
 S DIE="^AUPN3PPH("
 ;S DA=AGELP("PH")
 S DA=POLHPTR  ;IHS/SD/TPF AG*7.1*1
 S DR=.14
 D ^DIE
 K DIC,DR,DIE,DA,DIR
 Q
MBRSEL ;DETERMINE WHICH FIELD TO EDIT
 S AG("MBRREC")=$G(AG("TMPMBR",AG("SEL")))
 S AG("ITEM")=$P(AG("MBRREC"),U,5)
 S AG("SEL")=AG("ITEM")
 S AG("REDFN")=$P(AG("MBRREC"),U)
 Q
FINDPH ;GATHER FIELDS FOR POLICY HOLDER
 ;S AG("PHREC")=$G(^AUPN3PPH(AGELP("PH"),0))
 ;S AG("TMPMBR",0)=""
 ;S AG("TMPMBR",1)=AGELP("PH")_"^"_9000003.1_"^"_AGELP("PH")_"^"_.09_"^"_1
 ;S AG("TMPMBR",2)=AGELP("PH")_"^"_9000003.1_"^"_AGELP("PH")_"^"_.11_"^"_2
 ;S AG("TMPMBR",3)=AGELP("PH")_"^"_9000003.1_"^"_AGELP("PH")_"^"_.12_"^"_3
 ;S AG("TMPMBR",4)=AGELP("PH")_"^"_9000003.1_"^"_AGELP("PH")_"^"_.13_"^"_4
 ;S AG("TMPMBR",5)=AGELP("PH")_"^"_9000003.1_"^"_AGELP("PH")_"^"_.14_"^"_5
 ;IHS/SD/TPF AG*7.1*1  USE OF AGELP("PH") REPLACE IN ALL LINES ABOVE
 S AG("PHREC")=$G(^AUPN3PPH(POLHPTR,0))
 S AG("TMPMBR",0)=""
 S AG("TMPMBR",1)=POLHPTR_"^"_9000003.1_"^"_POLHPTR_"^"_.09_"^"_1
 S AG("TMPMBR",2)=POLHPTR_"^"_9000003.1_"^"_POLHPTR_"^"_.11_"^"_2
 S AG("TMPMBR",3)=POLHPTR_"^"_9000003.1_"^"_POLHPTR_"^"_.12_"^"_3
 S AG("TMPMBR",4)=POLHPTR_"^"_9000003.1_"^"_POLHPTR_"^"_.13_"^"_4
 S AG("TMPMBR",5)=POLHPTR_"^"_9000003.1_"^"_POLHPTR_"^"_.14_"^"_5
 Q
ALLMBR ;GATHER FIELDS FOR ALL MEMBERS
 S AG("MBR")=0
 S AG("FLDCNT")=5
 ;F  S AG("MBR")=$O(^AUPNPRVT("C",AGELP("PH"),AG("MBR"))) Q:'AG("MBR")  D
 F  S AG("MBR")=$O(^AUPNPRVT("C",POLHPTR,AG("MBR"))) Q:'AG("MBR")  D  ;IHS/SD/TPF AG*7.1*1
 . S AG("PREC")=0
 . ;F  S AG("PREC")=$O(^AUPNPRVT("C",AGELP("PH"),AG("MBR"),AG("PREC"))) Q:'AG("PREC")  D
 . F  S AG("PREC")=$O(^AUPNPRVT("C",POLHPTR,AG("MBR"),AG("PREC"))) Q:'AG("PREC")  D  ;IHS/SD/TPF AG*7.1*1
 .. S AG("FLDCNT")=AG("FLDCNT")+1,AG("TMPMBR",AG("FLDCNT"))=AG("MBR")_"^"_9000006.11_"^"_AG("PREC")_","_AG("MBR")_"^"_21_"^"_6
 .. S AG("FLDCNT")=AG("FLDCNT")+1,AG("TMPMBR",AG("FLDCNT"))=AG("MBR")_"^"_9000006.11_"^"_AG("PREC")_","_AG("MBR")_"^"_.05_"^"_7
 .. S AG("FLDCNT")=AG("FLDCNT")+1,AG("TMPMBR",AG("FLDCNT"))=AG("MBR")_"^"_2_"^"_AG("MBR")_"^"_.03_"^"_8
 .. S AG("FLDCNT")=AG("FLDCNT")+1,AG("TMPMBR",AG("FLDCNT"))=AG("MBR")_"^"_9000006.11_"^"_AG("PREC")_","_AG("MBR")_"^"_.06_"^"_9
 .. S AG("FLDCNT")=AG("FLDCNT")+1,AG("TMPMBR",AG("FLDCNT"))=AG("MBR")_"^"_9000006.11_"^"_AG("PREC")_","_AG("MBR")_"^"_.07_"^"_10
 .. S AG("FLDCNT")=AG("FLDCNT")+1,AG("TMPMBR",AG("FLDCNT"))=AG("MBR")_"^"_9000006.11_"^"_AG("PREC")_","_AG("MBR")_"^"_.12_"^"_11
 K AG("MBR"),AG("PREC")
 Q
ONEMBR ;GATHER FIELDS FOR ONE MEMBER
 S AG("ONEMBR")=""
 S AG("MBRSEL")=$E(Y,2,4)
 S AG("MBRPTR")=0
 F  S AG("MBRPTR")=$O(AGELP(AG("MBRPTR"))) Q:'AG("MBRPTR")  D
 . I $P($G(AGELP(AG("MBRPTR"))),U)=AG("MBRSEL") S AG("MBR")=AG("MBRPTR")
 S AG("FLDCNT")=5
 S AG("PREC")=0
 ;F  S AG("PREC")=$O(^AUPNPRVT("C",AGELP("PH"),AG("MBR"),AG("PREC"))) Q:'AG("PREC")  D
 F  S AG("PREC")=$O(^AUPNPRVT("C",POLHPTR,AG("MBR"),AG("PREC"))) Q:'AG("PREC")  D  ;IHS/SD/TPF AG*7.1*1
 . S AG("FLDCNT")=AG("FLDCNT")+1,AG("TMPMBR",AG("FLDCNT"))=AG("MBR")_"^"_9000006.11_"^"_AG("PREC")_","_AG("MBR")_"^"_21_"^"_6
 . S AG("FLDCNT")=AG("FLDCNT")+1,AG("TMPMBR",AG("FLDCNT"))=AG("MBR")_"^"_9000006.11_"^"_AG("PREC")_","_AG("MBR")_"^"_.05_"^"_7
 . S AG("FLDCNT")=AG("FLDCNT")+1,AG("TMPMBR",AG("FLDCNT"))=AG("MBR")_"^"_2_"^"_AG("MBR")_"^"_.03_"^"_8
 . S AG("FLDCNT")=AG("FLDCNT")+1,AG("TMPMBR",AG("FLDCNT"))=AG("MBR")_"^"_9000006.11_"^"_AG("PREC")_","_AG("MBR")_"^"_.06_"^"_9
 . S AG("FLDCNT")=AG("FLDCNT")+1,AG("TMPMBR",AG("FLDCNT"))=AG("MBR")_"^"_9000006.11_"^"_AG("PREC")_","_AG("MBR")_"^"_.07_"^"_10
 . S AG("FLDCNT")=AG("FLDCNT")+1,AG("TMPMBR",AG("FLDCNT"))=AG("MBR")_"^"_9000006.11_"^"_AG("PREC")_","_AG("MBR")_"^"_.12_"^"_11
 K AG("MBR"),AG("PREC")
 Q
MBRLBL ;FIND CORRECT FIELD LABEL FOR MEMBER LINE
 I AG("LBL")=1 W ?5,"HOLDER'S ADDRRESS-STREET...: " Q
 I AG("LBL")=2 W ?5,"HOLDER'S ADDRRESS-CITY.....: " Q
 I AG("LBL")=3 W ?5,"HOLDER'S ADDRRESS-STATE....: " Q
 I AG("LBL")=4 W ?5,"HOLDER'S ADDRRESS-ZIP......: " Q
 I AG("LBL")=5 W ?5,"HOLDER'S TELEPHONE NUMBER..: " Q
 I AG("LBL")=6 W ?5,"MEMBER NUMBER.............: " Q
 I AG("LBL")=7 W ?5,"RELATIONSHIP TO INSURED...: " Q
 I AG("LBL")=8 W ?5,"POLICY MEMBER DOB.........: " Q
 I AG("LBL")=9 W ?5,"FROM......................: " Q
 I AG("LBL")=10 W ?5,"THRU......................: " Q
 I AG("LBL")=11 W ?5,"PERSON CODE...............: " Q
 Q
MEMNUM ;MEMBER #
 W !
 K DIC,DR,DIE,DA,DD,DO
 S DA(1)=$P(AG("MBRREC"),U)
 S DIE="^AUPNPRVT("_DA(1)_",11,"
 S DA=$P($P(AG("MBRREC"),U,3),",")
 S DR=21
 D ^DIE
 K DIC,DR,DIE,DA
 Q
REL ;MEMBER RELATIONSHIP TO INSURED
 W !
 K DIC,DR,DIE,DA,DD,DO
 S DA(1)=$P(AG("MBRREC"),U)
 S DIE="^AUPNPRVT("_DA(1)_",11,"
 S DA=$P($P(AG("MBRREC"),U,3),",")
 ;S DR=.05
 S DR=".05R"  ;IHS/SD/TPF AG*7.1*1
 D ^DIE
 K DIC,DR,DIE,DA
 ;IHS/SD/TPF AG*7.1*1  ADDED LINE BELOW
 I $D(POLMEMBS("SELF")),($P($G(^AUPNPRVT($P(AG("MBRREC"),U),11,$P($P(AG("MBRREC"),U,3),","),0)),U,5)=25) Q:(POLMEMBS("SELF")=$P(AG("MBRREC"),U))  D  G REL
 .W !!,"THERE IS ALREADY A POLICY HOLDER FOR THIS POLICY!!"
 .S $P(^AUPNPRVT($P(AG("MBRREC"),U),11,$P($P(AG("MBRREC"),U,3),","),0),U,5)=""
 Q
MEMDOB ;MEMBER DOB
 W !
 K DIC,DR,DIE,DA,DD,DO
 S DIE="^DPT("
 S DA=$P(AG("MBRREC"),U)
 S DR=.03
 D ^DIE
 K DIC,DR,DIE,DA
 Q
FROM ;MEMBER ELIGIBILITY DATE
FROM1 ;EP
 W !
 N PRVTIEN
 K DIC,DR,DIE,DA,DD,DO
 S DA(1)=$P(AG("MBRREC"),U)
 S DIE="^AUPNPRVT("_DA(1)_",11,"
 S DA=$P($P(AG("MBRREC"),U,3),",")
 ;S DR=.06
 S DR=".06R"  ;AG*7.1*2 ISSUE REPORTED DURING ALPHA TESTING
 D ^DIE
 ;AG*7.1*2 FOUND IN TESTING.
 ;QUICK FIX FOR PATCH 2
 ;CHANGE WILL BE MADE TO DD FOR AUPNPRVT
 K GOFROM1
 I $$GET1^DIQ(9000006.11,$P($P(AG("MBRREC"),U,3),",")_","_$P(AG("MBRREC"),U)_",",.07,"I") D  G:$G(GOFROM1) FROM1
 .I ($$GET1^DIQ(9000006.11,$P($P(AG("MBRREC"),U,3),",")_","_$P(AG("MBRREC"),U)_",",.06,"I")>$$GET1^DIQ(9000006.11,$P($P(AG("MBRREC"),U,3),",")_","_$P(AG("MBRREC"),U)_",",.07,"I")) D
 ..S GOFROM1=1
 ..W !!,"STARTING DATE CANNOT BE AFTER TERMINATION DATE!" H 2
 K DIC,DR,DIE,DA
 I $G(POLMEMBS("SELF"))=AGPATDFN D  Q
 .K DR,DIE,DIC,DA,DIR
 .S PRVTIEN=$P(AG("MBRREC"),U,3)_","
 .S DR=".17///^S X=$$GET1^DIQ(9000006.11,PRVTIEN,.06,""E"")"
 .S DIE="^AUPN3PPH("
 .S DA=POLHPTR
 .D ^DIE
 .K DR,DIE,DIC,DA,DIR
 Q
THRU ;MEMBER ELIGIBILITY END DATE
 W !
 ;AG*7.1*2 ERROR FOUND DURING ALPHA TESTING
 N AGNEWDT,AGOLDDT,PRVTIEN
 S PRVTIEN=$P(AG("MBRREC"),U,3)_","
 ;AG*7.1*2 ISSUE REPORTED DURING ALPHA TESTING
 I '$$GET1^DIQ(9000006.11,PRVTIEN,.06,"I") D  Q
 .W !!,"YOU MUST ENTER A BEGIN DATE BEFORE ENTERING AN ENDING DATE!!"
 .K DIR
 .S DIR(0)="E"
 .D ^DIR
 S AGOLDDT=$$GET1^DIQ(9000006.11,PRVTIEN,.07,"I")
 K DIC,DR,DIE,DA,DD,DO
 S DA(1)=$P(AG("MBRREC"),U)
 S DIE="^AUPNPRVT("_DA(1)_",11,"
 S DA=$P($P(AG("MBRREC"),U,3),",")
 S DR=.07
 D ^DIE
 S AGNEWDT=$$GET1^DIQ(9000006.11,PRVTIEN,.07,"I")
 K DIC,DR,DIE,DA
 Q:AGOLDDT=AGNEWDT
 Q:$G(POLMEMBS("SELF"))=""  ;IF NO SELF THEN POLICY HOLDER IS NOT LISTED IN THE MEMBER SECTION I.E. NOT REG.
 I $P($G(POLMEMBS("SELF")),U)=$P(AG("MBRREC"),U) D  Q
 .K DR,DIE,DIC,DA,DIR
 .I AGNEWDT="" S DR=".18///@"
 .E  S DR=".18///^S X=$$GET1^DIQ(9000006.11,PRVTIEN,.07,""E"")"
 .S DIE="^AUPN3PPH("
 .S DA=POLHPTR
 .D ^DIE
 .K DR,DIE,DIC,DA,DIR
 .D UPDTERM^AGEDPRVP(AGELP("PH"),AGNEWDT,AGOLDDT)
 Q
PERCOD ;MEMBER PERSON CODE
 W !
 K DIC,DR,DIE,DA,DD,DO
 S DA(1)=$P(AG("MBRREC"),U)
 S DIE="^AUPNPRVT("_DA(1)_",11,"
 S DA=$P($P(AG("MBRREC"),U,3),",")
 S DR=.12
 D ^DIE
 K DIC,DR,DIE,DA
 Q