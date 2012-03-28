APSPFNC2 ;IHS/MSC/PLS - Prescription Creation Support ;25-Aug-2010 09:52;SM
 ;;7.0;IHS PHARMACY MODIFICATIONS;**1005,1006,1007,1008,1009**;Sep 23, 2004
 ;=================================================================
 ; Create a verified prescription
MAKEVRX(DATA,RXORD) ;
 F RXORD=0:0 S RXORD=$O(RXORD(RXORD)) Q:'RXORD  D
 .D CREATE(RXORD(RXORD),1)
 Q
 ; Call Pharmacy Package
CREATE(ORIEN,FORCE) ;
 N PSOX,NODE0,ORD,OR0,USER1,SIGOK,PSODRUG,PSONEW,PSOMAX,PSOMSG,PSODFN,PSOCOU
 N PSOCOUU,PSOCS,PSOFDR,PSONOOR,PSOPAR,PSORX,PSOSITE,RXFL,RXORD,SEG1,SPEED
 N TALK,ARY,RET,PRC,PSOINSFL,IEN,INSTIEN,EPHMFLG,RNWORDER
 S FORCE=$G(FORCE,0)
 S IEN=0
 S ORIEN=+$G(ORIEN)
 Q:'ORIEN
 S PSOSITE=$$LOC(ORIEN)
 Q:'PSOSITE
 S INSTIEN=+$$GET1^DIQ(59,PSOSITE,100,"I")
 S ORD=$G(^OR(100,ORIEN,4))  ; Get pending order #
 Q:ORD'["S"  ; Not a pending outpatient med order or already processed
 S ORD=+ORD
 Q:'ORD!('$D(^PS(52.41,ORD,0)))
 S EPHMFLG=$$GET^XPAR("DIV.`"_DUZ(2)_"^SYS","APSP AUTO RX")
 S OR0=^PS(52.41,ORD,0)
 S PSONEW("ELECTRONIC PHARMACY")=$$VALUE^ORCSAVE2(+OR0,"PHARMACY")
 S PSONEW("DAW")=$$VALUE^ORCSAVE2(+OR0,"DAW")
 I 'FORCE Q:((EPHMFLG=1!(EPHMFLG=2))&'PSONEW("ELECTRONIC PHARMACY"))
 S PSODFN=+$P(OR0,U,2)
 S RNWORDER=$P(OR0,U,21)
 ;D AUTO^PSONRXN
 ;S PSONEW("RX #")="X"_PSONEW("RX #")
 ;S PSOX=PSONEW("RX #")
 ;S PSONEW("AUTOFIN")=1
 S (OI,PSODRUG("OI"))=+$P(OR0,U,8),PSODRUG("OIN")=$P(^PS(50.7,$P(OR0,"^",8),0),"^"),OID=$P(OR0,"^",9)
 I $P($G(OR0),"^",9) S POERR=1,DREN=$P(OR0,"^",9) D DRG^PSOORDRG K POERR
 E  D DREN^PSOORNW2
 I '$G(PSODRUG("IEN")) D  Q  ; No drug
 .N DFN,POIN
 .S DFN=+$P(OR0,U,2)
 .S POIN=$$GET1^DIQ(50.7,$P(OR0,U,8),.01)
 .D NOTIF(DUZ,DFN,ORIEN,"Unable to generate "_POIN_" prescription for "_$$GET1^DIQ(2,DFN,.01))
 ;
