PSS50DAT ;BIR/LDT - API FOR INFORMATION FROM FILE 50; 5 Sep 03
 ;;1.0;PHARMACY DATA MANAGEMENT;**85**;9/30/97
 ;
DATA ;
 ;PSSIEN - IEN of entry in 50
 ;PSSFT - Free Text name in 50
 ;PSSFL - Inactive flag - "" - All entries
 ;                        FileMan Date - Only entries with no Inactive Date or an Inactive Date greater than this date.
 ;PSSPK - Application Package's Use - "" - All entries
 ;                                         Alphabetic codes that represent the DHCP packages that consider this drug to be
 ;                                         part of their formulary.
 ;PSSRTOI - Orderable Item - return only entries matched to a Pharmacy Orderable Item                                         
 ;LIST - Subscript of ^TMP array in the form ^TMP($J,LIST,Field Number where Field Number is the Field Number of the data
 ;       piece being returned.
 N DIERR,ZZERR,SCR,PSS,PSSMLCT,PSSP50
 I $G(LIST)']"" Q
 K ^TMP($J,LIST)
 I +$G(PSSIEN)'>0,($G(PSSFT)']"") S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 S SCR("S")=""
 I +$G(PSSFL)>0!($G(PSSPK)]"")!($G(PSSRTOI)=1) N PSS5ND,PSSZ3,PSSZ4 D SETSCRN^PSS50A
 I +$G(PSSIEN)>0 N PSSIEN2 S PSSIEN2=$$FIND1^DIC(50,"","A","`"_PSSIEN,,SCR("S"),"") D  K ^TMP("PSSP50",$J) Q
 .K ^TMP("DIERR",$J)
 .I +PSSIEN2'>0 S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 .S ^TMP($J,LIST,0)=1
 .D SETSUB1^PSS50AQM(+PSSIEN2),SETSUB2^PSS50AQM(+PSSIEN2),SETSUB3^PSS50AQM(+PSSIEN2)
 .K ^TMP("PSSP50",$J) D GETS^DIQ(50,+PSSIEN2,".01:8;9*;12:16;20:40;51;101;52;100;102;63;31;64;65*;301;302;900*","IE","^TMP(""PSSP50"",$J)") S PSS(1)=0
 .F  S PSS(1)=$O(^TMP("PSSP50",$J,50,PSS(1))) Q:'PSS(1)  D SETALL^PSS50A D
 ..S (PSS(2),PSSMLCT)=0 F  S PSS(2)=$O(^TMP("PSSP50",$J,50.01,PSS(2))) Q:'PSS(2)  S PSSMLCT=PSSMLCT+1 D SETOLD^PSS50A
 ..S ^TMP($J,LIST,+PSS(1),"OLD",0)=$S($G(PSSMLCT):PSSMLCT,1:"-1^NO DATA FOUND")
 ..S (PSS(2),PSSMLCT)=0 F  S PSS(2)=$O(^TMP("PSSP50",$J,50.1,PSS(2))) Q:'PSS(2)  S PSSMLCT=PSSMLCT+1 D SETSYN^PSS50A
 ..S ^TMP($J,LIST,+PSS(1),"SYN",0)=$S($G(PSSMLCT):PSSMLCT,1:"-1^NO DATA FOUND")
 ..S (PSS(2),PSSMLCT)=0 F  S PSS(2)=$O(^TMP("PSSP50",$J,50.065,PSS(2))) Q:'PSS(2)  S PSSMLCT=PSSMLCT+1 D SETFMA^PSS50A
 ..S ^TMP($J,LIST,+PSS(1),"FRM",0)=$S($G(PSSMLCT):PSSMLCT,1:"-1^NO DATA FOUND")
 I $G(PSSIEN)'="" S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 I $G(PSSFT)]"" D
 .I PSSFT["??" D LOOP Q
 .K ^TMP("DILIST",$J)
 .D FIND^DIC(50,,"@;.01","QP",PSSFT,,"B",SCR("S"),,"")
 .I +$G(^TMP("DILIST",$J,0))=0 S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 .I +^TMP("DILIST",$J,0)>0 S ^TMP($J,LIST,0)=+^TMP("DILIST",$J,0) N PSSXX S PSSXX=0 F  S PSSXX=$O(^TMP("DILIST",$J,PSSXX)) Q:'PSSXX  D
 ..S PSSIEN=+^TMP("DILIST",$J,PSSXX,0)
 ..D SETSUB1^PSS50AQM(PSSIEN),SETSUB2^PSS50AQM(PSSIEN),SETSUB3^PSS50AQM(PSSIEN) K ^TMP("PSSP50",$J) D GETS^DIQ(50,+PSSIEN,".01:8;9*;12:16;20:40;51;101;52;100;102;63;31;64;65*;301;302;900*","IE","^TMP(""PSSP50"",$J)") S PSS(1)=0
 ..F  S PSS(1)=$O(^TMP("PSSP50",$J,50,PSS(1))) Q:'PSS(1)  D SETALL^PSS50A D
 ...S (PSS(2),PSSMLCT)=0 F  S PSS(2)=$O(^TMP("PSSP50",$J,50.01,PSS(2))) Q:'PSS(2)  S PSSMLCT=PSSMLCT+1 D SETOLD^PSS50A
 ...S ^TMP($J,LIST,+PSS(1),"OLD",0)=$S($G(PSSMLCT):PSSMLCT,1:"-1^NO DATA FOUND")
 ...S (PSS(2),PSSMLCT)=0 F  S PSS(2)=$O(^TMP("PSSP50",$J,50.1,PSS(2))) Q:'PSS(2)  S PSSMLCT=PSSMLCT+1 D SETSYN^PSS50A
 ...S ^TMP($J,LIST,+PSS(1),"SYN",0)=$S($G(PSSMLCT):PSSMLCT,1:"-1^NO DATA FOUND")
 ...S (PSS(2),PSSMLCT)=0 F  S PSS(2)=$O(^TMP("PSSP50",$J,50.065,PSS(2))) Q:'PSS(2)  S PSSMLCT=PSSMLCT+1 D SETFMA^PSS50A
 ...S ^TMP($J,LIST,+PSS(1),"FRM",0)=$S($G(PSSMLCT):PSSMLCT,1:"-1^NO DATA FOUND")
 K ^TMP("DILIST",$J),^TMP("PSSP50",$J)
 Q
 ;
DRG ;
 ;PSSIEN - IEN of entry in 50
 ;PSSFT - Free Text name in 50
 ;PSSFL - Inactive flag - "" - All entries
 ;                        FileMan Date - Only entries with no Inactive Date or an Inactive Date greater than this date.
 ;PSSPK - Application Package's Use - "" - All entries
 ;                                         Alphabetic codes that represent the DHCP packages that consider this drug to be
 ;                                         part of their formulary.
 ;PSSRTOI - Orderable Item - return only entries matched to a Pharmacy Orderable Item
 ;LIST - Subscript of ^TMP array in the form ^TMP($J,LIST,Field Number where Field Number is the Field Number of the data
 ;       piece being returned.
 N DIERR,ZZERR,PSSP50,SCR,PSS,PSSMLCT
 I $G(LIST)']"" Q
 K ^TMP($J,LIST)
 I +$G(PSSIEN)'>0,($G(PSSFT)']"") S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 S SCR("S")=""
 I +$G(PSSFL)>0!($G(PSSPK)]"")!($G(PSSRTOI)=1) N PSS5ND,PSSZ3,PSSZ4 D SETSCRN^PSS50A
 I +$G(PSSIEN)>0 N PSSIEN2 S PSSIEN2=$$FIND1^DIC(50,"","A","`"_PSSIEN,,SCR("S"),"") D  K ^TMP("PSSP50",$J) Q
 .K ^TMP("DIERR",$J)
 .I +PSSIEN2'>0 S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 .S ^TMP($J,LIST,0)=1
 .K ^TMP("PSSP50",$J) D GETS^DIQ(50,+PSSIEN2,".01;62.01:62.05;905","IE","^TMP(""PSSP50"",$J)") S PSS(1)=0
 .F  S PSS(1)=$O(^TMP("PSSP50",$J,50,PSS(1))) Q:'PSS(1)  D SETDRG^PSS50A1
 I $G(PSSIEN)'="" S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 I $G(PSSFT)]"" D
 .I PSSFT["??" D LOOP^PSS50A1 Q
 .K ^TMP("DILIST",$J)
 .D FIND^DIC(50,,"@;.01","QP",PSSFT,,"B",SCR("S"),,"")
 .I +$G(^TMP("DILIST",$J,0))=0 S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 .I +^TMP("DILIST",$J,0)>0 S ^TMP($J,LIST,0)=+^TMP("DILIST",$J,0) N PSSXX S PSSXX=0 F  S PSSXX=$O(^TMP("DILIST",$J,PSSXX)) Q:'PSSXX  D
 ..S PSSIEN=+^TMP("DILIST",$J,PSSXX,0)
 ..K ^TMP("PSSP50",$J) D GETS^DIQ(50,+PSSIEN,".01;62.01:62.05;905","IE","^TMP(""PSSP50"",$J)") S PSS(1)=0
 ..F  S PSS(1)=$O(^TMP("PSSP50",$J,50,PSS(1))) Q:'PSS(1)  D SETDRG^PSS50A1
 K ^TMP("DILIST",$J),^TMP("PSSP50",$J)
 Q
 ;
LOOP ;
 N PSS50DD1,PSS50DD2,PSS50DD3,PSS50DD4,PSS50ER1,PSS50ER2,PSS50ER3,PSS50ER4,PSS51NFD,PSS52NFD,PSSG2N,PSS501NX
 D FIELD^DID(50,51,"Z","POINTER","PSS50DD1","PSS50ER1") S PSS51NFD=$G(PSS50DD1("POINTER"))
 D FIELD^DID(50,52,"Z","POINTER","PSS50DD2","PSS50ER2") S PSS52NFD=$G(PSS50DD2("POINTER"))
 D FIELD^DID(50,301,"Z","POINTER","PSS50DD3","PSS50ER3") S PSSG2N=$G(PSS50DD3("POINTER"))
 D FIELD^DID(50.1,1,"Z","POINTER","PSS50DD4","PSS50ER4") S PSS501NX=$G(PSS50DD4("POINTER"))
 N PSSENCT
 S PSSENCT=0
 S PSS(1)=0 F  S PSS(1)=$O(^PSDRUG(PSS(1))) Q:'PSS(1)  D
 .I $P($G(^PSDRUG(PSS(1),0)),"^")="" Q
 .I $G(PSSFL),$P($G(^PSDRUG(PSS(1),"I")),"^"),$P($G(^("I")),"^")'>PSSFL Q
 .I $G(PSSRTOI)=1,'$P($G(^PSDRUG(PSS(1),2)),"^") Q
 .;Naked reference below refers to ^PSDRUG(PSS(1),2)
 .I $G(PSSPK)]"" N PSSZ5,PSSZ6 S PSSZ5=0 F PSSZ6=1:1:$L(PSSPK) Q:PSSZ5  I $P($G(^(2)),"^",3)[$E(PSSPK,PSSZ6) S PSSZ5=1
 .I $G(PSSPK)]"",'PSSZ5 Q
 .D SETSUB1^PSS50AQM(PSS(1)),SETSUB2^PSS50AQM(PSS(1)),SETSUB3^PSS50AQM(PSS(1))
 .D SETALL^PSS50AQM,SETOLD^PSS50AQM,SETSYN^PSS50AQM,SETFMA^PSS50AQM
 .S PSSENCT=PSSENCT+1
 S ^TMP($J,LIST,0)=$S($G(PSSENCT):$G(PSSENCT),1:"-1^NO DATA FOUND")
 Q
