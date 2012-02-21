XQ3 ;LL/THM,SF/GJL,SEA/JLI - CLEANUP DANGLING POINTERS IN OPTION OR HELP FRAME FILES ;04/21/98  13:20
 ;;8.0;KERNEL;**80**;Jul 10, 1995
 Q
ENASK ;Ask to fix up dirty OPTION/HELP FRAME File
 I '$D(%) W !,$C(7),"ENTRY MUST BE WITH THE VARIABLE '%' SET TO INDICATE DESIRED FILE.",$C(7),! Q
 S XQFL=$S(%=1:"OPTION",%=2:"PROTOCOL",1:"HELP FRAME")
 W !,"Do you want to remove any 'Dangling Pointers' from your ",XQFL," File?  Y// " R X:$S($D(DTIME):DTIME,1:300) I '$T Q
 W ! I X="" S X="Y"
 I X["?" G SYNTAX
 I X["^" S X="^" Q
STRIP I X'="",X'?1A.E S X=$E(X,2,256) G STRIP
 S X=$E(X,1) I X="" G SYNTAX
 I "Nn"[X S X="N" Q
 I "Yy"[X W !,"PLEASE WAIT while I check this out . . . " G REMOVE
SYNTAX W ! I X'["?" W ?11,"I'm sorry, but I don't understand your answer. Please"
 W !,"Enter: YES (or press the RETURN key) if you want me to remove from"
 W !,?11,"your ",XQFL," File any pointers left over from incompletely"
 W !,?11,"deleted ",XQFL,". If such pointers do exist and are not"
 W !,?11,"removed, the ",XQFL," File (i.e. the menus) could become"
 W !,?11,"messed up by an INIT."
 W !!,"Enter:  NO or ^ to continue on without effecting the ",XQFL," File."
 W ! G ENASK
REMOVE D:%=1 ENFIX D:%=2 PFIX D:'% HFFIX W !,"Your ",XQFL," File is OK " I 'X W "(no bad pointers)."
 E  W "now (",X," pointer" W:X>1 "s" W " fixed)."
 W ! S X="Y" Q
ENFIX ;Kill any dangling pointers in the OPTION File (#19)
 S (I,X)=0 ;X=Total Deletions
L1 S I=$O(^DIC(19,I)) I I>0 S (Y,J)=0 G L2 ;Loop through menus
 Q
L2 S J=$O(^DIC(19,I,10,J)) I J>0 G ITEM ;Loop through menu items
 I '$D(^DIC(19,I,10,0)) G L1
 S (K,J)=0 F L=1:1 S J=$O(^DIC(19,I,10,J)) Q:J'>0  S K=J ;K=Last item
 S J=^DIC(19,I,10,0),^(0)=$P(J,"^",1,2)_"^"_K_"^"_Y ;fix counters
 G XREFS
ITEM S K=+^DIC(19,I,10,J,0) I $D(^DIC(19,K,0)) S Y=Y+1 G L2 ;Y=No. of items
 W !,"Option ",$P(^DIC(19,I,0),U,1)," points to missing option ",K
 S X=X+1 K ^DIC(19,I,10,J) ;Kill invalid menu item
 G L2
XREFS S K=":"
L3 S K=$O(^DIC(19,I,10,K)) I K="" G L1 ;Loop through cross references
 S L=-1
L4 S L=$O(^DIC(19,I,10,K,L)) I L="" G L3
 S J=0
L5 S J=$O(^DIC(19,I,10,K,L,J)) I J'>0 G L4
 I '$D(^DIC(19,I,10,J,0)) G KILLXR ;kill xref to invalid item
L6 S M=^DIC(19,I,10,J,0) I (M=L)!(M[L_"^") G L5
KILLXR K ^DIC(19,I,10,K,L,J) I $O(^DIC(19,I,10,K,L,-1))="" K ^DIC(19,I,10,K,L)
 G L5
HFFIX ; Fix dangling pointers on help frame file
 S (X,I)=0 F  S I=$O(^DIC(9.2,I)) Q:I'>0  I $D(^(I,2)) D HF1,HF2,HF3
 Q
HF1 S (Y,J)=0 F  S J=$O(^DIC(9.2,I,2,J)) Q:J'>0  I $D(^(J,0)) S K=$P(^(0),U,2),Y=Y+1 I $L(K),'$D(^DIC(9.2,K)) S Y=Y-1,X=X+1 K ^DIC(9.2,I,2,J,0)
 Q
HF2 S (K,J)=0 F  S J=$O(^DIC(9.2,I,2,J)) Q:J'>0  S K=J
 S J=^DIC(9.2,I,2,0),^(0)=$P(J,U,1,2)_U_K_U_Y
 Q
HF3 S K=":" F  S K=$O(^DIC(9.2,I,2,K)) Q:K=""  S J=-1 F  S J=$O(^DIC(9.2,I,2,K,J)) Q:J=""  D HF4
 Q
HF4 S JJ=0 F  S JJ=$O(^DIC(9.2,I,2,K,J,JJ)) Q:JJ'>0  I '$D(^DIC(9.2,I,2,JJ,0)) K ^DIC(9.2,I,2,K,J,JJ)
 Q
PFIX ;Kill any dangling pointers in the PROTOCOL File (#101)
 S (I,X)=0 ;X=Total Deletions
P1 S I=$O(^ORD(101,I)) I I>0 S (Y,J)=0 G P2 ;Loop through protocols
 Q
P2 S J=$O(^ORD(101,I,10,J)) I J>0 G PITEM ;Loop through items
 I '$D(^ORD(101,I,10,0)) G P1
 S (K,J)=0 F L=1:1 S J=$O(^ORD(101,I,10,J)) Q:J'>0  S K=J ;K=Last item
 S J=^ORD(101,I,10,0),^(0)=$P(J,"^",1,2)_"^"_K_"^"_Y ;fix counters
 G PXREFS
PITEM S K=+^ORD(101,I,10,J,0) I $D(^ORD(101,K,0)) S Y=Y+1 G P2 ;Y=No. of items
 W !,"Option ",$P(^ORD(101,I,0),U,1)," points to missing option ",K
 S X=X+1 K ^ORD(101,I,10,J) ;Kill invalid menu item
 G P2
PXREFS S K=":"
P3 S K=$O(^ORD(101,I,10,K)) I K="" G P1 ;Loop through cross references
 S L=-1
P4 S L=$O(^ORD(101,I,10,K,L)) I L="" G P3
 S J=0
P5 S J=$O(^ORD(101,I,10,K,L,J)) I J'>0 G P4
 I '$D(^ORD(101,I,10,J,0)) G PKILLXR ;kill xref to invalid item
P6 S M=^ORD(101,I,10,J,0) I (M=L)!(M[L_"^") G P5
PKILLXR K ^ORD(101,I,10,K,L,J) I $O(^ORD(101,I,10,K,L,-1))="" K ^ORD(101,I,10,K,L)
 G P5
