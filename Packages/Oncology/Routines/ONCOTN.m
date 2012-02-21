ONCOTN ;Hines OIFO/GWB - TNM Staging ;9/27/93
 ;;2.11;ONCOLOGY;**1,3,6,7,11,15,19,22,25,28,29,35,36,37,41,42,43,44**;Mar 07, 1995
 N YR S YR=$E($P($G(^ONCO(165.5,D0,0)),U,16),1,3)
 S ONCOED=$S(YR<283:1,YR<288:2,YR<292:3,YR<298:4,YR<303:5,1:6)
 S S=$P(^ONCO(165.5,D0,0),U,1)
 S DATEDX=$P(^ONCO(165.5,D0,0),U,16)
 S ONCT=$P($G(^ONCO(165.5,D0,2)),U,1)
 I ONCT="" W !!?5,"Topography not Defined!!",! S Y=20 Q
 S ONCOH=$$HIST^ONCFUNC(D0)
 S Y=69
 ;
 I (S=62)!($$LYMPHOMA^ONCFUNC(D0)) D  S Y="@376" Q
 .W !!?5,"No TNM classification is available for Lymphoid Neoplasms.",!
 .D CTNM88,PTNM88
 ;
 S T=ONCT,H=ONCOH
 I (T=67301)!(T=67339)!(T=67379)!($E(T,1,4)=6739)!(T=67630)!(T=67631)!(T=67637)!(T=67638)!(T=67639)!(T=67691)!($E(T,1,4)=6774)!(T=67750)!(T=67754)!(T=67755)!(T=67758)!(T=67759)!($E(T,1,4)=6776)!($E(T,1,4)=6726) D  S Y="@313" Q
 .W !!?3,"AJCC does not define staging for this site.",!
 .D CTNM88,CSTG88,CSB,PTNM88,PSTG88,PSB
 I (T=67312)!(T=67313)!(T=67318)!(T=67319) D  S Y="@313" Q
 .W !!?3,"AJCC does not define staging for this site.",!
 .D CTNM88,CSTG88,CSB,PTNM88,PSTG88,PSB
 I (T=67254),($E(ONCOH,1,4)=8150)!($E(ONCOH,1,4)=8151)!($E(ONCOH,1,4)=8152)!($E(ONCOH,1,4)=8154)!($E(ONCOH,1,4)=8971) D  S Y="@313" Q
 .W !!?3,"AJCC does not define staging for this site and histology combination.",!
 .D CTNM88,CSTG88,CSB,PTNM88,PSTG88,PSB
 I ONCOED>5,$$MELANOMA^ONCOU55(D0),($E(T,3,4)=44)!($E(T,3,4)=51)!($E(T,3,4)=60)!(T=67632),(H=87233)!(H=87283)!(H=87303)!(H=87403)!(H=87412)!(H=87413)!(H=87463)!(H=87703)!(H=87733)!(H=87743)!(H=87422)!(H=87423) D  S Y="@313" Q
 .W !!?1,"Histology ",$E(H,1,4)_"/"_$E(H,5)," is not appropriate for or relevant to the staging of melanoma.",!
 .D CTNM88,CSTG88,CSB,PTNM88,PSTG88,PSB
 ;
 I (ONCT=67140)!(ONCT=67142)!(ONCT=67148),ONCOED>5 D   S Y="@313" Q 
 .W !!?3,"AJCC does not define staging for this site.",!
 .D CTNM88,CSTG88,CSB,PTNM88,PSTG88,PSB
 ;
 I ($E(ONCT,1,4)=6715)!($E(ONCT,1,4)=6716)!($E(ONCT,1,4)=6717)!($E(ONCT,1,4)=6718),$E(ONCOH,1,4)=8936,ONCOED>5 D   S Y="@313" Q 
 .W !!?1,"No TNM coding/staging available for GASTROINTESTINAL STROMA of ",$S($E(ONCT,1,4)=6715:"ESOPHAGUS",$E(ONCT,1,4)=6716:"STOMACH",$E(ONCT,1,4)=6717:"SMALL INTESTINE",$E(ONCT,1,4)=6718:"COLON",1:""),".",!
 .D CTNM88,CSTG88,CSB,PTNM88,PSTG88,PSB
 ;
 ;Carcinoid tumors
 I ($E(ONCT,1,4)=6716)!($E(ONCT,1,4)=6717)!(ONCT=67239)!($E(ONCT,1,4)=6724)!($E(ONCT,1,4)=6725),($E(ONCOH,1,4)=8240)!($E(ONCOH,1,4)=8241)!($E(ONCOH,1,4)=8242)!($E(ONCOH,1,4)=8243)!($E(ONCOH,1,4)=8249)!($E(ONCOH,1,4)=9091) D   S Y="@313" Q 
 .W !!?1,"No TNM coding/staging available for carcinoid tumors" D
 ..W !," of the ",$S($E(ONCT,1,4)=6716:"STOMACH",$E(ONCT,1,4)=6717:"SMALL INTESTINE",ONCT=67239:"GALLBLADDER",ONCT=67241:"AMPULLA OF VATER",$E(ONCT,1,4)=6724:"EXTRAHEPATIC BILE DUCTS",$E(ONCT,1,4)=6725:"EXOCRINE PANCREAS",1:""),".",!
 .D CTNM88,CSTG88,CSB,PTNM88,PSTG88,PSB
 ;
 ;Fallopian Tube (C57.0) - 3rd and 4th editions
 ;Other/unspecified female genitalia (C57.1-C57.9)
 I ((ONCT=67570)&(ONCOED<5))!(($E(ONCT,1,4)=6757)&(ONCT'=67570)) D  S Y="@313" Q
 .W !!?3,"AJCC does not define staging for this site.",!
 .D CTNM88,CSTG88,CSB,PTNM88,PSTG88,PSB
 ;
 ;C68.1 Paraurethral gland - 6th Edition
 ;C68.8 Overlapping lesion of urinary organs - 6th Edition
 ;C68.9 Urinary system, NOS - 6th Edition
 I ((ONCT=67681)!(ONCT=67688)!(ONCT=67689)),ONCOED>5 D  S Y="@313" Q
 .W !!?3,"AJCC does not define staging for this site.",!
 .D CTNM88,CSTG88,CSB,PTNM88,PSTG88,PSB
 ;
 ;Malignant Melanoma of the Eyelid - 3rd and 4th editions
 I ONCT=67441,$$MELANOMA^ONCOU55(D0),ONCOED<5 D  S Y=37.2 Q
 .W !!?6,"No classification is recommended at present.",!
 .S $P(^ONCO(165.5,D0,2),U,25)=88
 .W !,"CLINICAL T: T88 NA"
 ;
 ;Brain and Spinal Cord
 I (ONCT=67700)!(ONCT=67701)!(ONCT=67709)!(ONCT=67751)!(ONCT=67752)!(ONCT=67753)!($E(ONCT,3,4)=71)!($E(ONCT,3,4)=72),ONCOED>4 D  S Y="@313" Q
 .W !!?5,"Central Nervous System Tumors have no TNM designation.",!
 .D CTNM88,CSTG88,CSB,PTNM88,PSTG88,PSB
 ;
 ;Mycosis fungoides and Sezary Disease of Skin, Vulva, Penis, Scrotum
 ;9700/3 and 9701/3
 ;C44.0-C44.9, C51.0-C51.2, C51.8-C51.9, C60.0-C60.2, C60.8-C60.9, C63.2
 I (ONCOH=97003)!(ONCOH=97013),($E(ONCT,3,4)=44)!($E(ONCT,3,4)=51)!($E(ONCT,3,4)=60)!(ONCT=67632),ONCOED>5 Q
 ;
 ;Kaposi's sarcoma
 I ONCOH=91403 D  S Y="@313" Q
 .W !!?5,"No TNM classification or staging is available for Kaposi's sarcoma.",!
 .D CTNM88,CSTG88,CSB,PTNM88,PSTG88,PSB
 ;
 I $P(^ONCO(164,ONCT,0),U,11)="" D  S Y="@313" Q
 .W !!?5,"No stage grouping is presently recommended.",!
 .D CTNM88,CSTG88,CSB,PTNM88,PSTG88,PSB
 Q
 ;
CN1 ;No longer needed. Called by PCE routines
 Q
 ;
CN2 ;Gestational Trophoblastic Tumors - clinical
 S ONCT=$P($G(^ONCO(165.5,D0,2)),U,1)
 I ONCT=67589 D  S Y=37.3 Q
 .W !!,"  Regional lymph node (N) classification does not apply to these tumors.",!
 .S $P(^ONCO(165.5,D0,2),U,26)=88
 .W !,"CLINICAL N: N88 NA"
 Q
 ;
CN3 ;No longer needed. called by PCE routines
 Q
 ;
CN4 ;Gestational Trophoblastic Tumors - pathologic
 S ONCT=$P($G(^ONCO(165.5,D0,2)),U,1)
 I ONCT=67589 D  S Y=87 Q
 .W !!,"   Regional lymph node (N) classification does not apply to these tumors.",!
 .S $P(^ONCO(165.5,D0,2.1),U,2)=88
 .W !,"PATHOLOGIC N: N88 NA"
 Q
 ;
CN5 ;Gestational Trophoblastic Tumors - other
 S ONCT=$P($G(^ONCO(165.5,D0,2)),U,1)
 I ONCT=67589 D  S Y=99 Q
 .W !!,"   Regional lymph node (N) classification does not apply to these tumors.",!
 .S $P(^ONCO(165.5,D0,2.1),U,7)=88
 .W !,"OTHER N: N88 NA"
 Q
 ;
RECN ;Gestational Trophoblastic Tumors - Subsequent Recurrences - other
 S ONCT=$P($G(^ONCO(165.5,D0,2)),U,1)
 I ONCT=67589 D  S Y=3 Q
 .W !!,"   Regional lymph node (N) classification does not apply to these tumors.",!
 .S $P(^ONCO(165.5,D0,23,D1,0),U,8)=88
 .W !,"OTHER N: N88 NA"
 Q
 ;
ES ;Automatic Staging
 N YR S YR=$E($P($G(^ONCO(165.5,D0,0)),U,16),1,3)
 S ONCOED=$S(YR<283:1,YR<288:2,YR<292:3,YR<298:4,YR<303:5,1:6)
 I ONCOED<3 D  Q
 .W !!,"DATE DX prior to 1988.  Automatic staging unavailable.",!
 S STGTYP=$S(STGIND="C":"CLINICAL",STGIND="P":"PATHOLOGIC",STGIND="O":"OTHER",STGIND="R":"RECURRENCE",1:"")
 S XX=$G(^ONCO(165.5,D0,2))
 G EX:XX=""
 S ST=$P(^ONCO(165.5,D0,0),U,1)
 S G=$P(^ONCO(165.5,D0,2),U,5)
 S TX=$P(^ONCO(165.5,D0,2),U,1)
 S HT=$$HIST^ONCFUNC(D0)
 S SP=$P($G(^ONCO(164,+TX,0)),U,11)
 I STGIND="C" D
 .S XXX=$G(^ONCO(165.5,D0,2))
 .S T=$P(XXX,U,25)
 .S N=$P(XXX,U,26)
 .S M=$P(XXX,U,27)
 I STGIND="P" D
 .S XXX=$G(^ONCO(165.5,D0,2.1))
 .S T=$P(XXX,U,1)
 .S N=$P(XXX,U,2)
 .S M=$P(XXX,U,3)
 I STGIND="O" D
 .S XXX=$G(^ONCO(165.5,D0,2.1))
 .S T=$P(XXX,U,6)
 .S N=$P(XXX,U,7)
 .S M=$P(XXX,U,8)
 I STGIND="R" D
 .S XXX=$G(^ONCO(165.5,D0,23,DA,0))
 .S T=$P(XXX,U,6)  ;Subsequent recurrence
 .S N=$P(XXX,U,7)
 .S M=$P(XXX,U,8)
 I T="" D  G SG
 .W !!?5,"No ",STGTYP," T category has been assigned."
 .S SG=99
 I N="",ST'=58 D  G SG
 .W !!?5,"No ",STGTYP," N category has been assigned."
 .S SG=99
 I M="" D  G SG
 .W !?5,"No ",STGTYP," M category has been assigned."
 .S SG=99
 ;
 ;Malignant Melanoma of the Eyelid (C44.1) - 3rd and 4th editions
 I TX=67441,ONCOED<5,$$MELANOMA^ONCOU55(D0) S AG=37 G AG
 ;
 ;Melanoma of the Skin
 I $$MELANOMA^ONCOU55(D0),$P($G(^ONCO(164,+TX,0)),U,15) S AG=22 G AG
 ;
 ;Gestational Trophoblastic Tumors
 I TX=67589 S AG=54 G AG
 ;
 ;Urethra (C68.9)
 ;Urothelial (Transitional Cell) Carcinoma of the Prostate
 I ONCOED>4,TX=67619,(HT=81203)!(HT=81303)!(HT=81223)!(HT=81202) D  G AG
 .S AG=35
 ;
 ;Malignant Melanoma of the Conjunctiva
 I $$MELANOMA^ONCOU55(D0),TX=67690 S AG=39 G AG
 ;
 ;Malignant Melanoma of the Uvea
 I $$MELANOMA^ONCOU55(D0),((TX=67693)!(TX=67694)) S AG=40 G AG
 ;
 ;Lymphoid Neoplasms
 ;Mycosis fungoides (9700/3) - 6th edition
 ;Sezary Disease    (9701/3) - 6th edition
 I ONCOED>5,(HT=97003)!(HT=97013) S AG=55 G AG
 ;
 S AG=$P($G(^ONCO(164,+TX,0)),U,12)
 ;
AG ;DO appropriate staging subroutine
 S SG=99
 I T=88,N=88,M=88 S SG=88 G SG
 D @(AG_"^ONCOTN0")
 W:SG=99 !!,?12,"TNM combination not in staging table."
 ;
SG ;Computed stage
 I STGIND="C" S $P(^ONCO(165.5,D0,2),U,20)=SG
 I STGIND="P" S $P(^ONCO(165.5,D0,2.1),U,4)=SG
 I STGIND="O" S $P(^ONCO(165.5,D0,2.1),U,9)=SG
 I STGIND="R" S $P(^ONCO(165.5,D0,23,DA,0),U,9)=SG
 I SG'="" S X=SG D KSG^ONCOCRC D
 .I STGIND="C" D CSSG^ONCOCRC Q
 .I STGIND="P" D PSSG^ONCOCRC Q
 W !!?12,"Computed "_$S(STGIND="C":"CLINICAL",STGIND="P":"PATHOLOGIC",STGIND="O":"OTHER",STGIND="R":"RECURRENCE",1:"")," STAGE GROUPING: ",$$SGOUT^ONCOTNO(D0),!
EX Q
 ;
CTNM88 ;CLINICAL TNM 88
 S $P(^ONCO(165.5,D0,2),U,25)=88
 S $P(^ONCO(165.5,D0,2),U,26)=88
 S $P(^ONCO(165.5,D0,2),U,27)=88
 W !,"CLINICAL T: T88 NA"
 W !,"CLINICAL N: N88 NA"
 W !,"CLINICAL M: M88 NA",!
 Q
 ;
CSB I DATEDX>2951231 D
 .S $P(^ONCO(165.5,D0,3),U,32)=0
 .W !,"STAGED BY (CLINICAL STAGE): Not staged",!
 Q
 ;
PTNM88 ;PATHOLOGIC TNM 88
 S $P(^ONCO(165.5,D0,7),U,17)="N"
 S $P(^ONCO(165.5,D0,2.1),U,1)=88
 S $P(^ONCO(165.5,D0,2.1),U,2)=88
 S $P(^ONCO(165.5,D0,2.1),U,3)=88
 W !,"MULTIMODALITY THERAPY (PATH): NO"
 W !,"PATHOLOGIC T: T88 NA"
 W !,"PATHOLOGIC N: N88 NA"
 W !,"PATHOLOGIC M: M88 NA",!
 Q
 ;
PSB I DATEDX>2951231 D
 .S $P(^ONCO(165.5,D0,2.1),U,5)=0
 .W !,"STAGED BY (PATHOLOGIC STAGE): Not staged",!
 Q
 ;
CSTG88 ;CLINICAL STAGE 88
 S $P(^ONCO(165.5,D0,2),U,20)=88
 W !,"STAGE GROUP CLINICAL: NA",!
 S TMP=$G(X),X=88 D CSSG^ONCOCRC S X=TMP
 Q
 ;
PSTG88 ;PATHOLOGIC STAGE 88
 S $P(^ONCO(165.5,D0,2.1),U,4)=88
 W !,"STAGE GROUP PATHOLOGIC: NA",!
 S TMP=$G(X),X=88 D PSSG^ONCOCRC S X=TMP
 Q
