SROATCM1 ;BIR/MAM - STUFF TRANMISSION IN ^TMP ; [ 04/20/00  01:14 PM ]
 ;;3.0; Surgery ;**38,71,79,90,88,93,95,111**;24 Jun 93
 K SRA F I=0,.2,200,201,202,205:1:208,207.1 S SRA(I)=$G(^SRF(SRTN,I))
 S DFN=$P(SRA(0),"^") N I D DEM^VADPT S SRANAME=VADM(1),SEX=$P(VADM(5),"^"),Z=$P(VADM(3),"^"),SRSDATE=$P(SRA(0),"^",9),Y=$E(SRSDATE,1,7),AGE=$E(Y,1,3)-$E(Z,1,3)-($E(Y,4,7)<$E(Z,4,7))
 S SHEMP=">"_$J(SRASITE,3)_$J(SRTN,7)_" 1 "_DT_$J(AGE,3)_$J(SEX,1)_$J(SRSDATE,12,4)_VA("PID")
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SHEMP=$E(SHEMP,1,11)_" 2 ",SRACNT=SRACNT+1
 S SRHD=$P(SRA(206),"^")
 I SRHD["C" S SRH="C",SRHD=$E(SRHD,1,$L(SRHD)-1)
 E  S SRH=" "
 S SRWD=$P(SRA(206),"^",2)
 I SRWD["K" S SRW="K",SRWD=$E(SRWD,1,$L(SRWD)-1)
 E  S SRW=" "
 S SHEMP=SHEMP_$J(SRHD,3)_SRH_$J(SRWD,3)_SRW_$J($P(SRA(200),"^",2),2)_$J($P(SRA(200),"^",11),2)_$J($P(SRA(206),"^",5),3)_$J($P(SRA(206),"^",6),2)_$J($P(SRA(206),"^",7),2)
 S SRCT=$P($G(^SRF(SRTN,201)),"^",4) S:SRCT["NS" SRCT=""
 S SHEMP=SHEMP_$J($P(SRA(200),"^",3),2)_$J(SRCT,4)_$J($P(SRA(206),"^",10),2)_$J($P(SRA(206),"^",11),2)_$J($P(SRA(200),"^",8),2)_$J($P(SRA(206),"^",13),2)_$J($P(SRA(206),"^",14),2)_$J($P(SRA(206),"^",15),2)
 S SHEMP=SHEMP_$J($P(SRA(206),"^",16),2)_$J($P(SRA(206),"^",17),2)_$J($P(SRA(206),"^",18),3)_$J($P(SRA(206),"^",19),3)_$J($P(SRA(206),"^",20),2)_$J($P(SRA(206),"^",21),2)_$J($P(SRA(206),"^",22),2)_$J($P(SRA(206),"^",23),2)
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SHEMP=$E(SHEMP,1,11)_" 3 ",SRACNT=SRACNT+1
 S SHEMP=SHEMP_$J($P(SRA(206),"^",24),2)_$J($P(SRA(206),"^",25),3)_$J($P(SRA(206),"^",26),3)_$J($P(SRA(206),"^",27),3)
 ; Left Main (node 3 pos 26-28), LAD (node 3 pos 29-31), Right Coronary (node 3 pos 32-34) & Circumflex Stenosis (node 3 pos 35-37)
 S SHEMP=SHEMP_$J($P(SRA(206),"^",28),3)_$J($P($G(SRA(206)),"^",33),3)_$J($P($G(SRA(206)),"^",34),3)_$J($P($G(SRA(206)),"^",35),3)
 ; LV Cont Grade (node 3 pos 39-40) & Mitral Regurgitation(node 3 pos 41-42)
 N SROLV S SROLV=$P(SRA(206),"^",30)
 S SHEMP=SHEMP_$J($S(SROLV="IIIa":"3A",SROLV="IIIb":"3B",1:SROLV),3)_$J($P($G(SRA(206)),"^",9),2)
 ; Estimate of Mortality and ASA Class are changed to not transmit "NS"
 S SREMDATE=$P($G(SRA(206)),"^",32)
 S SREMO=$P($G(^SRF(SRTN,206)),"^",31) S:SREMO["NS" SREMDATE=""
 ; Estimate of Mortality (node 3 pos 43-45) & date (node 3 pos 46-57)
 S SHEMP=SHEMP_$J(SREMO,3)
 S SHEMP=SHEMP_$S(SREMDATE="":$J(SREMDATE,12),1:$J(SREMDATE,12,4))
 S X="",Y=$P($G(^SRF(SRTN,1.1)),"^",3) S:Y X=$P($P($G(^SRO(132.8,Y,0)),"^"),"-") S X=$E(X) S:X["N" X=""
 S SHEMP=SHEMP_$J(X,1)
 ; Cardiac Est. of Surg. Priority(node 3 pos 59) & date(node 3 pos 60-71)
 S SHEMP=SHEMP_$J($P($G(SRA(208)),"^",12),1)
 S SREMSPDT=$P($G(SRA(208)),"^",13)
 S SHEMP=SHEMP_$S(SREMSPDT="":$J(SREMSPDT,12),1:$J(SREMSPDT,12,4))
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SHEMP=$E(SHEMP,1,11)_" 4 ",SRACNT=SRACNT+1
 S SHEMP=SHEMP_$J($P(SRA(207),"^"),2)_$J($P(SRA(207),"^",2),2)_$J($P(SRA(207),"^",3),2)_$J($P(SRA(207),"^",4),2)_$J($P(SRA(207),"^",5),2)_$J($P(SRA(207),"^",6),2)_$J($P(SRA(207),"^",7),2)
 S SHEMP=SHEMP_$J($P(SRA(207),"^",8),2)_$J($P(SRA(207),"^",9),2)_$J($P(SRA(207),"^",10),2)_$J($P(SRA(207),"^",12),2)_$J($P(SRA(207),"^",13),2)_$J($P(SRA(207),"^",14),2)_$J($P(SRA(207),"^",15),2)
 S SHEMP=SHEMP_$J($P(SRA(207),"^",16),2)_$J($P(SRA(207),"^",17),2)_$J($P(SRA(207),"^",18),2)_$J($P(SRA(207),"^",19),2)
 S SRDEATH=$P($G(SRA(208)),"^"),SRDDATE=$E($P($G(^DPT(DFN,.35)),"^"),1,7)
 S SHEMP=SHEMP_$J(SRDEATH,2)_$J(SRDDATE,7)
 S SHEMP=SHEMP_$P(SRA(207),"^",20)
 ; Other procedures node 5
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SHEMP=$E(SHEMP,1,11)_" 5 ",SRACNT=SRACNT+1
 S SHEMP=SHEMP_$E($G(SRA(207.1)),1,65)
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SHEMP=$E(SHEMP,1,11)_" 6 ",SRACNT=SRACNT+1
 S SHEMP=SHEMP_$J($P(SRA(208),"^",2),2)_$J($P(SRA(208),"^",3),2)_$J($P(SRA(205),"^",17),2)_$J($P(SRA(208),"^",4),2)_$J($P(SRA(208),"^",5),2)_$J($P(SRA(205),"^",28),2)_$J($P(SRA(208),"^",6),2)
 S SHEMP=SHEMP_$J($P(SRA(205),"^",13),2)_$J($P(SRA(208),"^",7),2)_$J($P(SRA(205),"^",22),2)_$J($P(SRA(205),"^",21),2)_$J($P(SRA(205),"^",26),2)
 ;
 ;Ethnicity contained in VADM(11)
 S SROETCD="",SROPTF=""
 S SROETCD=$P($G(VADM(11,1)),U,1)            ;Ethnicity code
 S SROPTF=$$PTR2CODE^DGUTL4(SROETCD,2,4)     ;PTF Ethnicity code
 S SHEMP=SHEMP_$J($G(SROPTF),1)   ;Ethnicity
 ;
 ;Multiple races contained in VADM(12)
 S SRORCE=0,SRORAC="",SRORACE="",SRORCD=""
 F  S SRORCE=$O(VADM(12,SRORCE)) Q:SRORCE=""  D
 .S SRORAC=$P($G(VADM(12,SRORCE)),U,1)        ;Race code
 .S SRORCD=$$PTR2CODE^DGUTL4(SRORAC,1,4)     ;PTF race code
 .S SRORACE=SRORACE_$J(SRORCD,1)
 ;
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP_SRORACE  ;Eth, race added
 ;
 S SHEMP=$E(SHEMP,1,11)_" 7 ",SRACNT=SRACNT+1
 S SHEMP=SHEMP_$TR(SRANAME,","," ")
 I $P($G(^SRF(SRTN,"RA")),"^",3)=1 S SHEMP=SHEMP_$J("***RE-TRANSMISSION",38)
 ; zip code, employ status, hemoglobin, hemo date, serum albumin, albumin date, creatitine date, total ischemic time, min invasive, total cpb time, total pre,post ICU & step down unit LOS,
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SHEMP=$E(SHEMP,1,11)_" 8 ",SRACNT=SRACNT+1
 K VADM D ADD^VADPT S X=$S($P(VAPA(11),"^",2)'="":$P(VAPA(11),"^",2),1:VAPA(6))
 S SHEMP=SHEMP_$J(X,10)_$J($P(SRA(208),"^",18),1)_$J($P(SRA(201),"^",20),7)_$J($P(SRA(202),"^",20),7)_$J($P(SRA(201),"^",8),4)_$J($P(SRA(202),"^",8),7)_$J($P(SRA(202),"^",4),7)_$J($P(SRA(206),"^",36),4)
 S SHEMP=SHEMP_$J($P(SRA(207),"^",22),1)_$J($P(SRA(206),"^",37),4)_$J($P(SRA(207),"^",23),2)
 ; cpt codes
NODE9 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SHEMP=$E(SHEMP,1,11)_" 9 ",SRACNT=SRACNT+1
 S SRPMOD="",SR10SP="          ",CPT=$P(^SRF(SRTN,"OP"),"^",2) D
 .I CPT S CPT=$P($$CPT^ICPTCOD(CPT),"^",2),SRCASE=SRTN D MOD^SROATM3 S SRPMOD=SRM
 .S SHEMP=SHEMP_$J(CPT,5),SRPMOD=SRPMOD_SR10SP
 K CPT F I=1:1:10 S (CPT(I),SRMOD(I))=""
 S (OPS,CNT)=0 F  S OPS=$O(^SRF(SRTN,13,OPS)) Q:'OPS!(CNT=10)  S CNT=CNT+1,X=$P($G(^SRF(SRTN,13,OPS,2)),"^") I X S CPT(CNT)=$P($$CPT^ICPTCOD(X),"^",2) D OTH^SROATM3
 S SHEMP=SHEMP_$J(CPT(1),5)_$J(CPT(2),5)_$J(CPT(3),5)_$J(CPT(4),5)_$J(CPT(5),5)_$J(CPT(6),5)_$J(CPT(7),5)_$J(CPT(8),5)_$J(CPT(9),5)_$J(CPT(10),5)
 ; card cath date, admission date/time, hospital discharge date/time, anesthesia start & end date/times
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SHEMP=$E(SHEMP,1,11)_" 10",SRACNT=SRACNT+1
 I $P(SRA(207),"^",21)'="" D
 .I $E($P(SRA(207),"^",21),8)="." Q
 .E  S $P(SRA(207),"^",21)=$P(SRA(207),"^",21)_"."
 S $P(SRA(207),"^",21)=$$LJ^XLFSTR($P(SRA(207),"^",21),12,0)
 S SHEMP=SHEMP_$J($E($P(SRA(207),"^",21),1,12),12)
 S (SRDATE,SRI)="" F SRI=14,15 S SRDATE=$E($P($G(SRA(208)),"^",SRI),1,12) S SRDATE=$$LJ^XLFSTR(SRDATE,12,0) S SHEMP=SHEMP_SRDATE
 S (SRDATE,SRI)="" F SRI=1,4 S SRDATE=$P(SRA(.2),"^",SRI) S SRDATE=$$LJ^XLFSTR(SRDATE,12,0) S SHEMP=SHEMP_SRDATE
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SHEMP=$E(SHEMP,1,11)_" 11",SRACNT=SRACNT+1
 S (SRDATE,SRI)="" F SRI=10,12,2,3 S SRDATE=$P(SRA(.2),"^",SRI),SRDATE=$$LJ^XLFSTR(SRDATE,12,0) S SHEMP=SHEMP_SRDATE
 ; preop risk factors comments
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SHEMP=$E(SHEMP,1,11)_" 12",SRACNT=SRACNT+1 S SHEMP=SHEMP_$TR($E($G(^SRF(SRTN,206.1)),1,65),",","^")
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SHEMP=$E(SHEMP,1,11)_" 13",SRACNT=SRACNT+1 S SHEMP=SHEMP_$TR($E($G(^SRF(SRTN,206.1)),66,130),",","^")
 ; resource data comments
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SHEMP=$E(SHEMP,1,11)_" 14",SRACNT=SRACNT+1 S SHEMP=SHEMP_$TR($E($G(^SRF(SRTN,206.2)),1,65),",","^")
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SHEMP=$E(SHEMP,1,11)_" 15",SRACNT=SRACNT+1 S SHEMP=SHEMP_$TR($E($G(^SRF(SRTN,206.2)),66,130),",","^")
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SRACNT=SRACNT+1,SHEMP=$E(SHEMP,1,11)_" 16"_$E(SRPMOD,1,10) F I=1:1:5 S SHEMP=SHEMP_$E(SRMOD(I)_SR10SP,1,10)
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SRACNT=SRACNT+1,SHEMP=$E(SHEMP,1,11)_" 17" F I=6:1:10 S SHEMP=SHEMP_$E(SRMOD(I)_SR10SP,1,10)
 S X=$$SITE^SROUTL0(SRTN),SRDIV=$S(X:$P(^SRO(133,X,0),"^"),1:""),SRDIV=$S(SRDIV:$$GET1^DIQ(4,SRDIV,99),1:SRASITE),SHEMP=SHEMP_$J(SRDIV,6)
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SRACNT=SRACNT+1
 Q
