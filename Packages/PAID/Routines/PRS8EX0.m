PRS8EX0 ;HISC/MRL,WIRMFO/JAH-DECOMP,EXCEPTIONS(cont'd) ;8/30/2000
 ;;4.0;PAID;**2,22,56**;Sep 21, 1995
 ;
LOOP ; --- return here to continue backing up days
 ;
 ;   Loop forwards & backwards to find first working day 
 ;   after & prior to this day off
 ;
 ;   I TT(PRIOR)=TT(AFTER) S X=? D SET
 ;
 N HOLIDAY
 S HOLIDAY=0 I DY<1!(DY>14) G END
 S (BACK,FRONT)=PY_U_DY_U_0
 N QUIT
 ;
 ; check previous days until we find a working day or Holiday with
 ; this day as WP,NP, or SL
 ;
 S QUIT=0
 F  S $P(BACK,U,1,2)=$$WRKDAY(.BACK,-1) Q:+BACK(0)  D  Q:QUIT
 .; Set Quit if there was no working day in the current pay
 .; period or the previous pay period.
 .I $P(BACK,U,2)'>1&($P(BACK,U,1)=PPD(0)) S QUIT=1 Q
 .S $P(BACK,U,3)=1
 ;
 ; check future days until we find a working day or Holiday with
 ; this day as WP,NP, or SL
 ;
 S QUIT=0
 F  S $P(FRONT,U,1,2)=$$WRKDAY(.FRONT,1) Q:+FRONT(0)  D  Q:QUIT
 .; Set Quit if there was no working day in the current pay
 .; period or the next pay period.
 .I $P(FRONT,U,2)'<14&($P(FRONT,U,1)=PPD(15)) S QUIT=1 Q
 .S $P(FRONT,U,3)=1
 K QUIT
 ;
 ; IF we ran into a holiday both ways (with current day '= SL,NP,WP)
 ; OR IF the days on either side are work days THEN Quit.
 G END:((+FRONT(0)=2)&(+BACK(0)=2))!('$P(BACK,U,3)&'$P(FRONT,U,3))
 ;
 I $P(BACK,U,3),+BACK'=+PY D  ; days off which go into prior PPD
 . I $P(BACK(0),"^",2)]"",$P(DAY(DY,2),"^",3)=$P(BACK(0),"^",2) D
 ..; 
 ..; set days off when ??
 ..  I $P(BACK(0),"^",2)="SL",HOLIDAY=1 F Z=1:1:DY-2 D
 ...;  never charge leave on a holiday or a day that has already been
 ...;  counted by ENCAP^PRS8EX0.
 ...   I '($$HOLIDAY^PRS8UT(PY,DFN,Z)),'$D(^TMP($J,"PRS8",Z,2,0)) D
 ....     D SETOFF
 ....     D AUTO^PRSATP0
 ..  E  F Z=1:1:DY-1 D
 ...;  never charge leave on a holiday or a day that has already been
 ...;  counted by ENCAP^PRS8EX0.
 ...   I '$$HOLIDAY^PRS8UT(PY,DFN,Z),'$D(^TMP($J,"PRS8",Z,2,0)) D
 ....      D SETOFF
 ....      D AUTO^PRSATP0
 ..Q
 .Q
ENCAP ; Check to see if the scheduled days off fall within a period of 
 ; approved AL or a period or approved LWOP.  If they are then charge
 ; them as AL or LWOP respectively.
 ;
 I $P(FRONT,U,3) D  ; days off after this day
 .  I $P(FRONT(0),"^",2)="SL",HOLIDAY=1 S $P(FRONT,"^",2)=$P(FRONT,"^",2)-1
 .  S D=$S(+FRONT=+PY:$P(FRONT,U,2),1:15)
 .  I $P(FRONT(0),"^",2)]"",$P(DAY(DY,2),"^",3)=$P(FRONT(0),"^",2) D
 ..    F Z=DY+1:1:D-1 D
 ...;    never charge leave on a holiday or a day that has already been
 ...;    counted by ENCAP^PRS8EX0.
 ...     I '$$HOLIDAY^PRS8UT(PY,DFN,Z),'$D(^TMP($J,"PRS8",Z,2,0)) D
 ....       D SETOFF
 ....       D AUTO^PRSATP0
 ..Q
 .Q
 ;
