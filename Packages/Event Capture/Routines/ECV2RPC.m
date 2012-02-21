ECV2RPC ;ALB/ACS;Event Capture Spreadsheet Validation;07 Aug 01
 ;;2.0; EVENT CAPTURE ;**25,30,49**;8 May 96
 ;
 ;-----------------------------------------------------------------------
 ;       Validates the following Event Capture spreadsheet fields:
 ;       1. Location
 ;       2. Patient SSN
 ;       3. Patient Name
 ;-----------------------------------------------------------------------
 ;=======================================================================
 ;MODIFICATIONS
 ;08/2001    EC*2.0*30  Updated the error message for Location
 ;=======================================================================
 ;
 ;--Set up error flag
 S ECERRFLG=0
 ;
 ;--Location must be on the Institution file
 I '$D(^DIC(4,ECSTAV)),'$D(^DIC(4,"D",ECSTAV)) D 
 . ; Location not on the VistA file
 . S ECERRMSG=$P($T(STA1^ECV2RPC),";;",2)
 . S ECCOLERR=ECSTAPC
 . D ERROR
 . Q
 ;Check for multiple station number entries
 N LOC,C,STR
 S (LOC,C)=0,STR=""
 F  S LOC=$O(^DIC(4,"D",ECSTAV,LOC)) Q:'LOC  S C=C+1 D
 . S LOC(LOC)=ECSTAV_", Location IEN "_LOC_", "_$P(^DIC(4,LOC,0),"^")
 I C>1 S LOC=0 F  S LOC=$O(LOC(LOC)) Q:'LOC  D
 . S ECERRMSG=$P($T(STA2^ECV2RPC),";;",2)_LOC(LOC)
 . S ECCOLERR=ECSTAPC
 . D ERROR
 I C=1,$D(^DIC(4,"D",ECSTAV)) S ECSTAV=$O(^DIC(4,"D",ECSTAV,"")) ;get ien
 ;
 ;--Patient SSN must be on the Patient file--
 N ECNAME4,ECNAME3,ECNAME2,ECNAME1,ECVNAME4,ECVNAME3
 N ECVNAME2,ECVNAME1,ECVNAME,ECSSNNUM
 S (ECSSNIEN,ECERRFLG)=0,ECSSNNUM=+ECSSNV
 I $L(ECSSNNUM)>9!$L(ECSSNV)>10 D
 . ; User has entered an SSN that is too long
 . S ECERRMSG=$P($T(SSN5^ECV2RPC),";;",2)
 . S ECCOLERR=ECSSNPC
 . D ERROR
 . Q
 I 'ECERRFLG D
 . ; -add leading zeros if needed
 . I $L(ECSSNNUM)<9 S ECSSNV=$E("000000000",1,9-$L(ECSSNNUM))_ECSSNNUM
 . I $L(ECSSNV)>10 D 
 . . ; User has entered an invalid SSN
 . . S ECERRMSG=$P($T(SSN5^ECV2RPC),";;",2)
 . . S ECCOLERR=ECSSNPC
 . . D ERROR
 . . Q
 . I 'ECERRFLG,$L(ECSSNV)=10 D
 . . I $E(ECSSNV,10,10)'="P" D
 . . . ; Invalid SSN
 . . . S ECERRMSG=$P($T(SSN5^ECV2RPC),";;",2)
 . . . S ECCOLERR=ECSSNPC
 . . . D ERROR
 . . Q
 . I 'ECERRFLG,'$D(^DPT("SSN",ECSSNV)) D
 . . ; No SSN x-ref on patient file
 . . S ECERRMSG=$P($T(SSN1^ECV2RPC),";;",2)
 . . S ECCOLERR=ECSSNPC
 . . D ERROR
 . . Q
 . Q
 I 'ECERRFLG D
 . ; -get SSN IEN
 . S ECSSNIEN=$O(^DPT("SSN",ECSSNV,0))
 . I 'ECSSNIEN D
 . . S ECERRMSG=$P($T(SSN2^ECV2RPC),";;",2)
 . . S ECCOLERR=ECSSNPC
 . . D ERROR
 . . Q
 . Q
 I 'ECERRFLG,'$D(^DPT(ECSSNIEN,0)) D
 . ; SSN record not found
 . S ECERRMSG=$P($T(SSN3^ECV2RPC),";;",2)
 . S ECCOLERR=ECSSNPC
 . D ERROR
 . Q
 ;
 I 'ECERRFLG D
 . ; -Compare patient file ssn to patient ssn
 . S ECVSSN=$P(^DPT(ECSSNIEN,0),U,9)
 . I ECVSSN'=ECSSNV D
 . . ; Spreadsheet ssn doesn't match vista
 . . S ECERRMSG=$P($T(SSN4^ECV2RPC),";;",2)
 . . S ECCOLERR=ECSSNPC
 . . D ERROR
 . . Q
 . Q
 ;--Patient Name must match VistA name--
 I 'ECERRFLG D
 . S ECVNAME=$P(^DPT(ECSSNIEN,0),U,1)
 . I '$D(ECVNAME) D
 . . ; Patient name missing from VistA file
 . . S ECERRMSG=$P($T(NAME1^ECV2RPC),";;",2)
 . . S ECCOLERR=ECSSNPC
 . . D ERROR
 . . Q
 . Q
 I 'ECERRFLG,'ECDECPAT D
 . N DFN,VADM S DFN=ECSSNIEN D 2^VADPT I +VADM(6) D
 . . S ECERRMSG="WARNING: [PATIENT DIED ON "_$P(VADM(6),U,2)_"]"
 . . S ECCOLERR=ECSSNPC
 . . D ERROR
 I 'ECERRFLG D
 . S ECVNAME4=$E(ECVNAME,1,4),ECNAME4=$E(ECPATV,1,4)
 . S ECVNAME3=$E(ECVNAME,1,3),ECNAME3=$E(ECPATV,1,3)
 . S ECVNAME2=$E(ECVNAME,1,2),ECNAME2=$E(ECPATV,1,2)
 . S ECVNAME1=$E(ECVNAME,1,1),ECNAME1=$E(ECPATV,1,1)
 . I ECNAME1'=ECVNAME1 D
 . . ; First char of name doesn't match
 . . S ECERRMSG=$P($T(NAME5^ECV2RPC),";;",2)
 . . S ECCOLERR=ECPATLPC
 . . D ERROR
 . . Q
 . I 'ECERRFLG,ECNAME2'=ECVNAME2 D
 . . ; First 2 chars of name doesn't match
 . . S ECERRMSG=$P($T(NAME2^ECV2RPC),";;",2)
 . . S ECCOLERR=ECPATLPC
 . . D ERROR
 . . Q
 . I 'ECERRFLG,(ECNAME3'=ECVNAME3) D
 . . ; First 3 chars of name doesn't match
 . . S ECERRMSG=$P($T(NAME3^ECV2RPC),";;",2)
 . . S ECCOLERR=ECPATLPC
 . . D ERROR
 . . Q
 . I 'ECERRFLG,(ECNAME4'=ECVNAME4) D
 . . ; First 4 chars of name doesn't match
 . . S ECERRMSG=$P($T(NAME4^ECV2RPC),";;",2)
 . . S ECCOLERR=ECPATLPC
 . . D ERROR
 . . Q
 . Q
 Q
 ;
ERROR ;--Set up array entry to contain the following:
 ;1. record number
 ;2. column number on spreadsheet containing the record number
 ;3. column number on spreadsheet containing the data in error
 ;4. error message
 ;
 S ECINDEX=ECINDEX+1
 S RESULTS(ECINDEX)=ECRECV_"^"_ECRECPC_"^"_ECCOLERR_"^"_ECERRMSG_"^"
 S ECERRFLG=1
 Q
 ;
 ;Error messages:
 ;
STA1 ;;Location not on institution file(#4)
STA2 ;;Multiple entries found for Location/Station #
SSN1 ;;No SSN x-ref on patient file(#2)
SSN2 ;;No SSN entry on patient file(#2)
SSN3 ;;No internal entry on patient file(#2) for ssn x-ref
SSN4 ;;SSN doesn't match SSN on patient file(#2)
SSN5 ;;SSN invalid
NAME1 ;;Patient Name is missing from VistA patient file(#2)
NAME2 ;;First 2 chars of patient last name don't match VistA
NAME3 ;;First 3 chars of patient last name don't match VistA
NAME4 ;;First 4 chars of patient last name don't match VistA
NAME5 ;;First char of patient last name doesn't match VistA
