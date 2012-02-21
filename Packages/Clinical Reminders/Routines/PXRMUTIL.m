PXRMUTIL ; SLC/PKR/PJH - Utility routines for use by PXRM. ;01/28/2005
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;===========================================================
ATTVALUE(STRING,ATTR,SEP,AVSEP) ;STRING contains a list of attribute value
 ;pairs. Each pair is separated by SEP and the attribute value pair
 ;is separated by AVSEP. Return the value for the attribute ATTR.
 N AVPAIR,IND,NUMAVP,VALUE
 S NUMAVP=$L(STRING,SEP)
 S VALUE=""
 F IND=1:1:NUMAVP Q:VALUE'=""  D
 . S AVPAIR=$P(STRING,SEP,IND)
 . I AVPAIR[ATTR S VALUE=$P(AVPAIR,AVSEP,2)
 Q VALUE
 ;
 ;===========================================================
AWRITE(REF) ;Write all the descendants of the array reference.
 ;REF is the starting array reference, for example A or ^TMP("PXRM",$J).
 N DONE,IC,IND,LEN,PROOT,ROOT,START,TEMP
 I REF="" Q
 S PROOT=$P(REF,")",1)
 ;Build the root so we can tell when we are done.
 S TEMP=$NA(@REF)
 S ROOT=$P(TEMP,")",1)
 S REF=$Q(@REF)
 I REF'[ROOT Q
 S DONE=0
 F IC=0:0 Q:(REF="")!(DONE)  D
 . S START=$F(REF,ROOT)
 . S LEN=$L(REF)
 . S IND=$E(REF,START,LEN)
 . W !,PROOT_IND,"=",@REF
 . S REF=$Q(@REF)
 . I REF'[ROOT S DONE=1
 Q
 ;
 ;===========================================================
DIP(VAR,IEN,PXRMROOT,FLDS) ;Do general inquiry for IEN return formatted
 ;output in VAR. VAR can be either a local variable or a global.
 ;If it is a local it is indexed for the broker. If it is a global
 ;it should be passed in closed form i.e., ^TMP("PXRMTEST",$J).
 ;It will be returned formatted for ListMan i.e.,
 ;^TMP("PXRMTEST",$J,N,0).
 N %ZIS,ARRAY,BY,DC,DHD,DIC,DONE,FF,FILENAME,FILESPEC,FR,GBL,HFNAME
 N IND,IOP,L,NOW,PATH,SUCCESS,TO,UNIQN
 S BY="NUMBER",(FR,TO)=+$P(IEN,U,1),DHD="@@"
 ;Make sure the PXRM WORKSTATION device exists.
 D MKWSDEV^PXRMHOST
 ;Set up the output file before DIP is called.
 S PATH=$$PWD^%ZISH
 S NOW=$$NOW^XLFDT
 S NOW=$TR(NOW,".","")
 S UNIQN=$J_NOW
 S FILENAME="PXRMWSD"_UNIQN_".DAT"
 S HFNAME=PATH_FILENAME
 S IOP="PXRM WORKSTATION;80"
 S %ZIS("HFSMODE")="W"
 S %ZIS("HFSNAME")=HFNAME
 S L=0,DIC=PXRMROOT
 D EN1^DIP
 ;Move the host file into a global.
 S GBL="^TMP(""PXRMUTIL"",$J,1,0)"
 S GBL=$NA(@GBL)
 K ^TMP("PXRMUTIL",$J)
 S SUCCESS=$$FTG^%ZISH(PATH,FILENAME,GBL,3)
 ;Look for a form feed, remove it and all subsequent lines.
 S FF=$C(12)
 I $G(VAR)["^" D
 . S VAR=$NA(@VAR)
 . S VAR=$P(VAR,")",1)
 . S VAR=VAR_",IND,0)"
 . S (DONE,IND)=0
 . F  Q:DONE  S IND=$O(^TMP("PXRMUTIL",$J,IND)) Q:+IND=0  D
 .. I ^TMP("PXRMUTIL",$J,IND,0)=FF S DONE=1 Q
 .. S @VAR=^TMP("PXRMUTIL",$J,IND,0)
 E  D
 . S (DONE,IND)=0
 . F  Q:DONE  S IND=$O(^TMP("PXRMUTIL",$J,IND)) Q:+IND=0  D
 .. S VAR(IND)=^TMP("PXRMUTIL",$J,IND,0)
 .. I VAR(IND)=FF K ARRAY(IND) S DONE=1
 K ^TMP("PXRMUTIL",$J)
 ;Delete the host file.
 S FILESPEC(FILENAME)=""
 S SUCCESS=$$DEL^%ZISH(PATH,$NA(FILESPEC))
 Q
 ;
 ;===========================================================
FNFR(ROOT) ;Given the root of a file return the file number.
 Q +$P(@(ROOT_"0)"),U,2)
 ;
 ;===========================================================
NTOAN(NUMBER) ;Given an integer N return an alphabetic string that can be
 ;used for sorting. This will be modulus 26. For example N=0 returns
 ;A, N=26 returns BA etc.
 N ALPH
 S ALPH(0)="A",ALPH(1)="B",ALPH(2)="C",ALPH(3)="D",ALPH(4)="E"
 S ALPH(5)="F",ALPH(6)="G",ALPH(7)="H",ALPH(8)="I",ALPH(9)="J"
 S ALPH(10)="K",ALPH(11)="L",ALPH(12)="M",ALPH(13)="N",ALPH(14)="O"
 S ALPH(15)="P",ALPH(16)="Q",ALPH(17)="R",ALPH(18)="S",ALPH(19)="T"
 S ALPH(20)="U",ALPH(21)="V",ALPH(22)="W",ALPH(23)="X",ALPH(24)="Y"
 S ALPH(25)="Z"
 ;
 N ANUM,DIGIT,NUM,P26,PC,PWR
 S ANUM="",NUM=NUMBER,PWR=0
 S P26(PWR)=1
 F PWR=1:1 S P26(PWR)=26*P26(PWR-1) I P26(PWR)>NUMBER Q
 S PWR=PWR-1
 F PC=PWR:-1:0 D
 . S DIGIT=NUM\P26(PC)
 . S ANUM=ANUM_ALPH(DIGIT)
 . S NUM=NUM-(DIGIT*P26(PC))
 Q ANUM
 ;
 ;===========================================================
SEHIST(FILENUM,ROOT,IEN) ;Set the edit date and edit by and prompt the
 ;user for the edit comment.
 N DIC,DIR,DWLW,DWPK,ENTRY,FDA,FDAIEN,IENS,IND,MSG,SFN,TARGET,X,Y
 K ^TMP("PXRMWP",$J)
 D FIELD^DID(FILENUM,"EDIT HISTORY","","SPECIFIER","TARGET")
 S SFN=+$G(TARGET("SPECIFIER"))
 I SFN=0 Q
 S ENTRY=ROOT_IEN_",110)"
 S IND=$O(@ENTRY@("B"),-1)
 S IND=IND+1
 S IENS="+"_IND_","_IEN_","
 S FDAIEN(IEN)=IEN
 S FDA(SFN,IENS,.01)=$$FMTE^XLFDT($$NOW^XLFDT,"5Z")
 S FDA(SFN,IENS,1)=$$GET1^DIQ(200,DUZ,.01)
 ;Prompt the user for edit comments.
 S DIC="^TMP(""PXRMWP"",$J,"
 S DWLW=72
 S DWPK=1
 W !,"Input your edit comments."
 S DIR(0)="Y"_U_"AO"
 S DIR("A")="Edit"
 S DIR("B")="NO"
 D ^DIR
 I Y D
 . D EN^DIWE
 . K ^TMP("PXRMWP",$J,0)
 . I $D(^TMP("PXRMWP",$J)) S FDA(SFN,IENS,2)="^TMP(""PXRMWP"",$J)"
 D UPDATE^DIE("E","FDA","FDAIEN","MSG")
 I $D(MSG) D AWRITE^PXRMUTIL("MSG")
 K ^TMP("PXRMWP",$J)
 Q
 ;
 ;===========================================================
SFRES(SDIR,NRES,FIEVAL) ;Save the finding result.
 I NRES=0 S FIEVAL=0 Q
 N DATE,IND,OA,SUB,TF
 F IND=1:1:NRES S OA(FIEVAL(IND,"DATE"),FIEVAL(IND),IND)=""
 ;If SDIR is positive get the oldest date otherwise get the most
 ;recent date.
 S DATE=$S(SDIR>0:$O(OA("")),1:$O(OA(""),-1))
 ;If there is a true finding on DATE get it.
 S TF=$O(OA(DATE,""),-1)
 S IND=$O(OA(DATE,TF,""))
 S FIEVAL=TF
 S SUB=""
 F  S SUB=$O(FIEVAL(IND,SUB)) Q:SUB=""  M FIEVAL(SUB)=FIEVAL(IND,SUB)
 Q
 ;
 ;===========================================================
SSPAR(FIND0,NOCC,BDT,EDT) ;Set the finding search parameters.
 S BDT=$P(FIND0,U,8),EDT=$P(FIND0,U,11),NOCC=$P(FIND0,U,14)
 I NOCC="" S NOCC=1
 ;Convert the dates to FileMan dates.
 S BDT=$S(BDT="":0,1:$$CTFMD^PXRMDATE(BDT))
 I EDT="" S EDT="T"
 S EDT=$$CTFMD^PXRMDATE(EDT)
 ;If EDT does not contain a time set it to the end of the day.
 I EDT'["." S EDT=EDT_".235959"
 Q
 ;
 ;===========================================================
STRREP(STRING,TS,RS) ;Replace every occurrence of the target string (TS)
 ;in STRING with the replacement string (RS).
 ;Example 9.19 (page 220) in "The Complete Mumps" by John Lewkowicz:
 ;  F  Q:STRING'[TS  S STRING=$P(STRING,TS)_RS_$P(STRING,TS,2,999)
 ;fails if any portion of the target string is contained in the with
 ;string. Therefore a more elaborate version is required.
 ;
 N IND,NPCS,STR
 I STRING'[TS Q STRING
 ;Count the number of pieces using the target string as the delimiter.
 S NPCS=$L(STRING,TS)
 ;Extract the pieces and concatenate RS
 S STR=""
 F IND=1:1:NPCS-1 S STR=STR_$P(STRING,TS,IND)_RS
 S STR=STR_$P(STRING,TS,NPCS)
 Q STR
 ;
 ;===========================================================
VEDIT(ROOT,IEN) ;This is used as a DIC("S") screen to select which entries
 ;a user can edit.
 N CLASS,ENTRY,VALID
 S ENTRY=ROOT_IEN_")"
 S CLASS=$P($G(@ENTRY@(100)),U,1)
 I CLASS="N" D
 . I ($G(PXRMINST)=1),(DUZ(0)="@") S VALID=1
 . E  S VALID=0
 E  S VALID=1
 Q VALID
 ;
