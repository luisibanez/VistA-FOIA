BPSOS57 ;BHAM ISC/FCS/DRS/FLS - 9002313.57 utils ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 ;External reference private DBIA 4303
 Q
 ; Numerous little $$'s are here ; each assumes IEN57 is defined
 ; Originally copied from BPSOSQ where it was for IEN57
 ;
 ;IHS/DSD/lwj 10/02  Two changes included in this routine, both
 ; sent in by David Slauenwhite.  Changes were made and tested 
 ; during the ILC interface work done at Siletz in October, 2001.
 ;
PREVIOUS(N57) ;EP -
 I '$D(N57) S N57=IEN57
 N RXI,RXR S RXI=$P(^BPSTL(N57,1),U,11)
 S RXR=$P(^BPSTL(N57,1),U)
 I RXI=""!(RXR="") Q ""
 Q $O(^BPSTL("NON-FILEMAN","RXIRXR",RXI,RXR,N57),-1)
LAST57(RXI,RXR) ;EP -
 Q $O(^BPSTL("NON-FILEMAN","RXIRXR",RXI,RXR,""),-1)
 ;
DRGDFN() ;EP -
 Q $P(^PSRX($$RXI,0),U,6) ; Given IEN57, return DRGDFN
DRGNAME() ; EP -
 Q $P(^PSDRUG($$DRGDFN,0),U) ; Given IEN57, return DRGNAME
RELDATE() ;EP -
 N RXI,RXR S RXI=$$RXI,RXR=$$RXR Q:'RXI ""
 I RXR Q $P($G(^PSRX(RXI,1,RXR,0)),U,18)
 Q $P($G(^PSRX(RXI,2)),U,13)
RXI() ;EP -
 Q $P(^BPSTL(IEN57,1),U,11) ; Given IEN57, return RXI
RXR() ;EP -
 Q $P(^BPSTL(IEN57,1),U,1) ; Given IEN57, return RXR
NDC() ;EP -
 I $$TYPE=1 Q $P(^BPSTL(IEN57,1),U,2)
 I $$TYPE=2 Q "" ; not implemented
 I $$TYPE=3 Q "" ; not implemented
 D TYPEBAD("NDC")
 Q ""
QTY() ;EP -
 Q $P(^BPSTL(IEN57,5),U) ; Given IEN57, return quantity
AMT() Q $P(^BPSTL(IEN57,5),U,5) ; return total $amount
CHG() ;EP -
 Q $P(^BPSTL(IEN57,5),U,5) ; Given IEN57, ret total charge
CPTIEN() ;EP -
 I $$TYPE=1 Q 0
 ; CPT code for postage could vary by insurer and amount?
 ; A complication not yet programmed
 I $$TYPE=2 Q $P($G(^BPS(9002313.99,1,"POSTAGE")),U)
 I $$TYPE=3 Q $$EXTRCPT3 ; extract CPT from  visitien.cptien3
 D TYPEBAD("CPTIEN")
 Q ""
INSIEN() ; EP -
 Q $P(^BPSTL(IEN57,1),U,6)
EXTRCPT3() N X S X=IEN57,X=$P(X,".",2),X=$E(X,1,$L(X)-1) Q +X
PATIENT() ;EP -
 Q $P(^BPSTL(IEN57,0),U,6)
HRN() ; EP - health record number and facility abbreviation
 N PAT,DIV,FAC,X
 S PAT=$P($G(^BPSTL(IEN57,0)),U,6) Q:'PAT ""
 S DIV=$P($G(^BPSTL(IEN57,1)),U,4)
 I DIV S FAC=$P($G(^PS(59,DIV,"INI")),U)
 E  S FAC=0
 S:'FAC FAC=$G(DUZ(2))
 Q:'FAC ""
 S X=$G(^DIC(4,FAC,0))
 I $P(X,U,5)]"" S X=$P(X,U,5)
 E  S X=$E($P(X,U),1,4)
 Q 0
VISITIEN() ; EP -
 Q $P(^BPSTL(IEN57,0),U,7)
USER() ;EP -
 N X S X=$P(^BPSTL(IEN57,0),U,10) S:'X X=$G(DUZ) Q X
