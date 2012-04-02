ACHSDADP ; IHS/ITSC/JVK - DENIAL APPEAL DISPLAY/EDIT;   [ 09/21/2006  3:05 PM ]
 ;;3.1;CONTRACT HEALTH MGMT SYSTEM;**6,13**;JUNE 11, 2001
 ;ACHS*3.1.* 7/1/2003 NEW ROUTINE TO ENTER APPEAL STATUS
 ;AND APPEAL LEVEL
 ;ACHS*3.1*13 9.8.06 IHS/OIT/FCJ MISSING Q, SCREEN NOT UPDATING, ADDED
 ;     INTERFACE TO RCIS REFERRAL
 ;
 K DFN S ACHDOCT="denial"
 D ^ACHSDLK
 I $D(ACHDLKER) D RTRN^ACHS Q
 S DA=ACHSA
TOF ;
 Q:'$D(ACHSA)
 Q:'$D(^ACHSDEN(DUZ(2),"D",ACHSA,0))
 W @IOF
DSP ; --- Display
 D VIDEO^ACHS
 S:'$D(IORVON) IORVON=""
 S:'$D(IORVOFF) IORVOFF=""
 D HDR,P1
 G:'$D(DUOUT) TOF
END ;
 K ACHSI,ACHSJ,ACHSPRNF,ACHSPROF,ACHSMPRI
 Q
 ;
HDR ;
 S ACHDPAT=$S($$DN^ACHS(0,7):$P($G(^DPT($$DN^ACHS(0,7),0)),U),1:$$DN^ACHS(10,1))
 W IORVON,!?79,!,"CHS DENIAL DISPLAY",?25,"PATIENT: ",$E(ACHDPAT,1,25),?62,"CHART#: "
 I $$DN^ACHS(0,6)="Y",$$DN^ACHS(0,7),$G(^AUPNPAT($$DN^ACHS(0,7),41,DUZ(2),0)) W $P($G(^AUPNPAT($$DN^ACHS(0,7),41,DUZ(2),0)),U,2)
 E  W "NONE"
 W !?79,IORVOFF,!,$$REPEAT^XLFSTR("=",79),!
 Q
 ;
