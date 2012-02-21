FBPAY3 ;AISC/GRR,TET-PHARMACY PAYMENT HISTORY, SORT/PRINT ;7/9/2001
 ;;3.5;FEE BASIS;**12,32,69**;JAN 30, 1995
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
EN ;entry point
 I FBSORT S FBPNAME=FBNAME,FBPID=FBID,(DFN,J)=FBIEN,FBDOB=$$FMTE^XLFDT($P($G(^DPT(DFN,0)),U,3)) D SORT
 I 'FBSORT S FBVNAME=$E(FBNAME,1,23),FBVID=FBID,FBVI=FBIEN,FBVCHAIN=$P($G(^FBAAV(FBVI,0)),U,10),FBDA1=0 D
 .F  S FBDA1=$O(^FBAA(162.1,"AN",FBVI,FBDA1)) Q:'FBDA1  S J=0 F  S J=$O(^FBAA(162.1,FBDA1,"RX","C",J)) Q:'J  S DFN=J D VET,SORT
FBAAC ;check if anything in an xref, fbaac global (file 162)
 I '$D(^TMP($J,"FB",FBPI)),$D(^FBAAC("AN",FBPI)) D:'FBSORT AN^FBPAY67
KILL ;kill variables set in sort
 K A1,A2,FBAC,FBAP,FBBATCH,FBDA1,FBDRUG,FBFD,FBFD1,FBINVN,FBLOC,FBPAT,FBPD,FBPV,FBQTY,FBREIM,FBRX,FBSTR,FBSUSP,FBVEN,FBVI,I,J,K,L,N,V,Y
 K FBADJLA,FBADJLR,FBFPPSC,FBFPPSL,TAMT,FBRRMKL
 K:FBSORT FBVNAME,FBVID,FBVCHAIN K:'FBSORT FBPNAME,FBPID,FBDOB
 D KILL^FBPAY2
 Q
SORT ;
 S I=FBBEG F  S I=$O(^FBAA(162.1,"AD",J,I)) Q:I'>0!(I>FBEND)  S K=0 F  S K=$O(^FBAA(162.1,"AD",J,I,K)) Q:K'>0  S L=0 F  S L=$O(^FBAA(162.1,"AD",J,I,K,L)) Q:L'>0  D SET
 Q
 ;
