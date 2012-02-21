DGCV ;ALB/DW,ERC,BRM - COMBAT VET ELIGIBILTY; 06/05/2003 ; 6/14/04 1:03pm
 ;;5.3;Registration;**528,576,564**; Aug 13, 1993
 ;
CVELIG(DFN) ;
 ;API will determine whether or not this vetern needs to have CV End
 ;Date set.  If this determination cannot be done due to imprecise
 ;or missing dates, it returns which dates need editing.
 ;Input:
 ;  DFN - Patient file IEN
 ;Output
 ;  RESULT
 ;    0 - CV End Date should not be updated
 ;    1 - CV End Date should be updated
 ;  If critical dates are imprecise return the following
 ;    A - CV End Date should not be updated, imprecise Service Sep date
 ;    B - CV End Date should not be updated, imprecise Combat To date
 ;    C - CV End Date should not be updated, imprecise Yugoslavia To date
 ;    D - CV End Date should not be updated, imprecise Somalia To date
 ;    E - CV End Date should not be updated, imprecise Pers Gulf To date
 ;  If the Service Sep Date is missing, return the following so that it 
 ;  will appear on the Imprecise/Missing Date Report
 ;    F - missing Service Sep Date
 ;  If critical dates are missing but the corresponding indicator fields
 ;  are set to 'YES' return the following
 ;    G - missing Combat To Date, but Combat Indicated? = 'Yes'
 ;    H - missing PG To Date, but PG Indicated? = 'Yes'
 ;    I - missing Somalia To Date, but Somalia Indicator = 'Yes'
 ;    J - missing Yugoslavia To Date, but Yugoslavia Indicator = 'Yes'
 ;
 N DG1,DG2,I,RESULT
 N DGCOM,DGCVDT,DGCVFLG,DGGULF,DGSOM,DGSRV,DGYUG
 S (DG1,DG2,RESULT)=0
 I $G(DFN)']"" Q RESULT
 I '$D(^DPT(DFN)) Q RESULT
 ;
 ;get combat related data from VistA
 N DGARR,DGERR
 D GETS^DIQ(2,DFN_",",".327;.322012;.322018;.322021;.5294;.5295","I","DGARR","DGERR")
 D PARSE
 ;
 S DG1=$$CHKSSD(DFN) ;check SSD for imprecise or missing
 ;
 S DGDATE=$G(DGCOM)_"^"_$G(DGYUG)_"^"_$G(DGSOM)_"^"_$G(DGGULF)
 S DG2=$$CHKREST(DGDATE) ;check other "TO" dates for imprecise or missing
 S RESULT=$$RES(DG1,$G(DG2))
 Q RESULT
 ;
RES(DG1,DG2) ;determine the final RESULT code from DGRES1 & DGRES2
 ;if SSD evaluates to earlier than 11/11/98, can't set CV End Date
 I DG1=0!($G(DG2)=0) Q 0
 ;if SSD is 1
 I DG1=1,($G(DG2)=1!($G(DG2)']"")) Q 1
 I DG1=1,($G(DG2)=0) Q 0
 I DG1=1 Q DG2
 ;if SSD is imprecise or missing
 I DG1'=1,($G(DG2)=1) S DG2=""
 Q DG1_DG2
 ;
CHKDATE(DGDATE,I) ;check to see if date is imprecise or missing
 ;if imprecise check to see if the imprecision prevents CV evaluation
 ;if not imprecise check to see if after 11/11/98
 N RES
 S RES=0
 I $G(DGDATE)']"" D  Q RES
 . S RES=$S(I=0:"F",I=1:"G",I=2:"H",I=3:"I",I=4:"J",1:"")
 I $E(DGDATE,6,7)="00" D
 . I I=0 I DGDATE>2981111 S RES="A" Q
 . I DGDATE=2980000!(DGDATE=2981100) D  Q
 . . S RES=$S(I=0:"A",I=1:"B",I=2:"C",I=3:"D",I=4:"E",1:"")
 Q:RES="A" RES
 I DGDATE>2981111 S RES=1
 Q RES
 ;
SETCV(DFN,DGSRV) ;calculate CV end date
 K DGCVEDT
 N DGFDA
 I $G(DFN)']""!($G(DGSRV)']"") Q
 I '$D(^DPT(DFN)) Q
 S DGCVEDT=$P($$SCH^XLFDT("24M",DGSRV),".")
 I DGCVEDT=$G(DGCVDT) Q
 I $$GET1^DIQ(2,DFN_",",.5295,"I") Q
 S DGFDA(2,DFN_",",.5295)=DGCVEDT
 D FILE^DIE(,"DGFDA")
 Q
 ;
