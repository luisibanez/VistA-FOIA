QAOSPRS0 ;HISC/DAD,JCW-REVIEW SUMMARY REPORT ;4/30/93  09:26
 ;;3.0;Occurrence Screen;;09/14/1993
 K DIR S DIR(0)="LO^1:3^K:X[""."" X",DIR("A")="Select screen criteria to include",DIR("B")=1
 S DIR("?",1)="Choose from:",DIR("?",2)="  1   National",DIR("?",3)="  2   Local",DIR("?",4)="  3   Inactive",DIR("?")="Select any combination of the codes listed above, e.g. 1-3, 1,2"
 W ! D ^DIR G:$D(DIRUT) EXIT S QAOSLIST=$TR(Y,"123,","NL1")
 W !!,"Select the reporting period:" D ^QAQDATE G:QAQQUIT EXIT
 W !,"NOTE: This is a 132 column report."
DEVICE ;
 K %ZIS S %ZIS="QM",%ZIS("B")="" W ! D ^%ZIS G:POP EXIT
 I $D(IOM)#2,IOM<132 D ^%ZISC W !?5,"*** Please choose a 132 column output device !! ***",*7 G DEVICE
 I $D(IO("Q")) K IO("Q") S ZTRTN="ENTSK^QAOSPRS0",(ZTSAVE("QAQ*"),ZTSAVE("QAO*"))="",ZTDESC="Occurrence Screen Review Summary Report" D ^%ZTLOAD G EXIT
