ORWGAPI ; SLC/STAFF - Graph API ;12/21/05  08:14
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**215**;Dec 17, 1997
 ;
ALLITEMS(ITEMS,DFN) ; API - return all items of data on patient (procedures, tests, codes,..)
 N CNT,SUB,TMP,TYPE
 K ^TMP("ORWGAPI",$J)
 S DFN=+$G(DFN) I 'DFN Q
 D TYPES("ORWGAPI",DFN)
 D RETURN^ORWGAPIU(.TMP,.ITEMS)
 S CNT=0
 S SUB=""
 F  S SUB=$O(^TMP("ORWGAPI",$J,SUB)) Q:SUB=""  D
 . S TYPE=$P(^TMP("ORWGAPI",$J,SUB),U)
 . D ITEMS^ORWGAPIR(.ITEMS,DFN,TYPE,0,,,.CNT,TMP)
 K ^TMP("ORWGAPI",$J)
 Q
 ;
CLASS(DATA,TYPE) ; API - get classification
 I TYPE=50.605 D DRUGC^ORWGAPIA(.DATA)
 I TYPE=68 D ACC^ORWGAPIA(.DATA)
 I TYPE=8925.1 D TIUTITLE^ORWGAPIA(.DATA)
 I TYPE=100.98 D OITEM^ORWGAPIA(.DATA)
 Q
 ;
DATEITEM(ITEMS,OLDEST,NEWEST,TYPE,DFN) ; API - return all file items on patient for date range
 N CNT,SUB,TMP
 K ^TMP("ORWGAPI",$J)
 S DFN=+$G(DFN) I 'DFN Q
 S OLDEST=+$G(OLDEST),NEWEST=+$G(NEWEST),TYPE=$G(TYPE)
 I $L(TYPE) S ^TMP("ORWGAPI",$J,1)=TYPE
 I '$L(TYPE) D TYPES("ORWGAPI",DFN)
 D RETURN^ORWGAPIU(.TMP,.ITEMS)
 S CNT=0
 S SUB=""
 F  S SUB=$O(^TMP("ORWGAPI",$J,SUB)) Q:SUB=""  D
 . S TYPE=$P(^TMP("ORWGAPI",$J,SUB),U)
 . D ITEMS^ORWGAPIR(.ITEMS,DFN,TYPE,6,OLDEST,NEWEST,.CNT,TMP)
 K ^TMP("ORWGAPI",$J)
 Q
 ;
DELVIEWS(DATA,NAME,PUBLIC) ; API - delete a graph view
 D DELVIEWS^ORWGAPIP(.DATA,$G(NAME),$G(PUBLIC))
 Q
 ;
DETAIL(DATA,DFN,DATE1,DATE2,VAL,COMP) ; API - get all reports for types of data from items and date range
 D DETAIL^ORWGAPID("ORWGRPC",DFN,DATE1,DATE2,.VAL)
 S DATA=$NA(^TMP("ORWGRPC",$J))
 Q
 ;
DETAILS(DATA,DFN,DATE1,DATE2,TYPE,COMP) ; API - get report for type of data for a date or date range
 D DETAILS^ORWGAPID("ORWGRPC",DFN,DATE1,DATE2,TYPE)
 S DATA=$NA(^TMP("ORWGRPC",$J))
 Q
 ;
GETDATES(DATA,REPORTID) ; API - get graph date ranges
 N DAT,TMP K DAT
 S REPORTID=$G(REPORTID)
 D RETURN^ORWGAPIU(.TMP,.DATA)
 S DAT(1)="S^Date Range..."
 S DAT(2)="1^Today"
 S DAT(3)="2^One Week"
 S DAT(4)="3^Two Weeks"
 S DAT(5)="4^One Month"
 S DAT(6)="5^Six Months"
 S DAT(7)="6^One Year"
 S DAT(8)="7^Two Years"
 S DAT(9)="8^All Results"
 D DATES^ORWGAPIP(.DAT,REPORTID)
 I TMP M ^TMP(DATA,$J)=DAT
 I 'TMP M DATA=DAT
 Q
 ;
GETPREF(DATA) ; API - get graph settings
 D GETPREF^ORWGAPIP(.DATA)
 Q
 ;
GETSIZE(DATA) ; API - get graph positions and sizes
 D GETSIZE^ORWGAPIP(.DATA)
 Q
 ;