TYPE() ;EP -
 N X S X=$P(^BPSTL(IEN57,0),U) ; 03/26/2001
 S X=$E(X,$L(X)) ; 1=prescription, 2=postage for presc, 3=other ;
 I X'=1,X'=2,X'=3 D
 . D IMPOSS^BPSOSUE("DB","TI","Bad TYPE in transaction","IEN57="_IEN57,"TYPE",$T(+0))
 Q X
TYPEBAD(ATLABEL) ;
 D IMPOSS^BPSOSUE("DB","TI","Invalid $$TYPE^BPSOS57",$$TYPE,ATLABEL,$T(+0)) Q
NOW() ; EP -
 N %,%H,%I,X D NOW^%DTC Q %
FILLDATE() ; EP -
 N RXI,RXR S RXI=$$RXI,RXR=$$RXR
 Q:RXR $P(^PSRX(RXI,1,RXR,0),U)  Q:RXI $P(^PSRX(RXI,2),U,2)
 Q $$VISDATE
VISDATE() Q 0    ;$P($P(^AUPNVSIT($$VISITIEN,0),U),".")
VMED() ; EP -
 N RXI,RXR S RXI=$$RXI,RXR=$$RXR
 Q:RXR $P(^PSRX(RXI,1,RXR,999999911),U) Q $P(^PSRX(RXI,999999911),U)
PROVIDER() ;EP -
 Q $P(^PSRX($$RXI,0),U,4)
VCN() ;EP -
 N V S V=$$VISITIEN Q:'V "" Q 0
 ;
ISREVERS(N) ;EP - BPSOSIY,BPSOSM1 
 ; Returns reversal claim #, else false
 ; Returns 0.5 if it's reversal of a paper claim
 N X S X=$G(^BPSTL(N,4)) Q:X="" 0
 I X Q $P(X,U) ; reversal of electronic claim
 I $P(X,U,3) Q 0.5 ; reversal of paper claim
 Q 0
REVACC(N) ;EP - BPSOSIY,BPSOSM1
 ; was this an accepted reversal? return true or false
 I $P(^BPSTL(N,4),U,3) Q 1 ; paper reversal always success
 ; Treat Duplicate of Accepted Reversal ("S") as accepted
 N X
 S X=$$REVRESP(N)
 Q X="A"!(X="S")
REVRESP(N)         ;
 N RESP S RESP=$P(^BPSTL(N,4),U,2)
 I 'RESP Q "?"
 N X S X=$$RESP500^BPSOSQ4(RESP,"I")
 Q X ; Should be "A" or "R" - can be "S" (Duplicate of Accepted Reversal)
ARSYSTEM()         Q $P(^BPS(9002313.99,1,"A/R INTERFACE"),U)
MAKEVCN()          ; true/false  should we assign a VCN # to the visit?
 N AR S AR=$$ARSYSTEM
 I AR=0 Q 1 ; yes, for ILC A/R
 I AR=2 Q 1 ; yes, for ANMC A/R
 Q 0 ; no, for everybody else
LOG2LIST(MSG)      D LOG2LIST^BPSOSL(MSG) Q
LOG2CLM(MSG,IEN02)       D LOG2CLM^BPSOSL(MSG,IEN02) Q
LOG59(MSG) ;EP - 
 D LOG59^BPSOSL(MSG,$P(^BPSTL(IEN57,0),U)) Q
COMP59 ; devel util ; compare to .57 DD, should be same fields
 W !,$T(COMP59),!
 N F57,F59,OK S F57=9002313.57,F59=9002313.59,OK=1
 D COMP1(F57,F59) ; everything in .57 also in .59?
 W !
 D COMP1(F59,F57) ; and the other direction, too
 W !?5 I OK W "OK!  All fields in common"
 E  W "NOT OK!  Some differences in fields"
 W " between ",F57," and ",F59,!
 Q
COMP1(F1,F2) N A S A=0
 F  S A=$O(^DD(F1,A)) Q:'A  D
 . Q:$D(^DD(F2,A))  ; Okay
 . I A>10000,A<11000,F1=9002313.57 Q  ; computed fields spec. for 57
 . S OK=0 W "Field ",A," is in ",F1," but not in ",F2,!
 Q
