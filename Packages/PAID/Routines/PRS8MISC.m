PRS8MISC ;HISC/DAD,RM,RS-MISCELLANEOUS ADJUSTMENTS TO TIME CARD ;11/19/02
 ;;4.0;PAID;**56,68,80**;Sep 21, 1995
 N ABUT,AL,D,DY,DYWK,FLG,M,NOTIME,NUM,NL,NONP,NP,PEROWK,RL,WEEK,WP
 I TYP["D" F X=1,2 D
 .S (FLG(X),DYWK(X),NL(X),NONP(X),NP(X),NUM(X),RL(X),WP(X))=0
 S (PEROWK,NOTIME,PEROT,NOOT)=0 F DY=0:1:15 D
 .S WEEK=$S(DY>7:2,1:1)
 .S X=$G(^TMP($J,"PRS8",DY,2)),Y=$G(^("W"))
 .I TYP["D",DY>0,DY<15 D  ; Set counts for Daily Employees.
 ..S AL=$P(X,"^",3)
 ..I AL="NP" S NP(WEEK)=NP(WEEK)+1    ; Non Pay for all days of week
 ..I $D(^TMP($J,"PRS8",DY,"NL")) S NL(WEEK)=NL(WEEK)+1
 ..;
 ..Q:$G(^TMP($J,"PRS8",DY,"OFF"))=1  ;QUIT if the Non-Duty Day.
 ..;
 ..; The DYWK array keeps track of the number of days per week that
 ..; a full time daily employee is scheduled to work.  This will be 
 ..; used in AUTOLVCH^PRS8MSC1 to adjust leave charges.
 ..S DYWK(WEEK)=DYWK(WEEK)+1
 ..;
 ..I AL="HX" S FLG(WEEK)=FLG(WEEK)+1   ; Holiday eXcused
 ..I AL="AL" S NUM(WEEK)=NUM(WEEK)+1   ; Annual Leave
 ..I AL="WP" S WP(WEEK)=WP(WEEK)+1     ; leave Without Pay
 ..I AL="RL" S RL(WEEK)=RL(WEEK)+1     ; Restored annual Leave
 ..I AL="NP" S NONP(WEEK)=NONP(WEEK)+1 ; NON Pay on a scheduled work day
 ..Q
 .F M=1:1:96 S X=$E(Y,M) Q:'$L(X)  D  ; check for CB/FF OT and sleep time
 ..I "4EO"'[X!(X="O"&($E($G(^TMP($J,"PRS8",DY,"HOL")),M)=2)) S NOOT=0 ; set up periods of OT for PPD
 ..E  D
 ...S:'NOOT PEROT=PEROT+1,PEROT(PEROT)=DY_"^"_M_"^",NOOT=1
 ...S PEROT(PEROT)=PEROT(PEROT)_X
 ...Q
 ..I (TYP'["Ff"),SST,$E(ENT,27) D  ; set up per. of work for sleep time
 ...I "123OmosEeBbCct"'[X S NOTIME=0
 ...E  D
 ....S:'NOTIME PEROWK=PEROWK+1,PEROWK(PEROWK)=DY_U_M_U_M_U,NOTIME=1
 ....S $P(PEROWK(PEROWK),U,3)=M+(96*(DY-PEROWK(PEROWK)))
 ....S PEROWK(PEROWK)=PEROWK(PEROWK)_X
 ....S:$L($P(PEROWK(PEROWK),"^",4))=96 NOTIME=0
 ....Q
 ...Q
 ..Q
 .;holiday worked < 2 hrs
 .I DY<15,$E(ENT,TOUR+21) S HW=$G(^TMP($J,"PRS8",DY,"HW")) I HW]"" D
 ..S W=$G(^TMP($J,"PRS8",DY,"W"))
 ..S W1=$G(^TMP($J,"PRS8",DY-1,"W"))
 ..S W2=$G(^TMP($J,"PRS8",DY+1,"W"))
 ..F X=1:2 S Y=$P(HW,"^",X,X+1) Q:Y'>0  D
 ...N X,START,STOP,T,TT,Z,DD
 ...S START=+Y,STOP=$P(Y,"^",2),T=START,TT=$S(T>96:T-96,1:T)
 ...; Look back to determine if the segment of time currently being
 ...; checked abuts another segment of a Tour of Duty.  Ignore meals.
 ...S (ABUT,Z,X)=0
 ...I STOP-START+1<8 D
 ....F Z=1:1 D  Q:X=0
 .....S DD=Z I T>96 S X=0 Q
 .....I TT-DD>0 S X=$E(W,TT-DD)
 .....E  S X=$E(W1,96+T-DD)
 .....I "Cc123"[X,"01"[$E($G(^TMP($J,"PRS8",$S(TT-DD>0:DY,1:DY-1),"HOL")),$S(TT-DD>0:TT-DD,1:96+T-DD)) S X=0 ; Abuts HX
 .....I X="O",$E($G(^TMP($J,"PRS8",$S(TT-DD>0:DY,1:DY-1),"HOL")),$S(TT-DD>0:TT-DD,1:96+T-DD))=2 S X=0,ABUT=1 ; Abuts another segment of work
 ....;
 ....; Look forward to determine if the segment of time currently being
 ....; checked abuts another segment of a Tour of Duty.  Ignore meals.
 ....S ZZ=Z S:X=0&Z ZZ=ZZ-1 S X=0,T=STOP,TT=$S(T>96:T-96,1:T)
 ....F Z=1:1 D  Q:X=0
 .....S DD=STOP-START+1+ZZ+Z
 .....I T+Z'>96 S X=$E(W,T+Z)
 .....E  S X=$E(W2,T-96+Z)
 .....I "Cc123"[X,"01"[$E($G(^TMP($J,"PRS8",$S(T+Z'>96:DY,1:DY+1),"HOL")),$S(T+Z'>96:T+Z,1:T-96+Z)) S X=0 ; Abuts HX
 .....I X="O",$E($G(^TMP($J,"PRS8",$S(T+Z'>96:DY,1:DY-1),"HOL")),$S(T+Z'>96:T+Z,1:T-96+Z))=2 S X=0,ABUT=1 Q  ; Abuts another segment of work
 ...;
 ...; Loops to determine how much time we might need to add.
 ...S START=+Y,STOP=$P(Y,"^",2),T=START,TT=$S(T>96:T-96,1:T)
 ...S (Z,X)=0 F Z=1:1:8-(STOP-START+1) D  Q:X=0
 ....S DD=Z I T>96 S X=0 Q
 ....I TT-DD>0 S X=$E(W,TT-DD)
 ....E  S X=$E(W1,96+T-DD)
 ....I "Cc123m"[X,"01"[$E($G(^TMP($J,"PRS8",$S(TT-DD>0:DY,1:DY-1),"HOL")),$S(TT-DD>0:TT-DD,1:96+T-DD)) S X=0 ; HX becomes time off
 ....I X="O",$E($G(^TMP($J,"PRS8",$S(TT-DD>0:DY,1:DY-1),"HOL")),$S(TT-DD>0:TT-DD,1:96+T-DD))'=2 Q  ;S X=0,Z=8 ; non-holiday OT stops the check for <2hr HW
 ....I X="" S X=0
 ....Q
 ...S ZZ=Z S:X=0&Z ZZ=ZZ-1 S X=0,T=STOP,TT=$S(T>96:T-96,1:T)
 ...F Z=1:1:8-(STOP-START+1+ZZ) D  Q:X=0
 ....S DD=STOP-START+1+ZZ+Z
 ....I T+Z'>96 S X=$E(W,T+Z)
 ....E  S X=$E(W2,T-96+Z),PLUS=1
 ....I "Cc123m"[X,"01"[$E($G(^TMP($J,"PRS8",$S(T+Z'>96:DY,1:DY+1),"HOL")),$S(T+Z'>96:T+Z,1:T-96+Z)) S X=0 ; HX becomes time off
 ....I X="O",$E($G(^TMP($J,"PRS8",$S(T+Z'>96:DY,1:DY-1),"HOL")),$S(T+Z'>96:T+Z,1:T-96+Z))'=2 Q  ;S X=0,Z=8 ; non-holiday OT stops the check for <2hr HW
 ....Q
 ...S Z=ZZ+Z-(X=0&Z)
 ...I STOP-START+1+Z<8,'ABUT D
 ....S D=DY,P=TOUR+28,Y=8-(STOP-START+1+Z)
 ....S TL=$G(^TMP($J,"PRS8",D,0)),TL=4*($P(TL,"^",8)+$P(TL,"^",14))
 ....I Y+$P(WK($S(D>7:2,1:1)),"^",P)>TL S Y=TL-$P(WK($S(D>7:2,1:1)),"^",P)
 ....I $D(PLUS),T>96 S D=D+1
 ....D:Y SET
 ....Q
 ...Q
 ..Q
 .Q
 K PLUS G ^PRS8MSC0
 ;
SET ; Set sleep time into WK arrary
 Q:D<1!(D>14)
 S WEEK=$S(D>7:2,1:1)
 S $P(WK(WEEK),"^",P)=$P(WK(WEEK),"^",P)+Y
 Q
