DGRPCP ;ALB/MRL - CONSISTENCY PRINT ; 14 SEP 88@1900
 ;;5.3;Registration;;Aug 13, 1993
 D ON^DGRPC G Q^DGRPCP1:DGER
1 K ^UTILITY($J) D DT^DICRW S Z="^" W !!,"Generate a listing of inconsistent data elements by:",! F I=1:1:3 S J=$P($T(T+I),";;",2),Z=Z_$P(J,"^",1)_"^" W !?4,$P(J,"^",1)
 R !!,"CHOOSE OUTPUT METHOD OR ENTER '^' TO QUIT:  ",X:DTIME S:'$T X="^" D IN^DGHELP G Q^DGRPCP1:X["^"!(X']"") I %=-1 W !!,"The available choices are:",! X "F I=1:1:3 S J=$P($T(T+I),"";;"",2) W !,$P(J,""^"",1),"" - "",$P(J,""^"",2)" G 1
 S DGHOW=X_"^"_$S(X="A":"ADMISSION",X="R":"REGISTRATION",1:"IDENTIFICATION")_" DATE"
D W !! S %DT="EAX",%DT(0)=-DT,%DT("A")="Start with "_$P(DGHOW,"^",2)_":  " D ^%DT G Q^DGRPCP1:Y'>0 S DGFRD=Y
 S Y=DGFRD X ^DD("DD") S %DT("A")="     Go To "_$P(DGHOW,"^",2)_":  "_Y_"// " D ^%DT I X']"" S DGTOD=DGFRD_".9999" G H
 G Q^DGRPCP1:Y'>0 S DGTOD=Y_".9999" I DGFRD>DGTOD W !?4,"TO DATE CAN'T BE BEFORE FROM DATE!!",*7 G D
H K %DT S Z="^NAME^TERMINAL DIGIT" R !!,"List by (N)ame or (T)erminal Digit:  ",X:DTIME S:'$T X="^" D IN^DGHELP G Q^DGRPCP1:X["^"
 I %=-1 W !!?4,"N - To generate listing in Alphabetical Order",!?4,"T - To generate listing in Terminal Digit Order." G H
 W !!,*7,"THIS OUTPUT REQUIRES 132 COLUMN OUTPUT" S DGHOW1=X,DGVAR="DUZ^DGHOW^DGHOW1^DGFRD^DGTOD",DGPGM="^DGRPCP1" D ZIS^DGUTQ G Q^DGRPCP1:POP U IO G ^DGRPCP1
T ;
 ;;ADMISSION DATE^Patients admitted during a specified date range.
 ;;IDENTIFICATION DATE^Inconsistencies identified during a specified date range.
 ;;REGISTRATION DATE^Patients registered during a specified date range.
