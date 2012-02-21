IVMPREC9 ;ALB/KCL/BRM - PROCESS INCOMING (Z05 EVENT TYPE) HL7 MESSAGES (CON'T) ; 8/21/02 2:09pm
 ;;2.0;INCOME VERIFICATION MATCH;**34,58**; 21-OCT-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
 ;
 ;
STORE ; - store HL7 fields that have a different value than DHCP fields in
 ;   the IVM Patient (#301.5) file (#301.511) multiple for uploading
 ;
 G:IVMFLG STORE2
 S X=$$IEN^IVMUFNC4("PID")
 ;
 K DIC("DR")
 S DA(1)=IVM3015
 I $G(^IVM(301.5,DA(1),"IN",0))']"" S ^(0)="^301.501PA^^"
 S DIC="^IVM(301.5,"_DA(1)_",""IN"",",DIC(0)="L",DLAYGO=301.501
 K DD,DO D FILE^DICN
 K DIC,DLAYGO,X,Y
 ;
 ; - build mail message if SUPRESS DEMOGRAPHIC NOTIFICATION field is
 ;   not set in the IVM Site Parameter (#301.9) file
 ;
 I '$P($G(^IVM(301.9,1,0)),"^",5),'IVMADFLG D DEMBULL^IVMPREC6
 ;
 ; - set flag in order to not repeat STORE tag for one msg
 S IVMFLG=1
 ;
 S DA(2)=DA(1)
 S DA(1)=$P(^IVM(301.5,DA(1),"IN",0),"^",3)
 ;
STORE2 ;
 ; - X as the record in the IVM Demo Upload Fields (#301.92) file
 S X=+IVMDEMDA
 I $G(^IVM(301.5,DA(2),"IN",DA(1),"DEM",0))']"" S ^(0)="^301.511PA^^"
 S DIC="^IVM(301.5,"_DA(2)_",""IN"",DA(1),""DEM"",",DIC(0)="L"
 S DIC("DR")=".02////^S X=IVMFLD",DLAYGO=301.511
 K DD,DO D FILE^DICN
 K DIC,DLAYGO,X,Y
 ;
 Q
 ;
 ;
LOOK ; Find the current DHCP field value.
 ;  Input:   DR  --   Field number of the field in file #2
 ;          DFN  --   Pointer to the patient in file #2
 ;  Output:   Y  --   Internal value of field
 S DIC="^DPT(",DA=DFN,DIQ="IVM",DIQ(0)="I" D EN^DIQ1
 S Y=$G(IVM(2,DFN,DR,"I"))
 K DIC,DIQ,DR,IVM
 Q
