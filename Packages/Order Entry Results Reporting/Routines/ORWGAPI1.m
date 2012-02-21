ORWGAPI1 ; SLC/STAFF - Graph Items ;12/21/05  08:15
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**215**;Dec 17, 1997
 ;
AA(ITEMS,DFN,FMT,OLDEST,NEWEST,CNT,TMP) ; from ORWGAPIR
 ; FMT,OLDEST,NEWEST not used
 N ITEM,FILE,NUM,REF,RESULT
 K ^TMP("ORWGRPC DC",$J)
 S ITEM=""
 F  S ITEM=$O(^PXRMINDX(63,"PI",DFN,ITEM)) Q:ITEM=""  D
 . I $E(ITEM)="A" Q
 . I $E(ITEM)="M" Q
 . S RESULT=$$AALAB^ORWGAPIA(ITEM)
 . I RESULT="" Q
 . S RESULT="68^"_RESULT
 . S ^TMP("ORWGRPC DC",$J,RESULT)=""
 S RESULT=""
 F  S RESULT=$O(^TMP("ORWGRPC DC",$J,RESULT)) Q:RESULT=""  S CNT=CNT+1 D
 . D SETUP^ORWGAPIU(.ITEMS,RESULT,TMP,.CNT)
 K ^TMP("ORWGRPC DC",$J)
 Q
 ;
AP(ITEMS,DFN,FMT,OLDEST,NEWEST,CNT,TMP) ; from ORWGAPIR
 N DATE,ITEM,OK,RESULT
 S ITEM="A"
 F  S ITEM=$O(^PXRMINDX(63,"PI",DFN,ITEM)) Q:ITEM=""  Q:ITEM]"AZ"  D
 . S OK=0
 . I FMT=6 D
 .. S DATE=OLDEST
 .. F  S DATE=$O(^PXRMINDX(63,"PI",DFN,ITEM,DATE)) Q:DATE=""  Q:DATE>NEWEST  D  Q:OK
 ... S CNT=CNT+1
 ... S OK=1
 ... S RESULT="63AP"_U_ITEM
 . I FMT=3 D
 .. S DATE=$O(^PXRMINDX(63,"PI",DFN,ITEM,""),-1)
 .. I 'DATE Q
 .. S OK=1
 .. S CNT=CNT+1
 .. S RESULT="63AP^"_ITEM_"^^"_$$ITEMPRFX^ORWGAPIU(ITEM)_": "_$$EVALUE^ORWGAPIU(ITEM,63,.01)_"^^"_DATE
 . I FMT=0 D
 .. S OK=1
 .. S CNT=CNT+1
 .. S RESULT="63AP^"_ITEM_U_$$ITEMPRFX^ORWGAPIU(ITEM)_": "_$$EVALUE^ORWGAPIU(ITEM,63,.01)
 . I OK D SETUP^ORWGAPIU(.ITEMS,RESULT,TMP,.CNT)
 Q
 ;
BCMA(ITEMS,DFN,FMT,OLDEST,NEWEST,CNT,TMP) ; from ORWGAPIR
 N DATE,DRUG,ITEM,NUM,RESULT
 K ^TMP("ORWGRPC TEMP",$J)
 I FMT=6 D
 . S DATE=OLDEST
 . F  S DATE=$O(^PSB(53.79,"AADT",DFN,DATE)) Q:DATE<1  Q:DATE>NEWEST  D
 .. S NUM=0
 .. F  S NUM=$O(^PSB(53.79,"AADT",DFN,DATE,NUM)) Q:NUM<1  D
 ... S ITEM=$P($G(^PSB(53.79,NUM,0)),U,8) I 'ITEM Q
 ... I $D(^TMP("ORWGRPC TEMP",$J,ITEM)) Q
 ... S ^TMP("ORWGRPC TEMP",$J,ITEM)=""
 ... S CNT=CNT+1
 ... S RESULT="53.79^"_ITEM
 ... D SETUP^ORWGAPIU(.ITEMS,RESULT,TMP,.CNT)
 I FMT'=6 D
 . S ITEM=""
 . F  S ITEM=$O(^PSB(53.79,"AOIP",DFN,ITEM)) Q:ITEM=""  D
 .. S DATE=$O(^PSB(53.79,"AOIP",DFN,ITEM,""),-1)
 .. I 'DATE Q
 .. S NUM=$O(^PSB(53.79,"AOIP",DFN,ITEM,DATE,""),-1)
 .. I 'NUM Q
 .. S CNT=CNT+1
 .. I FMT=3 S RESULT="53.79^"_ITEM_"^^"_$$POINAME^ORWGAPIA(ITEM)_"^^"_DATE
 .. I FMT=0 S RESULT="53.79^"_ITEM_U_$$POINAME^ORWGAPIA(ITEM)
 .. S DRUG=$$DRUG^ORWGAPIA(NUM)
 .. I DRUG S RESULT=RESULT_U_$$DRGCLASS^ORWGAPIA(DRUG)
 .. D SETUP^ORWGAPIU(.ITEMS,RESULT,TMP,.CNT)
 K ^TMP("ORWGRPC TEMP",$J)
 Q
 ;
