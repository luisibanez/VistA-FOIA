PXRMENOD ; SLC/PKR - Clinical Reminders "E" node routines. ;01/20/2004
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;========================================================
KENODE(X,DA,FILENUM) ;Kill the enode in the finding multiple for definitions
 ;and terms.
 ;Do not execute as part of a verify fields.
 I $G(DIUTIL)="VERIFY FIELDS" Q
 N DAS,GLOBAL,IEN
 S IEN=$P(X,";",1)
 S GLOBAL=$P(X,";",2)
 I GLOBAL="LAB(60," D
 . N SUB
 .;DBIA #91-A
 . S SUB=$P(^LAB(60,IEN,0),U,4)
 . S DAS=$S(SUB="CH":IEN,SUB="CY":"A;T;"_IEN,SUB="EM":"A;T;"_IEN,SUB="EM":"A;T;"_IEN,SUB="MI":"M;T;"_IEN,1:"")
 E  S DAS=IEN
 I DAS="" Q
 I FILENUM=811.5 K ^PXRMD(811.5,DA(1),20,"E",GLOBAL,DAS,DA)
 I FILENUM=811.9 K ^PXD(811.9,DA(1),20,"E",GLOBAL,DAS,DA)
 Q
 ;
 ;========================================================
SENODE(X,DA,FILENUM) ;Set the enode in the finding multiple for definitions
 ;and terms.
 ;Do not execute as part of a verify fields.
 I $G(DIUTIL)="VERIFY FIELDS" Q
 N DAS,GLOBAL,IEN
 S IEN=$P(X,";",1)
 S GLOBAL=$P(X,";",2)
 I GLOBAL="LAB(60," D
 . N SUB
 .;DBIA #91-A
 . S SUB=$P(^LAB(60,IEN,0),U,4)
 . S DAS=$S(SUB="CH":IEN,SUB="CY":"A;T;"_IEN,SUB="EM":"A;T;"_IEN,SUB="EM":"A;T;"_IEN,SUB="MI":"M;T;"_IEN,1:"")
 E  S DAS=IEN
 I DAS="" Q
 I FILENUM=811.5 S ^PXRMD(811.5,DA(1),20,"E",GLOBAL,DAS,DA)=""
 I FILENUM=811.9 S ^PXD(811.9,DA(1),20,"E",GLOBAL,DAS,DA)=""
 Q
 ;
