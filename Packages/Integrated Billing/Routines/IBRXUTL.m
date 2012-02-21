IBRXUTL ;ALB/MAF - PHARMACY API CALLS ; MAY 25, 2005
 ;;2.0;INTEGRATED BILLING;**309**;21-MAR-94
 ;
 ; This routine contains calls to Pharmacy API's to get data
 ; from the Drug file
ZERO(IBDRV) ;This call gets the data from the zero node for file 50 DRUG.
 ;Integration Agreement DBIA 4533 with Pharmacy.
 ;input -  the IFN of the DRUG
 ;output - info is listed in ^TMP($J,"IBDRUG",drug IFN,field number))
 ;the information is listed by using the field number of the data piece.
 ;ie.  the info for the generic drug name .01 field of file 50 will list
 ;like this:
 ;^TMP($J,"IBDRUG",drug IFN,.01)
 ;the DEA, SPECIAL HDLG data 3 field of file 50 will list like this:
 ;^TMP($J,"IBDRUG",drug IFN,3)
 N X
 K ^TMP($J,"IBDRUG")
 S X="IBDRUG" D ZERO^PSS50(IBDRV,,,,,X)
 Q
DATA(IBDRV) ;This call gets more detailed information on the drug 
 ;plus the zero node information for file 50 DRUG.
 ;Integration Agreement DBIA 4533 with Pharmacy.
 ;input -  the IFN of the DRUG
 ;output - info is listed in ^TMP($J,"IBDRUG",drug IFN,field number))
 ;the information is listed by using the field number of the data piece.
 ;ie.  the info for the generic drug name .01 field of file 50 will list
 ;like this:
 ;^TMP($J,"IBDRUG",drug IFN,.01)
 ;the DEA, SPECIAL HDLG data 3 field of file 50 will list like this:
 ;^TMP($J,"IBDRUG",drug IFN,3)
 N X
 K ^TMP($J,"IBDRUG")
 S X="IBDRUG" D DATA^PSS50(IBDRV,,,,,X)
 Q
