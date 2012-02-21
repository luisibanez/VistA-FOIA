IBCNSU1 ;ALB/AAS - INSURANCE UTILITY ROUTINE ; 19-MAY-93
 ;;2.0;INTEGRATED BILLING;**103,133,244**;21-MAR-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
RCHK(X) ; -- Input transform for different revenue codes in file 36
 ;    Returns 1 if passes, 0 if not pass input transform
 ;
 N I,Y,RC,NO S Y=0
 I $G(X)="" G RCHKQ
 F I=1:1 S RC=$P(X,",",I) Q:RC=""  I $S(RC?3N:0,RC?5N:0,1:1) S NO=1 Q
 I '$G(NO) S Y=1
RCHKQ Q Y
 ;
BU(DFN,IBCPOL,IBYR,IBCDFN,IBASK) ; -- Return entry in Benefits Used file
 ;     Input:  IBCDFN  = pointer to patient file policy (2.312)
 ;             DFN     = patient pointer        
 ;             IBCPOL  = pointer to health insurance policy file
 ;             IBYR    = fileman internal date, year will be calendar
 ;                       year of the internal date, Default = dt
 ;             IBASK   = 1 if want to ask okay to add new entry
 ;
 ;    Output:  IBCBU   = pointer to Benefits Used file if added,
 ;                       else null
 ;
 N DIR,IBCBU
 S IBCBU=""
 I $G(IBCPOL)="" G BUQ
 I $G(IBYR)="" S IBYR=DT
 ;
 ;if no match display message
 I '$O(^IBA(355.4,"APY",IBCPOL,-IBYR,0)) W !!,"You cannot add a new Benefits Used BENEFIT YEAR",!! G BUQ
 ;
 ; -- try to find entry for policy for year
 S IBCBU=$O(^IBA(355.5,"APPY",DFN,IBCPOL,-IBYR,IBCDFN,0))
 ;
 ; -- if no match add new entry
 I 'IBCBU D
 .I $G(IBASK) S DIR(0)="Y",DIR("A")="Are you adding a new Benefits Used YEAR",DIR("B")="YES" D ^DIR I $D(DIRUT)!(Y<1) S VALMQUIT="" Q
 .S IBCBU=$$ADDBU(DFN,IBCPOL,IBYR,IBCDFN)
 .Q
 ;
BUQ Q IBCBU
 ;
ADDBU(DFN,IBCPOL,IBYR,IBCDFN) ; -- add entries to Benefits Used file
 ;     Input:  DFN     = pointer to patient file
 ;             IBCDFN  = point to patient policy (2.312)
 ;             IBCPOL  = pointer to health insurance policy file
 ;             IBYR    = fileman internal date, year will be calendar
 ;                       year of the internal date, Default = dt
 ;
 ;    Output:  IBCBU   = pointer to Benefits Used file if added,
 ;                       else null
 ;
 N %DT,IBN1,IBCBU,DIC,DIE,DR,DA,DLAYGO,DO,DD
 S IBCBU=""
 I $G(IBCDFN)="" G ADDBUQ
 I $G(IBCPOL)="" G ADDBUQ
 I $G(IBYR)="" S IBYR=DT
 K DD,DO,DIC,DR S DIC="^IBA(355.5,",DIC(0)="L",DLAYGO=355.5
 ;
 ;S IBYR=$E(IBYR,1,3)_"0000"
 S X=IBCPOL D FILE^DICN I +Y<0 G ADDBUQ
 S (IBCBU,DA)=+Y,DIE="^IBA(355.5,",DR=".02////"_DFN_";.03////"_IBYR_";.17////"_IBCDFN_";1.01///NOW;1.02////"_DUZ
 D ^DIE K DIC,DIE,DA,DR
ADDBUQ Q IBCBU
 ;
VET() ; -- Input Transform for sub-file 2.312, Name of Insured (#17)
 ;    Quit 1 to stuff Patient Name
 ;    Quit 0 to not stuff and allow editing
 ;
 N IBY,IB0 S IBY=0
 S IB0=$G(^DPT(+$G(DA(1)),.312,+$G(DA),0))
 I $P(IB0,"^",6)'="v" G VETQ
 I +IB0'=+$$GETWNR^IBCNSMM1 S IBY=1 G VETQ
 I '$D(X),$P(IB0,"^",17)="" S IBY=1
VETQ Q IBY
 ;
 ;
SUBID ; -- Input Transform for sub-file #2.312, Subscriber ID (#1)
 N NODE,L,R,CHAR,X1
 S CHAR="~`!@#$%^&*()_-+={}[]|\/?.,<>;:' """
 S NODE=^DPT(DA(1),.312,DA,0)
 ;
 ; - if the policy is a Medicare policy, make sure the subscriber ID
 ;   is a valid HICN number
 I $P(NODE,U)=+$$GETWNR^IBCNSMM1 S X=$TR(X,"-","") I '$$VALHIC^IBCNSMM(X) D HLP^IBCNSM32 K X Q
 ;
 S R=$P(NODE,U,16)
 S L=$TR($P(^DPT(DA(1),0),U,9),CHAR,"")
 S R=$S(R="01":1,R="":1,1:0)
 ;
 ; - if subscriber ID is the SSN of patient, remove all extraneous
 ;   characters
 S X1=$TR(X,CHAR,"") I X1?9N,X1=L S X=X1
 ;
 ; - if "SS" is entered, and the policy belongs to the patient,
 ;   convert that string to the patient's SSN
 I R=1,X="SS" W "  ",L S X=L
 ;
 K:$L(X)>20!($L(X)<3) X
 Q
 ;
 ;
HICN(DFN) ; -- return Patient's Medicare HIC number
 ;    Return HICN of Medicare WNR Part A or Part B
 ;    Return -1 if none exits
 ;
 N IBWNR,IBX,IBY,IB0
 S IBWNR=$$GETWNR^IBCNSMM1,IBY=""
 I '$O(^DPT(DFN,.312,"B",+IBWNR,0)) S IBY=-1 G HICNQ
 S IBX=0 F  S IBX=$O(^DPT(DFN,.312,"B",+IBWNR,IBX)) Q:('IBX)!(IBY]"")  D
 .S IB0=$G(^DPT(DFN,.312,IBX,0))
 .I $P(IB0,U,18)'=$P(IBWNR,U,3),$P(IB0,U,18)'=$P(IBWNR,U,5) Q
 .; 8/18/2003 - Added translation code to remove hyphens if they exist.
 .I $P(IB0,U,2)]"" S IBY=$TR($P(IB0,U,2),"- ","")
 S:IBY="" IBY=-1
HICNQ Q IBY
