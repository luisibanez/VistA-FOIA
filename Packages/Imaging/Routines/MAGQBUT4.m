MAGQBUT4 ;WOIFO/RMP - BP Utilities  ;19 Nov 2001 1:23 PM
 ;;3.0;IMAGING;**7,8,48**;Jan 11, 2005
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
 ;
 Q
CONV(ARR,ICT) ;Convert any single node array to FM Style multiple
 ;  The node subscripts of ARR are ignored, and not retained
 ; i.e.  ARR(34)=8
 ;       ARR("BLUE")=9
 ;       ARR("D")=10
 ; converts to
 ;      ARR(1,0)=8
 ;      ARR(2,0)=9
 ;      ARR(3,0)=10
 N I,ARO
 S ICT=0,I=""
 F  S I=$O(ARR(I)) Q:(I="")  D
 . S ICT=ICT+1
 . S ARO(ICT,0)=ARR(I)
 K ARR
 M ARR=ARO
 Q
MRGMULT(ARR,RT,RTDSC,CT) ;Merge the FM formatted array into a FM File
 ;   multiple field.
 ;   This isn't for general consumption.
 ; RT = FILE ROOT, RECORD NUMBER, NODE
 ; i.e.  "^MAG(2006.034,44,1,"   -> 44 is the IEN of MAG(2006.34
 ; RTDSC is the 2nd piece of the 0 node of the multiple field.
 S RT=$E(RT,1,$L(RT)-1)_")"
 S @RT@(0)=U_RTDSC_U_CT_U_CT ;  i.e.    ^2006.341A^13^13
 M @RT=ARR
 Q
DDLF(RESULTS,FILE,FIELD,FLAGS,ATTR) ;[MAG FLD ATT]
 S X="ERR^MAGQBTM",@^%ZOSF("TRAP")
 K X
 D FIELD^DID(FILE,FIELD,FLAGS,ATTR,"RESULTS","RESULTS")
 Q
DDFA(RESULTS) ;[MAG ATT LST]
 S X="ERR^MAGQBTM",@^%ZOSF("TRAP")
 K X
 D FIELDLST^DID(RESULTS)
 Q
DHRPC(RESULTS,FNAME,FLOC) ;[MAG DIRHASH]
 N TMP
 S X="ERR^MAGQBTM",@^%ZOSF("TRAP")
 K X
 S TMP=$$DIRHASH^MAGFILEB(FNAME,FLOC)
 S RESULTS=$S(TMP="":U,1:TMP)
 Q
GPACHX(PV) ; Get Package File Install History of Imaging
 N I,LCNT,MSG,PKG
 S LCNT=0
 S PV(0)="Version^Install Date"
 F PKG="IMAGING" D
 . N J,K,L,VERS,DATE,X,Y,%DT
 . S J=$O(^DIC(9.4,"B",PKG,"")) Q:'J
 . S VERS="" F  S VERS=$O(^DIC(9.4,J,22,"B",VERS)) Q:VERS=""  D
 . . N MSG,TAR
 . . S K=$O(^DIC(9.4,J,22,"B",VERS,""))
 . . D LIST^DIC(9.4901,","_K_","_J_",","@;.01;.02;.03","","","","","","","","TAR","MSG")
 . . Q:$D(MSG("DIERR"))
 . . S L=0 F  S L=$O(TAR("DILIST","ID",L)) Q:'L  D
 . . . S LCNT=LCNT+1
 . . . S PV(LCNT)=VERS_"P"_$P(TAR("DILIST","ID",L,".01"),"^",1)
 . . . S X=$P(TAR("DILIST","ID",L,".02"),"^",1) D ^%DT S DATE=$$FMTE^XLFDT(Y,2)
 . . . S PV(LCNT)=PV(LCNT)_"^"_$S(DATE["-1":"",1:DATE)
 . . . Q
 . . Q
 . Q
 Q
VOK(VER) ; Check for the appropriate BP Queue processor version
 ; This routine MAGQBUT4 will need to be released with each BP Update
 ; The variable CVERS will contain the current BP server version
 ;       ;;3.0;IMAGING;**7,13,8**;Jul 26, 2004
 N VN,I,CVERS,PNUM,SLINE
 S SLINE=$T(+2)
 S PNUM=$$TRIM^MAGQST($P(SLINE,"**",2)),PNUM=$$TRIM^MAGQST($P(PNUM,",",$L(PNUM,",")))
 S CVERS=$$TRIM^MAGQST($P(SLINE,";",3))_"P"_PNUM
 Q $S(CVERS=VER:1,1:0)
 ;
