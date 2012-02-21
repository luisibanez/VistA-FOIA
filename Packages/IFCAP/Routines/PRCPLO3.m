PRCPLO3 ;WOIFO/DAP/RLL-manual run option for GIP reports ; 1/26/06 12:11pm
V ;;5.1;IFCAP;**83**;Oct 20,2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
ENT ;This section of the routine executes calls to the separate CLRS GIP
 ;extract routines.
 ;
 N ZTRTN,ZTDESC,ZTDTH,ZTIO,PRCPSSR,ZTSK,ZTREQ,PRCPMSG
 S ZTRTN="ENT^PRCPLO2"
 S ZTDESC="PRCPLO CLO GIP Reports CLRS"
 S ZTDTH=$H
 S ZTREQ="@"
 S ZTIO=""
 D ^%ZTLOAD
 S PRCPSSR=ZTSK
 ; Calls mail group message generation and screen display with success
 ; or exception notification
 I $D(PRCPSSR)[0 S PRCPMSG(1)="A task could not be created for the CLO GIP Reports - please contact IRM." D MAIL W ! D EN^DDIOL(PRCPMSG(1)) Q
 ;
 S PRCPMSG(1)="Task # "_PRCPSSR_" entered for the CLO GIP Reports."
 W !
 D EN^DDIOL(PRCPMSG(1))
 D MAIL
 ;
 Q
 ;
MAIL ; Builds mail messages to a defined mail group to notify users of the 
 ; success or failure of the TaskMan scheduling for the CLO GIP Reports.
 ;
 N XMDUZ,XMMG,XMSUB,XMTEXT,XMY,XMZ
 S XMSUB="CLO GIP Report Status for "_$$HTE^XLFDT($H)
 S XMDUZ="Clinical Logistics Report Server"
 S XMTEXT="PRCPMSG("
 S XMY("G.PRCPLO CLRS NOTIFICATIONS")=""
 ;
 D ^XMD
 Q
 ; 
BLDGP2 ; Build the DAYS of stock on hand file
 N FILEDIR,STID,FILG2
 S FILEDIR=$$GET^XPAR("SYS","PRCPLO EXTRACT DIRECTORY",1,"Q")
 S STID=$$GET1^DIQ(4,$$KSP^XUPARAM("INST")_",",99)
 S FILG2="IFCP"_STID_"G2.TXT"
 D OPEN^%ZISH("FILE1",FILEDIR,FILG2,"W")
 ; D OPEN^%ZISH("FILE1",FILEDIR,"CLRSG2.TXT","W")
 D USE^%ZISUTL("FILE1")
 D GETGIPH1
 D GETGIPF
 D CLOSE^%ZISH("FILE1")
 Q
BLDGP1 ; BUILD THE stock status file
 N FILEDIR,STID,FILG1
 S FILEDIR=$$GET^XPAR("SYS","PRCPLO EXTRACT DIRECTORY",1,"Q")
 S STID=$$GET1^DIQ(4,$$KSP^XUPARAM("INST")_",",99)
 S FILG1="IFCP"_STID_"G1.TXT"
 D OPEN^%ZISH("FILE1",FILEDIR,FILG1,"W")
 ; D OPEN^%ZISH("FILE1",FILEDIR,"CLRSG1.DAT","W")
 D USE^%ZISUTL("FILE1")
 D GETGIPH2
 D GETGIPSF
 D CLOSE^%ZISH("FILE1")
 Q
GETGIPSF ; Get the GIP stock status data from file 446.7
 N GT1,GT2,GT3,GT4
 S GT1="",GT2="",GT3=""
 F  S GT1=$O(^PRCP(446.7,GT1)) Q:GT1=""  D
 . S GT2=$G(^PRCP(446.7,GT1,2))
 . I $P(GT2,"*",2)'="" W GT2,!
 . Q
 Q
GETGIPH1 ; Header for stock on hand report
 ;
 W "StationNum"_"*"_"DateRange"_"*"_"InvIdNum"_"*"
 W "InventoryPoint"_"*"_"InventoryType"_"*"_"TotalDollars"_"*"
 W "NumOfLineItemsSoh"_"*"_"NumOfLineItemsInv"_"*"_"CostCenter",!
 Q
GETGIPH2 ; Header for Stock Status Report
 W "StationNum"_"*"_"DateRange"_"*"_"NumDays"_"*"
 W "InvIdNum"_"*"_"InventoryPoint"_"*"_"InventoryType"_"*"_"OpenBalTotal"_"*"_"ReceiptsTot"_"*"
 W "IssuesTotal"_"*"_"AdjTotal"_"*"_"ClosingBalTot"_"*"
 W "ReceiptsTot#"_"*"_"IssuesTotal#"_"*"_"AdjTotal#"_"*"
 W "TurnoverTotal"_"*"_"InactiveItmTotal#"_"*"_"InactiveItemTotal$"
 W "*"_"InactiveItemsPct"_"*"_"LongSupplyTotal#"_"*"_"LongSupplyTotal$"
 W "*"_"LongSupplyPct"_"*"_"NumOfLineItemsInv",!
 Q
GETGIPF ; Get the GIP days of stock on hand data from File 446.7
 ;
 N GP1,GP2,GP3
 S GP1=0,GP2=0,GP3=0
 F  S GP1=$O(^PRCP(446.7,GP1)) Q:GP1=""  D
 . S GP2=$G(^PRCP(446.7,GP1,1))
 . I $P(GP2,"*",1)'="" W GP2,!
 . Q
 Q