SET ;
 N FBX
 S Y(0)=$G(^FBAA(162.1,+K,"RX",+L,0)) I Y(0)']""!($P(Y(0),U,9)=1) Q
 I $G(^FBAA(162.1,+K,"RX",+L,"FBREJ"))]"" Q  ;Eliminates Rejected Payments
 I 'FBSORT Q:FBVI'=$P($G(^FBAA(162.1,+K,0)),"^",4)
 S Y(2)=$G(^FBAA(162.1,+K,0))
 S Y(1)=$G(^FBAA(162.1,+K,"RX",+L,2))
 S FBFPPSC=$P($G(^FBAA(162.1,+K,0)),U,13) ;FPPS claim ID
 S FBFPPSL=$P($G(^FBAA(162.1,+K,"RX",+L,3)),U) ;FPPS line item
 S FBX=$$ADJLRA^FBRXFA(+L_","_+K_",")
 S FBADJLR=$P(FBX,U) ;adjustment code
 S FBADJLA=$P(FBX,U,2) ;adjustment amount
 S TAMT=$FN($P(Y(0),"^",7),"",2) ;suspend amount
 S FBRRMKL=$$RRL^FBRXFR(+L_","_+K_",") ;remitt remarks
 ; if user wants just mill bill or just non-mill bill then check payment
 ;   and skip if associated with an mill bill claim
 I "^M^N^"[(U_$G(FB1725R)_U) S FB1725=$S($P(Y(1),U,6)["FB583":+$P($G(^FB583(+$P(Y(1),U,6),0)),U,28),1:0) I $S(FB1725R="M"&'FB1725:1,FB1725R="N"&FB1725:1,1:0) Q
 S FBINVN=$P(Y(2),U) D VEN:FBSORT,VET:'FBSORT
 S FBRX=$P(Y(0),U,1),FBDRUG=$P(Y(0),U,2),FBFD=$P(Y(0),U,3),FBAC=$P(Y(0),U,4),FBAP=$P(Y(0),U,16),FBSUSP=$P(Y(0),U,8),FBPD=$P(Y(0),U,19),FBBATCH=$P(Y(0),U,17),FBBATCH=$P($G(^FBAA(161.7,+FBBATCH,0)),U)
 I FBSUSP]"" S FBSUSP=$P($G(^FBAA(161.27,+FBSUSP,0)),U)
 S FBREIM=$S($P(Y(0),U,20)="R":"*",1:""),FBSTR=$P(Y(0),U,12),FBQTY=$P(Y(0),U,13),A1=$J(FBAC,6,2),A2=$J(FBAP,6,2),FBPV=""
 S FBPD=$$DATX^FBAAUTL(FBPD),FBFD=$$DATX^FBAAUTL(FBFD)
 S FBPV=$S($P(Y(1),U,3)="V":"#",1:""),FBFD1=$S(FBPV="":" ",1:FBPV)_$S(FBREIM="":" ",1:FBREIM)_FBFD,FBRX="Rx: "_FBRX
 S FBVEN=FBVNAME_";"_FBVID,FBPAT=FBPNAME_";"_DFN
 D FBCKP^FBAACCB1(K,L)
 S ^TMP($J,"FB",FBPI,FBVEN,FBPAT,I,L)=FBFD1_U_FBRX_U_FBDRUG_U_FBSTR_U_FBQTY_U_A1_U_A2_U_FBSUSP_U_FBINVN_U_FBBATCH_U_FBPD_U_FBDOB_U_FBVCHAIN_U_TAMT
 S ^TMP($J,"FB",FBPI,FBVEN,FBPAT,I,L,"FBADJ")=FBADJLR_U_FBADJLA_U_FBRRMKL_U_FBFPPSC_U_FBFPPSL
 S ^TMP($J,"FB",FBPI,FBVEN,FBPAT,I,L,"FBCK")="^"_FBCK_"^"_FBCKDT_"^"_FBCANDT_"^"_FBCANR_"^"_FBCAN_"^"_FBDIS_"^"_FBCKINT D PMTCLN^FBAACCB2
 S ^TMP($J,"FB",FBPI,FBVEN)=FBVCHAIN,^TMP($J,"FB",FBPI,FBVEN,FBPAT)=FBDOB
 I FBSORT S FBIN(5)=$P(Y(1),U,6) I FBIN(5)]"",$D(^TMP($J,"FB",FBPI,FBVEN,FBPAT,I,L)) D ANC^FBPAY67(I,L)
 I 'FBSORT D OTH^FBPAY67
 Q
VET ;set variables for veteran - 'FBSORT
 S FBPID=$$SSN^FBAAUTL(DFN),N=$G(^DPT(+DFN,0)),FBPNAME=$P(N,U),FBDOB=$$FMTE^XLFDT($P(N,U,3))
 Q
VEN ;set variables for vendor - FBSORT
 S V=$G(^FBAAV(+$P(Y(2),U,4),0)),FBVNAME=$E($P(V,U),1,23),FBVID=$P(V,U,2),FBVCHAIN=$P(V,U,10)
 Q
PRINT ;write output
 S FBOUT=0 D:FBCRT&(FBPG) CR Q:FBOUT
 D HDR
 S FBVI="" F  S FBVI=$O(^TMP($J,"FB",FBPI,FBVI)) Q:FBVI']""!(FBOUT)  D:FBSORT SH Q:FBOUT  S FBPT="" D  Q:FBOUT
 .F  S FBPT=$O(^TMP($J,"FB",FBPI,FBVI,FBPT)) Q:FBPT']""!(FBOUT)  D:'FBSORT SH Q:FBOUT  S FBDT=0 F  S FBDT=$O(^TMP($J,"FB",FBPI,FBVI,FBPT,FBDT)) Q:'FBDT!(FBOUT)  S L=0 F  S L=$O(^TMP($J,"FB",FBPI,FBVI,FBPT,FBDT,L)) Q:'L!(FBOUT)  D  Q:FBOUT
 ..I ($Y+8)>IOSL D PAGE Q:FBOUT
 ..S FBDATA=^TMP($J,"FB",FBPI,FBVI,FBPT,FBDT,L),FBCKIN=$G(^TMP($J,"FB",FBPI,FBVI,FBPT,FBDT,L,"FBCK")) D EFBCK^FBPAY21(FBCKIN)
 ..S FBADJ=^TMP($J,"FB",FBPI,FBVI,FBPT,FBDT,L,"FBADJ")
 ..; S FBLOC="0^2^15^45^63^4^12^20^24^35^53"
 ..W !,$P(FBDATA,U),?64,$P(FBDATA,U,11),!
 ..W ?2,$P(FBDATA,U,2),?15,$P(FBDATA,U,3),?45,$P(FBDATA,U,4),?63,$P(FBDATA,U,5)
 ..;F I=2:1:$L(FBLOC,"^") W ?$P(FBLOC,U,I),$P(FBDATA,U,I) W:$P(FBLOC,U,I)=63 !
 ..W !?4,$P(FBDATA,U,6),?12,$P(FBDATA,U,7)
 ..W ?20 I $P(FBADJ,U,1)]"" W $P(FBADJ,U,1),?30,$J($P(FBADJ,U,2),14)
 ..I $P(FBADJ,U,1)="" W $P(FBDATA,U,8),?30,$J($P(FBDATA,U,14),14)
 ..W ?47,$P(FBDATA,U,9),?58,$P(FBDATA,U,10),?66,$P(FBADJ,U,3)
 ..I $P(FBADJ,U,4)]"" W !?5,"FPPS Claim ID: ",$P(FBADJ,U,4),"     FPPS Line Item: ",$P(FBADJ,U,5)
 ..S A2=$$EXTRL^FBMRASVR($P(FBDATA,"^",7)) D PMNT^FBAACCB2 K A2
 ..I +$O(^TMP($J,"FB",FBPI,FBVI,FBPT,FBDT,L,"A",0)) D PANC^FBPAY671(L) Q:FBOUT  W !,FBDASH1
 ..W !
