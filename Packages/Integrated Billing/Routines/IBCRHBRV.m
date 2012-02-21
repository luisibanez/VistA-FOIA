IBCRHBRV ;ALB/ARH - RATES: UPLOAD (RC) VERSION FUNCTIONS ; 14-FEB-01
 ;;2.0;INTEGRATED BILLING;**148,169,245,270,285,298,325,334**;21-MAR-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
 ; RC functions related to Version, most have to be updated when a new version is to be exported
 ;
SELVERS() ; get version to upload from user
 N DIR,DIRUT,DTOUT,DUOUT,X,Y,IB,IBV,IBVP,IBX
 S IBV="1.0^1.1^1.2^1.4^2.0^2.1^2.3^2.4^2.5^2.6" ; List of valid version numbers
 S IBX=0
 W !!,"Select the version of Reasonable Charges to upload.",!
 S DIR("?")="Enter a code from the list corresponding to the version of Reasonable Charges to upload.  There was no version 1.3 nor 2.2 of Reasonable Charges."
 S DIR(0)="SO^"
 F IB=1:1:$L(IBV,U) S IBVP=$P(IBV,U,IB),DIR(0)=DIR(0)_+IBVP_":Reasonable Charges version "_IBVP_";"
 D ^DIR K DIR S:$L(Y)=1 Y=Y_".0" S IBX=+$S(IBV[Y:Y,1:0)
 Q IBX
 ;
VERSION() ; return currently loaded version of RC files (1, 1.1, ...)
 N IBX S IBX=$G(^XTMP("IBCR RC SITE","VERSION"))
 Q IBX
 ;
VERSDT(VERS) ; return Effective Date of a version of RC files, either version passed in or currently loaded version
 N IBX S:'$G(VERS) VERS=$$VERSION S IBX=$S(VERS=1:2990901,VERS=1.1:3001102,VERS=1.2:3010508,VERS=1.4:3030429,VERS=2:3031219,VERS=2.1:3040415,VERS=2.3:3050101,VERS=2.4:3050411,VERS=2.5:3051001,VERS=2.6:3060101,1:"")
 Q IBX
 ;
VERSEDT(VERS) ; return Inactive Date of a version of RC files, either version passed in or currently loaded version
 N IBX S:'$G(VERS) VERS=$$VERSION S IBX=$S(VERS=1:3001101,VERS=1.1:3010507,VERS=1.2:3030428,VERS=1.4:3031218,VERS=2:3040414,VERS=2.1:3041231,VERS=2.3:3050410,VERS=2.4:3050930,VERS=2.5:3051231,1:"")
 Q IBX
 ;
VERSALL() ; returns all Reasonable Charges versions and corresponding effective date
 N IBX S IBX="1;2990901^1.1;3001102^1.2;3010508^1.4;3030429^2;3031219^2.1;3040415^2.3;3050101^2.4;3050411^2.5;3051001^2.6;3060101"
 Q IBX
 ;
VERSEND() ; returns all Reasonable Charges versions and corresponding inactive dates
 N IBX S IBX="1;3001101^1.1;3010507^1.2;3030428^1.4;3031218^2;3040414^2.1;3041231^2.3;3050410^2.4;3050930^2.5;3051231"
 Q IBX
 ;
 ;
VERSITE(SITE) ; returns the list of versions loaded for a particular site
 ; *** uses 99201 in the RC PHYSICIAN set to check which versions/dates are loaded
 ; *** so 99201 must have a pro charge in all versions, if not it must be replaced with an item that does
 N IBCS,IBXRF,IBITM,IBVERS,IBCSFN,IBI,IBV,IBX,IBY S IBX=""
 S IBVERS=$$VERSALL,IBITM=99201
 ;
 I $G(SITE)'="" S IBCS="RC-PHYSICIAN" F  S IBCS=$O(^IBE(363.1,"B",IBCS)) Q:IBCS'["RC-PHYSICIAN"  D
 . S IBV=$L(IBCS," ") I $P(IBCS," ",IBV)'=SITE Q
 . S IBCSFN=$O(^IBE(363.1,"B",IBCS,0)) Q:'IBCSFN  S IBXRF="AIVDTS"_IBCSFN
 . F IBI=1:1 S IBV=$P(IBVERS,U,IBI) Q:'IBV  I $O(^IBA(363.2,IBXRF,IBITM,-$P(IBV,";",2),0)) S IBY(+IBV)=""
 S IBV="" F  S IBV=$O(IBY(IBV)) Q:'IBV  S IBX=IBX_IBV_","
 ;
 I $E(IBX,$L(IBX))="," S IBX=$E(IBX,1,$L(IBX)-1)
 Q IBX
 ;
MSGSITE(SITE) ; display a message indicating which versions are loaded for a site
 N IBVERS Q:'$G(SITE)
 S IBVERS=$$VERSITE(SITE)
 I 'IBVERS W !!,?12,"There appear to be no RC charges already loaded for "_SITE_"."
 I +IBVERS W !!,?12,"RC versions "_IBVERS_" appear to be already loaded for "_SITE_"."
 Q
 ;
MSGVERS(SITE) ; check if versions are being loaded in the correct order, should be loaded in date order
 ; displays messages to the user:
 ;   - if loading a version that has already been loaded for the site
 ;   - if loading a version when any future versions have already been loaded for the site
 ;   - if loading a version when the last version has not yet been loaded for the site
 ; *** uses 99201 in the RC PHYSICIAN set to check which versions/dates are loaded
 ; *** so 99201 must have a pro charge in all versions, if not it must be replaced with an item that does
 N IBVERS,IBVDTC,IBVERSIN,IBVERSO Q:'$G(SITE)
 ;
 S IBVERS=$$VERSION Q:'IBVERS  S IBVDTC=$$VERSDT,IBVERSIN=","_$$VERSITE(SITE)_","
 ;
 ; check if loading a version that has already been loaded
 I IBVERSIN[(","_IBVERS_",") D
 . W !!,?5,"*** It appears version RC v",IBVERS," has already been loaded for this site ***"
 ;
 ; check if loading a version when any future versions have already been loaded
 F IBVERSO=1,1.1,1.2,1.4,2,2.1,2.3,2.4,2.5,2.6 I IBVERSO>IBVERS D
 . I IBVERSIN[(","_IBVERSO_",") D
 .. W !!,?5,">>> Currently trying to load RC v"_IBVERS_" but RC v"_IBVERSO_" appears to be already",!,?9,"loaded for this site.  The versions should be loaded in date order."
 ;
 ; check if loading a version when the last version has not yet been loaded
 F IBVERSO=2.6,2.5,2.4,2.3,2.1,2,1.4,1.2,1.1,1 I IBVERS>IBVERSO D  Q
 . I IBVERSIN'[(","_IBVERSO_",") D
 .. W !!,?5,"*** Currently trying to load RC v"_IBVERS_" but RC v"_IBVERSO_" does not appear to be",!,?9,"loaded for this site.  The versions should be loaded in date order."
 .. W !!,?5,">>> Continue only if there will never be a need to bill events before ",!,?9,$$FMTE^XLFDT(IBVDTC,2)," for this site.  If RC v"_IBVERSO_" will be needed for this site then",!,?9,"load it first."
 ;
 Q
 ;
FILES(IBFILES,VERS) ; source Host file name, description, and routine label that parses the file
 ; the subscript used for the file in XTMP is 'IBCR RC '_X w/ X=the routine label that parses the file
 ;
 I $G(VERS)=1.1 G FBREAL
 I $G(VERS)=1.2 G FCREAL
 I $G(VERS)=1.4 G FDREAL
 I $G(VERS)=2 G FEREAL
 I $G(VERS)=2.1 G FFREAL
 I $G(VERS)=2.3 G FGREAL
 I $G(VERS)=2.4 G FHREAL
 I $G(VERS)=2.5 G FIREAL^IBCRHBV1
 I $G(VERS)=2.6 G FJREAL^IBCRHBV1
 ;
FREAL S IBFILES("IBRCVA.TXT")="RC v1 Inpatient Facility Charges^A"
 S IBFILES("IBRCVB.TXT")="RC v1 Inpatient Facility Area Factors^B"
 S IBFILES("IBRCVC.TXT")="RC v1 Outpatient Facility Charges^C"
 S IBFILES("IBRCVD.TXT")="RC v1 Outpatient Facility Area Factors^D"
 S IBFILES("IBRCVE.TXT")="RC v1 Physician Charges E^E"
 S IBFILES("IBRCVF.TXT")="RC v1 Physician Charges F^F"
 S IBFILES("IBRCVG.TXT")="RC v1 Physician Charges G^G"
 S IBFILES("IBRCVH.TXT")="RC v1 Physician Area Factors^H"
 S IBFILES("IBRCVI.TXT")="RC v1 Physician Unit Area Factors^I"
 Q
 ;
FBREAL S IBFILES("IBRC0011A.TXT")="RC v1.1 Inpatient Facility Charges^A"
 S IBFILES("IBRC0011B.TXT")="RC v1.1 Inpatient Facility Area Factors^B"
 S IBFILES("IBRC0011C.TXT")="RC v1.1 Outpatient Facility Charges^C"
 S IBFILES("IBRC0011D.TXT")="RC v1.1 Outpatient Facility Area Factors^D"
 S IBFILES("IBRC0011E.TXT")="RC v1.1 Physician Charges E^E"
 S IBFILES("IBRC0011F.TXT")="RC v1.1 Physician Charges F^F"
 S IBFILES("IBRC0011G.TXT")="RC v1.1 Physician Charges G^G"
 S IBFILES("IBRC0011H.TXT")="RC v1.1 Physician Area Factors^H"
 S IBFILES("IBRC0011I.TXT")="RC v1.1 Physician Unit Area Factors^I"
 Q
 ;
FCREAL S IBFILES("IBRC0105A.TXT")="RC v1.2 Inpatient Facility Charges^A"
 S IBFILES("IBRC0105B.TXT")="RC v1.2 Inpatient Facility Area Factors^B"
 S IBFILES("IBRC0105C.TXT")="RC v1.2 Outpatient Facility Charges^C"
 S IBFILES("IBRC0105D.TXT")="RC v1.2 Outpatient Facility Area Factors^D"
 S IBFILES("IBRC0105E.TXT")="RC v1.2 Physician Charges E^E"
 S IBFILES("IBRC0105F.TXT")="RC v1.2 Physician Charges F^F"
 S IBFILES("IBRC0105G.TXT")="RC v1.2 Physician Charges G^G"
 S IBFILES("IBRC0105H.TXT")="RC v1.2 Physician Area Factors^H"
 S IBFILES("IBRC0105I.TXT")="RC v1.2 Physician Unit Area Factors^I"
 Q
 ;
FDREAL S IBFILES("IBRC0304A.TXT")="RC v1.4 Inpatient Facility Charges^A"
 S IBFILES("IBRC0304B.TXT")="RC v1.4 Inpatient Facility Area Factors^B"
 S IBFILES("IBRC0304C.TXT")="RC v1.4 Outpatient Facility Charges^C"
 S IBFILES("IBRC0304D.TXT")="RC v1.4 Outpatient Facility Area Factors^D"
 S IBFILES("IBRC0304E.TXT")="RC v1.4 Physician Charges E^E"
 S IBFILES("IBRC0304F.TXT")="RC v1.4 Physician Charges F^F"
 S IBFILES("IBRC0304G.TXT")="RC v1.4 Physician Charges G^G"
 S IBFILES("IBRC0304H.TXT")="RC v1.4 Physician Area Factors^H"
 S IBFILES("IBRC0304I.TXT")="RC v1.4 Physician Unit Area Factors^I"
 Q
 ;
FEREAL S IBFILES("IBRC0312A.TXT")="RC v2.0 Inpatient Facility Charges^A^10"
 S IBFILES("IBRC0312B.TXT")="RC v2.0 Outpatient Facility Charges^B^14"
 S IBFILES("IBRC0312C.TXT")="RC v2.0 Professional Charges^C^23"
 S IBFILES("IBRC0312D.TXT")="RC v2.0 Service Category Codes^D^4"
 S IBFILES("IBRC0312E.TXT")="RC v2.0 Area Factors^E^41"
 S IBFILES("IBRC0312F.TXT")="RC v2.0 VA Sites and Zip Codes^F^4"
 Q
 ;
FFREAL S IBFILES("IBRC0404A.TXT")="RC v2.1 Inpatient Facility Charges^A^10"
 S IBFILES("IBRC0404B.TXT")="RC v2.1 Outpatient Facility Charges^B^14"
 S IBFILES("IBRC0404C.TXT")="RC v2.1 Professional Charges^C^23"
 S IBFILES("IBRC0404D.TXT")="RC v2.1 Service Category Codes^D^4"
 S IBFILES("IBRC0404E.TXT")="RC v2.1 Area Factors^E^41"
 S IBFILES("IBRC0404F.TXT")="RC v2.1 VA Sites and Zip Codes^F^4"
 Q
 ;
FGREAL S IBFILES("IBRC0501A.TXT")="RC v2.3 Inpatient Facility Charges^A^10"
 S IBFILES("IBRC0501B.TXT")="RC v2.3 Outpatient Facility Charges^B^14"
 S IBFILES("IBRC0501C.TXT")="RC v2.3 Professional Charges^C^23"
 S IBFILES("IBRC0501D.TXT")="RC v2.3 Service Category Codes^D^4"
 S IBFILES("IBRC0501E.TXT")="RC v2.3 Area Factors^E^41"
 S IBFILES("IBRC0501F.TXT")="RC v2.3 VA Sites and Zip Codes^F^4"
 Q
 ;
FHREAL S IBFILES("IBRC0504A.TXT")="RC v2.4 Inpatient Facility Charges^A^10"
 S IBFILES("IBRC0504B.TXT")="RC v2.4 Outpatient Facility Charges^B^14"
 S IBFILES("IBRC0504C.TXT")="RC v2.4 Professional Charges^C^23"
 S IBFILES("IBRC0504D.TXT")="RC v2.4 Service Category Codes^D^4"
 S IBFILES("IBRC0504E.TXT")="RC v2.4 Area Factors^E^41"
 S IBFILES("IBRC0504F.TXT")="RC v2.4 VA Sites and Zip Codes^F^4"
 Q