DC(ITEMS,DFN,FMT,OLDEST,NEWEST,CNT,TMP) ; from ORWGAPIR
 ; FMT,OLDEST,NEWEST not used
 N DATA,DATE,DATE1,DRUG,ITEM,FILE,NUM,REF,RESULT K DATA
 K ^TMP("ORWGRPC DC",$J)
 F FILE=52,55 D
 . S ITEM=""
 . F  S ITEM=$O(^PXRMINDX(FILE,"PI",DFN,ITEM)) Q:ITEM=""  D
 .. S RESULT=$$DRGCLASS^ORWGAPIA(ITEM)
 .. I RESULT="" Q
 .. S RESULT="50.605^"_RESULT
 .. S ^TMP("ORWGRPC DC",$J,RESULT)=""
 S ITEM=""
 F  S ITEM=$O(^PSB(53.79,"AOIP",DFN,ITEM)) Q:ITEM=""  D
 . S DATE=$O(^PSB(53.79,"AOIP",DFN,ITEM,""),-1)
 . I 'DATE Q
 . S NUM=$O(^PSB(53.79,"AOIP",DFN,ITEM,DATE,""),-1)
 . I 'NUM Q
 . S DRUG=$$DRUG^ORWGAPIA(NUM)
 . I 'DRUG Q
 . S RESULT=$$DRGCLASS^ORWGAPIA(DRUG)
 . I 'RESULT Q
 . S RESULT="50.605^"_RESULT
 . S ^TMP("ORWGRPC DC",$J,RESULT)=""
 S ITEM=""
 F  S ITEM=$O(^PXRMINDX("55NVA","PI",DFN,ITEM)) Q:ITEM=""  D
 . S DATE=$O(^PXRMINDX("55NVA","PI",DFN,ITEM,""),-1)
 . I 'DATE Q
 . S DATE1=$O(^PXRMINDX("55NVA","PI",DFN,ITEM,DATE,""),-1)
 . I '$L(DATE1) Q
 . S REF=$O(^PXRMINDX("55NVA","PI",DFN,ITEM,DATE,DATE1,""),-1)
 . I '$L(REF) Q
 . D RXNVA^ORWGAPIA(REF,.DATA)
 . S DRUG=+$G(DATA("DISPENSE DRUG"))
 . I 'DRUG Q
 . S RESULT=$$DRGCLASS^ORWGAPIA(DRUG)
 . I 'RESULT Q
 . S RESULT="50.605^"_RESULT
 . S ^TMP("ORWGRPC DC",$J,RESULT)=""
 S RESULT=""
 F  S RESULT=$O(^TMP("ORWGRPC DC",$J,RESULT)) Q:RESULT=""  S CNT=CNT+1 D
 . D SETUP^ORWGAPIU(.ITEMS,RESULT,TMP,.CNT)
 K ^TMP("ORWGRPC DC",$J)
 Q
 ;
LAB(ITEMS,DFN,FMT,OLDEST,NEWEST,CNT,TMP) ; from ORWGAPIR
 N DATE,ITEM,OK,RESULT
 S ITEM=0
 F  S ITEM=$O(^PXRMINDX(63,"PI",DFN,ITEM)) Q:ITEM<1  D
 . S OK=0
 . I FMT=6 D
 .. S DATE=OLDEST
 .. F  S DATE=$O(^PXRMINDX(63,"PI",DFN,ITEM,DATE)) Q:DATE=""  Q:DATE>NEWEST  D  Q:OK
 ... S CNT=CNT+1
 ... S OK=1
 ... S RESULT=63_U_ITEM
 . I FMT=3 D
 .. S DATE=$O(^PXRMINDX(63,"PI",DFN,ITEM,""),-1)
 .. I 'DATE Q
 .. S CNT=CNT+1
 .. S OK=1
 .. S RESULT=63_U_ITEM_"^^"_$$EVALUE^ORWGAPIU(ITEM,63,.01)_"^^"_DATE
 . I FMT=0 D
 .. S CNT=CNT+1
 .. S OK=1
 .. S RESULT=63_U_ITEM_U_$$EVALUE^ORWGAPIU(ITEM,63,.01)
 . I OK D
 .. S RESULT=RESULT_U_$$AALAB^ORWGAPIA(ITEM)
 .. D SETUP^ORWGAPIU(.ITEMS,RESULT,TMP,.CNT)
 Q
 ;
