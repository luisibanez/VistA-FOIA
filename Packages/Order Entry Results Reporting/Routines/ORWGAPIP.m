ORWGAPIP ; SLC/STAFF - Graph Parameters ;12/21/05  08:22
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**215**;Dec 17, 1997
 ;
DATES(DAT,REPORTID) ; from ORWGAPI
 N BEGIN,END,INFO,NEXT,PARAM1,PARAM2,RPT,START,STOP
 S RPT=+$O(^ORD(101.24,"AC",+$G(REPORTID),0))
 I 'RPT Q  ; RPT=1150 is exported graph report
 S PARAM1=$P($G(^ORD(101.24,RPT,2)),U)
 S PARAM2=$P($G(^ORD(101.24,RPT,2)),U,2)
 S INFO=$$XGET^ORWGAPIX("ALL","ORWRP TIME/OCC LIMITS INDV",RPT,"I")
 S BEGIN=$P(INFO,";"),START=$$DATE^ORWGAPIX(BEGIN)
 S END=$P(INFO,";",2),STOP=$$DATE^ORWGAPIX(END)
 I START<1 Q
 I STOP<1 Q
 S NEXT=1+$O(DAT(""),-1)
 S DAT(NEXT)=U_BEGIN_" to "_END_"^^^"_INFO_U_START_U_STOP_U_PARAM1_U_PARAM2
 Q
 ;
DELVIEWS(DATA,NAME,PUBLIC) ; from ORWGAPI
 N ERR,TMP
 D RETURN^ORWGAPIU(.TMP,.DATA)
 S ERR=0
 I '$L(NAME) S ERR=1
 I 'ERR D
 . S NAME=$$UP^ORWGAPIX(NAME)
 . I PUBLIC D XDEL^ORWGAPIX("SYS","ORWG GRAPH VIEW",NAME,.ERR)
 . I 'PUBLIC  D XDEL^ORWGAPIX("USR","ORWG GRAPH VIEW",NAME,.ERR)
 I TMP S ^TMP(DATA,$J)=ERR,^TMP(DATA,$J,1)=ERR
 I 'TMP S DATA=ERR,DATA(1)=ERR
 Q
 ;
GETPREF(DATA) ; from ORWGAPI
 N CNT,NUM,PROF,RESULT,TMP,VAL K PROF
 I '$O(^PXRMINDX(63,"PI","")) Q  ; graphing is not used if no indexes
 S VAL=$$XGET^ORWGAPIX("PKG","ORWG GRAPH SETTING",1,"I")
 I '$L(VAL) Q  ; graphing not used if no pkg param on settings
 D RETURN^ORWGAPIU(.TMP,.DATA)
 S VAL=$$XGET^ORWGAPIX("DIV^SYS^PKG","ORWG GRAPH SETTING",1,"I")
 S PROF(1)=VAL
 S VAL=$$XGET^ORWGAPIX("ALL","ORWG GRAPH SETTING",1,"I")
 S PROF(0)=VAL
 S CNT=0
 S NUM=""
 F  S NUM=$O(PROF(NUM)) Q:NUM=""  D
 . S RESULT=$G(PROF(NUM))
 . D SETUP^ORWGAPIU(.DATA,RESULT,TMP,.CNT)
 Q
 ;
GETSIZE(DATA) ; from ORWGAPI
 N CNT,NUM,PROF,RESULT,TMP K PROF
 D RETURN^ORWGAPIU(.TMP,.DATA)
 D XGETLST^ORWGAPIX(.PROF,"USR","ORWG GRAPH SIZING")
 S CNT=0
 S NUM=""
 F  S NUM=$O(PROF(NUM)) Q:NUM=""  D
 . S RESULT=$G(PROF(NUM))
 . D SETUP^ORWGAPIU(.DATA,RESULT,TMP,.CNT)
 Q
 ;
