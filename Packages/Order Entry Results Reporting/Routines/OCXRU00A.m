OCXRU00A ;SLC/RJS,CLA - OCX PACKAGE RULE TRANSPORT ROUTINE (Delete after Install of OR*3*96) ;JAN 30,2001 at 11:16
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
 G ^OCXRU00B
 ;
 Q
 ;
DATA ;
 ;
 ;;R^"860.6:",.01,"E"
 ;;D^GENERIC HL7 MESSAGE ARRAY
 ;;R^"860.6:",.02,"E"
 ;;D^HL7
 ;;R^"860.6:",1,"E"
 ;;D^DATA DRIVEN
 ;;EOR^
 ;;EOF^OCXS(860.6)^1
 ;;SOF^860.5  ORDER CHECK DATA SOURCE
 ;;KEY^860.5:^DATABASE LOOKUP
 ;;R^"860.5:",.01,"E"
 ;;D^DATABASE LOOKUP
 ;;R^"860.5:",.02,"E"
 ;;D^DATABASE LOOKUP
 ;;EOR^
 ;;KEY^860.5:^HL7 COMMON ORDER SEGMENT
 ;;R^"860.5:",.01,"E"
 ;;D^HL7 COMMON ORDER SEGMENT
 ;;R^"860.5:",.02,"E"
 ;;D^GENERIC HL7 MESSAGE ARRAY
 ;;EOR^
 ;;KEY^860.5:^HL7 PATIENT ID SEGMENT
 ;;R^"860.5:",.01,"E"
 ;;D^HL7 PATIENT ID SEGMENT
 ;;R^"860.5:",.02,"E"
 ;;D^GENERIC HL7 MESSAGE ARRAY
 ;;EOR^
 ;;KEY^860.5:^HL7 PHARMACY PRESCRIPTION ORDER SEGMENT
 ;;R^"860.5:",.01,"E"
 ;;D^HL7 PHARMACY PRESCRIPTION ORDER SEGMENT
 ;;R^"860.5:",.02,"E"
 ;;D^GENERIC HL7 MESSAGE ARRAY
 ;;EOR^
 ;;KEY^860.5:^OERR ORDER EVENT FLAG PROTOCOL
 ;;R^"860.5:",.01,"E"
 ;;D^OERR ORDER EVENT FLAG PROTOCOL
 ;;R^"860.5:",.02,"E"
 ;;D^CPRS ORDER PROTOCOL
 ;;EOR^
 ;;KEY^860.5:^ORDER ENTRY ORDER PRESCAN
 ;;R^"860.5:",.01,"E"
 ;;D^ORDER ENTRY ORDER PRESCAN
 ;;R^"860.5:",.02,"E"
 ;;D^CPRS ORDER PRESCAN
 ;;EOR^
 ;;EOF^OCXS(860.5)^1
 ;;SOF^860.4  ORDER CHECK DATA FIELD
 ;;KEY^860.4:^CONTROL CODE
 ;;R^"860.4:",.01,"E"
 ;;D^CONTROL CODE
 ;;R^"860.4:",101,"E"
 ;;D^FREE TEXT
 ;;R^"860.4:","860.41:GENERIC HL7 MESSAGE ARRAY^860.6",.01,"E"
 ;;D^GENERIC HL7 MESSAGE ARRAY
 ;;R^"860.4:","860.41:GENERIC HL7 MESSAGE ARRAY^860.6",.02,"E"
 ;;D^HL7 COMMON ORDER SEGMENT
 ;;R^"860.4:","860.41:GENERIC HL7 MESSAGE ARRAY^860.6",1,"E"
 ;;D^PATIENT.HL7_CONTROL_CODE
 ;;EOR^
 ;;KEY^860.4:^CREATININE CLEARANCE (ESTIM) DATE
 ;;R^"860.4:",.01,"E"
 ;;D^CREATININE CLEARANCE (ESTIM) DATE
 ;;R^"860.4:",1,"E"
 ;;D^CRCLD
 ;;R^"860.4:",101,"E"
 ;;D^DATE/TIME
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",.01,"E"
 ;;D^DATABASE LOOKUP
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",.02,"E"
 ;;D^DATABASE LOOKUP
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",1,"E"
 ;;D^PATIENT.CRCL_DATE
 ;;EOR^
 ;;KEY^860.4:^CREATININE CLEARANCE (ESTIM) VALUE
 ;;R^"860.4:",.01,"E"
 ;;D^CREATININE CLEARANCE (ESTIM) VALUE
 ;;R^"860.4:",1,"E"
 ;;D^CRCLV
 ;;R^"860.4:",101,"E"
 ;;D^NUMERIC
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",.01,"E"
 ;;D^DATABASE LOOKUP
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",.02,"E"
 ;;D^DATABASE LOOKUP
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",1,"E"
 ;;D^PATIENT.CRCL_TEXT
 ;;EOR^
 ;;KEY^860.4:^ENTERED BY
 ;;R^"860.4:",.01,"E"
 ;;D^ENTERED BY
 ;;R^"860.4:",101,"E"
 ;;D^FREE TEXT
 ;;R^"860.4:","860.41:GENERIC HL7 MESSAGE ARRAY^860.6",.01,"E"
 ;;D^GENERIC HL7 MESSAGE ARRAY
 ;;R^"860.4:","860.41:GENERIC HL7 MESSAGE ARRAY^860.6",.02,"E"
 ;;D^HL7 COMMON ORDER SEGMENT
 ;;R^"860.4:","860.41:GENERIC HL7 MESSAGE ARRAY^860.6",1,"E"
 ;;D^HL7_ENTERED BY
 ;;EOR^
 ;;KEY^860.4:^FILLER
 ;;R^"860.4:",.01,"E"
 ;;D^FILLER
 ;;R^"860.4:",1,"E"
 ;;D^FILL
 ;;R^"860.4:",101,"E"
 ;;D^FREE TEXT
 ;;R^"860.4:","860.41:CPRS ORDER PRESCAN^860.6",.01,"E"
 ;;D^CPRS ORDER PRESCAN
 ;;R^"860.4:","860.41:CPRS ORDER PRESCAN^860.6",.02,"E"
 ;;D^ORDER ENTRY ORDER PRESCAN
 ;;R^"860.4:","860.41:CPRS ORDER PRESCAN^860.6",1,"E"
 ;;D^PATIENT.OPS_FILLER
 ;;R^"860.4:","860.41:GENERIC HL7 MESSAGE ARRAY^860.6",.01,"E"
 ;;D^GENERIC HL7 MESSAGE ARRAY
 ;;R^"860.4:","860.41:GENERIC HL7 MESSAGE ARRAY^860.6",.02,"E"
 ;;D^HL7 COMMON ORDER SEGMENT
 ;;R^"860.4:","860.41:GENERIC HL7 MESSAGE ARRAY^860.6",1,"E"
 ;;D^PATIENT.HL7_FILLER
 ;;EOR^
 ;;KEY^860.4:^FOOD-DRUG INTERACTION MED
 ;;R^"860.4:",.01,"E"
 ;;D^FOOD-DRUG INTERACTION MED
 ;;R^"860.4:",1,"E"
 ;;D^FOOD-DRUG
 ;;R^"860.4:",101,"E"
 ;;D^BOOLEAN
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",.01,"E"
 ;;D^DATABASE LOOKUP
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",.02,"E"
 ;;D^DATABASE LOOKUP
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",1,"E"
 ;;D^PATIENT.FOOD_DRUG_MED
 ;;EOR^
 ;;KEY^860.4:^FORMATTED RENAL LAB RESULTS
 ;;R^"860.4:",.01,"E"
 ;;D^FORMATTED RENAL LAB RESULTS
 ;;R^"860.4:",101,"E"
 ;;D^FREE TEXT
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",.01,"E"
 ;;D^DATABASE LOOKUP
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",.02,"E"
 ;;D^DATABASE LOOKUP
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",1,"E"
 ;;D^PATIENT.REN_LAB_RES
 ;;EOR^
 ;;KEY^860.4:^INPATIENT
 ;;R^"860.4:",.01,"E"
 ;;D^INPATIENT
 ;;R^"860.4:",101,"E"
 ;;D^BOOLEAN
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",.01,"E"
 ;;D^DATABASE LOOKUP
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",.02,"E"
 ;;D^DATABASE LOOKUP
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",1,"E"
 ;;D^INPATIENT
 ;;EOR^
 ;;KEY^860.4:^ORDER CANCELED BY
 ;;R^"860.4:",.01,"E"
 ;;D^ORDER CANCELED BY
 ;;R^"860.4:",1,"E"
 ;;D^CANCELED BY
 ;;R^"860.4:",101,"E"
 ;;D^FREE TEXT
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",.01,"E"
 ;;D^DATABASE LOOKUP
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",.02,"E"
 ;;D^DATABASE LOOKUP
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",1,"E"
 ;;D^ORDER.CANCELED BY
 ;;EOR^
 ;;KEY^860.4:^ORDER MODE
 ;;R^"860.4:",.01,"E"
 ;;D^ORDER MODE
 ;;R^"860.4:",101,"E"
 ;;D^FREE TEXT
 ;;R^"860.4:","860.41:CPRS ORDER PRESCAN^860.6",.01,"E"
 ;;D^CPRS ORDER PRESCAN
 ;;R^"860.4:","860.41:CPRS ORDER PRESCAN^860.6",.02,"E"
 ;;D^ORDER ENTRY ORDER PRESCAN
 ;;R^"860.4:","860.41:CPRS ORDER PRESCAN^860.6",1,"E"
 ;;D^PATIENT.OPS_ORD_MODE
 ;;EOR^
 ;;KEY^860.4:^ORDER NUMBER
 ;;R^"860.4:",.01,"E"
 ;;D^ORDER NUMBER
 ;;R^"860.4:",101,"E"
 ;;D^NUMERIC
 ;;R^"860.4:","860.41:CPRS ORDER PRESCAN^860.6",.01,"E"
 ;;D^CPRS ORDER PRESCAN
 ;;R^"860.4:","860.41:CPRS ORDER PRESCAN^860.6",.02,"E"
 ;;D^ORDER ENTRY ORDER PRESCAN
 ;;R^"860.4:","860.41:CPRS ORDER PRESCAN^860.6",1,"E"
 ;;D^PATIENT.OPS_ORDER NUMBER
 ;;R^"860.4:","860.41:CPRS ORDER PROTOCOL^860.6",.01,"E"
 ;;D^CPRS ORDER PROTOCOL
 ;;R^"860.4:","860.41:CPRS ORDER PROTOCOL^860.6",.02,"E"
 ;;D^OERR ORDER EVENT FLAG PROTOCOL
 ;;R^"860.4:","860.41:CPRS ORDER PROTOCOL^860.6",1,"E"
 ;;D^PATIENT.OERR ORDER NUMBER
 ;;R^"860.4:","860.41:GENERIC HL7 MESSAGE ARRAY^860.6",.01,"E"
 ;;D^GENERIC HL7 MESSAGE ARRAY
 ;;R^"860.4:","860.41:GENERIC HL7 MESSAGE ARRAY^860.6",.02,"E"
 ;;D^HL7 COMMON ORDER SEGMENT
 ;;R^"860.4:","860.41:GENERIC HL7 MESSAGE ARRAY^860.6",1,"E"
 ;;D^PATIENT.HL7 ORDER NUMBER
 ;;EOR^
 ;;KEY^860.4:^ORDERED BY
 ;;R^"860.4:",.01,"E"
 ;;D^ORDERED BY
 ;;R^"860.4:",101,"E"
 ;;D^FREE TEXT
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",.01,"E"
 ;;D^DATABASE LOOKUP
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",.02,"E"
 ;;D^DATABASE LOOKUP
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",1,"E"
 ;;D^ORDER.ORDERED BY
 ;;EOR^
 ;;KEY^860.4:^PATIENT IEN
 ;;R^"860.4:",.01,"E"
 ;;D^PATIENT IEN
 ;;R^"860.4:",101,"E"
 ;;D^NUMERIC
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",.01,"E"
 ;;D^DATABASE LOOKUP
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",.02,"E"
 ;;D^DATABASE LOOKUP
 ;;R^"860.4:","860.41:DATABASE LOOKUP^860.6",1,"E"
 ;;D^PATIENT.IEN
 ;;R^"860.4:","860.41:GENERIC HL7 MESSAGE ARRAY^860.6",.01,"E"
 ;;D^GENERIC HL7 MESSAGE ARRAY
 ;;R^"860.4:","860.41:GENERIC HL7 MESSAGE ARRAY^860.6",.02,"E"
 ;;D^HL7 PATIENT ID SEGMENT
 ;;R^"860.4:","860.41:GENERIC HL7 MESSAGE ARRAY^860.6",1,"E"
 ;1;
 ;