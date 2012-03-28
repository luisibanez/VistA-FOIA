ASUMSTRD ; IHS/ITSC/LMH -SET FIELD VARS STATION MASTER ;  
 ;;4.2T2;Supply Accounting Mgmt. System;;JUN 30, 2000
 ;;This routine is a utility routine which provides an entry point to
 ;;read (retreve) data from the SAMS Station Master file.
 ;;(in global ^ASUMS & VA Fileman file ASUMST STATION)
M ;EP;SET ALL
 D S,MI,MIC,MEXP Q
S ;EP SET FIELDS
 I $G(ASUMS("E#","STA"))="" S ASUMS("E#","STA")=$G(ASUL(2,"STA","E#")) Q:ASUMS("E#","STA")']""
 S ASUMS(0)=$G(^ASUMS(ASUMS("E#","STA"),0)) I ASUMS(0)="" S Y=-1 Q
 S ASUMS("STA")=$P(ASUMS(0),U)
 S ASUMS("AR")=$P(ASUMS(0),U,2)
 Q
SK ;EP KILL DFN & VARS
 K ASUMS("E#","STA")
SKF ;EP KILL DATA VARS
 K ASUMS("STA"),ASUMS("AR"),ASUMS(0) Q
MI ;EP SET DATA VARS
 I $G(ASUMS("E#","IDX"))="" S ASUMS("E#","IDX")=$G(ASUMX("E#","IDX"))
 I ASUMS("E#","IDX")="" S (ASUMS(0),ASUMS(2),ASUMS(3))="" D ASUSRIDX Q
 S ASUMS(0)=$G(^ASUMS(ASUMS("E#","STA"),1,ASUMS("E#","IDX"),0))
 I ($P(ASUMS(0),U)[999999)!($P($G(^ASUMX(ASUMS("E#","IDX"),0)),U,1)[999999) S ASUF("DLIDX")=1
 E  S ASUF("DLIDX")=0 S:ASUMS(0)="" ASUMS(0)=ASUMS("E#","IDX")
 S ASUMS("ESTB")=$P(ASUMS(0),U,2)
 S ASUMS(2)=$G(^ASUMS(ASUMS("E#","STA"),1,ASUMS("E#","IDX"),2))
 S ASUMS(3)=$G(^ASUMS(ASUMS("E#","STA"),1,ASUMS("E#","IDX"),3))
 D ASUSRIDX
 Q
MIK ;EP KILL STATION DFN & DATA VARIABLES
 K ASUMS("E#","IDX")
MIKF ;EP KILL STATION DATA VARIABLES
 K ASUMS
 Q
ASUSRIDX ;INDEX FIELDS OF STATION MASTER
 ;WAR 3/2/2000 - changed next line... see the line below, it for change
 ;There was a problem with STD DLY Rpts when the IDX was deleted
 ;S ASUMS("E#","IDX")=$P(ASUMS(0),U)
 I ($G(ASUMS("E#","IDX"))="")&(($P(ASUMS(0),U))'[999999) D
 .S ASUMS("E#","IDX")=$P(ASUMS(0),U)
 S ASUMS("ORD#")=$P(ASUMS(0),U,3)
 N X S (X,ASUMS("SRC"))=$P(ASUMS(0),U,4) D:X]"" SRC^ASULDIRF(X)
 S ASUMS("LTM")=$P(ASUMS(0),U,5)
 S ASUMS("RPQ-O")=$P(ASUMS(0),U,6)
 S ASUMS("PMIQ")=$P(ASUMS(0),U,7)
 S ASUMS("RPQ")=$P(ASUMS(0),U,8)
 S ASUMS("LSTISS")=$P(ASUMS(0),U,13)
 S ASUMS("VENAM")=$P(ASUMS(0),U,14)
 S ASUMS("LPP")=$P(ASUMS(0),U,15)
 S ASUMS("PMIV")=$FN((ASUMS("PMIQ")*ASUMS("LPP")),"",0)
 S ASUMS("VAL","O/H")=$P(ASUMS(0),U,16)
 S ASUMS("QTY","O/H")=+($P(ASUMS(0),U,17))
 I ASUMS("QTY","O/H")=0 D
 .S ASUMS("CST/U")=ASUMS("LPP")
 E  D
 .S ASUMS("CST/U")=$FN((ASUMS("VAL","O/H")/ASUMS("QTY","O/H")),"",2)
 S ASUMS("D/I","QTY",1)=$P(ASUMS(0),U,18)
 S ASUMS("D/I","VAL",1)=$P(ASUMS(0),U,19)
 S ASUMS("D/I","PO#",1)=$P(ASUMS(0),U,20)
 S ASUMS("D/I","DT",1)=$P(ASUMS(0),U,21)
 S ASUMS("D/I","SSA",1)=$P(ASUMS(0),U,22)
 S ASUMS("D/I","QTY",2)=$P(ASUMS(0),U,23)
 S ASUMS("D/I","VAL",2)=$P(ASUMS(0),U,24)
 S ASUMS("D/I","PO#",2)=$P(ASUMS(0),U,25)
 S ASUMS("D/I","DT",2)=$P(ASUMS(0),U,26)
 S ASUMS("D/I","SSA",2)=$P(ASUMS(0),U,27)
 S ASUMS("D/I","QTY",3)=$P(ASUMS(0),U,28)
 S ASUMS("D/I","VAL",3)=$P(ASUMS(0),U,29)
 S ASUMS("D/I","PO#",3)=$P(ASUMS(0),U,30)
 S ASUMS("D/I","DT",3)=$P(ASUMS(0),U,31)
 S ASUMS("D/I","VAL-TOT")=ASUMS("D/I","VAL",1)+ASUMS("D/I","VAL",2)+ASUMS("D/I","VAL",3)
 S ASUMS("D/I","QTY-TOT")=ASUMS("D/I","QTY",1)+ASUMS("D/I","QTY",2)+ASUMS("D/I","QTY",3)
 S ASUMS("D/I","SSA",3)=$P(ASUMS(0),U,32)
 N X S (X,ASUMS("SLC"))=$P(ASUMS(2),U) D SLC^ASULDIRR(X)
 S ASUMS("D/O","QTY")=$S($P(ASUMS(2),U,2)>0:$P(ASUMS(2),U,2),1:0)
 S ASUMS("VENUI")=$P(ASUMS(2),U,3)
 S ASUMS("SFSKM")=$P(ASUMS(2),U,4)
 S ASUMS("SPQ")=$P(ASUMS(2),U,6)
 D EOQ
 S ASUMS("VALBEG")=$P(ASUMS(2),U,7)
 S ASUMS("QTY-BEG")=$P(ASUMS(2),U,8)
 S ASUMS("D/I","DTR72",1)=$P(ASUMS(2),U,9)
 S ASUMS("D/I","DTR72",2)=$P(ASUMS(2),U,10)
 S ASUMS("D/I","DTR72",3)=$P(ASUMS(2),U,11)
 S ASUMS("R73","REM")=$P(ASUMS(3),U)
 S ASUMS("R73","PER")=$P(ASUMS(3),U,2)
 S ASUMS("R73","DT")=$P(ASUMS(3),U,3)
 S ASUMS("R13","TIMES")=$P(ASUMS(3),U,4)
 Q
EOQ ;
 S ASUMS("EOQ","TP")=$P(ASUMS(2),U,5)
 I ASUMS("EOQ","TP")]"" D
 .D EOQ^ASULDIRF(ASUMS("EOQ","TP"))
 S ASUMS("STKST")=ASUMS("QTY","O/H")+ASUMS("D/I","QTY-TOT")-ASUMS("D/O","QTY")
 S ASUMS("EOQ","TB")=$P(ASUMS(0),U,9)
 I ASUMS("EOQ","TB")]"" D
 .D EOQT^ASULDIRF(ASUMS("EOQ","TB"))
 .I Y<0 D STA^ASULARST(ASUMS("E#","STA")) S ASUMS("EOQ","TB")=$S(ASUL(2,"STA","EOQTB")="":50,1:ASUL(2,"STA","EOQTB"))
 E  D
 .D STA^ASULARST(ASUMS("E#","STA")) S ASUMS("EOQ","TB")=$S(ASUL(2,"STA","EOQTB")="":50,1:ASUL(2,"STA","EOQTB"))
 I ASUMS("EOQ","TB")="" S ASUMS("EOQ","TB")=50
 D EOQT^ASULDIRF(ASUMS("EOQ","TB"))
 S ASUMS("EOQ","MM")=$P(ASUMS(0),U,10)
 S ASUMS("EOQ","QM")=$P(ASUMS(0),U,11)
 S ASUMS("EOQ","AM")=$P(ASUMS(0),U,12)
 S (ASUU(19),ASUF("EOQ"))=0
 F  S ASUU(19)=$O(ASUL(8,"EOQTB",ASUU(19))) Q:ASUU(19)=""  Q:ASUF("EOQ")  D
 .S ASUMS("EOQ","MO")=$P(ASUL(8,"EOQTB",ASUU(19)),U,2)
 .I $P(ASUL(8,"EOQTB",ASUU(19)),U)>ASUMS("PMIV") S ASUF("EOQ")=1
 K ASUF("EOQ")
 F ASUU(19)=1:1:4 I $E(ASUMS("EOQ","AM"),ASUU(19),ASUU(19))=0 D
 .S ASUMS("EOQ","AM")=$E(ASUMS("EOQ","AM"),1,ASUU(19)-1)_" "_$E(ASUMS("EOQ","AM"),ASUU(19)+1,$L(ASUMS("EOQ","AM")))
 K ASUU(19)
 I "ADFQS"[ASUMS("EOQ","TP") D  Q
 .S ASUMS("EOQ","QTY")=(ASUMS("PMIQ")*ASUMS("EOQ","MO"))+ASUMS("RPQ")-ASUMS("STKST")
 .I ASUMS("EOQ","QTY")<0 S:"AQS"[ASUMS("EOQ","TP") ASUMS("EOQ","QTY")=0
 I "B"[ASUMS("EOQ","TP") D  Q
 .S ASUMS("EOQ","QTY")=(ASUMS("PMIQ")*ASUMS("EOQ","MO"))+ASUMS("RPQ")-ASUMS("STKST")
 .S ASUV("EOQ")=ASUMS("EOQ","QM")+ASUMS("RPQ")-ASUMS("STKST")-ASUMS("PMIQ")
 .S:ASUMS("EOQ","QM")<ASUV("EOQ") ASUV("EOQ")=ASUMS("EOQ","QM")
 .S:ASUV("EOQ")<ASUMS("EOQ","QTY") ASUMS("EOQ","QTY")=ASUV("EOQ")
 I "C"[ASUMS("EOQ","TP") D  Q
 .S ASUMS("EOQ","QTY")=(ASUMS("PMIQ")*ASUMS("EOQ","MO"))+ASUMS("RPQ")-ASUMS("STKST")
 .S ASUV("EOQ")=(ASUMS("EOQ","MM")*ASUMS("PMIQ"))+ASUMS("RPQ")-ASUMS("STKST")-ASUMS("PMIQ")
 .S ASUV("EOQ",2)=ASUMS("EOQ","MM")*ASUMS("PMIQ")
 .S:ASUV("EOQ",2)<ASUV("EOQ") ASUV("EOQ")=ASUV("EOQ",2)
 .S:ASUV("EOQ")<ASUMS("EOQ","QTY") ASUMS("EOQ","QTY")=ASUV("EOQ")
 I "PYR"[ASUMS("EOQ","TP") S ASUMS("EOQ","QTY")=0
 S ASUMS("EOQ","QTY")=$FN(ASUMS("EOQ","QTY"),"",0)
 N X S X=ASUMS("EOQ","QTY"),Y="" D EOQ^ASU3ISQA(.X,.Y) S ASUMS("EOQ","QTY")=Y
 Q
MIC ;EP SET DEMAND DATA
 Q:$G(ASUMS("E#","STA"))=""
 Q:$G(ASUMS("E#","IDX"))=""
 S (ASUMS("DMD","QTY"),ASUMS("DMD","CALL"))=0
 F ASUV("MO")=1:1:12 D MMC
 N X S X2=ASUMS("ESTB"),X1=ASUK("DT","FM") D ^%DTC S ASUMS("ESTB","MO")=$FN((X/30),"",0) S:ASUMS("ESTB","MO")=0 ASUMS("ESTB","MO")=1
 I ASUMS("ESTB","MO")>11 D
 .S ASUMS("AMIQ")=$FN((ASUMS("DMD","QTY")/12),"",0)
 E  D
 .S ASUMS("AMIQ")=$FN((ASUMS("DMD","QTY")/ASUMS("ESTB","MO")),"",0)
 K ASUV("MO"),ASUMS("DMD",0)
 Q
MICK ;EP KILL DEMAND DATA
 K ASUMS("DMD")
 Q
MMC ;MONTH
 S ASUMS("DMD",0)=""
 S:$D(^ASUMS(ASUMS("E#","STA"),1,ASUMS("E#","IDX"),1,ASUV("MO"),0)) ASUMS("DMD",0)=^ASUMS(ASUMS("E#","STA"),1,ASUMS("E#","IDX"),1,ASUV("MO"),0)
 S ASUMS("DMD","CALL",ASUV("MO"))=+($P(ASUMS("DMD",0),U,2))
 S ASUMS("DMD","CALL")=$G(ASUMS("DMD","CALL"))+ASUMS("DMD","CALL",ASUV("MO"))
 S ASUMS("DMD","QTY",ASUV("MO"))=+($P(ASUMS("DMD",0),U,3))
 S ASUMS("DMD","QTY")=$G(ASUMS("DMD","QTY"))+ASUMS("DMD","QTY",ASUV("MO"))
MEXP ;SET EXPIRATION VARIABLES
 N X,Y
 S ASUMS("E#","DXP")=0,ASUMS("DXP",0)=0
 F ASUMS("DXP")=0:1 S ASUMS("E#","DXP")=$O(^ASUMS(ASUMS("E#","STA"),1,ASUMS("E#","IDX"),4,ASUMS("E#","DXP"))) Q:ASUMS("E#","DXP")'?1N.N  D
 .S X=ASUMS("DXP")+1
 .S Y=$P(^ASUMS(ASUMS("E#","STA"),1,ASUMS("E#","IDX"),4,ASUMS("E#","DXP"),0),U)
 .S ASUMS("DXP",Y)=$P(^ASUMS(ASUMS("E#","STA"),1,ASUMS("E#","IDX"),4,ASUMS("E#","DXP"),0),U,2)
 .S ASUMS("DXP",0)=ASUMS("DXP",0)+ASUMS("DXP",Y),ASUMS("DXP",Y)=ASUMS("DXP",Y)_U_X
 I ASUMS("DXP",0)'>ASUMS("QTY","O/H") Q
 S X=9999999,Y=ASUMS("QTY","O/H")
 F  S X=$O(ASUMS("DXP",X),-1) Q:X'?1N.N  D
 .I Y=0 K ASUMS("DXP",X) Q
 .I $P(ASUMS("DXP",X),U)<Y S Y=Y-$P(ASUMS("DXP",X),U) Q
 .S ASUMS("DXP",X)=Y,Y=0
 S (X,Y)=0
 F  S X=$O(ASUMS("DXP",X)) Q:X=""  S Y=Y+1,ASUMS("DXP",X)=ASUMS("DXP",X)_U_Y
 S ASUMS("DXP")=Y
 Q
READ(X) ;EP ;WITH PARAMETER PASSING
 ; X = INDEX POINTER
 ;D:X'?8N IDX^ASULDIRR(.X) S ASUMS("E#","IDX")=X
 Q:X=""
 G M
