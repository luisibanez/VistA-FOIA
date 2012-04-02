BCHRPTST ; IHS/TUCSON/LAB - PROCESS REPORT ;  [ 12/06/00  3:48 PM ]
 ;;1.0;IHS RPMS CHR SYSTEM;**7,9,11**;OCT 28, 1996
 ;IHS/CMI/LAB - tmp to xtmp
 ;
 ;IHS/CMI/LAB - patch 9 fixed naked reference
SETTMP2 ;EP ; set tmp for top ten record reports
UTL ;
 I BCHRPROC="ACT"!(BCHRPROC="ACTC")!(BCHRPROC="PROB")!(BCHRPROC="PROBCAT") D MULT10 Q
 D @BCHRPROC
 S X=BCHA
 S BCHPOV=@BCHSORT
 I '$D(@X) S @X=0
 S %=+(@X),%=%+1,%1=$P((@X),U,3),%1=%1+$P(BCHR0,U,27),@X=%_"^"_BCHSRT2_"^"_%1
 Q
 ;
SET F BCHPOV=0:0 S BCHPOV=$O(@BCHA) Q:'BCHPOV  S %=^(BCHPOV),@BCHC@(9999999-%,BCHPOV)="" ;global reference in BCHA is ^XTMP("BCHTEN",BCHJOB,BCHBT,"POV",BCHPOV)
 Q
SETTMP ;EP - CALLED FROM BCHPT4
 I BCHRPROC="ACT"!(BCHRPROC="ACTC")!(BCHRPROC="PROB")!(BCHRPROC="PROBCAT") D MULT Q
 D @BCHRPROC
 S ^(BCHSRT2)=$S($D(^XTMP("BCHRAP2",BCHJOB,BCHBTH,"TOTAL",@BCHSORT,BCHSRT2)):^(BCHSRT2)+1,1:1)
 S ^(BCHSRT2)=$S($D(^XTMP("BCHRAP2",BCHJOB,BCHBTH,"PATIENT",@BCHSORT,BCHSRT2)):^(BCHSRT2)+$P(BCHR0,U,12),1:$P(BCHR0,U,12))
 S ^(BCHSRT2)=$S($D(^XTMP("BCHRAP2",BCHJOB,BCHBTH,"TIME TOTAL",@BCHSORT,BCHSRT2)):^(BCHSRT2)+$P(BCHR0,U,27),1:$P(BCHR0,U,27))
 Q
PROG ;
 S BCHPROG=$P(BCHR0,U,2) I BCHPROG="" S BCHPROG="NO PROGRAM ENTERED",BCHSRT2="--" Q
 S BCHSRT2=$P(^BCHTPROG(BCHPROG,0),U,5),BCHPROG=$P(^BCHTPROG(BCHPROG,0),U)
 Q
 ;
DATE ;
 S BCHDATE=$P(BCHODAT,".")
 S X=BCHDATE D H^%DTC S BCHSRT2=$P("SUNDAY;MONDAY;TUESDAY;WEDNESDAY;THURSDAY;FRIDAY;SATURDAY",";",%Y+1) I BCHSRT2="" S BCHSRT2="UNKNOWN"
 Q
PROV ;
 S BCHPROV=$$PPNAME^BCHUTIL(BCHR),BCHSRT2=$E($$PPCLS^BCHUTIL(BCHR,"E"),1,20)
 Q
COMM ;
 S BCHCOMM=$P($G(^BCHR(BCHR,11)),U,6) I BCHCOMM="" S BCHCOMM="NOT AVAILABLE",BCHSRT2="-------" Q
 S BCHSRT2=$P(^AUTTCOM(BCHCOMM,0),U,8),BCHCOMM=$P(^(0),U)
 Q
ACT ;
 S BCHACT=$P(^BCHRPROB(BCHPPOV,0),U,4)
 S BCHSRT2=$S(BCHACT:$P(^BCHTSERV(BCHACT,0),U,3),1:"??"),BCHACT=$S(BCHACT:$P(^BCHTSERV(BCHACT,0),U),1:"<missing>")
 Q
