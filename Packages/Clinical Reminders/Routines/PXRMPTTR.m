PXRMPTTR ;SLC/PKR - Routines for term print templates ;08/04/2004
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;====================================================
DATE(FIND0,PIECE,FLDNUM,TITLE,RJC,PAD,FILENUM,FLG) ;Standard DATE
 N DATE,TEXT
 S DATE=$P($G(FIND0),U,PIECE)
 I DATE'="" D
 . S DATE=$$FMTE^XLFDT(DATE,"D")
 . S TEXT=$$RJ^XLFSTR(TITLE,RJC,PAD)
 . S TEXT=TEXT_" "_DATE
 . W !,TEXT
 Q
 ;
 ;====================================================
GENIEN(FINDING) ;Return internal entry number for findings.
 N F0,IEN,PREFIX,ROOT,VPTR
 S ROOT="^PXRMD(811.5,D0,20,FINDING,0)"
 S F0=@ROOT
 S VPTR=$P(F0,U,1)
 S IEN=$P(VPTR,";",1)
 S ROOT=$P(VPTR,";",2)
 I '$D(PXRMFVPL) N PXRMFVPL D BLDRLIST^PXRMVPTR(811.52,.01,.PXRMFVPL)
 S VPTR=PXRMFVPL(ROOT)
 S PREFIX=$P(VPTR,U,4)
 Q " (FI("_+FINDING_")="_PREFIX_"("_IEN_"))"
 ;
 ;====================================================
ENTRYNAM(VPTR) ;Given the variable pointer return the entry name. The
 ;variable pointer list contains the information necessary to do the
 ;look up.
 N IEN,FILENUM,NAME,ROOT
 S IEN=$P(VPTR,";",1)
 S ROOT=$P(VPTR,";",2)
 S FILENUM=$P(PXRMFVPL(ROOT),U,1)
 S NAME=$$GET1^DIQ(FILENUM,IEN,.01,"","","")
 Q NAME
 ;
 ;====================================================
