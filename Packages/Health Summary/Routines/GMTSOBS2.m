GMTSOBS2 ; SLC/KER - HS Object - Show                     ; 01/06/2003
 ;;2.7;Health Summary;**58**;Oct 20, 1995
 ;
 ; External References
 ;     DBIA  2056  $$GET1^DIQ  (file 142.5)
 ;     DBIA  2052  $$GET1^DID  (DD 142.5)
 ;     DBIA 10103  $$NOW^XLFDT
 ;     DBIA 10103  $$FMADD^XLFDT
 Q
GET(X,GMTSARY) ; Get Fields
 ;
 ; Input   X        IEN of HS Object File 142.5
 ; Output  GMTSARY  Array of Fields and Values
 ;                  (passed by reference)
 K GMTSARY N GMTSN,GMTSIEN S GMTSIEN=+($G(X)),GMTSN=$G(^GMT(142.5,+GMTSIEN,0)) Q:'$L(GMTSN)
 N GMTSI,GMTSF,GMTSFLD,GMTSFLDN,GMTSFLDM,GMTSDI,GMTSDE
 F GMTSI=1:1 D  Q:$L(GMTSN,"^")=GMTSI
 . S GMTSFLD=GMTSI S:GMTSFLD<10 GMTSFLD="0"_GMTSFLD S GMTSFLD=+("."_GMTSFLD)
 . S GMTSFLDN=$$GET1^DID(142.5,+GMTSFLD,"","LABEL"),GMTSFLDM=$$EN2^GMTSUMX(GMTSFLDN)
 . S GMTSDI=$$GET1^DIQ(142.5,(+GMTSIEN_","),GMTSFLD,"I"),GMTSDE=$$GET1^DIQ(142.5,(+GMTSIEN_","),GMTSFLD,"E")
 . S GMTSARY(+GMTSIEN,+GMTSFLD,"I")=GMTSDI,GMTSARY(+GMTSIEN,+GMTSFLD,"E")=GMTSDE
 . S GMTSARY(+GMTSIEN,+GMTSFLD,"NAME")=GMTSFLDN
 . S:GMTSFLDM="Health Summary type" GMTSFLDM="Health Summary Type"
 . S GMTSARY(+GMTSIEN,+GMTSFLD,"PROMPT")=GMTSFLDM
 S GMTSARY(+GMTSIEN,1,"NAME")="OBJECT DESCRIPTION"
 S GMTSARY(+GMTSIEN,1,"PROMPT")="Object Description"
 S GMTSI=0 F  S GMTSI=$O(^GMT(142.5,+GMTSIEN,1,GMTSI)) Q:+GMTSI=0  D
 . S GMTSARY(+GMTSIEN,1,"I",GMTSI,0)=$G(^GMT(142.5,GMTSIEN,1,GMTSI,0))
 D DEF^GMTSOBS(+GMTSIEN,.GMTSARY)
 Q
