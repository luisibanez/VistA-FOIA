ORWPCE2 ; ISL/JM - wrap calls to PCE ;9/25/2001
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**10,85,109,116,173,195**;Dec 17, 1997
GETSET(ORWLST,ORWFILE,ORWFIELD,ORWNULL) ;gets set of codes 
 ; ORWLST(n)=code^text for code
 N ORWPCE,ORWPCEL,ORWPCEC,ORWPCELO,ORWPCEHI,ORWPCECD,ORWPCET
 S ORWPCELO="abcdefghijklmnopqrstuvwxyz"
 S ORWPCEHI="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
 D FIELD^DID(ORWFILE,ORWFIELD,"","POINTER","ORWPCE","ORWPCE")
 S ORWPCEL=$L(ORWPCE("POINTER"),";")-1
 F ORWPCEC=1:1:ORWPCEL D
 . S ORWPCECD=$P($P(ORWPCE("POINTER"),";",ORWPCEC),":",1)
 . S ORWPCET=$P($P(ORWPCE("POINTER"),";",ORWPCEC),":",2)
 . S ORWLST(ORWPCEC)=ORWPCECD_"^"_$E(ORWPCET)_$TR($E(ORWPCET,2,99),ORWPCEHI,ORWPCELO)
 S:$G(ORWNULL) ORWLST(0)="@^(None selected)"
 Q
 ;
IMMTYPE(ORWLST) ;get the list of active immunizations
 N IEN,CNT,BINDEX S (IEN,CNT,BINDEX)=0
 F  S BINDEX=$O(^AUTTIMM("B",BINDEX)) Q:BINDEX']""  F  S IEN=$O(^(BINDEX,IEN)) Q:'+IEN  I $D(^AUTTIMM(IEN,0))#2,+$P(^(0),"^",7)=0 S CNT=CNT+1,ORWLST(CNT)=IEN_"^"_$P(^(0),"^")
 Q
 ;
SKTYPE(ORWLST) ;get the list of active skin test
 N IEN,CNT,BINDEX S (IEN,CNT,BINDEX)=0
 F  S BINDEX=$O(^AUTTSK("B",BINDEX)) Q:BINDEX']""  F  S IEN=$O(^(BINDEX,IEN)) Q:'+IEN  I $D(^AUTTSK(IEN,0))#2,+$P(^(0),"^",3)=0 S CNT=CNT+1,ORWLST(CNT)=IEN_"^"_$P(^(0),"^")
 Q
 ;
EDTTYPE(ORWLST) ;get the list of active education topics
 N IEN,CNT,BINDEX S (IEN,CNT,BINDEX)=0
 F  S BINDEX=$O(^AUTTEDT("B",BINDEX)) Q:BINDEX']""  F  S IEN=$O(^(BINDEX,IEN)) Q:'+IEN  I $D(^AUTTEDT(IEN,0))#2,+$P(^(0),"^",3)=0 S CNT=CNT+1,ORWLST(CNT)=IEN_"^"_$P(^(0),"^")
 Q
 ;
HFTYPE(ORWLST,ADDCATS) ;get the list of active  health factors
 N IEN,CNT,BINDEX,REC
 S (IEN,CNT,BINDEX)=0,ADDCATS=+$G(ADDCATS)
 F  S BINDEX=$O(^AUTTHF("B",BINDEX)) Q:BINDEX']""  D
 .F  S IEN=$O(^AUTTHF("B",BINDEX,IEN)) Q:'+IEN  D
 ..S REC=$G(^AUTTHF(IEN,0))
 ..I +$P(REC,U,11) S REC=""
 ..I 'ADDCATS,$P(REC,U,10)="C" S REC=""
 ..I REC'="" D
 ...S CNT=CNT+1,ORWLST(CNT)=IEN_U_$P(REC,U)
 ...I ADDCATS S ORWLST(CNT)=ORWLST(CNT)_U_$P(REC,U,10)_U_$P(REC,U,3)
 Q
 ;
EXAMTYPE(ORWLST) ;get the list of active exams
 N IEN,CNT,BINDEX S (IEN,CNT,BINDEX)=0
 F  S BINDEX=$O(^AUTTEXAM("B",BINDEX)) Q:BINDEX']""  F  S IEN=$O(^(BINDEX,IEN)) Q:'+IEN  I $D(^AUTTEXAM(IEN,0))#2,+$P(^(0),"^",4)=0 S CNT=CNT+1,ORWLST(CNT)=IEN_"^"_$P(^(0),"^")
 Q
 ;
TRTTYPE(ORWLST) ;get the list of active treatments
 N IEN,CNT,BINDEX S (IEN,CNT,BINDEX)=0
 F  S BINDEX=$O(^AUTTTRT("B",BINDEX)) Q:BINDEX']""  F  S IEN=$O(^(BINDEX,IEN)) Q:'+IEN  I $D(^AUTTTRT(IEN,0))#2,+$P(^(0),"^",4)=0 S CNT=CNT+1,ORWLST(CNT)=IEN_"^"_$P(^(0),"^")
 Q
 ;
