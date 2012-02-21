PXRMEXSI ; SLC/PKR/PJH - Silent repository entry install. ;12/22/2004
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;===================================================
BUILD ;Build list manager workfile from ^TMP("PXRMEXTMP" (see ^PXRMEXLB)
 N DDATA,DDLG,IND,JND,NLINE,NSEL
 S NLINE=0,NSEL=0
 S DDLG=$G(^TMP("PXRMEXTMP",$J,"PXRMDNAM")) Q:DDLG=""
 ;
 ;Save reminder dialog
 S DDATA=^TMP("PXRMEXTMP",$J,"DLOC",DDLG)
 S IND=$P(DDATA,U,3),JND=$P(DDATA,U,4)
 D DSAVE(DDLG,IND,JND)
 ;
 ;Process sub-components
 I $D(^TMP("PXRMEXTMP",$J,"DREPL",DDLG))>0 D DREPL(DDLG)
 D DCMP(DDLG)
 Q
 ;
 ;===================================================
DCMP(DLG) ;Search for dialog components
 N DDLG,DEND,DNAM,DSEQ,DSTRT,IND,JND
 S DSEQ=0
 F  S DSEQ=$O(^TMP("PXRMEXTMP",$J,"DMAP",DLG,DSEQ)) Q:'DSEQ  D
 . S DDATA=^TMP("PXRMEXTMP",$J,"DMAP",DLG,DSEQ)
 . S DNAM=$P(DDATA,U),DSTRT=$P(DDATA,U,2),DEND=$P(DDATA,U,3) Q:DNAM=""
 . S IND=$P(DDATA,U,4),JND=$P(DDATA,U,5)
 .;Save line in workfile
 . D DSAVE(DNAM,IND,JND)
 .;
 . I $D(^TMP("PXRMEXTMP",$J,"DREPL",DNAM))>0 D DREPL(DNAM)
 .;Process any sub-components
 . I $D(^TMP("PXRMEXTMP",$J,"DMAP",DNAM)) D DCMP(DNAM)
 Q
 ;
 ;===================================================
DREPL(DLG,LEV) ;
 N DDATA,DDLG,DEND,DNAM,DSEQ,DSTRT,IND,JND
 S DDATA=^TMP("PXRMEXTMP",$J,"DREPL",DLG)
 S DNAM=$P(DDATA,U),DSTRT=$P(DDATA,U,2),DEND=$P(DDATA,U,3) Q:DNAM=""
 S IND=$P(DDATA,U,4),JND=$P(DDATA,U,5)
 ;Save line in workfile
 D DSAVE(DNAM,IND,JND)
 I $D(^TMP("PXRMEXTMP",$J,"DMAP",DNAM)) D DCMP(DNAM)
 Q
 ;===================================================
DSAVE(DNAM,IND,JND) ;Update workfile
 ;Ignore national prompts
 I $$PXRM^PXRMEXID(DNAM) Q
 N DEXIST
 S NSEL=NSEL+1
 ;Check if dialog exists
 S DEXIST=$$EXISTS^PXRMEXIU(801.41,DNAM)
 ;Store the file number, start and stop line in the exchange file.
 S ^TMP("PXRMEXLD",$J,"SEL",NSEL)=FILENUM_U_IND_U_JND_U_DEXIST
 Q
 ;
 ;===================================================
INITMPG ;Initialize ^TMP arrays.
 K ^TMP("PXRMEXIA",$J)
 K ^TMP("PXRMEXLC",$J)
 K ^TMP("PXRMEXLD",$J)
 K ^TMP("PXRMEXTMP",$J)
 Q
 ;
 ;===================================================
INSCOM(PXRMRIEN,IND,TEMP,REMNAME) ;Install component IND of PXRMRIEN.
 N ACTION,ATTR,END,EXISTS,FILENUM,IND120,JND120,NAME
 N PT01,RTN,START
 S FILENUM=$P(TEMP,U,1),EXISTS=$P(TEMP,U,4)
 S IND120=$P(TEMP,U,2),JND120=$P(TEMP,U,3)
 S TEMP=^PXD(811.8,PXRMRIEN,120,IND120,1,JND120,0)
 I (FILENUM=801.41)!(FILENUM=811.5) S ACTION=$S(EXISTS:"M",1:"I")
 E  S ACTION=$S(EXISTS:"O",1:"I")
 S START=$P(TEMP,U,2)
 S END=$P(TEMP,U,3)
 S TEMP=^PXD(811.8,PXRMRIEN,100,START,0)
 I FILENUM=0 D
 . D RTNLD^PXRMEXIC(PXRMRIEN,START,END,.ATTR,.RTN)
 .;Save what was done for the installation summary.
 . S ^TMP("PXRMEXIA",$J,IND,"ROUTINE",ATTR("NAME"),ACTION)=""
 E  D 
 . S PT01=$P(TEMP,"~",2)
 . S (ATTR("NAME"),ATTR("PT01"))=PT01
 . D SETATTR^PXRMEXFI(.ATTR,FILENUM)
 .;Save what was done for the installation summary.
 . S ^TMP("PXRMEXIA",$J,IND,ATTR("FILE NAME"),PT01,ACTION)=""
 ;Install this component.
 I FILENUM=0 D RTNSAVE^PXRMEXIC(.RTN,ATTR("NAME"))
 E  D FILE^PXRMEXIC(PXRMRIEN,EXISTS,IND120,JND120,ACTION,.ATTR,.PXRMNMCH)
 ;Save reminder name
 I FILENUM=811.9 S REMNAME=PT01
 ;If this component was not installed add to the no install message.
 Q
 ;
 ;===================================================
INSDLG(PXRMRIEN) ;Install dialog components (in reverse order)
 ;
 K ^TMP("PXRMEXSI",$J)
 N IND,TEMP,JND120,KIDSDONE
 ;Build list of components
 D BUILD
 S IND="",KIDSDONE=0
 F  S IND=$O(^TMP("PXRMEXLD",$J,"SEL",IND),-1) Q:'IND!(KIDSDONE=1)  D
 . S TEMP=^TMP("PXRMEXLD",$J,"SEL",IND),JND120=$P(TEMP,U,3)
 .;Skip install if dialog occurs more than once
 . I $D(^TMP("PXRMEXSI",$J,JND120)) Q
 . S ^TMP("PXRMEXSI",$J,JND120)=""
 .;Silent Dialog Install
 . D INSCOM(PXRMRIEN,IND,TEMP,.REMNAME)
 K ^TMP("PXRMEXSI",$J)
 Q
 ;
 ;===================================================
INSTALL(PXRMRIEN,NOR) ;Install all components in a repository entry.
 ;If NOR is true do not install routines.
 N DNAME,FILENUM,IND,PXRMNMCH,REMNAME,TEMP
 S NOR=$G(NOR)
 ;Initialize ^TMP globals.
 D INITMPG
 ;Build the component list.
 K ^PXD(811.8,PXRMRIEN,100,"B")
 K ^PXD(811.8,PXRMRIEN,120)
 D CLIST^PXRMEXU1(.PXRMRIEN)
 I PXRMRIEN=-1 Q
 ;Build the selectable list.
 D CDISP^PXRMEXLC(PXRMRIEN)
 ;Set the install date and time.
 S ^TMP("PXRMEXIA",$J,"DT")=$$NOW^XLFDT
 ;Initialize the name change storage.
 K PXRMNMCH
 S IND=0
 F  S IND=$O(^TMP("PXRMEXLC",$J,"SEL",IND)) Q:+IND=0  D
 . S TEMP=^TMP("PXRMEXLC",$J,"SEL",IND)
 . S FILENUM=$P(TEMP,U,1)
 .;If NOR is true do not install routines.
 . I FILENUM=0,NOR Q
 . ;Install dialog components
 . I FILENUM=801.41 N PXRMDONE S PXRMDONE=0 D INSDLG(PXRMRIEN) Q
 . ;Install component
 . E  D INSCOM(PXRMRIEN,IND,TEMP,.REMNAME)
 ;
 ;Get the dialog name
 S DNAME=$G(^TMP("PXRMEXTMP",$J,"PXRMDNAM"))
 ;Link the dialog if it exists
 I DNAME'="" D
 . N DIEN,RIEN
 .;Get the dialog ien
 . S DIEN=$$EXISTS^PXRMEXIU(801.41,DNAME) Q:'DIEN
 .;Get the reminder ien
 . S RIEN=+$$EXISTS^PXRMEXIU(811.9,$G(REMNAME)) Q:'RIEN
 . I RIEN>0 D
 .. N DA,DIE,DIK,DR
 ..;Set reminder to dialog pointer
 .. S DR="51///^S X=DNAME",DIE="^PXD(811.9,",DA=RIEN
 .. D ^DIE
 ;
 ;Save the install history.
 D SAVHIST^PXRMEXU1
 ;If any components were skipped send the message.
 I $D(^TMP("PXRMEXNI",$J)) D
 . N NE,XMSUB
 . S NE=$O(^TMP("PXRMEXNI",$J,""),-1)+1
 . S ^TMP("PXRMEXNI",$J,NE,0)="Please review and make changes as necessary."
 . K ^TMP("PXRMXMZ",$J)
 . M ^TMP("PXRMXMZ",$J)=^TMP("PXRMEXNI",$J)
 . S XMSUB="COMPONENTS SKIPPED DURING SILENT MODE INSTALL"
 . D SEND^PXRMMSG(XMSUB)
 ;Cleanup TMP globals.
 D INITMPG
 Q
 ;
