DGPTX110 ; ;10/29/04
 S X=DE(15),DIC=DIE
 D KILL^DGREGDD1(DA,.116,.11,6,$E(X,1,5))
 S X=DE(15),DIC=DIE
 D EVENT^IVMPLOG(DA)
 S X=DE(15),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DPT(D0,.11)):^(.11),1:"") S X=$P(Y(1),U,13),X=X S DIU=X K Y S X=DIV S X=$$NOW^XLFDT() S DIH=$G(^DPT(DIV(0),.11)),DIV=X S $P(^(.11),U,13)=DIV,DIH=2,DIG=.118 D ^DICR
 S X=DE(15),DIC=DIE
 S IVMX=X,X="IVMPXFR" X ^%ZOSF("TEST") D:$T DPT^IVMPXFR S X=IVMX K IVMX
 S X=DE(15),DIC=DIE
 I ($T(AVAFC^VAFCDD01)'="") S VAFCF=".1112;" D AVAFC^VAFCDD01(DA)
 S X=DE(15),DIC=DIE
 D:($T(ADGRU^DGRUDD01)'="") ADGRU^DGRUDD01(DA)
 S X=DE(15),DIIX=2_U_DIFLD D AUDIT^DIET
