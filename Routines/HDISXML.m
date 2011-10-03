HDISXML ; CT/GRR - XML UTILITY ROUTINE; 16-FEB-2004 ; 02 Mar 2005  4:17 PM
 ;;1.0;HEALTH DATA & INFORMATICS;;Feb 22, 2005
 ;
XMLOUT(HDISTEMP,HDISE,HDISF,HDIST,HDISERR) ;
 ;;Input Parameters (all required)
 ;;
 ;;HDISTEMP - IEN of XML Template
 ;;
 ;;HDISE - Element Number(s), separated by a comma, to be formatted
 ;;        and moved to the output array
 ;;
 ;;HDISF - Reference of the input array
 ;;
 ;;HDIST - Reference of the target array
 ;;
 ;;HDISERR - reference of error variable
 ;;
 ;;
 I HDISTEMP=""!(HDISE="")!(HDISF="")!(HDIST="") S @HDISERR="Missing Input Parameter",HDISOK=0 G XMLOUTQ
 N BLANK,CLOSE,DA,ELEV,HASKID,HDENT,HDISFE,HDISFO,HDISFT,HDISOK,IEN,IND,ISMULTI,LASTIEN,LINE,OPEN,QUOTE,REQ,TEXTIN,TRANSTXT,Y,ENAME
 S:HDISE'["," HDISE=HDISE_","
 D INIT
 F I=1:1 S E=$P(HDISE,",",I) Q:E=""  D
 .S (HDISFT,HDISFE)=$NA(@HDISF@(E))
 .I E["/" S E=$P(E,"/",1) D CLOSE(HDISTEMP,E,HDISF,HDIST,.HDERR) Q
 .D PROCESS(E)
XMLOUTQ Q
 ;
GETED(E) ;
 S IEN=$O(^HDIS(7115.3,HDISTEMP,"SEQ","B",E,0))
 S Y(0)=$G(^HDIS(7115.3,HDISTEMP,"SEQ",IEN,0))
 S REQ=$P(Y(0),"^",3),ENAME=$P(Y(0),"^",2),ELEV=$P(Y(0),"^",5),HASKID=$P(Y(0),"^",6),ISMULTI=$P(Y(0),"^",7)
 Q
 ;
PROCESS(E) ;
 D GETED(E)
 I 'ISMULTI D FORMAT Q
 S DA=0 F  S DA=$O(@HDISFE@(DA)) Q:DA'>0  S HDISF=$NA(@HDISFE@(DA)) D FORMAT
 Q
INIT ;
 ;N OPEN,CLOSE,QUOTE,IND,REQ,BLANK
 S OPEN="<",CLOSE=">",QUOTE="""",BLANK=" ",$P(BLANK," ",100)=" "
 S IND=$P(^HDIS(7115.3,HDISTEMP,0),"^",5)
 S LASTIEN=$O(@HDIST@(9999999),-1)
 S HDISOK=1,HDISFO=HDISF
 Q
 ;
FORMAT ;
 I 'HASKID S TEXTIN=@HDISFE Q:TEXTIN=""&'(REQ)  S TRANSTXT=$$TRANSLAT(TEXTIN)
 S LINE=""
 S LINE=$E(BLANK,1,(IND*ELEV))_OPEN_ENAME_CLOSE
 I 'HASKID S LINE=LINE_TRANSTXT_OPEN_"/"_ENAME_CLOSE
 S LASTIEN=LASTIEN+1
 S @HDIST@(LASTIEN)=LINE
 Q
 ;
CLOSE(HDISTEMP,HDISE,HDISF,HDIST,HDERR) ;
 D INIT
 D GETED(HDISE)
 S LINE=""
 S LINE=$E(BLANK,1,(IND*ELEV))_OPEN_"/"_ENAME_CLOSE
 S LASTIEN=LASTIEN+1
 S @HDIST@(LASTIEN)=LINE
 Q
 ;
TRANSLAT(X) ;
 N HDPAT,I
 I X["&" F I=1:1 Q:I=$L(X)  I $E(X,I)="&" S X=$E(X,1,(I-1))_"&amp;"_$E(X,I+1,$L(X))
 F HDPAT="'","""",">","<" F  Q:X'[HDPAT  D
 .S HDENT=""
 .I HDPAT="'" S HDENT="&apos;"
 .I HDPAT="""" S HDENT="&quot;"
 .I HDPAT=">" S HDENT="&gt;"
 .I HDPAT="<" S HDENT="&lt;"
 .Q:HDENT=""
 .S X=$P(X,HDPAT,1)_HDENT_$P(X,HDPAT,2,99)
 Q X
 ;