ONCODEL ;Hines OIFO/GWB,RTK - EXTENSION & LYMPH NODE CODING ;8/12/94
 ;;2.11;ONCOLOGY;**7,15,19,22,27,28,30,36**;Mar 07, 1995
 ;
IN ;EXTENSION (165.5,30) and LYMPH NODES (165.5,31) Input Transform
 S ONCOT=$P($G(^ONCO(165.5,D0,2)),U,1)
 N OP S OP=$$GETLIST(D0,ONCOX,ONCOT)
 I OP D
 .I X?.N D  Q
 ..I (X>99)!(X<0)!(X?.E1"."1N.N)!(X'?1.2N) K X W "  Invalid code" Q
 ..S:($L(X)=2)&($E(X,1)="0") X=$E(X,2)
 ..S Y=$G(^ONCO(164.5,OP,1,(X+1),0))
 ..I Y="" K X W "  Invalid Code" Q
 ..W ?(17-$L(X))," "_Y
 .I X?.AP D UCASE^ONCOU D  Q
 ..S XX=X S Y=$O(^ONCO(164.5,OP,1,"C",X))
 ..I ($P(Y,XX,1)'="")!(Y="") K X W "  Invalid code" Q
 ..S X=$O(^ONCO(164.5,OP,1,"C",Y,0)),X=X-1
 ..W ?(17-$L(X)),$P(Y,XX,2)
 .K X W "  Invalid code"
 E  W:OP'="" !,OP,*7,! K X
 D EX Q
 ;
HP ;EXTENSION (165.5,30) and LYMPH NODES (165.5,31) help
 S ONCOT=$P($G(^ONCO(165.5,D0,2)),U,1)
 N OP S OP=$$GETLIST(D0,ONCOX,ONCOT)
 I OP D
 .W !?2,$P(^ONCO(164.5,OP,0),U)," (",SEERED," edition)",!
 .N X,Y S X=0
 .F  S X=$O(^ONCO(164.5,OP,1,X)) Q:X'>0  D
 ..S Y=X-1 S:($L(Y)=1)&(ONCOX="E") Y="0"_Y W !?2,Y_" "_^(X,0)
 E  W:OP'="" !,OP,*7,! K X
 W ! D EX Q
 ;
OT ;EXTENSION (165.5,30) and LYMPH NODES (165.5,31) Output Transform
 Q:Y=""
 S ONCOT=$P($G(^ONCO(165.5,D0,2)),U,1)
 N OP S OP=$$GETLIST(D0,ONCOX,ONCOT) ;set OP to IEN of SEER CODE file
 I ONCOX="E",$L(Y)=1 S Y="0"_Y
 I OP N YY S YY=$G(^ONCO(164.5,OP,1,(Y+1),0)),Y=$S(YY="":"Code is not defined",1:Y_" "_YY)
 E  S YY=OP
 D EX Q
 ;
MC I OS=37!(OS=38) S OP=$$HIST^ONCFUNC(D0) G ERM:OP="" Q:OP'=91403  S OG=ICDFILE Q
 S OG="164.2",OP=OS Q
ER ;No topography code
 W !?5,"ICDO TOPOGRAPHY CODE not defined - cannot continue" K X G EX
ERR ;Error in database
 W !?5,"ERROR in database - cannot continue" K X G EX
ERM ;No histology code
 W !?5,$P(^ONCO(164.2,OS,0),U)_" needs Histology Code!" K X Q
EX ;Kill and Exit
 K OG,OS,OT,OP,ONCOX,YY,SEERED,ONCFLD Q
 ;
GETLIST(ONCOIX,CODTYP,ONCOT,OUTFLAG) ;CODTYP (E=extension, L=lymph node)
 ;If OUTFLAG="OUT", will return name and some detail
 N OP ;IEN in 164.5
 N ED S ED=$$EDITION^ONCOU55(ONCOIX) ;edition of SEER
 S SEERED=$S(ED=3:"3rd",ED=2:"2nd",ED=1:"1st",1:ED)
 N ONCOER
 I '$D(CODTYP) S ONCOER="Code type (E or L) is not defined!"
 I $G(ONCOER)="" N SCOD,O2 S SCOD=$P(^ONCO(165.5,ONCOIX,0),U),O2=$G(^(2)) I O2="" S ONCOER="Cancer ID is required!"
 I $G(ONCOER)="" I ONCOT="" S ONCOER="Topography code is required!"
 I $G(ONCOER)="" N ONCOM S ONCOM=$$HIST^ONCFUNC(D0) I ONCOM="" S ONCOER="Histology code is required!"
 I $G(ONCOER)="" D
 .N MELANOMA S MELANOMA=$$MELANOMA^ONCOU55(ONCOIX)
 .I MELANOMA,$P($G(^ONCO(164,ONCOT,0)),U,15) S OP=$S(CODTYP="E":145,CODTYP="L":146,1:0) ;Malignant melanoma of the skin
 .E  I MELANOMA,ED=2,ONCOT=67690 S OP=$S(CODTYP="E":167,CODTYP="L":172,1:0) ;Malignant melanoma of the conjunctiva (uses list Conjunctiva)
 .E  I MELANOMA,ED=2,ONCOT>67690,ONCOT<67700 S OP=$S(CODTYP="E":169,CODTYP="L":170,1:0) ;Malignant Melanoma of Uvea - 2nd edition
 .E  I MELANOMA,ED=3,ONCOT>67690,ONCOT<67700 S OP=$S(CODTYP="E":241,CODTYP="L":170,1:0) ;Malignant Melanoma of Uvea - 3rd edition 
 .E  D
 ..S HST=$$HIST^ONCFUNC(D0)
 ..S OP=$P($G(^ONCO(ICDFILE,ONCOM,CODTYP)),U,ED) ;Morphology
 ..I '$G(OP),ONCOT=67422,(($E(ONCOM,1,3)<959)!($E(ONCOM,1,3)>971)),'$$LEUKEMIA^ONCOAIP2(ONCOIX),ONCOM'=91403 S OP=$S(CODTYP="E":132,1:133)
 ..I '$G(OP),((ONCOT=67770)&((SCOD=62)!(SCOD=63)))!(SCOD=35)!(SCOD=39)!(SCOD=40) S OP=$P($G(^ONCO(164.2,SCOD,CODTYP)),U,ED) ;Special site-groups
 ..I '$G(OP),ONCOT=67619,$G(ONCFLD)=30,ED=3 S OP=$P($G(^ONCO(164,ONCOT,CODTYP)),U,ED) ;Prostate Gland--Clincal Extension
 ..I '$G(OP),ONCOT=67619,$G(ONCFLD)=30.1,ED=3 S OP=250 ;Prostate Gland--Pathologic Extension
 ..I '$G(OP) S OP=$P($G(^ONCO(164,ONCOT,CODTYP)),U,ED) ;Topography
 ..I '$G(OP) S OP=$P($G(^ONCO(164.2,SCOD,CODTYP)),U,ED) ;Other site-groups
 I $D(ONCOER) Q ONCOER
 E  Q $S($G(OUTFLAG)'="OUT":OP,1:OP_" "_$P(^ONCO(164.5,OP,0),U,5)_" "_ED_" "_$P(^(0),U))
