BPSOS6M ;BHAM ISC/FCS/DRS - Print log of claim ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 Q
CLAIMLOG(RXI,DEST)         ;EP - from BPSOS6D
 ;
 ;  optional parameters:  prescription #
 ;  and destination device (already opened)
 ;  Prompts for any missing parameters.
 ; 
 ; Note that it will give you only the most recent transmit/receive
 ;  If there have been retransmissions, DO ^%GSE for claim number,
 ;  and print the entire log file.  The purpose of this part is to
 ;  show when the successful I/O or last failed I/O occurred.
 ;
 I '$D(RXI) S RXI=$$GETRX^BPSOSIV Q:RXI<1
 I $D(DEST) S IO=DEST
 E  D ^%ZIS I $G(POP) Q
 N BPSCR S BPSCR=$S($E($G(IOST),1,2)="C-":1,1:0)
 I BPSCR W @IOF
 U IO W "Pharmacy ECME Log of activity for one prescription",!
 N REC,X,X1,X2 M REC=^BPST(RXI)
 N I F I=0:1:2 I '$D(REC(I)) S REC(I)=""
 W "Internal Prescription #",$P(^BPST(RXI,1),U,11)
 S X=$P(REC(1),U) I X W " Refill #",X
 W "   (RXI=",RXI,")"
 W !,"VA Prescription #",$$GET1^DIQ(52,$P(^BPST(RXI,1),U,11),.01)
 W !,"Patient: "
 S X=$P(REC(0),U,6) I X]"" S X=$P($G(^DPT(X,0)),U) W X
 W !
 W "Status: "
 S X=$P(REC(0),U,2) W:X'=99 "Q" W X,":",$$STATI^BPSOSU(X),!
 I X=99 D  W !
 .D DISPRESP^BPSOSUA
 W "Submitted on " S X1=$P(REC(0),U,11) I X1]"" W $$DATETIME^BPSOSUD(X1),!
 W "  Last activity @" S X2=$P(REC(0),U,8) I X2]"" D
 .W $P($$DATETIME^BPSOSUD(X2),"@",2)
 I X1]"",X2]"" W "  Elapsed time: " W $$TIMEDIF^BPSOSUD(X1,X2)
 W !
 S X=$P(REC(0),U,4)
 I X="" W "No entry "
 E  W "See also entry `",X
 S X1=9002313.02 W " in file #",X1,", ",$P(^DIC(X1,0),U),!
 I X]"" D
 .S X=$P(REC(0),U,5)
 .I X="" W "but there is no entry "
 .E  W "     and entry `",X
 S X1=9002313.03 W " in file #",X1,", ",$P(^DIC(X1,0),U),!
 N STOP S STOP=0
 N EXISTS S EXISTS=$$EXISTS^BPSOSL(RXI)
 I EXISTS D  Q:$G(STOP)
 . W !,"Log of this claim's activity: ",!
 . I BPSCR S X="" D PAUSE^VALM1 I X="^" S STOP=1 Q
 . D PRINTLOG^BPSOSL(RXI)
 . I $G(STOP) Q
 . I BPSCR D PRESSANY^BPSOSU5()
 I 'EXISTS D
 . W !,"There is no log for this claim's activity.",!
 . I BPSCR D PRESSANY^BPSOSU5()
 ; DMB - 10/6/2005
 ;    The following code does not work correctly.
 ;    It is unclear what it is trying to do as the log is complete
 ;    Perhaps in phase IV, we can figure out what it is intending
 ;    and fix it.
 ; S X=$P(REC(0),U,12),X1=$P(REC(0),U,4) ; X=where,X1=claim #
 ; I X,X1 D
 ; .D PRESSANY^BPSOSU5() ; now that you've seen end of claim log
 ; .W !,"Log of transmission, "
 ; .W "in log file #",$P(X,",")," at line #",$P(X,",",2),":",!
 ; .D PRCLLOG^BPSOSL(X,X1) ; 
 I '$D(DEST) D ^%ZISC ; we opened the device so we close it
CZ Q
