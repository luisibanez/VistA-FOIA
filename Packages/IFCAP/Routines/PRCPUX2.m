PRCPUX2 ;WISC/RFJ-extrinsic functions                              ;11 Jul 94
 ;;5.1;IFCAP;;Oct 20, 2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 Q
 ;
 ;
ISMSFLAG(SITE) ;  isms switch on|off for site
 ;  switch=0 or 1 for log code sheet format
 ;  switch=2 for isms code sheet formats
 N % S %=+$P($G(^PRC(411,+SITE,0)),"^",23)
 Q $S(1:1,%=0:1,1:%)
 ;
 ;
INPERCNT(V1,V2,V3,V4) ;  initialize percent graph
 ;  v1=total number of entries
 ;  v2=display character
 ;  v3=reverse video on (optional)
 ;  v4=reverse video off (optional)
 ;  returns number v2 to display per entry
 W !!?30,"% COMPLETE",!?10,"0   10   20   30   40   50   60   70   80   90   100"
 W !?10,"|----+----+----+----+----+----+----+----+----+----|"
 W !?10,V3,V2,V4
 S %=.02*V1,%=$S(%=0:50,1:1/%)
 Q %
 ;
 ;
SHPERCNT(V1,V2,V3,V4,V5,V6) ; display percent complete
 ;  v1=current entry number executed
 ;  v2=display this many v3 for each entry
 ;  v3=character to display
 ;  v4=reverse video on (optional)
 ;  v5=reverse vidoe off (optional)
 ;  return last one displayed
 N %
 S X=V1*V2\1 S:X>50 X=50 F %=((V1-1*V2\1)+1):1:X W V4,V3,V5 I $X>50,$D(PRCP("XY")) X PRCP("XY")
 Q X
 ;
 ;
QPERCNT(V1,V2,V3,V4) ;  finish percent display
 ;  v1=last v2 displayed
 ;  v2=character to display
 ;  v3=reverse video on (optional)
 ;  v4=reverse video off (optional)
 N %
 F %=V1+1:1:50 W V3,V2,V4 I $X>50,$D(PRCP("XY")) X PRCP("XY")
 Q
 ;
 ;
DISPLAY(DX1,DX2,X) ;  display message
 ;  dx1 = begin column
 ;  dx2 = end column
 ;  x = message
 N %,END,LENGTH,LINE,NEXT,PRCPFLAG,PRCPLINE,TEXT
 S LENGTH=DX2-DX1 I LENGTH<10 S (DX1,DX2)=1,LENGTH=79
 S DX1=DX1-1,DX2=DX2-1,PRCPLINE="",$P(PRCPLINE,"-",LENGTH)="",PRCPLINE="+"_PRCPLINE_"+"
 W !?DX1,PRCPLINE
 S LINE=0,TEXT=""
 F  D  I TEXT="",'$O(X(LINE)) Q
 .   ;
 .   ;  get more text if less than 240 characters
 .   F  D  Q:$G(PRCPFLAG)
 .   .   S NEXT=+$O(X(LINE))
 .   .   I NEXT,$L(TEXT)+$L($G(X(NEXT)))<240 S TEXT=TEXT_$S(TEXT'="":" ",1:"")_$G(X(NEXT)) K X(NEXT) Q
 .   .   S PRCPFLAG=1
 .   ;
 .   ;  fit text in window
 .   F END=LENGTH:-1:0 S %=$E(TEXT,END) I %=""!(%=" ") Q
 .   I END=0 S END=LENGTH
 .   W !?DX1,"|",$E(TEXT,1,END-1),?DX2,"|" S TEXT=$E(TEXT,END+1,255)
 W !?DX1,PRCPLINE
 Q
