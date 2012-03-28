BQITUIX ;PRXM/HC/KJH - Build Taxonomy Program ; 18 Jul 2006  12:46 PM
 ;;2.1;ICARE MANAGEMENT SYSTEM;;Feb 07, 2011
 Q
 ;
BLDTAX(TAX,TARGET) ; PEP
 ;
 ; Takes a taxonomy name and builds an array that can then be used
 ; to scan various V-File cross-references to see which records
 ; match an entry in the Taxonomy.
 ;
 ; Currently supported Taxonomies are as follows:
 ; (where FILE is field #.15 in the TAXONOMY file #9002226)
 ;     ICD9 Diagnoses via ICD9 codes    (^ICD9     - FILE 80)
 ;     ICD9 Procedures via ICD9 codes   (^ICD0     - FILE 80.1)
 ;     CPT Procedures via CPT codes     (^ICPT     - FILE 81)
 ;     Medications via NDC codes        (^PSDRUG   - FILE 2)
 ;     Medications via MED IEN          (^PSDRUG   - FILE 50)
 ;     Laboratory tests via LOINC codes (^LAB(60)  - FILE 95.3)
 ;     Patient Education Topics by name (^AUTTEDT  - FILE 9999999.09)
 ;         NOTE: Use BLDTAX1 below if providing a list of partial Patient Education Topic Codes to match.
 ;     Immunizations via HL7/CVX codes  (^AUTTIMM  - FILE 9999999.14)
 ;     Health Factors by Name           (^AUTTHF   - FILE 9999999.64)
 ; (where FILE is field #.09 in the LAB TAXONOMY file #9002228)
 ;     Laboratory tests via LAB IEN     (^LAB(60)  - FILE 60)
 ;     VA Drug Class                    (^PS(50.605 - FILE 50.605)
 ;     Community                        (^AUTTCOM   - FILE 9999999.05)
 ;     Clinics                          (^DIC(40.7  - FILE 40.7)
 ; 
 ; Input:
 ;     TAX    = Name of Taxonomy from ATXAX or ATXLAB file.
 ;              (required)
 ;     TARGET = Closed array reference where the output will be stored.
 ;              (required)
 ;              This can be a local variable or global reference.
 ;              (Ex. TARGET="ARRAY" or TARGET="^TMP($J)"
 ; 
 ; Output:
 ;     An array in the local or global TARGET of the form:
 ;              @TARGET@(IEN)=NAME (.01 field)
 ;
 ;     NOTE: Kill the output array before calling the function unless
 ;           you intend to group several Taxonomies of the same type.
 ;
 N FILEREF,TAXIEN,TAXREF,ENTRY,VALUE,VAL,END,FILE,INDEX,IEN,NAME
 I TARGET=""!(TAX="") Q
 S TAXIEN=$O(^ATXAX("B",TAX,0)),TAXREF="^ATXAX"
 I TAXIEN="" S TAXIEN=$O(^ATXLAB("B",TAX,0)),TAXREF="^ATXLAB"
 I TAXIEN="" Q
 I TAXREF="^ATXAX" S FILEREF=$$GET1^DIQ(9002226,TAXIEN,.15,"I")
 I TAXREF="^ATXLAB" S FILEREF=$$GET1^DIQ(9002228,TAXIEN,.09,"I")
 ; The following file references from Taxonomy are supported:
 I $F(",40.7,80,80.1,81,2,50,95.3,9999999.09,9999999.14,9999999.64,60,50.605,9999999.05,",","_FILEREF_",")=0 Q
 S ENTRY=0
 F  S ENTRY=$O(@TAXREF@(TAXIEN,21,ENTRY)) Q:'ENTRY  D
 .S VALUE=@TAXREF@(TAXIEN,21,ENTRY,0)
 .S VAL=$P(VALUE,U,1),END=$P(VALUE,U,2)
 .; LAB entries use the IEN and only specify one value.
 .I FILEREF=60 D  Q
 ..S NAME=$P($G(^LAB(60,VAL,0)),U,1),@TARGET@(VAL)=NAME
 .; MED entries use the IEN and only specify one value.
 .I FILEREF=50.605 D  Q
 ..NEW X,NVAL
 ..S NVAL=$O(^PS(50.605,"B",VAL,"")) Q:NVAL=""
 ..S X="" F  S X=$O(^PSDRUG("VAC",NVAL,X)) Q:X=""  D
 ...S NAME=$P($G(^PSDRUG(X,0)),U,1),@TARGET@(X)=NAME
 .I FILEREF=50 D  Q
 ..S NAME=$P($G(^PSDRUG(VAL,0)),U,1),@TARGET@(VAL)=NAME
 .I FILEREF=40.7 D  Q
 ..S NAME=$P($G(^DIC(40.7,VAL,0)),U,1),@TARGET@(VAL)=NAME
 .; Otherwise, treat all items as ranges (even if there is only one entry).
 .I END="" S END=VAL
 .D
 ..I FILEREF=95.3 D  Q
 ...; The LOINC x-ref in LAB does not use the check digit (piece 2).
 ...S VAL=$P(VAL,"-"),END=$P(END,"-")
 ...S FILE="^LAB(60)",INDEX="AF"
 ..I FILEREF=2 S FILE="^PSDRUG",INDEX="D" Q
 ..I FILEREF=9999999.05 S FILE="^AUTTCOM",INDEX="B" Q
 ..I FILEREF=9999999.09 S FILE="^AUTTEDT",INDEX="B" Q
 ..I FILEREF=9999999.14 S FILE="^AUTTIMM",INDEX="C" Q
 ..I FILEREF=9999999.64 S FILE="^AUTTHF",INDEX="B" Q
 ..; CPT, ICD9, and ICD0 require a SPACE be added to the code.
 ..; Some Taxonomy entries already have the space included.
 ..S:$E(VAL,$L(VAL))'=" " VAL=VAL_" "
 ..S:$E(END,$L(END))'=" " END=END_" "
 ..I FILEREF=80 S FILE="^ICD9",INDEX="BA" Q
 ..I FILEREF=80.1 S FILE="^ICD0",INDEX="BA" Q
 ..I FILEREF=81 S FILE="^ICPT",INDEX="BA" Q
 .; Backup one entry so loop can find all the entries in the range.
 .S VAL=$O(@FILE@(INDEX,VAL),-1)
 .F  S VAL=$O(@FILE@(INDEX,VAL)) Q:VAL=""  Q:$$CHECK(VAL,END)  D
 ..S IEN=""
 ..F  S IEN=$O(@FILE@(INDEX,VAL,IEN)) Q:IEN=""  D
 ...S NAME=$P($G(@FILE@(IEN,0)),U,1)
 ...S @TARGET@(IEN)=NAME
 Q
 ;
CHECK(V,E) ;
 N Z
 I V=E Q 0
 S Z(V)=""
 S Z(E)=""
 I $O(Z(""))=E Q 1
 Q 0
 ;
BLDTAX1(TAX,TARGET) ;EP
 ;
 ; Takes a list of partial Patient Education topic names and
 ; builds an array that can then be used to scan a V-File
 ; cross-reference to see which records match an entry in the
 ; list.
 ;
 ; This tag only supports Patient Education:
 ; (where FILE is field #.15 in the TAXONOMY file #9002226)
 ;     Patient Education Topic Codes (^AUTTEDT  - FILE 9999999.09)
 ; 
 ; Input:
 ;     TAX = PATIENT EDUCATION TOPIC CODE LIST to search for
 ;           (required)
 ;
 ;     Example: "CD-,-CD,AOD-,-AOD"
 ;     Example: "*BGP HIV/AIDS DXS"
 ;
 ;     Returns items where the MNEMONIC field for the Patient
 ;     Education entry contains one of the listed values.
 ;
 ;     Second example shows an ICD taxonomy name.
 ;     If used, will search for any Patient Education entry
 ;     containing one of the values in that Taxonomy.
 ;
 ;     TARGET : Closed array reference where the output will be stored.
 ;              This can be a local variable or global reference.
 ;              (Ex. TARGET="ARRAY" or TARGET="^TMP($J)"
 ;
 ; Output:
 ;     An array in the local or global TARGET of the form:
 ;              @TARGET@(IEN)=NAME (.01 field)
 ;
 ;     NOTE: Kill the output array before calling the function unless
 ;           you intend to group several Taxonomies of the same type.
 ;
 N VAL,IEN,NAME,MNEMONIC,TAX1,I,ICDIEN,FLG
 F I=1:1:$L(TAX,",") S TAX1=$P(TAX,",",I) I $E(TAX1)="*" D BLDTAX($E(TAX1,2,$L(TAX1)),"ICDIEN")
 S VAL=""
 F  S VAL=$O(^AUTTEDT("B",VAL)) Q:VAL=""  D
 .S IEN=""
 .F  S IEN=$O(^AUTTEDT("B",VAL,IEN)) Q:IEN=""  D
 ..S NAME=$$GET1^DIQ(9999999.09,IEN,.01,"I"),MNEMONIC=$$GET1^DIQ(9999999.09,IEN,1,"I"),FLG=0
 ..F I=1:1:$L(TAX,",") S TAX1=$P(TAX,",",I) I $E(TAX1)'="*",MNEMONIC[TAX1 S @TARGET@(IEN)=NAME_U_MNEMONIC,FLG=1 Q
 ..I FLG=1 Q
 ..S I=""
 ..;If an ICD is used as the MNEMONIC it will be formatted as "ICD-abbreviation".
 ..;For example, if the ICD is "042." and the patient education is 'alcohol or drugs' then the MNEMONIC would be "042.-AOD".
 ..F  S I=$O(ICDIEN(I)) Q:I=""  S TAX1=ICDIEN(I)_"-" I MNEMONIC[TAX1 S @TARGET@(IEN)=NAME_U_MNEMONIC,FLG=1 Q
 ..I FLG=1 Q
 ..Q
 .Q
 Q
