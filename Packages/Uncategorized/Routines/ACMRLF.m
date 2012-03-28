ACMRLF ;IHS/CMI/LAB - flat file [ 10/17/05  11:48 AM ]
 ;;2.0;ACM CASE MANAGEMENT SYSTEM;**1,6**;JAN 10, 1996
 ;IHS/CMI/LAB - patch 1 flat file new routine
 ;IHS/CMI/TMJ - Patch #6 Entry Point Mark
 ;
FLATP ;EP
 K ^TMP($J,"ACMFLAT")
 I '$D(^XTMP("ACMRL",ACMJOB,ACMBTH)) Q
 S (ACMSRTV,ACMFRST)="",ACMCNT=0 K ACMQUIT
 F  S ACMSRTV=$O(^XTMP("ACMRL",ACMJOB,ACMBTH,"DATA HITS",ACMSRTV)) Q:ACMSRTV=""!($D(ACMQUIT))  D V
 D WRITEF
 Q
V ;GETS DATA HITS
 ;get readable sort value
 S ACMSRTR="",DFN=$O(^XTMP("ACMRL",ACMJOB,ACMBTH,"DATA HITS",ACMSRTV,0)) I DFN]"" S ACMCRIT=ACMSORT D
 .S ACMIFN=$G(^ACM(41,"AC",DFN,ACMRG)) X:$D(^ACM(58.1,ACMSORT,3)) ^(3) S ACMSRTR=ACMPRNT
 K ACMFRST
 S DFN=0 F  S DFN=$O(^XTMP("ACMRL",ACMJOB,ACMBTH,"DATA HITS",ACMSRTV,DFN)) Q:DFN'=+DFN!($D(ACMQUIT))  D
 .S ACMIFN=$G(^ACM(41,"AC",DFN,ACMRG)) D PRINT
 .Q
 Q
PRINT ;
 S ACMCNT=ACMCNT+1
 S ACMI=0 F  S ACMI=$O(^ACM(58.8,ACMRPT,12,ACMI)) Q:ACMI'=+ACMI!($D(ACMQUIT))  S ACMCRIT=$P(^ACM(58.8,ACMRPT,12,ACMI,0),U) D
 .I '$P(^ACM(58.1,ACMCRIT,0),U,8) D SINGLE Q
 .D MULT
 .Q
 Q
SINGLE ;process single valued item
 K ACMPRNT
 S ACMX=0
 X:$D(^ACM(58.1,ACMCRIT,3)) ^(3)
 S ^TMP($J,"ACMFLAT",ACMCNT)=$G(^TMP($J,"ACMFLAT",ACMCNT))_ACMPRNT_U
 Q
MULT ;
 K ACMPRNT,ACMPRNM S (ACMX,ACMPCNT)=0
 X:$D(^ACM(58.1,ACMCRIT,3)) ^(3)
 I '$D(ACMPRNM) S ACMPRNT="--" D
 .S ACMLENG=$P(^ACM(58.8,ACMRPT,12,ACMI,0),U,2),ACMPRNT=$E(ACMPRNT,1,ACMLENG) D
 ..S J=$L(ACMPRNT),^XTMP("ACMLINE",$J,1)=^XTMP("ACMLINE",$J,1)_ACMPRNT,K=$P(^ACM(58.8,ACMRPT,12,ACMI,0),U,2)+1 F I=J:1:K S ^XTMP("ACMLINE",$J,1)=^XTMP("ACMLINE",$J,1)_" "
 S X=0 F  S X=$O(ACMPRNM(X)) Q:X'=+X  D
 .I X=1 D  Q
 ..S ACMLENG=$P(^ACM(58.8,ACMRPT,12,ACMI,0),U,2),ACMPRNT=$E(ACMPRNM(1),1,ACMLENG) D
 ...S J=$L(ACMPRNT),^XTMP("ACMLINE",$J,1)=^XTMP("ACMLINE",$J,1)_ACMPRNT,K=$P(^ACM(58.8,ACMRPT,12,ACMI,0),U,2)+1 F I=J:1:K S ^XTMP("ACMLINE",$J,1)=^XTMP("ACMLINE",$J,1)_" "
 .S ACMLENG=$P(^ACM(58.8,ACMRPT,12,ACMI,0),U,2),ACMPRNT=$E(ACMPRNM(X),1,ACMLENG) D
 ..I '$D(^XTMP("ACMLINE",$J,X)) S ^XTMP("ACMLINE",$J,X)="",K=$P(^ACM(58.8,ACMRPT,12,ACMI,0),U,2)+1,$P(^XTMP("ACMLINE",$J,X)," ",($L(^XTMP("ACMLINE",$J,1))-K))=""
 ..S J=$L(ACMPRNT),^XTMP("ACMLINE",$J,X)=^XTMP("ACMLINE",$J,X)_ACMPRNT,K=$P(^ACM(58.8,ACMRPT,12,ACMI,0),U,2)+1 F I=J:1:K S ^XTMP("ACMLINE",$J,X)=^XTMP("ACMLINE",$J,X)_" "
 S X=1 F  S X=$O(^XTMP("ACMLINE",$J,X)) Q:X'=+X  I $L(^XTMP("ACMLINE",$J,X))<$L(^XTMP("ACMLINE",$J,1)) S K=$L(^XTMP("ACMLINE",$J,X))+1,J=$L(^XTMP("ACMLINE",$J,1)) F I=K:1:J S ^XTMP("ACMLINE",$J,X)=^XTMP("ACMLINE",$J,X)_" "
 Q
FLAT ;EP;Entry point from ACMRL3 IHS/CMI/TMJ PATCH #6
 S ACMFFN="ACM"_DUZ_"."
 S X=$G(^ACM(58.8,"FLATFILE")) S X=X+1,^ACM(58.8,"FLATFILE")=X
 S ACMFFN=ACMFFN_X
 W !!,"I am going to create a file called ",ACMFFN," which will reside in ",!,"the ",$S($P(^AUTTSITE(1,0),U,21)=1:"/usr/spool/uucppublic",1:"C:\EXPORT")," directory.",!
 W "Actually, the file will be placed in the same directory that the data export"
 W !,"globals are placed.  See your site manager for assistance in finding the file",!,"after it is created.  PLEASE jot down and remember the following file name:",!?15,"**********    ",ACMFFN,"    **********",!
 W !,"The records that are generated will be '^' delimited.  The fields",!,"will be the fields you select in the next screen and will be in the order",!,"that you select them.",!
 S DIR(0)="Y",DIR("A")="Do you want to continue?",DIR("B")="Y" K DA D ^DIR K DIR
 I $D(DIRUT)!(Y'=1) S ACMQUIT=1 Q
 S DA=ACMRPT,DR=".12///"_ACMFFN,DIE="^ACM(58.8," D ^DIE
 K DIE,DA,DR
 Q
WRITEF ;EP - write out flat file
 I '$D(ZTQUEUED) W !!,"CMS File being generated...." H 2
 S XBGL="TMP("_$J_",""ACMFLAT"","
 S XBMED="F",XBFN=ACMFFN,XBTLE="SAVE OF CMS RECORDS GENERATED BY -"_$P(^VA(200,DUZ,0),U)
 S XBF=0,XBQ="N",XBFLT=1,XBE=$J
 D ^XBGSAVE
 ;check for error
 K ^TMP($J,"ACMFLAT")
 K XBGL,XBMED,XBTLE,XBFN,XBF,XBQ,XBFLT
 Q
