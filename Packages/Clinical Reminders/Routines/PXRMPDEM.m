PXRMPDEM ; SLC/PKR - Computed findings for patient demographics. ;09/19/2005
 ;;2.0;CLINICAL REMINDERS;**5**;Feb 04, 2005
 ;
 ;======================================================
AGE(DFN,TEST,DATE,VALUE,TEXT) ;Computed finding for returning a patient's
 ;age
 S DATE=DT,TEST=1
 I $D(PXRMPDEM) D  Q
 . S VALUE=PXRMPDEM("AGE")
 . I +PXRMPDEM("DOD")=0 S VALUE("DECEASED")=0 Q
 . I +PXRMPDEM("DOD")>0 S VALUE("DECEASED")=1,TEXT="Patient is deceased"
 I '$D(PXRMPDEM) D
 . N DOB,DOD
 .;DBIA #10035
 . S DOB=$P(^DPT(DFN,0),U,3)
 . S DOD=$P($G(^DPT(DFN,.35)),U,1)
 . S VALUE=$$AGE^PXRMAGE(DOB,DOD,DT)
 . I +DOD=0 S VALUE("DECEASED")=0 Q
 . I +DOD>0 S VALUE("DECEASED")=1,TEXT="Patient is deceased"
 Q
 ;
 ;======================================================
DISCHDT(DFN,TEST,DATE,VALUE,TEXT) ;This computed finding will return
 ;the most recent service separation date.
 N CNT,IRW,VAROOT
 S VAROOT="IRW"
 D SVC^VADPT
 S VALUE=$P($G(IRW(6,5)),U)
 I VALUE="" S TEST=0 D KVA^VADPT Q
 S DATE=VALUE,TEST=1
 S TEXT="Last Service Separation date: "_$$EDATE^PXRMDATE(VALUE)_" Branch of Service: "_$P($G(IRW(6,1)),U,2)
 D KVA^VADPT
 Q
 ;
 ;======================================================
DOB(DFN,TEST,DATE,VALUE,TEXT) ;Computed finding for a patient's
 ;date of birth.
 S DATE=DT,TEST=1
 I $D(PXRMPDEM) S VALUE=PXRMPDEM("DOB")
 ;DBIA #10035 DATE OF BIRTH is a required field.
 I '$D(PXRMPDEM) S VALUE=$P(^DPT(DFN,0),U,3)
 S TEXT=$$EDATE^PXRMDATE(VALUE)
 Q
 ;
 ;======================================================
DOD(DFN,TEST,DATE,VALUE,TEXT)   ;Computed finding for a patient's
 ;date of death.
 S DATE=DT
 I $D(PXRMPDEM) S VALUE=PXRMPDEM("DOD")
 ;DBIA #10035
 I '$D(PXRMPDEM) S VALUE=$P($G(^DPT(DFN,.35)),U,1)
 S TEST=$S(VALUE="":0,1:1)
 I TEST S TEXT=$$EDATE^PXRMDATE(VALUE)
 Q
 ;
 ;======================================================
ETHNY(DFN,NGET,BDT,EDT,NFOUND,TEST,DATE,VALUE,TEXT) ;Computed finding for
 ;a patient's ethnicity.
 N CNT,CNT1,VADM
 D DEM^VADPT
 I $D(VADM(11))'=11 S NFOUND=0 D KVA^VADPT Q
 S NGET=$S(NGET<0:-NGET,1:NGET)
 S (CNT,CNT1)=0
 F  S CNT=$O(VADM(11,CNT)) Q:(CNT="")!(CNT1=NGET)  D
 . S CNT1=CNT1+1,TEST(CNT1)=1,DATE(CNT1)=DT
 . S TEXT(CNT1)="",VALUE(CNT1,"VALUE")=$P($G(VADM(11,CNT)),U,2)
 S NFOUND=CNT1
 D KVA^VADPT
 Q
 ;
 ;======================================================
NEWRACE(DFN,NGET,BDT,EDT,NFOUND,TEST,DATE,VALUE,TEXT) ;Computed finding
 ;for returning a patient's multi-valued race.
 N CNT,CNT1,IND,VADM
 D DEM^VADPT
 I $D(VADM(12))'=11 S NFOUND=0 D KVA^VADPT Q
 S NGET=$S(NGET<0:-NGET,1:NGET)
 S (CNT,CNT1)=0
 F  S CNT=$O(VADM(12,CNT)) Q:(CNT="")!(CNT1=NGET)  D
 . S CNT1=CNT1+1,TEST(CNT1)=1,DATE(CNT1)=DT
 . S TEXT(CNT1)="",VALUE(CNT1,"VALUE")=$P($G(VADM(12,CNT)),U,2)
 F CNT=1:1:CNT1 F IND=1:1:CNT1 S VALUE(CNT,"RACE",IND)=VALUE(IND,"VALUE")
 S NFOUND=CNT1
 D KVA^VADPT
 Q
 ;
 ;======================================================
PATTYPE(DFN,TEST,DATE,VALUE,TEXT) ;Computed finding to return the patient
 ;type
 N VAEL
 S VALUE=""
 S DATE=$$NOW^PXRMDATE
 D ELIG^VADPT
 S TEST=$S($G(VAEL(6))'="":1,1:0)
 S VALUE=$P(VAEL(6),U,2)
 D KVA^VADPT
 Q
 ;======================================================
RACE(DFN,TEST,DATE,VALUE,TEXT) ;Computed finding for checking a patient's race.
 N RACE
 S DATE=DT
 ;DBIA #10035
 S RACE=$P($G(^DPT(DFN,0)),U,6)
 I RACE="" S TEST=0,VALUE="" Q
 Q
 ;
 ;======================================================
SEX(DFN,TEST,DATE,VALUE,TEXT) ;Computed finding for returning a patient's
 ;sex.
 S DATE=DT,TEST=1
 I $D(PXRMPDEM) S VALUE=PXRMPDEM("SEX") Q
 ;DBIA #10035 SEX is a required field.
 I '$D(PXRMPDEM) S VALUE=$P(^DPT(DFN,0),U,2)
 Q
 ;
 ;======================================================
VETERAN(DFN,TEST,DATE,VALUE,TEXT) ;Computed finding for checking if a
 ;patient is a veteran.
 N VAEL
 S DATE=DT
 D ELIG^VADPT
 S TEST=VAEL(4)
 S VALUE=""
 D KVA^VADPT
 Q
 ;
