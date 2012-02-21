MAGGTSYS ;WOIFO/GEK - Calls from Imaging windows for System Manager ; [ 06/20/2001 08:57 ]
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
 Q
MAG(MAGRY,NODE) ;RPC Call to show node of Image File
 ;  NODE is the IEN of Image File :  ^MAG(2005,NODE
 N Y
 S MAGRY=$NA(^TMP("MAGNODE",$J))
 S NODE=+$G(NODE)
 I 'NODE S NODE=$P(^MAG(2005,0),U,3)
 N MAGWIN,I,CT,X
 S MAGWIN=$$BROKER^XWBLIB
 K @MAGRY
 ;S @MAGRY@(0)="Display Imaging File NODE "_$S(NODE:NODE,1:"LAST")
 S I=0,CT=0
 I 'MAGWIN W !,"NODE","  ",NODE
 S I="^MAG(2005,"_NODE_","""")"
 F  S X=$Q(@I) S I=X Q:$P(X,",",2)'=NODE  D
 . S CT=CT+1,@MAGRY@(CT)=X_" "_@X
 . I 'MAGWIN W !,X," ",@X
 ;
 Q
GETS(MAGRY,NODE,FLAGS) ; USE GETS^DIQ TO GET FIELD VALUES.
 N Y
 S MAGRY=$NA(^TMP("MAGNODE",$J))
 S NODE=+$G(NODE)
 I 'NODE S NODE=$P(^MAG(2005,0),U,3)
 N MAGWIN,I,CT
 S MAGWIN=$$BROKER^XWBLIB
 K @MAGRY
 S @MAGRY@(0)="Fields for Image IEN: "_NODE
 S I=0,CT=0
 I 'MAGWIN W !,"NODE","  ",NODE
 N MAGOUT,MAGERR
 S FLAGS=$S($L($G(FLAGS)):FLAGS,1:"IERN")
 D GETS^DIQ(2005,NODE,"*",FLAGS,"MAGOUT","MAGERR")
 ;D GETS^DIQ(2005,NODE,".01;1;2;2.1;2.2;3;5;6;12","R","MAGOUT","MAGERR")
 S NNODE=NODE_","
 S I="" F  S I=$O(MAGOUT(2005,NNODE,I)) Q:I=""  D
 . S CT=CT+1
 . I $G(MAGOUT(2005,NNODE,I,"I"))=$G(MAGOUT(2005,NNODE,I,"E")) S @MAGRY@(CT)=I_" = "_MAGOUT(2005,NNODE,I,"E") Q
 . S @MAGRY@(CT)=I_" = ("_$G(MAGOUT(2005,NNODE,I,"I"))_") = "_$G(MAGOUT(2005,NNODE,I,"E"))
 Q
