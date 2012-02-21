PXRMRUL1 ; SLC/AGP - Build Patient list from Reminder Defintion Rule;11/29/2004
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ; 
REM(RIEN,RSTART,RSTOP) ;Process TERM finding rule
 ;
 N DEFINST,FINDPA,PLIST,PXRMDATE,TFIEV,TSUB
 ;
 ;Modify start date to catch incomplete dates
 I $E(RSTART,6,7)="01" S RSTART=$E(RSTART,1,5)_"00"
 ;Include year only incomplete dates in January
 I $E(RSTART,4,5)="01" S RSTART=$E(RSTART,1,3)_"0000"
 ;
 ;Set start and end dates
 S $P(FINDPA(0),U,8)=RSTART,$P(FINDPA(0),U,11)=RSTOP,PXRMDATE=RSTOP
 ;
 ;If action is merge finding set default institution
 S DEFINST=""
 I FRACT="F" D
 .N INSTNUM
 .;Get site facility code
 .S INSTNUM=+$P($$SITE^VASITE,U,3) Q:'INSTNUM
 .;If not multi-division site us site facility code as default
 .I $P($G(^DIC(4,INSTNUM,"DIV")),U)'="Y" S DEFINST=INSTNUM
 ;
 D BLDPLST^PXRMPLST(RIEN,PNODE,1,PXRMDATE)
 ;Remove, Select or Add Findings operations
 I FRACT="A" D LOGOP(FROUT,PNODE,"!") Q
 I FRACT="D" D LOGOP(FROUT,PNODE,"~") Q
 I FRACT="S" D LOGOP(FROUT,PNODE,"&") Q
 I FRACT="F" D  Q
 .S DFN=0
 .F  S DFN=$O(^TMP(FROUT,$J,DFN)) Q:'DFN  D
 ..;Calculate primary facility
 ..S $P(^TMP(FROUT,$J,DFN),U)=$S(DEFINST]"":DEFINST,1:$$INST^PXRMRULE(DFN,RSTOP))
 Q
 ;
LOGOP(LIST1,LIST2,LOGOP) ;Given LIST1 and LIST2 apply the logical
 ;operator LOGOP to generate a new list and return it in LIST1
 N DFN1,DFN2
 I LOGOP="&" D  Q
 . S DFN1=""
 . F  S DFN1=$O(^TMP($J,LIST1,DFN1)) Q:DFN1=""  D
 .. I $D(^TMP($J,LIST2,DFN1)) M ^TMP($J,LIST1,DFN1)=^TMP($J,LIST2,DFN1) Q
 .. K ^TMP($J,LIST1,DFN1)
 ;
 ;"~" represents "&'".
 I LOGOP="~" D  Q
 . S DFN1=""
 . F  S DFN1=$O(^TMP($J,LIST1,DFN1)) Q:DFN1=""  D
 .. I $D(^TMP($J,LIST2,DFN1)) K ^TMP($J,LIST1,DFN1)
 ;
 I LOGOP="!" D
 . S DFN2=""
 . F  S DFN2=$O(^TMP($J,LIST2,DFN2)) Q:DFN2=""  D
 .. M ^TMP($J,LIST1,DFN2)=^TMP($J,LIST2,DFN2)
 Q
 ;
