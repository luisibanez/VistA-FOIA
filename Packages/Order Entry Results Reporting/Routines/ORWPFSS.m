ORWPFSS ; SLC/REV/GSS - CPRS PFSS Calls; 11/15/04 [11/15/04 11:43am]
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**215**;Dec 17, 1997
 ;
 Q
PFSSACTV(ORY) ; Is PFSS active for this system/user/etc?
 ; 1=PFSS active - pass visit string with order
 ; 0=PFSS not active - do not pass visit string
 ;
 S ORY=0
 ;$$SWSTAT^IBBAPI() WILL BE RELEASED IN IB*2*286 AS PER E.Zeigler
 ;It's not clear that this check for the 228 patch is necessary at all
 ;That is, it is circumvented for testing purposes in 215 and
 ;  as this routine will also be in 228 then 228 will have to have been
 ;  loaded.
 ;Check for IB patch
 ;S ORY=+$$PATCH^XPDUTL("IB*2.0*286") Q:ORY=0
 ;Check PFSS master switch status (1=On, 0=Off) 
 ;S ORY=+$$SWSTAT^IBBAPI() Q:ORY=0  ;IA #4663
 ;Check for CPRS PFSS parameter being active
 S ORY=+$$GET^XPAR("SYS","ORWPFSS ACTIVE",1,"I")
 Q
 ;
ORACTREF(ORACTREF,ORIEN) ;Return PFSS Account Reference Number (ARN)
 ; PFSS ARN in order file (#100) as field #97, i.e., ^OR(100,ORIEN,5.5)
 ;
 ; *** NOTE ***
 ; This API is not functional in OR*3*215 (CPRS v.26).
 ; This API will be functional in OR*3*228.
 ; This is due to CPRS PFSS having had to be divided up into two
 ;   phases (phase I for 215 and phase II for 228) because of coding
 ;   deadlines.
 ;
 ; This API in OR*3*215 will always return a null for the PFSS ARN.
 ;
 S ORACTREF=""
 Q
