BQITRPHS ;APTIV/HC/ALA-Treatment Prompt API for Health Summary ; 28 Feb 2008  3:31 PM
 ;;2.1;ICARE MANAGEMENT SYSTEM;;Feb 07, 2011
 ;
EN(BQIDFN,BQIHSM,ARRAY) ; PEP - by patient and each best practice prompt
 ; Input
 ;   BQIDFN - Patient IEN
 ;   BQIHSM - Treatment Prompt text from File #9001018
 ;            this should match with a category in 90508.5
 ;   ARRAY  - Reference that data should be returned in
 ;
 ;  Get the category IEN
 NEW IEN,BQTCT,BQTIEN,BQIDXN,CSTAT,BQIRMK,UID,BK,CT,RESULT
 S BQTIEN=$$FIND1^DIC(90508.5,"","BX",BQIHSM,"","","ERROR")
 ;
 K ARRAY
 S CT=0
 S BQIDXN=$$GET1^DIQ(90508.5,BQTIEN_",",.02,"E")
 I '$$ATAG^BQITDUTL(BQIDFN,BQIDXN) Q
 ;
 K BQIRMK
 S BK=0,UID=$J
 F  S BK=$O(^BQI(90508.5,BQTIEN,1,BK)) Q:'BK  S BQIRMK(BK)=^BQI(90508.5,BQTIEN,1,BK,0)
 I '$$FND^BQITRPPT(BQTIEN,"BQITEST",BQIDFN,.BQIRMK) Q
 S ARRAY(0)=1_U_"Patient's active iCare Diagnostic Tag is "_BQIDXN
 S CT=CT+1
 M ARRAY=BQIRMK
 Q
 ;
APCH ; EP - Tag to be called from Health Summary
 NEW APCHSTAT,BQITXT,APCHSCT,APCHSGHR,APCHSL
 Q:'$$INAC^APCHSMU(APCHSITI)
 ; Not a candidate
 Q:'$$CVT(APCHSPAT)
 S APCHLAST="",APCHNEXT="" K APCHSTEX
 I $G(APCHCOLW)="" S APCHCOLW=10
 S BQITXT=$P(^APCHSURV(APCHSITI,0),U,1)
 D EN(APCHSPAT,BQITXT,.APCHSTEX)
 K ^UTILITY($J,"W")
 NEW DIWL,DIWR,BQI,X
 S DIWR=40,DIWL=1
 F BQI=1:1 Q:'$D(APCHSTEX(BQI))  D
 . S X=APCHSTEX(BQI)
 . D ^DIWP
 K APCHSTEX
 S X=0 F  S X=$O(^UTILITY($J,"W",DIWL,X)) Q:X'=+X  S APCHSTEX(X)=^UTILITY($J,"W",DIWL,X,0)
 D WRITETP
 K ^UTILITY($J,"W")
 Q
 ;
PAT(DFN,ARRAY) ;PEP - By patient and get all best practice prompts
 NEW TAG,BQTN,ORD,CT,BQTIEN,BQIRMK,BDT,BI,BK,BN,E,EDT,LCNT,NDESC,PDESC,RES,RESULT,TXT,VSDTM,X
 K ARRAY
 S TAG=$$CVT(DFN)
 I 'TAG S ARRAY(0)="Patient does not have an iCare Diagnostic Tag of CVD" Q
 S ARRAY(0)=1_U_"Patient's active iCare Diagnostic Tag is "_$P(TAG,U,2)
 I $O(^BQIPAT(DFN,50,0))="" S ARRAY(1)="No CVD Best Practice Prompts on file for this patient."
 S BQTIEN=0,CT=0
 F  S BQTIEN=$O(^BQIPAT(DFN,50,BQTIEN)) Q:'BQTIEN  D
 . S BN=0,CT=CT+1
 . M ARRAY(CT)=^BQIPAT(DFN,50,BQTIEN,1)
 Q
 ;
CVT(DFN) ;EP - Is patient tagged for CVD?
 S RESULT=0
 S TXT="CVD"
 F  S TXT=$O(^BQI(90506.2,"B",TXT)) Q:TXT=""!($E(TXT,1,3)'="CVD")  D
 . I '$$ATAG^BQITDUTL(DFN,TXT) Q
 . S RESULT=1_U_TXT_U_$O(^BQI(90506.2,"B",TXT,""))
 Q RESULT
 ;
WRITETP ;EP - write out TP
 I $G(APCHSGHR) D  Q
 .NEW A,B
 .S (A,B)=0
 .S APCHRVAL(0)="1^"_$P(^APCHSURV(APCHSITI,0),U)
 .F  S B=$O(APCHSTEX(B)) Q:B'=+B  S A=A+1,APCHRVAL(A)=APCHSTEX(B)
 I 'APCHSANY D FIRST^APCHSTP Q:$D(APCHSQIT)  S APCHSANY=1,APCHSNPG=0
 X APCHSCKP Q:$D(APCHSQIT)
 I APCHSNPG S APCHSCT=0,APCHSNPG=0
 S APCHX=$S($P(^APCHSURV(APCHSITI,0),U,4)]"":$P(^APCHSURV(APCHSITI,0),U,4),1:$P(^APCHSURV(APCHSITI,0),U))
 I $D(APCHSTEX)>1 W APCHX,!
 I '$D(APCHSTEX) Q
 ;I $L(APCHX)>28 W !
 F APCHSL=1:1 Q:'$D(APCHSTEX(APCHSL))!($D(APCHSQIT))  D
 .X APCHSCKP Q:$D(APCHSQIT)
 .W ?30,APCHSTEX(APCHSL),!
 K APCHSTEX
 Q
