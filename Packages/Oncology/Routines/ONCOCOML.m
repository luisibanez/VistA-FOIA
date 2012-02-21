ONCOCOML ;Hines OIFO/GWB - LIST SINGLE PRIMARY ;07/13/00
 ;;2.11;ONCOLOGY;**16,25,26**;Mar 07, 1995
 N SDD,SD2,SD7,XTS,ABS,SD,ST,AC,ACS,P
 S SDD=^ONCO(165.5,XD1,0),SD2=$G(^(2)),SD7=$G(^(7))
 S XTS=$P(SD7,U,6),XTS=$S('XTS:"Not stated",'$D(^ONCO(164.42,XTS,0)):"Not stated",1:$P(^(0),U,3))
 S ABS=$P(SD7,U,2),ABS=$S(ABS=0:"Incomplete",ABS=1:"Minimal data",ABS=2:"Partial",ABS=3:"Complete",1:"") ;,ABS=$S(ABS="":"",1:$P($P($P(^DD(165.5,91,0),U,3),";",ABS+1),":",2))
 S SD=$P(SDD,"^",16),SD=$S(SD="":"",1:$E(SD,4,5)_"/"_$E(SD,6,7)_"/"_($E(SD,1,3)+1700))
 S ST=$S($D(^ONCO(164,+$P(SD2,"^"),0)):$P(^(0),"^",1),$D(^ONCO(164.2,+$P(SDD,"^"),0)):$P(^(0),"^",1),1:"")
 S AC=$P(SDD,U,5),ACS=$S(AC="":"",1:$E(AC,1,4)_"-"_$E(AC,5,9)_"/"_$P(SDD,U,6)),P(J)=XD1_U_ST
 W ?1,ACS,?15,$E(ST,1,20),?37,XTS,?56,SD,?68,ABS,!
 Q
 ;
FU ;Primary summary list for follow-up
 N ACC,SEQ,ACS,TOP,LTS,DDX,ABS,DIV
 S ACC=$$GET1^DIQ(165.5,XD1,.05)        ;ACCESSION NUMBER
 S SEQ=$$GET1^DIQ(165.5,XD1,.06)        ;SEQUENCE NUMBER
 S ACS=$S(ACC="":"",1:$E(ACC,1,4)_"-"_$E(ACC,5,9)_"/"_SEQ)
 S TOP=$$GET1^DIQ(165.5,XD1,20)         ;ICDO-TOPOGRAPHY
 S LTS=$$GET1^DIQ(165.5,XD1,95,"I")     ;LAST TUMOR STATUS
 S:LTS'="" LTS=$$GET1^DIQ(164.42,LTS,2) ;SHORT DESCRIPTION
 S DDX=$$GET1^DIQ(165.5,XD1,3)          ;DATE DX
 S ABS=$$GET1^DIQ(165.5,XD1,91)         ;ABSTRACT STATUS
 S DIV=$$GET1^DIQ(165.5,XD1,2000,"I")   ;DIVISION
 S:DIV'="" DIV=$$GET1^DIQ(4,DIV,99)     ;STATION NUMBER
 W ?1,ACS,?15,$E(TOP,1,20),?37,LTS,?56,DDX,?68,$E(ABS,1,3),?74,DIV,!
 Q
