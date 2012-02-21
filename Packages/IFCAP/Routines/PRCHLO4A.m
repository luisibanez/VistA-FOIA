PRCHLO4A ;WOIFO/RLL-EXTRACT ROUTINE CLO REPORT SERVER ; 12/26/05 10:59pm
V ;;5.1;IFCAP;**83**;; Oct 20, 2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 ; Continuation of PRCHLO4
 ;
 ; PRCHLO4A routines are used to Write out the Header and data
 ;
 Q
GETDIR ; Get directory from PRCPLO EXTRACT DIRECTORY system parameter for CLRS
 N FILEDIR,STID
 S STID=$$GET1^DIQ(4,$$KSP^XUPARAM("INST")_",",99)
 S FILEDIR=$$GET^XPAR("SYS","PRCPLO EXTRACT DIRECTORY",1,"Q")
 ;
 Q
 ;
CRTWIN ; Create CLRSxxxWFTP.TXT  file to transfer file(s)
 N FILEDIR,POP,STID,OUTFLL1
 S STID=$$GET1^DIQ(4,$$KSP^XUPARAM("INST")_",",99)
 S POP=""  ; POP is returned by OPEN^%ZISH
 S FILEDIR=$$GET^XPAR("SYS","PRCPLO EXTRACT DIRECTORY",1,"Q")
 S OUTFLL1="CLRS"_STID_"WFTP.TXT"
 D OPEN^%ZISH("FILE1",FILEDIR,OUTFLL1,"W")
 I POP  D
 . S CLRSERR=3
 . Q
 I CLRSERR'=3  D
 . D USE^%ZISUTL("FILE1")
 . W "open 10.128.102.204",!   ; Connect to the Report Server
 . W "clrsadmin",!  ; Enter user name for Report Server Login
 . W "1025clrs",!  ;pw=1025clrs Enter P/W for Report Server Login
 . W "PUT "_FILEDIR_"IFCP"_STID_"F1.TXT",!
 . W "PUT "_FILEDIR_"IFCP"_STID_"F2.TXT",!
 . W "PUT "_FILEDIR_"IFCP"_STID_"F3.TXT",!
 . W "PUT "_FILEDIR_"IFCP"_STID_"F4.TXT",!
 . W "PUT "_FILEDIR_"IFCP"_STID_"F5.TXT",!
 . W "PUT "_FILEDIR_"IFCP"_STID_"F6.TXT",!
 . W "PUT "_FILEDIR_"IFCP"_STID_"F7.TXT",!
 . W "PUT "_FILEDIR_"IFCP"_STID_"F8.TXT",!
 . W "PUT "_FILEDIR_"IFCP"_STID_"F9.TXT",!
 . W "PUT "_FILEDIR_"IFCP"_STID_"F10.TXT",!
 . W "PUT "_FILEDIR_"IFCP"_STID_"F11.TXT",!
 . W "PUT "_FILEDIR_"IFCP"_STID_"F12.TXT",!
 . W "PUT "_FILEDIR_"IFCP"_STID_"F13.TXT",!
 . W "PUT "_FILEDIR_"IFCP"_STID_"F14.TXT",!
 . W "PUT "_FILEDIR_"IFCP"_STID_"F15.TXT",!
 . W "PUT "_FILEDIR_"IFCP"_STID_"F16.TXT",!
 . W "PUT "_FILEDIR_"IFCP"_STID_"F17.TXT",!
 . W "PUT "_FILEDIR_"IFCP"_STID_"F18.TXT",!
 . W "PUT "_FILEDIR_"IFCP"_STID_"F19.TXT",!
 . W "PUT "_FILEDIR_"IFCP"_STID_"G1.TXT",!
 . W "PUT "_FILEDIR_"IFCP"_STID_"G2.TXT",!
 . W "PUT "_FILEDIR_"CLRS"_STID_"FTP1.LOG",!
 . W "bye",!  ; Exit FTP
 . D CLOSE^%ZISH("FILE1")
 . Q
 Q
