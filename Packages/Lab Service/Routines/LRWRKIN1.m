LRWRKIN1 ;SLC/DCM/CJS-LRWRKINC, CONT ;2/22/87  11:39 AM [ 04/23/2003  9:02 AM ]
 ;;5.2;LR;**1004,1006,1018,1022**;September 20, 2007
 ;;5.2;LAB SERVICE;**153,201,221**;Sep 27, 1994
LST1 ;EP - from LRWRKINC
 S (LRDLC,LRDTO)=""
 S LRDX=$G(^LRO(68,LRAA,1,LRAD,1,LRAN,0))
 S LRCE=$G(^LRO(68,LRAA,1,LRAD,1,LRAN,.1))
 S LRACC=$G(^LRO(68,LRAA,1,LRAD,1,LRAN,.2))
 S LRDX(0)=$G(^LR(+LRDX,0))
 S LRDPF=$P(LRDX(0),U,2),DFN=$P(LRDX(0),U,3) D PT^LRX
 I $P(LRDX,U,4) S LRDTO=$$FMTE^XLFDT($P(LRDX,"^",4),"5MZ")
 S Y=$G(^LRO(68,LRAA,1,LRAD,1,LRAN,3)),LRDLA=$P(Y,U,3),LRACO=$P(Y,U,6)
 I $P(Y,"^") S LRDLC=$$FMTE^XLFDT($P(U,"^"),"5MZ")
 I LRDLA S $P(LRDLA,"^",2)=$$FMTE^XLFDT(LRDLA,"5MZ")
 Q
 ;
