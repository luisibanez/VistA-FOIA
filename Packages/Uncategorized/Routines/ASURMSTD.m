ASURMSTD ; IHS/ITSC/LMH -MONTHLY UPDATE REPORTS DRIVER ; 
 ;;4.2T2;Supply Accounting Mgmt. System;;JUN 30, 2000
 ;This routine is used to print the Monthly update series of
 ;reports - RBSP R12 R15 R16 R17 R18 R23 R24 R74, R75, R77, R78, R79,
 ;and R83. It invokes routines ^ASURMBSP ^ASURM12P ^ASURM15P
 ;^ASURM16P ^ASURM17P ^ASURM18P ^ASURM23P ^ASURM24P ^ASURM74P
 ;^ASURM75P ^ASURM77P ^ASURM78P ^ASURM79P ^ASURM83P ^ASUMRDBA
 ;^ASUMRDBC ^ASUMRDBH ^ASUMRDBK ^ASURMDBL (19 REPORTS)
 I $G(ASUP("TYP"))'=1&($G(ASUP("TYP"))'=3) Q
 K ^XTMP("ASUR","R83") S ASUP("SEL83")=1
 S ^XTMP("ASUR","R83",0)=ASUK("DT","FM")+10000_U_ASUK("DT","FM")
PRINT ;EP;PRIMARY ENTRY POINT FOR MONTHLY REPORTS SERIES REPRINT
 I '$D(IO) D HOME^%ZIS
 I '$D(DUZ(2)) W !,"Report must be run from Kernel option" Q
 I '$D(ASUL(1,"AR","AP")) D SETAREA^ASULARST
 S ASUK("PTRSEL")=$G(ASUK("PTRSEL")) I ASUK("PTRSEL")]"" G PSER
 S ZTRTN="PSER^ASURMSTD",ZTDESC="SAMS MONTHLY REPORTS" D O^ASUUZIS
 I POP S IOP=$I D ^%ZIS Q
 I ASUK(ASUK("PTR"),"Q") Q
 S ASUK("PTRSEL")=1
PSER ;EP;FOR TASKMAN QUEUE OF PRINT
 D TIME^ASUUDATE
 S ASURX="W !,""S.A.M.S. Monthly Reports Printing begun "_ASUK("DT","TIME")_"""" D ^ASUUPLOG
 D O^ASUUZIS,U^ASUUZIS
 S ASUP("TYP")=+$G(ASUP("TYP")),ASUP("CKM")=$G(ASUP("CKM")),ASUP("HLT")=$G(ASUP("HLT"))
 ;begin Y2K
 ;S ASUF("RPT75")=1 S:$G(ASUDT)'?7N ASUDT=$E(ASUK("DT","FM"),1,5)_"00"
 S ASUF("RPT75")=1              ;Y2000
 I $G(ASUDT)'?7N D              ;Y2000
 .S X=$E(ASUK("DT","FM"),2,5)   ;Y2000
 .D START^ASUUY2K(.X,1,U,"Y")        ;Y2000
 .S ASUDT=Y                     ;Y2000
 .;end Y2K
 ;7/14/99 WAR Chn'd the 20 to a 14 in the next line-not doing DB Rpts
 F ASUP("MR")=1:1:14 S ASUSV("TRCD")=$T(@"SEQ"+ASUP("MR")) Q:ASUSV("TRCD")["999"  S ASUG("RTN")=$P(ASUSV("TRCD"),";",3) D  Q:$D(DUOUT)  Q:$D(DTOUT)
 .I ASUP("TYP")=0 D  Q:$D(DUOUT)  Q:$D(DTOUT)
 ..D @ASUG("RTN")  Q:$D(DUOUT)  Q:$D(DTOUT)
 .E  D  Q:$D(DUOUT)  Q:$D(DTOUT)
 ..;WAR 5/20/99 I ASUP("CKM")=ASUP("MR")+15 D  Q:$D(DUOUT)  Q:$D(DTOUT)
 ..I ASUP("CKM")=(ASUP("MR")+20) D  Q:$D(DUOUT)!($D(DTOUT))
 ...D @ASUG("RTN")  Q:$D(DUOUT)  Q:$D(DTOUT)
 ...I 'ASUP("HLT") S ASUP("CKM")=ASUP("MR")+21 D SETSM^ASUCOSTS
 I 'ASUP("HLT"),ASUP("CKM")=34 S ASUP("CKM")=35 D SETSM^ASUCOSTS
 S:$D(DTOUT) ASUP("HLT")=1
 S ASURX="W !,""S.A.M.S. Monthly Reports Printing ended "_ASUK("DT","TIME")_"""" D ^ASUUPLOG
 I ASUP("TYP")=0 D
 .D C^ASUUZIS
 .U IO(0)
 .K ASUP,ASUSV("TRCD"),ASUG("RTN"),ASUK("PTRSEL")
 E  D
 .Q:ASUP("HLT")
 .I ASUP("CKP")=11 S ASUP("CKP")=12 D SETSTAT^ASUCOSTS
 .I $D(ASUP("MO")),ASUP("CKM")=32,ASUP("MO")#3=0 D
 ..D ^ASURQSTD
 ..S ASUP("CKM")=0,ASUP("CKP")=0 D SETSTAT^ASUCOSTS
 .E  D
 ..I ASUP("CKM")>31 D
 ...S ASUP("CKM")=0 D SETSM^ASUCOSTS
 ..E  D
 ...S ASUP("HLT")=1
 K ASUP("MR")
 D TIME^ASUUDATE
 Q
SEQ ;;Input Trans
 ;;^ASURMBSP;REPORT BALANCE SHEETS
 ;;^ASURM12P ;REPORT 12
 ;;EN1^ASURM15P(.ASUDT,"M");REPORT 15
 ;;EN1^ASURM16P(.ASUDT,"M");REPORT 16
 ;;EN1^ASURM17P(.ASUDT,"M");REPORT 17
 ;;EN1^ASURM18P(.ASUDT,"M");REPORT 18
 ;;^ASURM23P;REPORT 23
 ;;^ASURM24P;REPORT 24
 ;;^ASURM74P;REPORT 74
 ;;^ASURM75P;REPORT 75
 ;;^ASURM77P;REPORT 77
 ;;^ASURM78P;REPORT 78
 ;;^ASURM79P;REPORT 79
 ;;^ASURM83P;REPORT 83
 ;;EN1^ASURMDBA(.ASUDT,"M");DATABOOK REPORT A
 ;;EN1^ASURMDBC(.ASUDT,"M");DATABOOK REPORT C
 ;;EN1^ASURMDBH(.ASUDT,"M");DATABOOK REPORT H
 ;;EN1^ASURMDBK(.ASUDT,"M","1,2,3,4,5,9,999");DATABOOK REP K1-K7
 ;;EN1^ASURMDBL(.ASUDT,"M");DATABOOK REPORT L
 ;;999;END OF SEQUENCE
