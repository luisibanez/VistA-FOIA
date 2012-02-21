PXRMEXCS ; SLC/PKR - Routines to compute checksums. ;12/21/2004
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;====================================================
FILE(FILENUM,IEN) ;Return checksum for entry IEN in file FILENUM.
 N CS,LC,REF,ROOT,TARGET
 D FILE^DID(FILENUM,"","GLOBAL NAME","TARGET")
 S ROOT=$$CREF^DILF(TARGET("GLOBAL NAME"))
 K ^TMP($J,"PXRMEXCS")
 M ^TMP($J,"PXRMEXCS")=@ROOT@(IEN)
 S REF="^TMP($J,""PXRMEXCS"")"
 S REF=$NA(@REF)
 S (CS,LC)=0
 F  S REF=$Q(@REF) Q:REF'["PXRMEXCS"  S LC=LC+1,CS=CS+$$LINECS(LC,@REF)
 K ^TMP($J,"PXRMEXCS")
 Q CS
 ;
 ;====================================================
HFCS(PATH,FILENAME) ;Return checksum for host file.
 N CS,GBL,GBLZISH,SUCCESS
 K ^TMP($J,"PXRMHFCS")
 S GBL="^TMP($J,""PXRMHFCS"")"
 S GBLZISH="^TMP($J,""PXRMHFCS"",1)"
 S GBLZISH=$NA(@GBLZISH)
 S SUCCESS=$$FTG^%ZISH(PATH,FILENAME,GBLZISH,3)
 S CS=$S(SUCCESS:$$HFCSGBL(GBL),1:-1)
 K ^TMP($J,"PXRMHFCS")
 Q CS
 ;
 ;====================================================
HFCSGBL(GBL) ;Return checksum for host file loaded into global GBL.
 N CS,IND,LINE
 S (CS,IND)=0
 F  S IND=$O(@GBL@(IND)) Q:+IND=0  S LINE=@GBL@(IND),CS=CS+$$LINECS(IND,LINE)
 Q CS
 ;
 ;====================================================
LINECS(LINENUM,STRING) ;Return checksum of line number LINEUM whose contents
 ;is STRING.
 N CS,IND,LEN
 S CS=0
 S LEN=$L(STRING)
 F IND=1:1:LEN S CS=CS+($A(STRING,IND)*(LINENUM+IND))
 Q CS
 ;
 ;====================================================
MMCS(XMZ) ;Return checksum for MailMan message ien XMZ.
 N CS,IND,LINE,NLINES
 S NLINES=+$P($G(^XMB(3.9,XMZ,2,0)),U,3)
 S CS=0
 F IND=1:1:NLINES S LINE=$G(^XMB(3.9,XMZ,2,IND,0)),CS=CS+$$LINECS(IND,LINE)
 Q CS
 ;
 ;====================================================
ROUTINE(RA) ;Return checksum for a routine loaded in array RA. RA has the
 ;form created by ^%ZOSF("LOAD") i.e, RA(1,0) ... RA(N,0).
 N CS,IND,LINE
 S (CS,IND)=0
 F  S IND=$O(RA(IND)) Q:+IND=0  S CS=CS+$$LINECS(IND,RA(IND,0))
 Q CS
 ;
 ;====================================================
RTN(ROUTINE) ;Return checksum for a routine ROUTINE.
 N CS,DIF,RA,X,XCNP
 S XCNP=0
 S DIF="RA("
 S X=ROUTINE
 ;Make sure the routine exists.
 X ^%ZOSF("TEST")
 I $T D
 . X ^%ZOSF("LOAD")
 . S CS=$$ROUTINE(.RA)
 E  S CS=-1
 Q CS
 ;
