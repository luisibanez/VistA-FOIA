ASU0TRRD ; IHS/ITSC/LMH -READ HIST OR TRANS ; 
 ;;4.2T2;Supply Accounting Mgmt. System;;JUN 30, 2000
 ;;This routine provides entry point 'READ' which retreves data from
 ;;SAMS trans or hist files into an array.
READ(X,Z) ;EP ;Read trans or hist file
 ;  X - Record internal entry number
 ;  Z - 'H' for hist, 1-7 for trans
 K ASUT S ASUHDA=X,ASUT("FIL")=$G(Z)
 I ASUT("FIL")="H" D
 .F W=0,1 S ASUT(W)=$G(^ASUH(X,W))
 E  D
 .S ASUT(0)=^ASUT(ASUT("FIL"),ASUHDA,0),ASUT(1)=$G(^ASUT(ASUT("FIL"),ASUHDA,1))
 Q:$G(ASUHDA)']""
 N Z S (Z,ASUT("TRCD"))=$P(ASUT(1),U) K:Z']"" ASUT Q:Z']""  D TRN^ASULARST("T"_Z) ;DFM P1 9/15/98
 I ASUT("FIL")="H" D
 .S ASUVND="^ASUH(ASUHDA,ASUL(11,""TRN"",""FIL""))"
 E  D
 .S ASUVND="^ASUT(ASUT(""FIL""),ASUHDA,ASUL(11,""TRN"",""FIL""))"
 S ASUT(ASUL(11,"TRN","FIL"))=$G(@ASUVND)
 S ASUT("TYPE")=ASUL(11,"TRN","TYPE"),ASUT=ASUL(11,"TRN","TAG")
 S ASUT(ASUT,"SIGN")=$G(ASUL(11,"TRN","DRCR")) S:ASUT(ASUT,"SIGN")']"" ASUT(ASUT,"SIGN")=$S($E(ASUT("TRCD"),2)?1A:-1,1:1)
 S (ASUSV("TRKY"),ASUT(ASUT,"TRKY"))=$P(ASUT(0),U)
 S ASUT(ASUT,"PT","AR")=$P(ASUT(0),U,2),ASUT(ASUT,"AR")=$P(ASUT(1),U,2) D PAR^ASU0TRWR G:'$D(ASUT) ERR
 S ASUT(ASUT,"PT","STA")=$P(ASUT(0),U,3),ASUT(ASUT,"STA")=$P(ASUT(1),U,3) D PSTA^ASU0TRWR
 S ASUT(ASUT,"PT","IDX")=$P(ASUT(0),U,5),ASUT(ASUT,"IDX")=$P(ASUT(1),U,5) D PIDX^ASU0TRWR
 S ASUT(ASUT,"PT","ACC")=$P(ASUT(0),U,4),ASUT(ASUT,"ACC")=$P(ASUT(1),U,4) D PACC^ASU0TRWR
 S ASUT(ASUT,"ENTR BY")=$P(ASUT(0),U,6) S ASUT(ASUT,"DTE")=$P(ASUT(0),U,7)
 I ASUT(ASUT,"DTE")']"" D
 .I ASUT("FIL")="H" S ASUT(ASUT,"DTE")=$P(ASUT(ASUT,"TRKY"),"-",2)
 .E  S ASUT(ASUT,"DTE")=$P(ASUT(ASUT,"TRKY"),".") S:ASUT(ASUT,"ENTR BY")']"" ASUT(ASUT,"ENTR BY")=$P(ASUT(ASUT,"TRKY"),".",3) ;DFM P1 9/16/98
 S ASUT(ASUT,"DTP")=$P(ASUT(0),U,8),ASUT(ASUT,"DTW")=$P(ASUT(0),U,9),ASUT(ASUT,"STATUS")=$P(ASUT(0),U,10)
 D PTRR("SSA",11),PTFR("SRC",12),PTRR("SST",13),PTRR("USR",14)
 D PTRR("REQ",15)
 S ASUT(ASUT,"PT","EOQ TYP")=$P(ASUT(0),U,16),ASUT(ASUT,"EOQ TYP")=$P(ASUT(1),U,16)
 D PTFR("SOBJ",17)
 S ASUT(ASUT,"CALCED")=$P(ASUT(0),U,20)
 S ASUT(ASUT,"MST","QTY")=$P(ASUT(0),U,21),ASUT(ASUT,"MST","VAL")=$P(ASUT(0),U,22),ASUT(ASUT,"MST","D/I")=$P(ASUT(0),U,23),ASUT(ASUT,"RMK")=$P(ASUT(0),U,25)
 I (ASUT("TYPE")=3)!(ASUT("TYPE")=9) D
 .S ASUT(ASUT,"QTY","REQ")=(+$P(ASUT(1),U,6)),(ASUT(ASUT,"QTY"),ASUT(ASUT,"QTY","ISS"))=$P(ASUT(3),U,6) S:ASUT(ASUT,"QTY","REQ")']"" ASUT(ASUT,"QTY","REQ")=ASUT(ASUT,"QTY")
 .S ASUT(ASUT,"ORD")=$P(ASUT(1),U,9)
 .S ASUT(ASUT,"PST")=$P(ASUT(3),U),ASUT(ASUT,"ISSTY")=$P(ASUT(3),U,2)
 .S ASUT(ASUT,"REQ TYP")=$P(ASUT(3),U,3),ASUT(ASUT,"RQN")=$P(ASUT(3),U,4)
 .S ASUT(ASUT,"CTG")=$P(ASUT(3),U,5)
 .S ASUT(ASUT,"B/O")=$P(ASUT(3),U,7),ASUT(ASUT,"QTY","ADJ")=$P(ASUT(3),U,8)
 .S ASUT(ASUT,"DTR")=$P(ASUT(1),U,10)
 E  D
 .S ASUT(ASUT,"QTY")=$P(ASUT(1),U,6) S:ASUT("TYPE")=0 ASUT(ASUT,"QTY","ISS")=ASUT(ASUT,"QTY")
 .S ASUT(ASUT,"PON")=$P(ASUT(1),U,9)
 .Q:ASUT("TYPE")=6
 .I (ASUT("TYPE")=1)!(ASUT("TYPE")=7) S ASUT(ASUT,"DTD")=$P(ASUT(1),U,10) Q
 .Q:ASUT("TYPE")=7
 .I ASUT("TYPE")=2 S ASUT(ASUT,"DTX")=$P(ASUT(1),U,10) Q
 .S ASUT(ASUT,"DTS")=$P(ASUT(1),U,10)
 S ASUT(ASUT,"VAL")=$P(ASUT(1),U,7),ASUT(ASUT,"CAN")=$P(ASUT(1),U,15)
 N V S V=$P(ASUT(1),U,8),ASUT(ASUT,"VOU")=V I V]"",V'["-" S ASUT(ASUT,"VOU")=$E(V,1,2)_"-"_$E(V,3,4)_"-"_$E(V,5,8)
 S ASUT(ASUT,"FPN")=$P(ASUT(1),U,18),ASUT(ASUT,"D/IF")=$P(ASUT(1),U,19)
 I ASUT("TYPE")=4 D
 .S ASUT(ASUT,"DESC")=$P(ASUT(4),U),ASUT(ASUT,"AR U/I")=$P(ASUT(4),U,2)
 .S ASUT(ASUT,"NSN")=$P(ASUT(4),U,3),ASUT(ASUT,"CAT")=$P(ASUT(4),U,4)
 .S ASUT(ASUT,"CAT")=$P(ASUT(4),U,4),ASUT(ASUT,"PT","CAT")=$P(ASUT(0),U,19) D PTF("CAT")
 .S ASUT(ASUT,"BCD")=$P(ASUT(4),U,5)
 I ASUT("TYPE")=5 D
 .S ASUT(ASUT,"EOQ MM")=$P(ASUT(5),U,2),ASUT(ASUT,"EOQ QM")=$P(ASUT(5),U,3),ASUT(ASUT,"EOQ AM")=$P(ASUT(5),U,4)
 .S ASUT(ASUT,"ORD#")=$P(ASUT(1),U,9)
 .S ASUT(ASUT,"PT","VEN")=$P(ASUT(0),U,18),ASUT(ASUT,"VEN NM")=$P(ASUT(5),U,8)
 .S ASUT(ASUT,"PT","SLC")=$P(ASUT(0),U,19),ASUT(ASUT,"SLC")=$P(ASUT(5),U)
 .S ASUT(ASUT,"LTM")=$P(ASUT(5),U,5)
 .I ASUT(ASUT,"LTM")?2N D
 ..S ASUT(ASUT,"LTM")=ASUT(ASUT,"LTM")*.1,$P(^ASUT(5,ASUHDA,5),U,5)=ASUT(ASUT,"LTM")
 .S ASUT(ASUT,"RPQ")=$P(ASUT(5),U,6),ASUT(ASUT,"UCS")=$P(ASUT(5),U,7)
 .S ASUT(ASUT,"SUI")=$P(ASUT(5),U,9),ASUT(ASUT,"ULVQTY")=$P(ASUT(5),U,10)
 .S ASUT(ASUT,"SPQ")=$P(ASUT(5),U,11)
