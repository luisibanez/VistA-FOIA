ICPTMOD ;ALB/DEK/KER - CPT MODIFIER APIS ; 04/18/2004
 ;;6.0;CPT/HCPCS;**6,12,13,14,19**;May 19, 1997
 ;
 ; External References
 ;   DBIA  10103  $$DT^XLFDT
 ;
 Q
MOD(MOD,MFT,MDT,SRC,DFN) ;  returns basic info on CPT MODIFIERs
 ;
 ; Input:   MOD   Modifier, Internal or External format (Required)
 ;          MFT   Modifier Format  "I" = IEN  "E" = .01 field (Default)
 ;          MDT   Date to check status for, FileMan format (default = TODAY)
 ;          SRC   Source Screen
 ;                  If 0 or Null, check Level I and II modifiers only
 ;                  If >0, check Level I, II, and III modifiers
 ;          DFN   Not in use but included in anticipation of future need
 ; 
 ; Output:  Returns a 10 piece string delimited by the up-arrow (^), where the
 ;          pieces are:
 ; 
 ;            1  Internal Entry Number
 ;            2  Modifier (.01 field)
 ;            3  Versioned Name (field 1 of the 61 multiple)
 ;            4  Code (.03 field) Alternate 5-digit Code for CPT modifiers
 ;            5  Source (.04 field) C:CPT; H:HCPCS; V:VA NATIONAL
 ;            6  Effective Date (from multiple field 60)
 ;            7  Status (.02 field of multiple field 60) 0:inactive; 1:active
 ;            8  Inactivation Date (from .01 of #60 multiple)
 ;            9  Activation Date (from .01 of #60 multiple)
 ;           10  Message (a message stating: CODE TEXT MAY BE INACCURATE)
 ; 
 ;           or 
 ; 
 ;           -1^Error Description
 ; 
 N DATA,EFF,EFFX,EFFS,STR,MODN,MODST
 I $G(MOD)="" S STR="-1^NO MODIFIER SELECTED" G MODQ
 I $G(MFT)="" S MFT="E"
 I "E^I"'[MFT S STR="-1^INVALID MODIFIER FORMAT" G MODQ
 S MDT=$S($G(MDT)="":$$DT^XLFDT,1:$$DTBR^ICPTSUPT(MDT))
 I MFT="E" S MODN=$O(^DIC(81.3,"B",MOD,0)) I $O(^(MODN)) S STR="-1^Multiple modifiers w/same name.  Select IEN: " D MULT G MODQ
 I MFT="E" S MOD=MODN
 S MOD=+MOD
 I 'MOD!'$D(^DIC(81.3,MOD)) S STR="-1^NO SUCH MODIFIER" G MODQ
 S DATA=$G(^DIC(81.3,MOD,0))
 S MODST=$$VSTCM(MOD,MDT)
 I '$L(DATA) S STR="-1^NO DATA" G MODQ
 S STR=MOD_"^"_$P(DATA,"^",1,4)
 I '$G(SRC),$P(STR,"^",5)="V" Q "-1^VA LOCAL MODIFIER SELECTED"
 S EFF=$$EFF^ICPTSUPT(81.3,MOD,MDT)
 I EFF<1 S $P(EFF,"^",2)=0
 S STR=STR_"^"_EFF_"^"_$$MSG^ICPTSUPT(MDT)
 S:$L(MODST) $P(STR,"^",3)=MODST
MODQ Q STR
 ;
MODD(CODE,OUTARR,DFN,CDT)       ; returns CPT description in array
 ;
 ; Input:   CODE   CPT Modifier code, internal or external format (Required)
 ;          ARY    Output Array Name for description
 ;                   e.g. "ABC" or "ABC("TEST")" 
 ;                   Default = ^TMP("ICPTD",$J)
 ;          DFN    Not in use but included in anticipation of future need
 ;          CDT    Date to screen against (default = TODAY)
 ;                   If CDT is prior to 1/1/1989, 1/1/1989 will be used
 ;                   If CDT is year only, the first of that year will be used
 ;                   If CDT is month/year only, the first of month will be used
 ;                   If CDT is later than today, TODAY will be used
 ; 
 ; Output:  #      Number of lines in description
 ; 
 ;          @ARY(1:n) - Versioned Description (lines 1-n) (from the 62 multiple)
 ;          @ARY(n+1) - blank
 ;          @ARY(n+1) - a message stating: CODE TEXT MAY BE INACCURATE
 ; 
 ;           or
 ; 
 ;          -1^Error Description
 ; 
 ;  ** NOTE - User must initialize ^TMP("ICPTD",$J), if used **
 ; 
 N ARR,END,CTV,I,N
 I $G(CODE)="" S N="-1^NO CODE SELECTED" G MODDQ
 I $G(OUTARR)="" S OUTARR="^TMP(""ICPTD"",$J,"
 I OUTARR'["(" S OUTARR=OUTARR_"("
 I OUTARR[")" S OUTARR=$P(OUTARR,")")
 S END=$E(OUTARR,$L(OUTARR)) I END'="("&(END'=",") S OUTARR=OUTARR_","
 I OUTARR="^TMP(""ICPTD"",$J," K ^TMP("ICPTD",$J)
 S CODE=$S(CODE?1.N:+CODE,1:$$CODEN(CODE)),I=0,N=0
 I CODE<1!'$D(^DIC(81.3,CODE)) S N="-1^NO SUCH CODE" G MODDQ
 S CDT=$S($G(CDT)="":$$DT^XLFDT,1:$$DTBR^ICPTSUPT(CDT))
 D VLTCM(+CODE,CDT,.CTV)
 S (N,I)=0 F  S I=$O(CTV(I)) Q:+I=0  D
 . S N=N+1,ARR=OUTARR_N_")",@ARR=$$TRIM($G(CTV(I)))
 I +N>0 D
 . S N=N+1,ARR=OUTARR_N_")",@ARR=" "
 . S N=N+1,ARR=OUTARR_N_")",@ARR=$$MSG^ICPTSUPT(CDT,1)
 I +N'>0 S N="-1^VERSIONED DESCRIPTION NOT FOUND FOR MODIFIER "_$P($G(^DIC(81.3,+CODE,0)),"^",1)
MODDQ Q N
 ;
MODP(CODE,MOD,MFT,MDT,SRC,DFN) ;  check if modifier can be used with code
 ;
 ; Input:   CODE  CPT/HCPCS Code, Internal or External Format (Required)
 ;          MOD   Modifier, Internal or External Format (Required)
 ;          MFT   Modifier Format "I" = IEN  "E" = .01 field (Default)
 ;          MDT   Date to check against, FileMan format (default = TODAY)
 ;                  If MDT is prior to 1/1/1989, 1/1/1989 will be used
 ;                  If MDT is year only, the first of that year will be used
 ;                  If MDT is month/year only, the first of month will be used
 ;                  If MDT is later than today, validation will be performed
 ;                  using the newest activation and inactivation dates
 ;          SRC   Source Screen
 ;                  If 0 or Null, check Level I and II code/modifiers only
 ;                  If >0, check Level I, II, and III code/modifiers
 ;          DFN   Not in use but included in anticipation of future need
 ; 
 ; Output:  0, if pair is unacceptable
 ; 
 ;           or
 ; 
 ;          IEN^Versioned Name (field 1 of the 61 multiple), if pair is acceptable
 ; 
 ;           or 
 ; 
 ;          -1^error message
 ; 
 N CODEA,CODN,PR,PRN,STR,MODN,MODN,MODX,POP,MODCK,MODST
 I $G(CODE)="" S STR="-1^NO CODE SELECTED" G MODPQ
 I $G(MOD)="" S STR="-1^NO MODIFIER SELECTED" G MODPQ
 I $G(MFT)="" S MFT="E"
 I "E^I"'[MFT S STR="-1^INVALID MODIFIER FORMAT" G MODQ
 S MDT=$S($G(MDT)="":$$DT^XLFDT,1:$$DTBR^ICPTSUPT(MDT))
 S CODN=$S(CODE?1.N:+CODE,1:$$CODEN^ICPTCOD(CODE))
 I CODN<1!'$D(^ICPT(CODN,0)) Q "-1^NO SUCH CPT CODE"
 S CODE=$P($G(^ICPT(CODN,0)),"^") I '$L(CODE) S STR="-1^NO SUCH CPT CODE" G MODPQ
 I '$G(SRC),$P(^ICPT(CODN,0),"^",6)="L" S STR="-1^VA LOCAL CODE SELECTED" G MODPQ
 S PRN=$$EFF^ICPTSUPT(81,CODN,MDT)
 I '$P(PRN,"^",2) Q "-1^CPT CODE INACTIVE"
 S CODEA=$$NUM^ICPTAPIU(CODE),MODCK=""
 I MFT="E" S MODN="",POP=0  F  S MODN=$O(^DIC(81.3,"B",MOD,MODN)) Q:(MODN="")!POP  D 
 . S MODCK=MODN
 . D MODC(MODN) S MODST=$$VSTCM(MODN,MDT)
 . I STR>0 S $P(STR,"^",2)=MODST,POP=1
 I MFT="I" S MODCK=MOD D MODC(MOD)
 I MODCK="" S MODCK=+MODCK
 I '$D(^DIC(81.3,MODCK,0)) S STR="-1^NO SUCH MODIFIER" G MODPQ
 I '$G(SRC),$P(^DIC(81.3,MODCK,0),"^",4)="V" S STR="-1^VA LOCAL MODIFIER SELECTED"
MODPQ Q $G(STR)
 ;
MODC(MOD) ; Checks modifier for range including code, and active for date desired
 ;
 ; Input:
 ;    MOD  - modifier ien
 ;
 N MODNM,MODEFF
 S MODEFF=$$EFF^ICPTSUPT(81.3,MOD,MDT)
 I '$P(MODEFF,"^",2) S STR="-1^modifier inactive" Q
 S PR=CODEA_.0001,PR=$O(^DIC(81.3,MOD,"M",PR),-1)
 I 'PR S STR=0 Q
 S PRN=^DIC(81.3,MOD,"M",PR)
 I 'PRN S STR="-1^bad modifier file entry" Q
 I PRN<CODEA S STR=0 Q
 S MODNM=$P($G(^DIC(81.3,MOD,0)),"^",2)
 S STR=MOD_"^"_MODNM
 Q
 ;
MULT ; Finds iens for all modifiers with same 2-letter code
 ;  MOD = .01, check B x-ref for other mods with equivalent .01 fields
 ;  output concatenates ien of each mod to STR, separated by ":"
 F MODN=0:0 S MODN=$O(^DIC(81.3,"B",MOD,MODN)) Q:'MODN   S STR=STR_MODN_"; "
 Q
 ;
CODEN(CODE)    ; return the ien of a CPT modifier
 ;   Input:  CPT modifier code
 ;  Output:  ien of code
 ;
 Q:$G(CODE)="" -1
 N COD S COD=+$O(^DIC(81.3,"BA",(CODE_" "),0))
 Q $S(COD>0:COD,1:-1)
 ;
VSTCM(IEN,VDATE) ; Versioned Short Text (CPT Modifier)
 N CPT0,CPTC,CPTI,CPTSTD,CPTSTI,CPTVDT,CPTTXT
 S CPTI=+($G(IEN)) Q:+CPTI'>0 ""  Q:'$D(^DIC(81.3,+CPTI)) ""
 S CPTVDT=$G(VDATE) S:'$L(CPTVDT)!(+CPTVDT'>0) CPTVDT=$$DT^XLFDT Q:$P(CPTVDT,".",1)'?7N ""
 S CPT0=$G(^DIC(81.3,+CPTI,0)),CPTC=$P(CPT0,"^",1) Q:'$L(CPTC) ""
 S CPTSTD=$O(^DIC(81.3,"AST",(CPTC_" "),(CPTVDT+.000001)),-1)
 I +CPTSTD>0 D  Q:$L($G(CPTTXT)) $G(CPTTXT)
 . S CPTSTI=$O(^DIC(81.3,"AST",(CPTC_" "),CPTSTD,+CPTI," "),-1),CPTTXT=$P($G(^DIC(81.3,+CPTI,61,+CPTSTI,0)),"^",2)
 S CPTSTD=$O(^DIC(81.3,+CPTI,61,"B",0)) I +CPTSTD>0 D  Q:$L($G(CPTTXT)) $G(CPTTXT)
 . S CPTSTI=$O(^DIC(81.3,+CPTI,61,"B",CPTSTD,0)),CPTTXT=$P($G(^DIC(81.3,+CPTI,61,+CPTSTI,0)),"^",2)
 Q $$TRIM($P(CPT0,"^",2))
VLTCM(IEN,VDATE,ARY) ; Versioned Description - Long Text (CPT Modifier)
 N CPT0,CPTC,CPTI,CPTSTD,CPTSTI,CPTVDT,CPTTXT
 S CPTI=+($G(IEN)) Q:+CPTI'>0  Q:'$D(^DIC(81.3,+CPTI))
 S CPTVDT=$G(VDATE) S:'$L(CPTVDT)!(+CPTVDT'>0) CPTVDT=$$DT^XLFDT Q:$P(CPTVDT,".",1)'?7N
 S CPT0=$G(^DIC(81.3,+CPTI,0)),CPTC=$P(CPT0,"^",1) Q:'$L(CPTC)
 S CPTSTD=$O(^DIC(81.3,"ADS",(CPTC_" "),(CPTVDT+.000001)),-1)
 I +CPTSTD>0 D  Q:+($O(ARY(0)))>0
 . S CPTSTI=$O(^DIC(81.3,"ADS",(CPTC_" "),CPTSTD,+CPTI," "),-1)
 . S (CPTD,CPTT)=0 F  S CPTD=$O(^DIC(81.3,+CPTI,62,CPTSTI,1,CPTD)) Q:+CPTD=0  D
 . . S CPTT=CPTT+1,ARY(CPTT)=$$TRIM($G(^DIC(81.3,+CPTI,62,+CPTSTI,1,+CPTD,0))),ARY(0)=CPTT
 S CPTSTD=$O(^DIC(81.3,+CPTI,62,"B",0)) I +CPTSTD>0 D  Q:+($O(ARY(0)))>0
 . S CPTSTI=$O(^DIC(81.3,+CPTI,62,"B",CPTSTD,0))
 . S (CPTD,CPTT)=0 F  S CPTD=$O(^DIC(81.3,+CPTI,62,CPTSTI,1,CPTD)) Q:+CPTD=0  D
 . . S CPTT=CPTT+1,ARY(CPTT)=$$TRIM($G(^DIC(81.3,+CPTI,62,+CPTSTI,1,+CPTD,0))),ARY(0)=CPTT
 K ARY S (CPTD,CPTT)=0 F  S CPTD=$O(^DIC(81.3,CPTI,"D",CPTD)) Q:+CPTD=0  D
 . S CPTT=CPTT+1,ARY(CPTT)=$$TRIM($G(^DIC(81.3,CPTI,"D",CPTD,0))),ARY(0)=CPTT
 Q
TRIM(X) ; Trim Spaces
 S X=$G(X) Q:X="" X F  Q:$E(X,1)'=" "  S X=$E(X,2,$L(X))
 F  Q:$E(X,$L(X))'=" "  S X=$E(X,1,($L(X)-1))
 F  Q:X'["  "  S X=$P(X,"  ",1)_" "_$P(X,"  ",2,229)
 Q X