SU ;
 S BCHSU=$P(^AUTTLOC($P(BCHR0,U,4),0),U,5) I BCHSU="" S BCHSU="NONE ENTERED",BCHSRT2="9999" Q
 S BCHSRT2=$P(^AUTTSU(BCHSU,0),U,4),BCHSU=$P(^AUTTSU(BCHSU,0),U)
LOS ;
 S BCHVLOC=$P(BCHR0,U,6) I BCHVLOC="" S BCHSRT2="--",BCHVLOC="NONE ENTERED" Q
 S BCHSRT2=$P(^BCHTACTL(BCHVLOC,0),U,5),BCHVLOC=$P(^(0),U)
 Q
 ;
PROB ;
 S BCHPROB=$P(^BCHRPROB(BCHPPOV,0),U),BCHSRT2=$P(^BCHTPROB(BCHPROB,0),U,2),BCHPROB=$P(^BCHTPROB(BCHPROB,0),U)
 Q
PROBCAT ;
 S BCHSRT2=$P(^BCHTPROB($P(^BCHRPROB(BCHPPOV,0),U),0),U,3),(BCHSRT2,BCHPROB)=$P(^BCHTHAC(BCHSRT2,0),U)
 Q
MULT ;
 S BCHPPOV=$O(^BCHRPROB("AD",BCHR,""))
 I BCHPPOV="" S BCHPROB="NO POVS ENTERED",BCHSRT2="-----" Q
 S BCHPPOV=0 F  S BCHPPOV=$O(^BCHRPROB("AD",BCHR,BCHPPOV)) Q:BCHPPOV'=+BCHPPOV  D
 .D @BCHRPROC
 .S ^(BCHSRT2)=$S($D(^XTMP("BCHRAP2",BCHJOB,BCHBTH,"TOTAL",@BCHSORT,BCHSRT2)):^(BCHSRT2)+1,1:1)
 .S ^(BCHSRT2)=$S($D(^XTMP("BCHRAP2",BCHJOB,BCHBTH,"PATIENT",@BCHSORT,BCHSRT2)):^(BCHSRT2)+$P(BCHR0,U,12),1:$P(BCHR0,U,12))
 .I $D(^XTMP("BCHRAP2",BCHJOB,BCHBTH,"TIME TOTAL",@BCHSORT,BCHSRT2)) S ^XTMP("BCHRAP2",BCHJOB,BCHBTH,"TIME TOTAL",@BCHSORT,BCHSRT2)=^XTMP("BCHRAP2",BCHJOB,BCHBTH,"TIME TOTAL",@BCHSORT,BCHSRT2)+$P(^BCHRPROB(BCHPPOV,0),U,5)
 .I '$D(^XTMP("BCHRAP2",BCHJOB,BCHBTH,"TIME TOTAL",@BCHSORT,BCHSRT2)) S ^XTMP("BCHRAP2",BCHJOB,BCHBTH,"TIME TOTAL",@BCHSORT,BCHSRT2)=$P(^BCHRPROB(BCHPPOV,0),U,5)
 Q
MULT10 ;
 S BCHPPOV=$O(^BCHRPROB("AD",BCHR,""))
 I BCHPPOV="" S (BCHPROB,BCHACT)="NO POVS ENTERED",BCHSRT2="-----" Q
 S BCHPPOV=0 F  S BCHPPOV=$O(^BCHRPROB("AD",BCHR,BCHPPOV)) Q:BCHPPOV'=+BCHPPOV  D
 .D @BCHRPROC
 .S X=BCHA
 .S BCHPOV=@BCHSORT
 .I '$D(@X) S @X=0
 .S %=+(@X),%=%+1,%1=$P((@X),U,3),%1=%1+$P(^BCHRPROB(BCHPPOV,0),U,5),@X=%_"^"_BCHSRT2_"^"_%1
 .Q
 Q