END ; --- all done here     
 Q
 ;
WRKDAY(BACK,Y) ;function increments or decrements the day passed in BACK. 
 ; If the new day is a work day, the function returns true and the 
 ; posted type of work for that day in BACK(0).
 ;
 ;Variables
 ; BACK    = Contains 3 pieces delimited by ^ .
 ;           Piece 1 = pay period ien.
 ;           Piece 2 = current day number
 ;           Piece 3 = 0
 ; BACK(0) = Since BACK is called by reference this is returned
 ;           to the calling function.
 ;           it is set to false (0) if we didn't find a 
 ;           working day.
 ; Y       = Flag determines if we're looking fore or aft.
 ; DY      = Day number
 ; PY      = Pay period ien
 ; TT      = Type of time posted on the stationary day being examined.
 ;
 N DY,PY
 ;
 ; I don't see how Y can be anything but 1 or -1 since it is
 ; passed by value.
 I Y>14!(Y<-14) S BACK(0)=2 Q "-1^-1"
 ;
 S PY=+BACK,DY=+$P(BACK,"^",2)
 ;
 ; If not at bounds of pay period increment or decrement day,
 ; else we are at the last or first day & need to move into the 
 ; previous or next pay period respectively.
 ;
 I Y<0&(DY+Y>0)!(Y>0&(DY+Y<15)) S DY=DY+Y
 E  I Y<0 S DY=DY+Y+14,PY=+PPD(0)
 E  I Y>0 S DY=DY+Y-14,PY=+PPD(15)
 ;
 ; If this day is holiday & type of time is either (W/Out Pay,
 ; Non Pay, or Sick Leave) then quit.
 ;
 S HOLIDAY=$$HOLIDAY^PRS8UT(PY,DFN,DY)
 I HOLIDAY,TT'="WP",TT'="NP",TT'="SL",TT'="AL",TT'="RL" S BACK(0)=2 Q "-1^-1"
 ;
 ; If current day is a day off (tour of duty = 1) then return 
 ; back(0) as false,
 ; Or if current day is holiday excused & type of time is either
 ; (W/Out Pay, Non Pay, or Sick Leave) return back(0)=false & quit,
 ; Otherwise set BACK(0) = true^type of time posted on current day.
 ;
 I $P($G(^PRST(458,PY,"E",DFN,"D",DY,0)),"^",2)=1 S BACK(0)=0
 E  I $P($G(^PRST(458,PY,"E",DFN,"D",DY,2)),"^",3)="HX" D
 .I TT="WP"!(TT="NP")!(TT="SL")!(TT="AL")!(TT="RL") S BACK(0)=0
 E  S BACK(0)="1^"_$P($G(^PRST(458,PY,"E",DFN,"D",DY,2)),"^",3)
 ;
 Q PY_U_DY
 ;
SETOFF ; --- enter here to set days off
 N ZZ
 S ZZ=WK,WK=$S(Z<8:1,1:2),X=$P(TT(1),"^",4)
 I X]"" D
 .S DAY(DY,"W")=$P(TT(1),"^",3) D SET
 .I VAR="V" S X="M" D SET
 .Q
 S WK=ZZ
 Q
SET ; --- enter here to set without VAL defined
 ; Quit if this day has already been counted.
 ;
 Q:$D(^TMP($J,"PRS8",Z,2,0))
 ;
 I +X S $P(WK(WK),"^",+X)=$P(WK(WK),"^",+X)+1
 E  S X=$A(X)-64,$P(WK(3),"^",+X)=$P(WK(3),"^",+X)+1
 ;
 ; Update the ^TMP global denoting that this day has been charged
 ; because it was wholly within a period of AL or wholly within
 ; a period of LWOP.
 ; This will keep this day from being accidently counted twice.
 ;
 S ^TMP($J,"PRS8",Z,2,0)=$S(X=1:"AL",X=2:"SL",X=3:"WP",X=6:"RL",1:"NP")
 Q
