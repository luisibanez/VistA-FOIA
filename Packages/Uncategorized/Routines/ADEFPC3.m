ADEFPC3 ; IHS/HQT/MJL  - F- COMPLIANCE PART 3 ;04:02 PM  [ 03/24/1999   9:04 AM ]
 ;;6.0;ADE;;APRIL 1999
SYSTOT ;EP - ------->SYSTEM & SU TOTALS
 ;SYSTEM TOTALS FORMAT IS "TOTAL COUNT^NATURAL^OPTIMAL^WTD AVG^SAMP/MO"
 ;AREA & SU TOTALS FORMAT IS "TOTAL POPULATION"
 S ADETMON=$P(^TMP("ADEFPC",ADEU),U,4)
 S ADECUR=ADEEM
 D LENGTH^ADEFPC1
 S X1=ADEEM_ADECML,X2=$S(ADEABSMO<ADEBM:ADEBM_"00",1:ADEABS)
 D ^%DTC
 S:ADEBM>ADEABSMO X=X+1
 S ADETDAY=X
 ;
 ;SYSTEM TOTALS:
 S ^TMP("ADEFPC",ADEU,ADEAREA,ADESU,ADEWSNAM)=ADETCNT_U_ADENAT_U_ADEOPT_U_$J((ADETPPM/ADETDAY),4,1)_U_$J((ADETCNT/ADETMON),4,1) ;^TMP is a transient report global
 ;SU TOTALS:
 I $D(^TMP("ADEFPC",ADEU,ADEAREA,ADESU))[0 D
 . S ^TMP("ADEFPC",ADEU,ADEAREA,ADESU)=0
 . S $P(^TMP("ADEFPC",ADEU,ADEAREA,ADESU),U,2)=ADESUNAM
 S $P(^TMP("ADEFPC",ADEU,ADEAREA,ADESU),U)=+^TMP("ADEFPC",ADEU,ADEAREA,ADESU)+ADEPOP
 ;AREA TOTALS:
 I $D(^TMP("ADEFPC",ADEU,ADEAREA))[0 D
 . S ^TMP("ADEFPC",ADEU,ADEAREA)=0
 . S $P(^TMP("ADEFPC",ADEU,ADEAREA),U,2)=ADEARNAM
 S $P(^TMP("ADEFPC",ADEU,ADEAREA),U)=+^TMP("ADEFPC",ADEU,ADEAREA)+ADEPOP
 Q
 ;
PCOMP ;EP - CALCULATE PERCENT COMPLIANCE, SAMPLES/SYSTEM/MONTH
 N ADEAREA,ADESU,ADETPOP,ADECPOP,ADEPPOP,ADESYS1,ADESYS2,ADESAM1,ADESAM2
 S ADEAREA=0
 F  S ADEAREA=$O(^TMP("ADEFPC",ADEU,ADEAREA)) Q:ADEAREA=""  D
 . S ADETPOP=+^TMP("ADEFPC",ADEU,ADEAREA)
 . S:ADETPOP=0 ADETPOP=1
 . S ADEMO=0
 . F  S ADEMO=$O(^TMP("ADEFPC",ADEU,ADEAREA,"MO",ADEMO)) Q:'+ADEMO  D
 . . S ADECPOP=$P(^TMP("ADEFPC",ADEU,ADEAREA,"MO",ADEMO),U,6)
 . . S ADEPPOP=(ADECPOP/ADETPOP)*100
 . . S ADEPPOP=$J(ADEPPOP,3,0)
 . . S $P(^TMP("ADEFPC",ADEU,ADEAREA,"MO",ADEMO),U,7)=ADEPPOP
 S ADEAREA=0
 F  S ADEAREA=$O(^TMP("ADEFPC",ADEU,ADEAREA)) Q:ADEAREA=""  D
 . S ADESU=0
 . F  S ADESU=$O(^TMP("ADEFPC",ADEU,ADEAREA,ADESU)) Q:'+ADESU  D
 . . S ADETPOP=+^TMP("ADEFPC",ADEU,ADEAREA,ADESU)
 . . S:ADETPOP=0 ADETPOP=1
 . . S ADEMO=0
 . . F  S ADEMO=$O(^TMP("ADEFPC",ADEU,ADEAREA,ADESU,"MO",ADEMO)) Q:'+ADEMO  D
 . . . S ADECPOP=$P(^TMP("ADEFPC",ADEU,ADEAREA,ADESU,"MO",ADEMO),U,6)
 . . . S ADEPPOP=(ADECPOP/ADETPOP)*100
 . . . S ADEPPOP=$J(ADEPPOP,3,0)
 . . . S $P(^TMP("ADEFPC",ADEU,ADEAREA,ADESU,"MO",ADEMO),U,7)=ADEPPOP
 S ADEAREA=0
 F  S ADEAREA=$O(^TMP("ADEFPC",ADEU,ADEAREA)) Q:ADEAREA=""  D
 . S ADESAM1=0,ADESYS1=0
 . S ADESU=0
 . F  S ADESU=$O(^TMP("ADEFPC",ADEU,ADEAREA,ADESU)) Q:'+ADESU  D
 . . S ADESAM2=0,ADESYS2=0
 . . S ADESYS=0
 . . F  S ADESYS=$O(^TMP("ADEFPC",ADEU,ADEAREA,ADESU,ADESYS)) Q:'+ADESYS  D
 . . . S ADESAM2=ADESAM2+^TMP("ADEFPC",ADEU,ADEAREA,ADESU,ADESYS)
 . . . S ADESYS2=ADESYS2+1
 . . S $P(^TMP("ADEFPC",ADEU,ADEAREA,ADESU),U,3)=ADESAM2
 . . S $P(^TMP("ADEFPC",ADEU,ADEAREA,ADESU),U,4)=ADESYS2
 . . S $P(^TMP("ADEFPC",ADEU,ADEAREA,ADESU),U,5)=$J((ADESAM2/ADESYS2/ADETMON),4,1)
 . . S ADESAM1=ADESAM1+ADESAM2
 . . S ADESYS1=ADESYS1+ADESYS2
 . S $P(^TMP("ADEFPC",ADEU,ADEAREA),U,3)=ADESAM1
 . S $P(^TMP("ADEFPC",ADEU,ADEAREA),U,4)=ADESYS1
 . S $P(^TMP("ADEFPC",ADEU,ADEAREA),U,5)=$J((ADESAM1/ADESYS1/ADETMON),4,1)
 K ADEAREA,ADESU,ADETPOP,ADECPOP,ADEPPOP,ADESYS1,ADESYS2,ADESAM1,ADESAM2
 Q
 ;
ARSET ;EP - ------->SET AREA MONTHLY NODE
 ;
 I '$D(^TMP("ADEFPC",ADEU,ADEAREA,"MO",ADECUR)) D
 . S ^TMP("ADEFPC",ADEU,ADEAREA,"MO",ADECUR)="0^0^0^0^0^0"
 I $P(^TMP("ADEFPC",ADEU,ADEAREA,ADESU,ADEWSNAM,ADECUR),"^",3)["Y" D
 . S $P(^TMP("ADEFPC",ADEU,ADEAREA,"MO",ADECUR),"^")=$P(^TMP("ADEFPC",ADEU,ADEAREA,"MO",ADECUR),"^")+1
 E  S $P(^TMP("ADEFPC",ADEU,ADEAREA,"MO",ADECUR),"^",2)=$P(^TMP("ADEFPC",ADEU,ADEAREA,"MO",ADECUR),"^",2)+1
 I $P(^TMP("ADEFPC",ADEU,ADEAREA,ADESU,ADEWSNAM,ADECUR),U,4)="Y" D
 . S $P(^TMP("ADEFPC",ADEU,ADEAREA,"MO",ADECUR),U,3)=$P(^TMP("ADEFPC",ADEU,ADEAREA,"MO",ADECUR),U,3)+1
 . S $P(^TMP("ADEFPC",ADEU,ADEAREA,"MO",ADECUR),U,6)=$P(^TMP("ADEFPC",ADEU,ADEAREA,"MO",ADECUR),U,6)+ADEPOP
 E  S $P(^TMP("ADEFPC",ADEU,ADEAREA,"MO",ADECUR),U,4)=$P(^TMP("ADEFPC",ADEU,ADEAREA,"MO",ADECUR),U,4)+1
 I $P(^TMP("ADEFPC",ADEU,ADEAREA,ADESU,ADEWSNAM,ADECUR),U)=0 D
 . S $P(^TMP("ADEFPC",ADEU,ADEAREA,"MO",ADECUR),U,5)=$P(^TMP("ADEFPC",ADEU,ADEAREA,"MO",ADECUR),U,5)+1
 Q