MI(ITEMS,DFN,FMT,OLDEST,NEWEST,CNT,TMP) ; from ORWGAPIR
 N DATE,ITEM,OK,RESULT
 S ITEM="M"
 F  S ITEM=$O(^PXRMINDX(63,"PI",DFN,ITEM)) Q:ITEM=""  Q:ITEM]"MZ"  D
 . S OK=0
 . I FMT=6 D
 .. S DATE=OLDEST
 .. F  S DATE=$O(^PXRMINDX(63,"PI",DFN,ITEM,DATE)) Q:DATE=""  Q:DATE>NEWEST  D  Q:OK
 ... S CNT=CNT+1
 ... S OK=1
 ... S RESULT="63MI"_U_ITEM
 . I FMT=3 D
 .. S DATE=$O(^PXRMINDX(63,"PI",DFN,ITEM,""),-1)
 .. I 'DATE Q
 .. S CNT=CNT+1
 .. S OK=1
 .. S RESULT="63MI^"_ITEM_"^^"_$$ITEMPRFX^ORWGAPIU(ITEM)_": "_$$EVALUE^ORWGAPIU(ITEM,63,.01)_"^^"_DATE
 . I FMT=0 D
 .. S CNT=CNT+1
 .. S OK=1
 .. S RESULT="63MI^"_ITEM_U_$$ITEMPRFX^ORWGAPIU(ITEM)_": "_$$EVALUE^ORWGAPIU(ITEM,63,.01)
 . I OK D SETUP^ORWGAPIU(.ITEMS,RESULT,TMP,.CNT)
 Q
 ;
MED(ITEMS,DFN,FMT,OLDEST,NEWEST,CNT,TMP) ; from ORWGAPIR
 D MED1^ORWGAPID(.ITEMS,DFN,FMT,OLDEST,NEWEST,.CNT,.TMP)
 Q
 ;
NOTES(ITEMS,DFN,FMT,OLDEST,NEWEST,CNT,TMP) ; from ORWGAPIR
 N DATE,DOC,DOCCLASS,DOCIEN,DOCTYPE,DUMMY,RESULT,RESULTS,TITLE K DUMMY
 K ^TMP("ORWGRPC TEMP",$J),^TMP("TIUR",$J)
 S CNT=$G(CNT)
 I FMT=6 D 
 . F DOCTYPE="P","D","C" D
 .. S DOCCLASS=$$DOCCLASS^ORWGAPIA(DOCTYPE)
 .. K ^TMP("TIUR",$J)
 .. D TIU^ORWGAPIA(.DUMMY,DOCCLASS,5,DFN,$G(OLDEST),$G(NEWEST))
 .. S DOC=0
 .. F  S DOC=$O(^TMP("TIUR",$J,DOC)) Q:DOC<1  D
 ... S RESULTS=^TMP("TIUR",$J,DOC)
 ... S TITLE=$P(RESULTS,U,2)
 ... S DATE=$P(RESULTS,U,3)
 ... I '$L(TITLE) Q
 ... S ^TMP("ORWGRPC TEMP",$J,TITLE,DATE)=RESULTS
 I FMT'=6 D
 . F DOCTYPE="P","D","C" D
 .. S DOCCLASS=$$DOCCLASS^ORWGAPIA(DOCTYPE)
 .. K ^TMP("TIUR",$J)
 .. D TIU^ORWGAPIA(.DUMMY,DOCCLASS,5,DFN)
 .. S DOC=0
 .. F  S DOC=$O(^TMP("TIUR",$J,DOC)) Q:DOC<1  D
 ... S RESULTS=^TMP("TIUR",$J,DOC)
 ... S TITLE=$P(RESULTS,U,2)
 ... S DATE=$P(RESULTS,U,3)
 ... I '$L(TITLE) Q
 ... S ^TMP("ORWGRPC TEMP",$J,TITLE,DATE)=RESULTS
 S TITLE=""
 F  S TITLE=$O(^TMP("ORWGRPC TEMP",$J,TITLE)) Q:TITLE=""  D
 . S CNT=CNT+1
 . I FMT=6 S RESULT=8925_U_TITLE
 . I FMT=3 D
 .. S DATE=+$O(^TMP("ORWGRPC TEMP",$J,TITLE,""),-1)
 .. S DOCIEN=+$G(^TMP("ORWGRPC TEMP",$J,TITLE,DATE))
 .. S RESULT=8925_U_TITLE_"^^"_TITLE_"^^"
 .. S RESULT=RESULT_DATE
 .. S RESULT=RESULT_U_$$TITLE^ORWGAPIA(DOCIEN)
 . I FMT=0 S RESULT=8925_U_TITLE_U_TITLE
 . S RESULT=$$UP^ORWGAPIX(RESULT)
 . D SETUP^ORWGAPIU(.ITEMS,RESULT,TMP,.CNT)
 K ^TMP("ORWGRPC TEMP",$J),^TMP("TIUR",$J)
 Q
 ;
