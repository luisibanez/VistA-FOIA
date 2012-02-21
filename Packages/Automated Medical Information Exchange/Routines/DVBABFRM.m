DVBABFRM ;ALB/SPH - CAPRI TEMPLATE/WORKSHEETS UTILITIES ;11/17/02
 ;;2.7;AMIE;**53,57,90**;Apr 10, 1995
 ;
DEFINE(Y,DVBIEN,DVBTYPE) ;
 ; DVBTYPE:  1= Form Definition, 2=Script, 3=Report
 N DVBJ K ^TMP($J,"AMIE")
 S DVBJ=0,DVBTYPE=DVBTYPE+2,Y=$NA(^TMP($J,"AMIE"))
 F  S DVBJ=$O(^DVB(396.18,DVBIEN,DVBTYPE,DVBJ)) Q:'DVBJ  D
 .S ^TMP($J,"AMIE",DVBJ)=$G(^DVB(396.18,DVBIEN,DVBTYPE,DVBJ,0))_$C(13)
 Q
UPDATE(Y,DVBIEN,DVBTYPE,DVBLINES,DVBLINEC,DVBLINEB) ;
 ; DVBTYPE:  1= Form Definition, 2=Script, 3=Report
 N DVBNUM,DVBCOUNT
 I DVBTYPE=1,DVBLINEB=0 D
 .K ^DVB(396.18,DVBIEN,3)
 .S ^DVB(396.18,DVBIEN,3,0)=DVBLINES(1)
 S DVBNUM=DVBLINEB,DVBCOUNT=1,DVBTYPE=DVBTYPE+2
 I DVBLINEB=0 S DVBCOUNT=2
 I DVBNUM>0 S DVBNUM=DVBNUM-1
 F  S DVBNUM=DVBNUM+1 Q:DVBNUM=(DVBLINEC+DVBLINEB)  D
 .S ^DVB(396.18,DVBIEN,DVBTYPE,DVBNUM,0)=DVBLINES(DVBCOUNT),DVBCOUNT=DVBCOUNT+1
 Q
SAVE(Y,DVBIEN,DVBLINES,DVBLINEC,DVBLINEB,DVBTPSV) ;
 ; DVBTPSV:  3/NULL=NORMAL GLOBAL
 N DVBNUM,DVBCOUNT
 S DVBTPSV=$G(DVBTPSV,3),DVBNUM=DVBLINEB,DVBCOUNT=1
 I DVBLINEB=0 D
 .K ^DVB(396.17,DVBIEN,DVBTPSV)
 .S ^DVB(396.17,DVBIEN,DVBTPSV,0)=DVBLINES(1),DVBCOUNT=2
 I DVBNUM>0 S DVBNUM=DVBNUM-1
 F  S DVBNUM=DVBNUM+1 Q:DVBNUM=(DVBLINEC+DVBLINEB)  D
 .S ^DVB(396.17,DVBIEN,DVBTPSV,DVBNUM,0)=DVBLINES(DVBCOUNT),DVBCOUNT=DVBCOUNT+1
 ; SET Y TO NUMBER OF LINES IN THE GLOBAL FOR GUI VERIFICATION
 S Y=+$P($G(^DVB(396.17,DVBIEN,DVBTPSV,0)),U,3)
 Q
LOAD(Y,DVBIEN,DVBTPSV) ;
 ; DVBTPSV:  3/NULL=NORMAL GLOBAL
 N DVBABCNT,DVBABIEN K ^TMP("DVBAFRML",DUZ)
 S DVBTPSV=$G(DVBTPSV,3),DVBABCNT=1,DVBABIEN=0,Y=$NA(^TMP("DVBAFRML",DUZ))
 F  S DVBABIEN=$O(^DVB(396.17,DVBIEN,DVBTPSV,DVBABIEN)) Q:'DVBABIEN  D
 .S ^TMP("DVBAFRML",DUZ,DVBABCNT-1)=$G(^DVB(396.17,DVBIEN,DVBTPSV,DVBABCNT,0))_$C(13),DVBABCNT=DVBABCNT+1
 Q
CCOW(Y,F) ;RPC DVBAB CCOW
 S Y=-1
 S:F=1 Y=$$SITE^VASITE
 S:F=2 Y=$$PROD^XUPROD
 Q
U1N4(Y,ARR) ;RPC DVBAB FETCH 1U4N
 N I,X S I="",Y=$NA(^TMP("DVBU1N4",$J)) K @Y
 F  S I=$O(ARR(I)) Q:I=""  D
 .S X=$P($G(^DVB(396.17,ARR(I),0)),U)
 .S:X X=$$GET1^DIQ(2,X_",",.0905)
 .S ^TMP("DVBU1N4",$J,I)=ARR(I)_U_$S(X]"":X,1:"?????")
 Q
DELETE(Y,IEN) ;RPC DVBAB FORM DATA BACKUP DELETE
 S IEN=$G(IEN),Y=$S(IEN?1.N:0,1:"1^INVALID ARGUMENT")
 I 'Y,'$D(^DVB(396.17,IEN,0)) S Y="1^RECORD NOT FOUND"
 K:'Y&$D(^DVB(396.17,IEN,9)) ^DVB(396.17,IEN,9)
 Q
