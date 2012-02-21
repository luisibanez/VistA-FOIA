ECUMRPC1 ;ALB/JAM-Event Capture Management Broker Utilities ;28 Nov 00
 ;;2.0; EVENT CAPTURE ;**25,30,33,72**;8 May 96
 ;
DSSUNT(RESULTS,ECARY) ;
 ;
 ;This broker entry point returns DSS units from file 724
 ;        RPC: EC GETDSSUNIT
 ;INPUTS         ECARY - Contains the following subscripted elements
 ;               STAT   - Active or inactive DSS Units (optional)
 ;               A-ctive (default), I-nactive, B-oth
 ;
 ;OUTPUTS        RESULTS - Array of DSS units. Data pieces as follows:-
 ;               PIECE - Description
 ;                 1     IEN of DSS Unit
 ;                 2     Name of DSS Unit
 ;                 3     Service
 ;                 4     Medical Specialty
 ;                 5     Cost Center
 ;                 6     Unit Number
 ;                 7     Inactive Flag
 ;                 8     Associated Stop code (if not sending to PCE)
 ;                 9     Category flag
 ;                 10    Default date entry
 ;                 11    Send to PCE Flag
 ;
 N UNT,STAT,CNT,CAT,NODE,ECS,STR,SRV,MED,CST,UNO,INACT,ASC,PCE,ACT,NODE
 N DFD
 D SETENV^ECUMRPC
 K ^TMP($J,"ECDSSUNT")
 S STAT=$P($G(ECARY),U),(CNT,UNT)=0 S:STAT="" STAT="A"
 F  S UNT=$O(^ECD(UNT)) Q:'UNT  S NODE=$G(^ECD(UNT,0)) I NODE'="" D
 . S ECS=$P(NODE,U,8),ACT=$P(NODE,U,6),ACT=$S(ACT:1,1:0)
 . Q:'ECS  I $S(STAT="A"&(ACT):1,STAT="I"&('ACT):1,1:0) Q
 . S CNT=CNT+1,CAT=$P(NODE,U,11),CAT=$S(CAT:"Y",1:"N"),UNO=$P(NODE,U,5)
 . S SRV=$$GET1^DIQ(49,$P(NODE,U,2),.01,"I")
 . S MED=$$GET1^DIQ(723,$P(NODE,U,3),.01,"I")
 . S CST=$$GET1^DIQ(420.1,$P(NODE,U,4),.01,"I")
 . S INACT=$P(NODE,U,6),INACT=$S(INACT:"I",1:"A"),ASC=$P(NODE,U,10)
 . S:ASC ASC=$$GET1^DIQ(40.7,ASC,.01,"I")
 . S DFD=$S($P(NODE,U,12)="N":"N",1:"X"),PCE=$P(NODE,U,14)
 . S PCE=$S(PCE="A":PCE,PCE="O":PCE,1:"N")
 . S STR=UNT_U_$P(NODE,U)_U_SRV_U_MED_U_CST_U_UNO_U_INACT_U_ASC_U_CAT
 . S STR=STR_U_DFD_U_PCE,^TMP($J,"ECDSSUNT",CNT)=STR
 S RESULTS=$NA(^TMP($J,"ECDSSUNT"))
 Q
