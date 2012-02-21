MAGSIXGT ;WOIFO/EdM/GEK/SEB - RPC for Document Imaging ; 04/29/2002  16:15
 ;;3.0;IMAGING;**8,48**;Jan 11, 2005
 ;; +---------------------------------------------------------------+
 ;; | Property of the US Government.                                |
 ;; | No permission to copy or redistribute this software is given. |
 ;; | Use of unreleased versions of this software requires the user |
 ;; | to execute a written test agreement with the VistA Imaging    |
 ;; | Development Office of the Department of Veterans Affairs,     |
 ;; | telephone (301) 734-0100.                                     |
 ;; |                                                               |
 ;; | The Food and Drug Administration classifies this software as  |
 ;; | a medical device.  As such, it may not be changed in any way. |
 ;; | Modifications to this software may result in an adulterated   |
 ;; | medical device under 21CFR820, the use of which is considered |
 ;; | to be a violation of US Federal Statutes.                     |
 ;; +---------------------------------------------------------------+
 ;;
 Q
 ;
IGT(OUT,CLS,IGN) ;RPC [MAG4 INDEX GET TYPE]
 ; OUT : the result array
 ; CLS : a ',' separated list of Classes.
 ; IGN : Flag to IGNore the Status field. 1=IGNore
 N C,D0,LOC,N,OK,X
 K OUT
 S CLS=$G(CLS),IGN=$G(IGN)
 D CLS Q:$D(OUT(0))
 ;
 S N=1
 S D0=0 F  S D0=$O(^MAG(2005.83,D0)) Q:'D0  D
 . S X=$G(^MAG(2005.83,D0,0)),C=$P(X,"^",2)
 . ; if Class not null, check it. Null classes will be listed in output.
 . I CLS'="" Q:C=""  Q:'$D(OK(1,C))
 . I 'IGN Q:$P(X,"^",3)="I"  ; This is the Status field inactive Flag;
 . S LOC($P(X,"^",1)_"^"_$P($G(^MAG(2005.83,D0,1)),"^",1)_"|"_D0)=""
 . Q
 S X="" F  S X=$O(LOC(X)) Q:X=""  S N=N+1,OUT(N)=X
 I N<2 S OUT(0)="0^-3, No Types Found for """_CLS_"""."
 E  S OUT(0)="1^OK: "_N,OUT(1)=CLS_" Image Types^Abbr"
 Q
IGE(OUT,CLS,SPEC,IGN) ;RPC [MAG4 INDEX GET EVENT]
 ; Index Get Procedure/Event (optionally based on (Sub)Specialty)
 ; OUT : the result array
 ; CLS : a ',' separated list of Classes.
 ; SPEC : a ',' separated list of Spec/Subspecialties 
 ; IGN : Flag to IGNore the Status field. 1=IGNore
 N C,D0,D1,LOC,N,NO,OK,S,X
 K OUT
 S CLS=$G(CLS),SPEC=$G(SPEC),IGN=$G(IGN)
 D CLS Q:$D(OUT(0))
 D SPEC Q:$D(OUT(0))
 ;
 S N=1
 S D0=0 F  S D0=$O(^MAG(2005.85,D0)) Q:'D0  D
 . S X=$G(^MAG(2005.85,D0,0)),C=$P(X,"^",2)
 . ; if Class not null, check it. Null classes will be listed in output.
 . I CLS'="" Q:C=""  Q:'$D(OK(1,C))
 . I 'IGN Q:$P(X,"^",3)="I"  ;This is the Status field inactive Flag;
 . ; if Specialty not null, check it. Null Specialties will be listed in output.
 . I SPEC'="" D  Q:NO
 . . S NO=0
 . . ; Next line: put "S:'D1 NO=1" before the quit to block implicit mapping 
 . . S D1=0 F  S D1=$O(^MAG(2005.85,D0,1,D1)) Q:'D1  D  Q:'NO
 . . . S NO=1
 . . . S S=$P($G(^MAG(2005.85,D0,1,D1,0)),"^",1)
 . . . Q:S=""
 . . . S:$D(OK(3,S)) NO=0
 . . . Q
 . . Q
 . S LOC($P(X,"^",1)_"^"_$P($G(^MAG(2005.85,D0,2)),"^",1)_"|"_D0)=""
 . Q
 S X="" F  S X=$O(LOC(X)) Q:X=""  S N=N+1,OUT(N)=X
 I N<2 S OUT(0)="0^No Procedures or Events found for """_CLS_""" and """_SPEC_"""."
 E  S OUT(0)="1^OK: "_N,OUT(1)="Procedure/Event^Abbr"
 Q
 ;
IGS(OUT,CLS,EVENT,IGN) ;RPC [MAG4 INDEX GET SPECIALTY]
 ; OUT : the result array
 ; CLS : a ',' separated list of Classes.
 ; EVENT : a ',' separated list of Proc/Events
 ; IGN : Flag to IGNore the Status field. 1=IGNore
 N C,D0,D1,E,LOC,N,OK,X
 K OUT
 S CLS=$G(CLS),EVENT=$G(EVENT),IGN=$G(IGN)
 I CLS'="" D CLS Q:$D(OUT(0))
 I EVENT'="" D EVENT Q:$D(OUT(0))
 ;
 S N=1
 I EVENT="" S D0=0 F  S D0=$O(^MAG(2005.84,D0)) Q:'D0  D
 . S X=$G(^MAG(2005.84,D0,0)),C=$P(X,"^",2) ;,E=$P(X,"^",3)
 . ; if Class not null, check it. Null classes will be listed in output.
 . I CLS'="" Q:C=""  Q:'$D(OK(1,C))
 . I 'IGN Q:$P(X,"^",4)="I"  ; This is the Status field inactive Flag;
 . ;I EVENT'="" Q:E=""  Q:'$D(OK(2,E))
 . S LOC($P(X,"^",1)_"^"_$P($G(^MAG(2005.84,D0,2)),"^",1)_"|"_D0)=""
 . Q
 I EVENT]"" S E="" F  S E=$O(OK(2,E)) Q:E=""  D
 . ; if Class not null, check it. Null classes will be listed in output.
 . I CLS'="" S C=$P($G(^MAG(2005.85,E,0)),"^",2) Q:'$D(OK(1,C))
 . I +$P($G(^MAG(2005.85,E,1,0)),U,3)=0 D GETSPECS(.LOC)
 . S D0="" F  S D0=$O(^MAG(2005.85,E,1,D0)) Q:D0=""  D
 . . S D1=$G(^MAG(2005.85,E,1,D0,0)) I D1="" Q
 . . S X=$G(^MAG(2005.84,D1,0))
 . . I X]"" S LOC($P(X,"^",1)_"^"_$P($G(^MAG(2005.84,D1,2)),"^",1)_"|"_D1)=""
 . Q
 S X="" F  S X=$O(LOC(X)) Q:X=""  S N=N+1,OUT(N)=X
 I N<2 S OUT(0)="0^-5, No (Sub)Specialties found for """_CLS_""" and """_EVENT_"""."
 E  S OUT(0)="1^OK: "_N,OUT(1)="Specialty/SubSpecialty^Abbr"
 Q
 ;
PKG N P
 I $G(PKG)="" Q
 F I=1:1:$L(PKG,",") I $L($P(PKG,",",I)) S OK(5,$P(PKG,",",I))=""
 Q
ORIGIN ;
 N V,MAGR,MAGD,MAGE
 I $G(ORIGIN)="" Q
 ; P48T1 Allow Internal or External for Origin (set of codes)
 F I=1:1:$L(ORIGIN,",") I $L($P(ORIGIN,",",I)) S OK(6,$P(ORIGIN,",",I))="" D
 . S MAGD=$P(ORIGIN,",",I)
 . D CHK^DIE(2005,45,"E",MAGD,.MAGR) I MAGR'="^" S OK(6,MAGR)="",OK(6,MAGR(0))=""
 Q
CLS N C,CLSX
 I $G(CLS)="" Q
 F I=1:1:$L(CLS,",") I $L($P(CLS,",",I)) S CLSX=$P(CLS,",",I) D
 . I CLSX=+CLSX,$D(^MAG(2005.82,CLSX)) S OK(1,CLSX)=""
 . S C="" F  S C=$O(^MAG(2005.82,"B",CLSX,C)) Q:C=""  S OK(1,C)=""
 I $O(OK(1,""))="" S OUT(0)="0^Invalid Class: """_CLS_"""." Q
 Q
 ;
EVENT N E,EVENTX
 I $G(EVENT)="" Q
 F I=1:1:$L(EVENT,",") I $L($P(EVENT,",",I)) S EVENTX=$P(EVENT,",",I) D
 . I EVENTX=+EVENTX,$D(^MAG(2005.85,EVENTX)) S OK(2,EVENTX)=""
 . S E="" F  S E=$O(^MAG(2005.85,"B",EVENTX,E)) Q:E=""  S OK(2,E)=""
 I $O(OK(2,""))="" S OUT(0)="0^Invalid Event: """_EVENT_"""." Q
 Q
 ;
SPEC N S,SPECX
 I $G(SPEC)="" Q
 F I=1:1:$L(SPEC,",") I $L($P(SPEC,",",I)) S SPECX=$P(SPEC,",",I) D
 . I SPECX=+SPECX,$D(^MAG(2005.84,SPECX)) S OK(3,SPECX)=""
 . S S="" F  S S=$O(^MAG(2005.84,"B",SPECX,S)) Q:S=""  S OK(3,S)=""
 I $O(OK(3,""))="" S OUT(0)="0^Invalid Specialty: """_SPEC_"""." Q
 Q
 ;
TYPE N T,TYPEX
 I $G(TYPE)="" Q
 F I=1:1:$L(TYPE,",") I $L($P(TYPE,",",I)) S TYPEX=$P(TYPE,",",I) D
 . I TYPEX=+TYPEX,$D(^MAG(2005.83,TYPEX)) S OK(4,TYPEX)=""
 . S T="" F  S T=$O(^MAG(2005.83,"B",TYPEX,T)) Q:T=""  S OK(4,T)=""
 I $O(OK(4,""))="" S OUT(0)="0^Invalid Type: """_TYPE_"""." Q
 Q
 ;
GETSPECS(LOC) N D0,X
 S D0=0 F  S D0=$O(^MAG(2005.84,D0)) Q:'D0  D
 . S X=$G(^MAG(2005.84,D0,0)) I X]"" S LOC($P(X,"^",1)_"|"_D0)=""
 . Q
 Q
 ;
D2(N) Q $TR($J(N,2)," ",0)
 ;
E2I(D) N %DT,X,Y
 Q:$P(D,".",1)?7N D\1
 Q:D="" 0
 S X=D,%DT="TS" D ^%DT Q:Y<0 0
 Q Y\1
