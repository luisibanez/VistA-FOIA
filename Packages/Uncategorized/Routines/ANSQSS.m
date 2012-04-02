ANSQSS ;IHS/OIRM/DSD/CSC - CALCULATE NURSE STAFFING STATS; [ 02/25/98  10:32 AM ]
 ;;3.0;NURSING PATIENT ACUITY;;APR 01, 1996
 ;;CALCULATE NURSE STAFFING STATS
EN ;CHECK THROUGH ALL NUSRING RECORDS BY DATE OF RECORD
 K ^TMP("ANS",$J)
 D LEVELS
 D FACTORS
 S ANSD=ANSBDT-1
 F  S ANSD=$O(^ANSR("B",ANSD)) Q:'ANSD!(ANSD>ANSEDT)  D EN1  ;CSC 12-97
 D B1
 Q
EN1 ;CHECK THROUGH EACH RECORD FOR SPECIFIED DATE
 ;IF THE RECORD MATCHES THE UNIT FOR WHICH THE REPORT IS REQUESTED
 ;EVALUATE THE RECORD
 ;ANSD = DATE
 ;ANSN = IEN OF THE NURSING RECORD
 ;ANSUNIT = NURSING UNIT FOR THE REQUESTED REPORT
 S ANSN=0
 F  S ANSN=$O(^ANSR("B",ANSD,ANSN)) Q:ANSN=""  D
 .Q:$P($G(^ANSR(ANSN,0)),U,3)'=ANSUNIT
 .S X=^ANSR(ANSN,0),ANSSH=$P(X,U,2),ANSTY=$P(X,U,5)
 .I ANSTY'="O" D DC:ANSTY="D",ADM:ANSTY="A" Q
 .D SBCL
 .I ANSCL S P=ANSCL,S="O",A=1 D SBADD
 Q
ADM ;SET INFO FOR EACH ADMISSION
 S ANSCL=1,L=0,M=99,D=$O(^ANSR(ANSN,"AT",0))
 I D F  S N=$O(^ANSR(ANSN,"AT",D,N)) Q:N<1  D
 .I $D(^ANSR(N,0)),$P(^(0),U,5)="O" S S=$P(^(0),U,2) I S,S<M S M=S,L=N
 I L S ANSX=ANSN,ANSN=L D SBCL S ANSN=ANSX
 S P=ANSCL,S="A",A=1
 S:'P P=1
 D SBADD
 Q
DC ;SET INFO FOR EACH DISCHARGE
 S P=7,S="O",A=1
 D SBADD
 Q
B1 ;CALCULATE THE TOTAL NURSING HOURS AVAILABLE AND TOTALS FOR EACH DAY
 S ANSD=ANSBDT-1
 F  S ANSD=$O(^ANS("AU",ANSD)) Q:ANSD=""!(ANSD>ANSEDT)  D B3
 D ^ANSQSS1
 Q
B3 ;CALCULATE NURSING HOURS AVAILABLE
 S ANSSH=""
 F  S ANSSH=$O(^ANS("AU",ANSD,ANSUNIT,ANSSH)) Q:ANSSH=""  D
 .S ANSN=""
 .F  S ANSN=$O(^ANS("AU",ANSD,ANSUNIT,ANSSH,ANSN)) Q:ANSN=""  D
 ..Q:'$D(^ANS(ANSN,0))  S A=$P(^(0),U,4)+$P(^(0),U,5),P=1,S="H"
 ..D SBADD
 ..S L=0,N=0
 ..F I=1:1 S N=$O(^ANS(ANSN,"N",N)) Q:N<1  I $D(^(N,0)) S L=L+$P(^(0),U,2)
 ..S A=L,P=2,S="H" D SBADD
 Q
SBADD ;SET TEMP GLOBAL WITH INFO FOR REPORT
 ;S = "A" FOR ADMISSION, "O" FOR OBSERVATION, "H" HOURS AVAILABLE
 ;P = PIECE AT WHICH DATA IS TO BE STORED
 ;A = VALUE TO BE ADDED TO THE GLOBAL NODE
 S $P(^TMP("ANS",$J,ANSD,ANSSH,S),U,P)=$P($G(^TMP("ANS",$J,ANSD,ANSSH,S)),U,P)+A
 Q
SBCL ;CALCULATE THE LEVEL OF CARE FOR THE NURSING RECORD
 ;ANSCL = CARE LEVEL
 ;N = LEVEL & NUMBER OF POINTS FOR EACH OF THE 10 CRITERION
 ;L = TOTAL NUMBER OF POINTS
 S (L,ANSCL)=0
 F I=1:1:10 I $D(^ANSR(ANSN,"L",I,0)) S N=$P(^(0),U,2) D:N
 .S X=$G(^ANSD(59,N,0))
 .I N>4,$P(X,U,N) S N=$P(X,U,N)
 .S L=L+N
 S N=0
 F  S N=$O(^ANSR(ANSN,"F",N)) Q:N<1  I $D(ANSF(+N)) S F=ANSF(+N) S:F="+" L=L+4 S:F="-" L=L-4
 S L=$O(ANSL(L-1))
 I L S ANSCL=ANSL(L)
 Q
LEVELS ;SET ARRAYS OF CARE LEVEL INFORMATION
 ;L = NUMBER OF POINTS PER LEVEL
 ;ANSL(L) = ARRAY OF LEVELS BY NUMBER OF POINTS PER LEVEL
 ;ANSH(L) = ARRAY OF LEVELS BY LEVEL NUMBER (1-6)
 ;ANSA(L) = ARRAY OF LEVELS BY HOURS REQUIRED FOR ADMISSION
 S N=0
 F  S N=$O(^ANSD(51.1,1,"K",N)) Q:N<1  D
 .S X=$G(^ANSD(51.1,1,"K",N,0))
 .S:X]"" L=$P(X,U,5),ANSL(N)=L,ANSH(L)=$P(X,U,4),ANSA(L)=$P(X,U,6)
 Q
FACTORS ;SETS ARRAY OF ADJUSTMENT FACTORS
 ;N = IEN OF THE ADJUSTMENT FACTOR
 ;S = WHETHER THE FACTOR ADDS '+' OR DECREASES '-' NURSING TIME REQUIRED
 S N=0
 F  S N=$O(^ANSD(59.3,N)) Q:N<1  S S=$P($G(^(N,0)),U,3) S:S]"" ANSF(N)=S
 Q