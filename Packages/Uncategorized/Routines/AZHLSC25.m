AZHLSC25 ; IHS/ADC/GTH:KEU:JN - SAC CHAPTER 2: M LANGUAGE PROGRAMMING STANDARDS & CONVENTIONS ;  [ 06/28/1999  9:11 AM ]
 ;;5.0;AZHLSC;;JUL 10, 1996
 ;CHANGED DIF="Z(" TO GLOBAL AND OTHER REFERENCES TO THE 
 ;ARRAY TO THE GLOBAL REFERENCE TO ACCOMMODATE LARGE RTNS SIZES
 ;IHS/ABQ/KEU  4/7/95
 ;W !!!,$P($P($T(+1),";",2),"-",2)
 NEW A,A3,A4,A5,ARG,B,CH,COM,DIF,G,I,J,LIN,NORTNS,NUL,R,Q,XCNP,Z
 D END
 S Q="""",A4="=""O ",A5="=""C ",NORTNS=$O(^UTILITY($J,""))=""
 S AZHL=""
 F  S AZHL=$O(^UTILITY($J,AZHL)) Q:AZHL=""  W:AZHLTERM "." K Z S X=AZHL,DIF="^TMP($J,""Z"",",XCNP=0 X "X ^%ZOSF(""LOAD""),AZHLGFCX" I  S XCNP=XCNP-1 D
 .F Z=3:1:XCNP S Z(Z)=^TMP($J,"Z",Z,0) K ^TMP($J,"Z",Z,0) D
 ..I Z(Z)'["$$" D EN^AZHLSC47 Q:AZHLSC4I=1  I Z(Z)["$N" S ^TMP($J,"2521",AZHL,Z)=Z(Z)
 ..Q
 .Q
721 D TTL^AZHLSC("2.5.2.1,  (6.6.18)  $NEXT.")
 I NORTNS D NRTN^AZHLSC Q
 I $L($O(^TMP($J,"2521",""))) S %="" F  S %=$O(^TMP($J,"2521",%)) Q:%=""  S A=0 F  S A=$O(^TMP($J,"2521",%,A)) Q:'A  W !?10,"+",A,"^",%," :  ",^(A)
 Q
 ; 
END K ^TMP($J,"2521"),^("Z"),Z
 Q
 ;