DIS(DFN,OBJ) ; Display Object
 Q:+($G(DFN))'>0  Q:+($G(OBJ))'>0
 K GMTSOBJ N DIE,DR,GMTSR,GMTSLBL,GMTSTYP,GMTSPER,GMTSHDR,GMTSRDT
 N GMTSCON,GMTSRHD,GMTSIOM,GMTSCHD,GMTSLIM,GMTSBLK,GMTSQ,GMTSDEC
 N GMTSDT,GMTSI,GMTSPX1,GMTSPX2,GMTSNOD,GMTSLBB,GMTSUNT,GMTSLEN
 N GMTSDIF,GMTSOBJ,GMTSOBJE,GMTSULB S GMTSOBJ=+($G(OBJ))
 S GMTSR=$G(^GMT(142.5,+GMTSOBJ,0))
 S GMTSLBL=$P(GMTSR,U,2) S:$L(GMTSLBL) GMTSOBJ("LABEL")=GMTSLBL
 S GMTSTYP=$P(GMTSR,U,3) Q:+GMTSTYP'>0  S GMTSPER=$P(GMTSR,U,4)
 S GMTSPX1="",GMTSPX2="",GMTSLEN=+GMTSPER,GMTSUNT=$E(GMTSPER,$L(GMTSPER))
 I +GMTSLEN>0,GMTSUNT?1U,"DWMY"[GMTSUNT D
 . S GMTSPX1=$$NOW^XLFDT
 . S:GMTSUNT="D" GMTSDIF=GMTSLEN S:GMTSUNT="W" GMTSDIF=GMTSLEN*7
 . S:GMTSUNT="M" GMTSDIF=GMTSLEN*30.4 S:GMTSUNT="Y" GMTSDIF=GMTSLEN*365.25
 . S GMTSDIF=$P(GMTSDIF,".",1),GMTSPX2=$$FMADD^XLFDT(GMTSPX1,-(GMTSDIF))
 S GMTSNOD=$P(GMTSR,U,5) S:+GMTSNOD>0 GMTSOBJ("SUPPRESS COMPONENTS")=""
 S GMTSHDR=$P(GMTSR,U,6) S:+GMTSHDR>0 GMTSOBJ=""
 S GMTSULB=$P(GMTSR,U,7) S:+GMTSULB>0 GMTSOBJ("USE LABEL")=""
 S GMTSLBB=$P(GMTSR,U,8) S:+GMTSLBB>0 GMTSOBJ("LABEL BLANK LINE")=""
 S GMTSRDT=$P(GMTSR,U,9) S:+GMTSRDT>0 GMTSOBJ("DATE LINE")=""
 S GMTSCON=$P(GMTSR,U,10) S:+GMTSCON>0 GMTSOBJ("CONFIDENTIAL")=""
 S GMTSRHD=$P(GMTSR,U,11) S:+GMTSRHD>0 GMTSOBJ("REPORT HEADER")=""
 S GMTSCHD=$P(GMTSR,U,12) S:+GMTSCHD>0 GMTSOBJ("COMPONENT HEADER")=""
 S GMTSUND=$P(GMTSR,U,13) S:+GMTSUND>0 GMTSOBJ("UNDERLINE")=""
 S GMTSLIM=$P(GMTSR,U,14) S:+GMTSLIM>0 GMTSOBJ("LIMITS")=""
 S GMTSBLK=$P(GMTSR,U,15) S:+GMTSBLK>0 GMTSOBJ("BLANK LINE")=""
 S GMTSDEC=$P(GMTSR,U,16) S:+GMTSDEC>0 GMTSOBJ("DECEASED")=""
 K:GMTSCHD'>0 GMTSOBJ("LIMITS"),GMTSOBJ("BLANK LINE")
 K:+($G(GMTSHDR))'>0 GMTSOBJ  S GMTSIOM=$G(IOM),IOM=80,GMTSOBJE=""
 D ENX^GMTSDVR(DFN,GMTSTYP,GMTSPX2,GMTSPX1) S:+GMTSIOM>0 IOM=+GMTSIOM
 Q
SP ; Suppress Headers
 N GMTSL,GMTST,TXT S (GMTST,GMTSL)="" S:$L($G(GMTSLBL)) GMTSL=GMTSLBL
 S:+($G(GMTSRDT))'>0 GMTSL=GMTSL_$J("",((72-$L(GMTSDTM))-$L(GMTSL)))_GMTSDTM
 I $L(GMTSL)&(+($G(GMTSPLB))>0) D E("") S TXT="",TXT=$J(" ",7)_GMTSL D E(TXT)
 I $L($G(GMTSLBL))&(+($G(GMTSPLB))>0)&(+($G(GMTSLBB))>0) D E("")
 S GMTSL="" S:+($G(GMTSRDT))>0 GMTSL=$J("",(72-$L(GMTSDTM)))_GMTSDTM
 S TXT="",TXT=TXT_$J(" ",7)_GMTSL D:$L(GMTSL) E(TXT)
 S GMTSL="" S:GMTSCON>0 GMTSL="********************  CONFIDENTIAL HEALTH SUMMARY **********************"
 S TXT="",TXT=TXT_$J(" ",7)_GMTSL D:$L(GMTSL) E(TXT)
 S GMTSL="" S:GMTSRHD>0 GMTSL="PATIENT NAME      SSN-SSN-SSAN       WARD/LOCATTION        DATE OF BIRTH"
 S TXT="",TXT=TXT_$J(" ",7)_GMTSL D:$L(GMTSL) E(TXT)
 S GMTSL="" S:GMTSRHD>0 GMTSL=" "
 S TXT="",TXT=TXT_$J(" ",7)_GMTSL D:$L(GMTSL) E(TXT)
 S (GMTSL,GMTST)="" S:GMTSCHD'>0 GMTSL=GMTSDCN S:GMTSCHD>0 (GMTST,GMTSL)=GMTSDCH
 S:GMTSCHD>0&(GMTSLIM)>0&($L(GMTSTIM)) (GMTST,GMTSL)=GMTSDCH_" (max 10 occurrences or "_GMTSTIM_")"
 S TXT="",TXT=TXT_$J(" ",7)_GMTSL D:$L(GMTSL) E(TXT)
 S GMTSL="" S:+($G(GMTSUND))>0&($L(GMTST)) $P(GMTSL,"-",$L(GMTST))="-"
 S TXT="",TXT=TXT_$J(" ",7)_GMTSL D:$L(GMTSL) E(TXT)
 S GMTSL="" S:GMTSDEC>0 GMTSL="                       **  DECEASED "_GMTSDED_"  **"
 S TXT="",TXT=TXT_$J(" ",7)_GMTSL D:$L(GMTSL) E(TXT)
 S GMTSL="" S:GMTSBLK>0 GMTSL=" " S TXT="",TXT=TXT_$J(" ",7)_GMTSL D:$L(GMTSL) E(TXT)
 S GMTSL="<component data>" S TXT="",TXT=TXT_$J(" ",7)_GMTSL D:$L(GMTSL) E(TXT)
 W:'$D(GMTSEXT) !
 Q
HS ; Health Summary Headers
 N GMTSL,GMTST,TXT S GMTSL="" S:$L($G(GMTSLBL)) GMTSL=GMTSLBL
 I $L(GMTSL)&(+($G(GMTSPLB))>0) D E(" ") S TXT="",TXT=TXT_$J(" ",7)_GMTSL D:$L(GMTSL) E(TXT)
 D:$L(GMTSL)&(+($G(GMTSPLB))>0)&(+($G(GMTSLBB))>0) E(" ")
 S GMTSL=$J("",(72-$L(GMTSDTM)))_GMTSDTM
 S TXT="",TXT=TXT_$J(" ",7)_GMTSL D:$L(GMTSL) E(TXT)
 S GMTSL="********************  CONFIDENTIAL HEALTH SUMMARY **********************"
 S TXT="",TXT=TXT_$J(" ",7)_GMTSL D:$L(GMTSL) E(TXT)
 S GMTSL="PATIENT NAME      SSN-SSN-SSAN       WARD/LOCATTION        DATE OF BIRTH"
 S TXT="",TXT=TXT_$J(" ",7)_GMTSL D:$L(GMTSL) E(TXT)
 S GMTSL="       "_GMTSDCH_" (max 10 occurrences or "_GMTSTIM_")"
 S TXT="",TXT=TXT_$J(" ",7)_GMTSL D:$L(GMTSL) E(TXT)
 S GMTSL="                         **  DECEASED "_GMTSDED_"  **"
 S TXT="",TXT=TXT_$J(" ",7)_GMTSL D:$L(GMTSL) E(TXT)
 S GMTSL="<component data>"
 S TXT="",TXT=TXT_$J(" ",7)_GMTSL D:$L(GMTSL) E(TXT)
 W:'$D(GMTSEXT) !
 Q
D(X) ; Display
 I '$D(GMTSEXT) W !,$G(X) Q
 N GMTSC S GMTSC=$G(GMTSARY("D",0))+1,GMTSARY("D",+GMTSC)=$G(X),GMTSARY("D",0)=GMTSC
 Q
E(X) ; Example
 I '$D(GMTSEXT) W !,$G(X) Q
 N GMTSC S GMTSC=$G(GMTSARY("E",0))+1,GMTSARY("E",+GMTSC)=$G(X),GMTSARY("E",0)=GMTSC
 Q
