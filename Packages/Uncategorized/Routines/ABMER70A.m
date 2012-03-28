ABMER70A ; IHS/ASDST/DMJ - UB92 EMC RECORD 70-1 (Medical) cont'd ;  
 ;;2.6;IHS 3P BILLING SYSTEM;;NOV 12, 2009
 ;Original;DMJ;
 ;
 ; IHS/SD/SDR - v2.5 p11 - NPI
 ; IHS/SD/SDR - v2.5 p13 - POA changes
 ;
 ; IHS/SD/SDR - v2.6 CSV
 ;
LOOP ;LOOP HERE
 F I=10:10:120 D
 .D @I
 .I $D(^ABMEXLM("AA",+$G(ABMP("INS")),+$G(ABMP("EXP")),70,I)) D @(^(I))
 .I '$G(ABMP("NOFMT")) S ABMREC(70)=$G(ABMREC(70))_ABMR(70,I)
 Q
 ;
10 ;Record type
 S ABMR(70,10)=70
 Q
 ;
20 ;Sequence 
 S ABMR(70,20)="01"
 Q
 ;
30 ;Patient Control Number, (SOURCE: FILE=9000001.41,FIELD=.02)
 S ABMR(70,30)=$$EX^ABMER20(30,ABMP("BDFN"))
 S ABMR(70,30)=$$FMT^ABMERUTL(ABMR(70,30),20)
 Q
 ;
40 ;Principle Diagnosis Code (SOURCE: FILE=9002274.4017 FIELD=.01)
 ; from locator #67
 D GET17
 S ABMR(70,40)=ABM(17,1)
 S ABMR(70,40,"POA")=$G(ABM(17,1,"POA"))
 S ABMR(70,40)=$$FMT^ABMERUTL(ABMR(70,40),6)
 Q
 ;
50 ;Other Diagnosis Code #1 (SOURCE: FILE=9002274.4017, FIELD=.01) 
 ; from locator #68
 D GET17
 S ABMR(70,50)=ABM(17,2)
 S ABMR(70,50,"POA")=$G(ABM(17,2,"POA"))
 S ABMR(70,50)=$$FMT^ABMERUTL(ABMR(70,50),6)
 Q
 ;
60 ;Other Diagnosis Code #2 (SOURCE: FILE=9002274.4017, FIELD=.01)
 ; from locator #69
 D GET17
 S ABMR(70,60)=ABM(17,3)
 S ABMR(70,60,"POA")=$G(ABM(17,3,"POA"))
 S ABMR(70,60)=$$FMT^ABMERUTL(ABMR(70,60),6)
 Q
 ;
70 ;Other Diagnosis Code #3 (SOURCE: FILE=9002274.4017, FIELD=.01)
 ; from locator #70
 D GET17
 S ABMR(70,70)=ABM(17,4)
 S ABMR(70,70,"POA")=$G(ABM(17,4,"POA"))
 S ABMR(70,70)=$$FMT^ABMERUTL(ABMR(70,70),6)
 Q
 ;
80 ;Other Diagnosis Code #4 (SOURCE: FILE=9002274.4017, FIELD=.01)
 ; from locator #71
 D GET17
 S ABMR(70,80)=ABM(17,5)
 S ABMR(70,80,"POA")=$G(ABM(17,5,"POA"))
 S ABMR(70,80)=$$FMT^ABMERUTL(ABMR(70,80),6)
 Q
 ;
90 ;Other Diagnosis Code #5 (SOURCE: FILE=9002274.4017, FIELD=.01)
 ; from locator #72
 D GET17
 S ABMR(70,90)=ABM(17,6)
 S ABMR(70,90,"POA")=$G(ABM(17,6,"POA"))
 S ABMR(70,90)=$$FMT^ABMERUTL(ABMR(70,90),6)
 Q
 ;
100 ;Other Diagnosis Code #6 (SOURCE: FILE=9002274.4017, FIELD=.01)
 ; from locator #73
 D GET17
 S ABMR(70,100)=ABM(17,7)
 S ABMR(70,100,"POA")=$G(ABM(17,7,"POA"))
 S ABMR(70,100)=$$FMT^ABMERUTL(ABMR(70,100),6)
 Q
 ;
110 ;Other Diagnosis Code #7 (SOURCE: FILE=9002274.4017, FIELD=.01)
 ; from locator #74
 D GET17
 S ABMR(70,110)=ABM(17,8)
 S ABMR(70,110,"POA")=$G(ABM(17,8,"POA"))
 S ABMR(70,110)=$$FMT^ABMERUTL(ABMR(70,110),6)
 Q
 ;
120 ;Other Diagnosis Code #8 (SOURCE: FILE=9002274.4017, FIELD=.01)     
 ; from locator #75
 D GET17
 S ABMR(70,120)=ABM(17,9)
 S ABMR(70,120,"POA")=$G(ABM(17,9,"POA"))
 S ABMR(70,120)=$$FMT^ABMERUTL(ABMR(70,120),6)
 Q