X ;EP - from LRWRKINC
 N LRTSTN,LRACC,LRACCN,LRAN,LRUR
 S LRTSTN="",LREND=0
 F  S LRTSTN=$O(^TMP($J,LRTSTN)) Q:LRTSTN=""  D  Q:LREND
 . S J=0,LRUR=""
 . F  S LRUR=$O(^TMP($J,LRTSTN,LRUR)) Q:LRUR=""  S LRU=$G(LRURG(LRUR)) D  Q:LREND
 . . S LRACCN=""
 . . F  S LRACCN=$O(^TMP($J,LRTSTN,LRUR,LRACCN)) Q:LRACCN=""  D  Q:LREND
 . . . S LRAN=""
 . . . F  S LRAN=$O(^TMP($J,LRTSTN,LRUR,LRACCN,LRAN)) Q:LRAN=""  D  Q:LREND
 . . . . I ($Y+8)>IOSL D  Q:LREND
 . . . . . D EQUALS^LRX
 . . . . . I $E(IOST,1,2)="C-" D WAIT Q:LREND
 . . . . . D HED
 . . . . S J=J+1
 . . . . ;S W=^TMP($J,LRTSTN,LRUR,LRACCN,LRAN),LRST=$P(W,U,1),SSN=$P(W,U,2),PNM=$P(W,U,3),LRLLOC=$P(W,U,4),LRCOLL=$P(W,U,5),LRMAN=$P(W,U,6),LRACC=$P(W,U,7)
 . . . .;----- BEGIN IHS MODIFICATION LR*5.2*1018
 . . . . S W=^TMP($J,LRTSTN,LRUR,LRACCN,LRAN),LRST=$P(W,U,1),HRCN=$P(W,U,2),PNM=$P(W,U,3),LRLLOC=$P(W,U,4),LRCOLL=$P(W,U,5),LRMAN=$P(W,U,6)  ;IHS/ANMC/CLS 08/18/96
 . . . .;----- END IHS MODIFICATIONS
 . . . . ;W !,$E($S(LRSORTBY=1:$P(LRTSTN,"^",2),1:LRTSTN),1,20),?23,$E(LRU,1,9),?34,LRACCN,?47," ",LRCOLL,?65,$E(LRLLOC,1,15)
 . . . . ;S LRCL=$S(IOM<120:5,1:82) W:IOM<120 ! I IOM<120!('LREXD) W ?LRCL,SSN
 . . . .;----- BEGIN IHS MODIFICATIONS LR*5.2*1018
 . . . .;W !,$E($S(LRSORTBY=1:$P(LRTSTN,"^",2),1:LRTSTN),1,20),?23,$E(LRU,1,9),?34,LRACCN_" "_LRAN,?47,"  ",LRCOLL,?65,$E(LRLLOC,1,15)
 . . . .;----- BEGIN IHS/OIT/MKK - MOD LR*5.2*1022
 . . . .W !,$E($S(LRSORTBY=1:$P(LRTSTN,"^",2),1:LRTSTN),1,20)
 . . . .W ?23,$E(LRU,1,9)
 . . . .W ?34,LRACCN_" "_LRAN
 . . . .W ?47,"  ",LRCOLL
 . . . .W ?67,$E(LRLLOC,1,15)     ; "Move" Location 2 to the right (from 65 to 67)
 . . . .;----- END IHS MODIFICATIONS LR*5.2*1018
 . . . .S LRCL=$S(IOM<120:5,1:82) W:IOM<120 ! I IOM<120!('LREXD) W ?LRCL,HRCN  ;IHS/ANMC/CLS 08/18/96 
 . . . .;----- END IHS MODIFICATIONS
 . . . . S LRCL=$S(IOM<120:20,LREXD:82,1:97) W ?LRCL,$E(PNM,1,19)
 . . . . S LRCL=$S(IOM<120:40,LREXD:102,1:117) W ?LRCL,$S('LREXD&(IOM'<120):$E(LRST,1,15),1:$E(LRST,1,30))
 . . . . I LREXD D
 . . . . . N A
 . . . . . S A=$G(^TMP($J,LRTSTN,LRUR,LRACCN,LRAN,.3))
 . . . . . S Y=$P(A,"^",2) I Y S C=$P(^DD(68.02,16.1,0),"^",2) D Y^DIQ
 . . . . . ;W !,?23,$P(A,"^"),?48,$E(Y,1,16),?65,$P(A,"^",5) I IOM'<120 W ?82,SSN
 . . . . . ;----- BEGIN IHS MODIFICATIONS LR*5.2*1018
 . . . . . ; W !,?23,$P(A,"^"),?48,$E(Y,1,16),?65,$P(A,"^",5) I IOM'<120 W ?82,HRCN  ;IHS/DIR TUC/AAB 06/23/98
 . . . . . ;----- END IHS MODIFICATIONS
 . . . . . ;----- BEGIN IHS/OIT/MKK - MOD LR*5.2*1022
 . . . . . W !,?23,$P(A,"^")
 . . . . . W ?48,$E(Y,1,16)
 . . . . . W ?67,$P(A,"^",5)      ; "Move" Location 2 to the right (from 65 to 67)
 . . . . . I IOM'<120 W ?82,HRCN  ;IHS/DIR TUC/AAB 06/23/98
 . . . . . ;----- END IHS/OIT/MKK - MOD LR*5.2*1022
 . . . . . W:IOM<120 ! S LRCL=$S(IOM<120:20,1:102) W ?LRCL,LRMAN
 . W:'LREND !,?7,"------",!,$J(J,13)
 Q
 ;
HED ; EP - Print header
 I LRPAGE!($E(IOST,1,2)="C-") W @IOF
 S LRPAGE=LRPAGE+1
 W "INCOMPLETE STATUS REPORT  *** NOT FOR WARD USE ***",?(IOM-16),LRDT
 W !,"Accession Area(s):",?(IOM-10),"Page: ",LRPAGE
 S LRINDEX=0
 F  S LRINDEX=$O(LRNAME(LRINDEX)) Q:'LRINDEX  W !,LRNAME(LRINDEX)
 ; W !!,"Test",?23,"Urgency",?34,"Accession",?48,"Date/time",?65,"Location"
 ;----- BEGIN IHS/OIT/MKK - MOD LR*5.2*1022
 W !!,"Test"
 W ?23,"Urgency"
 W ?34,"Accession"
 W ?48,"Date/time"
 W ?67,"Location"       ; "Move" Location 2 to the right (from 65 to 67)
 ;----- END IHS/OIT/MKK - MOD LR*5.2*1022
 ;
 S LRCL=$S(IOM<120:5,1:82)
 W:IOM<120 !
 ;I IOM<120!('LREXD) W ?LRCL,"SSN"
 ;----- BEGIN IHS MODIFICATIONS LR*5.2*1018
 I IOM<120!('LREXD) W ?LRCL,"HCRN"  ;IHS/ANMC/CLS 08/18/96
 ;----- END IHS MODIFICATIONS
 S LRCL=$S(IOM<120:20,LREXD:82,1:97) W ?LRCL,"Patient"
 S LRCL=$S(IOM<120:40,LREXD:102,1:117) W ?LRCL,"Status"
 I $G(LREXD) W !,?23,"UID",?48,"Sending Site",?65,"Sender's UID"
 ;I LREXD,IOM'<120 W ?82,"SSN"
 ;----- BEGIN IHS MODIFICATIONS LR*5.2*1018
 I LREXD,IOM'<120 W ?82,"HCRN"  ;IHS/ANMC/CLS 08/18/96
 ;----- END IHS MODIFICATIONS
 I LREXD W:IOM<120 ! S LRCL=$S(IOM<120:20,1:102) W ?LRCL,"Shipping Manifest"
 D DASH^LRX
 W !
 Q
 ;
WAIT ;EP - from LRWRKINC
 I $E(IOST,1,2)'="C-" Q
 N DIR,DIRUT,DTOUT,DUOUT,X,Y
 S DIR(0)="E" D ^DIR
 I $D(DIRUT) S LREND=1
 Q
 ;
LREND ; EP
 I $E(IOST,1,2)="P-" W @IOF
 I $D(ZTQUEUED) S ZTREQ="@"
 E  D ^%ZISC
 D KVA^VADPT
 K %,%DT,%X,%Y,%ZIS,A,AGE,B,C,DIC,DICS,DFN,DOB,I,K,J,L,LAST,PNM,POP,SEX,SSN,W,X,X1,X2,Y,Z,ZTSK
 K LRCNT,LRCUTOFF,LRDLA,LRDLC,LRDX,LRLO69,LRSAMP
 K LRRB,LRSPEC,LRTREA,LRURG,LRWRD,LRCOLL,LRACO
 K LRAA,LRACC,LRAD,LRAN,LRNAC,LRCE,LRDPF,LRSN,LRDTO,LRINDEX
 K LREXNREQ,LRPAGE,LRPRAC,LRSORTBY,LRSTAR,LRX
 K LA,LRLAN,LRDAT,LRDT,LREND,LREXD,LREXTST,LRFAN,LRFI,LRIX,LRMAN,LRNAME,LRNOCNTL
 K LRTSE,LRVERVER,LRLLOC,LRU,LRST,LRCL,LRDFN,LREDT,LRIOZERO,LRSDT,LRTK,LRTSE,LRWDTL
 K LRX,LRY,LRZ
 K ^TMP("LRWRKINC",$J),^TMP($J)
 Q
 ;
CHKAA ; EP - Check if user wants to use criteria from another chosen area.
 N DIR,DIRUT,DTOUT,DUOUT,LRFAN,LRINDEX,LRLAST,LRSTAR,LRX,LRY,LRZ,X,Y
 S (LRINDEX,LRZ)=0,(LRUSEAA,LRX)=""
 F  S LRX=$O(^TMP("LRWRKINC",$J,LRX)) Q:LRX=""  D
 . S LRZ=0
 . F  S LRZ=$O(^TMP("LRWRKINC",$J,LRX,LRZ)) Q:'LRZ  D
 . . S LRZ(0)=^TMP("LRWRKINC",$J,LRX,LRZ,0)
 . . S LRZ(1)=^TMP("LRWRKINC",$J,LRX,LRZ,1)
 . . S LRY=""
 . . I $P(LRAA(0),"^",3)'=$P(LRZ(0),"^",3) Q  ; Not same accession transform.
 . . I LRAA=$P(LRX,"^",2) Q  ; Don't use criteria from same accession area.
 . . S LRFAN=$P(LRZ(1),"^",2),LRLAN=$P(LRZ(1),"^",3),LRSTAR=$P(LRZ(1),"^",4),LRLAST=$P(LRZ(1),"^",5)
 . . I LRSTAR,LRLAST S LRY="From Date: "_$$FMTE^XLFDT(LRSTAR,"2DZ")_"  To: "_$$FMTE^XLFDT(LRLAST,"2DZ")
 . . E  S LRY="For Date: "_$$FMTE^XLFDT(LRLAST,"2DZ")_"  From: "_LRFAN_"  To: "_LRLAN
 . . S LRINDEX=LRINDEX+1,LRINDEX(LRINDEX)=LRX_"^"_LRZ
 . . S DIR("A",LRINDEX)=$J(LRINDEX,4)_"  "_$P(LRZ(0),"^")_"  "_LRY
 I $D(DIR("A")) D
 . S DIR(0)="NO^1:"_LRINDEX_":0"
 . S DIR("A",LRINDEX+1)=" "
 . S DIR("A")="Use Criteria from Accession Area"
 . S DIR("?",1)="Use previously selected accession area's date and number criteria."
 . S DIR("?")="Or press <RET> to specify different date/number criteria for "_$P(LRAA(0),"^")_"."
 . W ! D ^DIR
 . I '$D(DIRUT) S LRUSEAA=LRINDEX(Y) Q
 . I $D(DUOUT)!$D(DTOUT) S LREND=1
 Q