BACKUP(Y,IEN,TXT) ;RPC DVBAB FORM DATA BACKUP
 N F,S,A,N,M,R S F=396.17,M="-1^RECORD NOT FOUND",IEN=$G(IEN)_","
 S R="^DVB("_F_","_IEN,Y=$S(IEN?1.N1",":0,1:"-1^INVALID ARGUMENT")
 I 'Y,'$D(@(R_"0)")) S Y=M
 Q:Y  S M=$P($G(@(R_"3,0)")),U,3) Q:'M
 S S=396.19,N="+1,"_IEN,TXT=$G(TXT)
 S A(S,N,.01)=$$NOW^XLFDT
 S A(S,N,2)=$S(TXT]"":TXT,1:"Automatic Save by "_$P($G(^VA(200,DUZ,0)),U))
 D UPDATE^DIE(,"A"),ERR(.Y)
 I 'Y D
 .S N=$P($G(@(R_"9,0)")),U,3)_","_IEN
 .D WP^DIE(S,N,1,"A",R_"3)"),ERR(.Y)
 .D:'Y WP^DIE(S,N,3,"A",R_"1)"),ERR(.Y)
 S:'Y Y=M
 Q
RESTORE(Y,IEN,SN) ;RPC DVBAB FORM DATA BACKUP RESTORE
 N Z,F,T,M,N,R S IEN=$G(IEN)_",",SN=$G(SN),N=396.17,R="^DVB("_N_","_IEN
 S Y=$S(IEN?1.N1","&(SN?1.N):0,1:"-1^INVALID ARGUMENT")
 S M="-1^RECORD NOT FOUND",SN=R_"9,"_SN_",",F="RESTORE "
 I 'Y,'$D(@(R_"0)")) S Y=M
 I 'Y,'$D(@(R_"9,0)")) S $P(M,U,2)="SUB-"_$P(M,U,2),Y=M
 I 'Y,'$D(@(SN_"0)")) S $P(M,U,2)=F_$P(M,U,2),Y=M
 Q:Y  S M=$P($G(@(SN_"1,0)")),U,3),F=F_"FAILED: " Q:'M
 M Z=@(R_"3)") K @(R_"3)")
 D WP^DIE(N,IEN,8,"A",SN_"1)"),ERR(.Y)
 I Y  K @(R_"3)") M @(R_"3)")=Z S $P(Y,U,2)=F_$P(Y,U,2) Q
 M T=@(R_"1)") K @(R_"1)")
 D WP^DIE(N,IEN,6,"A",SN_"3)"),ERR(.Y) I 'Y S Y=M Q
 K @(R_"3)"),@(R_"1)") M @(R_"3)")=Z,@(R_"1)")=T S $P(Y,U,2)=F_$P(Y,U,2)
 Q
COPY(Y,DA,DFN) ;RPC DVBAB FORM COPY
 N F,A,P,N,M,R S DA=$G(DA)_",",F=396.17,R="^DVB("_F_","_DA
 S N=" NOT FOUND",M="-1^RECORD"_N,DFN=$G(DFN,$P($G(@(R_"0)")),U))
 S Y=$S(DA?1.N1",":0,1:"-1^INVALID ARGUMENT")
 I 'Y,'$D(@(R_"0)")) S Y=M
 I 'Y,'$D(^DPT(DFN,0)) S Y="-1^PATIENT"_N
 S:'Y Y=$$AF(R) Q:Y
 S P="+1,",A(F,P,.01)=DFN,A(F,P,2)=DUZ,A(F,P,11)="D"
 S N=$$NOW^XLFDT,A(F,P,3)=N,A(F,P,4)=N
 S A(F,P,9)=$P($G(@(R_"4)")),U),A(F,P,5)=2800101
 D UPDATE^DIE(,"A"),ERR(.Y)
 S DA=$P(@($P(R,",")_",0)"),U,3)
 D:'Y WP^DIE(F,DA_",",6,"A",R_"1)"),ERR(.Y),DEL(Y,DA,F)
 D:'Y WP^DIE(F,DA_",",8,"A",R_"3)"),ERR(.Y),DEL(Y,DA,F)
 S:'Y Y=DA
 Q
DEL(Y,DA,F,DIK) Q:'Y  S DIK=$G(DIK,^DIC(F,0,"GL")) D ^DIK Q
AF(R) N C,I,J,K,L,N,X,Z S (I,C)=0,R=R_"1,",L=""
 F  S I=$O(@(R_I_")")) Q:'I  D
 .S K=$G(@(R_I_",0)")),N=$P(K,U,2),(Z,J)=0,K=+K
 .S:K J=$G(^DVB(396.18,K,2)),X=$P(J,U,2),Z=DT<+J!(X'>DT&X)
 .I Z!'K!'J S C=C+1  S:C>1 L=L_"; " S L=L_$S(N]"":N,1:$G(^DVB(396.18,K,0)))
 Q:'C 0
 Q "-1^Can't copy because th"_$S(C=1:"is form is",1:"ese forms are")_"n't active: "_L
ERR(M) N D,I,K,X  S M=0,D="DIERR" Q:'$D(^TMP(D,$J))
 S M=$O(^TMP(D,$J,"E","")),I=$O(^(M,"")),X=","
 F K=0:1 S K=$O(^TMP(D,$J,I,"TEXT",K)) Q:'K  S X=X_" "_^(K)
 S M="-1^Error "_M_X K ^TMP(D,$J)
 Q
