MGR04B ;DEMO ROUTINE [ 08/07/01  1:44 PM ]
 ;
START ;LINE TAG LINE
 SET X=2,Y=3
 S Z=X+Y
 W "BOY THIS IS FUN",!
 W ?10,Y,?15,Z,!
END ;
 K X,Y,Z QUIT
