APCUKSCH ; "AND"ING INVERTED LIST SEARCH ; [ 11/13/86  9:50 AM ]
 K HITS S HITS=0
 I $D(HITLIMIT) S HLIM=HITLIMIT+1
 E  S HLIM=0
 S CMAX=DFN(1) F I=1:1:NWDS S:DFN(I)<CMAX CMAX=DFN(I)
RESTRT ;
 S I=0,EMPTY=0
SCLOOP ;
 S I=I+1
 G:I>NWDS!(EMPTY) ENDCHK
CMP S LOW=DFN(I)<CMAX,HIGH=DFN(I)>CMAX
 I LOW D INCSTK:PARTIAL(I),INCONE:'PARTIAL(I) G:'EMPTY CMP
 I HIGH S CMAX=DFN(I),I=0
 G SCLOOP
ENDCHK ;
 G:EMPTY EXIT
 D NOTCHK W "." D:'ELIM CHKSCRN
 I 'ELIM S HITS=HITS+1,HITS(HITS)=CMAX,HLIM=HLIM-1 G:HLIM=0 STOP
 S CMAX=CMAX+1
 G RESTRT
STOP W !,"Too many terms meet your criteria; please refine your search.",! K HITS S HITS=0
EXIT K EMPTY,HIGH,LOW,MINDFN,NUM,CMAX
 K PARTIAL,WORD,AWORD,DFN,ADFN
 K WD,D,J
 Q
 ;
NOTCHK ; CHECK POSSIBLE HIT FOR ELIMINATION BY "NOT"
 S ELIM=0,D=CMAX
 S J="" F Q=0:0 S J=$O(AWORD(0,J)) Q:J=""  S WD=AWORD(0,J) I $D(@REF4) S ELIM=1 Q
 Q
 ;
CHKSCRN ; CHECK SCREEN
 S Y=CMAX I 1,$D(@(REF1_"Y,0)")) X:$D(DIC("S")) DIC("S") E  S ELIM=1
 Q
 ;
INCONE ; ADVANCE DFN FOR EXACT MATCH CASE
 S D=DFN(I),WD=WORD(I)
 S:D<CMAX D=CMAX-1
 F Q=0:0 S D=$O(@REF4) Q:D=""!(D'<CMAX)
 S DFN(I)=D
 S:D="" EMPTY=1
 Q
 ;
INCSTK ; ADVANCE COMPOSITE DFN FOR PARTIAL MATCH CASE
 S J=0
 F Q=0:0 S J=$O(AWORD(I,J)) Q:J=""  D INC1 Q:D'=""
 I J="" S (D,DFN(I))="",EMPTY=1 Q
 S MINDFN=D
 F Q=0:0 S J=$O(AWORD(I,J)) Q:J=""  D INC1 S:D'=""&(D<MINDFN) MINDFN=D
 S DFN(I)=MINDFN
 Q
INC1 ;
 S D=ADFN(I,J),WD=AWORD(I,J)
 Q:ADFN(I,J)'<CMAX
 S D=CMAX-1
 F Q=0:0 S D=$O(@REF4) Q:D=""!(D'<CMAX)
 S:D'="" ADFN(I,J)=D
 K:D="" AWORD(I,J),ADFN(I,J)
 Q