ENTSK ;
 D SETUP^QAOSPRS2
 F QAOSDT=QAQNBEG-.0000001:0 S QAOSDT=$O(^QA(741,"C",QAOSDT)) Q:(QAOSDT'>0)!(QAOSDT>(QAQNEND+.24))  F QAOSD0=0:0 S QAOSD0=$O(^QA(741,"C",QAOSDT,QAOSD0)) Q:QAOSD0'>0  D LOOP
 U IO D ^QAOSPRS1
EXIT ;
 D ^%ZISC
 K %DT,%ZIS,DIR,DIRUT,POP,QA,QAOSACTN,QAOSCLIN,QAOSCONF,QAOSD0,QAOSD1,QAOSD2,QAOSDD,QAOSDT,QAOSEVER,QAOSFIND,QAOSHOSP,QAOSIEN,QAOSLIST,QAOSMGMT,QAOSNUM,QAOSPAGE,QAOSPEER,QAOSQOCS,QAOSQUIT,QAOSREVR,QAOSRV,QAOSRVNO
 K QAOSSCRN,QAOSSERV,QAOSSEVR,QAOSTEXT,QAOSTYPE,QAOSWARD,QAOSZERO,QAOTODAY,QAOTOTAL,TAB,TOT,UNDL1,UNDL2,X,Y,ZTDESC,ZTRTN,ZTSAVE
 D KILLTMP^QAOSPRS2,K^QAQDATE
 S:$D(ZTQUEUED) ZTREQ="@"
 Q
LOOP ;
 S QAOSZERO=$G(^QA(741,QAOSD0,0)),QAOSSCRN=+$G(^("SCRN"))
 S QAOSTYPE=$P($G(^QA(741.1,QAOSSCRN,0)),"^",4) Q:(QAOSTYPE="")!(QAOSLIST'[QAOSTYPE)
 S QAOTOTAL("RECR",QAOSTYPE)=QAOTOTAL("RECR",QAOSTYPE)+1
 I $P(QAOSZERO,"^",11)=2 S QAOTOTAL("DELT",QAOSTYPE)=QAOTOTAL("DELT",QAOSTYPE)+1 Q
 S QAOSHOSP=+$P(QAOSZERO,"^",5)
 S QAOSHOSP(0)=$G(^SC(QAOSHOSP,0))
 I $P(QAOSHOSP(0),"^",3)="C" D
 . S QAOSSERV=$P(QAOSHOSP(0),"^",8)
 . S:QAOSSERV="N" QAOSSERV="NE"
 . S:QAOSSERV="0" QAOSSERV=""
 . Q
 E  D
 . S QAOSWARD=+$G(^SC(QAOSHOSP,42))
 . S QAOSSERV=$P($G(^DIC(42,QAOSWARD,0)),"^",3)
 . Q
 S:QAOSSERV="" QAOSSERV="^"
 S QAOSRVNO=$P("4^11^8^6^5^3^9^10^2^1^7^12","^",$L($P(QAOSRV,QAOSSERV),";"))
CLIN ;
 S QAOSFIND=""
 F QAOSD1=0:0 S QAOSD1=$O(^QA(741,QAOSD0,"REVR","B",QAOSCLIN,QAOSD1)) Q:(QAOSD1'>0)!(QAOSFIND=3)  D
 . S QAOSFIND=+$P($G(^QA(741,QAOSD0,"REVR",QAOSD1,0)),"^",5)
 . S QAOSFIND=+$G(^QA(741.6,QAOSFIND,0)) Q:(QAOSFIND'>0)!(QAOSFIND=3)
 . S ^TMP($J,QAOSTYPE,"CLIN",QAOSFIND)=$G(^TMP($J,QAOSTYPE,"CLIN",QAOSFIND))+1
 . S QAOTOTAL("CLIN",QAOSTYPE)=QAOTOTAL("CLIN",QAOSTYPE)+1
 . Q
 I QAOSFIND=3 S QAOTOTAL("EXCP",QAOSTYPE)=QAOTOTAL("EXCP",QAOSTYPE)+1 Q
 S QAOTOTAL("OCCR",QAOSTYPE)=QAOTOTAL("OCCR",QAOSTYPE)+1
PEER ;
 F QAOSD1=0:0 S QAOSD1=$O(^QA(741,QAOSD0,"REVR","B",QAOSPEER,QAOSD1)) Q:QAOSD1'>0  D
 . S QA=$G(^QA(741,QAOSD0,"REVR",QAOSD1,0))
 . Q:$P(QA,"^",9)'>0
 . S QAOSFIND=+$P(QA,"^",5),QAOSFIND=+$G(^QA(741.6,QAOSFIND,0))
 . Q:QAOSFIND'>0
 . S $P(^TMP($J,QAOSTYPE,"PEER",QAOSFIND),"^",QAOSRVNO)=$P($G(^TMP($J,QAOSTYPE,"PEER",QAOSFIND)),"^",QAOSRVNO)+1
 . S QAOTOTAL("PEER",QAOSTYPE)=QAOTOTAL("PEER",QAOSTYPE)+1
 . Q
MGMT ;
 F QAOSD1=0:0 S QAOSD1=$O(^QA(741,QAOSD0,"REVR","B",QAOSMGMT,QAOSD1)) Q:QAOSD1'>0  F QAOSD2=0:0 S QAOSD2=$O(^QA(741,QAOSD0,"REVR",QAOSD1,2,QAOSD2)) Q:QAOSD2'>0  D
 . S QAOSACTN=+^QA(741,QAOSD0,"REVR",QAOSD1,2,QAOSD2,0)
 . S QAOSACTN=+$G(^QA(741.7,QAOSACTN,0)) Q:QAOSACTN'>0
 . S $P(^TMP($J,QAOSTYPE,"MGMT",QAOSACTN),"^",QAOSRVNO)=$P($G(^TMP($J,QAOSTYPE,"MGMT",QAOSACTN)),"^",QAOSRVNO)+1
 . S QAOTOTAL("MGMT",QAOSTYPE)=QAOTOTAL("MGMT",QAOSTYPE)+1
 . Q
SEVER ;
 S QAOSEVER=+$P(QAOSZERO,"^",18),QAOSEVER=$G(^QA(741.8,QAOSEVER,0))
 I QAOSEVER]"" D
 . S ^TMP($J,QAOSTYPE,"SEVR",+QAOSEVER)=$G(^TMP($J,QAOSTYPE,"SEVR",+QAOSEVER))+1
 . S QAOTOTAL("SEVR",QAOSTYPE)=QAOTOTAL("SEVR",QAOSTYPE)+1
 . Q
CMTE ;
 F QAOSD1=0:0 S QAOSD1=$O(^QA(741,QAOSD0,"CMTE",QAOSD1)) Q:QAOSD1'>0  D
 . S QAOSCONF=$P($G(^QA(741,QAOSD0,"CMTE",QAOSD1,0)),"^",5)
 . Q:QAOSCONF'>0
 . S ^TMP($J,QAOSTYPE,"CMTE",QAOSCONF)=$G(^TMP($J,QAOSTYPE,"CMTE",QAOSCONF))+1
 . S QAOTOTAL("CMTE",QAOSTYPE)=QAOTOTAL("CMTE",QAOSTYPE)+1
 . Q
 Q