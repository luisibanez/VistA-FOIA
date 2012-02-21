BPSOS2B ;BHAM ISC/FCS/DRS/DLF - BPSOS2 continuation ;06/01/2004 
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 Q
COM70 N X2,X3 S X3=7,X2=0 G COM
COM60 N X2,X3 S X3=6,X2=0 ; and fall through to COM
COM ; input X, output formatted X, copied from COMMA^%DTC with NEWs added
 ; X2=# decimal digits opt. followed by "$", X3=len of desired output
 ; and falls through into L1
 N %,%D,%L
 I $D(X3) S X3=X3+1 ; make room for the trailing space we'll get rid of
 S %D=X<0 S:%D X=-X S %=$S($D(X2):+X2,1:2),X=$J(X,1,%),%=$L(X)-3-$E(23456789,%),%L=$S($D(X3):X3,1:12)
 F %=%:-3 Q:$E(X,%)=""  S X=$E(X,1,%)_","_$E(X,%+1,99)
 S:$D(X2) X=$E("$",X2["$")_X S X=$J($E("(",%D)_X_$E(" )",%D+1),%L)
 I $E(X,$L(X))=" " S X=$E(X,1,$L(X)-1)
L1 ; given R=row,C=col,X=string
 ; Duplicate of L1^BPSOS2C
 D SET^VALM10(R,$$SETSTR^VALM1(X,$G(@VALMAR@(R,0)),C,$L(X)))
 I $$VISIBLE(R) D WRITE^VALM10(R)
 Q
VISIBLE(R) ;EP -
 I $G(NODISPLY) Q 0
 I '$G(VALMBG) Q 0
 I R<VALMBG Q 0
 I R>(VALMBG+(18-3)) Q 0
 Q 1
VALUES ;EP - from BPSOS2 
 ; note!  This must correspond with the LABELS code in BPSOS2C
 N R,R1,R2,C,X,X2,X3
 N TIME S TIME=CURR("COMM","$$H")-CURR("COMM",2) I 'TIME S TIME=1
 S R1=1,CDIV=3
 G VA101
VA001 S R=R1 ;
 S R=R+1 ;
 S R=R+1 ;
 I $D(CHG("COMM",402)) D
 .S C=9,X=CHG("COMM",402),X2=0,X3=7 D COM
 I $D(CHG("COMM","$$H"))&$D(CHG("COMM",402)) D
 .S C=18,X=CURR("COMM",402)/TIME*60,X2=1,X3=6 D COM
 I $D(CHG("COMM",403)) D
 .S C=27,X=CHG("COMM",403),X2=0,X3=11 D COM
 I $D(CHG("COMM","$$H"))&$D(CHG("COMM",403)) D
 .S C=41,X=CURR("COMM",403)/TIME*60,X2=0,X3=7 D COM
VA005 S R=R+1 ;
 I $D(CHG("COMM",404)) D
 .S C=9,X=$G(CHG("COMM",404)),X2=0,X3=7 D COM
 I $D(CHG("COMM",404))&$G(CHG("COMM","$$H")) D
 .S C=18,X=CURR("COMM",404)/TIME*60,X2=1,X3=6 D COM
 I $D(CHG("COMM",405)) D
 .S C=27,X=CHG("COMM",405),X2=0,X3=11 D COM
 I $D(CHG("COMM",405))&$D(CHG("COMM","$$H")) D
 .S C=41,X=CURR("COMM",405)/TIME*60,X2=0,X3=7 D COM
 S R=R+1 ;,C=3,X="Total claims" D L1 S C=26,X="Average per min" D L1
 I $D(CHG("COMM",200)) D
 .S C=16,X=CHG("COMM",200),X2=0,X3=7 D COM
 I $D(CHG("COMM",200))&$D(CHG("COMM","$$H")) D
 .S C=41,X=CURR("COMM",200)/TIME*60,X2=1,X3=6 D COM
 S R=R+1 ;,C=3,X="Average claims per packet" D L1
 I $D(CHG("COMM",200))&$D(CHG("COMM",402)) D
 .S C=34
 .I CURR("COMM",402) S X=CURR("COMM",200)/CURR("COMM",402)
 .E  S X=0
 .S X2=2,X3=5 D COM
 S R=R+1 ;,C=3,X="Average seconds per transaction" D L1
 I $D(CHG("COMM",501))!$D(CHG("COMM",404)) D
 .; Just let Receive packets = transaction count
 .S C=34
 .I CURR("COMM",404) S X=CURR("COMM",501)/CURR("COMM",404)
 .E  S X=0
 .S X2=2,X3=5 D COM
 S R=R+1 ;
VA010 S R=R+1 ;
 I $D(CHG("PKTQ","C")) D
 .S C=31,X=CHG("PKTQ","C"),X2=0,X3=4 D COM
 .; the average would be xxx.x in column C=38,C2=1,X3=5
 S R=R+1 ;
 I $D(CHG("PKTQ","R")) D
 .S C=31,X=CHG("PKTQ","R"),X2=0,X3=4 D COM
 .; the average would be xxx.x in column C=38,C2=1,X3=5
 S R=R+1 ;
 S R=R+1 ;
 I $D(CHG("COMM",411)) D
 .S C=4,X=CHG("COMM",411),X2=0,X3=7 D COM
 I $D(CHG("COMM",414)) D
 .S C=19,X=CHG("COMM",414),X2=0,X3=7 D COM
 I $O(CHG("COMM",599))<700 D  ; dialing errors
 .N % S X=0,%=602 ; sum dial errors: fields 603-699
 .F  S %=$O(CURR("COMM",%)) Q:%>699!(%="")  S X=X+CURR("COMM",%)
 .S C=43,X2=0,X3=5 D COM
 S R=R+1 ;
 I $D(CHG("COMM",412)) D
 .S C=4,X=CHG("COMM",412),X2=0,X3=7 D COM
 I $D(CHG("COMM",415)) D
 .S C=19,X=CHG("COMM",415),X2=0,X3=7 D COM
 I $O(CHG("COMM",700))<800 D  ; problems around sending time 700-799
 .N % S X=0,%=700
 .F  S %=$O(CURR("COMM",%)) Q:%>799!(%="")  I %'=702 S X=X+CURR("COMM",%)
 .S C=43,X=0,X3=5 D COM
VA015 S R=R+1 ;
 I $D(CHG("COMM",413)) S C=4,X=CHG("COMM",413),X2=0,X3=7 D COM
 I $D(CHG("COMM",419)) S C=19,X=CHG("COMM",419),X2=0,X3=7 D COM
 I $G(CHG("COMM",799))<900 D
 .N % S X=0,%=799 ; sum receive errors: fields 801-899
 .F  S %=$O(CURR("COMM",%)) Q:%>899!(%="")  S X=X+CURR("COMM",%)
 .S C=43,X2=0,X3=5 D COM
 S R=R+1 ; we sent nak
 I $D(CHG("COMM",408)) D  ; details of responses to nak in #901-999
 .S C=43,X=CHG("COMM",408),X2=0,X3=5 D COM
 S R=R+1 ;,C=7,X="11",C=11,X="Other" D L1
 S R2=R ;,C=CDIV,X="|" F R=R1:1:R2 D L1
VA101 S R=R1 ;
 S R=R+1 ;
 I $D(CHG("STAT",0)) D
 .S C=CDIV+20,X=CHG("STAT",0),X2=0,X3=3 D COM
 S R=R+1 ;
 I $D(CHG("STAT",10)) D
 .S C=CDIV+20,X=CHG("STAT",10),X2=0,X3=3 D COM
VA105 S R=R+1 ;
 I $D(CHG("STAT",30)) D
 .S C=CDIV+20,X=CHG("STAT",30),X2=0,X3=3 D COM
 S R=R+1 ;
 I $D(CHG("STAT",40)) D
 .S C=CDIV+20,X=CHG("STAT",40),X2=0,X3=3 D COM
 S R=R+1 ;
 I $D(CHG("STAT",50)) D
 .S C=CDIV+20,X=CHG("STAT",50),X2=0,X3=3 D COM
 S R=R+1 ;
 I $D(CHG("STAT",60)) D
 .S C=CDIV+20,X=CHG("STAT",60),X2=0,X3=3 D COM
 S R=R+1 ;
 I $D(CHG("STAT",70)) D
 .S C=CDIV+20,X=CHG("STAT",70),X2=0,X3=3 D COM
VA110 S R=R+1 ;
 I $D(CHG("STAT",80)) D
 .S C=CDIV+20,X=CHG("STAT",80),X2=0,X3=3 D COM
 S R=R+1 ;
 I $D(CHG("STAT",90)) D
 .S C=CDIV+20,X=CHG("STAT",90),X2=0,X3=3 D COM
 S R=R+1 ;
 S R=2,CDIV=65 ;
 I $D(CHG("COMM",203)) D
 .S C=CDIV+1,X=CHG("COMM",203),X2=0,X3=7 D COM
 S R=R+1 ;
 I $D(CHG("COMM",202)) D
 .S C=CDIV+1,X=CHG("COMM",202),X2=0,X3=7 D COM
 S R=R+1 ;
 I $D(CHG("COMM",201)) D
 .S C=CDIV+1,X=CHG("COMM",201),X2=0,X3=7 D COM
VA115 S R=R+1 ;
 I $D(CHG("COMM",204)) D
 .S C=CDIV+1,X=CHG("COMM",204),X2=0,X3=7 D COM
VA116 S R=R+1 ;
 I $D(CHG("COMM",205)) D
 .S C=CDIV+1,X=CHG("COMM",205),X2=0,X3=7 D COM
VA200 ; Then line 18 begins "Next screen"
 S (R,R1)=17
 N C1 S C1=1+$L("Other errors during dialing")+2,X2=0,X3=4
VA210 S R=R+1 ;
 S R=R+1 ;
 I $D(CHG("COMM",601)) D
 .N X2,X3 S C=C1,X=CHG("COMM",601) D COM60
 S R=R+1 ;
 I $D(CHG("COMM",604)) S C=C1,X=CHG("COMM",604) D COM60
 S R=R+1 ;
 I $D(CHG("COMM",603)) S C=C1,X=CHG("COMM",603) D COM60
 S R=R+1
VA220 S R=R+1 ;
 S R=R+1 ;
 I $D(CHG("COMM",719)) S C=C1,X=CHG("COMM",719) D COM60
 S R=R+1 ;
 I $D(CHG("COMM",701)) S C=C1,X=CHG("COMM",701) D COM60
 S R=R+1 ;
 I $D(CHG("COMM",702)) S C=C1,X=CHG("COMM",702) D COM60
 S R=R+1 ;
 I $D(CHG("COMM",703)) S C=C1,X=CHG("COMM",703) D COM60
 S R=R+1 ;
 I $D(CHG("COMM",704)) S C=C1,X=CHG("COMM",704) D COM60
 S R=R+1 ;
 I $D(CHG("COMM",705)) S C=C1,X=CHG("COMM",705) D COM60
 S R=R+1 ;
 I $D(CHG("COMM",709)) S C=C1,X=CHG("COMM",709) D COM60
 S R2=R,CDIV=40,C=CDIV ;
 S R=R1,C1=CDIV+4+$L("Received null during")+1
VA260 S R=R+1 ;
 S R=R+1 ;
 I $D(CHG("COMM",801)) S X=CHG("COMM",801),C=C1 D COM60
 S R=R+1 ;
 I $D(CHG("COMM",802)) S X=CHG("COMM",802),C=C1 D COM60
 S R=R+1 ;
 I $D(CHG("COMM",803)) S X=CHG("COMM",803),C=C1 D COM60
 S R=R+1 ;
 I $D(CHG("COMM",804)) S X=CHG("COMM",804),C=C1 D COM60
 S R=R+1 ;
 I $D(CHG("COMM",809)) S X=CHG("COMM",809),C=C1 D COM60
 S R=R+1
VA270 S R=R+1 ;
 S R=R+1 ;
 I $D(CHG("COMM",408)) S X=CHG("COMM",408),C=C1 D COM60
 S R=R+1 ;
 I $D(CHG("COMM",902)) S X=CHG("COMM",902),C=C1 D COM60
 S R=R+1 ;
 I $D(CHG("COMM",903)) S X=CHG("COMM",903),C=C1 D COM60
 S R=R+1 ;
 I $D(CHG("COMM",904)) S X=CHG("COMM",904),C=C1 D COM60
 S R=R+1 ;
 I $D(CHG("COMM",909)) S X=CHG("COMM",909),C=C1 D COM60
VA300 S (R,R1)=33 ; begin page 3
 S C=5
 S R=R+1 ;
 S R=R+1 ;
 S X=$G(CHG("COMM",101)) I X]"" D COM70
 S R=R+1 ;
 S X=$G(CHG("COMM",102)) I X]"" D COM70
 S R=R+1 ;
 S X=$G(CHG("COMM",103)) I X]"" D COM70
 S R=R+1
 S R=R+1 ;
 S R=R+1 ;
 S X=$G(CHG("COMM",1101)) I X]"" D COM70
 S R=R+1 ;
 S X=$G(CHG("COMM",1102)) I X]"" D COM70
 S R=R+1 ;
 S X=$G(CHG("COMM",1103)) I X]"" D COM70
 K CHG
 Q
