MAGBRTE5 ;WOIFO/PMK - Background Routing - Load Balance ; 05/06/2004  06:32
 ;;3.0;IMAGING;**11,30**;16-September-2004
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
BALANCE(IMAGE,RULE) N %,D,DEST,PARENT,PRI,X
 S PARENT=$P(^MAG(2005,IMAGE,0),"^",10) ; ~~~
 D:'$D(^MAGRT(2006.5906,RULE,1,PARENT))
 . N CP,M1,M2,MAX,B,E,L,RD,T
 . ;
 . L +^MAGRT(2006.5906,0):1E9 ; Background task must wait for lock
 . ;
 . ; Clean up old info
 . ; Allow for a study to cross one day boundary,
 . ; and remove everything that is older than a day.
 . ;
 . S RD=RDT-1 F  S RD=$O(^MAGRT(2006.5906,"D",RD),-1) Q:'RD  D
 . . N DE,RU,PA
 . . S DE="" F  S DE=$O(^MAGRT(2006.5906,"D",RD,DE)) Q:DE=""  D
 . . . S RU="" F  S RU=$O(^MAGRT(2006.5906,"D",RD,DE,RU)) Q:RU=""  D
 . . . . S PA="" F  S PA=$O(^MAGRT(2006.5906,"D",RD,DE,RU,PA)) Q:PA=""  D
 . . . . . K ^MAGRT(2006.5906,"D",RD,DE,RU,PA)
 . . . . . K ^MAGRT(2006.5906,RU,1,PA)
 . . . . . S X=^MAGRT(2006.5906,RU,1,0)
 . . . . . S $P(X,"^",4)=$P(X,"^",4)-1
 . . . . . S ^MAGRT(2006.5906,RU,1,0)=X
 . . . . . Q
 . . . . Q
 . . . Q
 . . Q
 . ;
 . D:'$D(^MAGRT(2006.5906,RULE))
 . . S X=$G(^MAGRT(2006.5906,0))
 . . S $P(X,"^",1,2)="ROUTE LOAD BALANCE^2006.5906"
 . . S:RULE>$P(X,"^",3) $P(X,"^",3)=RULE
 . . S $P(X,"^",4)=$P(X,"^",4)+1
 . . S:RULE>$P(X,"^",3) $P(X,"^",3)=RULE
 . . S ^MAGRT(2006.5906,0)=X
 . . S ^MAGRT(2006.5906,RULE,0)=RULE
 . . Q
 . ;
 . M CP=^MAGRT(2006.5906,"D",RDT)
 . S (B,DEST,L,M1,M2,MAX)=0
 . F  S DEST=$O(RULE(RULE,"ACTION",DEST)) Q:'DEST  D
 . . N I,T
 . . S B=B+1,B(B)=DEST
 . . S X=RULE(RULE,"ACTION",DEST)
 . . S M(B)=$P(X,"^",2),MAX=MAX+M(B)
 . . ; Don't exceed maximum number of studies per day days
 . . S T=0,I="" F  S I=$O(CP(DEST,I)) Q:I=""  S T=T+1
 . . I $P(X,"^",3),T'<$P(X,"^",3) S M2=M2+M(B),M(B)=-1,M1=M1+1
 . . Q
 . ; If one destination has reached its cap, redistribute...
 . D:M1
 . . N I,L,R
 . . S R=M2#M1,L=0
 . . F I=1:1:B S:M(I)>0 M(I)=M2\M1+M(I),L=I
 . . S M(L)=M(L)+R
 . . Q
 . ;
 . S X=$G(^MAGRT(2006.5906,RULE,2))
 . ; X = LAST ^ TOTAL ^ COUNT(DEST) ^ COUNT(DEST) ^ ...
 . F L=1:1:B S E(L)=+$P(X,"^",L+2)
 . S L=$P(X,"^",1) F  S L=L+1 S:L>B L=1 Q:E(L)<M(L)
 . S T=$P(X,"^",2)+1,E(L)=E(L)+1,DEST=B(L)
 . I T'<MAX S T=0 F L=1:1:B S E(L)=0
 . S X=L_"^"_T F L=1:1:B S X=X_"^"_E(L)
 . S ^MAGRT(2006.5906,RULE,2)=X
 . ;
 . ; Note: on consolidated sites 'origins' and 'destinations'
 . ; matter even more than on non-consolidated ones.
 . ; In the case of load-balancing, however, the 'destinations'
 . ; part is taken care of by the balancing parameters, and the
 . ; origin is moot, because each study has one (and only one)
 . ; origin.
 . ;
 . D:'$D(^MAGRT(2006.5906,RULE,1,PARENT))
 . . S X=$G(^MAGRT(2006.5906,RULE,1,0))
 . . S $P(X,"^",1,2)="^2006.59061"
 . . S:PARENT>$P(X,"^",3) $P(X,"^",3)=PARENT
 . . S $P(X,"^",4)=$P(X,"^",4)+1
 . . S ^MAGRT(2006.5906,RULE,1,0)=X
 . . S ^MAGRT(2006.5906,RULE,1,PARENT,0)=PARENT_"^"_RDT_"^"_DEST
 . . Q
 . L -^MAGRT(2006.5906,0)
 . Q
 S DEST=$P(^MAGRT(2006.5906,RULE,1,PARENT,0),"^",3)
 S X=$G(RULE(RULE,"ACTION",DEST))
 I X="" S METMSG(0,"No location for rule "_RULE_", alternative "_DEST)="" Q
 S X=$P(X,"^",1) Q:X="<LOCAL>"
 S DEST=0
 S D=0 F  S D=$O(RULE(RULE,"ACTION",D)) Q:'D  D  Q:DEST
 . Q:$P($G(RULE(RULE,"ACTION",D)),"^",1)'=X
 . S DEST=D
 . Q
 I 'DEST S METMSG(0,"Cannot find location """_X_""".")="" Q
 S ^MAGRT(2006.5906,"D",RDT,DEST,RULE,PARENT)=""
 ;
 ; Current version assumes that BALANCE means DOS-Copy, not DICOM...
 D VALDEST^MAGDRPC1(.DEST,X)
 D LOG^MAGBRTE4("Load-Balance Destination is "_X)
 S PRI=$$PRI^MAGBRTE4($G(RULE(RULE,"PRIORITY")),IMAGE)
 S VRS=VRS_$$SEND^MAGBRTUT(IMAGE,DEST,PRI,1,LOCATION)
 Q
 ;
