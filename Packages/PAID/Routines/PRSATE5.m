PRSATE5 ; HISC/REL-Check for Tour Overlap ;7/20/93  14:34
 ;;4.0;PAID;;Sep 21, 1995
 F DAY=1:1:14 D CHK
 Q
CHK ; Check Second Tour if it exists
 S X1=$G(^PRST(458,PPI,"E",DFN,"D",DAY,1)),X2=$G(^(4))
 S X=$P(X1,"^",1) Q:X=""  S Y=0 D MIL^PRSATIM S T1=Y G:X2="" C1
 S X=$P(X2,"^",1) G:X="" C1 S Y=0 D MIL^PRSATIM S T2=Y S:T1>T2 X1=X2
 S X="" F K=1:3:19 S Z=$P(X1,"^",K+1) Q:Z=""  S X=Z
 G:X="" C1 S Y=1 D MIL^PRSATIM
 I T1<T2,Y>T2 S E1=0 D ERR
 I T1>T2 S Z=T1,T1=T2 I Y>Z S E1=0 D ERR
C1 ; Check against prior day
 I DAY=1 S TC=$P($G(^PRST(458,PPI-1,"E",DFN,"D",14,0)),"^",2),TC2=$P($G(^(0)),"^",13)
 E  S TC=$P($G(^PRST(458,PPI,"E",DFN,"D",DAY-1,0)),"^",2),TC2=$P($G(^(0)),"^",13)
 Q:'TC  I $P($G(^PRST(457.1,TC,0)),"^",5)="Y" S Z=1 G C2
 Q:'TC2  S Z=4 Q:$P($G(^PRST(457.1,TC2,0)),"^",5)'="Y"
C2 I DAY=1 S X1=$G(^PRST(458,PPI-1,"E",DFN,"D",14,Z))
 E  S X1=$G(^PRST(458,PPI,"E",DFN,"D",DAY-1,Z))
 S X="" F K=1:3:19 S Z=$P(X1,"^",K+1) Q:Z=""  S X=Z
 Q:X=""  S Y=1 D MIL^PRSATIM S T2=Y
 I T2>T1 S E1=DAY D ERR
 Q
ERR I E1 W *7,!!,"WARNING: Day ",E1," Tour overlaps with Prior Day" Q
 W *7,!!,"WARNING: Second Tour overlaps with First Tour" Q