NVAE(ITEMS,DFN,FMT,OLDEST,NEWEST,CNT,TMP) ; from ORWGAPIR
 N DATA,DATE,DATE1,DRUG,ITEM,OK,REF,RESULT K DATA
 S ITEM=""
 F  S ITEM=$O(^PXRMINDX("55NVA","PI",DFN,ITEM)) Q:ITEM=""  D
 . S OK=0
 . I FMT=6 D
 .. S DATE=OLDEST
 .. F  S DATE=$O(^PXRMINDX("55NVA","PI",DFN,ITEM,DATE)) Q:DATE=""  Q:DATE>NEWEST  D  Q:OK
 ... S CNT=CNT+1
 ... S OK=1
 ... S RESULT="55NVAE"_U_ITEM
 . I FMT'=6 D
 .. S DATE=$O(^PXRMINDX("55NVA","PI",DFN,ITEM,""),-1)
 .. I 'DATE Q
 .. S DATE1=$O(^PXRMINDX("55NVA","PI",DFN,ITEM,DATE,""),-1)
 .. I '$L(DATE1) Q
 .. S REF=$O(^PXRMINDX("55NVA","PI",DFN,ITEM,DATE,DATE1,""),-1)
 .. I '$L(REF) Q
 .. D RXNVA^ORWGAPIA(REF,.DATA)
 .. S DRUG=+$G(DATA("DISPENSE DRUG"))
 .. S CNT=CNT+1
 .. S OK=1
 .. I FMT=3 S RESULT="55NVAE"_U_ITEM_"^^"_$$EVALUE^ORWGAPIU(ITEM,"55NVA",.01)_"^^"_DATE
 .. I FMT=0 S RESULT="55NVAE"_U_ITEM_U_$$EVALUE^ORWGAPIU(ITEM,"55NVA",.01)
 .. I DRUG S RESULT=RESULT_U_$$DRGCLASS^ORWGAPIA(DRUG)
 . I OK D SETUP^ORWGAPIU(.ITEMS,RESULT,TMP,.CNT)
 Q
 ;
NVA(ITEMS,DFN,FMT,OLDEST,NEWEST,CNT,TMP) ; from ORWGAPIR
 D NVA1^ORWGAPID(.ITEMS,DFN,FMT,OLDEST,NEWEST,.CNT,.TMP)
 Q
 ;
TITLE(ITEMS,DFN,FMT,OLDEST,NEWEST,CNT,TMP) ; from ORWGAPIR
 ; FMT,OLDEST,NEWEST not used
 N ITEM,FILE,NUM,REF,RESULT
 K ^TMP("ORWGRPC DC",$J)
 S ITEM=""
 F  S ITEM=$O(^PXRMINDX(63,"PI",DFN,ITEM)) Q:ITEM=""  D
 . I $E(ITEM)="A" Q
 . I $E(ITEM)="M" Q
 . S RESULT=$$AALAB^ORWGAPIA(ITEM)
 . I RESULT="" Q
 . S RESULT="68^"_RESULT
 . S ^TMP("ORWGRPC DC",$J,RESULT)=""
 S RESULT=""
 F  S RESULT=$O(^TMP("ORWGRPC DC",$J,RESULT)) Q:RESULT=""  S CNT=CNT+1 D
 . D SETUP^ORWGAPIU(.ITEMS,RESULT,TMP,.CNT)
 K ^TMP("ORWGRPC DC",$J)
 Q
 ;