RETURN ;
 S Y=0,X=ASUHDA Q
ERR ;
 S Y=-1 Q
PTRR(X,Y)          ;
 S ASUT(ASUT,"PT",X)=$P(ASUT(0),U,Y),ASUT(ASUT,X)=$P(ASUT(1),U,Y) D PTR(.X) Q
PTR(X) ;
 N Z S Z="D "_X_"^ASULDIRR(ASUT(ASUT,",Z(0)="X))",Z(1)=Z_Z(0),Z(2)=Z_"""PT"","_Z(0),Z(3)=$S(X="SSA":17,X="SST":18,X="USR":19,X="REQ":20)
 I ASUT(ASUT,"PT",X)]"" D
 .X Z(2)
 E  D
 .I ASUT(ASUT,X)]"" X Z(1)
 S:ASUT(ASUT,"PT",X)']"" ASUT(ASUT,"PT",X)=$G(ASUL(Z(3),X,"E#"))
 S:ASUT(ASUT,X)']"" ASUT(ASUT,X)=$G(ASUL(Z(3),X))
 Q
PTFR(X,Y)          ;
 S ASUT(ASUT,"PT",X)=$P(ASUT(0),U,Y),ASUT(ASUT,X)=$P(ASUT(1),U,Y) D PTF(.X) Q
PTF(X) ;
 N Z S Z="D "_X_"^ASULDIRF(ASUT(ASUT,",Z(0)="X))",Z(1)=Z_Z(0),Z(2)=Z_"""PT"","_Z(0),Z(3)=$S(X="ACC":9,X="SRC":5,X="SOBJ":3,X="CAT":7)
 I ASUT(ASUT,"PT",X)]"" D
 .X Z(2)
 E  D
 .I ASUT(ASUT,X)]"" X Z(1)
 S:ASUT(ASUT,"PT",X)']"" ASUT(ASUT,"PT",X)=$G(ASUL(Z(3),X,"E#"))
 S:ASUT(ASUT,X)']"" ASUT(ASUT,X)=$G(ASUL(Z(3),X))
 Q