KEYWORD ; build the KEYWORD array
 N C,CD,D,D0,KW,M,V,X
 S CD="CONDITION" K KEYWORD
 ; Actions
 F X="SEND","BALANCE","DICOM" S KEYWORD("ACTION",X)="-"
 F X="DESTINATION","HOLIDAY" S KEYWORD("ACTION",X)="I"
 ;
 F X="HIGH","NORMAL","LOW" S KEYWORD("PRIORITY",X)="-"
 ;
 ; Fields in ^MAG(2005,
 S M="LO^MAG^MAGBRTE3(IMAGE,"
 S KEYWORD(CD,"OBJECT NAME")=M_"0,0,1,.VAL)"
 S KEYWORD(CD,"FILE_REF")=M_"0,0,2,.VAL)"
 S KEYWORD(CD,"MAGNETIC_REF")=M_"0,0,3,.VAL)"
 S KEYWORD(CD,"ABSTRACT_REF")=M_"0,0,4,.VAL)"
 S KEYWORD(CD,"WORM_REF")=M_"0,0,5,.VAL)"
 S KEYWORD(CD,"OBJECT_TYPE")=M_"2005.02,0,6,.VAL)"
 S KEYWORD(CD,"PATIENT")=M_"2,0,7,.VAL)"
 S KEYWORD(CD,"PROCEDURE")=M_"0,0,8,.VAL)"
 S KEYWORD(CD,"MODALITY")=M_"0,0,8,.VAL)"
 S KEYWORD(CD,"SAVED_BY")=M_"200,2,2,.VAL)"
 S KEYWORD(CD,"SUMMARY_OBJECT")=M_"0,2,3,.VAL)"
 S KEYWORD(CD,"SHORT_DESCRIPTION")=M_"0,2,4,.VAL)"
 S KEYWORD(CD,"PARENT_DATA")=M_"2005.03,2,6,.VAL)"
 S KEYWORD(CD,"PARENT_GLOBAL_ROOT_D0")=M_"0,2,7,.VAL)"
 S KEYWORD(CD,"PARENT_DATA_FILE_IMAGE_POINTER")=M_"0,2,8,.VAL)"
 S KEYWORD(CD,"EXPORT_REQUEST_STATUS")=M_"0,2,9,.VAL)"
 S KEYWORD(CD,"PATH_ACCESSION_NUMBER")=M_"0,""PATH"",1,.VAL)"
 S KEYWORD(CD,"SPECIMEN_DESCRIPTION")=M_"0,""PATH"",2,.VAL)"
 S KEYWORD(CD,"SPECIMEN")=M_"0,""PATH"",3,.VAL)"
 S KEYWORD(CD,"STAIN")=M_"0,""PATH"",4,.VAL)"
 S KEYWORD(CD,"MICROSCOPIC_OBJECTIVE")=M_"0,""PATH"",5,.VAL)"
 S KEYWORD(CD,"PACS_UID")=M_"0,""PACS"",1,.VAL)"
 S KEYWORD(CD,"RADIOLOGY_REPORT")=M_"74,""PACS"",2,.VAL)"
 S KEYWORD(CD,"PACS_PROCEDURE")=M_"71,""PACS"",3,.VAL)"
 S KEYWORD(CD,"PARENT_GLOBAL_ROOT_D1")=M_"0,2,10,.VAL)"
 S KEYWORD(CD,"DESCRIPTIVE_CATEGORY")=M_"2005.81,100,1,.VAL)"
 S KEYWORD(CD,"CLINIC")=M_"44,100,2,.VAL)"
 S KEYWORD(CD,"BIG_MAGNETIC_PATH")=M_"2005.2,""FBIG"",1,.VAL)"
 S KEYWORD(CD,"BIG_JUKEBOX_PATH")=M_"2005.2,""FBIG"",2,.VAL)"
 ; Date and time fields
 S M="DT^MAG^MAGBRTE3(IMAGE,"
 S KEYWORD(CD,"IMAGE_SAVED")=M_"0,2,1,.VAL)"
 S KEYWORD(CD,"LAST_ACCESS")=M_"0,0,9,.VAL)"
 S KEYWORD(CD,"PROCEDURE_TIME")=M_"0,2,5,.VAL)"
 S KEYWORD(CD,"EXAM_TIME")=M_"0,2,5,.VAL)"
 ;
 S M="DT^DATE^MAGBRTE3(IMAGE,"
 S KEYWORD(CD,"IMAGE_SAVED_FIRST")=M_"0,2,1,1,.VAL)"
 S KEYWORD(CD,"LAST_ACCESS_FIRST")=M_"0,0,9,1,.VAL)"
 S KEYWORD(CD,"PROCEDURE_TIME_FIRST")=M_"0,2,5,1,.VAL)"
 S KEYWORD(CD,"EXAM_TIME_FIRST")=M_"0,2,5,1,.VAL)"
 S KEYWORD(CD,"STUDY_TIME")=M_"0,2,5,1,.VAL)"
 ;
 S KEYWORD(CD,"IMAGE_SAVED_LAST")=M_"0,2,1,2,.VAL)"
 S KEYWORD(CD,"LAST_ACCESS_LAST")=M_"0,0,9,2,.VAL)"
 S KEYWORD(CD,"PROCEDURE_TIME_LAST")=M_"0,2,5,2,.VAL)"
 S KEYWORD(CD,"EXAM_TIME_LAST")=M_"0,2,5,2,.VAL)"
 ;
 ; Built-in Fields
 S KEYWORD(CD,"SOURCE")="SH^SOURCE^MAGBRTE3(IMAGE,.VAL)"
 S KEYWORD(CD,"URGENCY")="SH^URGENCY^MAGBRTE3(IMAGE,.VAL)"
 S KEYWORD(CD,"NOW")="DT^NOW^MAGBRTE3(.VAL)"
 Q
 ;
VARNAME(F) ;
 S F=$TR(F," !""#$%&'()*+,-./:;<=>?@[\]^_`{|}~","_________________________________")
 F  Q:F'["__"  S F=$P(F,"__",1)_"_"_$P(F,"__",2,$L(F)+2)
 F  Q:$E(F,1)'="_"  S F=$E(F,2,$L(F))
 F  Q:$E(F,$L(F))'="_"  S F=$E(F,1,$L(F)-1)
 S F=$TR(F,"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")
 Q F
