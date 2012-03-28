BGUGPLK ; IHS/OIT/MJL - GENERAL PATIENT LOOKUP FOR BGU WINDOWS ;
 ;;1.5;BGU;;MAY 26, 2005
 ;
 ;===================================================================
PTLIST(RESULT,BGUGX,BGUGMAX,BGUGMORE,BGUGPRAM)        ;EP-get list of patients and pass back
 ; INPUTS :
 ;      BGUGX = SEARCH-KEY
 ;    BGUGMAX = max number of returned matches
 ;   BGUGMORE = MORE STARTING FLAG
 ;   BGUGPRAM = PARAM FOR LATER USE
 ; SEARCH-KEY = used to limit the search.
 ;            = partial last name - use B cross ref.
 ;                   - RETURNS A LIST using B cross ref value.
 ;            = 1st letter of LAST name +  4 digits of SSN- DPT("BS5"
 ;                   - RETURNS A LIST
 ;            = DOB   - ^DPT("ADOB",DOB
 ;                   - RETURNS EXACT FIND
 ;            = Chart Number(all numeric) - use FIND^DIC call W/ EXACT
 ;                -  ^AUPNPAT("D",    - RETURNS EXACT FIND
 ;            = SSN - (ALL numeric) - DPT("SSN" - use FIND^DIC call
 ;                   - RETURNS EXACT FIND
 ;            = LOC - dont know what to do right now. - DPT("CN"
 ;    BGUGMAX = max number of records to send per call.
 ;  ^DD("DD") = "S Y=$$FMTE^DILIBF(Y,""5U"")"  - disp day of week
 ;
 ;if SEARCH-KEY is 1-6 digits - search by Chart Number.
 ;                   9 digits - search by SSN
 ;                 1A4N       - search by A1N4
 ;              contains "/", - search by DOB
 ;ELSE                        - search by partial name.
 ;OUTPUTS: RESULT() = NAME^DFN^DOB^SSN^HRCN^LOC
 ;
 K BGUDATA,RESULT
 N BGUGCNT,BGUGDFN,BGUGZROS
 S BGUGQT="""",RESULT(0.01)=0
 ;
 S BGUGROOT="^BGUTMP("_$J,BGUGTROT=BGUGROOT_")"
 S BGUGMROT=BGUGROOT_","_BGUGQT_"ERRMSG"_BGUGQT_")"
 K @BGUGTROT
 ;
 ;LIST - FIRST letter of last name and 4 digits of SSN:
 I BGUGX?1A4N D A1N4 Q
 ;
 ;FIND - If BGUGX contains "/", this is DOB (so DOB input must contain "/").
 I BGUGX["/" D DOB Q
 ;
 ;FIND - SSN - EXACT 9 digits.  ADD ;.09 would give SSN, but...
 I BGUGX?9N D SSN Q
 ;
 ;FIND - Chart Number - EXACT 1-6 digits.   ^AUPNPAT("D",BGUGCHRT,DFN,FAC)
 ;In SCREEN^DICL2(), DIENTRY = the curr. chart number, DIEN=DFN.
 I BGUGX?1.6N D CHRT Q
 ;
 ;LIST - Assume PARTIAL NAME search
 D LSTNM,KILL Q
 ;
A1N4 ;LIST BY A1N4
 S BGUGFILE=2,BGUGINDX="BS5",BGUGFLDS=".01",X1=$E(BGUGX),X2=$E(BGUGX,2,5)+10000
 S:X2'="10000" X2=X2-1,BGUGX=$E(BGUGX)_$E(X2,2,5)
 S:X2=10000 X1=$C($A(X1)-1),BGUGX=X1_9999
 S BGUGNX="S BGUGSTRT=$E(BGUGNM)_$E(BGUGSSN,1,4)"
 D DICLST,FMTOUT,KILL
 Q
 ;
DOB ;LOOK UP BY DOB- EXACT MATCH FIND
 ;DOB is a regular field in 2.   DOB is a COMPUTED field in 9000001.
 S BGUGFILE=2,BGUGINDX="ADOB",BGUGFLDS=".01"
 S BGUGNX="S BGUGSTRT=DOB"
 D DICFIND,FMTOUT,KILL
 Q
 ;
SSN ;EXACT MATCH FIND
 ;LIST- S X=1000000000+X-1,X=$E(X,2,10) D DICLST,FMTOUT,KILL Q
 S BGUGFILE=2,BGUGINDX="SSN",BGUGFLDS=".01;.09"
 S BGUGNX="S BGUGSTRT=BGUGSSN"
 D DICFIND,FMTOUT,KILL
 Q
 ;
CHRT ;EXACT MATCH FIND - 1 to 6 digits (No Leading zeros)
 ;LIST^DIC- In SCREEN^DICL2(), DIENTRY=the curr. chart number, DIEN=DFN.
 S BGUGSCRN="I $D(^AUPNPAT(""D"",DIVALUE,DIENTRY,DUZ(2)))"
 S BGUGFILE=9000001,BGUGINDX="D",BGUGFLDS=".01"
 S BGUGNX="S BGUGSTRT=CHRT"
 D DICFIND,FMTOUT,KILL
 Q
 ;
DICLST ;SETUP to call LIST^DIC( ) - BGUGSCRN code is executed in ^DIL2C
 S BGUGIEN="",BGUGFLGS=""
 S BGUGNUM=BGUGMAX+1,BGUGFROM=BGUGX
 S BGUGPART="",BGUGIDFR="",BGUGSCRN=$G(BGUGSCRN)
 D LIST^DIC(BGUGFILE,BGUGIEN,BGUGFLDS,BGUGFLGS,BGUGNUM,BGUGFROM,BGUGPART,BGUGINDX,BGUGSCRN,BGUGIDFR,BGUGTROT)
 Q
 ;
DICFIND ;SETUP to call FIND^DIC() - BGUGSCRN code is executed in ^DICF3
 S BGUGIEN="",BGUGFLGS=""
 S BGUGNUM=BGUGMAX+1,BGUGVAL=BGUGX
 S BGUGIDFR="",BGUGSCRN=$G(BGUGSCRN)
 D FIND^DIC(BGUGFILE,BGUGIEN,BGUGFLDS,BGUGFLGS,BGUGVAL,BGUGNUM,BGUGINDX,BGUGSCRN,BGUGIDFR,BGUGTROT,BGUGMROT)
 Q
 ;
FMTOUT ;FMT output
 N BGUGCHRT,BGUGDFN,BGUGGLB,I,BGUGNM,BGUGOUT,BGUGSSN
 S BGUGGLB=BGUGROOT_","_BGUGQT_"DILIST"_BGUGQT_")",BGUGOUT="RESULT",BGUGCTR=0
 S I=0 F  S I=$O(@BGUGGLB@(2,I)) Q:I=""  D
 . S BGUGDFN=@BGUGGLB@(2,I),BGUGNM=@BGUGGLB@("ID",I,".01")
 . S BGUGVAL=^DPT(BGUGDFN,0),BGUSEX=$P(BGUGVAL,U,2),Y=$P(BGUGVAL,U,3) X ^DD("DD")
 . S BGUGSSN=$P(BGUGVAL,U,9)
 . S BGUGHRCN=$P($G(^AUPNPAT(BGUGDFN,41,DUZ(2),0)),U,2)
 . S BGUGGLOC=$P($G(^DPT(BGUGDFN,.1)),U,1),BGUGGLOC=$S(BGUGGLOC="":"OP",1:BGUGGLOC)
 . S BGUGCTR=BGUGCTR+1,@BGUGOUT@(BGUGCTR)=BGUGNM_U_BGUGDFN_U_Y_U_BGUGSSN_U_BGUGHRCN_U_BGUGGLOC_U_BGUSEX
 S @BGUGOUT@(0.01)=BGUGCTR
 S BGUGSTRT=""
 I BGUGCTR>BGUGMAX X $G(BGUGNX) S @BGUGOUT@(BGUGMAX+1)="..MORE^"_BGUGSTRT_"|"_BGUGDFN
 E  S @BGUGOUT@(BGUGCTR+1)="**END**"
 Q
 ;
LSTNM ;Partial last name search
 S %=$S($L(BGUGMORE):$O(^DPT("B",$P(BGUGMORE,"|",1)),-1),1:$O(^DPT("B",BGUGX),-1))
 S BGUGCNT=0
 S BGUGDFN=$P(BGUGMORE,"|",2) S BGUGDFN=+BGUGDFN,BGUGDFN=BGUGDFN-1
 S BGUGGL=$L(BGUGX)
 ;
 F  S %=$O(^DPT("B",%)) Q:%=""!($E(%,1,BGUGGL)'=BGUGX)  D  Q:BGUGCNT=BGUGMAX
 . F  S BGUGDFN=$O(^DPT("B",%,BGUGDFN)) Q:'BGUGDFN!(BGUGCNT=BGUGMAX)  D:$G(^DPT(BGUGDFN,0))'="" LSTNMA
 I BGUGCNT=BGUGMAX&($L(%)),$E(%,1,BGUGGL)=BGUGX D
 . S:$L(BGUGDFN) BGUGCNT=BGUGCNT+1,RESULT(BGUGCNT)="..MORE^"_%_"|"_BGUGDFN
 . S:'$L(BGUGDFN) %=$O(^DPT("B",%)),BGUGDFN=$O(^DPT("B",%,BGUGDFN)) S BGUGCNT=BGUGCNT+1,RESULT(BGUGCNT)="..MORE^"_%_"|"_BGUGDFN
 ;S:$E(%,1,BGUGGL)'=BGUGX BGUGCNT=BGUGCNT+1,RESULT(BGUGCNT)="**END**"
 S RESULT(0.01)=BGUGCNT
 Q
LSTNMA ;
 S BGUGVAL=^DPT(BGUGDFN,0),BGUSEX=$P(BGUGVAL,U,2),Y=$P(BGUGVAL,U,3) X ^DD("DD")
 S BGUGCNT=BGUGCNT+1
 S RESULT(BGUGCNT)=%_U_BGUGDFN_U_Y_U_$P(BGUGVAL,"^",9)_U_$P($G(^AUPNPAT(BGUGDFN,41,DUZ(2),0)),U,2)
 S BGUGGLOC=$P($G(^DPT(BGUGDFN,.1)),U,1)
 S RESULT(BGUGCNT)=RESULT(BGUGCNT)_U_$S(BGUGGLOC="":"OP",1:BGUGGLOC)
 S RESULT(BGUGCNT)=RESULT(BGUGCNT)_U_BGUSEX
 Q
 ;
KILL ;
 K %,BGUAGEG,BGUBYR,BGUGCNT,BGUD,BGUGDFN,BGUEYR,BGUINC,BGUJ,BGUGMAX
 K BGUOBJ,BGUOBJN,BGUOBJV,BGUPARM,BGUGQTR,BGURTN,BGUYQ,BGUYR
 K BGUGCTR,BGUGFLDS,BGUGFILE,BGUGFLGS,BGUGFROM,BGUGGLB
 K BGUGIDFR,BGUGIEN,BGUGINDX,BGUGGL,BGUGZROS,BGUGVAL,BGUGSSN
 K BGUGNM,BGUGNUM,BGUGOUT,BGUGPART,BGUGQT,BGUGROOT,BGUGSCRN,BGUGTROT,BGUSEX
 K X1,X2,I
 Q
