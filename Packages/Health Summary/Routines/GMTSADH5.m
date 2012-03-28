GMTSADH5 ; SLC/DCM,KER - Health Summary Ad Hoc RPC's ; 02/27/2002
 ;;2.7;Health Summary;**36,35,37,49**;Oct 20, 1995
 ;                     
 ; External References
 ;   DBIA  1268  ^AUTTHF(
 ;   DBIA  1268  ^AUTTHF("B"
 ;   DBIA    67  ^LAB(60
 ;   DBIA  1256  ^PXD(811.9
 ;   DBIA  3059  ^TIU(8925.1
 ;   DBIA 10006  ^DIC
 ;   DBIA  2052  $$GET1^DID
 ;   DBIA  3058  $$ISA^TIULX
 ;                   
COMP(Y) ; Get ADHOC sub components (FILE 142.1)
 ;
 ;  Y(i)=(1)I;IFN^(2)Component Name [Abb]^(3)Occ Limit^
 ;       (4)Time Limit^(5)Header Name^(6)Hosp Loc Disp^
 ;       (7)ICD Text Disp^(8)Prov Narr Disp^
 ;       (9)CPT Modifier Disp^(10)Summary Order
 ;
 N GMTSI,GMTSII,GMTSIFN,GMTSC,X,X1
 S Y(1)=$O(^GMT(142,"B","GMTS HS ADHOC OPTION",0))
 I 'Y(1) S Y(1)=-1 Q  ; Error, no ADHOC type defined
 S (GMTSC,GMTSI)=0,GMTSII=Y(1)
 F  S GMTSI=$O(^GMT(142,GMTSII,1,GMTSI)) Q:'GMTSI  S X=^(GMTSI,0) D
 . S GMTSIFN=$P(X,"^",2),X1=$G(^GMT(142.1,+GMTSIFN,0))
 . Q:'$L(X1)  Q:$P(X1,"^",6)="P"  S GMTSC=GMTSC+1
 . S Y(GMTSC)=GMTSI_";"_GMTSIFN
 . S Y(GMTSC)=Y(GMTSC)_"^"_$P(X1,"^")_" ["_$P(X1,"^",4)_"]"
 . S Y(GMTSC)=Y(GMTSC)_"^"_$S($P(X1,"^",5)="Y":$P(X,"^",3),1:"")
 . S Y(GMTSC)=Y(GMTSC)_"^"_$S($P(X1,"^",3)="Y":$P(X,"^",4),1:"")
 . S Y(GMTSC)=Y(GMTSC)_"^"_$S($L($P(X1,"^",9)):$P(X1,"^",9),1:$P(X,"^",5))
 . S Y(GMTSC)=Y(GMTSC)_"^"_$S($P(X1,"^",10)="Y":$P(X,"^",6),1:"")
 . S Y(GMTSC)=Y(GMTSC)_"^"_$S($P(X1,"^",11)="Y":$P(X,"^",7),1:"")
 . S Y(GMTSC)=Y(GMTSC)_"^"_$S($P(X1,"^",12)="Y":$P(X,"^",8),1:"")
 . S Y(GMTSC)=Y(GMTSC)_"^"_$P(X,"^")
 Q
 ;
COMPSUB(Y,GMTSUB) ; Get subcomponents from a predefined ADHOC component
 ; GMTSUB=desired Adhoc subcomponent
 ; Y(i)=ifn of pointed to file entry^name
 Q:'$G(GMTSUB)
 N GMTSI,GMTSII,GMTSIFN,GMTSC,X,X1
 S X=$O(^GMT(142,"B","GMTS HS ADHOC OPTION",0))
 I 'X Q  ; Error, no ADHOC type defined
 S (GMTSC,GMTSI)=0,GMTSII=X
 F  S GMTSI=$O(^GMT(142,GMTSII,1,GMTSUB,1,GMTSI)) Q:'GMTSI  S X=^(GMTSI,0) D
 . S GMTSIFN=+X,X1=$P(X,";",2)
 . I '$D(@("^"_X1_+X_",0)")) Q
 . S X=@("^"_X1_+X_",0)"),GMTSC=GMTSC+1,Y(GMTSC)=GMTSIFN_"^"_$P(X,"^")
 Q
 ;                 
FILES(Y,GMTSCP)   ; Get Files to select from for a component
 Q:'$G(GMTSCP)  Q:'$D(^GMT(142.1,GMTSCP,1))  N GMTSI,GMTSC,X S (GMTSI,GMTSC)=0
 F  S GMTSI=$O(^GMT(142.1,GMTSCP,1,GMTSI)) Q:'GMTSI  S X=^(GMTSI,0),GMTSC=GMTSC+1,Y(GMTSC)=GMTSI_"^"_$$FNAM^GMTSU(+X)_"^"_X
 Q
 ;                     
FILESEL(GMTSRT,GMTSFI,GMTSFM,DIR) ; Get file entries
 Q:'$G(GMTSFI)
 K ^TMP("ORDATA",$J)
 N GMTSI,GMTSJ,GMTSC,X,GMTSGL,GMTSGLB,GMTSCNT
 S GMTSI=$G(GMTSFM),GMTSCNT=44,GMTSC=0,GMTSRT=$NA(^TMP("ORDATA",$J,1))
 S:'$D(DIR) DIR=1
 I GMTSFI=60 D  Q
 . F  Q:GMTSC'<GMTSCNT  S GMTSI=$O(^LAB(60,"B",GMTSI),DIR) Q:GMTSI=""  S GMTSJ=0 F  S GMTSJ=$O(^LAB(60,"B",GMTSI,GMTSJ)) Q:'GMTSJ  D
 . . I $D(^LAB(60,GMTSJ,0)) S X=^(0) I $P(X,"^",4)="CH","BO"[$P(X,"^",3) S GMTSC=GMTSC+1,^TMP("ORDATA",$J,1,GMTSC)=GMTSJ_"^"_GMTSI
 I GMTSFI=9999999.64 D  Q
 . F  Q:GMTSC'<GMTSCNT  S GMTSI=$O(^AUTTHF("B",GMTSI),DIR) Q:GMTSI=""  S GMTSJ=0 F  S GMTSJ=$O(^AUTTHF("B",GMTSI,GMTSJ)) Q:'GMTSJ  I $D(^AUTTHF(GMTSJ,0)) S X=^(0) D
 . . I $P(X,"^",10)="C",+$P(X,"^",11)'=1 S GMTSC=GMTSC+1,^TMP("ORDATA",$J,1,GMTSC)=GMTSJ_"^"_GMTSI
 I GMTSFI=811.9 D  Q
 . F  Q:GMTSC'<GMTSCNT  S GMTSI=$O(^PXD(811.9,"B",GMTSI),DIR) Q:GMTSI=""  S GMTSJ=0 F  S GMTSJ=$O(^PXD(811.9,"B",GMTSI,GMTSJ)) Q:'GMTSJ  I $D(^PXD(811.9,GMTSJ,0)) S X=^(0) D
 . . I $P(X,"^",6)'=1 S GMTSC=GMTSC+1,^TMP("ORDATA",$J,1,GMTSC)=GMTSJ_"^"_GMTSI
 I GMTSFI=8925.1 D  Q
 . F  Q:GMTSC'<GMTSCNT  S GMTSI=$O(^TIU(8925.1,"B",GMTSI),DIR) Q:GMTSI=""  S GMTSJ=0 F  S GMTSJ=$O(^TIU(8925.1,"B",GMTSI,GMTSJ)) Q:'GMTSJ  I $D(^TIU(8925.1,GMTSJ,0)) S X=^(0) D
 . . I $P(X,"^",4)="DOC",$$ISA^TIULX(GMTSJ,3) S GMTSC=GMTSC+1,^TMP("ORDATA",$J,1,GMTSC)=GMTSJ_"^"_GMTSI
 ;I GMTSFI=81 D  Q
 ;. F  Q:GMTSC'<GMTSCNT  S GMTSI=$O(^ICPT("C",GMTSI),DIR) Q:GMTSI=""  S GMTSJ=0 F  S GMTSJ=$O(^ICPT("C",GMTSI,GMTSJ)) Q:'GMTSJ   I $D(^ICPT(GMTSJ,0)) S X=^(0) D
 ;. . S GMTSC=GMTSC+1,^TMP("ORDATA",$J,1,GMTSC)=GMTSJ_"^"_$P(X,"^",2)_" ["_$P(X,"^")_"]"
 S GMTSGL=$$FCLR^GMTSU(+GMTSFI) I $L(GMTSGL) S GMTSGLB=$$FLOC^GMTSU(+GMTSFI)_"""B"")" D
 . F  Q:GMTSC'<GMTSCNT  S GMTSI=$O(@GMTSGLB@(GMTSI),DIR) Q:GMTSI=""  S GMTSJ=0 F  S GMTSJ=$O(@GMTSGLB@(GMTSI,GMTSJ)) Q:'GMTSJ  I $D(@GMTSGL@(GMTSJ,0)) S X=^(0) D
 . . S GMTSC=GMTSC+1,^TMP("ORDATA",$J,1,GMTSC)=GMTSJ_"^"_GMTSI
 Q
 ;                     
REPORT(GMTSEG,GMTSEGC,GMTSEGI,GMTSCPS,DFN) ; Build Report
 ; Uses array of Components passed in GMTSCPS()
 ;   GMTSCPS(i)=array of subcomponents chosen,
 ;   value is pointer at ^GMT(142,DA(1),1,DA)
 Q:'$G(DFN)
 N GMTSCNT,DIC,DIZ,DIW,DIWI,DIWT,DIWTC,X,GMTSI,GMTSJ,GMTSK,GMTSTYP,GMTSTITL
 S X="GMTS HS ADHOC",DIC=142,DIZ(0)="ZF"
 D ^DIC Q:'Y
 S GMTSTYP=+Y,GMTSTITL="AD HOC",(GMTSJ,GMTSI)=0,GMTSEGC=$O(GMTSCPS(99999999),-1)
 F  S GMTSI=$O(GMTSCPS(GMTSI)) Q:'GMTSI  D
 . N GMTSREC,GMTSS2,GMTSSJ,GMTSEL
 . S GMTSREC=^GMT(142,GMTSTYP,1,+GMTSCPS(GMTSI),0),GMTSJ=GMTSJ+1
 . S GMTSEG(GMTSJ)=GMTSREC,GMTSEGI($P(GMTSREC,U,2))=GMTSJ,GMTSS2=0,GMTSSJ=GMTSJ
 . S $P(GMTSEG(GMTSJ),"^",3)=$P(GMTSCPS(GMTSI),"^",2)
 . S $P(GMTSEG(GMTSJ),"^",4)=$P(GMTSCPS(GMTSI),"^",3)
 . I $L($P(GMTSCPS(GMTSI),"^",4)) S $P(GMTSEG(GMTSJ),"^",5)=$P(GMTSCPS(GMTSI),"^",4)
 . I $L($P(GMTSCPS(GMTSI),"^",5)) S $P(GMTSEG(GMTSJ),"^",6)=$P(GMTSCPS(GMTSI),"^",5)
 . S $P(GMTSEG(GMTSJ),"^",7)=$P(GMTSCPS(GMTSI),"^",6)
 . I $L($P(GMTSCPS(GMTSI),"^",7)) S $P(GMTSEG(GMTSJ),"^",8)=$P(GMTSCPS(GMTSI),"^",7)
 . S (GMTSCNT,GMTSK)=0
 . F  S GMTSK=$O(GMTSCPS(GMTSK)) Q:'GMTSK  I +GMTSCPS(GMTSI)=+GMTSCPS(GMTSK),$P(GMTSCPS(GMTSK),"^",9),$P(GMTSCPS(GMTSK),"^",10) D
 . . S GMTSCNT=GMTSCNT+1
 . . S:'$D(GMTSEG(GMTSJ,$P(GMTSCPS(GMTSK),"^",9),0)) GMTSEG(GMTSJ,$P(GMTSCPS(GMTSK),"^",9),0)=$$GET1^DID($P(GMTSCPS(GMTSK),"^",9),,,"GLOBAL NAME")
 . . S GMTSEG(GMTSJ,$P(GMTSCPS(GMTSK),"^",9),GMTSCNT)=$P(GMTSCPS(GMTSK),"^",10)
 . . K GMTSCPS(GMTSK)
 Q
 ;                     
SUBITEM(Y,GMTSTEST) ; Get Subitems for a Test Panel
 Q:'$G(GMTSTEST)  N GMTSCNT S GMTSCNT=0
 I '$L($P(^LAB(60,GMTSTEST,0),"^",5)),$O(^LAB(60,GMTSTEST,2,0)) D COMPILE(GMTSTEST,GMTSCNT)
 Q
 ;                     
COMPILE(GMTSTEST,GMTSCNT) ; Expand lab panels
 N GMTSI,GMTSJ,GMTSRT S GMTSI=0
 F  S GMTSI=$O(^LAB(60,GMTSTEST,2,GMTSI)) Q:GMTSI'>0  D
 . S GMTSJ=+$G(^LAB(60,GMTSTEST,2,+GMTSI,0))
 . S GMTSRT=$G(^LAB(60,+GMTSJ,0))
 . I $L($P(GMTSRT,U,5)),("BO"[$P(GMTSRT,U,3)) D
 . . S GMTSCNT=GMTSCNT+1
 . . S Y(GMTSCNT)=+GMTSJ_"^"_GMTSRT
 . E  D
 . . D COMPILE(+$G(^LAB(60,GMTSTEST,2,GMTSI,0)),GMTSCNT)
 Q
