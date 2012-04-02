AMQQQ ; IHS/CMI/THL - SCRIPT INTERFACE ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;-----
 ;1:UNDEFINED OR ILLEGAL INPUT VARIABLE
 ;2:UNDEFINED OR ILLEGAL OUTPUT VARIABLE
 ;3:SUBJECT LOOKUP FAILED
 ;4:MORE THAN ONE SUBJECT
 ;5:UNABLE TO CREATE TAXONOMY
 ;6:ATTRIBUTE LOOKUP FAILED
 ;7:CONDITION LOOKUP FAILED
 ;8:FAILED TO FIND VALUE
 ;9:OR GROUP ERROR
 ;10:SUBQUERY ERROR
EN ; ENTRY POINT FROM SEARCH^AMQQ
 K AMQQFAIL
RUN F AMQQQRUN=1:1:6 D @$P("KILL;VAL;ANAL;^AMQQQ0;^AMQQQ2;^AMQQCMPL",";",AMQQQRUN) Q:$D(AMQQQUIT)  Q:$D(AMQQFAIL)
EXIT D KILL
 Q
 ;
KILL K AMQQXXAA,AMQQXXAS,AMQQXXAT,AMQQXXCC,AMQQXXVV,AMQQNECO,AMQQRUN,AMQQQ,%,A,Z
 K AMQQYYAT,AMQQXXGG,AMQQXXGO,AMQQXXGI,AMQQXXII,AMQQXXSS,AMQQXXXX
 K AMQQATN,AMQQATNM,AMQQCTXS,AMQQFTYP,AMQQPRST,AMQQSBCT,AMQQVCL
 K AUPNDAYS,AUPNDOB,AUPNDOD,AUPNPAT,AUPNSEX
 Q
 ;
VAL ; ENTRY POINT FROM AMQQE1
 S X=AMQQXX
 D TEST
 I $D(AMQQFAIL) Q
 D TEST1
 I $D(AMQQFAIL) Q
 S X=AMQQYY
 I X[U,$P(X,U)=+X S AMQV("OPTION")="SAVE" G VAL1
 D TEST
 I $D(AMQQFAIL) S AMQQFAIL=2 Q
VAL1 S AMQQXXGO=AMQQYY_"AMQQXXGN)"
 S AMQQNECO=""
 I '$D(AMQV("OPTION")) S AMQV("OPTION")="LIST"
 Q
 ;
TEST S %=$E(X,$L(X))
 I %'=",",%'="(" S AMQQFAIL=1 Q
 S %=$E(X,1,$L(X)-1)
 S Y=$E(X,$L(X))
 S Z=X
 I Y="," S %=%_")"
 S X="I "_%_"=1"
 D ^DIM
 I '$D(X) S AMQQFAIL=1
 Q
 ;
TEST1 S Z=AMQQXX
 S AMQQXXGG=Z_"AMQQXXGN)"
 I $D(@(Z_"1,0)")) S AMQQXXGI=Z_"AMQQXXGN,0)" Q
 I $D(@(Z_"1)")) S AMQQXXGI=Z_"AMQQXXGN)" Q
 S AMQQFAIL=1
 Q
 ;
ANAL F AMQQXXGN=0:0 S AMQQXXGN=$O(@AMQQXXGG) Q:'AMQQXXGN  S AMQQXXXX=@AMQQXXGI D A1 I $D(AMQQFAIL)!($D(AMQQQUIT)) Q
 I '$D(AMQQXX(0)) S AMQQFAIL=3
 Q
 ;
A1 S %=AMQQXXXX
 S %=$P(%,"**")
 I %="" Q
 I $E(%)="*",$E(%,2)'="*" S %=$E(%,2,999),X=$P(%,"="),AMQQXXSS=$P(%,"=",2,99)
 E  Q
 S A=X
 D STRIP
 S X=A
 I X="" S AMQQFAIL=1 Q
 I X=$E("FORMAT",1,$L(X)) S A=AMQQXXSS D STRIP S AMQQXX("FORMAT")=A Q
 I X=$E("SUBJECT",1,$L(X)) D SUBJECT Q
 S %=$P(X," ")
 I %=$E("TAXONOMY",1,$L(%)) D TAX Q
 Q
 ;
STRIP ; ENTRY POINT FROM AMQQ0
 F  Q:$E(A)'=" "  S A=$E(A,2,999)
 F  Q:$E(A,$L(A))'=" "  S A=$E(A,1,$L(A)-1)
 Q
 ;
SUBJECT I $D(AMQQXX(0)) S AMQQFAIL=4 Q
 S A=AMQQXXSS
 D STRIP
 S (X,AMQQXXSS)=A
 I X?1"`"1.N,$D(^DPT($E(X,2,9),0)) S AMQQCCLS="P",AMQQONE=$P(^(0),U),AMQQXX(0)=X Q
 D AUTO^AMQQ1
 I Y=-1 S AMQQFAIL=3 Q
 S AMQQXX(0)=Y
 D NEW^AMQQ1
 Q
 ;
TAX S A=$P(X," ",2,99)
 D STRIP
 I A="" S AMQQFAIL=5 Q
 S AMQQXXTX=A
 S A=AMQQXXSS
 D STRIP
 I A="" S AMQQFAIL=5 Q
 S AMQQXXTI=0
 D SETAX
 S AMQQXXTN=AMQQXXGN
 N AMQQXXGN
 D PLUSTAX
 S AMQQXXGN=AMQQXXTN
 K AMQQXXTN,AMQQXXTI,AMQQXXTX
 Q
 ;
PLUSTAX S AMQQXXGN=AMQQXXTN
 F  S AMQQXXGN=$O(@AMQQXXGG) Q:'AMQQXXGN  S A=@AMQQXXGI Q:$E(A)'="+"  S A=$E(A,2,999) D STRIP,SETAX
 S AMQQXXTN=AMQQXXGN
 Q
 ;
SETAX F AMQQXXTP=1:1 S %=$P(A,",",AMQQXXTP) Q:%=""  S AMQQXXTI=AMQQXXTI+1,^UTILITY("AMQQ",$J,"XXTAX",AMQQXXTX,AMQQXXTI)=%
 Q
 ;
SAVE D ^AMQQCMPS
 Q
 ;