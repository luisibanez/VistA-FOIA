AZHLSC24 ; IHS/ADC/GTH:KEU:JN - SAC CHAPTER 2: M LANGUAGE PROGRAMMING STANDARDS & CONVENTIONS ;  [ 04/09/1999  7:40 AM ] [6/28/00 11:56am]
 ;;5.0;AZHLSC;;JUL 10, 1996
 ;CHANGED DIF="Z(" TO GLOBAL AND OTHER REFERENCES TO THE 
 ;ARRAY TO THE GLOBAL REFERENCE TO ACCOMMODATE LARGE RTNS SIZES
 ;IHS/ABQ/KEU  4/7/95
 ;W !!!,$P($P($T(+1),";",2),"-",2)
 NEW A,A3,A4,A5,ARG,B,CH,COM,DIF,G,I,J,LIN,NORTNS,NUL,R,Q,XCNP,Z
 D END
 S Q="""",A4="=""O ",A5="=""C ",NORTNS=$O(^UTILITY($J,""))=""
 S AZHL=""
 F  S AZHL=$O(^UTILITY($J,AZHL)) Q:AZHL=""  W:AZHLTERM "." K Z S (X,AZHL0)=AZHL,DIF="^TMP($J,""Z"",",XCNP=0 X "X ^%ZOSF(""LOAD""),AZHLGFCX" I  S XCNP=XCNP-1 D
 .F Z=3:1:XCNP S Z(Z)=^TMP($J,"Z",Z,0) D
 ..I Z(Z)["^%ZOSF(""BRK"")" D NBRK^AZHLSC48
 ..I Z(Z)[" B  " S AZHLSC49=" B  " D EN^AZHLSC46 Q:AZHLSC4I=1  D EN^AZHLSC47 Q:AZHLSC4I=1  D EN1^AZHLSC49 Q:AZHLSC4I=1  S ^TMP($J,"2421",AZHL,Z)=Z(Z)
 ..I $E(Z(Z),1,2)=" B" S AZHLSC49=" B" D EN^AZHLSC46 Q:AZHLSC4I=1  D EN^AZHLSC47 Q:AZHLSC4I=1  D EN1^AZHLSC49 Q:AZHLSC4I=1  S ^TMP($J,"2421",AZHL,Z)=Z(Z)
 ..I (Z(Z)[" C ") D EN^AZHLSC46 Q:AZHLSC4I=1  D EN^AZHLSC47 Q:AZHLSC4I=1  S AZHLSC49=" C " D FINDC Q:AZHLSC4I=1  D EN1^AZHLSC49 Q:AZHLSC4I=1  S ^TMP($J,"2431",AZHL,Z)=Z(Z)
 ..I (Z(Z)[" H  ") S AZHLSC49=" H  " D EN^AZHLSC46 Q:AZHLSC4I=1  D EN^AZHLSC47 Q:AZHLSC4I=1  D EN1^AZHLSC49 Q:AZHLSC4I=1  S ^TMP($J,"2441",AZHL,Z)=Z(Z)
 ..I (Z(Z)[" J ") S AZHLSC49=" J " D EN^AZHLSC46 Q:AZHLSC4I=1  D EN^AZHLSC47 Q:AZHLSC4I=1  D EN1^AZHLSC49 Q:AZHLSC4I=1  S ^TMP($J,"2451",AZHL,Z)=Z(Z)
 ..I (Z(Z)[" K  ") S AZHLSC49=" K  " D EN^AZHLSC46 Q:AZHLSC4I=1  D EN^AZHLSC47 Q:AZHLSC4I=1  D EN1^AZHLSC49 Q:AZHLSC4I=1  S ^TMP($J,"2461",AZHL,Z)=Z(Z)
 ..I (Z(Z)[" K (") S AZHLSC49=" K (" D EN^AZHLSC46 Q:AZHLSC4I=1  D EN^AZHLSC47 Q:AZHLSC4I=1  D EN1^AZHLSC49 Q:AZHLSC4I=1  S ^TMP($J,"2462",AZHL,Z)=Z(Z)
 ..I (Z(Z)[" L  ") D EN^AZHLSC46 Q:AZHLSC4I=1  D EN^AZHLSC47 Q:AZHLSC4I=1  S AZHLSC49=" L  " D EN1^AZHLSC49 Q:AZHLSC4I=1  S ^TMP($J,"2471",AZHL,Z)=Z(Z)
 ..F J(1)=" L "," L:",".L ",".L:" I Z(Z)[J(1) D EN^AZHLSC47 Q:AZHLSC4I=1  D EN^AZHLSC46 Q:AZHLSC4I=1  S LIN=$E(Z(Z),$F(Z(Z),J(1))-2,999),COM=$E(LIN) D SEP^%INDEX I $P(LIN," ")["+" D EN^AZHLSC48 Q:AZHLSC4I=1  S ^TMP($J,"2472",AZHL,Z)=Z(Z)
 ..I (Z(Z)[" N  ") S AZHLSC49=" N  " D EN^AZHLSC46 Q:AZHLSC4I=1  D EN^AZHLSC47 Q:AZHLSC4I=1  D EN1^AZHLSC49 Q:AZHLSC4I=1  S ^TMP($J,"2481",AZHL,Z)=Z(Z)
 ..I (Z(Z)[" O ") D EN^AZHLSC46 Q:AZHLSC4I=1  D EN^AZHLSC47 Q:AZHLSC4I=1  S AZHLSC49=" O " D FINDC Q:AZHLSC4I=1  D EN1^AZHLSC49 Q:AZHLSC4I=1  S ^TMP($J,"2491",AZHL,Z)=Z(Z)
 ..F J(1)=" U "," U:" I Z(Z)[J(1) S AZHLSC49=J(1) D FINDU Q:AZHLSC4I=1   D EN^AZHLSC47 Q:AZHLSC4I=1  D EN^AZHLSC46 Q:AZHLSC4I=1  D EN1^AZHLSC49 Q:AZHLSC4I=1  S ^TMP($J,"24111",AZHL,Z)=Z(Z)
 ..F J(1)=" R "," R:",".R " I Z(Z)[J(1) S AZHLSC49=J(1) D EN^AZHLSC47 Q:AZHLSC4I=1  D EN^AZHLSC46 Q:AZHLSC4I=1  S AZHLSC49=J(1) D EN1^AZHLSC49 Q:AZHLSC4I=1  D FINDCO I AZHLSC4I'=1 S ^TMP($J,"24102",AZHL,Z)=Z(Z)
 ..F J(1)=" V "," V:" I Z(Z)[J(1) S AZHLSC49=J(1) D EN^AZHLSC47 Q:AZHLSC4I=1  D EN^AZHLSC46 Q:AZHLSC4I=1  D EN1^AZHLSC49 Q:AZHLSC4I=1  D FINDC Q:AZHLSC4I=1  S ^TMP($J,"24121",AZHL,Z)=Z(Z)
 ..Q
 .Q
621 D TTL^AZHLSC("2.4.2.1,  Break Control")
 I NORTNS D NRTN^AZHLSC G 2431 
 I $L($O(^TMP($J,"2421",""))) W !?10,"Check that ^%ZOSF(""BRK"") has corresponding ^%ZOSF(""NBRK"")." S %="" F  S %=$O(^TMP($J,"2421",%)) Q:%=""  S A=0 F  S A=$O(^TMP($J,"2421",%,A)) Q:'A  W !?10,"+",A,"^",%," :  ",^(A)
2431 D TTL^AZHLSC("2.4.3.1  CLOSE, direct use prohibited")
 I NORTNS D NRTN^AZHLSC G 2441 
 I $L($O(^TMP($J,"2431",""))) S %="" F  S %=$O(^TMP($J,"2431",%)) Q:%=""  S A=0 F  S A=$O(^TMP($J,"2431",%,A)) Q:'A  W !?10,"+",A,"^",%," :  ",^(A)
2441 D TTL^AZHLSC("2.4.4.1  HALT, direct use prohibited")
 I NORTNS D NRTN^AZHLSC G 2451
 I $L($O(^TMP($J,"2441",""))) S %="" F  S %=$O(^TMP($J,"2441",%)) Q:%=""  S A=0 F  S A=$O(^TMP($J,"2441",%,A)) Q:'A  W !?10,"+",A,"^",%," :  ",^(A)
2451 D TTL^AZHLSC("2.4.5.1  JOB, direct use prohibited")
 I NORTNS D NRTN^AZHLSC G 2461 
 I $L($O(^TMP($J,"2451",""))) S %="" F  S %=$O(^TMP($J,"2451",%)) Q:%=""  S A=0 F  S A=$O(^TMP($J,"2451",%,A)) Q:'A  W !?10,"+",A,"^",%," :  ",^(A)
2461 D TTL^AZHLSC("2.4.6.1  KILL,argumentless use prohibited")
 I NORTNS D NRTN^AZHLSC G 2462 
 I $L($O(^TMP($J,"2461",""))) S %="" F  S %=$O(^TMP($J,"2461",%)) Q:%=""  S A=0 F  S A=$O(^TMP($J,"2461",%,A)) Q:'A  W !?10,"+",A,"^",%," :  ",^(A)
2462 D TTL^AZHLSC("2.4.6.2  KILL,exclusive use prohibited")
 I NORTNS D NRTN^AZHLSC G 2471 
 I $L($O(^TMP($J,"2462",""))) S %="" F  S %=$O(^TMP($J,"2462",%)) Q:%=""  S A=0 F  S A=$O(^TMP($J,"2462",%,A)) Q:'A  W !?10,"+",A,"^",%," :  ",^(A)
2471 D TTL^AZHLSC("2.4.7.1  LOCK, should be incremental/decremental")
 I NORTNS D NRTN^AZHLSC G 2472 
 I $L($O(^TMP($J,"2471",""))) S %="" F  S %=$O(^TMP($J,"2471",%)) Q:%=""  S A=0 F  S A=$O(^TMP($J,"2471",%,A)) Q:'A  W !?10,"+",A,"^",%," :  ",^(A)
2472 D TTL^AZHLSC("2.4.7.2,  Timeouts on Locks.")
 I NORTNS D NRTN^AZHLSC G 2481 
 I $L($O(^TMP($J,"2472",""))) W !?10,"SUSPECT LOCK w/o timeout, or not +/-." S %="" F  S %=$O(^TMP($J,"2472",%)) Q:%=""  S A=0 F  S A=$O(^TMP($J,"2472",%,A)) Q:'A  W !?10,"+",A,"^",%," :  ",^(A)
2481 D TTL^AZHLSC("2.4.8.1  NEW, argumentless prohibited")
 I NORTNS D NRTN^AZHLSC G 2491 
 I $L($O(^TMP($J,"2481",""))) S %="" F  S %=$O(^TMP($J,"2481",%)) Q:%=""  S A=0 F  S A=$O(^TMP($J,"2481",%,A)) Q:'A  W !?10,"+",A,"^",%," :  ",^(A)
2491 D TTL^AZHLSC("2.4.9.1  OPEN, is prohibited")
 I NORTNS D NRTN^AZHLSC G 24102 
 I $L($O(^TMP($J,"2491",""))) S %="" F  S %=$O(^TMP($J,"2491",%)) Q:%=""  S A=0 F  S A=$O(^TMP($J,"2491",%,A)) Q:'A  W !?10,"+",A,"^",%," :  ",^(A)
24102 D TTL^AZHLSC("2.4.10.2  TIMEOUT greater than 300 is prohibited")
 I NORTNS D NRTN^AZHLSC G 24111 
 I $L($O(^TMP($J,"24102",""))) S %="" F  S %=$O(^TMP($J,"24102",%)) Q:%=""  S A=0 F  S A=$O(^TMP($J,"24102",%,A)) Q:'A  W !?10,"+",A,"^",%," :  ",^(A)
24111 D TTL^AZHLSC("2.4.11.1  USE, with parameters is prohibited")
 I NORTNS D NRTN^AZHLSC G 2412 
 I $L($O(^TMP($J,"24111",""))) S %="" F  S %=$O(^TMP($J,"24111",%)) Q:%=""  S A=0 F  S A=$O(^TMP($J,"24111",%,A)) Q:'A  W !?10,"+",A,"^",%," :  ",^(A)
2412 D TTL^AZHLSC("2.4.12.1  VIEW, is prohibited")
 I NORTNS D NRTN^AZHLSC Q 
 I $L($O(^TMP($J,"24121",""))) S %="" F  S %=$O(^TMP($J,"24121",%)) Q:%=""  S A=0 F  S A=$O(^TMP($J,"24121",%,A)) Q:'A  W !?10,"+",A,"^",%," :  ",^(A)
 Q
END K ^TMP($J,"2421"),^("2431"),^("2441"),^("2461"),^("2462"),^("2471"),^("2472"),^("2481"),^("2491"),^("24111"),^("24121"),^("Z"),Z Q     
FINDC ; SEARCH FOR CLOSE COMMAND PASS AZHLSC49=" C " SECOND PIECE
 S AZHLSCLN=$L(Z(Z)),AZHLSCLP=""
 S AZHLSC4I=1 F I=2:2 Q:$P($G(Z(Z))," ",I)=""  S AZHLSCF=$P($G(Z(Z))," ",I) D LENGTH I $E($G(AZHLSCF),1,1)=$P(AZHLSC49," ",2) S AZHLSC4I=0 Q  Q:AZHLSCLN=AZHLSCLP  Q:AZHLSCLN<AZHLSCLP Q
LENGTH ;   SET LENGTH
 S AZHLSCLP=AZHLSCLP+$P($L(Z(Z))," ",I),AZHLSCLP=AZHLSCLP+I Q
FINDU ;FIND ( U OR U:)OR ( V OR V:) COMMAND SEARCH FOR PARAMENTERS
 S AZHLSC4I=0,AZHLSCF=""
 S AZHLSCF=$F(Z(Z),AZHLSC49) I AZHLSCF=0 S AZHLSC4I=1 Q
 S AZHLSCG=$E(Z(Z),AZHLSCF,245) G:AZHLSC49=" U:" FINDUP I $P(AZHLSCG," ",1)[":" S AZHLSC4I=0 Q
FINDEND S AZHLSC4I=1 Q
FINDUP I $P(AZHLSCG," ",2)[":" S AZHLSC4I=0 Q
 G FINDEND
FINDCO ;FIND  R  R: .R   SEARCH FOR COLON IN READ 
 S AZHLSC4I=0,AZHLSCF=""
 S AZHLSCF=$F(Z(Z),AZHLSC49) I AZHLSCF=0 S AZHLSC4I=1 Q
 S AZHLSCG=$F(Z(Z),""",",AZHLSCF) I AZHLSCG=0 S AZHLSC4I=1 Q
 S AZHLSCF=$F(Z(Z),":",AZHLSCG) I AZHLSCF=0 S AZHLSC4I=1 Q
 S AZHLSCG=$E(Z(Z),AZHLSCF,245) I AZHLSCG="DTIME" G FINDCEND
 I AZHLSCG>300 S AZHLSC4I=0 Q
FINDCEND S AZHLSC4I=1 Q
