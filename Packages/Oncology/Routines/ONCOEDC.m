ONCOEDC ;Hines OIFO/RTK-EDIT CHECKS FOR ABSTRACT STATUS ;8/2/96
 ;;2.11;ONCOLOGY;**6,7,13,27,36,41**;Mar 07,1995
 ;
CHECK ;ROUTINE TO CHECK THAT ALL REQUIRED DATA FIELDS ARE FILLED IN:
 ;IF CLASS OF CASE   = 0,1 or 2
 ;   SEQUENCE NUMBER = 00-35 or 99
 ;   DATE DX>12/31/95
 ;Check all required data fields, keep track of any NOT filled in
 ;Abstract cannot be COMPLETE until all required fields are filled in
 ;
 I X=0!(X=1)!(X=2) Q
 S PRM=D0                             ;Primary IEN
 S PTN=$P($G(^ONCO(165.5,D0,0)),U,2)  ;Patient IEN
 S CMPLT=1,NODE0=$G(^ONCO(165.5,D0,0)),ONCTYP="",ONCANL="" K LIST
 S CC=$P(NODE0,U,4),SQN=$P(NODE0,U,6),DTDX=$P(NODE0,U,16)
 I CC="" D  S ONCTYP="" K X Q
 .W !
 .W !?5,"CLASS OF CLASS is blank."
 .W !?5,"""Required"" field checking requires CLASS OF CASE."
 .W !
 I (CC=0)!(CC=1)!(CC=2),(+SQN<36)!(SQN=99),DTDX>2951231 S ONCANL=1 D CHKFLDS
 I CMPLT=0 S ONCTYP="A" K X Q
 I CMPLT=1 D
 .I $G(ONCANL)=1 D
 ..W !!," All required data fields have been entered."
 ..W !!," Beginning inter-field edit checks..." Q
 .W ! D ^ONCEDIT
 I CMPLT=1 W !," No inter-field edit check warnings.",! Q
 K DIR S DIR(0)="YA"
 S DIR("A",1)="This abstract has inter-field WARNINGS."
 S DIR("A")="Do you wish to override them and set the ABSTRACT STATUS to 'Complete'? ",DIR("B")="N" D ^DIR K DIR
 I Y=1 S X=3 Q
 S ONCTYP="B" W ! K X Q
CHKFLDS ;
 S ONCFILE=165.5 D F1655^ONCOEDC1
 S ONCFILE=160 D F160
 ;
F160 ;
 S FLD=$$GET1^DIQ(160,PTN,2,"E") I FLD="" S FDNUM=2 D CMPLT
 S FLD=$$GET1^DIQ(160,PTN,3,"E") I FLD="" S FDNUM=3 D CMPLT
 S FLD=$$GET1^DIQ(160,PTN,7,"I") I FLD="" S FDNUM=7 D CMPLT
 S FLD=$$GET1^DIQ(160,PTN,8,"I") I FLD="" S FDNUM=8 D CMPLT
 S FLD=$$GET1^DIQ(160,PTN,9,"I") I FLD="" S FDNUM=9 D CMPLT
 S FLD=$$GET1^DIQ(160,PTN,10,"I") I FLD="" S FDNUM=10 D CMPLT
 S FLD=$$GET1^DIQ(160,PTN,38,"I") I FLD="" S FDNUM=38 D CMPLT
 S FLD=$$GET1^DIQ(160,PTN,39,"I") I FLD="" S FDNUM=39 D CMPLT
 S FLD=$$GET1^DIQ(160,PTN,43,"I") I FLD="" S FDNUM=43 D CMPLT
 ;
 ;S VSTATUS=$$GET1^DIQ(160,PTN,15,"I") I VSTATUS=0 D
 ;.S FLD=$$GET1^DIQ(160,PTN,21,"I") I FLD="" S FDNUM=21 D CMPLT Q
 ;
 Q
 ;
CMPLT ;Set CMPLT = 0 and add FLD to LIST of fields needed to be filled in.
 S FLDNAME=$P($G(^DD(ONCFILE,FDNUM,0)),U,1) S FDNUM=""
 S CMPLT=0,LIST(FLDNAME)=""
 Q
PRINT ;
 I $G(ONCTYP)="" Q
 I ONCTYP="A" D REQ
 I ONCTYP="B" D INTER
 W ! Q
REQ ;
 W !?5,"Abstract Status may not be set to COMPLETE unless"
 W !?5,"ALL REQUIRED DATA FIELDS HAVE BEEN ENTERED.",!
 W !?5,"The following REQUIRED fields have not been entered"
 W " for this primary:",!
 S EX="",LINE=$S(IOST?1"C".E:IOSL-2,1:IOSL-6),CNT=0
 S FN="" F  S FN=$O(LIST(FN)),CNT=CNT+1 Q:FN=""  W !,?8,FN I CNT>14 D PCHK Q:EX=U
 Q
INTER ;
 ;W !?5,"Abstract Status may not be set to COMPLETE until all interfield"
 ;W !?5,"warnings listed above have been cleared."
 Q
PCHK I ($Y'<(LINE-1)) D  Q:EX=U  W !
 .I IOST?1"C".E W ! K DIR S DIR(0)="E" D ^DIR I 'Y S EX=U Q
 .W @IOF Q
 Q
