PRSATPE ;HISC/REL-Find Exceptions ;12/08/05
 ;;4.0;PAID;**26,34,69,102**;Sep 21, 1995
 K ER S (ECNT,FATAL)=0,X0=$G(^PRST(458,PPI,"E",DFN,"D",DAY,0)),STAT=$P($G(^(10)),"^",1)
 N MLTIME S MLTIME=0
 S TC=$P(X0,"^",2) I 'TC S ER(1)=$P($T(ERTX+1),";;",2),FATAL=1 G EX
 I "1 3 4"'[TC,STAT="" S ER(1)=$P($T(ERTX+2),";;",2),FATAL=1 G EX
 S X2=$G(^PRST(458,PPI,"E",DFN,"D",DAY,2)) G:X2="" EX S X1=$G(^(1)),X4=$G(^(4))
 K TM I X2["OT"!(X2["CT") D TM
 K T F K=1:3 Q:$P(X1,"^",K)=""  S Z=$P(X1,"^",K+2) I $S('Z:1,1:$P($G(^PRST(457.2,Z,0)),"^",2)="RG") D
 .S X=$P(X1,"^",K,K+1) D CNV^PRSATIM S Z1=$P(Y,"^",1),Z2=$P(Y,"^",2) D V0
 .I Z1'="",$G(T(Z1))="*" K T(Z1) S T(Z2)="*" Q
 .S T(Z1)="",T(Z2)="*" Q
 I X4'="" F K=1:3 Q:$P(X4,"^",K)=""  S Z=$P(X4,"^",K+2) I $S('Z:1,1:$P($G(^PRST(457.2,Z,0)),"^",2)="RG") D
 .S X=$P(X4,"^",K,K+1) D CNV^PRSATIM S Z1=$P(Y,"^",1),Z2=$P(Y,"^",2) D V0
 .I Z1'="",$G(T(Z1))="*" K T(Z1) S T(Z2)="*" Q
 .S T(Z1)="",T(Z2)="*" Q
 ;
 ; Checks for Daily employees
 I "^"[$P(X2,"^",1,2) S TT=$P(X2,"^",3),K=1,DN=0,Y0="" G L0
 F K=1:4:25 S X=$P(X2,"^",K,K+1) I "^"'[X D
 .S TT=$P(X2,"^",K+2)
 .D CNV^PRSATIM S Y0=Y,Z1=$P(Y,"^",1),Z2=$P(Y,"^",2) D V1 S TIM=Z2-Z1/60
 .I TT="ML" S MLTIME=MLTIME+TIM
 .S Z1=$O(T(Z1)) S:Z1'="" Z1=T(Z1)
 .S Z2=$O(T(Z2-1)) S:Z2'="" Z2=T(Z2)
 .I TT="UN" D UN^PRSATPH Q
 .I "CT OT ON SB RG"[TT D OT Q
 .D LV Q
 ;
 ; Check for a minimum of 1 hour ML
 ;
 I TT="ML",MLTIME<1 S ER(1)=$P($T(ERTX+14),";;",2),FATAL=1 G EX
 ;
EX Q
V0 I Z2>Z1 S:$O(T(""))'<Z2 Z1=Z1+1440,Z2=Z2+1440 Q
 S Z2=Z2+1440 Q
V1 S DN=0 I Z2>Z1 Q:"CT OT ON SB UN RG"[TT  S:$O(T(""))'<Z2 Z1=Z1+1440,Z2=Z2+1440,DN=2 Q
 S Z2=Z2+1440,DN=1 Q
OT ; Check OT/CT Request
 I Z1'=""!(Z2'="") D O2 I $G(ERR)=6 S FATAL=1 D ERR
 I DN=1,$O(T(1440))="" D NX^PRSATPH
 I 'DN,$O(T(""))=""!($P(Y0,"^",1)'>$O(T(""))) D PR^PRSATPH
 I "ON SB RG"[TT Q
 ; check status of request(s)
 S DTI=$P($G(^PRST(458,PPI,1)),U,DAY) Q:'DTI
 S STAT="" ; init highest status var
 S DA=0 F  S DA=$O(^PRST(458.2,"AD",DFN,DTI,DA)) Q:'DA  D  Q:STAT="A"
 . S Z=$G(^PRST(458.2,DA,0))
 . Q:$P(Z,"^",5)'=TT  ; ignore different type
 . I $F("RSA",$P(Z,U,8))>$F("RSA",STAT) S STAT=$P(Z,U,8) ; higher status
 I STAT="" S ERR=3 D ERR Q  ; none with requested or higher status
 I STAT'="A" D  Q  ; none approved
 . S ERR=$S(STAT="R":8,1:9) D ERR
 . ; check posted hours vs requested since no approved request
 . S TM(TT,"R")=$G(TM(TT,"R"))-TIM I TM(TT,"R")<0 S ERR=7 D ERR
 ; check posted hours vs approved since we have an approved request
 S TM(TT,"A")=$G(TM(TT,"A"))-TIM I TM(TT,"A")<0 S ERR=13 D ERR
 Q
O2 ; Check for valid with-in tour or cross-tour situations
 I TT="ON"&(X2["HX") Q
 ;I "OT CT"[TT,TIM'>1 Q
 S ERR=6 Q
TM ; Get OT,CT request,approve times
 S DTI=$P($G(^PRST(458,PPI,1)),"^",DAY),DA=0 Q:'DTI
T1 S DA=$O(^PRST(458.2,"AD",DFN,DTI,DA)) I 'DA Q
 S Z=$G(^PRST(458.2,DA,0)),STAT=$P(Z,"^",8) I STAT'="","XD"[STAT G T1
 S TT=$P(Z,"^",5) I TT'="OT",TT'="CT" G T1
 S TM(TT,"R")=$G(TM(TT,"R"))+$P(Z,"^",6) ; requested sum
 I STAT="A" S TM(TT,"A")=$G(TM(TT,"A"))+$P(Z,"^",6) ; approved sum
 G T1
LV ; Check Leave Request
 I TC=3!(TC=4) Q
 I TC=1,TT="HW" Q
 I Z1'="*"!(Z2'="*") S ERR=5,FATAL=1 D ERR
 ;
L0 N REMARK S REMARK=$P(X2,"^",K+3)
 Q:REMARK&(REMARK'=15&(REMARK'=16))
 I "HX"[TT D HENCAP
 Q:"RG CP NP HX HW TR TV"[TT
 S DTI=$P($G(^PRST(458,PPI,1)),"^",DAY) Q:'DTI  S (DT1,DT2)=DTI
 I DN D D2 S:DN=2 DT1=DT2
 S DTIN=9999999-DT2,DA=0
 F KK=0:0 S KK=$O(^PRST(458.1,"AD",DFN,KK)) G:KK=""!(KK>DTIN) L3 F DA=0:0 S DA=$O(^PRST(458.1,"AD",DFN,KK,DA)) Q:DA=""  I ^(DA)'>DT1 D L1 G:LF L4
 Q
L1 S Z=$G(^PRST(458.1,DA,0)),LF=0 Q:$P(Z,"^",7)'=TT  S STAT=$P(Z,"^",9) I "XD"[STAT Q
 G:Y0="" L2 S Z1=$P(Y0,"^",1),Z2=$P(Y0,"^",2)
 S X=$P(Z,"^",4)_"^"_$P(Z,"^",6) D CNV^PRSATIM
 I $P(Z,"^",3)=DT1,$P(Y,"^",1)>Z1 Q
 I $P(Z,"^",5)=DT2,$P(Y,"^",2)<Z2 Q
L2 I STAT'="A" S ERR=4 D ERR
 S LF=1 Q
L3 S ERR=3 D ERR Q
L4 Q
D2 I DAY<14 S DT2=$P($G(^PRST(458,PPI,1)),"^",DAY+1) Q
 N X1,X2 S X1=DT1,X2=1 D C^%DTC S DT2=X Q
 ;
HENCAP ; Check for Holiday encapsulated by non-pay
 N DAH,DBH,HOL,QUIT
 S (DAH,DBH,HOL,QUIT)=""
 D HENCAP^PRSATP4(PPI,DFN,DAY,.DBH,.HOL,.DAH,.QUIT)
 Q:QUIT
 Q:HOL=""
 S ERR=15 D ERR Q  ; Holiday in current PP
 Q
 ;
ERR ; Set Error
 S ECNT=ECNT+1,ER(ECNT)=TT_$P($T(ERTX+ERR),";;",2)_"^"_$P(X2,"^",K) Q
ERTX ;;
1 ;;No Tour Entered^
2 ;;No Time Posted^
3 ;; not Requested
4 ;; Requested but not Approved
5 ;; Posted outside of Tour Hours
6 ;; Posted within Tour Hours
7 ;; Posted exceeds Requested Hours
8 ;; Requested but pending Supervisor Approval
9 ;; Supervisor Approved but pending Director Approval
10 ;; Overlaps with the start of the next day's Tour
11 ;; Overlaps with the prior day's Tour
12 ;; can only be posted against OT, CT, ON, & SB in Tour
13 ;; Posted exceeds Approved Hours
14 ;; The minimum charge for Military Leave is one hour
15 ;; was encapsulated by non-pay
