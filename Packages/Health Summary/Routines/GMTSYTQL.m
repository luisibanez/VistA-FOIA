GMTSYTQL ;SLC/JMH & ALB/ASF - MHA ADMINS    ; 9/7/07 5:35pm
 ;;2.7;Health Summary;**77**;Oct 20, 1995;Build 47
 ;                  
 ; External References
 ;   DBIA 10035  ^DPT(
 ;   DBIA 10103  $$FMTE^XLFDT
 ;   DBIA  ?????  ADMIN^YTQAPI5
 ;                     
 Q
EN ; MHA Admin list
 N GMTS1,GMTS2,GMTSCS,GMTSCW,GMTSDAY,GMTSDTM,GMTSLO,GMTSLOC,GMTSLPG
 N GMTSNPG,GMTSOR,GMTSQIT,GMTSTITL,GMTSX,N,GMTSDATA,GMTSGIV
 N GMTSNDM,GMTSI,GMTSJ,GMTSNN,GMTSTN,IOM,MAX
 K ^TMP("GMTSYTQL",$J)
 S MAX=$S(+($G(GMTSNDM))>0:+($G(GMTSNDM)),1:9999999)
 S:+($G(GMTSBEG))'>2700101 GMTSBEG=$$FMADD^XLFDT($P($$NOW^XLFDT,".",1),-1095,0,0,1),GMTSEND=$$FMADD^XLFDT($P($$NOW^XLFDT,".",1),1,0,0,1),GMTS2=9999999-GMTSBEG,GMTS1=9999999-GMTSEND
 S:'$L($P(GMTSBEG,".",2)) GMTSBEG=$$FMADD^XLFDT(GMTSBEG,0,0,0,1)
 S:+($G(GMTSEND))'>2700101!(+($G(GMTSEND))>+($$FMADD^XLFDT($P($$NOW^XLFDT,".",1),+1,0,0,2))) GMTSEND=$$FMADD^XLFDT($P($$NOW^XLFDT,".",1),1,0,0,1),GMTS1=9999999-GMTSEND
 S:'$L($P(GMTSEND,".",2)) GMTSEND=$$FMADD^XLFDT(GMTSEND,0,0,0,1)
 S:+($G(GMTSEND))>0&(+($G(GMTS1))=0) GMTS1=9999999-GMTSEND S:+($G(GMTSBEG))>0&(+($G(GMTS2))=0) GMTS2=9999999-GMTSBEG
 S GMTSLO=+($G(GMTSLO)) S:GMTSLO=0 GMTSLO=3 S GMTSLPG=+($G(GMTSLPG)),GMTSDTM=$G(GMTSDTM) S:'$L(GMTSDTM) GMTSDTM=$$DTM
 S:'$D(GMTSTITL)!('$L($G(GMTSTITL))) GMTSTITL="MHA Administrations"
 S DFN=+($G(DFN)) Q:'$L($P($G(^DPT(DFN,0)),"^",1))
 S GMTSCW(0)=+($G(IOM)) S:GMTSCW(0)=0 GMTSCW(0)=80
 S GMTSCW(1)=5,GMTSCW(2)=10,GMTSCW(3)=20,GMTSCW(4)=GMTSCW(0)-(GMTSCW(1)+GMTSCW(2)+GMTSCW(3)+8)
 S GMTSCW("L")=(GMTSCW(1)+GMTSCW(2)+GMTSCW(3)+GMTSCW(4)+6)
 S GMTSCS(1)=1,GMTSCS(2)=GMTSCS(1)+GMTSCW(1)+2,GMTSCS(3)=GMTSCS(2)+GMTSCW(2)+2,GMTSCS(4)=GMTSCS(3)+GMTSCW(3)+2
 D GET Q:'$D(^TMP("GMTSYTQL",$J))  D OUT
 Q
OUT ; Output
 N GMTSI,GMTSJ
 S GMTSNN=1
 D HDR
 S GMTSGIV="" F  S GMTSGIV=$O(^TMP("GMTSYTQL",$J,GMTSGIV)) Q:GMTSGIV'>0!(GMTSNN>MAX)  S GMTSTN="" F  S GMTSTN=$O(^TMP("GMTSYTQL",$J,GMTSGIV,GMTSTN)) Q:GMTSTN=""  D
 . S GMTSJ=$G(^TMP("GMTSYTQL",$J,GMTSGIV,GMTSTN))
 . S GMTSDAY=$$ITM(GMTSGIV) S:GMTSDAY?.E1"@9".E GMTSDAY=$P(GMTSDAY,"@9")
 . S GMTSOR=$P(GMTSJ,U,5) S:GMTSOR?1N.N GMTSOR=$$EXTERNAL^DILFD(601.84,5,,GMTSOR)
 . S GMTSLOC=$P(GMTSJ,U,14) S:GMTSLOC?1N.N GMTSLOC=$$EXTERNAL^DILFD(601.84,13,,GMTSLOC)
 . D LINE
 . S GMTSNN=GMTSNN+1
 K ^TMP("GMTSYTQL",$J)
 Q