CKRPTSV ; Check for availability of report server
 ; Several steps need to be performed
 ; 1. Set up script to perform PING
 ; 2. Capture log file during PING
 ; 3. Read logfile into working global
 ; 4. Determine Success/Failure of PING to server
 ; 5. If successful, continue processing (CLRSERR=0)
 ; 6. If problem occurs, S CLRSERR=3 and generate message
 ;
 I CKOS["VMS" D VMSPING  ; CKOS set in PRCHLO5
 I CKOS["NT" D WINPING  ; CKOS set in PRCHLO5
 Q
VMSPING ; need to PING report server to make sure it is available
 ;
 ; 1. Create .COM file to execute
 N FILEDIR,STID,OUTFLL2
 S STID=$$GET1^DIQ(4,$$KSP^XUPARAM("INST")_",",99)
 S FILEDIR=$$GET^XPAR("SYS","PRCPLO EXTRACT DIRECTORY",1,"Q")
 S OUTFLL2="CLRS"_STID_"PING.COM"
 D OPEN^%ZISH("FILE1",FILEDIR,OUTFLL2,"W")
 D USE^%ZISUTL("FILE1")
 W "$ SET VERIFY=(PROCEDURE,IMAGE)",!
 W "$ SET DEFAULT "_FILEDIR,!
 W "$ TCPIP",!
 W "PING 10.128.102.204",!
 W "EXIT",!
 W "$ EXIT 3",!
 D CLOSE^%ZISH("FILE1")
 ;
 ;
 ; 2. Execute .COM file, create logfile
 S XPV1="S PV=$ZF(-1,""@"_FILEDIR_"CLRS"_STID_"PING.COM/OUTPUT="_FILEDIR_"CLRS"_STID_"PING.LOG"")"
 X XPV1  ; Run the .com file
 ;Q
 ; 3. Read Logfile into working global
 N FNAME,XLOG
 ; S FILEDIR=$$GET^XPAR("SYS","PRCPLO EXTRACT DIRECTORY",1,"Q")
 ; S STID=$$GET1^DIQ(4,$$KSP^XUPARAM("INST")_",",99)
 S FNAME="CLRS"_STID_"PING.LOG"
 S XLOG=$$FTG^%ZISH(FILEDIR,FNAME,$NAME(^TMP("CLRSLOG",$J,1)),3)
 ; Check global for %SYSTEM or 0 packets received
 N PNG,PNG1,PNG2,PNG3
 S PNG=0,PNG1=0,PNG2=0
 F  S PNG=$O(^TMP("CLRSLOG",$J,PNG)) Q:PNG=""  D
 . S PNG1=$G(^TMP("CLRSLOG",$J,PNG))
 . I PNG1["0 packets received" S CLRSERR=3
 . I PNG1["%SYSTEM" S CLRSERR=3
 . Q
 Q
WINPING ; PING report server to make sure it is available
 N PV,XPV1,FILEDIR,STID,XLOG
 S FILEDIR=$$GET^XPAR("SYS","PRCPLO EXTRACT DIRECTORY",1,"Q")
 S STID=$$GET1^DIQ(4,$$KSP^XUPARAM("INST")_",",99)
 S XPV1="S PV=$ZF(-1,""PING 10.128.102.204>"_FILEDIR_"CLRS"_STID_"PING.LOG"")"
 X XPV1
 S FNAME="CLRS"_STID_"PING.LOG"
 S XLOG=$$FTG^%ZISH(FILEDIR,FNAME,$NAME(^TMP("CLRSLOG",$J,1)),3)
 N PNG,PNG1,PNG2,PNG3
 S PNG=0,PNG1=0,PNG2=0
 F  S PNG=$O(^TMP("CLRSLOG",$J,PNG)) Q:PNG=""  D
 . S PNG1=$G(^TMP("CLRSLOG",$J,PNG))
 . I PNG1["Received = 0" S CLRSERR=3
 . Q
 Q
 ;
LOG2FILE ; Set logfile to global, add to mail message
 ;
 ;
 N FILEDIR,STID,FNAME,XLOG
 S FILEDIR=$$GET^XPAR("SYS","PRCPLO EXTRACT DIRECTORY",1,"Q")
 S STID=$$GET1^DIQ(4,$$KSP^XUPARAM("INST")_",",99)
 S FNAME="CLRS"_STID_"FTP1.LOG"
 S XLOG=$$FTG^%ZISH(FILEDIR,FNAME,$NAME(^TMP("PRCHLOG",$J,1)),3)
 ; Log file is in the global ^TMP("PRCHLOG", lets put it in
 ; the message beginning at PRCPMSG(11)
 ;
 N LG1,LG2,LG3,LG4,LGCNT
 S LG1=0,LG2=0,LG3=0,LG4=0,LGCNT=11
 F  S LG1=$O(^TMP("PRCHLOG",$J,LG1)) Q:LG1=""  D
 . S LG3=$G(^TMP("PRCHLOG",$J,LG1))
 . S PRCPMSG(LGCNT)=LG3
 . S LGCNT=LGCNT+1
 . Q
 D MAILFTP^PRCHLO5
 Q
FTPCOM ; Issue the FTP command after CLRSxxxWFTP.TXT file is built
 ; remain in CACHE during FTP Process using
 ; $ZF(-1) call
 ;
 N PV,XPV1,FILEDIR,STID
 ;
 S FILEDIR=$$GET^XPAR("SYS","PRCPLO EXTRACT DIRECTORY",1,"Q")
 S STID=$$GET1^DIQ(4,$$KSP^XUPARAM("INST")_",",99)
 ; SACC Exception received for usage of $ZF(-1) in PRC*5.1*83
 ; See IFCAP Technical Manual
 S XPV1="S PV=$ZF(-1,""ftp -s:"_FILEDIR_"CLRS"_STID_"WFTP.TXT>"_FILEDIR_"CLRS"_STID_"FTP1.LOG"")"
 X XPV1  ; FTP the files
 ;
 ; error flag logic
 I PV=-1  D  ; Note, this error is logged on system error during xfer
 . S CLRSERR=1
 . Q
 Q
DELWIN ; Delete windows files
 ;
 ;
 I CKOS["NT"  D
 . N PV,PV1,XPV,XPV1
 . Q:CLRSERR'=0
 . S XPV="S PV=$ZF(-1,""DEL "_FILEDIR_"IFCP"_STID_"F1.TXT"")" X XPV
 . S XPV="S PV=$ZF(-1,""DEL "_FILEDIR_"IFCP"_STID_"F2.TXT"")" X XPV
 . S XPV="S PV=$ZF(-1,""DEL "_FILEDIR_"IFCP"_STID_"F3.TXT"")" X XPV
 . S XPV="S PV=$ZF(-1,""DEL "_FILEDIR_"IFCP"_STID_"F4.TXT"")" X XPV
 . S XPV="S PV=$ZF(-1,""DEL "_FILEDIR_"IFCP"_STID_"F5.TXT"")" X XPV
 . S XPV="S PV=$ZF(-1,""DEL "_FILEDIR_"IFCP"_STID_"F6.TXT"")" X XPV
 . S XPV="S PV=$ZF(-1,""DEL "_FILEDIR_"IFCP"_STID_"F7.TXT"")" X XPV
 . S XPV="S PV=$ZF(-1,""DEL "_FILEDIR_"IFCP"_STID_"F8.TXT"")" X XPV
 . S XPV="S PV=$ZF(-1,""DEL "_FILEDIR_"IFCP"_STID_"F9.TXT"")" X XPV
 . S XPV="S PV=$ZF(-1,""DEL "_FILEDIR_"IFCP"_STID_"F10.TXT"")" X XPV
 . S XPV="S PV=$ZF(-1,""DEL "_FILEDIR_"IFCP"_STID_"F11.TXT"")" X XPV
 . S XPV="S PV=$ZF(-1,""DEL "_FILEDIR_"IFCP"_STID_"F12.TXT"")" X XPV
 . S XPV="S PV=$ZF(-1,""DEL "_FILEDIR_"IFCP"_STID_"F13.TXT"")" X XPV
 . S XPV="S PV=$ZF(-1,""DEL "_FILEDIR_"IFCP"_STID_"F14.TXT"")" X XPV
 . S XPV="S PV=$ZF(-1,""DEL "_FILEDIR_"IFCP"_STID_"F15.TXT"")" X XPV
 . S XPV="S PV=$ZF(-1,""DEL "_FILEDIR_"IFCP"_STID_"F16.TXT"")" X XPV
 . S XPV="S PV=$ZF(-1,""DEL "_FILEDIR_"IFCP"_STID_"F17.TXT"")" X XPV
 . S XPV="S PV=$ZF(-1,""DEL "_FILEDIR_"IFCP"_STID_"F18.TXT"")" X XPV
 . S XPV="S PV=$ZF(-1,""DEL "_FILEDIR_"IFCP"_STID_"F19.TXT"")" X XPV
 . S XPV="S PV=$ZF(-1,""DEL "_FILEDIR_"IFCP"_STID_"G1.TXT"")" X XPV
 . S XPV="S PV=$ZF(-1,""DEL "_FILEDIR_"IFCP"_STID_"G2.TXT"")" X XPV
 . Q
 Q
