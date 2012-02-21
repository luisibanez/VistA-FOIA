MAGQBD ;WOIFO/PMK/RMP - Arbitrary file deletion [ 06/20/2001 08:57 ]
 ;;3.0;IMAGING;;Mar 01, 2002
 ;; +---------------------------------------------------------------+
 ;; | Property of the US Government.                                |
 ;; | No permission to copy or redistribute this software is given. |
 ;; | Use of unreleased versions of this software requires the user |
 ;; | to execute a written test agreement with the VistA Imaging    |
 ;; | Development Office of the Department of Veterans Affairs,     |
 ;; | telephone (301) 734-0100.                                     |
 ;; |                                                               |
 ;; | The Food and Drug Administration classifies this software as  |
 ;; | a medical device.  As such, it may not be changed in any way. |
 ;; | Modifications to this software may result in an adulterated   |
 ;; | medical device under 21CFR820, the use of which is considered |
 ;; | to be a violation of US Federal Statutes.                     |
 ;; +---------------------------------------------------------------+
 ;;
 ; !!! QUEUER MUST HANDLE NULLING MAGNETIC WRITE LOCATION !!
ENTRY(RESULT,QPTR) ; entry point from ^MAGBMAIN
 N FILE,X
 S U="^",X=^MAGQUEUE(2006.03,QPTR,0)
 S FILE=$P(X,"^",10)
 S RESULT="1"_U_FILE_U_QPTR_U_+$P(X,U,9)
 Q
