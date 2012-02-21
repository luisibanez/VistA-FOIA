MAGGTSY2 ;WOIFO/GEK - Calls from Imaging windows for System Manager ; [ 06/20/2001 08:57 ]
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
MAG(MAGRY,NODE) ; RPC Call for MAGSYS utility. Returns Global Node.
 N CT,I,X,Y
 S MAGRY=$NA(^TMP("MAGNODE",$J))
 S NODE=+$G(NODE)
 I 'NODE S NODE=$P(^MAG(2005,0),U,3)
 K @MAGRY
 ;S @MAGRY@(0)="Display Imaging File NODE "_$S(NODE:NODE,1:"LAST")
 S I=0,CT=0
 S I="^MAG(2005,"_NODE_","""")"
 F  S X=$Q(@I) S I=X Q:$P(X,",",2)'=NODE  D
 . S CT=CT+1,@MAGRY@(CT)=X_" "_@X
 Q
