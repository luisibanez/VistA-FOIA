BLRLUAC8 ; IHS/OIT/MKK - IHS LRUPAC 8, error in compilation report ; [ 05/15/11  7:50 AM ]
 ;;5.2;LR;**1030**;NOV 01, 1997
 ;;
REPTERRS ; EP -- Report on Errors during compilation
 NEW BLRVERN,COMPDATE,DFN,ERRDESC,DATANAME,DATANDES
 NEW LRAS,LRDFN,LRSS,LRIDT,LAB60IEN,LAB60DES,XTMPNODE
 NEW CNT,HEADER,HEDONE,LINES,MAXLINES,MAX,PG,QFLG
 NEW LRLDT,LRSDT,SELRAAAB,SPTKNDTT,XTMPNODE
 NEW DATERNGE,STR
 ;
 Q:$$RPTERRSI()="Q"
 ;
 F  S LRDFN=$O(^BLRLUPAC(DATETIME,"ERRORS",LRDFN))  Q:LRDFN<1!(QFLG="Q")  D
 . F  S LRSS=$O(^BLRLUPAC(DATETIME,"ERRORS",LRDFN,LRSS))  Q:$L(LRSS)<1!(QFLG="Q")  D
 .. F  S LRIDT=$O(^BLRLUPAC(DATETIME,"ERRORS",LRDFN,LRSS,LRIDT))  Q:$G(LRIDT)=""!(QFLG="Q")  D
 ... F  S DATANAME=$O(^BLRLUPAC(DATETIME,"ERRORS",LRDFN,LRSS,LRIDT,DATANAME))  Q:$G(DATANAME)=""!(QFLG="Q")  D
 .... D RPTERRSL
 ;
 W:CNT<1 !!,?4,"No Errors Found.",!
 W:CNT>0 !!,?4,"Number of Errors = ",CNT,!
 ;
 D PRESSKEY^BLRGMENU(9)
 Q
 ;
