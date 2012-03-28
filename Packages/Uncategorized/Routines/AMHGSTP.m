AMHGSTP ; IHS/CMI/MAW - AMHG Save Treatment Plan 3/7/2009 8:49:18 PM ;
 ;;4.0;IHS BEHAVIORAL HEALTH;**1**;JUN 18, 2010;Build 8
 ;
 ;
 ;
DEBUG(RETVAL,AMHSTR) ;-- debug entry point
 D DEBUG^%Serenji("NARR^AMHGSTP(.RETVAL,.AMHSTR)")
 Q
 ;
TP(RETVAL,AMHSTR) ;-- save treatment plan, called from clsTreatmentPlanDataEntry.SaveTreatmentPlan
 S X="MERR^AMHGU",@^%ZOSF("TRAP") ; m error trap
 N AMHI,P,R,AMHDM,AMHREC,AMHP,AMHDE,AMHPRG,AMHTD,AMHRD,AMHDC,AMHDP,AMHCA,AMHCD,AMHCS,AMHPRBL,AMHER,AMHPP,AMHGAF,PP
 S P="|",R="~"
 S RETVAL="^AMHTMP("_$J_")"
 S AMHI=0
 K ^AMHTMP($J)
 I $G(AMHSTR)="" D CATSTR^AMHGU(.AMHSTR,.AMHSTR)
 S AMHDM=$P(AMHSTR,P)
 S AMHREC=$P(AMHSTR,P,2)
 S AMHP=$P(AMHSTR,P,3)
 S AMHDE=$P(AMHSTR,P,4)
 S AMHPRG=$P(AMHSTR,P,5)
 S AMHPRG=$$SCI^AMHGT(9002011,.02,AMHPRG)
 S AMHTD=$P(AMHSTR,P,6)
 S AMHRD=$P(AMHSTR,P,7)
 S AMHDC=$P(AMHSTR,P,8)
 S AMHDP=$P(AMHSTR,P,9)
 S AMHA5=$P(AMHSTR,P,10)
 S AMHCA=$P(AMHSTR,P,11)
 S AMHCD=$P(AMHSTR,P,12)
 S AMHCS=$P(AMHSTR,P,13)
 S AMHPRBL=$P(AMHSTR,P,14)
 S AMHGAF=$P(AMHSTR,P,15)
 S AMHPP=$P(AMHSTR,P,16)
 D ARRAY^AMHGU(.PP,AMHPP)
 D TP^AMHGETP(.AMHIEN,AMHDM,AMHREC,AMHP,AMHDE,AMHPRG,AMHTD,AMHRD,AMHDC,AMHDP,AMHA5,AMHCA,AMHCD,AMHCS,AMHPRBL,AMHGAF,.PP)
 S @RETVAL@(AMHI)="T00030Result"_$C(30)
 S AMHI=AMHI+1
 S @RETVAL@(AMHI)=$S($G(AMHER)]"":AMHER,1:AMHIEN)_$C(30)
 S @RETVAL@(AMHI+1)=$C(31)
 Q
 ;
PRB(RETVAL,AMHSTR) ;-- save treatment plan problem, called from clsTreatmentPlanDataEntry.SaveProblem
 S X="MERR^AMHGU",@^%ZOSF("TRAP") ; m error trap
 N AMHI,P,R,AMHDM,AMHREC,AMHP,AMHA1,AMHA2,AMHA3,AMHA4,AMHA5,A4,AMHER
 S P="|",R="~"
 S RETVAL="^AMHTMP("_$J_")"
 S AMHI=0
 K ^AMHTMP($J)
 I $G(AMHSTR)="" D CATSTR^AMHGU(.AMHSTR,.AMHSTR)
 S AMHDM=$P(AMHSTR,P)
 S AMHREC=$P(AMHSTR,P,2)
 S AMHP=$P(AMHSTR,P,3)
 S AMHA1=$P(AMHSTR,P,4)
 S AMHA2=$P(AMHSTR,P,5)
 S AMHA3=$P(AMHSTR,P,6)
 S AMHA4=$P(AMHSTR,P,7)
 S AMHA5=$P(AMHSTR,P,8)
 D ARRAY^AMHGU(.A4,AMHA4)
 D A^AMHGETP(AMHREC,AMHA1,6)
 D A^AMHGETP(AMHREC,AMHA2,8)
 D A^AMHGETP(AMHREC,AMHA3,7)
 D AXIS4(AMHDM,AMHREC,.A4)
 S @RETVAL@(AMHI)="T00030Result"_$C(30)
 S AMHI=AMHI+1
 S @RETVAL@(AMHI)=$S($G(AMHER)]"":AMHER,1:AMHREC)_$C(30)
 S @RETVAL@(AMHI+1)=$C(31)
 Q
 ;
