GMRCEDT1 ;SLC/DCM,JFR - EDIT A CONSULT AND RE-SEND AS NEW ;10/22/01 22:22
 ;;3.0;CONSULT/REQUEST TRACKING;**1,5,12,15,22**;DEC 27, 1997
 ;
 ; This routine invokes IA #2638
 ;
EN(GMRCO) ;GMRCO=IEN of consult from file 123
 ;GMRCSS=To Service   GMRCPROC=Procedure Request Type
 ;GMRCURG=Urgency     GMRCPL=Place Of Consultation
 ;GMRCATN=Attention   GMRCINO=Service is In/Out Patient
 ;GMRCPNM=Patient Name  GMRCDIAG=Provisional Diagnosis
 N GMRCSS,GMRCPROC,GMRCURG,GMRCPL,GMRCATN,GMRCINO,GMRCDIAG,LN
 K ^TMP("GMRCR",$J,"ED") S GMRCLNO=1
 I $L($P(^GMR(123,+GMRCO,0),"^",12)) S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)="  CURRENT STATUS: (Not Editable): "_$P(^ORD(100.01,$P(^(0),"^",12),0),"^",1),GMRCLNO=GMRCLNO+1
 S GMRCD=0 F  S GMRCD=$O(^GMR(123,+GMRCO,40,"B",GMRCD)) Q:'GMRCD  S GMRCDD="" F  S GMRCDD=$O(^GMR(123,GMRCO,40,"B",GMRCD,GMRCDD)) Q:'GMRCDD  D
 .I $P(^GMR(123,+GMRCO,40,GMRCDD,0),"^",2)=19 S LN=0 D
 ..N GMRCPERS,GMRCTX
 ..I '$D(^GMR(123,+GMRCO,12)) D
 ...S GMRCPERS=+$P(^GMR(123,+GMRCO,40,GMRCDD,0),"^",5)
 ...S GMRCPERS=$$GET1^DIQ(200,GMRCPERS,.01)
 ..I $D(^GMR(123,+GMRCO,12)) D
 ...S GMRCPERS=$P($G(^GMR(123,+GMRCO,40,GMRCDD,2)),U,2)
 ..S GMRCTX="  CANCELLED BY (Not Editable): "_GMRCPERS
 ..S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)=GMRCTX,GMRCLNO=GMRCLNO+1
 ..S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)="  CANCELLED COMMENT (Not Editable):",GMRCLNO=GMRCLNO+1
 ..S LN=$O(^GMR(123,+GMRCO,40,GMRCDD,1,LN)) Q:LN=""!(LN?1A.E)  I $L(^GMR(123,+GMRCO,40,GMRCDD,1,LN,0))>75 S FLG=1 D WPSET^GMRCUTIL("^GMR(123,+GMRCO,40,GMRCDD,1)","^TMP(""GMRCR"",$J,""ED"")","",.GMRCLNO,"",FLG)
 ..I '$D(FLG) S LN=0 F  S LN=$O(^GMR(123,+GMRCO,40,GMRCDD,1,LN)) Q:LN=""!(LN?1A.E)  S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)=^(LN,0),GMRCLNO=GMRCLNO+1
 ..S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)="",$P(^(0),"-",79)=""
 ..S GMRCLNO=GMRCLNO+1
 ..Q
 .Q
 S GMRCSS=$S($D(GMRCEDT(1)):GMRCEDT(1),1:$P(^GMR(123,+GMRCO,0),"^",5)_U_$P(^GMR(123.5,$P(^GMR(123,+GMRCO,0),"^",5),0),U))
 S GMRCPROC=$S($D(GMRCED(1)):GMRCED(1),1:$P(^GMR(123,+GMRCO,0),"^",8)_U_$$GET1^DIQ(123.3,+$P(^GMR(123,+GMRCO,0),"^",8),.01))
 S GMRCURG=$S($D(GMRCED(3)):GMRCED(3),1:$P(^GMR(123,+GMRCO,0),"^",9)_U_$$GET1^DIQ(101,+$P(^(0),"^",9),1))
 S GMRCPL=$S($D(GMRCED(4)):GMRCED(4),1:$P(^GMR(123,+GMRCO,0),"^",10)_U_$$GET1^DIQ(101,+$P(^(0),U,10),1))
 S GMRCATN=$S($D(GMRCED(5)):GMRCED(5),1:$P(^GMR(123,+GMRCO,0),"^",11)_U_$$GET1^DIQ(200,+$P(^(0),U,11),.01))
 I '$D(^GMR(123,GMRCO,30.1)) D
 . I $D(GMRCED(6)),$L($P(GMRCED(6),U,2)) D  Q
 .. S GMRCDIAG=$P(GMRCED(6),U)_" ("_$P(GMRCED(6),U,2)_")"
 . S GMRCDIAG=$S($D(GMRCED(6)):GMRCED(6),1:$G(^GMR(123,+GMRCO,30)))
 I $D(^GMR(123,GMRCO,30.1)) D
 . I $D(GMRCED(6)),$L(GMRCED(6)) D  Q
 .. S GMRCDIAG=$P(GMRCED(6),U)_" ("_$P(GMRCED(6),U,2)_")"
 . S GMRCDIAG=$G(^GMR(123,+GMRCO,30))
 I $D(GMRCED(2)) S GMRCINO=GMRCED(2)
 I '$D(GMRCINO) S GMRCINO=$P(^GMR(123,+GMRCO,0),U,18)_U_$S($P(^(0),U,18)="I":"Inpatient",1:"Outpatient")
 S GMRCREQ=$S(+$P(^GMR(123,+GMRCO,0),U,17)="P":"Procedure",1:"Consult")
 S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)="SENDING PROVIDER (Not Editable): "_$$GET1^DIQ(200,+$P(^GMR(123,+GMRCO,0),"^",14),.01),GMRCLNO=GMRCLNO+1
 S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)="REQUEST TYPE (Not Editable): "_GMRCREQ,GMRCLNO=GMRCLNO+1
 S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)=$$REPEAT^XLFSTR("-",79),GMRCLNO=GMRCLNO+1
 S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)="  TO SERVICE (Not Editable): "_$P(GMRCSS,U,2) S GMRCLNO=GMRCLNO+1
 S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)=" ",GMRCLNO=GMRCLNO+1
 S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)="1 PROCEDURE: "_$P(GMRCPROC,U,2)
 D:+GMRCPROC RVRS(GMRCLNO,$D(GMRCED(1))) S GMRCLNO=GMRCLNO+1
 S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)="2 Performed as INPT OR OUTPT: "_$P(GMRCINO,U,2) D RVRS(GMRCLNO,$D(GMRCED(2))) S GMRCLNO=GMRCLNO+1
 S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)="3 URGENCY: "_$P(GMRCURG,U,2) D RVRS(GMRCLNO,$D(GMRCED(3))) S GMRCLNO=GMRCLNO+1
 S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)="4 PLACE OF CONSULTATION: "_$P(GMRCPL,U,2) D RVRS(GMRCLNO,$D(GMRCED(4))) S GMRCLNO=GMRCLNO+1
 S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)="5 ATTENTION (CONSULTANT): "_$P(GMRCATN,U,2) D RVRS(GMRCLNO,$D(GMRCED(5))) S GMRCLNO=GMRCLNO+1
 S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)="6 PROVISIONAL DIAGNOSIS: "_GMRCDIAG D RVRS(GMRCLNO,$D(GMRCED(6))) S GMRCLNO=GMRCLNO+1
 S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)="7 REASON FOR REQUEST:" D RVRS(GMRCLNO,$D(^TMP("GMRCED",$J,20))) S GMRCLNO=GMRCLNO+1 D
 . I $D(^TMP("GMRCED",$J,20)) D  Q
 .. N ND S ND=0
 .. F  S ND=$O(^TMP("GMRCED",$J,20,ND)) Q:'ND  D
 ... D KILL^VALM10(GMRCLNO)
 ... S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)=^TMP("GMRCED",$J,20,ND,0)
 ... S GMRCLNO=GMRCLNO+1
 . N ND S ND=0
 . F  S ND=$O(^GMR(123,+GMRCO,20,ND)) Q:ND=""  D
 .. S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)=^GMR(123,+GMRCO,20,ND,0)
 .. S GMRCLNO=GMRCLNO+1
 .Q
 S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)="",GMRCLNO=GMRCLNO+1,^TMP("GMRCR",$J,"ED",GMRCLNO,0)="8 COMMENT(S): (Add Only)" D RVRS(GMRCLNO) S GMRCLNO=GMRCLNO+1
 I $D(^TMP("GMRCED",$J,40)) D
 . D KILL^VALM10(GMRCLNO)
 . S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)="  New Comment:",GMRCLNO=GMRCLNO+1
 . N ND S ND=0 F  S ND=$O(^TMP("GMRCED",$J,40,ND)) Q:'ND  D
 .. S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)=^TMP("GMRCED",$J,40,ND,0)
 .. S GMRCLNO=GMRCLNO+1
 N GMRCEDCT
 S GMRCD=0,GMRCEDCT=0 F  S GMRCD=$O(^GMR(123,+GMRCO,40,"B",GMRCD)) Q:'GMRCD  S GMRCDD="",GMRCDD=$O(^GMR(123,+GMRCO,40,"B",GMRCD,GMRCDD)) Q:'GMRCDD  D
 .I $P(^GMR(123,+GMRCO,40,GMRCDD,0),"^",2)=20 S LN=0,GMRCEDCT=GMRCEDCT+1,GMRCEDCM(GMRCEDCT)=GMRCDD D
 ..S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)="",GMRCLNO=GMRCLNO+1,^TMP("GMRCR",$J,"ED",GMRCLNO,0)="ADDED COMMENT (Not Editable) Entered: "_$P($$FMTE^XLFDT($P(^GMR(123,+GMRCO,40,GMRCDD,0),"^",1)),"@",1)
 ..S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)=^TMP("GMRCR",$J,"ED",GMRCLNO,0)_" BY: "_$S($L($P(^GMR(123,+GMRCO,40,GMRCDD,0),"^",4)):$P(^VA(200,$P(^GMR(123,+GMRCO,40,GMRCDD,0),"^",4),0),"^",1),1:"UNKNOWN"),GMRCLNO=GMRCLNO+1
 ..S LN=$O(^GMR(123,+GMRCO,40,GMRCDD,1,LN)) Q:LN=""!(LN?1A.E)  I $L(^GMR(123,+GMRCO,40,GMRCDD,1,LN,0))>75 S FLG=1 D WPSET^GMRCUTIL("^GMR(123,+GMRCO,40,GMRCDD,1)","^TMP(""GMRCR"",$J,""ED"")","",.GMRCLNO,"",FLG) Q
 ..S LN=0 F  S LN=$O(^GMR(123,+GMRCO,40,GMRCDD,1,LN)) Q:LN=""!(LN?1A.E)  S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)=^(LN,0),GMRCLNO=GMRCLNO+1
 ..Q
 .Q
 S ^TMP("GMRCR",$J,"ED",GMRCLNO,0)=""
 K FLG
 Q
RVRS(LINE,EDITED) ;reverse video for fields that can be edited
 I '$G(EDITED) D CNTRL^VALM10(LINE,1,1,IORVON,IORVOFF) Q
 D CNTRL^VALM10(LINE,1,1,IORVON_IOINHI,IORVOFF_IOINORM)
 Q
