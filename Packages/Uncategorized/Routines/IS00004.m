IS00004(INTT,INDA,INA,INDEST,INQUE,INORDUZ,INORDIV) ;Compiled from script 'Generated: X1 IHS 276-O' on DEC 09, 2002
 ;Part 1
 ;Copyright 2002 SAIC
EN S X="ERROR^IS00004",@^%ZOSF("TRAP")
 G START
ERROR ;
 S X="",@^%ZOSF("TRAP") X ^INTHOS(1,3) D ERROR^INHS($$GETERR^%ZTOS)
 Q 2
START ;Initialize variables
 K ^UTILITY("INH",$J) S (MESSID,INA("MESSID"))=$$MESSID^INHD
 S INA("INSEQ")=$P(MESSID,$P($G(^INRHSITE(1,0)),U,8),2)#10000000
 K INUIF6 M INUIF6=INDA
 K INREQERR,INHERR,INHERCNT,INV D SETDT^UTDT S DUZ(0)="@",DUZ("AG")="^1",DTIME=1 S (LCT,GERR)=0,INMODE="O",INVS=$P(^INRHSITE(1,0),U,12),INV=$S(INVS<2:"INV",1:"^UTILITY(""INV"",$J)"),(MULT,INSTERR)=0
 S INHLDUZ=$O(^VA(200,"B","GIS,USER",0)),DUZ=$S($G(INHLDUZ):INHLDUZ,1:.5)
 S BHLMIEN="12418"
 S INEOSM=""
 K INSETID
 S INSMIN=$S($P($G(^INRHSITE(1,0)),U,14):$P(^(0),U,14),1:2500)
 S (DELIM,INDELIM)=$$FIELD^INHUT(),(SUBDELIM,INSUBDEL)=$$COMP^INHUT(),INSUBCOM=$$SUBCOMP^INHUT()
 S INDELIMS=$$FIELD^INHUT_$$COMP^INHUT_$$REP^INHUT_$$ESC^INHUT_$$SUBCOMP^INHUT
 ;Entering DATA section.
 S DELIM=""
 S SUBDELIM=":"
 S SUBDELIM=""
 SET INSETID=0
 D ^BHLXHDR
 ;SET ISA1 = $E(INTERNAL(@ISA1),1,2)
 S D0=INDA S X=$G(INA("ISA1")),X=X S X=X,Y(1)=X S X=1,Y(2)=X S X=2,X=$E(Y(1),Y(2),X)
 S @INV@("ISA1")=X K DXS,D0
 ;SET ISA2 = @ISA2
 S D0=INDA S X=$G(INA("ISA2"))
 S @INV@("ISA2")=X K DXS,D0
 ;SET ISA3 = $E(INTERNAL(@ISA3),1,2)
 S D0=INDA S X=$G(INA("ISA3")),X=X S X=X,Y(1)=X S X=1,Y(2)=X S X=2,X=$E(Y(1),Y(2),X)
 S @INV@("ISA3")=X K DXS,D0
 ;SET ISA4 = @ISA4
 S D0=INDA S X=$G(INA("ISA4"))
 S @INV@("ISA4")=X K DXS,D0
 ;SET ISA5 = $E(INTERNAL(@ISA5),1,2)
 S D0=INDA S X=$G(INA("ISA5")),X=X S X=X,Y(1)=X S X=1,Y(2)=X S X=2,X=$E(Y(1),Y(2),X)
 S @INV@("ISA5")=X K DXS,D0
 ;SET ISA6 = @ISA6
 S D0=INDA S X=$G(INA("ISA6"))
 S @INV@("ISA6")=X K DXS,D0
 ;SET ISA7 = $E(INTERNAL(@ISA7),1,2)
 S D0=INDA S X=$G(INA("ISA7")),X=X S X=X,Y(1)=X S X=1,Y(2)=X S X=2,X=$E(Y(1),Y(2),X)
 S @INV@("ISA7")=X K DXS,D0
 ;SET ISA8 = @ISA8
 S D0=INDA S X=$G(INA("ISA8"))
 S @INV@("ISA8")=X K DXS,D0
 ;SET ISA9 = INSGX\^INTHL7F(15396,5)\\6\@ISA9
 S D0=INDA S X=$G(INA("ISA9"))
 S X1="^INTHL7F(15396,5)" X:$L($G(@X1)) $G(@X1) S X=$E(X,1,6)
 S @INV@("ISA9")=X K DXS,D0
 ;SET ISA10 = @ISA10
 S D0=INDA S X=$G(INA("ISA10"))
 S @INV@("ISA10")=X K DXS,D0
 ;SET ISA11 = $E(INTERNAL(@ISA11),1,1)
 S D0=INDA S X=$G(INA("ISA11")),X=X S X=X,Y(1)=X S X=1,Y(2)=X S X=1,X=$E(Y(1),Y(2),X)
 S @INV@("ISA11")=X K DXS,D0
 ;SET ISA12 = $E(INTERNAL(@ISA12),1,5)
 S D0=INDA S X=$G(INA("ISA12")),X=X S X=X,Y(1)=X S X=1,Y(2)=X S X=5,X=$E(Y(1),Y(2),X)
 S @INV@("ISA12")=X K DXS,D0
 ;SET ISA13 = @ISA13
 S D0=INDA S X=$G(INA("ISA13"))
 S @INV@("ISA13")=X K DXS,D0
 ;SET ISA14 = $E(INTERNAL(@ISA14),1,1)
 S D0=INDA S X=$G(INA("ISA14")),X=X S X=X,Y(1)=X S X=1,Y(2)=X S X=1,X=$E(Y(1),Y(2),X)
 S @INV@("ISA14")=X K DXS,D0
 ;SET ISA15 = $E(INTERNAL(@ISA15),1,1)
 S D0=INDA S X=$G(INA("ISA15")),X=X S X=X,Y(1)=X S X=1,Y(2)=X S X=1,X=$E(Y(1),Y(2),X)
 S @INV@("ISA15")=X K DXS,D0
 ;SET ISA16 = @ISA16
 S D0=INDA S X=$G(INA("ISA16"))
 S @INV@("ISA16")=X K DXS,D0
 D:'INVS MC^INHS
 K LINE S LINE="",CP=0 S L1="ISA" S:$TR(L1,$G(SUBDELIM))="" L1="" D SETPIECE^INHU(.LINE,DELIM,1,L1,.CP) S L1=$G(@INV@("ISA1")) S:$TR(L1,$G(SUBDELIM))="" L1=""
 D SETPIECE^INHU(.LINE,DELIM,2,L1,.CP)
 S D0=INDA S X=@INV@("ISA2"),Y(1)=X S X=1,Y(2)=X S X=10,X=$E(Y(1),Y(2),X) S L1=X
 S:$TR(L1,$G(SUBDELIM))="" L1="" D SETPIECE^INHU(.LINE,DELIM,3,L1,.CP) S L1=$G(@INV@("ISA3")) S:$TR(L1,$G(SUBDELIM))="" L1="" D SETPIECE^INHU(.LINE,DELIM,4,L1,.CP)
 S D0=INDA S X=@INV@("ISA4"),Y(1)=X S X=1,Y(2)=X S X=10,X=$E(Y(1),Y(2),X) S L1=X
 S:$TR(L1,$G(SUBDELIM))="" L1="" D SETPIECE^INHU(.LINE,DELIM,5,L1,.CP) S L1=$G(@INV@("ISA5")) S:$TR(L1,$G(SUBDELIM))="" L1="" D SETPIECE^INHU(.LINE,DELIM,6,L1,.CP)
 S D0=INDA S X=@INV@("ISA6"),Y(1)=X S X=1,Y(2)=X S X=15,X=$E(Y(1),Y(2),X) S L1=X
 S:$TR(L1,$G(SUBDELIM))="" L1="" D SETPIECE^INHU(.LINE,DELIM,7,L1,.CP) S L1=$G(@INV@("ISA7")) S:$TR(L1,$G(SUBDELIM))="" L1="" D SETPIECE^INHU(.LINE,DELIM,8,L1,.CP)
 S D0=INDA S X=@INV@("ISA8"),Y(1)=X S X=1,Y(2)=X S X=15,X=$E(Y(1),Y(2),X) S L1=X
 S:$TR(L1,$G(SUBDELIM))="" L1="" D SETPIECE^INHU(.LINE,DELIM,9,L1,.CP) S L1=$G(@INV@("ISA9")) S:$TR(L1,$G(SUBDELIM))="" L1="" D SETPIECE^INHU(.LINE,DELIM,10,L1,.CP)
 S D0=INDA S X=@INV@("ISA10"),Y(1)=X S X=1,Y(2)=X S X=4,X=$E(Y(1),Y(2),X) S L1=X
 S:$TR(L1,$G(SUBDELIM))="" L1="" D SETPIECE^INHU(.LINE,DELIM,11,L1,.CP) S L1=$G(@INV@("ISA11")) S:$TR(L1,$G(SUBDELIM))="" L1="" D SETPIECE^INHU(.LINE,DELIM,12,L1,.CP)
9 G EN^IS00004A