LINE ; Output One Line
 D CKP^GMTSUP Q:$D(GMTSQIT)
 D:GMTSNPG=1 HDR
 W GMTSDAY
 W ?20,$E(GMTSTN,1,20)
 W $S($L(GMTSTN)>20:"*",1:" ")
 W ?41,$E(GMTSOR,1,20)
 W $S($L(GMTSOR)>20:"*",1:" ")
 W ?61,$E(GMTSLOC,1,20)
 W $S($L(GMTSLOC)>20:"*",1:" ")
 W !
 Q
HDR ; Header
 N GMTSI S GMTSI="",$P(GMTSI,"-",+($G(GMTSCW("L"))))="-"
 D CKP^GMTSUP Q:$D(GMTSQIT)  G:GMTSNPG=1 HDR W "Date",?20,"Instrument",?41,"Ordered by",?61,"Location",!
 Q
GET ; Get and Format Data
 N %DT,X,Y,GMTSNN,GMTSGIV,GMTSTN
 S GMTSNN=0
 K ^TMP("GMTSYTQL",$J)
 S GMTSX("DFN")=DFN,GMTSX("COMPLETE")="Y" D ADMINS^YTQAPI5(.GMTSDATA,.GMTSX)
 Q:'$D(GMTSDATA(3))
 S N=2 F  S N=$O(GMTSDATA(N)) Q:N'>0!(GMTSNN>MAX)  D
 . S GMTSTN=$P(GMTSDATA(N),U,2) Q:GMTSTN=""
 . S GMTSGIV=$P($G(GMTSDATA(N)),U,3) Q:GMTSGIV'?7N.E
 . Q:GMTSGIV<GMTSBEG
 . Q:GMTSGIV>GMTSEND
 . S GMTSNN=GMTSNN+1
 . S ^TMP("GMTSYTQL",$J,9999999.999999-GMTSGIV,GMTSTN)=GMTSDATA(N)
 K GMTSDATA
 D GAFGET
 D ASIGET
 Q
ASIGET ;
 N G,GMTSIEN,GMTSNN,GMTSELS
 S GMTSNN=0
 S GMTSIEN=0
 F  S GMTSIEN=$O(^YSTX(604,"C",DFN,GMTSIEN)) Q:GMTSIEN'>0  D
 . S G=^YSTX(604,GMTSIEN,0)
 . S GMTSGIV=$P(G,U,12)
 . S GMTSELS=$P($G(^YSTX(604,GMTSIEN,.5)),U)
 . Q:GMTSELS'=1
 . Q:GMTSGIV<GMTSBEG
 . Q:GMTSGIV>GMTSEND
 . S GMTSNN=GMTSNN+1
 . S ^TMP("GMTSYTQL",$J,9999999.999999-GMTSGIV,"ASI")=GMTSIEN_"^^^^"_$P(G,U,9)
 Q
GAFGET ;get axis5
 N G,N,GMTSNN
 S GMTSNN=0
 S GMTSX("DFN")=DFN D GAFRET^YTQAPI6(.GMTSDATA,.GMTSX)
 Q:'$D(GMTSDATA(2))
 S N=1 F  S N=$O(GMTSDATA(N)) Q:N'>0!(GMTSNN>MAX)  D
 . S G=GMTSDATA(N)
 . S GMTSGIV=$P(^YSD(627.8,+G,0),U)
 . Q:GMTSGIV<GMTSBEG
 . Q:GMTSGIV>GMTSEND
 . S GMTSNN=GMTSNN+1
 . S ^TMP("GMTSYTQL",$J,9999999.999999-GMTSGIV,"GAF")=+G_"^^^^"_$P(G,U,3)
 Q
ITM(X) ; Inverse date to Mental Health formats
 S X=+($G(X)) Q:X=0 "" S X=9999999.999999-X D REGDTM^GMTSU Q X
DTM(X) ; Current Date and Time (External)
 S X=$$NOW^XLFDT D REGDTM4^GMTSU Q X