RPTERRSI() ; EP -- Errors Report INITialization of variables
 D SETXTMPN^BLRLUAC1(.XTMPNODE)     ; Set the ^BLRLUPAC( node
 S BLRVERN=$P($P($T(+1),";")," ")
 ;
 Q:$$GETXTMPV^BLRLUAC2("ERRORS",.SELRAAAB,.LRSDT,.LRLDT,"No Errors Found.")="Q" "Q"
 ;
 S DATERNGE="Date Range: "_$$FMTE^XLFDT(LRSDT,"5DZ")
 S DATERNGE=DATERNGE_" thru "_$$FMTE^XLFDT(LRLDT,"5DZ")
 ;
 K HEADER
 S HEADER(1)="Lab Accession and Test Counts"
 S HEADER(2)=SELRAAAB_" Accession Area"
 S HEADER(3)=$$CJ^XLFSTR("Compilaton Errors Report",IOM)
 S HEADER(4)=$$CJ^XLFSTR(DATERNGE,IOM)
 ;
 D HEADONE^BLRLUAC2(.HEDONE)
 ;
 S MAXLINES=21,LINES=MAXLINES+10,PG=0
 S QFLG="NO"
 ;
 S HEADER(5)=" "
 S $E(HEADER(6),20)="Specimen Taken"
 S $E(HEADER(6),56)=$TR($$CJ^XLFSTR("@File@63.04@",25)," @","= ")
 S HEADER(7)="LRDFN"
 S $E(HEADER(7),10)="DFN"
 S $E(HEADER(7),22)="Date   Time"
 S $E(HEADER(7),36)="Accession Number"
 S $E(HEADER(7),56)="IEN"
 S $E(HEADER(7),66)="Description"
 ;
 S (LRDFN,LRSS,LRIDT,DATANAME)=""
 S CNT=0
 ;
 Q "OK"
 ;
RPTERRSL ; EP
 I LINES>MAXLINES D HEADERPG^BLRGMENU(.PG,.QFLG,HEDONE)  Q:QFLG="Q"
 ;
 D ERRBRKO      ; Breakout Variables
 ;
 W LRDFN
 W ?9,DFN
 W ?19,$TR($$FMTE^XLFDT(SPTKNDTT,"2MZ"),"@"," ")
 W ?35,LRAS
 W ?55,DATANAME
 W ?65,$E(DATANDES,1,15)
 W !
 S LINES=LINES+1
 S CNT=CNT+1
 Q
 ;
ERRBRKO ; EP
 S DFN=$P($G(^LR(LRDFN,0)),"^",3)
 ;
 S SPTKNDTT=$P($G(^LR(LRDFN,LRSS,LRIDT,0)),"^")
 S COMPDATE=$P($G(^LR(LRDFN,LRSS,LRIDT,0)),"^",3)
 S LRAS=$P($G(^LR(LRDFN,LRSS,LRIDT,0)),"^",6)
 ;
 ; DataName Description
 S DATANDES=$P($G(^DD(63.04,DATANAME,0)),"^")
 ;
 ; Error Description
 S ERRDESC=$P($G(^BLRLUPAC(DATETIME,"ERRORS",LRDFN,LRSS,LRIDT,DATANAME)),"^",2)
 ;
 Q
 ;
ERRDESC ; EP -- Report on Errors during compilation
 NEW BLRVERN,COMPDATE,DFN,ERRDESC,LRAS,LRDFN,LRSS,LRIDT,DATANAME,DATANDES
 NEW LAB60IEN,LAB60DES,XTMPNODE
 NEW CNT,HEADER,HEDONE,LINES,MAXLINES,MAX,PG,QFLG
 NEW LRLDT,LRSDT,SELRAAAB,SPTKNDTT,XTMPNODE
 NEW DATERNGE,STR
 ;
 Q:$$ERRSINIT()="Q"
 ;
 F  S LRDFN=$O(^BLRLUPAC(DATETIME,"ERRORS",LRDFN))  Q:LRDFN<1!(QFLG="Q")  D
 . S DFN=$P($G(^LR(LRDFN,0)),"^",3)
 . F  S LRSS=$O(^BLRLUPAC(DATETIME,"ERRORS",LRDFN,LRSS))  Q:$L(LRSS)<1!(QFLG="Q")  D
 .. F  S LRIDT=$O(^BLRLUPAC(DATETIME,"ERRORS",LRDFN,LRSS,LRIDT))  Q:$G(LRIDT)=""!(QFLG="Q")  D
 ... S DATANAME=""
 ... S DATANAME=$O(^BLRLUPAC(DATETIME,"ERRORS",LRDFN,LRSS,LRIDT,DATANAME))
 ... D ERRSLINE
 ;
 W:CNT<1 !!,?4,"No Errors Found.",!
 W:CNT>0 !!,?4,"Number of Errors = ",CNT,!
 ;
 D PRESSKEY^BLRGMENU(9)
 Q
 ;
ERRSINIT() ; EP -- Errors Report INITialization of variables
 D SETXTMPN^BLRLUAC1(.XTMPNODE)     ; Set the ^TMP node
 S BLRVERN=$P($P($T(+1),";")," ")
 ;
 Q:$$GETXTMPV^BLRLUAC2("ERRORS",.SELRAAAB,.LRSDT,.LRLDT,"No Errors Found.")="Q" "Q"
 ;
 S DATERNGE="Date Range: "_$$FMTE^XLFDT(LRSDT,"5DZ")
 S DATERNGE=DATERNGE_" thru "_$$FMTE^XLFDT(LRLDT,"5DZ")
 ;
 K HEADER
 S HEADER(1)="Lab Accession and Test Counts"
 S HEADER(2)=SELRAAAB_" Accession Area"
 S HEADER(3)=$$CJ^XLFSTR("Compilaton Errors Report",IOM)
 S HEADER(4)=$$CJ^XLFSTR(DATERNGE,IOM)
 ;
 D HEADONE^BLRLUAC2(.HEDONE)
 ;
 S MAXLINES=21,LINES=MAXLINES+10,PG=0
 S QFLG="NO"
 ;
 S HEADER(5)=" "
 S $E(HEADER(6),10)="Specimen Taken"
 S HEADER(7)="DFN"
 S $E(HEADER(7),12)="Date"
 S $E(HEADER(7),19)="Time"
 S $E(HEADER(7),26)="Accession Number"
 S $E(HEADER(7),46)="Error Description"
 ;
 S (LRDFN,LRSS,LRIDT,DATANAME)=""
 S CNT=0
 ;
 Q "OK"
 ;
ERRSLINE ; EP
 I LINES>MAXLINES D HEADERPG^BLRGMENU(.PG,.QFLG,HEDONE)  Q:QFLG="Q"
 ;
 D ERRBRKO      ; Breakout Variables
 ;
 W DFN
 W ?9,$TR($$FMTE^XLFDT(SPTKNDTT,"2MZ"),"@"," ")
 W ?25,LRAS
 W ?45,$E(ERRDESC,1,35)
 W !
 S LINES=LINES+1
 S CNT=CNT+1
 Q
 ;
TESTORD ; EP - CH Hospital Location sort
 NEW CNT,DFN,FNDLRIDT,LRDFN,LRAA,LRAD,LRAN,LRIDT,LRAS,LRSS,SPTKNDAT,STR0,VLABLRAS
 ;
 D ^XBFMK
 S DIR(0)="PO^2"
 D ^DIR
 ;
 I +$G(Y)<1!(+$G(DIRUT)) D  Q
 . W !,?4,"No/Invalid Entry.  Routine Ends.",!
 . D PRESSKEY^BLRGMENU(4)
 ;
 S DFN=+$G(Y)
 S LRDFN=+$G(^DPT(DFN,"LR"))
 ;
 D ^XBFMK
 S DIR(0)="FO"
 S DIR("A")="Select ACCESSION"
 D ^DIR
 I $G(X)=""!(+$G(DIRUT)) D  Q
 . W !,?4,"No/Invalid Entry.  Routine Ends.",!
 . D PRESSKEY^BLRGMENU(4)
 ;
 S X=$$GETACCCP^BLRUTIL3(LRAS,.LRAA,.LRAD,.LRAN)
 I X<1 D  Q
 . W !,?4,"Could not 'Break Apart' Accession ",LRAS,!!
 . D PRESSKEY^BLRGMENU(4)
 ;
 S LRSS=$$GET1^DIQ(68,LRAA,"LR SUBSCRIPT",,,"ERRORS")  ; LR Subscript
 I $D(ERRORS)>0 D  Q
 . W !,?4,"Could not Find LR Subscript for ",LRAA,".",!
 . D PRESSKEY^BLRGMENU(4)
 ;
 W "LRAD=",LRAD,"; Pseudo LRIDT=",9999999-LRAD,!!
 ;
 S LRIDT=999999,SPTKNDAT=0
 F  S LRIDT=$O(^LR(LRDFN,LRSS,LRIDT))  Q:LRIDT<1!(SPTKNDAT)  D
 . S STR0=$G(^LR(LRDFN,LRSS,LRIDT,0))
 . Q:$P(STR0,"^",6)=LRAS
 . S SPTKNDAT=+$P(STR0,"^")
 . S FNDLRIDT=LRIDT
 ;
 I SPTKNDAT<1 D  Q
 . W !,?4,"Could not Find Speciment Taken Date for ",LRAS,".",!
 . D PRESSKEY^BLRGMENU(4)
 ;
 W !!,"LRAS:",LRAS,"; SPTKNDAT:",SPTKNDAT,!!
 ;
 S (VLABCNT,VLABFND)=0,VLABIEN="A"
 F  S VLABIEN=$O(^AUPNVLAB("B",LAB60IEN,VLABIEN),-1)  Q:VLABIEN<1!(VLABFND)  D
 . S:$P($G(^AUPNVLAB(VLABIEN,0)),"^",6)=LRAS VLABFND=VLABIEN
 ;
 I VLABFND<1 D  Q
 . W !,"No V LAB Data",!
 ;
 S VISITIEN=+$P($G(^AUPNVLAB(VLABFND,0)),"^",3)
 ;
 S F44IEN=+$P($G(^AUPNVSIT(VISITIEN,0)),"^",22)
 ;
 I F44IEN<1 D  Q
 . W !,"No File 44 Data in V FILE",!
 ;
 W !,"F44IEN:",F44IEN,!
 ;
 Q
 ;
VLABIT ; EP
 NEW VLABCNT,VLABFND,VLABIEN,VLABLRAS
 ;
 S (VLABCNT,VLABFND)=0,VLABIEN="A"
 W ?4
 F  S VLABIEN=$O(^AUPNVLAB("B",LAB60IEN,VLABIEN),-1)  Q:VLABIEN<1!(VLABFND)  D
 . S VLABLRAS=$P($G(^AUPNVLAB(VLABIEN,0)),"^",6)
 . W $$LJ^XLFSTR(VLABLRAS,20)
 . W:$X>60 !,?4
 . S:VLABLRAS=LRAS VLABFND=VLABIEN
 ;
 W !,"VLABFND:",VLABFND,!
 Q
 ;
VLABDET ; EP
 NEW STR,VLABIEN
 ;
 D ^XBFMK
 S DIR(0)="PO^9000010.09"
 D ^DIR
 I +$G(Y)<1!(+$G(DIRUT)) D  Q
 . W ?4,"No/Invalid Entry into V LAB file.  Routine Ends.",!
 . D PRESSKEY^BLRGMENU(9)
 ;
 W !!
 S VLABIEN=+$G(Y)
 S STR=$G(^AUPNVLAB(VLABIEN,0))
 W "LAB TEST: ",$E($P($G(^LAB(60,+$P(STR,"^"),0)),"^"),1,27)
 W ?40,"PATIENT NAME: ",$E($P($G(^DPT(+$P(STR,"^",2),0)),"^"),1,25)
 W !
 W ?2,"VISIT:",$P($G(^AUPNVSIT(+$P(STR,"^",3),0)),"^")
 W ?40,"RESULTS: ",$E($P(STR,"^",4),1,25)
 W !
 W ?2,"ABNORMAL: ",$P(STR,"^",5)
 W ?40,"LR ACCESSION NO.: ",$P(STR,"^",6)
 W !
 W ?2,"PROVIDER: ",$E($P($G(^VA(200,+$P(STR,"^",7),0)),"^"),1,25)
 ;
 S STR=$G(^AUPNVLAB(VLABIEN,12))
 W ?40,"COLLECTION DATE AND TIME: ",$P(STR,"^")
 W !
 W ?2,"ORDERING PROVIDER: ",$E($P($G(^VA(200,+$P(STR,"^",2),0)),"^"),1,25)
 W ?40,"CLINIC: ",$E($P($G(^DIC(40.7,+$P(STR,"^",3),0)),"^"),1,25)
 W !
 W ?2,"ENCOUNTER PROVIDER: ",$E($P($G(^VA(200,+$P(STR,"^",4),0)),"^"),1,25)
 W ?40,"PARENT: ",$P(STR,"^",8)
 W !
 W ?2,"EXTERNAL KEY: ",$P(STR,"^",9)
 W ?40,"OUTSIDE PROVIDER NAME: ",$E($P(STR,"^",10),1,25)
 W !
 W ?2,"ORDERING DATE:",$P(STR,"^",11)
 W ?40,"RESULT DATE AND TIME: ",$P(STR,"^",12)
 W !
 W ?2,"ANCILLARY POV: ",$G(^ICD9(+$P(STR,"^",13),0))
 W ?40,"ORDERING LOCATION: ",$E($P($G(^SC(+$P(STR,"^",15),0)),"^"),1,25)
 W !
 Q
 ;
REPTERRC ; EP -- Report on Errors during compilation, Count version
 NEW BLRVERN,COMPDATE,DFN,ERRDESC,DATANAME,DATANDES,ERRMSG,ERRMTOT,F60GTOT
 NEW LABCNT,LRAS,LRDFN,LRSS,LRIDT,LAB60IEN,LAB60DES,XTMPNODE
 NEW CNT,HEADER,HEDONE,LINES,MAXLINES,MAX,PG,QFLG
 NEW LRLDT,LRSDT,SELRAAAB,SPTKNDTT,XTMPNODE
 NEW DATERNGE,STR
 ;
 Q:$$RPTERRCI()="Q"
 ;
 F  S ERRMSG=$O(^BLRLUPAC(DATETIME,"ERRORS",ERRMSG))  Q:ERRMSG=""!(QFLG="Q")  D
 . D ERRMLINE
 . S LABCNT=0
 . F  S LAB60IEN=$O(^BLRLUPAC(DATETIME,"ERRORS",ERRMSG,LAB60IEN))  Q:LAB60IEN<1!(QFLG="Q")  D
 .. D L60LINE
 .. S LABCNT=LABCNT+1
 . D ERRMTOTL
 . I LABCNT<1 W !  S LINES=LINES+1
 ;
 Q:QFLG="Q"
 ;
 D ERR60TOT
 ;
 D CLOSEIO^BLRLUAC9
 ;
 D PRESSKEY^BLRGMENU(9)
 ;
 Q
 ;
RPTERRCI() ; EP -- Errors Report INITialization of variables - Count version
 D SETXTMPN^BLRLUAC1(.XTMPNODE)     ; Set the ^BLRLUPAC( node
 S BLRVERN=$P($P($T(+1),";")," ")
 ;
 Q:$$GETXTMPV^BLRLUAC2("ERRORS",.SELRAAAB,.LRSDT,.LRLDT,"No Errors Found.")="Q" "Q"
 ;
 S DATERNGE="Date Range: "_$$FMTE^XLFDT(LRSDT,"5DZ")
 S DATERNGE=DATERNGE_" thru "_$$FMTE^XLFDT(LRLDT,"5DZ")
 ;
 K HEADER
 S HEADER(1)="Lab Accession and Test Counts"
 S HEADER(2)=SELRAAAB_" Accession Area"
 S HEADER(3)=$$CJ^XLFSTR("Compilaton Errors Report",IOM)
 S HEADER(4)=$$CJ^XLFSTR(DATERNGE,IOM)
 ;
 D HEADONE^BLRLUAC2(.HEDONE)
 ;
 S MAXLINES=21,LINES=MAXLINES+10,PG=0
 S QFLG="NO"
 ;
 S HEADER(5)=" "
 S $E(HEADER(6),42)=$TR($$CJ^XLFSTR("@LABORATORY@TEST@(File@60)@",39)," @","= ")
 S HEADER(7)="Error Description"
 S $E(HEADER(7),32)="Count"
 S $E(HEADER(7),42)="IEN"
 S $E(HEADER(7),52)="Description"
 S $E(HEADER(7),74)="Count"
 ;
 S (CNT,ERRMTOT,F60GTOT,LAB60IEN)=0
 ;
 S ERRMSG=""
 Q "OK"
 ;
ERRMLINE ; EP - Error Message Line
 I LINES<(MAXLINES+1) D JUSTERRM
 I LINES>MAXLINES D ERRMCPG  Q:QFLG="Q"
 S LAB60IEN=0
 Q
 ;
ERRMCPG ; EP
 D HEADERPG^BLRGMENU(.PG,.QFLG,HEDONE)  Q:QFLG="Q"
 ;
JUSTERRM ; EP 
 W $E(ERRMSG,1,30)
 W ?31,$J($G(^BLRLUPAC(DATETIME,"ERRORS",ERRMSG)),7)
 S:HEDONE="YES" PG=PG+1,LINES=7
 Q
 ;
L60LINE ; EP
 I LINES>MAXLINES&(HEDONE'="YES") D ERRMCPG  Q:QFLG="Q"
 ;
 S L60DESC=$$TRIM^XLFSTR($P($G(^LAB(60,LAB60IEN,0)),"^"),"LR"," ")
 ;
 W ?41,LAB60IEN
 W ?51,$E(L60DESC,1,18)
 W ?73,$J($G(^BLRLUPAC(DATETIME,"ERRORS",ERRMSG,LAB60IEN)),7)
 W !
 ;
 S LINES=LINES+1
 S F60GTOT=F60GTOT+$G(^BLRLUPAC(DATETIME,"ERRORS",ERRMSG,LAB60IEN))
 Q
 ;
ERRMTOTL ; EP
 W !
 S LINES=LINES+1
 S ERRMTOT=ERRMTOT+$G(^BLRLUPAC(DATETIME,"ERRORS",ERRMSG))
 Q
 ;
ERR60TOT ; EP
 W ?31,$TR($J("",7)," ","-")
 W ?73,$TR($J("",7)," ","-")
 W !
 W ?9,"TOTALS"
 W ?31,$J(ERRMTOT,7)
 W ?73,$J(F60GTOT,7)
 W !
 Q
