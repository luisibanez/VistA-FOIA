PXRMTAXS ; SLC/PKR - Set taxonomy search variables. ;01/08/2005
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;=====================================================
SETVAR(TAXARR,ENS,INS,NICD0,NICD9,NCPT,NRCPT,PLS,RAS) ;
 N TEMP
 ;Initialize the taxonomy search variables.
 ;Setup the Patient Data Source control variables.
 S TEMP=$P(TAXARR(811.2,0),U,4)
 ;The default is to search all locations.
 I TEMP="" S (ENS,INS,PLS,RAS)=1
 E  D
 . S ENS=$S(TEMP["EN":1,1:0)
 . S INS=$S(TEMP["IN":1,1:0)
 . S PLS=$S(TEMP["PL":1,1:0)
 . S RAS=$S(TEMP["RA":1,1:0)
 S TEMP=$G(TAXARR(0))
 S NICD0=+$P(TEMP,U,3)
 S NICD9=+$P(TEMP,U,5)
 S NCPT=+$P(TEMP,U,7)
 S NRCPT=+$P(TEMP,U,9)
 Q
 ;