AXIS4(D,RC,A4) ;-- file axis 4 data
 N AMHDA,R
 S R="~"
 S AMHDA=0 F  S AMHDA=$O(A4(AMHDA)) Q:'AMHDA  D
 . N STR,PIEN,PCODE,PNARR
 . S STR=$G(A4(AMHDA))
 . S PIEN=$P(STR,R)
 . S PCODE=$P(STR,R,2)
 . S PNARR=$P(STR,R,3)
 . I '$$FNDAXIS4(PIEN,RC) D ADDAXIS4^AMHGETP(PIEN,RC)  Q
 I D="E" D  Q
 . D DELAXIS4^AMHGETP(RC,.A4)
 Q
 ;
FNDAXIS4(PI,RC) ;-- see if axis 4 exists
 N PDA,MTC
 S MTC=0
 S PDA=0 F  S PDA=$O(^AMHPTXP(RC,9,PDA)) Q:'PDA!($G(MTC))  D
 . I $P(^AMHPTXP(RC,9,PDA,0),U)=PI S MTC=1
 Q $G(MTC)
 ;
NARR(RETVAL,AMHSTR) ;save narrative, called from clsTreatmentPlanDataEntry.SaveNarrative method
 S X="MERR^AMHGU",@^%ZOSF("TRAP") ; m error trap
 N AMHI,P,R,AMHDM,AMHREC,AMHP,AMHNARR,AMHER
 S P="|",R="~"
 S RETVAL="^AMHTMP("_$J_")"
 S AMHI=0
 K ^AMHTMP($J)
 I $G(AMHSTR)="" D CATSTR^AMHGU(.AMHSTR,.AMHSTR)
 S AMHDM=$P(AMHSTR,P)
 S AMHREC=$P(AMHSTR,P,2)
 S AMHP=$P(AMHSTR,P,3)
 S AMHNARR=$P(AMHSTR,P,4)
 D A^AMHGETP(AMHREC,AMHNARR,1800)
 S @RETVAL@(AMHI)="T00030Result"_$C(30)
 S AMHI=AMHI+1
 S @RETVAL@(AMHI)=$S($G(AMHER)]"":AMHER,1:AMHREC)_$C(30)
 S @RETVAL@(AMHI+1)=$C(31)
 Q
 ;
RD(RETVAL,AMHSTR) ;save review data, called from clsTreatmentPlanDataEntry.SaveReviewData method
 S X="MERR^AMHGU",@^%ZOSF("TRAP") ; m error trap
 N AMHI,P,R,AMHDM,AMHREC,AMHP,AMHRD,AMHRDP,AMHRPS,RD,RDP,RPS,AMHER
 S P="|",R="~"
 S RETVAL="^AMHTMP("_$J_")"
 S AMHI=0
 K ^AMHTMP($J)
 I $G(AMHSTR)="" D CATSTR^AMHGU(.AMHSTR,.AMHSTR)
 S AMHDM=$P(AMHSTR,P)
 S AMHREC=$P(AMHSTR,P,2)
 S AMHP=$P(AMHSTR,P,3)
 S AMHRD=$P(AMHSTR,P,4)
 S AMHRDP=$P(AMHSTR,P,5)
 S AMHRPS=$P(AMHSTR,P,6)
 D ARRAY^AMHGU(.RD,AMHRD)
 D ARRAY^AMHGU(.RDP,AMHRDP)
 D ARRAY^AMHGU(.RPS,AMHRPS)
 D RD^AMHGETP(AMHREC,.RD,.RDP,.RPS)
 S @RETVAL@(AMHI)="T00030Result"_$C(30)
 S AMHI=AMHI+1
 S @RETVAL@(AMHI)=$S($G(AMHER)]"":AMHER,1:AMHREC)_$C(30)
 S @RETVAL@(AMHI+1)=$C(31)
 Q
 ;
DEL(RETVAL,AMHSTR) ;-- mark a record as deleted
 S X="MERR^AMHGU",@^%ZOSF("TRAP") ; m error trap
 N AMHI,P,R,AMHDM,AMHREC,AMHER
 S P="|",R="~"
 S RETVAL="^AMHTMP("_$J_")"
 S AMHI=0
 I $G(AMHSTR)="" D CATSTR^AMHGU(.AMHSTR,.AMHSTR)
 K ^AMHTMP($J)
 S AMHREC=$P(AMHSTR,P)
 S DIK="^AMHPTXP(",DA=AMHREC D ^DIK
 S @RETVAL@(AMHI)="T00030Result"_$C(30)
 S AMHI=AMHI+1
 S @RETVAL@(AMHI)=$S($G(AMHER)]"":AMHER,1:AMHREC)_$C(30)
 S @RETVAL@(AMHI+1)=$C(31)
 Q
 ;
