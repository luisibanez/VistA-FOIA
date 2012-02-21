PSJ59P5 ;BIR/LDT - API FOR INFORMATION FROM FILE 59.5; 5 Sep 03
 ;;5.0; INPATIENT MEDICATIONS ;**163**;16 DEC 97
 ;
ALL(PSJIEN,PSJFT,LIST) ;
 ;PSJIEN - IEN of entry in 59.5.
 ;PSJFT - Free Text name in 59.5.
 ;LIST - Subscript of ^TMP array in the form ^TMP($J,LIST,Field Number where Field Number is the
 ;       Field Number of the data piece being returned.
 ;Returns NAME field (#.01), DIVISION field (#.02), and INACTIVATION DATE field (#19) of IV ROOM file (#59.5).
 N DIERR,ZZERR,PSJ59P5,SCR,PSJ
 I $G(LIST)']"" Q
 K ^TMP($J,LIST)
 I +$G(PSJIEN)'>0,($G(PSJFT)']"") S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 I $G(PSJIEN)]"",+$G(PSJIEN)'>0 S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 I +$G(PSJIEN)>0 N PSJIEN2 S PSJIEN2=$$FIND1^DIC(59.5,"","A","`"_PSJIEN,,,"") D
 .I +PSJIEN2'>0 S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 .S ^TMP($J,LIST,0)=1
 .D GETS^DIQ(59.5,+PSJIEN2,".01;.02;19","IE","PSJ59P5") S PSJ(1)=0
 .F  S PSJ(1)=$O(PSJ59P5(59.5,PSJ(1))) Q:'PSJ(1)  D SETALL
 I +$G(PSJIEN)'>0,$G(PSJFT)]"" D
 .D FIND^DIC(59.5,,"@;.01;","QP",PSJFT,,"B",,,"")
 .I +$G(^TMP("DILIST",$J,0))=0 S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 .I +^TMP("DILIST",$J,0)>0 S ^TMP($J,LIST,0)=+^TMP("DILIST",$J,0) N PSJXLP S PSJXLP=0 F  S PSJXLP=$O(^TMP("DILIST",$J,PSJXLP)) Q:'PSJXLP  D
 ..S PSJIEN=+^TMP("DILIST",$J,PSJXLP,0) K PSJ59P5 D GETS^DIQ(59.5,+PSJIEN,".01;.02;19","IE","PSJ59P5") S PSJ(1)=0
 ..F  S PSJ(1)=$O(PSJ59P5(59.5,PSJ(1))) Q:'PSJ(1)   D SETALL
 K ^TMP("DILIST",$J)
 Q
 ;
SETALL ;
 S ^TMP($J,LIST,+PSJ(1),.01)=$G(PSJ59P5(59.5,PSJ(1),.01,"I"))
 S ^TMP($J,LIST,"B",$G(PSJ59P5(59.5,PSJ(1),.01,"I")),+PSJ(1))=""
 S ^TMP($J,LIST,+PSJ(1),.02)=$S($G(PSJ59P5(59.5,PSJ(1),.02,"I"))="":"",1:PSJ59P5(59.5,PSJ(1),.02,"I")_"^"_PSJ59P5(59.5,PSJ(1),.02,"E"))
 S ^TMP($J,LIST,+PSJ(1),19)=$S($G(PSJ59P5(59.5,PSJ(1),19,"I"))="":"",1:PSJ59P5(59.5,PSJ(1),19,"I")_"^"_PSJ59P5(59.5,PSJ(1),19,"E"))
 Q