PFIND ;Print the reminder term finding multiple.
 N CFP,FIELD,FINDING,FIND0,HFCAT,HFIEN,PAD,PXRMFVPL
 N RJC,SCNT,SIEN,STAT0,TEXT
 ;If called by a FileMan print build the variable pointer list.
 I '$D(PXRMFVPL) N PXRMFVPL D BLDRLIST^PXRMVPTR(811.52,.01,.PXRMFVPL)
 S PAD=" ",RJC=31
 S FINDING=0
 F  S FINDING=$O(^PXRMD(811.5,D0,20,FINDING)) Q:+FINDING=0  D
 . S FIND0=^PXRMD(811.5,D0,20,FINDING,0)
 . S FIELD=$P(FIND0,U,1)
 . S TEXT=$$RJ^XLFSTR("Finding Item:",RJC,PAD)
 . S TEXT=TEXT_"  "_$$ENTRYNAM(FIELD)
 . S TEXT=TEXT_" "_$$TRMIEN(FINDING)
 . W !!,TEXT
 .;
 . S TEXT=$$RJ^XLFSTR("Finding Type:",RJC,PAD)
 . S TEXT=TEXT_"  "_$$TFTYPE(FIELD)
 . W !,TEXT
 . I FIND0["AUTTHF" D 
 .. S HFIEN=$P($P(FIND0,U),";")
 .. S HFCAT=$P($G(^AUTTHF(HFIEN,0)),U,3)
 .. S HFCAT=$P($G(^AUTTHF(HFCAT,0)),U)
 .. S TEXT=$$RJ^XLFSTR("Health Factor Category:",RJC,PAD)
 .. S TEXT=TEXT_"  "_HFCAT
 .. W !,TEXT
 .;
 . S FIELD=$P(FIND0,U,4)
 . I $L(FIELD)>0 D
 .. S TEXT=$$RJ^XLFSTR("Match Frequency/Age:",RJC,PAD)
 .. S TEXT=TEXT_"  "_$$GENFREQ^PXRMPTD2(FIND0)
 .. W !,TEXT
 .;
 . D DATE(FIND0,8,9,"Beginning Date/Time:",RJC,PAD)
 . D DATE(FIND0,11,12,"Ending Date/Time Date:",RJC,PAD)
 . D SFDISP(FIND0,14,17,"Occurrence Count:",RJC,PAD)
 . D SFDISP(FIND0,9,10,"Use Inactive Problems:",RJC,PAD)
 . D SFDISP(FIND0,10,11,"Within Category Rank:",RJC,PAD)
 . D SFDISP(FIND0,12,13,"MH Scale:",RJC,PAD)
 . D SFDISP(FIND0,13,16,"Rx Type:",RJC,PAD)
 . I $D(^PXRMD(811.5,D0,20,FINDING,5,0))=1 D
 .. S (SCNT,SIEN)=0
 .. F  S SIEN=$O(^PXRMD(811.5,D0,20,FINDING,5,SIEN)) Q:SIEN=""  D
 ... S STAT0=$G(^PXRMD(811.5,D0,20,FINDING,5,SIEN,0))
 ... D STATUS(STAT0,"Status List:") S SCNT=SCNT+1
 .;
 . S FIND0=$G(^PXRMD(811.5,D0,20,FINDING,3))
 . D SFDISP(FIND0,1,14,"Condition:",RJC,PAD)
 . D SFDISP(FIND0,2,15,"Condition Case Sensitive:",RJC,PAD)
 . D SFDISP(FIND0,3,18,"Use Cond in Finding Search:",RJC,PAD)
 . I $G(^PXRMD(811.5,D0,20,FINDING,15))'="" D
 .. S CFP=$$RJ^XLFSTR("Computed Finding Parameter:",RJC,PAD)
 .. S CFP=CFP_"  "_$G(^PXRMD(811.5,D0,20,FINDING,15))
 .. W !,CFP
 Q
 ;
 ;====================================================
SFDISP(FIND0,PIECE,FLDNUM,TITLE,RJC,PAD) ;Standard finding multiple
 ;field display.
 N FIELD,TEXT
 S FIELD=$P(FIND0,U,PIECE)
 I $L(FIELD)>0 D
 . S TEXT=$$RJ^XLFSTR(TITLE,RJC,PAD)
 . S TEXT=TEXT_"  "_$$EXTERNAL^DILFD(811.52,FLDNUM,"",FIELD,"")
 . W !,TEXT
 Q
 ;
 ;====================================================
STATUS(STAT0,TITLE) ; Status display
 I $L(STAT0)>0 D
 . N STATUS
 . I SCNT=0 S STATUS=$$RJ^XLFSTR(TITLE,RJC,PAD)
 . I SCNT>0 S STATUS=$$RJ^XLFSTR("",RJC,PAD)
 . S STATUS=STATUS_"  "_STAT0
 . W !,STATUS
 Q
 ;
 ;====================================================
TFTYPE(VPTR) ;Return Term finding type
 N ROOT,TFTYPE
 S ROOT=$P(VPTR,";",2)
 I '$D(PXRMFVPL) N PXRMFVPL D BLDRLIST^PXRMVPTR(811.52,.01,.PXRMFVPL)
 S TFTYPE=$P(PXRMFVPL(ROOT),U,2)
 Q TFTYPE
 ;
 ;====================================================
TRMIEN(FINDING) ;Return internal entry number for TERM findings.
 N F0,IEN,PREFIX,ROOT,VPTR
 S ROOT="^PXRMD(811.5,D0,20,FINDING,0)"
 S F0=@ROOT
 S VPTR=$P(F0,U,1)
 S IEN=$P(VPTR,";",1)
 S ROOT=$P(VPTR,";",2)
 I '$D(PXRMFVPL) N PXRMFVPL D BLDRLIST^PXRMVPTR(811.52,.01,.PXRMFVPL)
 S VPTR=PXRMFVPL(ROOT)
 S PREFIX=$P(VPTR,U,4)
 Q " (FI("_+FINDING_")="_PREFIX_"("_IEN_"))"
 ;
