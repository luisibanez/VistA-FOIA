TIUO38 ; SLC/JM - TIU Object Export Routine ; 4/30/99 [ 06/19/2001  10:38 AM ]
 ;;1.0;TEXT INTEGRATION UTILITIES;**38**;Jun 20, 1997
 Q
INSTALL N FILENUM,TAG,ROUTINE,TEXTLINE,FLDNUMS,XPDIDTOT,DIERR,DISYS,%1
 K ^DD(8925.1,0,"ID",.04) ;Added to fix Beta Site prob, per DBIA #2813
 S FILENUM=8925.1
 S U="^",ROUTINE=""
 S XPDIDTOT=6
 F TAG=1:1:6 D
 .N FLD,IDX,IEN,RECORD,DATA,FIELD,TIUFPRIV,ADDCMD
 .S IDX=0,TIUFPRIV=1
 .F  D  Q:RECORD=""
 ..S IDX=IDX+1
 ..S TEXTLINE="EN"_TAG
 ..I $L($T(@TEXTLINE+IDX^@("TIUO38"_ROUTINE)))'>0 D
 ...I ROUTINE="" S ROUTINE="A"
 ...E  S ROUTINE=$C($A(ROUTINE)+1)
 ..S RECORD=$P($T(@("EN"_TAG)+IDX^@("TIUO38"_ROUTINE)),";;",2)
 ..I RECORD'="" D
 ...S FIELD=$P(RECORD,U,1)
 ...S DATA=$P(RECORD,U,2,99)
 ...I IDX=1 D
 ....S IEN=$$FIND1^DIC(FILENUM,"","X",DATA,"B","I $P(^(0),U,4)=""O""")
 ....I +IEN'>0 D  I 1
 .....N ADDCMD,IENLIST
 .....D ADD("+1")
 .....D UPDATE^DIE("",$NA(ADDCMD),$NA(IENLIST))
 .....S IEN=IENLIST(1)
 ....E  D
 .....N DELCMD
 .....K ^TMP("TIUOBJINS",$J)
 .....D GETS^DIQ(FILENUM,IEN,"*","N",$NA(^TMP("TIUOBJINS",$J)))
 .....S FLD=0
 .....F  S FLD=$O(^TMP("TIUOBJINS",$J,FILENUM,IEN_",",FLD)) Q:'FLD  D
 ......I FLD'=.01 D
 .......S DELCMD(FILENUM,IEN_",",FLD)="@"
 .....D FILE^DIE("",$NA(DELCMD))
 .....K ^TMP("TIUOBJINS",$J)
 ...D ADD(IEN)
 .D FILE^DIE("E",$NA(ADDCMD))
 .D UPDATE^XPDID(TAG)
 K ^TMP("DIERR",$J)
 Q
ADD(IEN) ;
 I '$D(FLDNUMS(FIELD)) D
 .S FLDNUMS(FIELD)=$$FLDNUM^DILFD(FILENUM,FIELD)
 S ADDCMD(FILENUM,IEN_",",FLDNUMS(FIELD))=DATA
 Q
EN1 ;TIU Object:ACTIVE MEDICATIONS
 ;;NAME^ACTIVE MEDICATIONS
 ;;ABBREVIATION^AMED
 ;;PRINT NAME^ACTIVE MEDICATIONS
 ;;TYPE^OBJECT
 ;;CLASS OWNER^CLINICAL COORDINATOR
 ;;STATUS^ACTIVE
 ;;NATIONAL STANDARD^NO
 ;;OK TO DISTRIBUTE^YES
 ;;OBJECT METHOD^S X=$$LIST^TIULMED(DFN,"^TMP(""TIUMED"",$J)",1)
 ;;TIMESTAMP^57652,49986
EN2 ;TIU Object:RECENT MEDICATIONS
 ;;NAME^RECENT MEDICATIONS
 ;;ABBREVIATION^RMED
 ;;PRINT NAME^RECENT MEDICATIONS
 ;;TYPE^OBJECT
 ;;CLASS OWNER^CLINICAL COORDINATOR
 ;;STATUS^ACTIVE
 ;;NATIONAL STANDARD^NO
 ;;OK TO DISTRIBUTE^YES
 ;;OBJECT METHOD^S X=$$LIST^TIULMED(DFN,"^TMP(""TIUMED"",$J)")
 ;;TIMESTAMP^57652,49384
EN3 ;TIU Object:DETAILED ACTIVE MEDS
 ;;NAME^DETAILED ACTIVE MEDS
 ;;ABBREVIATION^DAMD
 ;;PRINT NAME^DETAILED ACTIVE MEDS
 ;;TYPE^OBJECT
 ;;CLASS OWNER^CLINICAL COORDINATOR
 ;;STATUS^ACTIVE
 ;;NATIONAL STANDARD^NO
 ;;OK TO DISTRIBUTE^YES
 ;;OBJECT METHOD^S X=$$LIST^TIULMED(DFN,"^TMP(""TIUMED"",$J)",1,1)
 ;;TIMESTAMP^57740,41359
EN4 ;TIU Object:DETAILED RECENT MEDS
 ;;NAME^DETAILED RECENT MEDS
 ;;ABBREVIATION^DRMD
 ;;PRINT NAME^DETAILED RECENT MEDS
 ;;TYPE^OBJECT
 ;;CLASS OWNER^CLINICAL COORDINATOR
 ;;STATUS^ACTIVE
 ;;NATIONAL STANDARD^NO
 ;;OK TO DISTRIBUTE^YES
 ;;OBJECT METHOD^S X=$$LIST^TIULMED(DFN,"^TMP(""TIUMED"",$J)",0,1)
 ;;TIMESTAMP^57740,41600
EN5 ;TIU Object:ACTIVE MEDS COMBINED
 ;;NAME^ACTIVE MEDS COMBINED
 ;;ABBREVIATION^AMDC
 ;;PRINT NAME^ACTIVE MEDS COMBINED
 ;;TYPE^OBJECT
 ;;CLASS OWNER^CLINICAL COORDINATOR
 ;;STATUS^ACTIVE
 ;;NATIONAL STANDARD^NO
 ;;OK TO DISTRIBUTE^YES
 ;;OBJECT METHOD^S X=$$LIST^TIULMED(DFN,"^TMP(""TIUMED"",$J)",1,0,0,1)
 ;;TIMESTAMP^57772,59892
EN6 ;TIU Object:RECENT MEDS COMBINED
 ;;NAME^RECENT MEDS COMBINED
 ;;ABBREVIATION^RMDC
 ;;PRINT NAME^RECENT MEDS COMBINED
 ;;TYPE^OBJECT
 ;;CLASS OWNER^CLINICAL COORDINATOR
 ;;STATUS^ACTIVE
 ;;NATIONAL STANDARD^NO
 ;;OK TO DISTRIBUTE^YES
 ;;OBJECT METHOD^S X=$$LIST^TIULMED(DFN,"^TMP(""TIUMED"",$J)",0,0,0,1)
 ;;TIMESTAMP^57779,42006