CAT(RESULTS,ECARY) ;
 ;
 ;This broker entry point returns a list of categories from file 726
 ;        RPC: EC GETCAT
 ;INPUTS         ECARY - Contains the following subscripted elements
 ;                STAT - Active or inactive category (optional)
 ;                A-ctive (default), I-nactive, B-oth
 ;
 ;OUTPUTS        RESULTS - Array of category. Data pieces as follows:-
 ;               PIECE - Description
 ;                 1     IEN of Category
 ;                 2     Name of Category
 ;                 3     Creation Date
 ;                 4     Inactive Date
 ;
 N STAT,CNT,CAT,NODE,ECDT,INDT,CRDT
 D SETENV^ECUMRPC
 K ^TMP($J,"ECCAT")
 S STAT=$P($G(ECARY),U),(CNT,CAT)=0 S:STAT="" STAT="A"
 F  S CAT=$O(^EC(726,CAT)) Q:'CAT  S NODE=$G(^EC(726,CAT,0)) I NODE'="" D
 . S ECDT=$P(NODE,U,3)
 . I STAT="A",ECDT'="",ECDT'>DT Q
 . I STAT="I",ECDT="" Q
 . S CRDT=$$FMTE^XLFDT($P(NODE,U,2),"2F")
 . S INDT=$$FMTE^XLFDT($P(NODE,U,3),"2F")
 . S CNT=CNT+1,^TMP($J,"ECCAT",CNT)=CAT_U_$P(NODE,U)_U_CRDT_U_INDT
 S RESULTS=$NA(^TMP($J,"ECCAT"))
 Q
 ;