GETVIEWS(DATA,ALL,PUBLIC,EXT) ; API - get graph views
 D GETVIEWS^ORWGAPIP(.DATA,$G(ALL),$G(PUBLIC),$G(EXT))
 Q
 ;
ITEMDATA(DATA,ITEM,START,DFN) ; API - return data of an item on patient (glucose results)
 N CNT,FILE,TMP
 S DFN=+$G(DFN) I 'DFN Q
 S ITEM=$G(ITEM) I ITEM'[U Q
 S START=$G(START,$$NOW^ORWGAPIX)
 D RETURN^ORWGAPIU(.TMP,.DATA)
 S FILE=$P(ITEM,U)
 S ITEM=$P(ITEM,U,2)
 S CNT=0
 D DATA^ORWGAPIR(.DATA,ITEM,FILE,START,DFN,.CNT,TMP)
 Q
 ; 
ITEMS(ITEMS,DFN,TYPE) ; API - return items of a type of data on patient (lab tests)
 N CNT,TMP
 S DFN=+$G(DFN) I 'DFN Q
 S TYPE=$G(TYPE) I '$L(TYPE) Q
 D RETURN^ORWGAPIU(.TMP,.ITEMS)
 S CNT=0
 D ITEMS^ORWGAPIR(.ITEMS,DFN,TYPE,3,,,.CNT,TMP)
 Q
 ;
LOOKUP(VAL,FILE,FROM,DIR) ; API - get item names for long lookup
 N REF,SCREEN,XREF
 D FILE^ORWGAPIU($G(FILE),.REF,.XREF,.SCREEN)
 I '$L(REF) Q
 D GENERIC^ORWGAPIU(.VAL,.FROM,DIR,FILE,REF,XREF,SCREEN)
 Q
 ;
PUBLIC(USER) ; API - $$(user) -> 1 if user can edit public settings and views
 Q $$PUBLIC^ORWGAPIP(USER)
 ;
RPTPARAM(IEN) ; API - $$(ien) -> PARAM1^PARAM2 for graph report else ""
 Q $$RPTPARAM^ORWGAPIP(IEN)
 ;
SETPREF(DATA,VAL,PUBLIC) ; API - set a graph setting
 D SETPREF^ORWGAPIP(.DATA,$G(VAL),$G(PUBLIC))
 Q
 ;
SETSIZE(DATA,VAL) ; API - set graph positions and settings
 D SETSIZE^ORWGAPIP(.DATA,.VAL)
 Q
 ;
SETVIEWS(DATA,NAME,PUBLIC,VAL) ; API - set a graph view
 D SETVIEWS^ORWGAPIP(.DATA,$G(NAME),$G(PUBLIC),.VAL)
 Q
 ;
TAX(DATA,ALL,REMTAX) ; API - get reminder taxonomies
 D TAX^ORWGAPID(.DATA,+$G(ALL),.REMTAX)
 Q
 ;
TESTSPEC(DATA) ;  API - return test/spec info on all lab tests
 N CNT,LINE,TEST,TMP,SPEC
 D RETURN^ORWGAPIU(.TMP,.DATA)
 S CNT=0
 S TEST=0
 F  S TEST=$O(^LAB(60,TEST)) Q:TEST<1  D
 . S SPEC=0
 . F  S SPEC=$O(^LAB(60,TEST,1,SPEC)) Q:SPEC<1  D
 .. S CNT=CNT+1
 .. S LINE=TEST_U_$G(^LAB(60,TEST,1,SPEC,0))
 .. I $P(LINE,U,3)[$C(34) S $P(LINE,U,3)=$$TRIM^ORWGAPIX($P(LINE,U,3),"LR",$C(34))
 .. I $P(LINE,U,4)[$C(34) S $P(LINE,U,4)=$$TRIM^ORWGAPIX($P(LINE,U,4),"LR",$C(34))
 .. I TMP S ^TMP(DATA,$J,CNT)=LINE Q
 .. S DATA(CNT)=LINE
 Q
 ;
TYPES(TYPES,DFN,SUB) ; API - return all types of data on patient (if no dfn, return all)
 N TMP
 S DFN=+$G(DFN)
 S SUB=+$G(SUB)
 D RETURN^ORWGAPIU(.TMP,.TYPES)
 D TYPES^ORWGAPIT(.TYPES,DFN,SUB,TMP)
 Q
