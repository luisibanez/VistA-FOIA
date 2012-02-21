XUMF5I ;ISS/PAVEL - XUMF5 MD5 Hash Entry point ;06/17/05
 ;;8.0;KERNEL;**383**;July 10, 1995
 ;
 ;MD5 based on info from 4.005 SORT BY VUID
 ;
 Q
EN(X0,MODE,IENCOUNT)  ;entry point to get MD5 algorithm
 ; Lookup uses AMASTERVUID for files and B x-ref for subfiles....
 ;
 ; X0 = IEN or name of entry from 4.005 file
 ; MODE = 0 regular mode.. last HASH value returned in Apl. ACK.
 ;        1 debugging mode.. all values + hash codess returned in Apl ACK
 ;        1.1 debugging mode.. all values (no hash codes) returned in Apl ACK
 ;        2 debugging mode.. all fields values, all hash values, all hash codes returned in Apl. ACK.
 ; IENCOUNT  = maximum entries for MD5 hash.. if NULL.. all entries counted...        
 ;
 K ^TMP("PROOT",$J) ;ROOT of file in the case of pointer...
 N X,Y,X1,X2,X3,X20,X201,X1NEW,X2NEW,X2OLD,X0NAME,XP,H,CNT,CNTT,CNHT,XMD5,XDATE
 N DIC,ERR,ROOT,ROOTB,ROOTB0,POINTER,JUMP,START,TMP,TMP1,TMP2,FDA,VERSION
 N SLEV,LEV,IENS,VAL,VALUE,SORT,SORT1,EXITMD5
 N A,B,C,D,ABCD
 ; TMP(sequence, def entry IEN, file/subfile #, field #)=""
 ; TMP1(,"1,120.82,2,",2)="INTERNAL"
 ; TMP2(FILE #,FIELD #)=""  if internal value requested...
 S DIC=4.005,X=$S(X0:"`",1:"")_X0,DIC(0)="Z",U="^" D ^DIC
 I Y=-1 S ERROR="1^Unknown entry of 4.005 File: "_X0 Q "Unknown entry of 4.005 File"
 S X0=+Y,X0NAME=$P(Y(0),U) S:'$G(MODE) MODE=+$P(Y(0),U,2) K TMP M TMP=@($$ROOT^DILFD(4.005,,0)_"""AC"",X0)")
 D GETS^DIQ(4.005,X0_",","**","","TMP1")
 S A="" F  S A=$O(TMP1(4.00511,A)) Q:'$L(A)  S:TMP1(4.00511,A,2)="INTERNAL" TMP2($P(A,",",2),$P(A,",",1))=""
 ;MODE set from input parameter or from file.
 S A=$C(1,35,69,103)
 S B=$C(137,171,205,239)
 S C=$C(254,220,186,152)
 S D=$C(118,84,50,16)
 S ABCD=A_B_C_D
 S (CNT,CNTT,CNHT)=0
 S VALUE=""
 ;X1 = SEQUENCE
 ;X2 = FILE/SUBFILE #
 ;X3 = Field #
 ;TMP = SEQUENCE OF ENTRIES TO BE PROCEEDED....
 ;TMP1 = FILE # ALL ENTRIES
 S START=1,X1=0,LEV=0,X2OLD=0,XMD5=$O(^TMP("XUMF ERROR",$J,9999999999999),-1)+1,EXITMD5=0
2 F  S X1=$O(TMP(X1)) Q:'X1&'$$NEXTB1(LEV)!EXITMD5  S:'X1 X1=SLEV(LEV),X2OLD=0  S X2=$O(TMP(X1,X0,0)) Q:'X2  D
 .S (XP,JUMP)=0
 .;************ File/subfile has changed ************
 .D:X2'=X2OLD
 ..;
 ..;************ File Level & Start ************
 ..I $D(^DIC(X2)),START D  Q
 ...S START=0,SLEV(1)=X1,X2OLD(1)=X2
 ...K ROOT,ROOTB,ROOTB0,X02,X021,TMP1
 ...S LEV=1,IENS=""
 ...D GETONE(LEV,X2)
 ..;
 ..;************ Going Up ************
 ..I $G(^DD(X2OLD,0,"UP"))=X2 D  Q
 ...I $$NEXTB(LEV,X2OLD) S JUMP=2 Q
 ...K ROOT(LEV),ROOTB(LEV),ROOTB0(LEV),X20(LEV),X201(LEV),TMP1(LEV),X2OLD(LEV)
 ...S LEV=LEV-1,IENS=$P(IENS,",",$L(IENS,",")-LEV,9999),X2=X2OLD(LEV)
 ..Q:JUMP
 ..;
 ..;************ Going DOWN ************
 ..I $G(^DD(X2,0,"UP"))=X2OLD D  Q
 ...S LEV=LEV+1,SLEV(LEV)=X1,X2OLD(LEV)=X2
 ...D GETONE(LEV,X2)
 ..;
 ..;************ Same Level other multiple... ************
 ..I $G(^DD(X2,0,"UP"))=$G(^DD(X2OLD,0,"UP")),+$G(^DD(X2OLD,0,"UP")),+$G(^DD(X2,0,"UP")) D  Q
 ...I $$NEXTB(LEV,X2OLD) S JUMP=2 Q
 ...K ROOT(LEV),ROOTB(LEV),ROOTB0(LEV),X20(LEV),X201(LEV),TMP1(LEV),X2OLD(LEV)
 ...S IENS=$P(IENS,",",$L(IENS,",")-LEV+1,9999) ;B:'$L(IENS)
 ...S SLEV(LEV)=X1
 ...S X2OLD(LEV)=X2
 ...;S X2=X2OLD
 ...D GETONE(LEV,X2)
 ..Q:JUMP
 ..;
 ..;************ New File not start... ************
 ..I $D(^DIC(X2)) D  Q
 ...S:'$D(X2NEW) X2NEW=X2,X1NEW=X1
 ...I $$NEXTB(LEV,X2OLD(LEV)) S JUMP=2 Q
 ...K ROOT(LEV),ROOTB(LEV),ROOTB0(LEV),X20(LEV),X201(LEV),TMP1(LEV),SLEV(LEV),X2OLD(LEV)
 ...S IENS=$P(IENS,",",$L(IENS,",")-LEV+1,9999) ;B:'$L(IENS)
 ...I LEV=1 S (X1,SLEV(1))=X1NEW,(X2,X2OLD(1))=X2NEW K X1NEW,X2NEW D GETONE(LEV,X2) Q  ;;;;;;;;GET TO THE BOTTOM LEVEL = 1 NOT ANY OTHRER'S B X-REF
 ...S LEV=LEV-1,X1=SLEV(LEV)-1,X2=+$G(X2OLD(LEV-1)),XP=1
 ..;
 ..;************ Last sequence number ************
 ..I X2OLD=0 D  Q
21 ...I $$NEXTB(LEV,X2) S JUMP=2 Q
 ...K ROOT(LEV),ROOTB(LEV),ROOTB0(LEV),X20(LEV),X201(LEV),TMP1(LEV),X2OLD(LEV)
 ...Q:LEV=1
 ...S LEV=LEV-1,IENS=$P(IENS,",",$L(IENS,",")-LEV,9999),X2=X2OLD(LEV) ;,X1=SLEV(LEV)-1,XP=1
 ...G 21
 ..Q
 ..;
 .S X2OLD=X2
 .Q:JUMP
 .;************ Get value & MD5 ************
 .S X3=$O(TMP(X1+XP,X0,X2,0)) Q:'X3
 .S VAL=$S($L(IENS):$$UP($G(TMP1(LEV,X2,IENS,X3))),1:"") D:$L(VAL)
 ..N X,TMP,I
 ..I X3=99.99,$D(^DIC(X2)) S CNTT=CNTT+1 I $G(IENCOUNT),CNTT>IENCOUNT S EXITMD5=1,CNTT=CNTT-1 Q
 ..D:MODE>1.99 SETACK("File #: "_X2_" Field #: "_X3_" Value: "_VAL_" IENS: "_IENS)
 ..S CNT=$G(CNT)+1
 ..S VALUE=VALUE_VAL
 ..Q:$L(VALUE)<65
 ..S X=$E(VALUE,65,$L(VALUE)),VALUE=$E(VALUE,1,64)
 ..D:MODE
 ...D SETACK($S(MODE=1.1:"",1:"Value: ")_VALUE)
 ...D:MODE'=1.1 SETACK("HASH:  "_$$MAIN^XUMF5BYT($$HEX^XUMF5AU($$MD5E^XUMF5AU(ABCD,VALUE,0,CNHT+1*64))))
 ..S ABCD=$$MD5E^XUMF5AU(ABCD,VALUE,1)
 ..S VALUE=X,CNHT=CNHT+1
 .Q
 ;************ So get the final ABCD value... ************
 S ABCD=$$MD5E^XUMF5AU(ABCD,VALUE,0,CNHT*64+$L(VALUE))
 D:MODE
 .W ! D SETACK($S(MODE=1.1:"",1:"Last value: ")_VALUE)
 .D SETACK("LAST HASH:  "_$$MAIN^XUMF5BYT($$HEX^XUMF5AU(ABCD))) W !
 .D SETACK("Total number of Characters included in Hash : "_(CNHT*64+$L(VALUE)))
 .D SETACK("Length of last value: "_$L(VALUE))
 .D SETACK("Number of file entries: "_CNTT)
 .D SETACK("Number of hash entries: "_(CNHT+1))
 .D SETACK("Number of values: "_CNT)
 .W !
 ;************ Hex conversion + storage of the final ABCD value ************
 S VALUE=$$MAIN^XUMF5BYT($$HEX^XUMF5AU(ABCD))
 K FDA
 S FDA(4.005,X0_",",4)=$$NOW^XLFDT
 S FDA(4.005,X0_",",5)=VALUE
 K ERR D FILE^DIE(,"FDA","ERR")
 I $D(ERR) D
 .S ERROR="1^MD5 Date updating error"
 .D EM^XUMFX("file DIE call error message in RDT",.ERR)
 .K ERR
 D SETACK("MD5 Signature Entry: "_X0NAME)
 D SETACK("Local Hash value: "_VALUE)
 S ERROR=$G(ERROR)
 S X1=$O(@($$ROOT^DILFD(4.009,,0,"ERR")_"0)"))_","
 D GETS^DIQ(4.009,X1,"*",,"TMP3") S VERSION=$G(TMP3(4.009,X1,1))
 S $P(ERROR,U,2)=$P(ERROR,U,2)_";CHECKSUM:"_VALUE_";VERSION:"_VERSION_";"
 D SETACK("ERROR variable: "_ERROR)
 K ^TMP("PROOT",$J)
 Q VALUE
 Q
GETONE(LEV,X2)     ;GET DATA
 S ROOT(LEV)=$$ROOT^DILFD(X2,"1,"_IENS,,"ERR")
 Q:'$L(ROOT(LEV))
 I $D(ERR) D  Q
 .S ERROR="1^MD5 ROOT retrieval error, File/Subfile #: "_X2_" IENS: 1,"_IENS,EXITMD5=1,JUMP=2
 .D EM^XUMFX("file DIE call error message in RDT",.ERR)
 .K ERR
 S SORT1="",SORT="B" S:$D(^DIC(X2)) SORT="AMASTERVUID",SORT1="1,"
 S ROOTB(LEV)=ROOT(LEV)_""""_SORT_""",X20(LEV))"
 S X20(LEV)="",ROOTB0(LEV)=ROOT(LEV)_""""_SORT_""",X20(LEV),"_SORT1_"X201(LEV))"
 S:SORT="B" POINTER=$$POINTER(X2) ;Pointer = pointer to file #
 I SORT="B",+POINTER D  ;Handle poiter type of subfile...
 .N BB S POINTER=$E(POINTER,2,$L(POINTER))
 .; ^TMP("PROOT",$J,Subfile #,IEN from up level,"Name sorted",IEN level)=""
 .; ^TMP("PROOT",$J,Subfile #,IEN from up level,X20(LEV),X201(LEV))=""
 .K ^TMP("PROOT",$J,X2)
 .F  S X20(LEV)=$O(@(ROOTB(LEV))) Q:'$L(X20(LEV))  S X201(LEV)=0 F  S X201(LEV)=$O(@(ROOTB0(LEV)))  Q:'X201(LEV)  D
 ..S BB=POINTER_X20(LEV)_",0)",BB=$P(@(BB),U) S:$L(BB) ^TMP("PROOT",$J,X2,BB,X201(LEV))=""
 .S ROOTB(LEV)="^TMP(""PROOT"",$J,"_X2_",X20(LEV))"
 .S ROOTB0(LEV)="^TMP(""PROOT"",$J,"_X2_",X20(LEV),X201(LEV))"
 I SORT="B",LEV=2,X2=+$P(^DD(X2OLD(1),99.991,0),U,2) D  ;Handle Effective Date/Status multiple... only last date taken to HASH... TERMSTATUS
 .K ^TMP("PROOT",$J,X2)
 .S X20(LEV)=$O(@(ROOTB(LEV)),-1) ;Get last date..
 .Q:'$L(X20(LEV))  ;No Data in Effective Date Multiple.
 .S X201(LEV)=0,X201(LEV)=+$O(@ROOTB0(LEV))
 .Q:'X201(LEV)
 .S ROOTB(LEV)="^TMP(""PROOT"",$J,"_X2_",X20(LEV))"
 .S ROOTB0(LEV)="^TMP(""PROOT"",$J,"_X2_",X20(LEV),X201(LEV))"
 .S ^TMP("PROOT",$J,X2,X20(LEV),X201(LEV))=""
 S X20(LEV)=""
GET1 S X20(LEV)=$O(@(ROOTB(LEV))) Q:'$L(X20(LEV))  S X201(LEV)=0,X201(LEV)=$O(@(ROOTB0(LEV)))
 I $D(^DIC(X2)),'$$ACTIVE(X2,X201(LEV)_","_IENS) G GET1 ;If not active entry.. skip it..
 S IENS=X201(LEV)_","_IENS
 Q:'X201(LEV)
 D GETSIE(X2,IENS,LEV)
 Q
NEXTB(LEV,X2X)      ;Get next IEN from xref on current level.. if exist
 ;Is there other entry at current level to be proceeded..  ?? get next "B" x-ref set old X2 = NEW X2 and go to loop
 Q:'$D(X20(LEV)) 0
N1 Q:'$L(X20(LEV)) 0
 Q:'($O(@(ROOTB0(LEV)))!$L($O(@(ROOTB(LEV))))) 0
 S:X201(LEV) X201(LEV)=$O(@(ROOTB0(LEV))) ;Try get new IEN fron B-xref
 I 'X201(LEV) S X20(LEV)=$O(@(ROOTB(LEV))),X201(LEV)=0 S:$L(X20(LEV)) X201(LEV)=$O(@(ROOTB0(LEV)))
 Q:'X201(LEV) 0
 I $D(^DIC(X2X)),'$$ACTIVE(X2X,X201(LEV)_","_$P(IENS,",",2,99)) G N1 ;If not active entry.. skip it..
 S $P(IENS,",",1)=X201(LEV)
 S X2=X2X
 D GETSIE(X2,IENS,LEV)
 S X1=SLEV(LEV)-1,XP=1
 Q 1
NEXTB1(LEV)     ;See if some other entries in x-ref at any level exist...  no variable is set.
3 ;
 Q:LEV=0 0
 I LEV>1,'$L($G(X20(LEV))) G 4
 I LEV=1,'$L($G(X20(LEV))) Q 0
 I LEV=1,'($O(@(ROOTB0(LEV)))!$L($O(@(ROOTB(LEV))))) Q 0
 I X201(LEV),$O(@(ROOTB0(LEV))) Q 1
 Q:$L($O(@(ROOTB(LEV)))) 1 ;
 Q:LEV=1 0
4 S LEV=LEV-1 G 3
 Q
POINTER(X2)     ;GET THE POINTER FILE # IF POITER TYPE OF .01 FIELD
 N FTYPE,TT,I
 D FIELD^DID(X2,.01,,"POINTER","TT")
 Q:'$L(TT("POINTER")) 0
 S TT="1^"_TT("POINTER")
 Q TT
SETACK(X,MODE)      ;SET APPL. Acknowledgment + WRIGHT ?? 
 W X,!
 S:$G(MODE) ^TMP("XUMF ERROR",$J,XMD5,$O(^TMP("XUMF ERROR",$J,XMD5,9999999999999),-1)+1)=X
 Q
UP(X) ;Upercase conversion    
 Q $TR(X,"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")
ACTIVE(FILE,IEN)        ;GET 1 = Active 0 = Inactive
 N TMP,BB,X,X1,X2,XT,XX
 D GETS^DIQ(FILE,IEN,"99.991*","I","TMP","ERR")
 S (XT,XX)=0,X="TMP"
 F  S X=$Q(@(X)) Q:'$L(X)  S X1=$G(@(X)),X=$Q(@(X)),X2=$G(@(X)) S:X1>XT XT=X1,XX=+X2
 Q XX
GETSIE(X2,IENS,LEV)     ;GET Internal/External values
 K TMP1(LEV) D GETS^DIQ(X2,IENS,"*","","TMP1(LEV)")
 D:$D(TMP2(X2))
 .N TMP3,I
 .D GETS^DIQ(X2,IENS,"*","I","TMP3")
 .S I="" F  S I=$O(TMP2(X2,I)) Q:'I  S:$D(TMP1(LEV,X2,IENS,I)) TMP1(LEV,X2,IENS,I)=TMP3(X2,IENS,I,"I")
 Q
