IBCBB1 ;ALB/AAS - CONTINUATION OF EDIT CHECK ROUTINE ;2-NOV-89
 ;;2.0;INTEGRATED BILLING;**27,52,80,93,106,51,151,148,153,137,232,280,155**;21-MAR-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
 ;MAP TO DGCRBB1
 ;
% ;Bill Status
 N Z,Z0,Z1
 I $S(+IBST=0:1,1:"^1^2^3^4^7^"'[(U_IBST_U)) S IBER=IBER_"IB045;"
 ;
 ;Statement Covers From
 I IBFDT="" S IBER=IBER_"IB061;"
 I IBFDT]"",IBFDT'?7N&(IBFDT'?7N1".".N) S IBER=IBER_"IB061;"
 I IBFDT>IBTDT S IBER=IBER_"IB061;" ; from must be on or before the to date 
 S IBFFY=$$FY^IBOUTL(IBFDT)
 ; if inpat - from date must not be prior to admit date.
 I $$INPAT^IBCEF(IBIFN,1),(IBFDT<($P($G(^DGPT(+$P(IBND0,U,8),0)),U,2)\1))  S IBER=IBER_"IB061;"
 ;
 ;Statement Covers To
 I IBTDT="" S IBER=IBER_"IB062;"
 I IBTDT]"",IBTDT'?7N&(IBTDT'?7N1".".N) S IBER=IBER_"IB062;"
 I IBTDT>DT!(IBTDT<IBFDT) S IBER=IBER_"IB062;"  ; to date must not be >than today's date
 S IBTFY=$$FY^IBOUTL(IBTDT)
 ;
 ;Statement crosses fiscal years
 ;I IBTFY'=IBFFY S IBER=IBER_"IB047;"
 ;
 ;Statement crosses calendar years
 ;I $E(IBTDT,1,3)'=$E(IBFDT,1,3) S IBER=IBER_"IB046;"
 ;
 ;Total Charges
 I +IBTC'>0!(+IBTC'=IBTC) S IBER=IBER_"IB064;"
 ;
 ;Billable charges for secondary claim
 I $$MCRONBIL^IBEFUNC(IBIFN)&(($P(IBNDU1,U,1)-$P(IBNDU1,U,2))'>0) S IBER=IBER_"IB094;"
 ;Fiscal Year 1
 S IBFFY=$$FY^IBOUTL(IBFDT)
 ;
 ;Check provider link for current user, enterer, reviewer and Authorizor
 I '$D(^VA(200,DUZ,0)) S IBER=IBER_"IB048;"
 I IBEU]"",'$D(^VA(200,IBEU,0)) S IBER=IBER_"IB048;"
 I IBRU]"",'$D(^VA(200,IBRU,0)) S IBER=IBER_"IB060;"
 I IBAU]"",'$D(^VA(200,IBAU,0)) S IBER=IBER_"IB041;"
 ;
 ;Bill exists and not already new bill
 ;I $S('$D(^PRCA(430,IBIFN,0)):1,$P($P(^PRCA(430,IBIFN,0),"^"),"-",2)'=IBBNO:1,1:0) S IBER=IBER_"IB056;"
 ;I $P($$BN^PRCAFN(IBIFN),"-",2)'=IBBNO S IBER=IBER_"IB056;"
 ;I IBER="",$P(^PRCA(430,IBIFN,0),"^",8)=$O(^PRCA(430.3,"AC",104,"")) S IBER=IBER_"IB040;"
 I IBER="",+$$STA^PRCAFN(IBIFN)=104 S IBER=IBER_"IB040;"
 ; If ins bill, must have valid COB sequence
 I $P(IBND0,U,11)="i",$S($P(IBND0,U,21)="":1,1:"PST"'[$P(IBND0,U,21)) S IBER=IBER_"IB324;"
 ;
 ; Check for valid sec provider id for current ins
 S Z=0 F  S Z=$O(^DGCR(399,IBIFN,"PRV",Z)) Q:'Z  S Z0=$G(^(Z,0)),Z1=+$$COBN^IBCEF(IBIFN) I $P(Z0,U,4+Z1)'="",$P(Z0,U,11+Z1)'="" D
 . I '$$SECIDCK^IBCEF74(IBIFN,Z1,$P(Z0,U,11+Z1),Z) D WARN^IBCBB11("Prov secondary id type for the "_$P("PRIMARY^SECONDARY^TERTIARY",U,Z1)_" "_$$EXTERNAL^DILFD(399.0222,.01,,+Z0)_" is invalid/won't transmit")
 ;
 N IBCOBN,IBZ
 S IBCOBN=+$$COBN^IBCEF(IBIFN),Z=$$GETTYP^IBCEP2A(IBIFN,IBCOBN)
 I Z,$P(Z,U,2) D  ; Rendering/attending prov secondary id required
 . ; for current insurance
 . N Q,Q0,IBID,IBOK
 . S IBOK=0
 . D PROVINF^IBCEF74(IBIFN,IBCOBN,.IBID,IBCOBN,"C")
 . S Q0=0,Q=$S($$FT^IBCEF(IBIFN)=3:4,1:3) F  S Q0=$O(IBID(IBCOBN,Q,Q0)) Q:'Q0  I $P(IBID(IBCOBN,Q,Q0),U,9)=+Z S IBOK=1 Q
 . I 'IBOK S IBER=IBER_"IB303;"
 K IBXDATA D F^IBCEF("N-ATT/REND PHYSICIAN NAME",,,IBIFN)
 I $P($G(IBXDATA),U)="" S IBER=IBER_"IB303;"
 I $$TXMT^IBCEF4(IBIFN) D
 . D F^IBCEF("N-ALL ATT/REND PROV SSN/EI","IBZ",,IBIFN)
 . I $P(IBZ,U,3)=""&($P(IBZ,U,4)="") S IBER=IBER_"IB321;" ; SSN/IEN required for rend/att
 . ;
 ;
 ; Must be one and only one division on bill
 S IBZ=$$MULTDIV^IBCBB11(IBIFN,IBND0)
 I IBZ S IBER=IBER_$S(IBZ=1:"IB095;",IBZ=2:"IB104;",1:"IB105;")
 ; Division address must be defined in institution file
 I $P(IBND0,U,22) D
 . N Z,Z0,Z1
 . S Z0=$G(^DIC(4,+$P($G(^DG(40.8,+$P(IBND0,U,22),0)),U,7),0))
 . S Z1=$G(^DIC(4,+$P($G(^DG(40.8,+$P(IBND0,U,22),0)),U,7),1))
 . I $P(Z0,U,2)="" S IBER=IBER_"IB097;" Q
 . F Z=1,3,4 I $P(Z1,U,Z)="" S IBER=IBER_"IB097;" Q
 ;
 ;CHAMPVA Rate Type and Primary Insurance Carriers Type of Coverage must match
 S (IBRTCHV,IBPICHV)=0
 I $P($G(^DGCR(399.3,+IBAT,0)),U,1)="CHAMPVA" S IBRTCHV=1
 I $P($G(^IBE(355.2,+$P($G(^DIC(36,+IBNDMP,0)),U,13),0)),U,1)="CHAMPVA" S IBPICHV=1
 I (+IBRTCHV!+IBPICHV)&('IBRTCHV!'IBPICHV) S IBER=IBER_"IB085;"
 ;
 N IBZPRC,IBZPRC92
 D F^IBCEF("N-ALL PROCEDURES","IBZPRC",,IBIFN)
 ; Procedure Clinic is required for Surgical Procedures Outpt Facility Charges
 I +$P(IBND0,U,27)'=2,$$BILLRATE^IBCRU3(IBAT,IBCL,IBEVDT,"RC OUTPATIENT") D
 . N Z,Z0,Z1,ZE S (ZE,Z)=0 F  S Z=$O(^DGCR(399,IBIFN,"CP",Z)) Q:'Z  D  I +ZE S IBER=IBER_"IB320;" Q
 .. S Z0=$G(^DGCR(399,IBIFN,"CP",Z,0)),Z1=+Z0 I Z0'[";ICPT(" Q
 .. I '((Z1'<10000)&(Z1'>69999))&'((Z1'<93501)&(Z1'>93533)) Q
 .. I '$P(Z0,U,7) S ZE=1
 ;
 ; Extract procedures for UB92
 D F^IBCEF("N-UB92 PROCEDURES","IBZPRC92",,IBIFN)
 ; Does this bill have ANY prescriptions associated with it?
 ; Must bill prescriptions separately from other charges
 ;
 I $$ISRX^IBCEF1(IBIFN) D
 . N IBZ,IBRXDEF
 . S IBRXDEF=$P($G(^IBE(350.9,1,1)),U,30),IBZ=0
 . F  S IBZ=$O(IBZPRC92(IBZ)) Q:'IBZ  I IBZPRC92(IBZ),+$P(IBZPRC92(IBZ),U)'=IBRXDEF S IBER=IBER_"IB102;" Q
 . K IBZ
 ;
 ; Check that COB sequences are not skipped
 K Z
 F Z=1:1:3 S:+$G(^DGCR(399,IBIFN,"I"_Z)) Z(Z)=""
 F Z=0:1:2 S Z0=$O(Z(Z)) Q:'Z0  I Z0'=(Z+1) S IBER=IBER_"IB322;" Q
 K Z
 I $P($G(^DGCR(399,IBIFN,0)),U,21)="" S IBER=IBER_"IB323;"
 K IBXDATA D F^IBCEF("N-PROCEDURE CODING METHD",,,IBIFN)
 ; Coding method should agree with types of procedure codes
 S IBOK=$S('$O(IBZPRC(0))!(IBXDATA=""):1,1:0)
 I 'IBOK S IBOK=1,IBZ=0 F  S IBZ=$O(IBZPRC(IBZ)) Q:'IBZ  I IBZPRC(IBZ),$P(IBZPRC(IBZ),U)'[$S(IBXDATA=9:"ICD",1:"ICP") S IBOK=0 Q
 I 'IBOK D WARN^IBCBB11("Coding Method does not agree with all procedure codes found on bill")
 D EDITMRA^IBCBB3(.IBQUIT,.IBER,IBIFN,IBFT)
 Q:$G(IBQUIT)
 ;
 ;Other things that could be added:  Rev Code - calculating charges
 ;        Diagnosis Coding, if MT copay - check for other co-payments
 ;
 I $P(IBNDTX,U,8),$$REQMRA^IBEFUNC(IBIFN) S IBER=IBER_"IB121;"   ; can't force MRAs to print
 I $P(IBNDTX,U,8)!$P(IBNDTX,U,9) D WARN^IBCBB11($S($$REQMRA^IBEFUNC(IBIFN)&($P(IBNDTX,U,9)):"MRA Secondary ",1:"")_"Bill has been forced to print "_$S($P(IBNDTX,U,8)=1!($P(IBNDTX,U,9)=1):"locally",1:"at clearinghouse"))
 I IBFT'=2,$P(IBNDM,U,10)="" D WARN^IBCBB11("Patient Short Address has no value")
 N IBXZ,IBIZ F IBIZ=12,13,14 S IBXZ=$P(IBNDM,U,IBIZ) I +IBXZ S IBXZ=$P($G(^DPT(DFN,.312,IBXZ,0)),U,18) I +IBXZ S IBXZ=$G(^IBA(355.3,+IBXZ,0)) I +$P(IBXZ,U,12) D
 . D WARN^IBCBB11($P($G(^DIC(36,+IBXZ,0)),U,1)_" requires Amb Care Certification")
 ;
 ;Build AR array if no errors and MRA not needed or already rec'd
 I IBER="",$S($$NEEDMRA^IBEFUNC(IBIFN)!($$REQMRA^IBEFUNC(IBIFN)):0,1:1) D ARRAY
 ;
END ;Don't kill IBIFN, IBER, DFN
 I $O(^TMP($J,"BILL-WARN",0)),$G(IBER)="" S IBER="WARN" ;Warnings only
 K IBBNO,IBEVDT,IBLOC,IBCL,IBTF,IBAT,IBWHO,IBST,IBFDT,IBTDT,IBTC,IBFY,IBFY1,IBAU,IBRU,IBEU,IBARTP,IBFYC,IBMRA,IBTOB,IBTOB12,IBNDU2,IBNDUF3,IBNDUF31,IBNDTX
 K IBNDS,IBND0,IBNDU,IBNDM,IBNDMP,IBNDU1,IBFFY,IBTFY,IBFT,IBRTCHV,IBPICHV,IBXDATA,IBOK
 I $D(IBER),IBER="" W !,"No Errors found for National edits"
 Q
 ;
ARRAY ;Build PRCASV(array)
 N IBCOBN,X
 K PRCASV
 Q:$$MCRWNR^IBEFUNC(+$$CURR^IBCEF2(IBIFN))
 S IBCOBN=$$COBN^IBCEF(IBIFN)
 S X=IBIFN
 S PRCASV("BDT")=DT,PRCASV("ARREC")=IBIFN
 S PRCASV("APR")=DUZ
 S PRCASV("PAT")=DFN,PRCASV("CAT")=$P(^DGCR(399.3,IBAT,0),"^",6)
 I IBWHO="i" S PRCASV("DEBTOR")=+IBNDMP_";DIC(36,"
 S PRCASV("DEBTOR")=$S(IBWHO="p":DFN_";DPT(",IBWHO="o":$P(IBNDM,"^",11)_";DIC(4,",IBWHO="i":PRCASV("DEBTOR"),1:"")
 S PRCASV("CARE")=$E($$TOB^IBCEF1(IBIFN),1,2)
 S PRCASV("FY")=$$FY^IBOUTL(DT)_U_($P(IBNDU1,U)-$P(IBNDU1,U,2))
 ;S PRCASV("FY")=$P(IBNDU1,U,9)_U_$S($P(IBNDU1,U,2)]"":($P(IBNDU1,U,10)-$P(IBNDU1,U,2)),1:$P(IBNDU1,U,10))_$S($P(IBNDU1,U,11)]"":U_$P(IBNDU1,U,11)_U_$P(IBNDU1,U,12),1:"")