130 ;Other Diagnosis Code #9 (SOURCE: FILE=9002274.4017, FIELD=.01)     
 D GET17
 S ABMR(70,130)=$G(ABM(17,10))
 S ABMR(70,130,"POA")=$G(ABM(17,10,"POA"))
 S ABMR(70,130)=$$FMT^ABMERUTL(ABMR(70,130),6)
 Q
140 ;Other Diagnosis Code #10 (SOURCE: FILE=9002274.4017, FIELD=.01)     
 D GET17
 S ABMR(70,140)=$G(ABM(17,11))
 S ABMR(70,140,"POA")=$G(ABM(17,11,"POA"))
 S ABMR(70,140)=$$FMT^ABMERUTL(ABMR(70,140),6)
 Q
150 ;Other Diagnosis Code #11 (SOURCE: FILE=9002274.4017, FIELD=.01)     
 D GET17
 S ABMR(70,150)=$G(ABM(17,12))
 S ABMR(70,150,"POA")=$G(ABM(17,12,"POA"))
 S ABMR(70,150)=$$FMT^ABMERUTL(ABMR(70,150),6)
 Q
160 ;Other Diagnosis Code #12 (SOURCE: FILE=9002274.4017, FIELD=.01)     
 D GET17
 S ABMR(70,160)=$G(ABM(17,13))
 S ABMR(70,160,"POA")=$G(ABM(17,13,"POA"))
 S ABMR(70,160)=$$FMT^ABMERUTL(ABMR(70,160),6)
 Q
170 ;Other Diagnosis Code #13 (SOURCE: FILE=9002274.4017, FIELD=.01)     
 D GET17
 S ABMR(70,170)=$G(ABM(17,14))
 S ABMR(70,170,"POA")=$G(ABM(17,14,"POA"))
 S ABMR(70,170)=$$FMT^ABMERUTL(ABMR(70,170),6)
 Q
180 ;Other Diagnosis Code #14 (SOURCE: FILE=9002274.4017, FIELD=.01)     
 D GET17
 S ABMR(70,180)=$G(ABM(17,15))
 S ABMR(70,180,"POA")=$G(ABM(17,15,"POA"))
 S ABMR(70,180)=$$FMT^ABMERUTL(ABMR(70,180),6)
 Q
190 ;Other Diagnosis Code #15 (SOURCE: FILE=9002274.4017, FIELD=.01)     
 D GET17
 S ABMR(70,190)=$G(ABM(17,16))
 S ABMR(70,190,"POA")=$G(ABM(17,16,"POA"))
 S ABMR(70,190)=$$FMT^ABMERUTL(ABMR(70,190),6)
 Q
200 ;Other Diagnosis Code #16 (SOURCE: FILE=9002274.4017, FIELD=.01)     
 D GET17
 S ABMR(70,200)=$G(ABM(17,17))
 S ABMR(70,200,"POA")=$G(ABM(17,17,"POA"))
 S ABMR(70,200)=$$FMT^ABMERUTL(ABMR(70,200),6)
 Q
 ;
GET17 ;GET DIAGNOSES CODES FROM BILL FILE
 Q:$D(ABM(17))
 N I,J
 S I=0,CNT=0
 F  S I=$O(^ABMDBILL(DUZ(2),ABMP("BDFN"),17,"C",I)) Q:'I  D
 .S J=0
 .F  S J=$O(^ABMDBILL(DUZ(2),ABMP("BDFN"),17,"C",I,J)) Q:'J  D
 ..S CNT=CNT+1
 ..S ABM(17,CNT)=$P(^ABMDBILL(DUZ(2),ABMP("BDFN"),17,J,0),U) ; ICD Diagnosis IEN
 ..S ABM(17,CNT)=$P($$DX^ABMCVAPI(+ABM(17,CNT),ABMP("VDT")),U,2) ; ICD Diagnosis code  ;CSV-c
 ..I ABMP("EXP")=21!(ABMP("EXP")=28) S ABM(17,CNT,"POA")=$P($G(^ABMDBILL(DUZ(2),ABMP("BDFN"),17,J,0)),U,5)
 ..Q:$P($G(^ABMDEXP(ABMP("EXP"),1)),"^",5)'="E"
 ..S ABM(17,CNT)=$TR(ABM(17,CNT),".")
 F I=1:1:9 S:'$D(ABM(17,I)) ABM(17,I)=""
 Q
 ;
EX(ABMX,ABMY)      ;EXTRINSIC FUNCTION HERE
 ;
 ;  INPUT:  ABMX = data element
 ;          Y    = bill internal entry number
 ;
 ; OUTPUT:  Y    = bill internal entry number
 ;
 I '$G(ABMP("NOFMT")) S ABMP("FMT")=0
 D @ABMX
 S Y=ABMR(70,ABMX)
 I $D(ABMP("FMT")) S ABMP("FMT")=1
 K ABMR(70,ABMX),ABMX,ABMY
 Q Y
