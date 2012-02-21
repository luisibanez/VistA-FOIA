PXRMVITL ; SLC/PKR - Handle vitals findings. ;10/21/2004
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;===========================================================
EVALFI(DFN,DEFARR,ENODE,FIEVAL) ;Evaluate vital measurement findings.
 D EVALFI^PXRMINDX(DFN,.DEFARR,ENODE,.FIEVAL)
 Q
 ;
 ;===========================================================
EVALPL(FINDPA,ENODE,TERMARR,PLIST) ;Evaluate vital measurement
 ;term findings for patient lists.
 D EVALPL^PXRMINDL(.FINDPA,ENODE,.TERMARR,PLIST)
 Q
 ;
 ;===========================================================
EVALTERM(DFN,FINDPA,ENODE,TERMARR,TFIEVAL) ;Evaluate vital measurement
 ;terms.
 D EVALTERM^PXRMINDX(DFN,.FINDPA,ENODE,.TERMARR,.TFIEVAL)
 Q
 ;
 ;===========================================================
GETDATA(DAS,FIEVT) ;Return the value, which is Rate, for a specified
 ;GMRV Vital Measurement entry.
 N IND,GMRVDATA,TEMP
 ;DBIA #3647
 D EN^GMVPXRM(.GMRVDATA,DAS,"I")
 I $P(GMRVDATA(1),U,1)=-1 D  Q
 . S ^TMP("PXRMXMZ",$J,1,0)="Found GMRV entry "_DAS_" in the index, but it does not exist in ^GMRV(120.5"
 . D SEND^PXRMMSG("Bad entry in Vitals index.")
 S FIEVT("TYPE")=$P(GMRVDATA(3),U,1)
 S (FIEVT("RATE"),FIEVT("VALUE"))=$P(GMRVDATA(7),U,1)
 S IND=0
 ;Load the external form of the qualifiers.
 F  S IND=$O(GMRVDATA(12,IND)) Q:IND=""  D
 . S TEMP=$P(GMRVDATA(12,IND),U,1)
 .;DBIA #4504
 . I TEMP'="" S FIEVT("QUALIFIER",IND)=$P($G(^GMRD(120.52,+TEMP,0)),U,1)
 Q
 ;
 ;===========================================================
MHVOUT(INDENT,IFIEVAL,NLINES,TEXT) ;Produce the MHV output.
 N DATE,EM,IND,JND,NAME,NOUT,RATE,TEMP,TEXTOUT,TYPE
 S TYPE=$$EXTERNAL^DILFD(120.5,.03,"",IFIEVAL("TYPE"),.EM)
 S NAME="Vital Measurement: "_TYPE_" = "
 S IND=0
 F  S IND=+$O(IFIEVAL(IND)) Q:IND=0  D
 . S RATE=$G(IFIEVAL(IND,"VALUE"))
 . I RATE="" S RATE="MISSING"
 . S DATE=IFIEVAL(IND,"DATE")
 . S TEMP=NAME_RATE_" ("_$$EDATE^PXRMDATE(DATE)_")"
 . D FORMATS^PXRMTEXT(INDENT+2,PXRMRM,TEMP,.NOUT,.TEXTOUT)
 . F JND=1:1:NOUT S NLINES=NLINES+1,TEXT(NLINES)=TEXTOUT(JND)
 S NLINES=NLINES+1,TEXT(NLINES)=""
 Q
 ;
 ;===========================================================
OUTPUT(INDENT,IFIEVAL,NLINES,TEXT) ;Produce the clinical
 ;maintenance output.
 N DATE,EM,IND,JND,NOUT,RATE,TEMP,TEXTOUT,TYPE
 S TYPE=$$EXTERNAL^DILFD(120.5,.03,"",IFIEVAL("TYPE"),.EM)
 S NLINES=NLINES+1
 S TEXT(NLINES)=$$INSCHR^PXRMEXLC(INDENT," ")_"Vital Measurement: "_TYPE
 S IND=0
 F  S IND=+$O(IFIEVAL(IND)) Q:IND=0  D
 . S DATE=IFIEVAL(IND,"DATE")
 . S TEMP=$$EDATE^PXRMDATE(DATE)
 . S RATE=$G(IFIEVAL(IND,"VALUE"))
 . I RATE="" S RATE="MISSING"
 . S TEMP=TEMP_"; rate - "_RATE
 . D FORMATS^PXRMTEXT(INDENT+2,PXRMRM,TEMP,.NOUT,.TEXTOUT)
 . F JND=1:1:NOUT S NLINES=NLINES+1,TEXT(NLINES)=TEXTOUT(JND)
 .;If there are qualifiers display them.
 . I $D(IFIEVAL(IND,"QUALIFIER")) D
 .. S TEMP="Qualifiers:"
 .. N QIND S QIND=0
 .. S QIND=$O(IFIEVAL(IND,"QUALIFIER",QIND)) S TEMP=TEMP_" "_IFIEVAL(IND,"QUALIFIER",QIND)
 .. F  S QIND=$O(IFIEVAL(IND,"QUALIFIER",QIND)) Q:QIND=""  S TEMP=TEMP_", "_IFIEVAL(IND,"QUALIFIER",QIND)
 .. D FORMATS^PXRMTEXT(INDENT+3,PXRMRM,TEMP,.NOUT,.TEXTOUT)
 .. F JND=1:1:NOUT S NLINES=NLINES+1,TEXT(NLINES)=TEXTOUT(JND)
 S NLINES=NLINES+1,TEXT(NLINES)=""
 Q
 ;
