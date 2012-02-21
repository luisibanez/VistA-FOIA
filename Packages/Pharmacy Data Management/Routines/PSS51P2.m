PSS51P2 ;BIR/LDT - API FOR INFORMATION FROM FILE 51.2; 5 Sep 03
 ;;1.0;PHARMACY DATA MANAGEMENT;**85**;9/30/97
 ;
ALL(PSSIEN,PSSFT,PSSFL,PSSPK,LIST) ;
 ;PSSIEN - IEN of entry in MEDICATION ROUTES file (#51.2).
 ;PSSFT - Free Text name in MEDICATION ROUTES file (#51.2).
 ;PSSFL - Inactive flag - "" - All entries
 ;        FileMan Date - Only entries with no Inactive Date or an Inactive Date greater than this date.
 ;PSSPK - PACKAGE USE field (#3) of the MEDICATION ROUTES file (#51.2).
 ;LIST - Subscript of ^TMP array in the form ^TMP($J,LIST,Field Number where Field Number is
 ;the Field Number of the data piece being returned.
 ;Returns NAME field (#.01), ABBREVIATION field (#1), PACKAGE USE field (#3), OUTPATIENT EXPANSION field (#4),
 ;OTHER LANGUAGE EXPANSION field (#4.1), INACTIVATION DATE field (#5), and IV FLAG field (#6)
 ;of MEDICATION ROUTES file (#51.2).
 N DIERR,ZZERR,PSS51P2,SCR,PSS
 I $G(LIST)']"" Q
 K ^TMP($J,LIST)
 I +$G(PSSIEN)'>0,($G(PSSFT)']"") S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 I $G(PSSIEN)]"",+$G(PSSIEN)'>0 S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 S SCR("S")=""
 I +$G(PSSFL)>0 N ND D SETSCRN
 ;Naked reference below refers to ^PS(51.2,+Y,0)
 I $G(PSSPK)]"" S SCR("S")=$S(SCR("S")]"":SCR("S")_" I $P($G(^(0)),U,4)=$G(PSSPK)",1:"I $P($G(^(0)),U,4)=$G(PSSPK)")
 I +$G(PSSIEN)>0 N PSSIEN2 S PSSIEN2=$$FIND1^DIC(51.2,"","A","`"_PSSIEN,,SCR("S"),"") D
 .I +PSSIEN2'>0 S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 .S ^TMP($J,LIST,0)=1
 .D GETS^DIQ(51.2,+PSSIEN2,".01;1;3;4;5;6;4.1","IE","^TMP(""PSS51P2"",$J)") S PSS(1)=0
 .F  S PSS(1)=$O(^TMP("PSS51P2",$J,51.2,PSS(1))) Q:'PSS(1)  D SETZRO
 I +$G(PSSIEN)'>0,$G(PSSFT)]"" D
 .I PSSFT["??" D LOOP(1) Q
 .D FIND^DIC(51.2,,"@;.01;1","QP",PSSFT,,"B",SCR("S"),,"")
 .I +$G(^TMP("DILIST",$J,0))=0 S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 .S ^TMP($J,LIST,0)=+^TMP("DILIST",$J,0)
 .N PSSXX S PSSXX=0 F  S PSSXX=$O(^TMP("DILIST",$J,PSSXX)) Q:'PSSXX  D
 ..S PSSIEN=+^TMP("DILIST",$J,PSSXX,0) K ^TMP("PSS51P2",$J) D GETS^DIQ(51.2,+PSSIEN,".01;1;3;4;5;6;4.1","IE","^TMP(""PSS51P2"",$J)") S PSS(1)=0
 ..F  S PSS(1)=$O(^TMP("PSS51P2",$J,51.2,PSS(1))) Q:'PSS(1)  D SETZRO
 K TMP("DILIST",$J),^TMP("PSS51P2",$J)
 Q
 ;
NAME(PSSFT,PSSPK,LIST) ;
 ;PSSFT - Free Text name in MEDICATION ROUTES file (#51.2).
 ;PSSPK - PACKAGE USE field (#3) of the MEDICATION ROUTES file (#51.2).
 ;LIST - Subscript of ^TMP array in the form ^TMP($J,LIST,Field Number where Field Number is
 ;the Field Number of the data piece being returned.
 ;Returns NAME field (#.01), ABBREVIATION field (#1), and INACTIVATION DATE field (#5)
 ;of MEDICATION ROUTES file (#51.2).
 N DIERR,ZZERR,PSS51P2,SCR,PSS
 I $G(LIST)']"" Q
 K ^TMP($J,LIST)
 I ($G(PSSFT)']"") S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 ;Naked reference below refers to ^PS(51.2,+Y,0)
 S SCR("S")=$S($G(PSSPK)]"":"I $P($G(^(0)),""^"",4)=$G(PSSPK)",1:"")
 I PSSFT["??" D LOOP(2) Q
 D FIND^DIC(51.2,,"@;.01;1","QP",PSSFT,,"B",SCR("S"),,"")
 I +$G(^TMP("DILIST",$J,0))=0 S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 S ^TMP($J,LIST,0)=+^TMP("DILIST",$J,0)
 N PSSXX S PSSXX=0 F  S PSSXX=$O(^TMP("DILIST",$J,PSSXX)) Q:'PSSXX  D
 .S PSSIEN=+^TMP("DILIST",$J,PSSXX,0) K ^TMP("PSS51P2",$J) D GETS^DIQ(51.2,+PSSIEN,".01;1;5","IE","^TMP(""PSS51P2"",$J)") S PSS(1)=0
 .F  S PSS(1)=$O(^TMP("PSS51P2",$J,51.2,PSS(1))) Q:'PSS(1)  D SETZRO2
 K TMP("DILIST",$J),^TMP("PSS51P2",$J)
 Q
 ;
IEN(PSSABBR,LIST) ;
 ;PSSABBR - ABBREVIATION field (#1) in MEDICATION ROUTES file (#51.2).
 ;LIST - Subscript of ^TMP array in the form ^TMP($J,LIST,Field Number where Field Number is
 ;the Field Number of the data piece being returned.
 ;Returns NAME field (#.01), ABBREVIATION field (#1), and INACTIVATION DATE field (#5)
 ;of MEDICATION ROUTES file (#51.2).
 N DIERR,ZZERR,PSS51P2,SCR,PSS
 I $G(LIST)']"" Q
 K ^TMP($J,LIST)
 I ($G(PSSABBR)']"") S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 D FIND^DIC(51.2,,"@;.01;1","QP",PSSABBR,,"C",,,"")
 I +$G(^TMP("DILIST",$J,0))=0 S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 S ^TMP($J,LIST,0)=+^TMP("DILIST",$J,0)
 N PSSXX S PSSXX=0 F  S PSSXX=$O(^TMP("DILIST",$J,PSSXX)) Q:'PSSXX  D
 .S PSSIEN=+^TMP("DILIST",$J,PSSXX,0) K ^TMP("PSS51P2",$J) D GETS^DIQ(51.2,+PSSIEN,".01;1;3;4;5;6;4.1","IE","^TMP(""PSS51P2"",$J)") S PSS(1)=0
 .F  S PSS(1)=$O(^TMP("PSS51P2",$J,51.2,PSS(1))) Q:'PSS(1)  D SETZRO2
 K TMP("DILIST",$J),^TMP("PSS51P2",$J)
 Q
 ;
SETSCRN ;Set Screen for inactive Medication Routes
 ;Naked reference below refers to ^PS(51.2,+Y,0)
 S SCR("S")="S ND=$P($G(^(0)),U,5) I ND=""""!(ND>PSSFL)"
 Q
 ;
SETZRO ;
 S ^TMP($J,LIST,+PSS(1),.01)=$G(^TMP("PSS51P2",$J,51.2,PSS(1),.01,"I"))
 S ^TMP($J,LIST,"B",$G(^TMP("PSS51P2",$J,51.2,PSS(1),.01,"I")),+PSS(1))=""
 S ^TMP($J,LIST,+PSS(1),4)=$G(^TMP("PSS51P2",$J,51.2,PSS(1),4,"I"))
 S ^TMP($J,LIST,+PSS(1),1)=$G(^TMP("PSS51P2",$J,51.2,PSS(1),1,"I"))
 S ^TMP($J,LIST,+PSS(1),3)=$S($G(^TMP("PSS51P2",$J,51.2,PSS(1),3,"I"))="":"",1:^TMP("PSS51P2",$J,51.2,PSS(1),3,"I")_"^"_^TMP("PSS51P2",$J,51.2,PSS(1),3,"E"))
 S ^TMP($J,LIST,+PSS(1),5)=$S($G(^TMP("PSS51P2",$J,51.2,PSS(1),5,"I"))="":"",1:^TMP("PSS51P2",$J,51.2,PSS(1),5,"I")_"^"_^TMP("PSS51P2",$J,51.2,PSS(1),5,"E"))
 S ^TMP($J,LIST,+PSS(1),6)=$S($G(^TMP("PSS51P2",$J,51.2,PSS(1),6,"I"))="":"",1:^TMP("PSS51P2",$J,51.2,PSS(1),6,"I")_"^"_^TMP("PSS51P2",$J,51.2,PSS(1),6,"E"))
 S ^TMP($J,LIST,+PSS(1),4.1)=$G(^TMP("PSS51P2",$J,51.2,PSS(1),4.1,"I"))
 Q
 ;
SETZRO2 ;
 S ^TMP($J,LIST,+PSS(1),.01)=$G(^TMP("PSS51P2",$J,51.2,PSS(1),.01,"I"))
 S ^TMP($J,LIST,"B",$G(^TMP("PSS51P2",$J,51.2,PSS(1),.01,"I")),+PSS(1))=""
 S ^TMP($J,LIST,+PSS(1),1)=$G(^TMP("PSS51P2",$J,51.2,PSS(1),1,"I"))
 S ^TMP($J,LIST,+PSS(1),5)=$S($G(^TMP("PSS51P2",$J,51.2,PSS(1),5,"I"))="":"",1:^TMP("PSS51P2",$J,51.2,PSS(1),5,"I")_"^"_^TMP("PSS51P2",$J,51.2,PSS(1),5,"E"))
 Q
 ;
LOOP(PSS) ;
 N CNT S CNT=0
 S PSSIEN=0 F  S PSSIEN=$O(^PS(51.2,PSSIEN)) Q:'PSSIEN  D @(PSS)
 S ^TMP($J,LIST,0)=$S($G(CNT)>0:CNT,1:"-1^NO DATA FOUND")
 Q
 ;
1 ;
 S ND=$G(^PS(51.2,+PSSIEN,0))
 I +$G(PSSFL)>0 Q:$P($G(ND),"^",5)]""&($P($G(ND),"^",5)'>$G(PSSFL))
 I $G(PSSPK)]"" Q:$P($G(ND),"^",4)'=$G(PSSPK)
 K ^TMP("PSS51P2",$J) D GETS^DIQ(51.2,+PSSIEN,".01;1;3;4;5;6;4.1","IE","^TMP(""PSS51P2"",$J)") S PSS(1)=0 D
 .F  S PSS(1)=$O(^TMP("PSS51P2",$J,51.2,PSS(1))) Q:'PSS(1)  D SETZRO S CNT=CNT+1
 Q
 ;
2 ;
 I $G(PSSPK)]"",$P($G(^PS(51.2,+PSSIEN,0)),"^",4)'=$G(PSSPK) Q
 K ^TMP("PSS51P2",$J) D GETS^DIQ(51.2,+PSSIEN,".01;1;5","IE","^TMP(""PSS51P2"",$J)") S PSS(1)=0 D
 .F  S PSS(1)=$O(^TMP("PSS51P2",$J,51.2,PSS(1))) Q:'PSS(1)  D SETZRO2 S CNT=CNT+1
 Q
