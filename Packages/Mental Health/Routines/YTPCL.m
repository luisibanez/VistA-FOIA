YTPCL ;ALB/ASF TEST-PTST CHECKLISTS ;7/19/00  11:11
 ;;5.01;MENTAL HEALTH;**66**;Dec 30, 1994
 ;
 ;Reference to ^DIR supported by IA #10026
 ;
SCOR ;
 S YSTY="W*",YSNOITEM="DONE^YTPCL"
 D ^YTREPT
 S X=^YTD(601.2,YSDFN,1,YSET,1,YSED,1)
 S (B,C,D)=0
 F I=1:1:5 S Y=$E(X,I) S:(Y=3)!(Y=4)!(Y=5) B=B+1
 F I=6:1:12 S Y=$E(X,I) S:(Y=3)!(Y=4)!(Y=5) C=C+1
 F I=13:1:17 S Y=$E(X,I) S:(Y=3)!(Y=4)!(Y=5) D=D+1
ZZ W !!,"DSM-IV PTSD Criteria B ",$S(B>0:"IS met",1:"is NOT met")
 W !,"DSM-IV PTSD Criteria C ",$S(C>2:"IS met",1:"is NOT met")
 W !,"DSM-IV PTSD Criteria D ",$S(D>1:"IS met",1:"is NOT met")
 I (B>0)&(C>2)&(D>1) W !!,"*** PTSD Diagnosis IS SUGGESTED ***"
 W !!
 I IOST?1"C".E W ! S DIR(0)="E" D ^DIR Q:Y'=1
 D IR^YTREPT
 Q
SPTSD ;SCREENING REPORT
 D DTA^YTREPT
 W !!,?7,"Post Traumatic Stress Disorder Screen",!!
 S X=^YTD(601.2,YSDFN,1,YSET,1,YSED,1)
 W !,"Patient Reports "_$S($E(X,1)="Y":"HAVING",1:"NO")_" traumatic experiences.",!
 W:$E(X,2)="Y" !,"In the past month, the patient has been bothered by repeated, disturbing",!,"memories, thoughts, or images of one or more of the stressful events."
 W:$E(X,3)="Y" !,"In the past month, has felt distant or cut off from other people."
 W:$E(X,4)="Y" !,"Has been 'super alert' or watchful or on guard in the past month."
 W:$E(X,2,9)?.E1"Y".E !!,"Please refer to a mental health professional for further evaluation",!,"and treatment of probable PTSD"
 I IOST?1"C".E W ! S DIR(0)="E" D ^DIR Q:Y'=1
DONE QUIT