EXIT ;kill and quit
 Q
HDR ;main header
 I FBPG>0!FBCRT W @IOF
 S FBPG=FBPG+1
 W !?25,$S($G(FBSORT):"VETERAN",1:"VENDOR")," PAYMENT HISTORY"
 I $G(FB1725R)]"",FB1725R'="A" W " ",$S(FB1725R="M":"for 38 U.S.C. 1725 Claims",1:"excluding 38 U.S.C. 1725 Claims")
 W !?24,$E(FBDASH,1,24),?71,"Page: ",FBPG,!
 W:FBSORT "Patient: ",FBPNAME,?41,"Pat. ID: ",FBPID,?62,"DOB: ",FBDOB W:'FBSORT "Vendor: ",FBVNAME,?41,"Vendor ID: ",FBVID,?65,"Chain #: ",FBVCHAIN
 W !?(IOM-(13+$L(FBPROG(+FBPI)))/2),"FEE PROGRAM: ",FBPROG(+FBPI)
 ;W ?71,"Page: ",FBPG
 W !?3,"('*' Reimb. to Patient  '+' Cancel. Activity  '#' Voided Payment)"
 W !?4,"Fill Date",?64,"Date Certified"
 W !,?15,"Drug Name",?44,"Strength",?60,"Quantity"
 W !?2,"Claimed",?12,"Paid",?20,"Adj Code",?33,"Adj Amounts",?47,"Invoice #",?58,"Batch #",?66,"Remit Remarks",!,FBDASH
 Q
SH ;subheader - vendor if fbsort; patient if  'fbsort, prints when name changes
 I ($Y+10)>IOSL D:FBCRT CR Q:FBOUT  D HDR
 I FBSORT W !!,"Vendor:",$P(FBVI,";"),?41,"Vendor ID: ",$P(FBVI,";",2),?65,"Chain #: ",$P($G(^TMP($J,"FB",FBPI,FBVI)),U)
 I 'FBSORT W !!,"Patient: ",$P(FBPT,";"),?41,"Pat. ID: ",$$SSN^FBAAUTL($P(FBPT,";",2)),?62,"DOB: ",$P($G(^TMP($J,"FB",FBPI,FBVI,FBPT)),U)
 Q
CR ;read for display
 S DIR(0)="E" W ! D ^DIR K DIR S:$D(DUOUT)!($D(DTOUT)) FBOUT=1
 Q
PAGE ;new page
 I FBCRT D CR Q:FBOUT
 D HDR,SH
 Q
