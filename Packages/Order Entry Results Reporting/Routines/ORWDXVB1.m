ORWDXVB1 ;slc/dcm - Order dialog utilities for Blood Bank Cont.;3/2/04  09:31 ;12/7/05  17:20
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**215**;Dec 17 1997
 ;
PTINFO ;Format patient BB info
 N GCNT,CCNT,GIOSL,GIOM,I,TYPE,ORUA,VBERROR,ABFND,LINE1,LINE2,NOABO,NOPAT,TREQFND
 S (GCNT,NOPAT,NOABO)=0,CCNT=1,GIOSL=999999,GIOM=80
 S OROOT=$NA(^TMP("ORVBEC",$J))
 K ^TMP("ORVBEC",$J)
 ;
 I +$G(ORX("ERROR")) D ERROR^ORWDXVB2 Q
 ; Patient Demographics
 D LN
 I '$D(ORX("PATIENT")) D  Q
 . D LINE^ORU4("^TMP(""ORVBEC"",$J)",GIOM),LN
 . S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(10,CCNT,"There is no previous record of this patient in VBECS.",.CCNT) Q
 ;
 S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(1,CCNT,"Name",.CCNT)_$$S^ORU4(27,CCNT,"SSN",.CCNT)_$$S^ORU4(42,CCNT,"ABO/Rh",.CCNT)
 D LN
 S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(1,CCNT,"----",.CCNT)_$$S^ORU4(27,CCNT,"---",.CCNT)_$$S^ORU4(42,CCNT,"------",.CCNT) D
 . D LN
 . S X=ORX("PATIENT"),^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(1,CCNT,$P(X,"^",3)_", "_$P(X,"^",2),.CCNT)_$$S^ORU4(27,CCNT,$P(X,"^",4),.CCNT)
 . I $P(ORX("ABORH"),"^")']"" S ^TMP("ORVBEC",$J,GCNT,0)=^TMP("ORVBEC",$J,GCNT,0)_$$S^ORU4(42,CCNT,"unknown",.CCNT) Q
 . S X=ORX("ABORH"),^TMP("ORVBEC",$J,GCNT,0)=^TMP("ORVBEC",$J,GCNT,0)_$$S^ORU4(42,CCNT,$$STRIP^XLFSTR($P(X,"^")," ")_" "_$S($$STRIP^XLFSTR($P(X,"^",2)," ")="P":"Pos",$$STRIP^XLFSTR($P(X,"^",2)," ")="N":"Neg",1:"unknown"),.CCNT) Q
 D LINE^ORU4("^TMP(""ORVBEC"",$J)",GIOM),LN
 D LINE^ORU4("^TMP(""ORVBEC"",$J)",GIOM),LN
 ;
 ; Available Specimens
 S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(1,CCNT,"Available Specimen UID",.CCNT)_$$S^ORU4(27,CCNT,"Expiration Date",.CCNT)
 D LN
 S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(1,CCNT,"----------------------",.CCNT)_$$S^ORU4(27,CCNT,"---------------",.CCNT) D
 . I '$D(ORX("SPECIMEN")) D LN S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(1,CCNT," none",.CCNT) Q
 . D LN
 . S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(2,CCNT,$P(ORX("SPECIMEN"),"^",2),.CCNT)_$$S^ORU4(27,CCNT,$$DATETIME^ORCHTAB($P(ORX("SPECIMEN"),"^")),.CCNT) Q
 D LINE^ORU4("^TMP(""ORVBEC"",$J)",GIOM),LN
 D LINE^ORU4("^TMP(""ORVBEC"",$J)",GIOM),LN
 ;
 ; Antibodies Identified section
 S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(1,CCNT,"Antibodies Identified",.CCNT)
 D LN
 S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(1,CCNT,"---------------------",.CCNT) D
 . I '$O(ORX("ABHIS",0)) D LN S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(1,CCNT," none",.CCNT) Q
 . D LN
 . S ABFND=0
 . S I=0 F  S I=$O(ORX("ABHIS",I)) Q:I<1  D
 . . S X=ORX("ABHIS",I)
 . . I ABFND S ^TMP("ORVBEC",$J,GCNT,0)=^TMP("ORVBEC",$J,GCNT,0)_$$S^ORU4(2,CCNT,", "_$P(X,"^"),.CCNT) Q
 . . S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(2,CCNT,$P(X,"^"),.CCNT),ABFND=1
 D LINE^ORU4("^TMP(""ORVBEC"",$J)",GIOM),LN
 D LINE^ORU4("^TMP(""ORVBEC"",$J)",GIOM),LN
 ;
 ; Transfusion Requirements section
 S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(1,CCNT,"Transfusion Requirements",.CCNT)
 D LN
 S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(1,CCNT,"------------------------",.CCNT) D
 . I '$O(ORX("TRREQ",0)) D LN S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(1,CCNT," none",.CCNT) Q
 . D LN
 . S TREQFND=0
 . S I=0 F  S I=$O(ORX("TRREQ",I)) Q:I<1  D
 . . S X=ORX("TRREQ",I)
 . . I TREQFND S ^TMP("ORVBEC",$J,GCNT,0)=^TMP("ORVBEC",$J,GCNT,0)_$$S^ORU4(2,CCNT,", "_X,.CCNT) Q
 . . S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(2,CCNT,X,.CCNT),TREQFND=1
 D LINE^ORU4("^TMP(""ORVBEC"",$J)",GIOM),LN
 D LINE^ORU4("^TMP(""ORVBEC"",$J)",GIOM),LN
 ;
 ; Transfusion Reactions section
 S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(1,CCNT,"Transfusion Reactions",.CCNT)_$$S^ORU4(27,CCNT,"Date/Time",.CCNT)
 D LN
 S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(1,CCNT,"---------------------",.CCNT)_$$S^ORU4(27,CCNT,"---------",.CCNT) D
 . I '$O(ORX("TRHX",0)) D LN S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(1,CCNT," none",.CCNT) Q
 . S I=0 F  S I=$O(ORX("TRHX",I)) Q:I<1  D
 . . D LN
 . . S X=ORX("TRHX",I),^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(2,CCNT,$P(X,"^"),.CCNT)_$$S^ORU4(27,CCNT,$$DATETIME($P(X,"^",2)),.CCNT)
 D LINE^ORU4("^TMP(""ORVBEC"",$J)",GIOM),LN
 D LINE^ORU4("^TMP(""ORVBEC"",$J)",GIOM),LN
 ;
 ; Units section
 S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(1,CCNT,"Units Available",.CCNT)
 D LN
 S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(1,CCNT,"---------------",.CCNT)
 D LN
 ; Autologous Units
 S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(2,CCNT,"Autologous",.CCNT)
 D LN
 I $O(ORX("UNIT","A",0)) D
 . S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(3,CCNT,"Unit ID",.CCNT)_$$S^ORU4(13,CCNT,"Component",.CCNT)_$$S^ORU4(27,CCNT,"Expiration Date  Division",.CCNT)
 . D LN
 . S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(3,CCNT,"-------",.CCNT)_$$S^ORU4(13,CCNT,"---------",.CCNT)_$$S^ORU4(27,CCNT,"---------------  --------",.CCNT) D
 . . S I=0 F  S I=$O(ORX("UNIT","A",I)) Q:I<1  D
 . . . D LN
 . . . S X=ORX("UNIT","A",I),^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(3,CCNT,$P(X,"^"),.CCNT)_$$S^ORU4(13,CCNT,$P(X,"^",2),.CCNT)_$$S^ORU4(27,CCNT,$$DATETIME($P(X,"^",4)),.CCNT)_$$S^ORU4(44,CCNT,$P(X,"^",3),.CCNT)
 E  S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(3,CCNT," none",.CCNT)
 ;
 ; Directed Units
 D LINE^ORU4("^TMP(""ORVBEC"",$J)",GIOM),LN
 S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(2,CCNT,"Directed",.CCNT)
 D LN
 I $O(ORX("UNIT","D",0)) D
 . S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(3,CCNT,"Unit ID",.CCNT)_$$S^ORU4(13,CCNT,"Component",.CCNT)_$$S^ORU4(27,CCNT,"Expiration Date  Division",.CCNT)
 . D LN
 . S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(3,CCNT,"-------",.CCNT)_$$S^ORU4(13,CCNT,"---------",.CCNT)_$$S^ORU4(27,CCNT,"---------------  --------",.CCNT) D
 . . S I=0 F  S I=$O(ORX("UNIT","D",I)) Q:I<1  D
 . . . D LN
 . . . S X=ORX("UNIT","D",I),^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(3,CCNT,$P(X,"^"),.CCNT)_$$S^ORU4(13,CCNT,$P(X,"^",2),.CCNT)_$$S^ORU4(27,CCNT,$$DATETIME($P(X,"^",4)),.CCNT)_$$S^ORU4(44,CCNT,$P(X,"^",3),.CCNT)
 E  S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(3,CCNT," none",.CCNT)
 ;
 ; Crossmatched Units
 D LINE^ORU4("^TMP(""ORVBEC"",$J)",GIOM),LN
 S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(2,CCNT,"Crossmatched",.CCNT)
 D LN
 I $O(ORX("UNIT","C",0)) D
 . S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(3,CCNT,"Unit ID",.CCNT)_$$S^ORU4(13,CCNT,"Component",.CCNT)_$$S^ORU4(27,CCNT,"Available Until  Division",.CCNT)
 . D LN
 . S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(3,CCNT,"-------",.CCNT)_$$S^ORU4(13,CCNT,"---------",.CCNT)_$$S^ORU4(27,CCNT,"---------------  --------",.CCNT) D
 . . S I=0 F  S I=$O(ORX("UNIT","C",I)) Q:I<1  D
 . . . D LN
 . . . S X=ORX("UNIT","C",I),^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(3,CCNT,$P(X,"^"),.CCNT)_$$S^ORU4(13,CCNT,$P(X,"^",2),.CCNT)_$$S^ORU4(27,CCNT,$$DATETIME($P(X,"^",4)),.CCNT)_$$S^ORU4(44,CCNT,$P(X,"^",3),.CCNT)
 E  S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(3,CCNT," none",.CCNT)
 ;
 ; Assigned Units
 D LINE^ORU4("^TMP(""ORVBEC"",$J)",GIOM),LN
 S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(2,CCNT,"Assigned",.CCNT)
 D LN
 I $O(ORX("UNIT","S",0)) D
 . S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(3,CCNT,"Unit ID",.CCNT)_$$S^ORU4(13,CCNT,"Component",.CCNT)_$$S^ORU4(27,CCNT,"Available Until  Division",.CCNT)
 . D LN
 . S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(3,CCNT,"-------",.CCNT)_$$S^ORU4(13,CCNT,"---------",.CCNT)_$$S^ORU4(27,CCNT,"---------------  --------",.CCNT) D
 . . S I=0 F  S I=$O(ORX("UNIT","S",I)) Q:I<1  D
 . . . D LN
 . . . S X=ORX("UNIT","S",I),^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(3,CCNT,$P(X,"^"),.CCNT)_$$S^ORU4(13,CCNT,$P(X,"^",2),.CCNT)_$$S^ORU4(27,CCNT,$$DATETIME($P(X,"^",4)),.CCNT)_$$S^ORU4(44,CCNT,$P(X,"^",3),.CCNT)
 E  S ^TMP("ORVBEC",$J,GCNT,0)=$$S^ORU4(3,CCNT," none",.CCNT)
 D LINE^ORU4("^TMP(""ORVBEC"",$J)",GIOM),LN
 ;
 Q
LN ;Increment counts
 S GCNT=GCNT+1,CCNT=1
 Q
DATETIME(X) ; -- Return external form of YYYYMMDDHHNNSS date
 N Y S Y=$$HL7TFM^XLFDT(X),Y=$$DATETIME^ORCHTAB(Y)
 Q Y
