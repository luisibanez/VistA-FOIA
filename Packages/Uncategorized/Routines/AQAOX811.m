AQAOX811 ; COMPILED XREF FOR FILE #9002168.1 ; 02/13/06
 ; 
 S DIKZK=2
 S DIKZ(0)=$G(^AQAO(1,DA,0))
 S X=$P(DIKZ(0),U,1)
 I X'="" K ^AQAO(1,"B",$E(X,1,30),DA)
END Q
