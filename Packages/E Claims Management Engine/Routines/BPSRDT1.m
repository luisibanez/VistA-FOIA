BPSRDT1 ;BHAM ISC/FCS/DRS/FLS/DLF - Turn Around Time Statistics Report ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 N TRANDT,FR,TO,BPSSIZ,BPSTTAT,IEN57,IEN59,BPSEQ,ENDLOOP,BPSTATIM
 N BPSBGN,BPSBTIM,BPSCTIM,BPSEND,BPSETIM,BPSGTIM,BPSRTIM,BPSSTIM
 N BPSBDT,BPSCNT,X,Y,BPSQUIT,MES,TYPE,DATA,%,ENDCNT
 K ^TMP("BPSRDT1",$J)
 D DATE I Y<0 K DTOUT Q
 S TRANDT=FR,BPSSIZ=0,BPSTTAT=0,BPSCNT=0
 I '$O(^BPSTL("AH",TRANDT)) G QUIT
 F  S TRANDT=$O(^BPSTL("AH",TRANDT)) Q:TRANDT=""!($P(TRANDT,".")>TO)  D
 . S IEN57=""
 . F  S IEN57=$O(^BPSTL("AH",TRANDT,IEN57)) Q:IEN57=""  D
 .. S IEN59=$P($G(^BPSTL(IEN57,0)),U,1)
 .. I IEN59 S ^TMP("BPSRDT1",$J,1,IEN59)=""
 S IEN59=""
 F  S IEN59=$O(^TMP("BPSRDT1",$J,1,IEN59)) Q:IEN59=""  D
 . I '$D(^BPSECP("LOG",IEN59)) Q
 . S BPSEQ=0,ENDLOOP=0,ENDCNT=0
 . S (BPSBDT,BPSBGN,BPSEND,BPSBTIM,BPSGTIM,BPSCTIM,BPSSTIM,BPSRTIM,BPSETIM,TYPE)=""
 . F  S BPSEQ=$O(^BPSECP("LOG",IEN59,BPSEQ)) Q:BPSEQ=""!(ENDLOOP=1)  D
 .. S MES=$$UP($P(^BPSECP("LOG",IEN59,BPSEQ),"^",2))
 .. I MES="" Q
 .. I MES["BEFORE SUBMIT OF " D
 ... S BPSBDT=$P($P(MES," - ",2)," BEFORE SUBMIT OF ",1)
 ... I BPSBDT<FR S BPSBDT="" Q
 ... I BPSBDT>TO S BPSBDT="",ENDLOOP=1 Q
 ... S TYPE=$P(MES," BEFORE SUBMIT OF ",2)
 ... S (%,BPSBGN)=$P(^BPSECP("LOG",IEN59,BPSEQ),"^") D TIME(.BPSBTIM)
 ... S (BPSEND,BPSGTIM,BPSCTIM,BPSSTIM,BPSRTIM,BPSETIM)=""
 .. I ENDLOOP=1 Q
 .. I BPSBDT,MES["BPSOSU NOW RESUBMIT" D
 ... S TYPE="Request portion of a Revesal/Resubmit"
 ... S (%,BPSBGN)=$P(^BPSECP("LOG",IEN59,BPSEQ),"^") D TIME(.BPSBTIM)
 ... S (BPSEND,BPSGTIM,BPSCTIM,BPSSTIM,BPSRTIM,BPSETIM)=""
 .. I BPSBGN="" Q
 .. I MES["INITIATING REVERSAL AND AFTER THAT, CLAIM WILL BE RESUBMITTED" S TYPE="Reversal portion of a Reversal/Resubmit"
 .. I MES["GATHERING" S %=$P(^BPSECP("LOG",IEN59,BPSEQ),"^") D TIME(.BPSGTIM)
 .. I MES["CREATED CLAIM ID" S %=$P(^BPSECP("LOG",IEN59,BPSEQ),"^") D TIME(.BPSCTIM)
 .. I MES["BPSECMC2 - CLAIM - SENT" S %=$P(^BPSECP("LOG",IEN59,BPSEQ),"^") D TIME(.BPSSTIM)
 .. I MES["BPSECMC2 - CLAIM - RESPONSE STORED" S %=$P(^BPSECP("LOG",IEN59,BPSEQ),"^") D TIME(.BPSRTIM)
 .. I MES["CLAIM - END" S (%,BPSEND)=$P(^BPSECP("LOG",IEN59,BPSEQ),"^") D
 ... I BPSBGN D TIME(.BPSETIM),LOG Q
 I 'BPSTTAT G QUIT
 S BPSCNT="",BPSQUIT=0
 F  S BPSCNT=$O(^TMP("BPSRDT1",$J,2,BPSCNT)) Q:BPSCNT=""  D  I BPSQUIT=1 Q
 . S DATA=$G(^TMP("BPSRDT1",$J,2,BPSCNT)),IEN59=$P(DATA,U,1),TYPE=$P(DATA,U,2)
 . S TYPE=$S(TYPE="CLAIM":"Request",TYPE="REVERSAL":"Reversal",1:TYPE)
 . W !,"For Prescription: ",?40,IEN59_"  (Rx#: "_$P($G(^PSRX($P(IEN59,"."),0)),"^")_")"
 . ;W !,"Type: ",?40,TYPE
 . ;W !,"Date: ",?40,$$FMTE^XLFDT($P(DATA,U,3),"5Z")
 . W !,"Begin ",?40,$P(DATA,U,4)
 . W !,"Gathering information",?40,$P(DATA,U,5)
 . W !,"Claim ID created",?40,$P(DATA,U,6)
 . W !,"Claim Sent",?40,$P(DATA,U,7)
 . W !,"Response stored ",?40,$P(DATA,U,8)
 . W !,"Completed at:",?40,$P(DATA,U,9)
 . W !,"Turn-around time",?40,$P(DATA,U,10),!
 . I BPSCNT#2=0 D
 .. R !!,"Press RETURN to continue, '^' to exit: ",X:DTIME
 .. I '$T!(X["^") S BPSQUIT=1
 ;
 ; Write Totals
 ;W !!!,"Total number of claims: ",?40,BPSSIZ
 W !!!,"Average Turn-around time: ",?40,BPSTTAT\BPSSIZ,!!
 ;R !!,"Press RETURN to continue: ",X:DTIME
 K ^TMP("BPSRDT1",$J)
 Q
 ;
LOG ;
 I BPSBGN="" Q
 I BPSEND="" Q
 S BPSTATIM=$G(BPSEND)-$G(BPSBGN)
 ;
 ; Remove negative times (span midnight) and claims more than 20 minutes as anomolies
 I BPSTATIM'>0 Q
 ;I BPSTATIM>1200 Q
 S BPSCNT=BPSCNT+1
 S ^TMP("BPSRDT1",$J,2,BPSCNT)=IEN59_U_TYPE_U_BPSBDT_U_BPSBTIM_U_BPSGTIM_U_BPSCTIM_U_BPSSTIM_U_BPSRTIM_U_BPSETIM_U_BPSTATIM
 S BPSTTAT=BPSTTAT+BPSTATIM
 S BPSSIZ=BPSSIZ+1
 I TYPE="Reversal/Resubmit" S BPSSIZ=BPSSIZ+1
 S (BPSBGN,BPSBTIM,TYPE)=""
 Q
 ;
TIME(CTIM) ;
 D S^%DTC
 I $L(%)=5 S %=%_"00"
 I $L(%)=6 S %=%_"0"
 S CTIM=$E(%,2,3)_":"_$E(%,4,5)_":"_$E(%,6,7)
 Q
DATE ; Release date is free text. For sorts to work we need a precise format, this sub handles that.
 N %DT,VAL,TYPEVAL,X
 S %DT="AEP",%DT(0)=-DT,%DT("A")="START WITH DATE: "
 S %DT("B")="T-1"
 D ^%DT Q:Y<0!($D(DTOUT))
 S (%DT(0),FR)=Y
 S %DT("A")="GO TO DATE: "
 S %DT("B")="T"
 D ^%DT Q:Y<0!($D(DTOUT))
 S TO=Y
 Q
 ;
UP(X) Q $TR(X,"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")
QUIT ;
 W !!,"*** No valid data found ***",!!
 Q