ACTIVPRV(ORRETURN,ORWPROV,ORWDT) ;get if provider is active or not
 S ORRETURN=$$ACTIVPRV^PXAPI(ORWPROV,ORWDT)
 Q
GETVISIT(VISIT,IEN,DFN,VSITSTR) ;Get the visit IEN
 I +$G(IEN)<1 D  I 1
 .S VISIT=$$GETENC^PXAPI(DFN,$P(VSITSTR,";",2),$P(VSITSTR,";"))
 E  S VISIT=$P(^TIU(8925,IEN,0),U,3)
 Q
GAFOK(ORY) ; Returns true if all supporting MH GAF Code exists
 S ORY=0
 I $T(GAFHX^YSGAFAPI)'="",$T(ENT^YSGAFAP1)'="" S ORY=1
 Q
MHCLINIC(ORY,ORIEN)     ; See if this is a mental health clinic
 I $T(MHCLIN^SDUTL2)="" S ORY=1
 E  S ORY=$$MHCLIN^SDUTL2(ORIEN)
 Q
LOADGAF(ORY,ORINPUT) ; Retrieve GAF scores
 D GAFHX^YSGAFAPI(.ORY,.ORINPUT)
 Q
SAVEGAF(ORY,ORINPUT) ; Save new GAF score
 N ORDATA
 D ENT^YSGAFAP1(.ORDATA,.ORINPUT)
 S ORY=($G(ORDATA(1))="[DATA]")
 Q
FORCE(ORY,USER,LOC) ; Retrieve FORCE GUI PCE Entry for a given User/Location
 N SRV,ORTMP,ORERR
 S USER=$G(USER,DUZ)
 S SRV=$P($G(^VA(200,USER,5)),U)
 D GETLST^XPAR(.ORTMP,"USR^LOC.`"_$G(LOC)_"^SRV.`"_+$G(SRV)_"^DIV^SYS^PKG","ORWPCE FORCE PCE ENTRY","Q",.ORERR)
 S ORY=+$P($G(ORTMP(1)),U,2)
 Q
HASCPT(ORY,ORLIST)        ; Returns true if there are any mapped CPT Codes
 N IEN,IDX,FOUND
 S IDX=0
 F  S IDX=$O(ORLIST(IDX)) Q:'+IDX  D
 . S FOUND=0
 . S IEN=$$FIND1^DIC(811.1,"","QX",ORLIST(IDX))
 . I +IEN S FOUND=+$$GET1^DIQ(811.1,IEN,.05,"I")
 . S ORY(IDX)=ORLIST(IDX)_"="_FOUND
 Q
ASKPCE(ORY,USER,LOC) ; Returns ORWPCE ASK ENCOUNTER UPDATE parameter value
 N SRV,ORTMP,ORERR
 S USER=$G(USER,DUZ)
 S SRV=$P($G(^VA(200,USER,5)),U)
 D GETLST^XPAR(.ORTMP,"USR^LOC.`"_$G(LOC)_"^SRV.`"_+$G(SRV)_"^DIV^SYS^PKG","ORWPCE ASK ENCOUNTER UPDATE","Q",.ORERR)
 S ORY=+$P($G(ORTMP(1)),U,2)
 Q
GAFURL(URL) ;Returns the MH GAF Web Page URL
 S URL=""
 I $T(GAFURL^YTAPI5)'="" D
 .N ORY
 .D GAFURL^YTAPI5(.ORY)
 .I $G(ORY(1))="[DATA]" S URL=$G(ORY(2))
 Q
MHTESTOK(ORY) ; Returns True if all supporting MH Test APIs exist
 D GAFOK(.ORY)
 I +ORY,+$G(DUZ),$T(SAVEIT^YTAPI1)'="",$T(PREVIEW^YTAPI4)'="",$T(SHOWALL^YTAPI3)'="",$T(LISTONE^YTAPI)'="",$T(MHS^PXRMRPCC)'="",$T(MHR^PXRMRPCC)'="",$T(MH^PXRMRPCC)'="" D
 . N SRV
 . S SRV=$P($G(^VA(200,DUZ,5)),U)
 . S ORY=$$GET^XPAR(DUZ_";VA(200,^SRV.`"_+$G(SRV)_"^DIV^SYS","PXRM MENTAL HEALTH ACTIVE",1,"Q")
 . I +ORY S ORY=1
 Q
MHATHRZD(ORY,TEST,USER) ;Indicates that user can score test
 N ORYS,ORANS
 I $T(PRIVL^YTAPI5)="" S ORY=1 Q
 S ORY=0
 S ORYS("CODE")=TEST
 S ORYS("STAFF")=USER
 D PRIVL^YTAPI5(.ORANS,.ORYS)
 I $G(ORANS(1))="[DATA]" S ORY=+$P($G(ORANS(2)),U,1)
 Q
