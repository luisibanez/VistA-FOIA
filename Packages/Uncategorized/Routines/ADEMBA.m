ADEMBA ; IHS/HQT/MJL  - COUNT BA'S IN ^ADEPAT ;  [ 03/24/1999   9:04 AM ]
 ;;6.0;ADE;;APRIL 1999
 ;INPUT (IN X) NUMBER OF DAYS IN PAST TO LOOK FOR BA'S
 ;RETURNS IN X THE NUMBER OF BA'S IN ^ADEPAT DURING PAST X DAYS
 ;(CALLED BY ADEBA FUNCTION)
 ;S X=2 ;REMOVE AFTER TESTING
 S X=-X,X1=DT,X2=X D C^%DTC K X1,X2
 I '$D(^ADEFOL(D0,0)) S X="ERR" G END
 I '+$P(^ADEFOL(D0,0),U) S X="ERR" G END
 I '$D(^ADEPAT($P(^ADEFOL(D0,0),U),"FA")) S X=0 G END
 S (ADER,ADES)=0 F ADEQ=0:0 S ADER=$O(^ADEPAT($P(^ADEFOL(D0,0),U),"FA",ADER)) Q:'+ADER  S:$P(^ADEPAT($P(^ADEFOL(D0,0),U),"FA",ADER,0),U)>X&($P(^(0),U,2)="b") ADES=ADES+1
 S X=ADES
END K ADEQ,ADER,ADES Q