CATCHK(RESULTS,ECARY) ;
 ;
 ;Broker call checks whether category is used in an Event Code Screen.
 ;        RPC: EC DSSCATCHECK
 ;INPUTS   ECARY  - Contains the following subscripted elements
 ;          ECDA  - DSS Unit ien (file #724)
 ;
 ;OUTPUTS  RESULTS - Category used in Event Code Screen, 1-Yes or 0-No
 ;
 N ECDA,ECFLG,ECX
 D SETENV^ECUMRPC
 S ECDA=$P(ECARY,U) I ECDA="" Q
 S (ECFLG,ECX)=0
 F  S ECX=$O(^ECJ("AP",ECX)) Q:'ECX!(ECFLG)  D
 . I $D(^ECJ("AP",ECX,ECDA)) S ECFLG=1
 S RESULTS=ECFLG
 Q
PXCHK(RESULTS,ECARY) ;
 ;
 ;Checks whether procedure description or national number exist
 ;INPUTS   ECARY  - Contains the following subscripted elements
 ;          ECP - Procedure description
 ;          ECN - EC National Number
 ;
 ;OUTPUTS  RESULTS - Px used^National # used, 1-Yes or 0-No ex. 1^0
 ;
 N ECX,ECP,ECN
 Q:$G(ECARY)
 D SETENV^ECUMRPC
 S ECP=$P(ECARY,U),ECN=$P(ECARY,U,2),RESULTS="0^0"
 I ECP'="",$D(^EC(725,"B",ECP)) S $P(RESULTS,U)=1
 I ECN'="" F ECX="E","D","DL" D  I $P(RESULTS,U,2) Q
 . I $D(^EC(725,ECX,ECN)) S $P(RESULTS,U,2)=1
 Q
SRCLST(RESULTS,ECARY) ;
 ;
 ;This broker entry returns an array of codes from a file based on a 
 ;search string.
 ;        RPC: EC GETLIST
 ;
 ;INPUTS      ECARY   - Contains the following subscripted elements
 ;             ECSTR  - Search string
 ;             ECFIL  - File to search
 ;             ECDIR  - Search order
 ;
 ;OUTPUTS     RESULTS - Array of values based on the search criteria.
 ;
 N ECNT,DIC,ECSTR,ECFIL,ECORD,ECER,ECDI
 D SETENV^ECUMRPC
 S ECNT=0,ECFIL=$P(ECARY,U),ECSTR=$P(ECARY,U,2),ECDIR=$P(ECARY,U,3)
 S ECORD=$S(ECDIR=-1:"B",1:"I")
 K ^TMP($J,"ECFIND"),^TMP("ECSRCH",$J)
 I ECFIL="" Q
 S ECNUM=44
 I ECFIL=420.1 D CSTCTR            ;Cost Center search
 I ECFIL=49 D SERVC                ;Service search
 I ECFIL=723 D MEDSPC              ;Medical specialty
 I ECFIL=40.7 D STPCDE G EXIT      ;Associated stop code
 I ECFIL=724 D DUNT G EXIT         ;DSS Unit
 I ECFIL=726 D ECAT                ;Category
 I ECFIL=4 D LOC                   ;Location
 I ECFIL=44 D ASCLN G EXIT         ;Associated clinic
 I ECFIL=757.01 D LEX^ECUMRPC2 G EXIT  ;Lex ICD code
 I ECFIL=200 D PROV^ECUMRPC2      ;Providers
 I $D(ECER) S ^TMP($J,"ECFIND",1)="0^Error occurred during search" G EXIT
 D SORT
EXIT K ^TMP("ECSRCH",$J)
 S RESULTS=$NA(^TMP($J,"ECFIND"))
 Q
ASCLN ;Search for active associated clinics (file #44)
 N CNT,NOD,ECDT,INACT,REACT,ERR
 S CNT=0,ECDT=DT
 F  Q:CNT=ECNUM  S ECSTR=$O(^SC("B",ECSTR),ECDIR) Q:ECSTR=""  S CLN="" D
 .F  S CLN=$O(^SC("B",ECSTR,CLN),ECDIR) Q:CLN=""  S NOD=$G(^SC(CLN,0)) D
 ..Q:NOD=""  Q:$P(NOD,U,3)'="C"  ;Q:+$G(^SC(CLN,"OOS"))
 ..S ERR=0 I $D(^SC(CLN,"I")) D  I ERR Q
 ...S INACT=$P(^SC(CLN,"I"),U),REACT=$P(^SC(CLN,"I"),U,2)
 ...I INACT D  I ERR Q
 ....I REACT="" S:ECDT'<INACT ERR=1 Q
 ....I ECDT'<INACT,ECDT<REACT S ERR=1 Q
 ...I REACT,ECDT<REACT S ERR=1
 ..S CNT=CNT+1,^TMP($J,"ECFIND",CNT)=CLN_U_$P(NOD,U)
 Q
CSTCTR ;Search for cost centers (File #420.1)
 N ECNULL,INDX,STR,NSTR,I
 S $P(ECNULL," ",7)=" ",INDX="B"
 I $E(ECSTR)?.N,$L(ECSTR)<7 S ECSTR=ECSTR_$E(ECNULL,1,7-$L(ECSTR))
 I $L($P(ECSTR," "))=6,$P(ECSTR," ",2)?.A D   ;truncate for x-ref
 . S ECSTR=$P(ECSTR," ")_" "_$E($P(ECSTR," ",2,999),1,22)
 I $E(ECSTR)?.A S INDX="C",(STR,NSTR)="" D  S ECSTR=NSTR
 .F I=1:1 S STR=$P(ECSTR," ",I) Q:STR=""  D
 ..S STR=$E(STR)_$TR($E(STR,2,9999),"ABCDEFGHIJKLMNOPQRSTUVWXYZ","abcdefghijklmnopqrstuvwxyz")
 ..S NSTR=NSTR_STR
 D LISTDIC(ECFIL,"",.01,ECORD,ECNUM,ECSTR,"",INDX,"I '$P(^(0),U,2)","","^TMP(""ECSRCH"",$J)","ECER")
 Q
SERVC ;Search for services (File #49)
 D LISTDIC(ECFIL,"",.01,ECORD,ECNUM,ECSTR,"","","","","^TMP(""ECSRCH"",$J)","ECER")
 Q
MEDSPC ;Search for medical specialty (File #723)
 D LISTDIC(ECFIL,"",.01,ECORD,ECNUM,ECSTR,"","","","","^TMP(""ECSRCH"",$J)","ECER")
 Q
STPCDE ;Search for associated stop code (File #40.7)
 N ECNT,INDX,ECNUL,STR,IEN
 S $P(ECNUL,"  ",30)=" ",INDX="B",ECNT=0,ECSTR=$P(ECSTR,"~")
 I +ECSTR,+ECSTR?.N S INDX="C",IEN=0 D  Q
 .S ECSTR=$O(^DIC(40.7,INDX,+ECSTR)) I ECSTR="" Q
 .F  S IEN=$O(^DIC(40.7,INDX,ECSTR,IEN)) Q:'IEN  D  I ECNT>(ECNUM-1) Q
 ..S STR=$G(^DIC(40.7,IEN,0)) I (STR="")!($P(STR,U,3)'="") Q
 ..S STR=$E($P(STR,U),1,30)_"  ["_$J($P(STR,U,2),3,0)_"]"_U_$P(STR,U,2)_U_IEN
 ..S ECNT=ECNT+1,^TMP($J,"ECFIND",ECNT)=STR
 D LISTDIC(ECFIL,"",".01;1",ECORD,ECNUM,ECSTR,"",INDX,"I $P(^(0),""^"",3)=""""!($P(^(0),U,3)'<DT)","","^TMP(""ECSRCH"",$J)","ECER")
 S ECNT=0
 F  S ECNT=$O(^TMP("ECSRCH",$J,"DILIST","ID",ECNT)) Q:'ECNT  D
 .S STR=$G(^TMP("ECSRCH",$J,"DILIST","ID",ECNT,.01))_U_$G(^(1))
 .S STR=$E($P(STR,U),1,30)_"  ["_$J($P(STR,U,2),3,0)_"]"_U_$P(STR,U,2)
 .S ^TMP($J,"ECFIND",ECNT)=STR_U_^TMP("ECSRCH",$J,"DILIST",2,ECNT)
 Q
DUNT ;Search for DSS unit (File #724)
 N ECNT,SNDPCE
 D LISTDIC(ECFIL,"",".01;10;13",ECORD,ECNUM,ECSTR,"","","I '$P(^(0),""^"",6),$P(^(0),U,8)","","^TMP(""ECSRCH"",$J)","ECER")
 S ECNT=0
 F  S ECNT=$O(^TMP("ECSRCH",$J,"DILIST","ID",ECNT)) Q:'ECNT  D
 .S SNDPCE=$G(^TMP("ECSRCH",$J,"DILIST","ID",ECNT,13))
 .S SNDPCE=$S(SNDPCE="O":1,SNDPCE="A":1,1:0)
 .S ^TMP($J,"ECFIND",ECNT)=$G(^TMP("ECSRCH",$J,"DILIST","ID",ECNT,.01))_U_^TMP("ECSRCH",$J,"DILIST",2,ECNT)_U_$G(^TMP("ECSRCH",$J,"DILIST","ID",ECNT,10))_U_SNDPCE
 Q
ECAT ;Search for Category (File #726)
 D LISTDIC(ECFIL,"",.01,ECORD,ECNUM,ECSTR,"","","I $P(^(0),""^"",3)=""""!($P(^(0),U,3)>DT)","","^TMP(""ECSRCH"",$J)","ECER")
 Q
LOC ;Search for Location (File #4)
 D LISTDIC(ECFIL,"",.01,ECORD,ECNUM,ECSTR,"","","I $G(^(""EC""))","","^TMP(""ECSRCH"",$J)","ECER")
 Q
LISTDIC(ECFL,ECIEN,ECFLD,ECFLG,ECNUM,ECFRM,ECPRT,ECINDX,ECSCN,ECIND,ECTG,ECER) ;
 ;Produces a list of records in a file base on search string
 N DIC
 D LIST^DIC(ECFL,ECIEN,ECFLD,ECFLG,ECNUM,ECFRM,ECPRT,ECINDX,ECSCN,ECIND,ECTG,ECER)
 K ECFL,ECIEN,ECFLD,ECFLG,ECNUM,ECFRM,ECPRT,ECINDX,ECSCN,ECID
 Q
SORT ;Extracts data to be returned to broker
 N ECNT,STR
 S ECNT=0
 F  S ECNT=$O(^TMP("ECSRCH",$J,"DILIST","ID",ECNT)) Q:'ECNT  D
 .S ^TMP($J,"ECFIND",ECNT)=$G(^TMP("ECSRCH",$J,"DILIST","ID",ECNT,.01))_U_^TMP("ECSRCH",$J,"DILIST",2,ECNT)
 Q