P1 ; --- Display Page 1
 W IORVOFF
 S STATUS=$$DN^ACHS(0,8)
 W "DENIAL NO: ",$$DN^ACHS(0,1),?45,"DENIAL STATUS: ",$S(STATUS="":"Active",STATUS="Y":"Canceled",STATUS="R":"Reversed"),!
 W "DATE ISSUED: ",$$FMTE^XLFDT($$DN^ACHS(0,2))
 W ?45,"ISSUED BY: ",$E($P($G(^VA(200,$$DN^ACHS(0,3),0)),U),1,25)
 W !!,"1. DATE MED SVC: ",$$FMTE^XLFDT($$DN^ACHS(0,4))
 W ?43,"2. DATE OF REQUEST: ",$$FMTE^XLFDT($$DN^ACHS(0,5))
 ;ITSC/SET/JVK ACHS*3.1*6 MEDICAL PRIORITY ORIGNALLY NOT REQUIRED FIELD
 S ACHSMPRI=$$DN^ACHS(400,2)
 ;W !,"3. MEDICAL PRIORITY: ",$P($G(^ACHSMPRI($$DN^ACHS(400,2),0)),U)
 W !,"3. MEDICAL PRIORITY: ",$S(ACHSMPRI'="":$P($G(^ACHSMPRI($$DN^ACHS(400,2),0)),U),ACHSMPRI="":"NONE SET")
 S %=$$DN^ACHS(100,10)
 ;
 W !,"4. VISIT TYPE: ",$S(%="O":"OUTPATIENT",%="I":"INPATIENT",%="A":"AMBULANCE",%="P":"PATIENT ESCORT",%="D":"DENTAL",1:"UNKNOWN")
 ;
 W !!,"5. PRIMARY PROVIDER: ",?25,$S($$DN^ACHS(100,1)="Y":$P($G(^AUTTVNDR($$DN^ACHS(100,2),0)),U),1:$$DN^ACHS(100,3))
 ;
 W !,"6. SECONDARY PROVIDERS: "
 ;--Other providers on file Node 200
 S ACHSI=0
 F ACHSJ=1:1:3  S ACHSI=$O(^ACHSDEN(DUZ(2),"D",ACHSA,200,ACHSI))  Q:ACHSI'?1N.N  D
 . S ACHSPROF(ACHSJ)=$P(^ACHSDEN(DUZ(2),"D",ACHSA,200,ACHSI,0),U)
 . S ACHSPROF(ACHSJ)=$P(^AUTTVNDR(ACHSPROF(ACHSJ),0),U)
 . W ?25,ACHSPROF(ACHSJ),!
 ;--Other providers not on file Node 210
 S ACHSI=0
 F ACHSJ=1:1:3  S ACHSI=$O(^ACHSDEN(DUZ(2),"D",ACHSA,210,ACHSI))  Q:ACHSI'?1N.N  D
 . S ACHSPRNF(ACHSJ)=$P(^ACHSDEN(DUZ(2),"D",ACHSA,210,ACHSI,0),U)
 . W ?25,ACHSPRNF(ACHSJ),!
 ;
 W !,"7. PRIMARY DENIAL REASON: " S %=$$DN^ACHS(250,1) I % W $P($G(^ACHSDENS(%,0)),U)
 ;
 W !,"8. *OTHER RESOURCES: ",$S($P($G(^ACHSDEN(DUZ(2),"D",ACHSA,800,0)),U,4):"YES",1:"NONE")
 ;
 W ?43,"9. *OTHER IHS RESOURCES: ",$S($P($G(^ACHSDEN(DUZ(2),"D",ACHSA,825,0)),U,4):"YES",1:"NONE")
 ;
 S %=$$DN^ACHS(400,3)
 W !,"10. APPEAL STATUS: ",IORVON,$S(%'="":$P($G(^ACHSDENA(%,0)),U),1:"NONE"),IORVOFF
 S %=$P($G(^ACHSDEN(DUZ(2),"D",ACHSA,431,0)),U,4)
 W ?42,"11. *APPEAL TRANSACTION RECORDS: ",$S(%'="":$P($G(^ACHSDEN(DUZ(2),"D",ACHSA,431,0)),U,4),1:"NONE")
 W !,"12. *CHS OFFICE COMMENTS: ",$S($D(^ACHSDEN(DUZ(2),"D",ACHSA,900,0)):"YES",1:"NONE")
 ;
 W !?15,IORVON,"*",IORVOFF," - CHOOSE THESE FIELDS TO SEE FURTHER INFORMATION",!
 ;
 S %=$$DIR^ACHS("LO^8:12","Enter Number Of Field To Edit or <RETURN> To Accept","","","","")
 ;
 I %="" S DUOUT=""
 Q:$D(DUOUT)!$D(DTOUT)!'%
 D @(+%)
 Q
 ;
8 ; --- Other Resources
 W !!
 I '$$DIE(800) S DUOUT=""
 Q
 ;
 ;'OTHER IHS RESOURCES'
9 ;
 W !!
 I '$$DIE(825) S DUOUT=""
 Q
 ;
10 ;
 ;ITSC-SET-JVK 5/27/03 ACHS*3.1*6
 ;I '$$DIE(430) S DUOUT=""
 W @IOF
 W ?20,"APPEAL TRANSACTION MENU",!
 I '$$DIE(431) S DUOUT=""
 Q
11 ;
 W @IOF
 W ?20,"APPEAL TRANSACTION MENU",!
 I '$$DIE(431) S DUOUT=""
 Q
 ;
12 ;
 W !!
 I '$$DIE(900) S DUOUT=""
 Q
 ;
DIE(DR) ; --- Edit appropriate fields in Denial
 W !!
 S DA=ACHSA
 S DA(1)=DUZ(2)
 S DIE="^ACHSDEN("_DUZ(2)_",""D"","
 I '$$LOCK^ACHS("^ACHSDEN(DUZ(2),""D"",ACHSA)","+") Q 0
 D ^DIE
 ;ACHS*3.1*13 8.31.06 IHS.OIT.FCJ ADDED CALL TO REF IN NXT LINE
 I DR=431 D APPEAL,REF
 I '$$LOCK^ACHS("^ACHSDEN(DUZ(2),""D"",ACHSA)","-") Q 0
 Q 1
APPEAL ;--ENTER OR EDIT APPEAL TRANSACTIONS--
 S ACHSTREC=$P(D,U,2)
 S ACHSDREC=$P(^ACHSDEN(DUZ(2),"D",ACHSA,400),U,3)
 ;S %=$$DIR^ACHS("Y","DO YOU WANT TO CHANGE THE DENIAL APPEAL STATUS","NO","By entering NO only the appeal status in the transaction record is changed.","","")
 ;I Y S $P(^ACHSDEN(DUZ(2),"D",ACHSA,400),U,3)=ACHSTREC
 ;
 ;ITSC-SET-JVK 5/27/03 ACHS*3.1*6
 I ACHSDREC="" S $P(^ACHSDEN(DUZ(2),"D",ACHSA,400),U,3)=ACHSTREC
 I ACHSTREC="" S $P(^ACHSDEN(DUZ(2),"D",ACHSA,400),U,3)=""
 I ACHSDREC'=ACHSTREC S $P(^ACHSDEN(DUZ(2),"D",ACHSA,400),U,3)=ACHSTREC
 S %=$$DN^ACHS(400,3)
 I %="" S $P(ACHSDEN(DUZ(2),"D",ACHSA,0),U,8)="" Q
 I $$GET1^DIQ(9002074,%,.01,"I")="REVERSED AFTER APPEAL" S $P(^ACHSDEN(DUZ(2),"D",ACHSA,0),U,8)="R"
 I $$GET1^DIQ(9002074,%,.01,"I")="PAYED WITH ADDITIONAL MONEY" S $P(^ACHSDEN(DUZ(2),"D",ACHSA,0),U,8)="R"
 I $$GET1^DIQ(9002074,%,.01,"I")="APPEAL PENDING" S $P(^ACHSDEN(DUZ(2),"D",ACHSA,0),U,8)=""
 I $$GET1^DIQ(9002074,%,.01,"I")="UPHELD AFTER APPEAL" S $P(^ACHSDEN(DUZ(2),"D",ACHSA,0),U,8)=""
 Q  ;ACHS*3.1*13 8.31.06 IHS.OIT.FCJ
 ;ACHS*3.1*13 8.31.06 IHS.OIT.FCJ ST OF CHANGES TO CALL INTERFACE W/RCIS
REF ;UPDATE REFERRAL IF DENIAL EXIST AND LINK IS ON
 ;GET REF IF DOES NOT EXIST WRITE ERROR MESSAGE WITH A RET TO CONT
 I $$LINK^ACHSBMC D
 .S ACHSREC=""
 .S ACHSREC=^ACHSDEN(DUZ(2),"D",ACHSA,431,D1,0) D APPEAL^ACHSBMC
 .K ACHSREC
 Q
 ;ACHS*3.1*13 8.31.06 IHS.OIT.FCJ END OF CHANGES