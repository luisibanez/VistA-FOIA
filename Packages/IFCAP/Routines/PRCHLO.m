PRCHLO ;WOIFO/RLL-EXTRACT ROUTINE CLO REPORT SERVER ; 12/14/05 9:24am
V ;;5.1;IFCAP;**83**;; Oct 20, 2000
 ; Per VHA Directive 10-93-142, this routine should not be modified
 ; 
 ; PRCHLO* routines are used to build the extract files from
 ; file 442 for the clinical logistics report server.
 ; PRCHLO thru PRCHLO5 perform the following:
 ; 1. Initialize environment
 ; 2. Get parameters for the month being run
 ; 3. Pull data from file 442 for month being run
 ; 4. Create multiple "^" delimited flat files for report server
 ; 5. At the completion of extracts FTP files to report server
 ; 6. Clean up / remove any temp files
 ; 7. logout
 ; CALC is the programmer entry point used to test the extract
 ; options for the first iteration of coding
 ;
 Q
INIT ; Initialize environment
 ;
 ; 
 ; Get todays date
 N %
 S %=$P(($$NOW^XLFDT),".",1)
 ; Always start from the 1st of the month to the end of month
 ; and at least 45 days prior to todays date
 ;
 ; The CALC entry point is used for testing from programmer mode
 ; and allows the programmer to pass a specific date
 ; in the variable %=FM date format
 ;
CALC ;test entry point, set %I to FM date
 ;
 N CLO1,CLO2,CLO2B,CLO2E,CLO3,CLOBGN,CLOEND,POND1,POND2,CLO1A
 S CLO1=$E(%,1,3)
 S CLO2=$E(%,4,5)
 I +CLO2>2  D
 . S CLO2B=CLO2-2
 . I $L(CLO2B)<2 S CLO2B=0_CLO2B
 . S CLO2E=CLO2-1
 . I $L(CLO2E)<2 S CLO2E=0_CLO2E
 . S CLOBGN=+(CLO1_(CLO2B)_"00")
 . S CLOEND=+(CLO1_(CLO2E)_"01")
 . Q
 ; check for January run, and Feb run
 I +CLO2=1  D
 . S CLO1=CLO1-1
 . S CLOBGN=+(CLO1_11_"00")  ; Start date is Nov 1st
 . S CLOEND=+(CLO1_12_"01")  ; End date is   Dec 1st
 . Q
 I +CLO2=2  D
 . S CLO1A=CLO1-1  ; Need to get Dec, previous year
 . S CLOBGN=+(CLO1A_12_"00")  ; Start date is Dec 1st
 . S CLOEND=+(CLO1_"01"_"01")  ; End date is  Jan 1st
 . Q
 ; Q
 D GPARM
 ; Make sure ^TMP($J) is set with data, otherwise return error
 N CKTP
 S CKTP=$O(^TMP($J,0))
 I CKTP=""  D
 . S CLRSERR=1  ; error flag indicates no data in ^TMP($J)
 . Q
 Q
 ;
GPARM ; Get parameters for monthly extract
 ;
 ; need to set monthyear for data file
 ;
 N MNTHYR,FMDT1,MYRVAL
 S FMDT1=$P(($$NOW^XLFDT),".",1)
 S MYRVAL=$$FMTE^XLFDT(FMDT1)
 S MNTHYR=$P(MYRVAL," ",1)_","_$P(MYRVAL," ",3)
 ;
 ; $O through the "AB" x-ref based on CLOBGN and CLOEND
 ;
 S CLO1=CLOBGN,CLO2="",CLO3=""
 F  S CLO1=$O(^PRC(442,"AB",CLO1)) Q:CLO1=""  D
 . F  S CLO2=$O(^PRC(442,"AB",CLO1,CLO2)) Q:CLO2=""  D
 . . Q:CLO1>(CLOEND-1)
 . . D GKEY
 . . Q
 . Q
 Q
EXTR ; Extract the data, create files
 ;
GKEY ; get key for all tables
 N POID,POND0,POND1,POCRDAT
 S POND0=$G(^PRC(442,CLO2,0))
 S POND1=$G(^PRC(442,CLO2,1))
 S POID=CLO2
 S POCRDAT=CLO1  ; PO Date from x-ref value
 D GPOMAST^PRCHLO1  ;
 Q