CVEDT(DFN,DGDT) ;Provide Combat Vet Eligibility End Date, if eligible
 ;Supported DBIA #4156
 ;Input:  DFN - Patient file IEN
 ;        DGDT - Treatment date (optional), 
 ;               DT is default
 ;Output :RESULT=(1,0,-1)^End Date (if populated, otherwise null)^CV
 ;               Eligible on DGDT(1,0)^is patient eligible on input date?
 ;      (piece 1)  1 - qualifies as a CV
 ;                 0 - does not qualify as a CV
 ;                -1 - bad DFN or date
 ;      (piece 3)  1 - vet was eligible on date specified (or DT)      
 ;                 0 - vet was not eligible on date specified (or DT)
 ;
 N RESULT
 S RESULT=""
 I $G(DFN)="" Q -1
 I '$D(^DPT(DFN)) Q -1
 ;if time sent in, drop time
 I $G(DGDT)']"" S DGDT=DT
 I DGDT?7N1"."1.6N S DGDT=$E(DGDT,1,7)
 I DGDT'?7N Q -1
 S RESULT=$$GET1^DIQ(2,DFN_",",.5295,"I")
 I $G(RESULT)']"" Q 0
 S RESULT=$S(DGDT'>RESULT:RESULT_"^1",1:RESULT_"^0") ; if treatment date is earlier or equal to end date, veteran is eligible
 S RESULT=$S($G(RESULT):1_"^"_RESULT,1:0)
 Q RESULT
 ;
PARSE ;GETS^DIQ called in CVELIG - in this subroutine stuff results into array
 S DGSRV=$G(DGARR(2,DFN_",",.327,"I"))
 S DGCOM=$G(DGARR(2,DFN_",",.5294,"I")) ;Combat To Date
 S DGGULF=$G(DGARR(2,DFN_",",.322012,"I")) ;Persian Gulf To Date
 S DGSOM=$G(DGARR(2,DFN_",",.322018,"I")) ;Somalia To Date
 S DGYUG=$G(DGARR(2,DFN_",",.322021,"I")) ;Yugoslavia To Date
 S DGCVDT=$G(DGARR(2,DFN_",",.5295,"I")) ;CV End Date
 Q
 ;
CHKSSD(DFN) ;check the Serv Sep Date [Last]
 ;
 ;  Output - RESULT
 ;    1 - Date is present and after 11/11/1998
 ;    0 - Date is present but before 11/11/1998
 ;    A - Date is imprecise & either is or potentially is after 11/11/98
 ;    F - Date is missing
 N DG1
 I $G(DGSRV)']"" Q "F"
 S DG1=$$CHKDATE(DGSRV,0)
 I $G(DG1)']"" S DG1=0
 Q DG1
 ;
CHKREST(DGDATE) ;
 N DG3,DG4,DGDT,DGFLG,DGLEN,DGQ,DGR,DGRES,DGX
 S (DG3,DG4,DGR,DGRES)=""
 S DGQ=0 ;loop terminator
 S DGFLG=0 ;flag to indicate that one of the dates is missing
 F DGX=1:1:4 D
 . S DGDT=$P(DGDATE,U,DGX) D
 . . I $G(DGDT)']"" S DGFLG=1 ;Q
 . . S DG4=$$CHKDATE(DGDT,DGX)
 . . I $G(DG4)'=0 S DG3=$G(DG3)_$G(DG4)
 S DGLEN=$L(DG3)
 S DGQ=0
 F DGX=1:1:DGLEN S DGCHAR=$E(DG3,DGX) D  Q:DGQ=1
 . I DGCHAR=1 S DG3=DGCHAR,DGQ=1 Q
 . I "BCDE"[DGCHAR S DGR=DGR_DGCHAR,DGQ=2
 I DGQ=1 Q 1
 I DGQ=2 Q $E(DGR)
 I DGFLG=1 S DGRES=$$MISS(DFN,DGLEN,DG3)
 Q DGRES
 ;
MISS(DFN,DGLEN,DGRES) ;there is at least one missing date, and in order to 
 ;return a RESULT of a missing date, need to check to see if the 
 ;corresponding indicator field is set to 'YES'
 N DGARR,DGCHAR,DGERR,DGQ,DGR,DGX
 N DGCIND,DGPGIND,DGSIND,DGYIND
 S (DGCHAR,DGQ,DGR)=0
 D GETS^DIQ(2,DFN_",",".32201;.322019;.322016;.5291","I","DGARR","DGERR")
 S DGCIND=$G(DGARR(2,DFN_",",.5291,"I")) ;Combat Service Indicated
 S DGYIND=$G(DGARR(2,DFN_",",.322019,"I")) ;Yugo service indicated
 S DGSIND=$G(DGARR(2,DFN_",",.322016,"I")) ;Somalia service indicated
 S DGPGIND=$G(DGARR(2,DFN_",",.32201,"I")) ;Pers Gulf service indicated
 F DGX=1:1:DGLEN S DGCHAR=$E(DGRES,DGX) D  Q:DGQ=1
 . I DGCHAR="G",($G(DGCIND)="Y") S DGR="G",DGQ=1 Q
 . I DGCHAR="H",($G(DGYIND)="Y") S DGR="H",DGQ=1 Q
 . I DGCHAR="I",($G(DGSIND)="Y") S DGR="I",DGQ=1 Q
 . I DGCHAR="J",($G(DGPGIND)="Y") S DGR="J"
 Q DGR
DELCV(DFN) ;called by the Kill logic of the ACVCOM cross reference
 ;if $$CVELIG^DGCV returns a 0 the CV End Date should be deleted
 ;because this would indicate that fields have been changed and
 ;CV eligibility is no longer appropriate
 ;
 N DGCV,DGFDA
 K DGCVFLG
 S DGCVFLG=0
 I $G(DFN)']"" Q
 I '$D(^DPT(DFN)) Q
 S DGCV=$$GET1^DIQ(2,DFN_",",.5295,"I")
 I $G(DGCV)']"" Q
 S DGCVFLG=1
 S DGFDA(2,DFN_",",.5295)="@"
 D FILE^DIE(,"DGFDA")
 Q
