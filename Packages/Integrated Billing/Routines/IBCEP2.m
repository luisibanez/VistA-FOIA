IBCEP2 ;ALB/TMP - EDI UTILITIES for provider ID ;13-DEC-99
 ;;2.0;INTEGRATED BILLING;**137,181,232,280**;21-MAR-94
 ; DBIA for access to fields 53.2,54.1,54.2 in file 200: 224
 ;
GETID(IBIFN,IBTYPE,IBPROV,IBSEQ,IBT,IBT1) ; Extract IBTYPE id for the bill
 ; IBIFN = bill ien (file 399)
 ; IBTYPE = 2:PERFORMING PROVIDER ID (1 and 3 deleted)
 ; IBSEQ = numeric COB sequence of the insurance on bill
 ; Returns IBT = ien of the provider id type^ien of entry^file # for id
 ;
 S IBT=0
 Q:IBTYPE'=2 ""
 N IBID,IBPTYP
 S IBID=$$IDFIND(IBIFN,"",IBPROV,IBSEQ,1,.IBT)
 I IBID="" S IBT=""
 ;
 Q IBID
 ;
IDFIND(IBIFN,IBPTYP,IBPROV,IBSEQ,IBPERF,IBT) ;Loop thru source levels
 ;   (if id definition allows) to find correct ID
 ; IBIFN = bill ien (file 399)
 ; IBPTYP = ien of the provider id type in file 355.97 or if null,
 ;          the default performing provider ID type for the ins co. in
 ;          COB sequence IBSEQ will be calculated
 ; IBPROV = (variable pointer syntax) provider on bill IBIFN
 ; IBSEQ = numeric COB sequence of the bill
 ; IBPERF = 1 if the performing provider id is needed
 ; Returns IBT = ptr to file 355.97^entry #^file #
 ;
 S IBT=+$G(IBPTYP)
 Q:'$G(IBPERF)!'$G(IBPROV) ""
 N IBSPEC,IBINS,IBINS4,IBSRC,IBUP,IBID,IBALT,IBPROF,Z
 I $G(IBSEQ)="" S IBSEQ=+$$COBN^IBCEF(IBIFN) ; Default to current COB seq
 S IBINS=+$P($G(^DGCR(399,IBIFN,"I"_IBSEQ)),U),IBINS4=$G(^DIC(36,+IBINS,4))
 S IBPROF=($$FT^IBCEF(IBIFN)=2) S:'IBPROF IBPROF=2
 ; form type is HCFA (prof)=1, UB92 (inst)=2
 I $G(IBPTYP)="" S (IBT,IBPTYP)=+$P(IBINS4,U,IBPROF) ; Def to perf prv typ for form
 I 'IBPTYP Q ""  ; No default id type
 S IBSPEC=$G(^IBE(355.97,IBPTYP,1)),IBSRC=$P($G(^IBE(355.97,+IBPTYP,0)),U,2),IBSRC=$S('IBSRC:5,1:IBSRC),IBUP=1
 S IBALT=0
 ;
 F  D  Q:'IBUP!($G(IBID)'="")  S IBSRC=IBSRC-1 Q:'IBSRC
 . ;
 . I IBSRC=1,$TR($P(IBSPEC,U,1,3),"^0")'="" D  Q  ; Indiv prov default
 .. N IBSTATE
 .. I $P(IBSPEC,U,2) D  Q  ; Federal DEA # from field 53.2 file 200
 ... S IBID=$P($G(^VA(200,+IBPROV,"PS")),U,2) ; DBIA224
 ... S $P(IBT,U,2,3)=(IBPROV_U_200)
 .. S IBSTATE=+$$CAREST^IBCEP2A(IBIFN)
 .. I $P(IBSPEC,U) D  Q  ; State issued DEA # needed
 ... Q:'IBSTATE
 ... ; Extract the state issuing DEA # from field 54.2 file 200
 ... S Z=+$O(^VA(200,+IBPROV,"PS2","B",IBSTATE,0)),IBID=$P($G(^VA(200,+IBPROV,"PS2",Z,0)),U,2) ; DBIA224
 ... S $P(IBT,U,2,3)=(+IBPROV_";"_Z_U_200)
 .. I $P(IBSPEC,U,3) D  Q  ; State license # needed
 ... Q:'IBSTATE
 ... ; Extract the state license # from field 54.1 file 200
 ... I IBPROV["VA(200" S Z=+$O(^VA(200,+IBPROV,"PS1","B",IBSTATE,0)),IBID=$P($G(^VA(200,+IBPROV,"PS1",Z,0)),U,2),$P(IBT,U,2,3)=(+IBPROV_";"_IBSTATE_U_200) ; DBIA224
 ... I IBPROV["IBA(355.93" S IBID=$P($G(^IBA(355.93,+IBPROV,0)),U,12),$P(IBT,U,2,3)=(+IBPROV_U_355.93)
 . ;
 . I IBSRC=2,$P(IBSPEC,U,4) D  Q  ; FACILITY FED TAX ID #
 .. N IBXDATA
 .. D F^IBCEF("N-FEDERAL TAX ID",,,IBIFN)
 .. S IBID=IBXDATA,$P(IBT,U,2,3)=(U_350.9)
 . ;
 . I IBSRC=1 S IBID=$$SRC1(IBIFN,"*ALL*",IBPTYP,IBPROV,.IBT) Q
 . ;
 . I IBSRC=2 S IBID=$$SRC2(IBPTYP,.IBT) Q
 . ;
 . I IBSRC=3 S IBID=$$SRC3(IBIFN,IBINS,IBPTYP,.IBT) Q
 . ; 
 . I IBSRC=4 S IBID=$$SRC4(IBIFN,IBINS,IBPTYP,IBPROV,.IBT) Q
 . ;
 . I IBSRC=5 S IBID=$$SRC5(IBIFN,IBINS,IBPTYP,IBSEQ,.IBT) Q
 . ;
 . I IBSRC=6 S IBID=$$SRC6(IBIFN,IBINS,IBPTYP,IBPROV,IBSEQ,.IBT) Q
 ;
 Q $G(IBID)
 ;
GETALL(IBTYPE,IBIFN,IBPROV,IBPID) ; Extract all performing prov id's for a
 ; provider (IBPROV - vp format) on bill IBIFN
 ; IBTYPE = type of ID to return (see GETID above)
 ;
 ; Returns array IBPID(COB SEQ #)=id (pass by reference) AND
 ;   IBPID(COB SEQ #,1)=ien of id type (ptr to 355.97)
 ;   IBPID = current insurance co's id
 ;
 N Z,COB,Z1,IBT
 S COB=$$COBN^IBCEF(IBIFN)
 F Z=1:1:3 Q:'$D(^DGCR(399,IBIFN,"I"_Z))  S IBPID(Z)=$$GETID(IBTYPE,IBIFN,IBPROV,Z,.IBT),IBPID(Z,1)=IBT I Z=COB S Z1=IBPID(Z)
 Q $G(Z1)
 ;
SRC1(IBIFN,IBINS,IBPTYP,IBPROV,IBT) ; Licensing/gov't issued # - provider specific
 ; Parameter definitions for SRC1, SRC3, SRC4, SRC5, SRC6:
 ;   IBIFN = ien of bill (file 399)
 ;   IBINS = ien of insurance co (file 36) or *ALL* for all insurance
 ;           (always *ALL* for SRC1)
 ;   IBPTYP = ien of the provider id type in file 355.97
 ;   IBPROV = (variable pointer syntax) provider on bill IBIFN
 ;   IBT = returned as type ien^file ien^file #
 ;
 N IBID,IB,IBRX,IBIDSV
 S IBID="",IB=0,IBRX=$$ISRX^IBCEF1(IBIFN),IBIDSV=""
 I $G(IBPROV) F  S IB=$O(^IBA(355.9,"AD",IBPTYP,IBPROV,IBINS,IB)) Q:'IB  D  Q:IBID'=""
 . S IBID=$$UNIQ1(IBIFN,IBINS,IBPTYP,IBPROV,"",IB)
 . I IBRX,$P($G(^IBA(355.9,IB,0)),U,5)'=3 S:IBIDSV="" IBIDSV=IBID S IBID="" ; Save 1st 'match' if no rx specific id
 I IBID="",IBIDSV'="" S IBID=IBIDSV
 Q IBID
 ;
SRC2(IB35597,IBT) ; Facility default - all providers
 ; IB35597 = ien of the provider id type entry in file 355.97
 ; IBT = returned as type ien^file ien^file #
 ;
 S $P(IBT,U,2,3)=(+IB35597_U_355.97)
 Q $P($G(^IBE(355.97,+IB35597,0)),U,4)
 ;
SRC3(IBIFN,IBINS,IBPTYP,IBT) ; Ins co/all providers
 ; See SRC1 for parameter definitions
 N IB,IBID,IBRX,IBIDSV
 S IBID="",IB=0,IBRX=$$ISRX^IBCEF1(IBIFN),IBIDSV=""
 F  S IB=$O(^IBA(355.91,"AC",IBINS,IBPTYP,"*N/A*",IB)) Q:'IB  D  Q:IBID'=""
 . S IBID=$$UNIQ2(IBIFN,IBINS,IBPTYP,"",IB,.IBT)
 . I IBRX,$P($G(^IBA(355.91,IB,0)),U,5)'=3 S:IBIDSV="" IBIDSV=IBID S IBID="" ; Save 1st 'match' if no rx specific id
 I IBID="",IBIDSV'="" S IBID=IBIDSV
 Q IBID
 ;
SRC4(IBIFN,IBINS,IBPTYP,IBPROV,IBT) ;  Insurance co/individual provider
 ; See SRC1 for parameter definitions
 ;
 N IBID,IB,IBRX,IBIDSV
 S IBID="",IB=0,IBRX=$$ISRX^IBCEF1(IBIFN),IBIDSV=""
 I $G(IBPROV) F  S IB=$O(^IBA(355.9,"AD",IBPTYP,IBPROV,IBINS,IB)) Q:'IB  D  Q:IBID'=""
 . S IBID=$$UNIQ1(IBIFN,IBINS,IBPTYP,IBPROV,"",IB,.IBT)
 . I IBRX,$P($G(^IBA(355.9,IB,0)),U,5)'=3 S:IBIDSV="" IBIDSV=IBID S IBID="" ; Save 1st 'match' if no rx specific id
 I IBID="",IBIDSV'="" S IBID=IBIDSV
 Q IBID
 ;
SRC5(IBIFN,IBINS,IBPTYP,IBSEQ,IBT) ; Ins co/all providers/care unit
 ; See SRC1 for missing parameter definitions
 ; IBSEQ = the numeric COB sequence of the insurance on the bill
 ;
 N IBP,IBUNIT,IBID,IB,Z,IBIDSV,IBRX
 S IBID="",Z=0,IBRX=$$ISRX^IBCEF1(IBIFN),IBIDSV=""
 S IBP=+$O(^DGCR(399,IBIFN,"PRV","B",$S($$FT^IBCEF(IBIFN)=3:4,1:3),0)),IBUNIT=$P($G(^DGCR(399,IBIFN,"PRV",IBP,0)),U,8+IBSEQ)
 I IBUNIT'="" F  S Z=$O(^IBA(355.96,"AC",IBINS,IBPTYP,Z)) Q:'Z  D  Q:IBID'=""
 . S IB=0 F  S IB=$O(^IBA(355.91,"ACARE",Z,IB)) Q:'IB  D  Q:IBID'=""
 .. S IBID=$$UNIQ2(IBIFN,IBINS,IBPTYP,IBUNIT,IB,.IBT)
 .. I IBRX,$P($G(^IBA(355.91,IB,0)),U,5)'=3 S:IBIDSV="" IBIDSV=IBID S IBID="" ; Save 1st 'match' if no rx specific id
 I IBID="",IBIDSV'="" S IBID=IBIDSV
 Q IBID
 ;
SRC6(IBIFN,IBINS,IBPTYP,IBPROV,IBSEQ,IBT) ; Ins co/ind provider/care unit
 ; See SRC1 for missing parameter definitions
 ; IBSEQ = the numeric COB sequence of the insurance on the bill
 ;
 N IBUNIT,IBP,IBID,IB
 S IBID="",IB=0
 S IBP=+$O(^DGCR(399,"PRV","B",$S($$FT^IBCEF(IBIFN)=3:3,1:4),0)),IBUNIT=$P($G(^DGCR(399,IBIFN,"PRV",IBP,0)),U,8+IBSEQ)
 I $G(IBPROV),IBUNIT'="" F  S IB=$O(^IBA(355.9,"AD",IBPTYP,IBPROV,IBINS,IB)) Q:'IB  D  Q:IBID'=""
 . S IBID=$$UNIQ1(IBIFN,IBINS,IBPTYP,IBPROV,IBUNIT,IB,.IBT)
 Q IBID
 ;
UNIQ1(IBIFN,IBINS,IBPTYP,IBPROV,IBUNIT,IBCU,IBT) ; Match most-least specific
 ; *** SEE PARAMETER DEFINITIONS IN IBCEP3 ***
 ;
 ; Start in file 355.9 (Specific Provider)
 ;   IBPROV = (variable pointer syntax) provider on bill IBIFN
 ;
 N Q,Z0,Z1,Z2,IBID,IBX
 S IBID=""
 S IBX=$P($G(^IBA(355.9,+IBCU,0)),U,3) S:"0"[IBX IBX="*N/A*"
 S Z0=$$FT^IBCEF(IBIFN),Z0=$S(Z0=2:2,Z0=3:1,1:0),Z1=$$INPAT^IBCEF(IBIFN,1) S:'Z1 Z1=2 S Z2=$$ISRX^IBCEF1(IBIFN)
 ;
 ; Match all elements
 F Q=$S(Z2:3,1:Z1),$S(Z2:Z1,1:"") I Q'="",$D(^IBA(355.9,"AUNIQ",IBPROV,IBINS,IBX,Z0,Q,IBPTYP,IBCU)) S IBID=$P($G(^IBA(355.9,IBCU,0)),U,7),$P(IBT,U,2,3)=(IBCU_U_355.9) Q
 G:IBID'="" UNIQ1Q
 ;
 ; Match both form types,specific I/O element
 F Q=$S(Z2:3,1:Z1),$S(Z2:Z1,1:"") I Q'="",$D(^IBA(355.9,"AUNIQ",IBPROV,IBINS,IBX,0,Q,IBPTYP,IBCU)) S IBID=$P($G(^IBA(355.9,IBCU,0)),U,7),$P(IBT,U,2,3)=(IBCU_U_355.9) Q
 G:IBID'="" UNIQ1Q
 ;
 ; Match specific form type, both I/O element or Rx
 F Q=$S(Z2:3,1:0),$S(Z2:0,1:"") I Q'="",$D(^IBA(355.9,"AUNIQ",IBPROV,IBINS,IBX,Z0,Q,IBPTYP,IBCU)) S IBID=$P($G(^IBA(355.9,IBCU,0)),U,7),$P(IBT,U,2,3)=(IBCU_U_355.9) Q
 G:IBID'="" UNIQ1Q
 ;
 ; Match both form types, both I/O element or Rx
 F Q=$S(Z2:3,1:0),$S(Z2:0,1:"") I Q'="",$D(^IBA(355.9,"AUNIQ",IBPROV,IBINS,IBX,0,Q,IBPTYP,IBCU)) S IBID=$P($G(^IBA(355.9,IBCU,0)),U,7),$P(IBT,U,2,3)=(IBCU_U_355.9) Q
 ;
UNIQ1Q Q IBID
 ;
UNIQ2(IBIFN,IBINS,IBPTYP,IBUNIT,IBCU,IBT) ; Match on most-least specific
 ; *** SEE PARAMETER DEFINITIONS IN IBCEP3 ***
 ;
 ; Start in file 355.91 (Specific Insurance)
 ;
 N Q,Z0,Z1,Z2,IBID,IBX
 S IBID="" S:"0"[$G(IBUNIT) IBUNIT="*N/A*"
 S Z0=$$FT^IBCEF(IBIFN),Z0=$S(Z0=2:2,Z0=3:1,1:0),Z1=$$INPAT^IBCEF(IBIFN,1) S:'Z1 Z1=2 S Z2=$$ISRX^IBCEF1(IBIFN)
 ;
 ; Match all elements
 F Q=$S(Z2:3,1:Z1),$S(Z2:Z1,1:"") I Q'="",$D(^IBA(355.91,"AUNIQ",IBINS,IBUNIT,Z0,Q,IBPTYP,IBCU)) S IBID=$P($G(^IBA(355.91,IBCU,0)),U,7),$P(IBT,U,2,3)=(IBCU_U_355.91) Q
 G:IBID'="" UNIQ2Q
 ;
 ; Match both form types,specific I/O element
 F Q=$S(Z2:3,1:Z1),$S(Z2:Z1,1:"") I Q'="",$D(^IBA(355.91,"AUNIQ",IBINS,IBUNIT,0,Q,IBPTYP,IBCU)) S IBID=$P($G(^IBA(355.91,IBCU,0)),U,7),$P(IBT,U,2,3)=(IBCU_U_355.91) Q
 G:IBID'="" UNIQ2Q
 ;
 ; Match specific form type, both I/O element or Rx
 F Q=$S(Z2:3,1:0),$S(Z2:0,1:"") I Q'="",$D(^IBA(355.91,"AUNIQ",IBINS,IBUNIT,Z0,Q,IBPTYP,IBCU)) S IBID=$P($G(^IBA(355.91,IBCU,0)),U,7),$P(IBT,U,2,3)=(IBCU_U_355.91) Q
 G:IBID'="" UNIQ2Q
 ;
 ; Match both form types, both I/O elements or Rx
 F Q=$S(Z2:3,1:0),$S(Z2:0,1:"") I Q'="",$D(^IBA(355.91,"AUNIQ",IBINS,IBUNIT,0,Q,IBPTYP,IBCU)) S IBID=$P($G(^IBA(355.91,IBCU,0)),U,7),$P(IBT,U,2,3)=(IBCU_U_355.91) Q
 ;
UNIQ2Q Q IBID
 ;
