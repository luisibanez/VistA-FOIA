PRS8VW1 ;HISC/MRL-DECOMPOSITION, VIEW RESULTS, CONT. ;8/23/01
 ;;4.0;PAID;**6,35,45,69**;Sep 21, 1995
 ;
 ;This routine is used to view the results of the decomposition.
 ;It is a continuation of routine ^PRS8VW.
 ;
 ;See routine PRS8VW2 at label TYP for type of time
 ;text displayed from this routine.
 ;
 ;Called by Routines:  PRS8VW1
 ;
 S CHECK=0
 ;
EN ; --- entry point from PRS8CK1
 S E=E(1),W="Wk-1",LOC=1 D SHOW
 S E=E(2),W="Wk-2",LOC=2 D SHOW
 S E=E(3),W="Misc",LOC=0 D SHOW
 I 'CHECK,"C"'[$E(IOST) D
 .W ! F I=1:1:79 W "-"
 .W !,TR
 K %,CHECK,D,E,I,L,LOC,USED,W,X,Y Q
 ;
SHOW ; --- show information
 F I=1:2 S X=$E(E,I,I+1) Q:X=""  D
 .I $D(USED(X)) Q
 .S USED(X)=""
 .S X(1)=$F(OLD,X),X(2)=$F(NEW,X) ; try to find time code in TT8B
 .I 'CHECK,'X(1),'X(2) Q  ;not in either string
 .I CHECK S LOC(1)=(I\2+1) S:'LOC LOC(1)=LOC(1)+50 D
 ..S FOUND(LOC(1))=$G(FOUND(LOC(1)))
 ..S $P(FOUND(LOC(1)),"^",$S(LOC<2:1,1:4))=X
 .S Y=$P($T(@$E(X)),";;",2)
 .S Y(1)=$F(Y,$E(X,2)_":")
 .S Y=$P($E(Y,Y(1),999),":",1,2)
 .I 'CHECK W !,W,?10,$P($T(TYP+Y^PRS8VW2),";;",2),?45,X
 .S X=X(1),X1=52 D CON
 .S X=X(2),X1=67 D CON
 Q
 ;
CON ; --- convert to proper format
 I '+X S X=$E("00000000000",1,+$P(Y,":",2))
 I X,X1=52 S (X,Z)=$E(OLD,X(1),X(1)+$P(Y,":",2)-1)
 I X,X1=67 S:'$D(Z) Z="" S X=$E(NEW,X(2),X(2)+$P(Y,":",2)-1)
 I 'CHECK W ?X1,$J(X,9) D  Q
 .I OLD=""!(NEW="") Q
 .I X1=67,Z'="",X'=Z W " *"
 S LOC(2)=$S(X1=52:2,1:3) I LOC=2 S LOC(2)=LOC(2)+3
 S $P(FOUND(LOC(1)),"^",LOC(2))=X
 Q:X1'=67
 I $P(FOUND(LOC(1)),"^",1)="CD" Q
 S S=0,X=FOUND(LOC(1))
 I +$P(X,"^",2)!(+$P(X,"^",3)) S S=1
 I 'S,LOC,+$P(X,"^",5)!(+$P(X,"^",6)) S S=1
 I 'S,LOC'=1 K FOUND(LOC(1))
 Q
 ;
 ; This internal table stores types of time codes and their
 ; corresponding descriptions and TT8B value field lengths. Each
 ; single char line label below is the 1st char of a type of time code.
 ; The text on the corresponding line contains '^' delimited
 ; pieces.  The 1st char of those pieces is the 2nd char of a type of
 ; time.  The text description for that time code is given by the
 ; the number in the 2nd ':' delimited piece.  That number indicates 
 ; the line number below the label TYP in routine PRS8VW2.  The 3rd 
 ; ':' delimited piece is the length of the time code's value in the 
 ; TT8B String. 
 ;
A ;;N:1:3^U:5:3^L:1:3^B:5:3^D:63:3^F:63:3
C ;;E:7:3^U:8:3^T:7:3^O:8:3^L:34:4^A:55:4^Y:57:3^D:60:6
D ;;A:16:3^B:17:3^C:18:3^E:16:3^F:17:3^G:18:3^W:45:2^T:48:6
E ;;A:38:5^B:40:5^C:38:5^D:40:5
F ;;F:59:4^A:61:3^B:61:3^C:62:3^D:62:3^E:64:6
H ;;A:29:3^B:30:3^C:31:3^L:29:3^M:30:3^N:31:3^D:36:3^O:36:3
I ;;N:46:1
L ;;U:48:4^N:49:4^D:50:4^A:53:1
M ;;L:54:4
N ;;O:4:3^A:10:3^B:11:3^P:4:3^R:10:3^S:11:3^L:44:2^T:65:3^H:65:3
O ;;A:20:3^B:21:3^C:22:3^K:24:3^M:25:3^N:34:4^E:20:3^F:21:3^G:22:3^S:24:3^U:25:3
P ;;T:32:3^A:33:3^H:32:3^B:33:3^C:56:2
R ;;T:6:3^A:26:3^B:27:3^C:28:3^L:6:3^E:26:3^F:27:3^G:28:3^R:58:1
S ;;K:2:3^P:12:3^A:13:3^B:14:3^C:15:3^L:2:3^Q:12:3^E:13:3^F:14:3^G:15:3
T ;;F:19:3^A:42:3^C:43:3^G:19:3^B:42:3^D:43:3^L:47:3^O:52:1
U ;;N:9:3^S:9:3
V ;;C:37:6^S:37:6
W ;;D:3:3^P:3:3
Y ;;A:23:3^D:35:4^E:23:3^H:35:4
 Q
