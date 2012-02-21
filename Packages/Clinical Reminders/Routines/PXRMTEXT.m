PXRMTEXT ; SLC/PKR - Text formatting utility routines. ;11/03/2004
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;================================================================
NEWLINE ;Put TEXT on a new line to the output, make sure it does not end
 ;with a " ".
 N TLEN
 ;If there is no text in TEXT don't do anything.
 I TEXT=INDSTR Q
 S TLEN=$L(TEXT)
 I $E(TEXT,TLEN)=" " S TEXT=$E(TEXT,1,TLEN-1)
 S NOUT=NOUT+1,TEXTOUT(NOUT)=TEXT
 S TEXT=INDSTR,CLEN=0
 Q
 ;
 ;================================================================
BLANK ;Add a blank line (line containing just " ") to the output.
 S NOUT=NOUT+1,TEXTOUT(NOUT)=" "
 S TEXT=INDSTR,CLEN=0
 Q
 ;
 ;================================================================
CHECKLEN(WORD) ;Check to see if adding the next word makes the line too long.
 ;If it does add it to the output and start a new line.
 N LENWORD
 S LENWORD=$L(WORD)
 I (CLEN+LENWORD)>WIDTH D
 . D NEWLINE
 . I WORD'[" " S WORD=WORD_" ",LENWORD=LENWORD+1
 . S TEXT=INDSTR_WORD,CLEN=LENWORD
 E  D
 . I WORD'[" " S WORD=WORD_" ",LENWORD=LENWORD+1
 . S TEXT=TEXT_WORD,CLEN=CLEN+LENWORD
 Q
 ;
 ;================================================================
FORMAT(LM,RM,NIN,TEXTIN,NOUT,TEXTOUT) ;Format the text in TEXTIN so it has
 ;a left margin of LM and a right margin of RM. The formatted text
 ;is in TEXTOUT. "\\" is the end of line marker. Lines ending with
 ;"\\" will not have anything appended to them. A blank line can
 ;be created by creating a line containing just "\\". Lines containing
 ;nothing but whitespace will also act like a "\\".
 I NIN=0 S NOUT=0 Q
 N ACHAR,ALLWSP,CHAR,CLEN,END,IND,INDENT,INDSTR,JND
 N LWSP,NWSP,START,TEMP,TEXT,TLEN,WIDTH,W1,W2,WORD
 ;Catalog the whitespace so we have places to break and look for
 ;end of line markers.
 F IND=1:1:NIN D
 . S TEMP=TEXTIN(IND)
 . S TLEN=$L(TEMP)
 . S ALLWSP=1,NWSP=0
 . F JND=1:1:TLEN D
 .. S CHAR=$E(TEMP,JND)
 .. S ACHAR=$A(CHAR)
 .. I ACHAR>32 S ALLWSP=0
 .. E  S NWSP=NWSP+1,LWSP(IND,NWSP)=JND
 .;Mark the end of the line.
 . S NWSP=NWSP+1,LWSP(IND,NWSP)=TLEN,LWSP(IND)=NWSP
 . I ALLWSP S LWSP(IND,"ALLWSP")=""
 I LM<1 S LM=1
 S WIDTH=RM-LM+1
 S INDENT=LM-1
 S INDSTR=""
 F IND=1:1:INDENT S INDSTR=INDSTR_" "
 S NOUT=0
 S TEXT=INDSTR,CLEN=0
 F IND=1:1:NIN D
 .;If there is a blank line force whatever is in TEXT to be output by
 .;calling NEWLINE and then add the blank.
 . I $D(LWSP(IND,"ALLWSP")) D NEWLINE,BLANK Q
 . S TEMP=TEXTIN(IND)
 . S (END,NWSP)=0
 . F NWSP=1:1:LWSP(IND) D
 .. S START=END+1,END=LWSP(IND,NWSP)
 .. S WORD=$E(TEMP,START,END)
 .. I WORD["\\" D  Q
 ... S W1=$P(WORD,"\\",1)
 ... D CHECKLEN(W1)
 ... D NEWLINE
 ... S W2=$P(WORD,"\\",2)
 ... I W2'="" D CHECKLEN(W2)
 .. D CHECKLEN(WORD)
 ;Output the last line.
 D NEWLINE
 Q
 ;
 ;================================================================
FORMATS(LM,RM,TEXTLINE,NOUT,TEXTOUT) ;Take a single line of input text
 ;and format it.
 N TEXTIN
 S TEXTIN(1)=TEXTLINE
 D FORMAT(LM,RM,1,.TEXTIN,.NOUT,.TEXTOUT)
 Q
 ;
