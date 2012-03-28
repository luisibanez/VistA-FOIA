ACHSEDOC ; IHS/ITSC/PMF - PRINT EOBRS BY PATIENT ;   [ 10/16/2001   8:16 AM ]
 ;;3.1;CONTRACT HEALTH MGMT SYSTEM;;JUN 11, 2001
 ;
 W $G(IORVON),!,"THIS REPORT WILL ONLY INCLUDE PROCESSED DOCUMENTS.  ANY UNPROCESSED",!,"DOCUMENT WILL HAVE TO BE PRINTED USING ANOTHER OPTION.",!!,$G(IORVOFF),!
 I '$D(ACHSFC) D ^ACHSVAR  ;CHECKS SOME FLAGS TO SEE IF PROCESSING GOING ON
 D ^ACHSUD   ;SELECT DOCUMENT 
 I '$D(ACHSDIEN)!($D(DUOUT))!($D(DTOUT)) D END Q   ;LEAVE 
 ;
 S ACHSDOC0=$G(^ACHSF(DUZ(2),"D",ACHSDIEN,0))   ;GET DOCUMENT 0 RECORD
 ;
 I $G(ACHSDOC0)="" W !!,*7,"Document ",ACHSDIEN," is not complete!" D
 .W !!
 .D RTRN^ACHS
 Q:$G(ACHSQUIT)
 ;
 S ACHSPO="0"_$P(ACHSDOC0,U,14)_"-"_ACHSFC_"-"_$P(ACHSDOC0,U)
 S (ACHSTIEN,ACHSX,ACHSPO1,ACHSY)=0
 ;GET THE TRANSACTIONS FOR THE DOCUMENT
DOC ;
 F  S ACHSTIEN=$O(^ACHSF(DUZ(2),"EOBR",ACHSDIEN,ACHSTIEN)) Q:+ACHSTIEN=0  D
 .S ACHSX=ACHSX+1,ACHSTIEN(ACHSX)=ACHSTIEN
 D DOCSEL
 Q
DOCSEL ;
 I ACHSX=0 D DOCNO Q   ;NO DOCUMENTS FOUND
 ;
 S ACHSY=1
 ;
 I ACHSX=1 D DOCPRT D END Q   ;IF ONLY ONE DOCUMENT DO IT
 ;
 ;
 W !!,"ENTRY #",?10,"DOCUMENT #",?30,"PATIENT NAME",?60,"CHART #",?70,"TRANS TYPE",!,$$R("-",79)
 S I=""
 F  S I=$O(ACHSTIEN(I)) Q:I=""  D
 .D DOCSEL1
 .S ACHSY=ACHSY+1
 .I ACHSY#10=0 W !!,"Press <RETURN> To Continue ",!! D READ^ACHSFU
DIR ;
 S ACHSY=$$DIR^XBDIR("L^1:"_ACHSX,"SELECT ENTRY #(S) TO PRINT")
 G END:$D(DUOUT)!$D(DTOUT),DOCPRT
 ;
DOCSEL1 ;
 Q:'$D(ACHSTIEN(I))
 S ACHSTIEN=ACHSTIEN(I),ACHSTTYP=$P(^ACHSF(DUZ(2),"D",ACHSDIEN,"T",ACHSTIEN,0),U,2)
 S %=$P(^ACHSF(DUZ(2),"D",ACHSDIEN,"T",ACHSTIEN,0),U,3)
 I % S ACHSPAT=$P(^DPT(%,0),U,1),ACHSCHRT=$P(^AUPNPAT(%,41,DUZ(2),0),U,2)
 E  S %=$P(^ACHSF(DUZ(2),"D",ACHSDIEN,0),U,3),ACHSPAT=$S(%=1:"* BLANKET",%=2:"* SPECIAL TRANS",1:""),ACHSCHRT="<none>"
 S ACHSPO=$P(^ACHSF(DUZ(2),"D",ACHSDIEN,0),U,14)_"-"_ACHSFC_"-"_$P(^(0),U,1)
 D DOCSELPR
 Q
 ;
DOCSEL2 ;
 Q:'$D(ACHSPO1(I))
 S ACHSPO1=ACHSPO1(I),ACHSNON=ACHSPO1,ACHSPAT=$P(^ACHSEOBE(ACHSPO1,1),U,1),ACHSCHRT=$P(^AUPNPAT(ACHSPAT,41,DUZ(2),0),U,2),ACHSPAT=$P(^DPT(ACHSPAT,0),U,1),ACHSTTYP=$P(^ACHSEOBE(ACHSPO1,1),U,14)
 D DOCSELPR
 Q
 ;
DOCSELPR ;          
 W !,I_".",?10,ACHSPO,?30,ACHSPAT,?60,ACHSCHRT,?70,ACHSTTYP,!
 Q
 ;
DOCPRT ;
 W !!
 S %ZIS="P"
 D ^%ZIS
 I POP D END Q
 S ACHSEOIO=IO
 D BRPT^ACHSFU
 G:ACHSY=0 DOCSEL
 F I=1:1 S ACHSX1=$P(ACHSY,",",I) Q:ACHSX1=""  D:$D(ACHSTIEN(ACHSX1)) DOCPRT1 ;D:$D(ACHSPO1(ACHSX1)) DOCPRT2
 D END
 Q
 ;
DOCPRT1 ;
 S ACHSTIEN=ACHSTIEN(ACHSX1)
 D ^ACHSEOBA,^ACHSEOB2
 Q
 ;
DOCPRT2 ;
 ;S ACHSNON=ACHSPO1(ACHSX1)
 ;D ^ACHSEOBE,^ACHSEOB2
 ;Q
DOCNO ;
 W !!,"NO EOBRS FOR THIS DOCUMENT",!!
 D END
 Q
 ;
NON ;
 S ACHSN=$$DIR^XBDIR("Y","DO YOU WISH TO PRINT NONPROCESSED EOBRS","","","","",2)
 G END:$D(DTOUT)!($D(DUOUT))!($D(DIRUT))
 Q
 ;
END ;
 D ^%ZISC,EN^XBVK("ACHS"),^ACHSVAR
 Q
 ;
R(X,Y) Q $$REPEAT^XLFSTR(X,Y)
 ;