GETVIEWS(DATA,ALL,PUBLIC,EXT) ; from ORWGAPI
 N CNT,FIRST,NUM,PIECE,PROF,RESULT,RESULT1,SECOND,TMP,VALUE K PROF
 D RETURN^ORWGAPIU(.TMP,.DATA)
 I PUBLIC D
 . I ALL D XGETLST^ORWGAPIX(.PROF,"SYS","ORWG GRAPH VIEW") ; get list of public views
 . I 'ALL D XGETWP^ORWGAPIX(.PROF,"SYS","ORWG GRAPH VIEW",ALL) ; get a public view definition
 I 'PUBLIC D
 . I ALL D XGETLST^ORWGAPIX(.PROF,"USR","ORWG GRAPH VIEW") ; get list of personal views
 . I 'ALL D XGETWP^ORWGAPIX(.PROF,"USR","ORWG GRAPH VIEW",ALL) ; get a personal view definition
 S CNT=0
 I 'EXT D  Q
 . S NUM=""
 . F  S NUM=$O(PROF(NUM)) Q:NUM=""  D
 .. I ALL S RESULT=$P($G(PROF(NUM)),U)
 .. I 'ALL S RESULT=$G(PROF(NUM,0))
 .. D SETUP^ORWGAPIU(.DATA,RESULT,TMP,.CNT)
 S NUM=""
 F  S NUM=$O(PROF(NUM)) Q:NUM=""  D
 . S RESULT=$G(PROF(NUM,0))
 . S PIECE=0
 . F  S PIECE=PIECE+1 S VALUE=$P(RESULT,"|",PIECE) D:$L(VALUE)  Q:'$L($P(RESULT,"|",PIECE+1,999))
 .. S FIRST=$P(VALUE,"~"),SECOND=$P(VALUE,"~",2)
 .. I FIRST=0 S CNT=CNT+1,RESULT1="0^"_SECOND_U_$$FILENAME^ORWGAPIT(SECOND)_" <any>"
 .. I FIRST'=0 S CNT=CNT+1,RESULT1=FIRST_U_SECOND_U_$$EVALUE^ORWGAPIU(SECOND,FIRST)
 .. D SETUP^ORWGAPIU(.DATA,RESULT1,TMP,.CNT)
 Q
 ;
INISET ; from ORWGAPIU initial setup of package parameters
 N ERR,RPTNUM
 S RPTNUM=1150
 D SETPREF(.ERR,"63;53.79;55;55NVA;52;70;120.5|BCEFGHIK|1|4|90||100||",9) ; default public settings
 I '$D(^ORD(101.24,RPTNUM,0)) D  ; make sure report has been added
 . L +^ORD(101.24,0):20 I '$T Q
 . S $P(^ORD(101.24,0),U,3)=RPTNUM,$P(^(0),U,4)=$P(^(0),U,4)+1
 . S ^ORD(101.24,RPTNUM,0)="ORWG GRAPHING^OR_GRAPHS^^2^^^1^R^^^^G^^T"
 . S ^ORD(101.24,RPTNUM,2)="^^Graphing (local only)^Graphing"
 . L -^ORD(101.24,0)
 . D INDEX^ORWGAPIX("^ORD(101.24,",RPTNUM)
 D XEN^ORWGAPIX("PKG","ORWRP REPORT LIST",12,RPTNUM)
 D XVIEWS ; *****
 Q
 ;
PUBLIC(USER) ; from ORWGAPI
 N ERR,IDX,USRCLASS,VAL K USRCLASS
 S VAL=0
 I '$G(USER) Q VAL
 D XGETLST1^ORWGAPIX(.USRCLASS,"ALL","ORWG GRAPH PUBLIC EDITOR CLASS","Q",.ERR)
 I ERR Q VAL
 S IDX=0
 F  S IDX=$O(USRCLASS(IDX)) Q:'IDX  D  Q:VAL
 . I $$ISA^ORWGAPIA(USER,$P(USRCLASS(IDX),U,2),.ERR) S VAL=1
 Q VAL
 ;
RPTPARAM(IEN) ; from ORWGAPI
 N NODE,VAL
 S VAL=""
 S NODE=$P($G(^ORD(101.24,+$G(IEN),2)),U,1,2)
 I $L(NODE)<2 Q VAL
 Q NODE
 ;
