BLRUTIL3 ;IHS/OIT/MKK - MISC IHS LAB UTILITIES (Cont) ;JUL 06, 2010 3:14 PM
 ;;5.2;IHS LABORATORY;**1025,1027**;NOV 01, 1997
 ;
 Q
 ;
 ; ----- BEGIN IHS/OIT/MKK LR*5.2*1025
GETACCCP(LRAS,LRAA,LRAD,LRAN) ; EP -- Take Accession # & break apart
 ; Parse and process user input.  Cloned from LRWU4.
 NEW LRIDIV,LRQUIT,LRX,X1,X2,X3
 S LRX=LRAS
 ;
 S (LRAA,LRAD,LRAN)=""
 ;
 S (X1,X2,X3)="",X1=$P(LRX," ",1),X2=$P(LRX," ",2),X3=$P(LRX," ",3)
 S:X3=""&(+X2=X2) X3=X2,X2=""
 I X1'?1A.AN Q 0
 ;
 S LRAA=$O(^LRO(68,"B",X1,0))
 I LRAA<1 Q 0
 ;
 ; S %=$P(^LRO(68,LRAA,0),U,14)     ; Don't bother with Security Check
 ; I $L(%),'$D(^XUSEC(%,DUZ)) Q 0   ; Don't bother with Security Check
 ;
 S LRX=$G(^LRO(68,LRAA,0)),LRIDIV=$S($L($P(LRX,U,19)):$P(LRX,U,19),1:"CP")
 ;
 ; Only accession area identifier, no date or number
 I X2="",X3="" D
 . N %DT
 . S %DT="AP",%DT("A")="  Accession Date: ",%DT("B")="TODAY"
 . ; D DATE^LRWU
 . ; D DATE
 . I $D(DUOUT) Q
 . I Y<1 Q
 . S LRAD=Y
 ;
 ; Convert middle value to FileMan date
 ; Adjust for monthly and quarterly formats (MM00) if user enters 4 digit 
 ; number as middle part of accession then convert to appropriate date.
 I +$G(LRAD)<1 D
 . N %DT
 . I X2="" S X2=DT
 . I X2?4N D
 . . S X2=$E(DT,1,3)_X2
 . . I X2>DT S X2=X2-10000
 . S %DT="P",X=X2
 . D ^%DT
 . I Y>0 S LRAD=Y Q
 I +$G(LRAD)<1 Q 0
 ;
 ; Convert date entered to apropriate date for accession area transform
 S X=$P(^LRO(68,LRAA,0),U,3)
 S LRAD=$S("D"[X:LRAD,X="Y":$E(LRAD,1,3)_"0000","M"[X:$E(LRAD,1,5)_"00","Q"[X:$E(LRAD,1,3)_"0000"+(($E(LRAD,4,5)-1)\3*300+100),1:LRAD)
 ; W:X3>0 "  ",+X3
 ;
 I X3="",$D(LRACC) D
 . N DIR,DIRUT,DUOUT,DTOUT,X,Y
 . S DIR(0)="NO^1:999999",DIR("A")="  Number part of Accession"
 . D ^DIR
 . I Y=""!$D(DIRUT) Q
 . S X3=Y
 ;
 I X3="",$D(LRACC) Q 0
 S LRAN=+X3
 Q 1
 ;
DATE ;
 K DTOUT,DUOUT S LREND=0
 W !,"DATE",!!,$S($D(%DT("A")):%DT("A"),1:"DATE: "),$S($D(%DT("B")):%DT("B"),1:"TODAY"),"//" R X:DTIME S:X="^" DUOUT=1 S:'$T X="^",DTOUT=1 I $D(DUOUT)!($D(DTOUT)) S LREND=1,Y=-1 Q
 S:X="" X=$S($D(%DT("B")):%DT("B"),1:"T") S:$D(%DT)[0 %DT="E" S:%DT["A" %DT=$P(%DT,"A",1)_$P(%DT,"A",2) S:%DT'["E" %DT="E"_%DT D ^%DT G DATE:X="?"!(Y<1)
 K %DT
 Q
 ;
D2HBOLD(STR) ; EP - Write string DOUBLE HEIGHT & BOLDED
 W !
 W *27,"#3",*27,"[1m",STR,!
 W *27,"#4",*27,"[1m",STR,!
 W *27,"[0m",!                ; Turn OFF all attributes
 Q
 ;
BOLDUNDR(STR) ; EP -- Write string BOLDED & UNDERLINED
 W *27,"[1;4m",STR,*27,"[0m"
 Q
 ;
REVIDEO(STR) ; EP -- Write string in Reverse Video & BOLDED
 W *27,"[1;7m",STR,*27,"[0m"
 Q
 ; ----- END IHS/OIT/MKK LR*5.2*1025
 ; 
 ; ----- BEGIN IHS/OIT/MKK LR*5.2*1027
ESIGINFO ;EP -- Rework of BLRUTIL ESIGINFO subroutine.
 NEW DOCDUZ,DOCIEN,ESIGDSTR,REVIEWDV,TAB
 NEW REVSTS
 ;
 ; If E-SIG not turned on, Quit
 I '$$ADDON^BLRUTIL("LR*5.2*1013","BLRALAF",+$G(DUZ(2))) Q
 ;
 S DOCIEN=$O(^VA(200,"B",LRDOC,""))      ; LRDOC = Ordering Provider
 ;
 ; If no IEN, Quit. Usually happens when LRDOC="Unknown"
 Q:$G(DOCIEN)=""
 ;
 I '($D(^BLRALAB(9009027.1,DOCIEN,0))#2) W ?56,"NOT E-SIG PARTICIPATING"  Q
 I $P(^BLRALAB(9009027.1,DOCIEN,0),U,7)'="A" W ?53,"INACTIVE E-SIG PARTICIPANT"  Q
 ;
 ;LRSS doesn't exist when doing option 'BLRTASK CUM', so set it.
 S:$G(LRSS)="" LRSS=$P($G(^LRO(68,LRAA,0)),"^",2)
 ;
 S ESIGDSTR=$G(^LR(LRDFN,LRSS,LRIDT,9009027))           ; E-SIG string Data
 ;
 Q:$P(ESIGDSTR,U,2)=""                                  ; NO Signing Physician
 Q:$P(^BLRALAB(9009027.1,$P(ESIGDSTR,U,2),0),U,7)'="A"  ; NOT Active
 ;
 ; REVIEW status Data Values
 S REVIEWDV=$$UP^XLFSTR($P($G(^DD(63.04,.9009025,0)),U,3))
 S REVSTS=$P($P(REVIEWDV,$P(ESIGDSTR,U)_":",2),";")
 ;
 ; Make sure E-SIG STATUS is flush right
 S TAB=IOM-(16+$L(REVSTS))
 W ?TAB,"E-SIG STATUS: ",REVSTS
 ;
 Q:'$P(ESIGDSTR,U,5)                                    ; NO Signed Date
 ;
 Q:REVSTS["NOT REV"                                     ; NOT Reviewed
 ;
 W !?5,"SIGNING PHYSICIAN: "
 W $P($G(^VA(200,$P(ESIGDSTR,U,2),0)),U)
 W !?5,"DATE/TIME RESULT SIGNED: "
 W $TR($$FMTE^XLFDT($P(ESIGDSTR,U,5),"2MZ"),"@"," ")
 Q
 ;
BLINKER(STR) ; EP -- Write string in BOLDED, UNDERLINED, & BLINKING
 W *27,"[1;4;5m",STR,*27,"[0m"
 Q
 ;
 ; Cloned from LR7OSAP1.  Wrap Text in array to ^TMP global
WRAP(ROOT,FMT) ;Wrap text
 I '$L($G(ROOT)) Q ""
 N CCNT,GCNT,INC,LRI,LRINDX,LRTX,SP,X
 S:'$G(FMT) FMT=79
 S LRINDX=0,LRI=0,GCNT=0
 K ^TMP("BLRUTIL3",$J)
 F  S LRI=$O(@ROOT@(LRI)) Q:LRI'>0  D
 . S X=$S($L($G(@ROOT@(LRI))):@ROOT@(LRI),$L($G(@ROOT@(LRI,0))):@ROOT@(LRI,0),1:""),LRINDX=LRINDX+1
 . S X=$$FMT^LR7OSAP1(FMT,.LRINDX,X)
 S LRI=0
 F  S LRI=$O(LRTX(LRI)) Q:'LRI  D LN^LR7OSAP S ^TMP("BLRUTIL3",$J,GCNT,0)=$$S^LR7OS(1,CCNT,LRTX(LRI))
 Q
 ;
 ;
ALERT ; EP
 W !!
 W "Patient Name:",$P(XQADATA,"^"),!
 W "         UID:",$P(XQADATA,"^",2),!
 W "        TEST:",$P(XQADATA,"^",3),!!
 Q
 ; ----- END IHS/OIT/MKK LR*5.2*1027
