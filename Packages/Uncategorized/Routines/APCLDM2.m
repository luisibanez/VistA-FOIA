APCLDM2 ; IHS/CMI/LAB -IHS -CONTINUATION OF ROUTINE TO FETCH DATA ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;IHS/CMI/LAB - patch 4 y2k and mammography screening
EN ; - EP - from CLINICAL^APCLDM1
 ;
 F APCLI=1:1 Q:$T(@APCLI)=""  K APCLX S APCLY="APCL(" D @APCLI K APCL
 ;
 Q
1 ;
FOOT ;
 S APCLX=APCLPD_"^LAST EXAM DIABETIC FOOT EXAM"_APCLDATE S APCLER=$$START1^APCLDF(APCLX,APCLY) S ^TMP("APCL",$J,11)=$S($D(APCL(1)):"YES",1:"NO")
 ;
X1 I APCLCUML S APCLGOT1=$S(^TMP("APCL",$J,11)="YES":1,1:0),APCLSUB=19 D CUML^APCLDM1
 Q
2 ;
EYE ;
 S APCLX=APCLPD_"^LAST EXAM DIABETIC EYE EXAM"_APCLDATE S APCLER=$$START1^APCLDF(APCLX,APCLY)  S ^TMP("APCL",$J,12)=$S($D(APCL(1)):"YES",1:"NO")
 ;
X5 I APCLCUML S APCLGOT1=$S(^TMP("APCL",$J,12)="YES":1,1:0),APCLSUB=20 D CUML^APCLDM1
 Q
3 ;
DENTAL S APCLX=APCLPD_"^LAST ADA [DM AUDIT DENTAL EXAM ADA CODES"_APCLDATE S APCLER=$$START1^APCLDF(APCLX,APCLY)
 I APCLER S ^TMP("APCL",$J,13)="*** SCRIPT ERROR IN DENTAL^APCLDM2.  CONTACT SITE MANAGER" G X11
 S ^TMP("APCL",$J,13)=$S($D(APCL(1)):"YES",1:"NO")
 I APCLCUML S APCLGOT1=$S(^TMP("APCL",$J,13)="YES":1,1:0),APCLSUB=21 D CUML^APCLDM1
X11 Q
4 ;
RECTAL I ^TMP("APCL",$J,503)<40 S ^TMP("APCL",$J,14)="N/A" G X ; age <40
 E  S APCLX=APCLPD_"^LAST EXAM RECTAL"_APCLDATE S APCLER=$$START1^APCLDF(APCLX,APCLY) S ^TMP("APCL",$J,14)=$S($D(APCL(1)):"YES",1:"NO")
 I APCLCUML S APCLGOT1=$S(^TMP("APCL",$J,14)="YES":1,1:0),APCLSUB=22 D CUML^APCLDM1
X Q
5 ;
PAP I ^TMP("APCL",$J,502)="M" S ^TMP("APCL",$J,28)="N/A" G X2
 S APCLX=APCLPD_"^LAST LAB [DM AUDIT PAP SMEAR TAX"_APCLDATE S APCLER=$$START1^APCLDF(APCLX,APCLY) S ^TMP("APCL",$J,28)=$S($D(APCL(1)):"YES",1:"NO")
 I APCLCUML S APCLGOT1=$S(^TMP("APCL",$J,28)="YES":1,1:0),APCLSUB=23 D CUML^APCLDM1
X2 Q
6 ;
BREAST I ^TMP("APCL",$J,502)="M" S ^TMP("APCL",$J,16)="N/A" G X3
 S APCLX=APCLPD_"^LAST EXAM BREAST"_APCLDATE S APCLER=$$START1^APCLDF(APCLX,APCLY) S ^TMP("APCL",$J,16)=$S($D(APCL(1)):"YES",1:"NO")
 I APCLCUML S APCLGOT1=$S(^TMP("APCL",$J,16)="YES":1,1:0),APCLSUB=41 D CUML^APCLDM1
