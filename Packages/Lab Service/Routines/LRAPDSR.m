LRAPDSR ;DALOI/WTY - AP SUPPLEMENTARY REPORT ENTRY;12/05/00
 ;;5.2T9;LR;**248,1018**;Nov 17, 2004
 ;
 ;Reference to ^%DT supported by IA #10003
 ;Reference to ^DIC supported by IA #10006
 ;Reference to ^DIE supported by IA #10018
 ;Reference to UPDATE^DIE supported by IA #2053
 ;Reference to WP^DIE supported by IA #2053
 ;Reference to GETS^DIQ() supported by IA #2056
 ;
RELEAS1 ;Is the ENTIRE report already released?
 S LRRLS=0
 I LRSS="AU" D  G GETRPT
 .S X=$P($G(^LR(LRDFN,LRSS)),"^",15)
 .Q:'X         ;Report has not been released so no audit will occur.
 .W $C(7),!!,"This AUTOPSY has been released.  Supplementary report "
 .W "additions/modifications"
 .W !,"will create an audit trail.",!
 .S LRRLS=1    ;Report has been released so auditing will occur.
 S X=$P($G(^LR(LRDFN,LRSS,LRI,0)),"^",11)
 I X D
 .W $C(7),!!,"This "_$G(LRAA(1))_" report has been released."
 .W !,"Supplementary report additions/modifications will create"
 .W " an audit trail.",!
 .S LRRLS=1
GETRPT ;First, select the report 
 S DIC(0)="QAEZL",DLAYGO=63
 S DIC("A")="Select SUPPLEMENTARY REPORT DATE: "
 S DIC=$S(LRSS="AU":"^LR(LRDFN,84,",1:"^LR(LRDFN,LRSS,LRI,1.2,")
 S DIC("P")=$S(LRSS="AU":"63,32.4,0",1:"LRSF,1.2,0")
 S DIC("P")=$P(@("^DD("_DIC("P")_")"),"^",2)
 S DIC("B")="" F X=0:0 S X=$O(@(DIC_"X)")) Q:'X  D
 .S DIC("B")=+(@(DIC_"X,0)"))
 D ^DIC K DLAYGO
 I Y=-1 D END Q
RELEAS2 ;Is the supplementary report already released?
 I LRSS="AU",'LRRLS G RPT
 G:LRRLS COPY
 S X=$G(^LR(LRDFN,LRSS,LRI,1.2,+Y,0))
 S LRRLS=+$P(X,"^",2)
 I LRRLS D  G COPY
 .W $C(7),!!,"This supplementary report has been released.  Additions/"
 .W "modifications",!,"will create an audit trail.",!
 G:'LRRLS RPT
COPY ;Make a copy of the current report.
 K ^TMP("DIQ1",$J)
 S IENS=+Y_","_$S(LRSS'="AU":LRI_",",1:"")_LRDFN_","
 S FILE1=$S(LRSS="SP":63.817,LRSS="CY":63.907,LRSS="EM":63.207,1:"")
 S:FILE1="" FILE1=$S(LRSS="AU":63.324,1:"")
 I FILE1="" D END Q
 D GETS^DIQ(FILE1,IENS,"**","Z","^TMP(""DIQ1"",$J)")
RPT ;
 N DIE,LRDA,DA,DR
 S DIE=DIC K DIC
 S (LRDA,DA)=+Y,DR=".01;1" D ^DIE
 I 'LRRLS D END Q
COMPARE ;Compare reports
 I '$D(^TMP("DIQ1",$J)) D END Q
 S:LRSS'="AU" LRFILE="^LR(LRDFN,LRSS,LRI,1.2,LRDA,1,"
 S:LRSS="AU" LRFILE="^LR(LRDFN,84,LRDA,1,"
 I '$D(@(LRFILE_"0)")) D END Q
 S A=0,LRFLG=1
 F  S A=$O(@(LRFILE_"A)")) Q:'A  D
 .S XTMP=@(LRFILE_"A,0)")
 .S:'$D(^TMP("DIQ1",$J,FILE1,IENS,1,A,0)) LRFLG=0
 .Q:'LRFLG
 .S YTMP=^TMP("DIQ1",$J,FILE1,IENS,1,A,0)
 .I XTMP'=YTMP S LRFLG=0 Q
 I LRFLG D
 .S A=0 F  S A=$O(^TMP("DIQ1",$J,FILE1,IENS,1,A)) Q:'A  D
 ..I '$D(@(LRFILE_"A,0)")) S LRFLG=0 Q
 I LRFLG D  G END
 .W $C(7),!!,"No changes were made to the supplementary report."
 .K ^TMP("DIQ1",$J)
UPDATE ;File changes
 ;First, store the date of the change and user ID
 K FDA,ERR
 S X="NOW",%DT="T" D ^%DT S LRNOW=Y
 S IENS1="+1,"_IENS
 S FILE=$S(LRSS="SP":63.8172,LRSS="CY":63.9072,LRSS="EM":63.2072,1:"")
 S:FILE="" FILE=$S(LRSS="AU":63.3242,1:"")
 I FILE="" D END Q
 S FDA(1,FILE,IENS1,.01)=LRNOW
 S FDA(1,FILE,IENS1,.02)=DUZ,FIELD=1
 D UPDATE^DIE("","FDA(1)","ORIEN")
STORE ;Second, store the original report
 S IENS2=ORIEN(1)_","_IENS
 S WPROOT="^TMP(""DIQ1"",$J,FILE1,IENS,1)"
 D WP^DIE(FILE,IENS2,FIELD,"",WPROOT)
 K ^TMP("DIQ1",$J)
END K LRRLS,LRNOW,LRFLG,LRFILE,FIELD,FILE,FILE1,IENS,IENS1,IENS2,ORIEN
 K WPROOT,YTMP
 Q