POSITION() ; return pointer to position within claim (D1)
 Q $P($G(^BPSTL(IEN57,0)),U,9)
IEN02() ; return pointer to claim 
 Q $P($G(^BPSTL(IEN57,0)),U,4)
IEN03() ; return pointer to response
 Q $P($G(^BPSTL(IEN57,0)),U,5)
REVIEN02() ; return pointer to reversal claim
 Q $P($G(^BPSTL(IEN57,4)),U)
REVIEN03() ; return pointer to reversal response
 Q $P($G(^BPSTL(IEN57,4)),U,2)
FIELD(F,REV) ; EP - retrieve field F from claim or response ; given D0
 ; returns value
 ; Special for reject codes:  F=511 gets ","-delimited string of codes
 ;  F=511.01 gets first code, F=511.02 gets second one, etc.
 N X,IEN02,IEN03,POS,IEN57 S IEN57=D0
 S POS=$$POSITION,IEN02=$$IEN02,IEN03=$$IEN03
 I $G(REV) S IEN02=$$REVIEN02,IEN03=$$REVIEN03
 I 'IEN02,F<400 D  Q X
 . S X=""
 . ; could define some of them based on pricing data
 I 'IEN03,F>400 D  Q X
 . S X=""
 I F<400 S X=$$GET1^DIQ(9002313.02,IEN02_",",F,"I")
 E  I F>400,F<500 S X=$$GET1^DIQ(9002313.0201,POS_","_IEN02_",",F,"I")
 E  I F=501!(F=524) S X=$$GET1^DIQ(9002313.03,IEN03_",",F,"I")
 E  I F\1=511 D REJCODES S:F#1 X=$G(X(F#1*100))
 E  S X=$$GET1^DIQ(9002313.0301,POS_","_IEN03_",",F,"I")
 ; strip trailing spaces
 F  Q:$E(X,$L(X))'=" "  S X=$E(X,1,$L(X)-1)
 D STRIPID ; strip field ID, if any
 D MONEY ; money fields, where appropriate
 D OTHER ; other special conversions
 Q X
REJCODES ; rejection codes for IEN03
 ; X = ","-delimited string of two-char codes
 ; X(j)=code_" "_description
 K X S X=""
 N I,J S (I,J)=0
 F  S I=$O(^BPSR(IEN03,1000,POS,511,I)) Q:'I  D
 . N A S A=$P(^BPSR(IEN03,1000,POS,511,I,0),U) Q:'A
 . S A=$O(^BPSF(9002313.93,"B",A,0)) Q:'A
 . S A=^BPSF(9002313.93,A,0)
 . S:X]"" X=X_"," S X=X_$P(A,U)
 . S J=J+1,X(J)=$P(A,U)_" "_$P(A,U,2)
 Q
STRIPID ; some fields have two-character field ID
 ; and first eliminate all those that don't:
 Q:F<307  Q:F=308
 I F>400,F<500 Q:F<410  Q:F=411  Q:F=414  Q:F=415  Q:F=419  Q:F=420  Q:F=426
 ;IHS/DSD/lwj 10/02 nxt line changed on behalf of David Slauenwhite
 I F>500 Q:F<512  Q:F=525  Q:F=526  ;DS 10/11/01
 S X=$E(X,3,$L(X))
 Q
MONEY ; some fields are money fields in signed overpunch format
 Q:F<400
 ;IHS/DSD/lwj 10/02 nxt line changed on behalf of David Slauenwhite
 I F>400,F<500 I F'=409,F'=410,F'=426,F'=430,F'=431,F'=433,F'=438,F'=428,F'=412 Q    ;DS 10/11/01 F'=412 test added during ILC A/R interface work
 I F>500 Q:F<505  Q:F=510  Q:F\1=511  Q:F=522  Q:F>523
 S X=+$$DFF2EXT^BPSECFM(X)
 I X=0 S X="" ; so [CAPTIONED] doesn't print it
 Q
OTHER ; other special conversions
 I F=442 S X=X/1000 Q  ; metric decimal quantity
 Q
