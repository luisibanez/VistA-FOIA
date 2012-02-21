MAGGNLKP ;WOIFO/GEK - Lookup from delphi into any file ; [ 06/20/2001 08:56 ]
 ;;3.0;IMAGING;**8**;Sep 15, 2004
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
 Q
 ;
LKP(MAGRY,MAGIN) ;RPC [MAG3 LOOKUP ANY] 
 ; Generic lookup using FIND^DIC
 ; MAGRY is the Array to return.
 ; MAGIN is parameter sent by calling app (Delphi)
 ;    FILE NUM ^ NUM TO RETURN ^ TEXT TO MATCH ^  ^ SCREEN ($P 5-99)
 N $ETRAP,$ESTACK S $ETRAP="D ERRA^MAGGTERR"
 ;
 ; Kernel uses Y, we have to New it because calls to DIC etc
 ;            also use it and change it, and kill it.
 N Y,XI,Z,FI,MAGIEN,INFO
 N FILE,IENS,FLDS,FLAGS,VAL,NUM,INDEX,SCR,IDENT,TROOT
 S (FILE,IENS,FLDS,FLAGS,VAL,NUM,INDEX,SCR,IDENT,TROOT)=""
 ;
 S FILE=+$P(MAGIN,U,1) ; this is the File Number
 ; HERE
 I 'FILE S MAGRY(1)="0^ERROR - Invalid Parameter:  File Number ? " Q
 I '$$VFILE^DILFD(FILE) S MAGRY(1)="0^ERROR - Invalid File # - "_FILE Q
 ;          Number of entries to return, If 0 we'll stop at 200
 S NUM=$S(+$P(MAGIN,U,2):+$P(MAGIN,U,2),1:200)
 S VAL=$P(MAGIN,U,3) ; this is the starting value i.e. 'Smi'
 S SCR=$P(MAGIN,U,5,99)
 ;  
 S FLDS=$P(MAGIN,U,4) ; if fields were sent (6/21/96)
 ;  index will default to "B" if nothing sent. 
 S INDEX="B"
 ;
 K ^TMP("DILIST",$J) ; is this necessary ?
 K ^TMP("DIERR",$J) ; This is. 
 ;  
 D FIND^DIC(FILE,IENS,FLDS,FLAGS,VAL,NUM,INDEX,SCR,IDENT,TROOT)
 ;
 I '$D(^TMP("DILIST",$J,1)) S XI=1 D  Q
 . I $D(^TMP("DIERR",$J)) D FINDERR(XI) Q
 . S MAGRY(XI)="0^NO MATCH for lookup on """_$P(MAGIN,"^",3)_""""
 ;  so we have some matches, (BUT we could still have an error)
 ;  so first list all matches, then the ERROR
 ;  Next lines were Q&D but old .EXE's expect return string with 
 ;  this syntax, when all T11 code is gone, this can be rewritten
 S XI="" F  S XI=$O(^TMP("DILIST",$J,1,XI)) Q:XI=""  S X=^(XI) D
 . S MAGIEN=^TMP("DILIST",$J,2,XI)
 . S Z=""
 . F  S Z=$O(^TMP("DILIST",$J,"ID",XI,Z)) Q:Z=""  S X=X_"   "_^(Z)
 . S MAGRY(XI)=X_"^"_MAGIEN
 ;
 I $D(^TMP("DIERR",$J)) D FINDERR() Q
 I $D(^TMP("DILIST",$J,0)) S INFO=^(0) D
 . S MAGRY(0)=$P(INFO,"^")_U_"Found "_$P(INFO,"^")_" entr"_$S((+INFO=1):"y",1:"ies")_" matching """_$P(MAGIN,"^",3)_""""
 . I $P(INFO,"^",3)>0 S MAGRY(0)=MAGRY(0)_" there are more"
 . Q
 Q
FINDERR(XI) ;
 ;
 I '+$G(XI) S XI=$O(MAGRY(""),-1)+1
 S MAGRY(XI)="ERROR^"_^TMP("DIERR",$J,1,"TEXT",1)
 Q
