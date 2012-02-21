XUSRB4 ;ISF/RWF - Build a temporary sign-on token ;08/08/2005  09:44
 ;;8.0;KERNEL;**150,337,395**;Jul 10, 1995;Build 4
 Q
 ;
ASH(RET) ;rpc. Auto Signon Handle
 N HDL
 S HDL=$$HANDLE("XWBAS",1),RET="~1"_HDL
 S ^XTMP(HDL,"STATUS")="0^New",^("CNT")=0
 ;Now place user info in it.
 S ^XTMP(HDL,"D",0)=$$TOK(HDL)
 Q
 ;
CCOW(RET) ;rpc. CCOW Auto Signon Handle
 N HDL,HDL2
 S RET(0)="NO PROXY USER",RET(1)="ERROR"
 I $$USERTYPE^XUSAP(DUZ,"APPLICATION PROXY") Q  ;No Proxy
 I $$USERTYPE^XUSAP(DUZ,"CONNECTOR PROXY") Q  ;No Proxy
 S X=$$ACTIVE^XUSER(DUZ) I 'X S RET(0)=X Q  ;User must be active
 S HDL=$$HANDLE("XWBCCW",1)
 S ^XTMP(HDL,"STATUS")="0^New",^("CNT")=0
 S RET(0)="~2"_$$LOW^XLFSTR(HDL),RET(1)=$G(^XMB("NETNAME"))
 ;Now place user info in it.
 S ^XTMP(HDL,"D",0)=$$TOK(HDL)
 S ^XUTL("XQ",$J,"HDL")=HDL ;Save handle with job
 Q
 ;
HANDLE(NS,LT) ;Return a unique handle into ^XTMP (ef. sup)
 ;NS is the namespace, LT is the Handle Lifetime in days
 N %H,A,J,HL
 I $G(NS)="" Q "" ;Return null if no namespace
 S LT=$G(LT,1) S:LT>7 LT=7 ;Default to 1
 S %H=$H,J=NS_($J#2048)_"-"_(%H#7*86400+$P(%H,",",2))_"_",A=-1
HAN2 S A=A+1,HL=J_A L +^XTMP(HL):0 I '$T G HAN2
 I $D(^XTMP(HL)) L -^XTMP(HL) G HAN2
 S ^XTMP(HL,0)=$$HTFM^XLFDT(%H+LT)_"^"_$$DT^XLFDT()
 L -^XTMP(HL)
 Q HL
 ;
TOK(H) ;Return a Token
 ;H is handle into XTMP
 N J,T,R
 S T=$$H3^%ZTM($H)
 S R=$J_"|"_T_"|"_$G(DUZ)_"|"_H
 S ^XTMP(H,"D2")=$G(DUZ(2))
 S ^XTMP(H,"D3")=$G(IO("IP"))
 S ^XTMP(H,"JOB",$J)=$G(IO("IP"))
 ;need to save token
 Q "|"_$$ENCRYP^XUSRB1(R)_"|"
 ;
CHKASH(HL) ;rpc. Check a Auto Signon Handle
 N HDL,RET S HDL=$E(HL,3,999)
 S RET=$$CHECK(HDL)
 K ^XTMP(HDL) ;Token only good for one try.
 Q RET
 ;
CHKCCOW(HL) ;rpc. Check a CCOW Auto Signon Handle
 N HDL,RET,T
 S HDL=$$UP^XLFSTR($E(HL,3,999)),T=$P($G(^XTV(8989.3,1,30),5400),U)
 S RET=$$CHECK(HDL,T)
 I RET>0 D
 . ;This CCOW Token good for more that one try.
 . S ^XTMP(HDL,"JOB",$J)=$G(IO("IP"))
 . S ^XTMP(HDL,"STATUS")=(^XTMP(HDL,"STATUS")+1)_"^Active"
 . S ^XUTL("XQ",$J,"HDL")=HDL ;Save handle with job
 . S DUZ("CCOW")=1 ;Flag a CCOW sign-on.
 Q RET
 ;
CHECK(HL,TOUT) ;Check a Token
 N %,J,D,L,M,S
 S S=$G(^XTMP(HL,0)) I '$L(S) Q "0^Bad Handle"
 S S=$G(^XTMP(HL,"D",0)) I '$L(S) Q "0^Bad Handle" ;Now have real token
 I $E(S)'="|" Q "0^Bad Token"
 S S=$$DECRYP^XUSRB1($E(S,2,$L(S)-1)) I S="" Q "0^Bad Token"
 S J=$P(S,"|"),T=$P(S,"|",2),D=$P(S,"|",3),M=$P(S,"|",4)
 ;Check token time
 S %=$$H3^%ZTM($H),TOUT=$G(TOUT,20)
 I T+TOUT<% Q "0^Token Expired" ;Token good for TOUT or 20 seconds
 ;Check job
 ;Check that token has handle
 I M'=HL Q "0^Bad Token"
 ;Check User
 I $G(^VA(200,D,0))="" Q "0^Bad User"
 ;Do IP check
 I $L($G(^XTMP(HL,"D3"))),^XTMP(HL,"D3")'=$G(IO("IP")) Q "0^Different IP"
 I $D(^XTMP(HL,"D2")),D>0 S DUZ(2)=^XTMP(HL,"D2")
 D USER^XUS(D)
 Q D
 ;
 ;
CCOWPC(RET) ;Return ap
 N I,XU4
 S RET(0)="" I '$$BROKER^XWBLIB Q
 D GETLST^XPAR(.XU4,"SYS","XUS CCOW VAULT PARAM","Q")
 F I=0,1 S RET(I)=$P($G(XU4(I+1)),"^",2,99)
 Q