DRG I $P($G(^PSDRUG(+$G(PSODRUG("IEN")),"CLOZ1")),"^")="PSOCLO1" D CLOZ^PSOORFI2
 S PSODRUG("DEA")=1
 I $G(PSODRUG("DEA"))]"" D
 .S PSOCS=0 K DIR,DIC,PSOX
 .F DEA=1:1 Q:$E(PSODRUG("DEA"),DEA)=""  I $E(+PSODRUG("DEA"),DEA)>1,$E(+PSODRUG("DEA"),DEA)<6 S $P(PSOCS,"^")=1 S:$E(+PSODRUG("DEA"),DEA)=2 $P(PSOCS,"^",2)=1
 .S PSOMAX=$S($G(CLOZPAT)=0:0,$G(CLOZPAT)=1:1,PSOCS&('$G(CLOZPAT)):5,1:11) I '$G(CLOZPAT) I PSODRUG("DEA")["A"&(PSODRUG("DEA")'["B")!(PSODRUG("DEA")["F") S PSOMAX=0
 E  S PSOMAX=$S($G(CLOZPAT)=1:1,1:$P(OR0,"^",11))
 ;
 D DOSE(ORD)
 ;
 D AUTO^PSONRXN
 S PSONEW("RX #")="X"_PSONEW("RX #")
 S PSOX=PSONEW("RX #")
 S PSONEW("AUTOFIN")=1
 ;
 S PSONEW("ISSUE DATE")=$S($P($G(OR0),U,6):$E($P(OR0,U,6),1,7),1:DT)
 S PSONEW("PATIENT STATUS")=$S(+$G(^PS(55,PSODFN,"PS")):+$G(^PS(55,PSODFN,"PS")),1:"")
 S:'PSONEW("PATIENT STATUS") PSONEW("PATIENT STATUS")=$S($$GET^XPAR("DIV.`"_INSTIEN_"^SYS","APSP AUTO RX DEF PT STATUS"):$$GET^XPAR("DIV.`"_INSTIEN_"^SYS","APSP AUTO RX DEF PT STATUS"),1:"")
 ;D USER^PSOORFI2($P(OR0,U,4)) S PSONEW("CLERK CODE")=+$P(OR0,U,4),PSORX("CLERK CODE")=USER1
 S PSONEW("PROVIDER")=+$P(OR0,U,5)
 S PSONEW("QTY")=$P(OR0,U,10)
 S PSONEW("MAIL/WINDOW")=$S($P(OR0,U,17)="M":"M",1:"W")
 D USER^PSOORFI2($P(OR0,U,5))
 S PSONEW("CLERK CODE")=$P(OR0,U,4),PSONEW("PROVIDER")=$P(OR0,U,5),PSONEW("PROVIDER NAME")=USER1
 S PSONEW("CM")=$S($L($$VALUE^ORCSAVE2(+OR0,"CMF")):$$VALUE^ORCSAVE2(+OR0,"CMF"),1:"N")
 S PSONEW("CLININD")=$S($L($$VALUE^ORCSAVE2(+OR0,"CLININD")):$$VALUE^ORCSAVE2(+OR0,"CLININD"),1:"")
 S PSONEW("CLININD2")=$S($L($$VALUE^ORCSAVE2(+OR0,"CLININD2")):$$VALUE^ORCSAVE2(+OR0,"CLININD2"),1:"")
 S PSONEW("DAYS SUPPLY")=$P(OR0,U,22)
 S PSONEW("ELECTRONIC PHARMACY")=$S($$VALUE^ORCSAVE2(+OR0,"PHARMACY"):$$VALUE^ORCSAVE2(+OR0,"PHARMACY"),1:"")
 S PSONEW("# OF REFILLS")=$P(OR0,U,11) ;$S(+$P(OR0,"^",11)>+$P(^PS(53,RXPT,0),"^",4):+$P(^PS(53,RXPT,0),"^",4),1:+$P(OR0,"^",11))
 S PSONEW("CLINIC")=+$P(OR0,"^",13)
 S PSONEW("LOGIN DATE")=+$P(OR0,U,12)
 S (Y,PSONEW("FILL DATE"))=$S($E($P(OR0,"^",6),1,7)<DT:DT,1:DT) X ^DD("DD") S PSORX("FILL DATE")=Y
 S PSONEW("DISPENSE DATE")=DT
 S PSONEW("EXPIRATION DATE")=$$FMADD^XLFDT(DT,$S(+$P(OR0,U,22)>0:+$P(OR0,U,22),1:10))
 S PSONEW("STOP DATE")=PSONEW("EXPIRATION DATE")
 S PSONEW("LAST DISPENSE DATE")=DT
 S PSONEW("POE")=1
 S PSONEW("REMARKS")="AUTOFINISHED PRESCRIPTION"
 S SPEED=1
 S PSONEW("STATUS")=0  ;Set STATUS to Active
 S PSOFDR=1
 S PSOINSFL=$P($G(^PS(52.41,ORD,"INS")),"^",2)  ; Patient Instruction Flag
 D INSCMT
 D INS1
 D SIG
 D GETPRVI
 ;
 D EN^PSON52(.PSONEW)
 S ARY("COM")="Autofinished RX for external fill"
 S ARY("REASON")="B"
 S ARY("RX REF")=0
 D UPTLOG(.RET,+$G(PSONEW("IRXN")),0,.ARY)
 D EN^PSOHLSN1(PSONEW("IRXN"),"SC","CM")
 D EN^PSOHLSN1(PSONEW("IRXN"),"OK","CM")
 D EN^APSPELRX(PSONEW("IRXN"),PSONEW("ELECTRONIC PHARMACY"))
 ;Handle renewed prescription
 D CHKRNW(PSONEW("IRXN"))
 Q
 ;
 ; Find a site
LOC(ORIEN) ; PEP
 N PSOLOC,PSOINS,PSOSITE
 S PSOSITE=$$GET^XPAR("DIV.`"_DUZ(2)_"^SYS","APSP AUTO RX DIV")
 I 'PSOSITE D
 .S PSOLOC=$P(^OR(100,ORIEN,0),U,10),PSOSITE=0
 .I PSOLOC["SC" D
 ..S PSOLOC=+PSOLOC
 ..S PSOINS=$P($G(^SC(PSOLOC,0)),U,4)
 ..Q:'PSOINS
 ..S PSOSITE=$$DIV(PSOINS)
 .S:'PSOSITE PSOSITE=$$DIV(DUZ(2))
 .S:'PSOSITE PSOSITE=$$DIV(+$$SITE^VASITE)
 Q $S($G(PSOSITE):PSOSITE,1:0)
 ; Return Pharmacy Division
DIV(INS) Q $O(^PS(59,"D",+INS,0))
 ;
 ;
INSCMT ; Extract provider comments
 I $O(^PS(52.41,ORD,2,0)) D
 .S PHI=^PS(52.41,ORD,2,0),T=0 D
 ..F  S T=$O(^PS(52.41,ORD,2,T)) Q:'T  S PHI(T)=^PS(52.41,ORD,2,T,0)
 I $O(^PS(52.41,ORD,3,0)) D
 .S PRC=^PS(52.41,ORD,3,0),T=0 D
 ..F  S T=$O(^PS(52.41,ORD,3,T)) Q:'T  S PRC(T)=^PS(52.41,ORD,3,T,0)
 Q
INS1 ;
 N INST,MIG,SG,JUNK,IEN,SINS1
 S IEN=1
 S INST=0 F  S INST=$O(^PS(52.41,ORD,"INS1",INST)) Q:'INST  S (MIG,PSONEW("SIG",INST))=^PS(52.41,ORD,"INS1",INST,0) D
 .F SG=1:1:$L(MIG," ") S IEN=IEN+1,$P(JUNK("PSOPO",$J,IEN,0)," ",20)=" " S JUNK("PSOPO",$J,IEN,0)=$G(JUNK("PSOPO",$J,IEN,0))_" "_$P(MIG," ",SG)
 I $P($G(^PS(55,PSODFN,"LAN")),"^"),$O(^PS(52.41,ORD,"INS1",0)) D
 .I $G(^PS(50.7,PSODRUG("OI"),"INS1"))]"" S (X,PSONEW("SINS"))=^PS(50.7,PSODRUG("OI"),"INS1") D SSIG^PSOHELP
 .I $G(SINS1)]"" S PSONEW("SINS")=$E(SINS1,2,250)
 .S IEN=IEN+1,JUNK("PSOPO",$J,IEN,0)=" Other Pat Instruct: "_$S($G(PSONEW("SINS"))]"":PSONEW("SINS"),1:"")
 Q
 ;
SIG ;
 S SIG=0,PSOFINFL=1 F  S SIG=$O(^PS(52.41,ORD,"SIG",SIG)) Q:'SIG  D
 .S SIG(SIG)=^PS(52.41,ORD,"SIG",SIG,0)
 D EN^PSOFSIG(.PSONEW)
 S:$O(SIG(0)) SIGOK=1
 F D=0:0 S D=$O(^PS(52.41,ORD,"INS1",D)) Q:'D  D
 .S PSONEW("INS",D)=^PS(52.41,ORD,"INS1",D,0)
 Q
 ; Update activity or label log and return success flag
 ; Input: RX - IEN to Prescription File (52)
 ;        TYPE - 0=Activity, 1=Label
 ;        ARY - Holds data for log type
UPTLOG(DATA,RX,TYPE,ARY) ;EP
 N FDA,ERR,FN,IENS,USR
 S IENS="+1,"_RX_","
 S USR=$S($G(ARY("USER")):ARY("USER"),1:DUZ)
 S DATA=0
 I '$G(TYPE) D  ;Activity Log
 .S FN=52.3
 .S FDA(FN,IENS,.01)=$$NOW^XLFDT()
 .S FDA(FN,IENS,.02)=$G(ARY("REASON"))
 .S FDA(FN,IENS,.03)=USR
 .S FDA(FN,IENS,.04)=$G(ARY("RX REF"))
 .S FDA(FN,IENS,.05)=$G(ARY("COM"))
 E  I $G(TYPE)=1 D  ;Print Label Log
 .S FN=52.032
 .S FDA(FN,IENS,.01)=$$NOW^XLFDT()
 .S FDA(FN,IENS,1)=$G(ARY("RX REF"))
 .S FDA(FN,IENS,2)=$G(ARY("COM"))
 .S FDA(FN,IENS,3)=USR
 .S FDA(FN,IENS,5)=$G(ARY("DEV"))
 D UPDATE^DIE(,"FDA",,"ERR")
 I '$D(ERR) S DATA=1
 E  S DATA="0^Unable to update log"
 Q
 ;
GETPRVI ; EP-Get provider instructions
 Q:'$O(PRC(0))!'$$GET^XPAR("DIV.`"_INSTIEN_"^SYS","APSP AUTO RX ADD PRV COMMENT")
 N NI,NC
 S PSOPRC=1,NI=0 F I=0:0 S I=$O(PSONEW("SIG",I)) Q:'I  S NI=I
 D EXPPRC^PSOORFI4(.PRC)
 S NC=0 F I=0:0 S I=$O(PRC(I)) Q:'I  S NC=NC+1
 I NI'>1,NC=1,($L($G(PSONEW("SIG",NI)))+$L(PRC(1)))'>250 D
 .S PSONEW("SIG",1)=$G(PSONEW("SIG",NI))_" "_PRC(1)
 .S:$E(PSONEW("SIG",1))=" " PSONEW("SIG",1)=$E(PSONEW("SIG",1),2,250) S PSONEW("INS")=PSONEW("SIG",1)
 E  D
 .F I=0:0 S I=$O(PRC(I)) Q:'I  S NI=NI+1,(PSONEW("SIG",NI),PSONEW("INS",NI))=PRC(I)
 .I $E(PSONEW("SIG",1))=" " S PSONEW("SIG",1)=$E(PSONEW("SIG",1),2,250)
 D EN^PSOFSIG(.PSONEW)
 Q
 ;
ADDPCSIG ;EP - Add provider comments to SIG
 N LP,LP1,SCNT
 S SCNT=$O(SIG($C(1)),-1)
 S LP=0 F  S LP=$O(PSONEW("SIG",LP)) Q:'LP  D
 .S SCNT=SCNT+1 S SIG(SCNT)=$G(PSONEW("SIG",LP))
 .S SIG(SCNT)=$$UP^XLFSTR(SIG(SCNT))
 Q
DOSE(ORD) ;pending orders
 N DOSE,DOSE1,I,UNITS,ROUTE,DOENT
 S DOENT=0
 F I=0:0 S I=$O(^PS(52.41,ORD,1,I)) Q:'I  S DOSE=$G(^PS(52.41,ORD,1,I,1)),DOSE1=$G(^(2)) D
 .S PSONEW("DOSE",I)=$P(DOSE1,"^"),PSONEW("DOSE ORDERED",I)=$P(DOSE1,"^",2),PSONEW("UNITS",I)=$P(DOSE,"^",9),PSONEW("NOUN",I)=$P(DOSE,"^",5)
 .S:$P(DOSE,"^",9) UNITS=$P(^PS(50.607,$P(DOSE,"^",9),0),"^")
 .S PSONEW("VERB",I)=$P(DOSE,"^",10),PSONEW("ROUTE",I)=$P(DOSE,"^",8)
 .S:$P(DOSE,"^",8) ROUTE=$P(^PS(51.2,$P(DOSE,"^",8),0),"^")
 .S PSONEW("SCHEDULE",I)=$P(DOSE,"^"),PSONEW("DURATION",I)=$P(DOSE,"^",2)
 .S DOENT=$G(DOENT)+1 S PSONEW("CONJUNCTION",I)=$S($P(DOSE,"^",6)="A":"AND",$P(DOSE,"^",6)="S":"THEN",$P(DOSE,"^",6)="X":"EXCEPT",1:"")
 S PSONEW("ENT")=DOENT
 Q
 ; This screen is used by the APSP AUTO RX DIV parameter.
 ; Input: DIV - Pointer to Institution (4) file
DIVSCN(ENT) ;
 I $G(ENT)["DIC(4," Q ''$$DIV(+ENT)
 I $G(ENT)["DIC(4.2," Q 1
 Q 0
 ;Return list of pharmacies from APSP PHARMACY LIST
PHMLST(DATA,ZIP,RAD) ;EP
 N IEN,CNT,ZARY,ZC
 S DATA=$NA(^TMP("APSPOPHM",$J))
 K @DATA
 Q:'$G(ZIP)
 D GETZC(.ZARY,ZIP,RAD)
 S ZC="",CNT=0 F  S ZC=$O(ZARY(ZC)) Q:'$L(ZC)  D
 .S IEN=0 F  S IEN=$O(^APSPOPHM("ZIP",ZC,IEN)) Q:'IEN  D ADDPHM(IEN,ZARY(ZC))
 Q
 ;Return list of pharmacies from IEN list
PHMLST2(DATA,IEN) ;EP
 N CNT
 S DATA=$NA(^TMP("APSPOPHM",$J))
 K @DATA
 S:$G(IEN) IEN(-1)=IEN
 S IEN="",CNT=0
 F  S IEN=$O(IEN(IEN)) Q:IEN=""  D ADDPHM(IEN(IEN))
 Q
ADDPHM(IEN,DIST) ;
 N N0,N1,N2,N7
 S N0=$G(^APSPOPHM(IEN,0)),N1=$G(^(1)),N2=$G(^(2)),N7=$G(^(7))
 Q:'$L(N0)
 I N7,DT<N7 Q
 I $P(N7,U,2),DT>$P(N7,U,2) Q
 S CNT=CNT+1,DIST=$G(DIST)
 ; IEN^StoreName^Address1 Address2^City^State^Zip^PPhone^PFax^Distance
 S @DATA@(+DIST,CNT)=IEN_U_$P(N0,U,10)_U_$P(N1,U)_" "_$P(N1,U,2)_U_$P(N1,U,3)_U_$P(N1,U,4)_U_$P(N1,U,5)_U_$P(N2,U)_U_$P(N2,U,2)_U_DIST
 Q
 ; Return array of zipcodes for given zipcode
 ; Input: ARY - return array - pass by reference
 ;         ZIP - 5 DIGIT ZIP CODE
 ;           R - radius
 ; Output: ARY(ZC)=radius
 ;
GETZC(ARY,ZIP,R) ;EP
 N ZIEN,ZC,D,RAD
 K ARY
 S ZIEN=$O(^APSPZCPX("B",ZIP,0)) Q:'ZIEN  D
 .S RAD="" F  S RAD=$O(^APSPZCPX(ZIEN,1,"B",RAD)) Q:RAD=""!(RAD>R)  D
 ..S ZC=0 F  S ZC=$O(^APSPZCPX(ZIEN,1,"B",RAD,ZC)) Q:'ZC  D
 ...S ARY($P(^APSPZCPX(ZC,0),U))=RAD
 Q
 ; Returns ability of user to e-prescribe
 ; Input: USR - IEN to New Person File
 ; Output:   0 = e-Prescribing is not available to user
 ;           1 = e-Prescribing is available to user
ERXUSER(DATA,USR) ; EP
 S DATA=1
 I $G(USR) D
 .S DATA=''$L($$SPI^APSPES1(USR))
 .S:'DATA DATA=+$$GET^XPAR($$ENT^CIAVMRPC("APSP AUTO RX ELECTRONIC",.ENT,USR),"APSP AUTO RX ELECTRONIC")
 Q
 ; Returns availablity of Orderable Item to be e-prescribed
 ; Input: OIIEN - Orderable Item IEN
ERXOI(DATA,OIIEN) ; EP
 N PSOI
 S DATA=1
 I $G(OIIEN) D
 .S PSOI=+$P($G(^ORD(101.43,+OIIEN,0)),U,2)  ; Pharmacy Orderable Item IEN
 .S DIEN=0 F  S DIEN=$O(^PSDRUG("ASP",PSOI,DIEN)) Q:'DIEN  D  Q:'DATA
 ..S DATA='$$ISSCH(DIEN,"2345")
 Q
 ; Returns result of DEA Special Handling Comparison
 ; Input : ORD = Order ID
 ;         CLS = Drug class
DEACLS(DATA,ORD,CLS) ; EP -
 N PSOI,OIIEN
 S OIIEN=$$VALUE^ORCSAVE2(+ORD,"ORDERABLE")
 S DATA=0
 I $G(OIIEN) D
 .S PSOI=+$P($G(^ORD(101.43,+OIIEN,0)),U,2)  ; Pharmacy Orderable Item IEN
 .S DIEN=0 F  S DIEN=$O(^PSDRUG("ASP",PSOI,DIEN)) Q:'DIEN  D  Q:DATA
 ..S DATA=$$ISSCH(DIEN,CLS)
 Q
 ; Check for schedule drugs
ISSCH(DRUG,SCH) ;PEP - Returns boolean value
 N DS,RES
 S RES=0
 S DS=+$P(^PSDRUG(DRUG,0),U,3)
 S RES=SCH[DS
 Q RES
 ; Notify user of autofinish failure
 ; Input:  USR - User IEN
 ;         DFN - Patient IEN
 ;         ORIEN - Order IEN
 ;         MSG - Message text
NOTIF(USR,DFN,ORIEN,MSG) ;EP -
 N XQA,XQAID,XQADATA,XQAMSG
 S XQA(USR)=""
 S XQAMSG="e-Prescribe Failure:"_$G(MSG)
 S XQAID="OR"_","_DFN_","_50
 S:$G(ORIEN) XQADATA=ORIEN_"@"
 D SETUP^XQALERT
 Q
 ; Check for renewed prescription
 ; Input: RXIEN- IEN to File 52
CHKRNW(RXIEN) ;
 ;Check Placer ID of RXIEN
 ; Check Replaced Order # field value
 ;   Check Status of Replaced Order order
 ;     If RENEWED then set:
 ;       - Activity Log - RENEWED
 Q:'$G(RXIEN)
 N PLACER,ORGIEN,RENEWED,ORGPKGID,ORXNUM  ;,PSORENW,PSONEW
 N REA,DA,MSG,PSCAN
 S PLACER=$$GET1^DIQ(52,RXIEN,39.3)
 Q:'PLACER
 S ORGIEN=$$GET1^DIQ(100,PLACER,9,"I")
 Q:'ORGIEN  ;No renewed order
 S RENEWED=$$GET1^DIQ(100,ORGIEN,5,"I")=15
 Q:'RENEWED
 S ORGPKGID=+$$GET1^DIQ(100,ORGIEN,33,"I")
 Q:'ORGPKGID
 S ORXNUM=$$GET1^DIQ(52,ORGPKGID,.01)
 S REA="C",DA=ORGPKGID
 S MSG="Renewed from CPRS"
 S PSCAN(ORXNUM)=DA_"^C"
 D CAN^PSOCAN
 D:RNWORDER
 .D SETDATA(RNWORDER,52,"39.5///"_"`"_RXIEN)
 .D SETDATA(RXIEN,52,"39.4///"_"`"_RNWORDER)
 Q
 ;
SETDATA(DA,DIE,DR) ;
 D ^DIE
 Q