SETPREF(DATA,VAL,PUBLIC) ; from ORWGAPI
 N ERR,TMP
 D RETURN^ORWGAPIU(.TMP,.DATA)
 S ERR=0
 I '$L(VAL) S ERR=1
 I 'ERR D
 . S VAL=$$UP^ORWGAPIX(VAL)
 . I PUBLIC=9 D XEN^ORWGAPIX("PKG","ORWG GRAPH SETTING",1,VAL,.ERR) ; only on postinit
 . I PUBLIC D XEN^ORWGAPIX("SYS","ORWG GRAPH SETTING",1,VAL,.ERR)
 . I 'PUBLIC D XEN^ORWGAPIX("USR","ORWG GRAPH SETTING",1,VAL,.ERR)
 I TMP S ^TMP(DATA,$J)=ERR,^TMP(DATA,$J,1)=ERR
 I 'TMP S DATA=ERR,DATA(1)=ERR
 Q
 ;
SETSIZE(DATA,VAL) ; from ORWGAPI
 N ERR,NAME,NUM,VALUE,VALUES,TMP
 D RETURN^ORWGAPIU(.TMP,.DATA)
 S ERR=0
 I '$L($O(VAL(0))) S ERR=1
 I 'ERR D
 . S NUM=0
 . F  S NUM=$O(VAL(NUM)) Q:NUM<1  D  Q:ERR
 .. S VALUES=VAL(NUM)
 .. S VALUES=$$UP^ORWGAPIX(VALUES)
 .. S NAME=$P(VALUES,U)
 .. S VALUE=$P(VALUES,U,2)
 .. D XEN^ORWGAPIX("USR","ORWG GRAPH SIZING",NAME,VALUE,.ERR)
 I TMP S ^TMP(DATA,$J)=ERR,^TMP(DATA,$J,1)=ERR
 I 'TMP S DATA=ERR,DATA(1)=ERR
 Q
 ;
SETVIEWS(DATA,NAME,PUBLIC,VAL) ; from ORWGAPI
 N ERR,TMP
 D RETURN^ORWGAPIU(.TMP,.DATA)
 S ERR=0
 I '$L(NAME) S ERR=1
 I '$L($O(VAL(""))) S ERR=1
 I 'ERR D
 . S NAME=$$UP^ORWGAPIX(NAME)
 . S VAL=NAME
 . I PUBLIC D XEN^ORWGAPIX("SYS","ORWG GRAPH VIEW",NAME,.VAL,.ERR)
 . I 'PUBLIC  D XEN^ORWGAPIX("USR","ORWG GRAPH VIEW",NAME,.VAL,.ERR)
 I TMP S ^TMP(DATA,$J)=ERR,^TMP(DATA,$J,1)=ERR
 I 'TMP S DATA=ERR,DATA(1)=ERR
 Q
 ;
XVIEWS ; conversion on v26t41 *****
 N CNT,DATA,ERR,NAME,NUM,NUM1,SYSNAME,VIEWS,VIEWDEF,VIEWDIV
 K DATA,SYSNAME,VIEWS,VIEWDEF,VIEWDIV
 D XGETLST^ORWGAPIX(.VIEWS,"SYS","ORWG GRAPH VIEW")
 S NUM=0
 F  S NUM=$O(VIEWS(NUM)) Q:NUM<1  D
 . S NAME=$P(VIEWS(NUM),U)
 . I NAME="" Q
 . S SYSNAME(NAME)=""
 K VIEWS
 D XGETLST^ORWGAPIX(.VIEWS,"DIV","ORWG GRAPH VIEW")
 S NUM=0
 F  S NUM=$O(VIEWS(NUM)) Q:NUM<1  D
 . S NAME=$P(VIEWS(NUM),U)
 . I NAME="" Q
 . I '$D(SYSNAME(NAME)) D
 .. K VIEWDEF,VIEWDIV
 .. D XGETWP^ORWGAPIX(.VIEWDIV,"DIV","ORWG GRAPH VIEW",NAME)
 .. S CNT=0
 .. S NUM1=""
 .. F  S NUM1=$O(VIEWDIV(NUM1)) Q:NUM1=""  D
 ... S CNT=CNT+1
 ... S VIEWDEF(CNT)=$G(VIEWDIV(NUM1,0))
 .. D SETVIEWS^ORWGAPIP(.DATA,NAME,1,.VIEWDEF)
 . D XDEL^ORWGAPIX("DIV","ORWG GRAPH VIEW",NAME,.ERR)
 Q
 ;