X3 Q
7 ;
MAMMOG  ;IHS/CMI/LAB - patch 4 added mammogram screening
 S APCLMAM="",APCLMAMD="" I ^TMP("APCL",$J,502)="M"!(^(503)<40) S ^TMP("APCL",$J,17)="N/A" G X4
 S APCLX=APCLPD_"^LAST RAD MAMMOGRAM BILAT"_";DURING JAN 01,1901-"_APCLEDT
 ;begin Y2K
 ;S APCLER=$$START1^APCLDF(APCLX,APCLY) G:APCLER X4  I $D(APCL(1)) S ^TMP("APCL",$J,17)="YES",(APCLMAM,APCLMAMD)=$P(APCL(1),U),^TMP("APCL",$J,17.1)=$E(APCLMAM,4,5)_"/"_$E(APCLMAM,6,7)_"/"_$E(APCLMAM,2,3) ;Y2000
 S APCLER=$$START1^APCLDF(APCLX,APCLY) G:APCLER X4  I $D(APCL(1)) S ^TMP("APCL",$J,17)="YES",(APCLMAM,APCLMAMD)=$P(APCL(1),U),^TMP("APCL",$J,17.1)=$E(APCLMAM,4,5)_"/"_$E(APCLMAM,6,7)_"/"_(1700+($E(APCLMAM,1,3))) ;Y2000
 ;end Y2K
 S APCLX=APCLPD_"^LAST RAD MAMMOGRAM UNILAT"_";DURING JAN 01,1901-"_APCLEDT
 ;begin Y2k
 ;S APCLER=$$START1^APCLDF(APCLX,APCLY) G:APCLER X4  I $D(APCL(1)) S ^TMP("APCL",$J,17)="YES",APCLMAM=$P(APCL(1),U) I APCLMAM>APCLMAMD S ^TMP("APCL",$J,17.1)=$E(APCLMAM,4,5)_"/"_$E(APCLMAM,6,7)_"/"_$E(APCLMAM,2,3),APCLMAMD=APCLMAM ;Y2000
 S APCLER=$$START1^APCLDF(APCLX,APCLY) G:APCLER X4  I $D(APCL(1)) S ^TMP("APCL",$J,17)="YES",APCLMAM=$P(APCL(1),U) I APCLMAM>APCLMAMD S ^TMP("APCL",$J,17.1)=$E(APCLMAM,4,5)_"/"_$E(APCLMAM,6,7)_"/"_(1700+($E(APCLMAM,1,3))),APCLMAMD=APCLMAM ;Y2000
 ;end Y2K
 S APCLX=APCLPD_"^LAST RAD SCREENING MAMMOGRAM"_";DURING JAN 01,1901-"_APCLEDT
 ;begin Y2K
 ;S APCLER=$$START1^APCLDF(APCLX,APCLY) G:APCLER X4
 ;S ^TMP("APCL",$J,17)=$S($D(APCL(1)):"YES",1:"NO") I $D(APCL(1)) S APCLMAM=$P(APCL(1),U) I APCLMAM>APCLMAMD S ^TMP("APCL",$J,17.1)=$E(APCLMAM,4,5)_"/"_$E(APCLMAM,6,7)_"/"_$E(APCLMAM,2,3),APCLMAMD=APCLMAM
 S APCLER=$$START1^APCLDF(APCLX,APCLY) G:APCLER X4 ;Y2000
 S ^TMP("APCL",$J,17)=$S($D(APCL(1)):"YES",1:"NO") I $D(APCL(1)) S APCLMAM=$P(APCL(1),U) I APCLMAM>APCLMAMD S ^TMP("APCL",$J,17.1)=$E(APCLMAM,4,5)_"/"_$E(APCLMAM,6,7)_"/"_(1700+($E(APCLMAM,1,3))),APCLMAMD=APCLMAM ;Y2000
 ;end Y2K
RCUM  D
 .S APCLMAM=APCLMAMD
 .I APCLCUML,APCLMAM]"" S APCLGOT1=1,APCLSUB=83 D CUML^APCLDM1
 .I APCLCUML,APCLMAM="" S APCLGOT1=0,APCLSUB=83 D CUML^APCLDM1
 .S D=$$FMDIFF^XLFDT(APCLED,APCLMAM),M=D/30.44
 .S A=^TMP("APCL",$J,503)
 .I M<25&(A>39)&(A<50)!(M<13&(A>49)) S ^TMP("APCL",$J,17.2)="YES" Q:'APCLCUML  S APCLGOT1=1,APCLSUB=24 D CUML^APCLDM1 Q
 .S ^TMP("APCL",$J,17.2)="NO" I APCLCUML S APCLGOT1=0,APCLSUB=24 D CUML^APCLDM1
 .Q
X4 I APCLER S ^TMP("APCL",$J,502)="***SCRIPT ERROR IN MAMMOG^APCLDM2.  CONTACT SITE MANAGER"
 Q
 ;
