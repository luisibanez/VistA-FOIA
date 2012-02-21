PXRMMH ; SLC/PKR - Handle mental health findings. ;05/14/2004
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;=======================================================
EVALFI(DFN,DEFARR,ENODE,FIEVAL) ;Evaluate mental health findings.
 D EVALFI^PXRMINDX(DFN,.DEFARR,ENODE,.FIEVAL)
 Q
 ;
 ;=======================================================
EVALPL(FINDPA,ENODE,TERMARR,PLIST) ;Evaluate mental health term findings
 ;for patient lists.
 D EVALPL^PXRMINDL(.FINDPA,ENODE,.TERMARR,PLIST)
 Q
 ;=======================================================
EVALTERM(DFN,FINDPA,ENODE,TERMARR,TFIEVAL) ;Evaluate mental
 ;health instrument terms.
 D EVALTERM^PXRMINDX(DFN,.FINDPA,ENODE,.TERMARR,.TFIEVAL)
 Q
 ;
 ;=======================================================
GETDATA(DAS,FIEVT) ;Return the data for a Psych Instrument Patient entry.
 ;Some tests require the YSP key in order to get a score.
 N DASP,IND,SCALE,YSDATA
 ;DBIA #4442
 S DASP=$P(DAS,"S",1)
 S SCALE=$P(DAS,"S",2)
 D ENDAS^YTAPI10(.YSDATA,DASP)
 I $G(YSDATA(0))="[ERROR]" Q
 S FIEVT("MH TEST")=$P(YSDATA(2),U,3)
 I FIEVT("MH TEST")["GAF" S FIEVT("RATING")=$P(YSDATA(3),U,2) Q
 ;If no scale is specified use the first set of results.
 S IND=$S(SCALE="":6,1:SCALE+5)
 S FIEVT("YSDATA")=$G(YSDATA(IND))
 S FIEVT("SCALE NAME")=$P(FIEVT("YSDATA"),U,2)
 S (FIEVT("RAW SCORE"),FIEVT("VALUE"))=$P(FIEVT("YSDATA"),U,3)
 S FIEVT("TRANSFORMED SCORE")=$P(FIEVT("YSDATA"),U,4)
 Q
 ;
 ;=======================================================
MHVOUT(INDENT,IFIEVAL,NLINES,TEXT) ;Produce the MHV output.
 N DATE,IND,JND,MHTEST,NAME,NOUT,RATING,RSCORE,SCORE,TEXTOUT,TSCORE
 S MHTEST=IFIEVAL("MH TEST")
 ;Remove the dashes surrounding the name.
 S MHTEST=$TR(MHTEST,"-","")
 S NAME="Mental Health Test: "_MHTEST_" = "
 S IND=0
 F  S IND=+$O(IFIEVAL(IND)) Q:IND=0  D
 . S DATE=IFIEVAL(IND,"DATE")
 . S RSCORE=$G(IFIEVAL(IND,"RAW SCORE"))
 . S TSCORE=$G(IFIEVAL(IND,"TRANSFORMED SCORE"))
 . S RATING=$G(IFIEVAL(IND,"RATING"))
 . S SCORE=$S(RATING'="":RATING,TSCORE'="":TSCORE,RSCORE'="":RSCORE,1:"")
 . S TEMP=NAME_SCORE_" ("_$$EDATE^PXRMDATE(IFIEVAL(IND,"DATE"))_")"
 . D FORMATS^PXRMTEXT(INDENT+2,PXRMRM,TEMP,.NOUT,.TEXTOUT)
 . F JND=1:1:NOUT S NLINES=NLINES+1,TEXT(NLINES)=TEXTOUT(JND)
 S NLINES=NLINES+1,TEXT(NLINES)=""
 Q
 ;
 ;=======================================================
OUTPUT(INDENT,IFIEVAL,NLINES,TEXT) ;Produce the clinical
 ;maintenance output.
 N DATE,IND,JND,MHTEST,NOUT,RATING,RSCORE,TEXTOUT,TSCORE
 S MHTEST=IFIEVAL("MH TEST")
 ;Remove the dashes surrounding the name.
 S MHTEST=$TR(MHTEST,"-","")
 S NLINES=NLINES+1
 S TEXT(NLINES)=$$INSCHR^PXRMEXLC(INDENT," ")_"Mental Health Test: "_MHTEST
 S IND=0
 F  S IND=+$O(IFIEVAL(IND)) Q:IND=0  D
 . S DATE=IFIEVAL(IND,"DATE")
 . S TEMP=$$EDATE^PXRMDATE(IFIEVAL(IND,"DATE"))
 . S RSCORE=$G(IFIEVAL(IND,"RAW SCORE"))
 . I RSCORE'="" S TEMP=TEMP_" raw score - "_RSCORE
 . S TSCORE=$G(IFIEVAL(IND,"TRANSFORMED SCORE"))
 . I TSCORE'="" S TEMP=TEMP_"; transformed score - "_TSCORE
 . S RATING=$G(IFIEVAL(IND,"RATING"))
 . I RATING'="" S TEMP=TEMP_" Rating: "_RATING
 . D FORMATS^PXRMTEXT(INDENT+2,PXRMRM,TEMP,.NOUT,.TEXTOUT)
 . F JND=1:1:NOUT S NLINES=NLINES+1,TEXT(NLINES)=TEXTOUT(JND)
 S NLINES=NLINES+1,TEXT(NLINES)=""
 Q
 ;
 ;=======================================================
SCHELP(MHIEN) ;Xecutable help for MH SCALE
 N IND,JND,NUM,SCALE,TEMP,TEMP1
 I MHIEN=0 D  Q
 . S SCALE(1)="This is not a valid Mental Health finding, selecting an MH scale does"
 . S SCALE(2)="not make sense"
 . D EN^DDIOL(.SCALE)
 S SCALE(1)="SCALE NUMBER  SCALE NAME"
 S SCALE(2)="------------------------"
 S IND=0
 S JND=2
 F  S IND=$O(^YTT(601,MHIEN,"S",IND)) Q:+IND=0  D
 . S TEMP=^YTT(601,MHIEN,"S",IND,0)
 . S JND=JND+1
 . S TEMP1=$P(TEMP,U,1)
 . S NUM=6-$L(TEMP1)
 . S SCALE(JND)=$$INSCHR^PXRMEXLC(NUM," ")_TEMP1_"        "_$P(TEMP,U,2)
 D EN^DDIOL(.SCALE)
 Q
 ;
 ;=======================================================
SCHELPF ;Xecutable help for MH SCALE in 811.9 findings.
 N FIND0,MHIEN
 S FIND0=^PXD(811.9,DA(1),20,DA,0)
 I FIND0["YTT(601" S MHIEN=$P(FIND0,";",1)
 E  S MHIEN=0
 D SCHELP(MHIEN)
 Q
 ;
 ;=======================================================
SCHELPT ;Xecutable help for MH SCALE in 811.5 findings.
 N MHIEN,TFIND0
 S TFIND0=^PXRMD(811.5,DA(1),20,DA,0)
 I TFIND0["YTT(601" S MHIEN=$P(TFIND0,";",1)
 E  S MHIEN=0
 D SCHELP(MHIEN)
 Q
 ;
 ;=======================================================
SEVALFI(DFN,ITEM,NGET,SDIR,BDT,EDT,NFOUND,FLIST) ;
 N FIEV,FINDING,IND,YS,YSDATA
 S YS("CODE")=ITEM,YS("DFN")=DFN
 S YS("BEGIN")=BDT,YS("END")=EDT
 S YS("LIMIT")=$S(SDIR=-1:NGET,1:-NGET)
 ;DBIA #4458
 D PTTEST^YTAPI10A(.YSDATA,.YS)
 S NFOUND=$P(YSDATA(1),U,2)
 I NFOUND=0 Q
 F IND=1:1:NFOUND S FLIST(IND)=YSDATA(IND+1)
 Q
 ;
 ;=======================================================
SEVALPL(ITEM,NOCC,BDT,EDT,PLIST) ;Use MH API to get patient list. Called
 ;from PXRMINDL.
 N YS
 S YS("CODE")=ITEM,YS("BEGIN")=BDT,YS("END")=EDT,YS("LIMIT")=NOCC
 ;DBIA #4458
 D OCCUR^YTAPI10A(PLIST,.YS)
 Q
 ;
 ;=======================================================
VSCALE(X,FIND0) ;Make sure that the mental health scale is valid.
 ;Either the scale number or the scale name can be used.
 N MHIEN,MHTEST,SCALE,VALID
 S MHTEST=$P(FIND0,U,1)
 S MHIEN=$P(MHTEST,";",1)
 I +X>0 D  Q VALID
 . S VALID=$S($D(^YTT(601,MHIEN,"S",X)):1,1:0)
 E  D
 . S SCALE=$O(^YTT(601,MHIEN,"S","C",X,""))
 . S VALID=$S(SCALE="":0,1:1)
 Q VALID
 ;
 ;=======================================================
VSCALEF(X) ;Make sure that the mental health scale is valid for a finding.
 I X="" Q 1
 ;Do not execute as part of a verify fields.
 I $G(DIUTIL)="VERIFY FIELDS" Q 1
 ;Do not execute as part of exchange.
 I $G(PXRMEXCH) Q 1
 N FIND0
 S FIND0=^PXD(811.9,DA(1),20,DA,0)
 Q $$VSCALE(X,FIND0)
 ;
 ;=======================================================
VSCALET(X) ;Make sure that the mental health scale is valid for a 
 ;term finding.
 I X="" Q 1
 ;Do not execute as part of a verify fields.
 I $G(DIUTIL)="VERIFY FIELDS" Q 1
 ;Do not execute as part of exchange.
 I $G(PXRMEXCH) Q 1
 N TFIND0
 S TFIND0=^PXRMD(811.5,DA(1),20,DA,0)
 Q $$VSCALE(X,TFIND0)
 ;