PLUS I IBWHO="i",$P(IBNDM,"^",2),$D(^DIC(36,$P(IBNDM,"^",2),0)) S PRCASV("2NDINS")=$P(IBNDM,"^",2)
 I IBWHO="i",$P(IBNDM,"^",3),$D(^DIC(36,$P(IBNDM,"^",3),0)) S PRCASV("3RDINS")=$P(IBNDM,"^",3)
 ;
 N IBX S IBX=$P(IBND0,U,21),IBX=$S(IBX="P":"I1",IBX="S":"I2",IBX="T":"I3",1:"") Q:IBX=""
 N IBNDI1
 Q:'$D(^DGCR(399,IBIFN,IBX))  S IBNDI1=^(IBX)
 S:$P(IBNDI1,"^",3)]"" PRCASV("GPNO")=$P(IBNDI1,"^",3)
 S:$P(IBNDI1,"^",15)]"" PRCASV("GPNM")=$P(IBNDI1,"^",15)
 S:$P(IBNDI1,"^",17)]"" PRCASV("INPA")=$P(IBNDI1,"^",17)
 S:$P(IBNDI1,"^",2)]"" PRCASV("IDNO")=$P(IBNDI1,"^",2),PRCASV("INID")=PRCASV("IDNO")
 ; Check that this is a secondary or tertiary bill and insurance for previous
 ; COB sequence is Medicare WNR and MRA is active --> send data elements to AR
 I IBCOBN>1,$$WNRBILL^IBEFUNC(IBIFN,IBCOBN-1),$$EDIACTV^IBCEF4(2) D MRA
 Q
 ;
MRA N IBEOB S IBEOB=0
 ;
 K PRCASV("MEDURE"),PRCASV("MEDCA")
 ; Get EOB data
 F  S IBEOB=$O(^IBM(361.1,"B",IBIFN,IBEOB)) Q:'IBEOB  D
 . D MRACALC^IBCEMU2(IBEOB,IBIFN,1,.PRCASV)
 Q  ;MRA
 ;
 ;; PREGNANCY DX CODES: V22**-V24**, V27**-V28**, 630**-677**
 ;; FLU SHOTS PROCEDURE CODES: 90724, G0008, 90732, G0009
