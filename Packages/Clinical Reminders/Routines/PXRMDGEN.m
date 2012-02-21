PXRMDGEN ; SLC/PKR - Handle VA GENERIC drug findings. ;08/04/2004
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;=====================================================
EVALFI(DFN,DEFARR,ENODE,FIEVAL) ;Evaluate VA GENERIC (file #50.6)
 ;findings.
 D EVALFI^PXRMDRGR(DFN,.DEFARR,ENODE,"AND",.FIEVAL)
 Q
 ;
 ;=====================================================
EVALTERM(DFN,FINDPA,ENODE,TERMARR,TFIEVAL) ;Evaluate VA GENERIC
 ;(file #50.6) terms.
 D EVALTERM^PXRMDRGR(DFN,.FINDPA,ENODE,"AND",.TERMARR,.TFIEVAL)
 Q
 ;
 ;=====================================================
EVALPL(FINDPA,ENODE,TERMARR,PLIST) ;Evaluate VA GENERIC terms for
 ;building patient lists.
 D EVALPL^PXRMDRGR(.FINDPA,ENODE,"AND",.TERMARR,.PLIST)
 Q
 ;
 ;=====================================================
MHVOUT(INDENT,IFIEVAL,NLINES,TEXT) ;Produce the MHV output.
 N FTYPE,IND,NAME,PFIEVAL,TEMP,VAGEN,VAGIEN
 S VAGIEN=$P(IFIEVAL("FINDING"),";",1)
 ;DBIA #2531
 S VAGEN=$$VAGN^PSNAPIS(VAGIEN)
 S NLINES=NLINES+1,TEXT(NLINES)="VA Generic: "_VAGEN
 S IND=0
 F  S IND=+$O(IFIEVAL(IND)) Q:IND=0  D
 . S TEMP=IFIEVAL(IND,"FINDING")
 . S FTYPE=$P(TEMP,";",2)
 . K PFIEVAL M PFIEVAL=IFIEVAL(IND)
 . I FTYPE="PS(55," D MHVOUT^PXRMDIN(INDENT+1,.PFIEVAL,.NLINES,.TEXT) Q
 . I FTYPE="PS(55NVA," D MHVOUT^PXRMDNVA(INDENT+1,.PFIEVAL,.NLINES,.TEXT) Q
 . I FTYPE="PSRX(" D MHVOUT^PXRMDOUT(INDENT+1,.PFIEVAL,.NLINES,.TEXT) Q
 S NLINES=NLINES+1,TEXT(NLINES)=""
 Q
 ;
 ;=====================================================
OUTPUT(INDENT,IFIEVAL,NLINES,TEXT) ;Produce the clinical
 ;maintenance output.
 N IND,PFIEVAL,TEMP,VAGEN,VAGIEN
 S VAGIEN=$P(IFIEVAL("FINDING"),";",1)
 ;DBIA #2531
 S VAGEN=$$VAGN^PSNAPIS(VAGIEN)
 S NLINES=NLINES+1
 S TEXT(NLINES)=$$INSCHR^PXRMEXLC(INDENT," ")_"VA Generic: "_VAGEN
 S IND=0
 F  S IND=+$O(IFIEVAL(IND)) Q:IND=0  D
 . S TEMP=IFIEVAL(IND,"FINDING")
 . S FTYPE=$P(TEMP,";",2)
 . K PFIEVAL M PFIEVAL=IFIEVAL(IND)
 . I FTYPE="PS(55," D OUTPUT^PXRMDIN(INDENT+1,.PFIEVAL,.NLINES,.TEXT) Q
 . I FTYPE="PS(55NVA," D OUTPUT^PXRMDNVA(INDENT+1,.PFIEVAL,.NLINES,.TEXT) Q
 . I FTYPE="PSRX(" D OUTPUT^PXRMDOUT(INDENT+1,.PFIEVAL,.NLINES,.TEXT) Q
 S NLINES=NLINES+1,TEXT(NLINES)=""
 Q
 ;
