OCXRU00B ;SLC/RJS,CLA - OCX PACKAGE RULE TRANSPORT ROUTINE (Delete after Install of OR*3*96) ;JAN 30,2001 at 11:16
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**96**;Dec 17,1997
 ;;  ;;ORDER CHECK EXPERT version 1.01 released OCT 29,1998
 ;
S ;
 ;
 D DOT^OCXRULE
 ;
 ;
 K REMOTE,LOCAL,OPCODE,REF
 F LINE=1:1:500 S TEXT=$P($T(DATA+LINE),";",2,999) Q:TEXT  I $L(TEXT) D  Q:QUIT
 .S ^TMP("OCXRULE",$J,$O(^TMP("OCXRULE",$J,"A"),-1)+1)=TEXT
 ;
 ;
 ;
 Q
 ;
DATA ;
 ;
 ;;D^PATIENT.HL7_PATIENT_ID
 ;;EOR^
 ;;KEY^860.4:^PATIENT LOCATION
 ;;R^"860.4:",.01,"E"
 ;;D^PATIENT LOCATION
 ;;R^"860.4:",1,"E"
 ;;D^PT LOC
 ;;R^"860.4:",101,"E"
 ;;D^FREE TEXT
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",.01,"E"
 ;;D^DATABASE LOOKUP
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",.02,"E"
 ;;D^DATABASE LOOKUP
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",1,"E"
 ;;D^PATIENT.LOCATION
 ;;EOR^
 ;;KEY^860.4:^PHARMACY LOCAL ORDERABLE ITEM TEXT
 ;;R^"860.4:",.01,"E"
 ;;D^PHARMACY LOCAL ORDERABLE ITEM TEXT
 ;;R^"860.4:",101,"E"
 ;;D^FREE TEXT
 ;;R^"860.4:","860.41:GENERIC HL7 MESSAGE ARRAY^860.6",.01,"E"
 ;;D^GENERIC HL7 MESSAGE ARRAY
 ;;R^"860.4:","860.41:GENERIC HL7 MESSAGE ARRAY^860.6",.02,"E"
 ;;D^HL7 PHARMACY PRESCRIPTION ORDER SEGMENT
 ;;R^"860.4:","860.41:GENERIC HL7 MESSAGE ARRAY^860.6",1,"E"
 ;;D^PATIENT.HL7_RX_OI_TEXT
 ;;EOR^
 ;;EOF^OCXS(860.4)^1
 ;;SOF^860.3  ORDER CHECK ELEMENT
 ;;KEY^860.3:^CANCELED BY NON-ORIG ORDERING PROVIDER
 ;;R^"860.3:",.01,"E"
 ;;D^CANCELED BY NON-ORIG ORDERING PROVIDER
 ;;R^"860.3:",.02,"E"
 ;;D^GENERIC HL7 MESSAGE ARRAY
 ;;R^"860.3:","860.31:1",.01,"E"
 ;;D^1
 ;;R^"860.3:","860.31:1",1,"E"
 ;;D^ORDERED BY
 ;;R^"860.3:","860.31:1",2,"E"
 ;;D^NOT EQUAL TO
 ;;R^"860.3:","860.31:1",4,"E"
 ;;D^ORDER CANCELED BY
 ;;EOR^
 ;;KEY^860.3:^CREATININE CLEARANCE DATE/TIME
 ;;R^"860.3:",.01,"E"
 ;;D^CREATININE CLEARANCE DATE/TIME
 ;;R^"860.3:",.02,"E"
 ;;D^DATABASE LOOKUP
 ;;R^"860.3:","860.31:1",.01,"E"
 ;;D^1
 ;;R^"860.3:","860.31:1",1,"E"
 ;;D^CREATININE CLEARANCE (ESTIM) DATE
 ;;R^"860.3:","860.31:1",2,"E"
 ;;D^DATE AFTER
 ;;R^"860.3:","860.31:1",3,"E"
 ;;D^0
 ;;EOR^
 ;;KEY^860.3:^CREATININE CLEARANCE ESTIMATE
 ;;R^"860.3:",.01,"E"
 ;;D^CREATININE CLEARANCE ESTIMATE
 ;;R^"860.3:",.02,"E"
 ;;D^CPRS ORDER PRESCAN
 ;;R^"860.3:","860.31:1",.01,"E"
 ;;D^1
 ;;R^"860.3:","860.31:1",1,"E"
 ;;D^ORDER MODE
 ;;R^"860.3:","860.31:1",2,"E"
 ;;D^EQ FREE TEXT
 ;;R^"860.3:","860.31:1",3,"E"
 ;;D^DISPLAY
 ;;R^"860.3:","860.31:2",.01,"E"
 ;;D^2
 ;;R^"860.3:","860.31:2",1,"E"
 ;;D^FILLER
 ;;R^"860.3:","860.31:2",2,"E"
 ;;D^STARTS WITH
 ;;R^"860.3:","860.31:2",3,"E"
 ;;D^PS
 ;;R^"860.3:","860.31:3",.01,"E"
 ;;D^3
 ;;R^"860.3:","860.31:3",1,"E"
 ;;D^CREATININE CLEARANCE (ESTIM) VALUE
 ;;R^"860.3:","860.31:3",2,"E"
 ;;D^LESS THAN
 ;;R^"860.3:","860.31:3",3,"E"
 ;;D^50
 ;;R^"860.3:","860.31:4",.01,"E"
 ;;D^4
 ;;R^"860.3:","860.31:4",1,"E"
 ;;D^CREATININE CLEARANCE (ESTIM) VALUE
 ;;R^"860.3:","860.31:4",2,"E"
 ;;D^GREATER THAN
 ;;R^"860.3:","860.31:4",3,"E"
 ;;D^0
 ;;EOR^
 ;;KEY^860.3:^INPATIENT FOOD-DRUG REACTION
 ;;R^"860.3:",.01,"E"
 ;;D^INPATIENT FOOD-DRUG REACTION
 ;;R^"860.3:",.02,"E"
 ;;D^GENERIC HL7 MESSAGE ARRAY
 ;;R^"860.3:","860.31:1",.01,"E"
 ;;D^1
 ;;R^"860.3:","860.31:1",1,"E"
 ;;D^FOOD-DRUG INTERACTION MED
 ;;R^"860.3:","860.31:1",2,"E"
 ;;D^LOGICAL TRUE
 ;;R^"860.3:","860.31:1",3,"E"
 ;;D^COUMADIN,WARFARIN,DISULFIRAM,PHENELZINE,TRANYLCYPROMINE,PARNATE
 ;;R^"860.3:","860.31:3",.01,"E"
 ;;D^3
 ;;R^"860.3:","860.31:3",1,"E"
 ;;D^CONTROL CODE
 ;;R^"860.3:","860.31:3",2,"E"
 ;;D^EQUALS ELEMENT IN SET
 ;;R^"860.3:","860.31:3",3,"E"
 ;;D^NW,SN
 ;;R^"860.3:","860.31:4",.01,"E"
 ;;D^4
 ;;R^"860.3:","860.31:4",1,"E"
 ;;D^INPATIENT
 ;;R^"860.3:","860.31:4",2,"E"
 ;;D^LOGICAL TRUE
 ;;EOR^
 ;;KEY^860.3:^RENAL RESULTS
 ;;R^"860.3:",.01,"E"
 ;;D^RENAL RESULTS
 ;;R^"860.3:",.02,"E"
 ;;D^DATABASE LOOKUP
 ;;R^"860.3:","860.31:1",.01,"E"
 ;;D^1
 ;;R^"860.3:","860.31:1",1,"E"
 ;;D^FORMATTED RENAL LAB RESULTS
 ;;R^"860.3:","860.31:1",2,"E"
 ;;D^NOT EQUAL TO
 ;;R^"860.3:","860.31:1",3,"E"
 ;;D^<Results Not Found>
 ;;EOR^
 ;;EOF^OCXS(860.3)^1
 ;;SOF^860.2  ORDER CHECK RULE
 ;;KEY^860.2:^CREATININE CLEARANCE ESTIMATION
 ;;R^"860.2:",.01,"E"
 ;;D^CREATININE CLEARANCE ESTIMATION
 ;;R^"860.2:","860.21:1",.01,"E"
 ;;D^CREAT CLEAR
 ;;R^"860.2:","860.21:1",.02,"E"
 ;;D^SIMPLE DEFINITION
 ;;R^"860.2:","860.21:1",1,"E"
 ;;D^CREATININE CLEARANCE ESTIMATE
 ;;R^"860.2:","860.21:2",.01,"E"
 ;;D^CREATININE CLEARANCE DATE
 ;;R^"860.2:","860.21:2",.02,"E"
 ;;D^SIMPLE DEFINITION
 ;;R^"860.2:","860.21:2",1,"E"
 ;;D^CREATININE CLEARANCE DATE/TIME
 ;;R^"860.2:","860.21:3",.01,"E"
 ;;D^RENAL RESULTS
 ;;R^"860.2:","860.21:3",.02,"E"
 ;;D^SIMPLE DEFINITION
 ;;R^"860.2:","860.21:3",1,"E"
 ;;D^RENAL RESULTS
 ;;R^"860.2:","860.22:1",.01,"E"
 ;;D^1
 ;;R^"860.2:","860.22:1",1,"E"
 ;;D^IF CREAT CLEAR AND ( CREATININE CLEARANCE DATE OR RENAL RESULTS )
 ;;R^"860.2:","860.22:1",2,"E"
 ;;D^ESTIMATED CREATININE CLEARANCE
 ;;R^"860.2:","860.22:1",6,"E"
 ;;D^Est. CrCl: |CRCLV| (|FORMATTED RENAL LAB RESULTS|)
 ;;EOR^
 ;;KEY^860.2:^FOOD/DRUG INTERACTION
 ;;R^"860.2:",.01,"E"
 ;;D^FOOD/DRUG INTERACTION
 ;;R^"860.2:","860.21:1",.01,"E"
 ;;D^INPATIENT FOOD DRUG REACTION
 ;;R^"860.2:","860.21:1",1,"E"
 ;;D^INPATIENT FOOD-DRUG REACTION
 ;;R^"860.2:","860.22:1",.01,"E"
 ;;D^1
 ;;R^"860.2:","860.22:1",1,"E"
 ;;D^INPATIENT FOOD DRUG REACTION
 ;;R^"860.2:","860.22:1",3,"E"
 ;;D^FOOD/DRUG INTERACTION
 ;;R^"860.2:","860.22:1",5,"E"
 ;;D^[|PT LOC|] |PHARMACY LOCAL ORDERABLE ITEM TEXT| ordered - adjust diet accordingly.
 ;;EOR^
 ;;EOF^OCXS(860.2)^1
 ;1;
 ;