ANYTIME(ORY) ;Returns status of the ORWPCE ANYTIME ENCOUNTERS parameter
 N SRV
 S SRV=$P($G(^VA(200,DUZ,5)),U)
 S ORY=$$GET^XPAR(DUZ_";VA(200,^SRV.`"_+$G(SRV)_"^DIV^SYS","ORWPCE ANYTIME ENCOUNTERS",1,"Q")
 I +ORY S ORY=1
 Q
AUTOVSIT(ORY,LOC) ; Returns TRUE if automatic selection of Visit Type
 N SRV
 S SRV=$P($G(^VA(200,DUZ,5)),U)
 S ORY=$$GET^XPAR(DUZ_";VA(200,^LOC.`"_$G(LOC)_"^SRV.`"_+$G(SRV)_"^DIV^SYS","ORWPCE DISABLE AUTO VISIT TYPE",1,"Q")
 I +ORY S ORY=1
 S ORY='ORY
 Q
DOCHKOUT(ORY,LOC) ; Returns TRUE if automatic selection of Visit Type
 N SRV
 S SRV=$P($G(^VA(200,DUZ,5)),U)
 S ORY=$$GET^XPAR(DUZ_";VA(200,^LOC.`"_$G(LOC)_"^SRV.`"_+$G(SRV)_"^DIV^SYS","ORWPCE DISABLE AUTO CHECKOUT",1,"Q")
 I +ORY S ORY=1
 S ORY='ORY
 Q
CHKOUT(LOC) ; Returns TRUE if automatic selection of Visit Type
 N ORY
 D DOCHKOUT(.ORY,LOC)
 Q ORY
EXCLUDED(ORY,LOC,TYPE) ; Returns list of excluded PCE data elements
 N SRV,PARAM
 S PARAM=$S(TYPE=1:"IMMUNIZATIONS",TYPE=2:"SKIN TESTS",TYPE=3:"PATIENT ED",TYPE=4:"HEALTH FACTORS",TYPE=5:"EXAMS",1:"")
 Q:PARAM=""
 S SRV=$P($G(^VA(200,DUZ,5)),U)
 S PARAM="ORWPCE EXCLUDE "_PARAM
 D GETLST^XPAR(.ORY,"USR^LOC.`"_$G(LOC)_"^SRV.`"_+$G(SRV)_"^DIV^SYS^PKG",PARAM,"Q",.ORERR)
 Q
ISCLINIC(ORY,ORLOC) ; Returns TRUE if location is a clinic
 N ORTYP
 S ORY=0
 S ORTYP=$$GET1^DIQ(44,+ORLOC,2,"I")
 I (ORTYP="C")!(ORTYP="M") S ORY=1
 Q
HNCOK(ORY) ; Returns true if Head and/or Neck Cancer is enabled
 S ORY=0
 I $$PATCH^XPDUTL("DG*5.3*397"),$$PATCH^XPDUTL("SD*5.3*244"),$$PATCH^XPDUTL("PX*1.0*111"),$$PATCH^XPDUTL("IVM*2.0*46") S ORY=1
 Q
 ;
CODACTIV(ORY,ORCODE,ORAPP,ORDATE)       ; Is code active on the given date?
 ; Remote procedure:  ORWPCE ACTIVE CODE
 ; ORCODE = ICD or CPT code to be checked
 ; ORAPP  = "ICD" or "CHP"
 ; ORDATE = Date to be checked (defaults to current date)
 S:'+$G(ORDATE) ORDATE=DT
 S ORY=1
 I ORAPP="ICD" D
 . S ORY=+$$STATCHK^ICDAPIU(ORCODE,ORDATE)
 E  I ORAPP="CHP" D
 . S ORY=+$$STATCHK^ICPTAPIU(ORCODE,ORDATE)
 Q
ICDACTIV(ORCODE,ORDATE) ; Check for active ICD code
 D CODACTIV(.ORY,ORCODE,"ICD",$G(ORDATE))
 Q +ORY
CPTACTIV(ORCODE,ORDATE) ; Check for active CPT code
 D CODACTIV(.ORY,ORCODE,"CHP",$G(ORDATE))
 Q +ORY
CXNOSHOW(ORY,ORDOCIEN) ; Should workload requirement be skipped for this note's visit?
 ; RETURN VALUE:  0=SKIP ALL GUI WORKLOAD REQUIREMENTS
 ;                1=CONTINUE WITH OTHER GUI WORKLOAD LOGIC
 N ORTIU
 D DOCPARM^TIUSRVP1(.ORTIU,ORDOCIEN)          ; DBIA #4331
 S ORY=+$$CHKWKL^TIUPXAP2(ORDOCIEN,ORTIU(0))  ; DBIA #4332
 Q
