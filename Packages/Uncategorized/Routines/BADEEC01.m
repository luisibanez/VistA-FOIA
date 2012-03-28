BADEEC01 ;IHS/MSC/MGH - BADE ENVIRONMENT CHECK ROUTINE ;31-Mar-2009 15:50;PLS
 ;;1.0;DENTAL/EDR INTERFACE;;Oct 13, 2009
 ;
ENV ;EP
 N IN,PATCH,INSTDA,STAT
 ;Check for the installation of the EHR
 S IN="IHS PCC SUITE 2.0",INSTDA=""
 I '$D(^XPD(9.7,"B",IN)) D  Q
 .D MES("You must first install the IHS PCC SUITE 2.0 before this patch",2)
 S INSTDA=$O(^XPD(9.7,"B",IN,INSTDA),-1)
 S STAT=+$P($G(^XPD(9.7,INSTDA,0)),U,9)
 I STAT'=3 D  Q
 .D MES("IHS PCC SUITE 2.0 must be completely installed before installing this patch",2)
 S (XPDDIQ("XPZ1"),XPDDIQ("XPZ2"))=0
 ;Check for the installation of other patches
 Q
 ;
MES(TXT,QUIT) ;EP
 D BMES^XPDUTL("  "_$G(TXT))
 S:$G(QUIT) XPDABORT=QUIT
 Q
 ;
PRE ;EP - Pre-init
 Q
RENXPAR(OLD,NEW) ; Rename parameter
 N IEN,FDA,FIL
 S FIL=8989.51
 Q:$$FIND1^DIC(FIL,"","X",NEW)  ; New name already exists
 S IEN=$$FIND1^DIC(FIL,"","X",OLD)
 Q:'IEN  ; Old name doesn't exist
 S FDA(FIL,IEN_",",.01)=NEW
 D FILE^DIE("E","FDA")
 Q
POST ;EP
 D EN^XPAR("SYS","BADE EDR PAUSE PATIENT LOAD",,"Y")
 D EN^XPAR("SYS","BADE EDR PAUSE PROV UPLOAD",,"Y")
 D EN^XPAR("SYS","BADE EDR PT THROTTLE",,0)
 D EN^XPAR("SYS","BADE EDR THROTTLE CT",,10)
 D EN^XPAR("SYS","BADE EDR LAST DFN",,"")
 D EN^XPAR("SYS","BADE EDR LAST NEW PERSON",,"")
 D EN^XPAR("SYS","BADE EDR TOTAL PROCESSED",,0)
 D EN^XPAR("SYS","BADE EDR TOTAL PROVIDERS",,0)
 D EN^XPAR("SYS","BADE EDR TOTAL ERRORS",,0)
 D:$$GETHLOC($$GETSC(56)) EN^XPAR("SYS","BADE EDR DEFAULT CLINIC",,"`"_$$GETHLOC($$GETSC(56)))
 ;
 D REGPROT("AG REGISTER A PATIENT","BADE PATIENT A28",967)
 D REGPROT("AG UPDATE A PATIENT","BADE PATIENT A31",967)
 D REGPROT("AVA PROVIDER UPDATE MFN_M02","BADE PROVIDER UPDATE MFN-M02",967)
 Q
 ; Register a protocol to an extended action protocol
 ; Input: P-Parent protocol
 ;        C-Child protocol
 ;     SEQ-Sequence Number
REGPROT(P,C,SEQ,ERR) ;EP
 N IENARY,PIEN,AIEN,FDA
 D
 .I '$L(P)!('$L(C)) S ERR="Missing input parameter" Q
 .S IENARY(1)=$$FIND1^DIC(101,"","",P)
 .S AIEN=$$FIND1^DIC(101,"","",C)
 .I 'IENARY(1)!'AIEN S ERR="Unknown protocol name" Q
 .S FDA(101.01,"?+2,"_IENARY(1)_",",.01)=AIEN
 .S FDA(101.01,"?+2,"_IENARY(1)_",",3)=SEQ
 .D UPDATE^DIE("S","FDA","IENARY","ERR")
 ;Q:$Q $G(ERR)=""
 Q
 ; Return IEN to Clinic Stop Code file for given stop code
GETSC(SC) ;EP
 N RES
 S RES=$$FIND1^DIC(40.7,,,SC,"C")
 Q +RES
 ; Return first IEN to Hospital Location file for given stop code ien
GETHLOC(SIEN) ;EP
 N RES
 Q:'$G(SIEN) 0
 S RES=$O(^SC("ASTOP",SIEN,0))
 Q +RES
