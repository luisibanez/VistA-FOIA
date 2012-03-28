PSJBCMA ;BIR/MV-RETURN INPATIENT ACTIVE MEDS (CONDENSED) ;16 Mar 99 / 10:13 AM
 ;;5.0; INPATIENT MEDICATIONS ;**32,41,46,57,63,66,56,69,58,81,91,104**;16 DEC 97
 ;
 ; Reference to ^PS(50.7 is supported by DBIA 2180.
 ; Reference to ^PS(51 is supported by DBIA 2176.
 ; Reference to ^PS(51.1 is supported by DIBA 2177.
 ; Reference to ^PS(51.2 is supported by DBIA 2178.
 ; Reference to ^PS(52.6 is supported by DBIA 1231.
 ; Reference to ^PS(52.7 is supported by DBIA 2173.
 ; Reference to ^PS(55 is supported by DBIA 2191.
 ; Reference to ^PSDRUG is supported by DBIA 2192.
 ; Reference to ^%DTC is supported by DBIA 10000.
 ; Reference to ^DIQ is supported by DBIA 2056.
 ; Usage of this routine by BCMA is supported by DBIA 2828.
 ;
EN(DFN,BDT,OTDATE)         ; return condensed list of inpat meds
 NEW CNT,DN,F,FON,ON,PST,WBDT,X,X1,X2,Y,%
 D:+$G(DFN) ORDER
 I '$D(^TMP("PSJ",$J,1,0)) S ^(0)=-1
 K PSJINX
 Q
ORDER ;Loop thru the orders.
 I '+$G(BDT) D NOW^%DTC S BDT=%
 I BDT'["." S BDT=BDT_".0001"
 S PSJINX=0
 ;* U/D orders
 S F="^PS(55,DFN,5,",WBDT=BDT
 F  S WBDT=$O(^PS(55,DFN,5,"AUS",WBDT)) Q:'WBDT  D
 . F ON=0:0 S ON=$O(^PS(55,DFN,5,"AUS",WBDT,ON)) Q:'ON  S FON=ON_"U",PSJON(FON)="" D UDVAR
 ;* IV orders
 S F="^PS(55,DFN,""IV"",",WBDT=BDT
 F  S WBDT=$O(^PS(55,DFN,"IV","AIS",WBDT)) Q:'WBDT  D
 . F ON=0:0 S ON=$O(^PS(55,DFN,"IV","AIS",WBDT,ON)) Q:'ON  S FON=ON_"V",PSJON(FON)="" D IVVAR
 ;* Pending orders
 S F="^PS(53.1,"
 F PST="P","N" F ON=0:0 S ON=$O(^PS(53.1,"AS",PST,DFN,ON)) Q:'ON  D
 . S FON=ON_"P"
 . S X=$P($G(^PS(53.1,+ON,0)),U,4) D @$S(X="F":"IVVAR",1:"UDVAR")
 ;* One-time orders
 ;* When a one-time order is found, check against PSJON(FON) array to
 ;* make sure no duplicate orders is return on ^TMP.
 I '+$G(OTDATE) D NOW^%DTC S X1=$E(%,1,12),X2=-30 D C^%DTC S OTDATE=X
 I OTDATE'["." S OTDATE=OTDATE_".0001"
 Q:BDT'>OTDATE
 S F="^PS(55,DFN,5,",WBDT=OTDATE
 F  S WBDT=$O(^PS(55,DFN,5,"AU","O",WBDT)) Q:'WBDT  D
 .  F ON=0:0 S ON=$O(^PS(55,DFN,5,"AU","O",WBDT,ON)) Q:'ON  D
 .. S FON=ON_"U" D:'$D(PSJON(FON)) UDVAR
 S F="^PS(55,DFN,""IV"",",WBDT=OTDATE
 F  S WBDT=$O(^PS(55,DFN,"IV","AIS",WBDT)) Q:'WBDT  D
 . F ON=0:0 S ON=$O(^PS(55,DFN,"IV","AIS",WBDT,ON)) Q:'ON  D
 .. S X=$P($G(^PS(55,DFN,"IV",ON,0)),U,9)
 .. I X]"",$$ONE(DFN,ON_"V",X,$P(X,"^",2),$P(X,"^",3))="O" D
 ... S FON=ON_"V" D:'$D(PSJON(FON)) IVVAR
 K PSJON
 Q
 ;
UDVAR ;* Set ^TMP for Unit dose & Pending orders
 D UDPEND
 D TMP
 ;* Setup Dispense drug for ^TMP
 S CNT=0 D NOW^%DTC
 F X=0:0 S X=$O(@(F_ON_",1,"_X_")")) Q:'X  D
 . S PSJDD=@(F_ON_",1,"_X_",0)") I $P(PSJDD,"^",3)]"",$P(PSJDD,"^",3)'>% Q
 . S CNT=CNT+1
 . S ^TMP("PSJ",$J,PSJINX,700,CNT,0)=+PSJDD_U_$P($G(^PSDRUG(+PSJDD,0)),U)_U_$S((FON["U")&($P(PSJDD,U,2)=""):1,(FON["U")&($E($P(PSJDD,U,2))="."):"0"_$P(PSJDD,U,2),1:$P(PSJDD,U,2))_U_$P(PSJDD,U,3)
 S:CNT ^TMP("PSJ",$J,PSJINX,700,0)=CNT
 K PSJ,PSJDD
 Q
IVVAR ;* Set variables for IV and pending orders
 NEW ND,X,Y
 I FON["P" D UDPEND S PSJ("INFRATE")=$P($G(^PS(53.1,ON,8)),U,5)
 I FON["V" D
 . S X=$G(^PS(55,DFN,"IV",ON,0))
 . S PSJ("STARTDT")=$P(X,U,2),PSJ("STOPDT")=$P(X,U,3)
 . S PSJ("INFRATE")=$P(X,U,8),PSJ("SCHD")=$P(X,U,9)
 . S PSJ("ADM")=$P(X,U,11),PSJ("AUTO")=$P(X,U,12),PSJ("STATUS")=$P(X,U,17)
 . S PSJ("IVTYPE")=$P(X,U,4),PSJ("INSYR")=$P(X,U,5)
 . S PSJ("CPRS")=$P(X,U,21),PSJ("CHEMO")=$P(X,U,23)
 . S X=$G(^PS(55,DFN,"IV",ON,.2))
 . S PSJ("DO")="",PSJ("MR")=$P(X,U,3)
 . S PSJ("OI")=+X
 . S X=$G(^PS(55,DFN,"IV",ON,2))
 . S PSJ("PREV")=$P(X,U,5) I PSJ("PREV")["V",(+PSJ("PREV")=+ON) S PSJ("PREV")=""
 . S PSJ("FOLLOW")=$P(X,U,6),PSJ("RFO")=$P(X,U,9) I PSJ("FOLLOW")["V",(+PSJ("FOLLOW")=+ON) S (PSJ("FOLLOW"),PSJ("RFO"))=""
 . S PSJ("SIOPI")=$S($P($G(^PS(55,DFN,"IV",+ON,3)),"^",2):"!",1:"")_$P($G(^(3)),"^")
 . N SCHD S SCHD=PSJ("SCHD")
 . S PSJ("STC")=$$ONE(DFN,ON_"V",SCHD,PSJ("STARTDT"),PSJ("STOPDT"))
 . I PSJ("STC")=""!(PSJ("STC")="C") S PSJ("STC")=$S(SCHD["PRN":"P",1:"C")
 . I PSJ("STC")="C" S PSJ("STC")=$S(SCHD["ON CALL":"OC",SCHD["ON-CALL":"OC",SCHD["ONCALL":"OC",1:"C")
 D TMP
 S CNT=0
 F X=0:0 S X=$O(@(F_ON_",""AD"","_X_")")) Q:'X  D
 . S ND=$G(@(F_ON_",""AD"","_X_",0)")),DN=$G(^PS(52.6,+ND,0)) ;,AOINAME=$$OIDF^PSJLMUT1(+$P(DN,U,11)) I AOINAME["NOTFOUND" S AOINAME=""
 . ;S AOIDF=$$GET1^DIQ(50.7,+$P(DN,U,11),.02) I AOINAME="" S AOIDF=""
 . S CNT=CNT+1,^TMP("PSJ",$J,PSJINX,850,CNT,0)=+ND_U_$P(DN,U)_U_$P(ND,U,2)_U_$P(ND,U,3) ;_U_U_$P(DN,U,11)_U_AOINAME_U_AOIDF
 S:CNT ^TMP("PSJ",$J,PSJINX,850,0)=CNT,CNT=0
 F X=0:0 S X=$O(@(F_ON_",""SOL"","_X_")")) Q:'X  D
 . S ND=$G(@(F_ON_",""SOL"","_X_",0)")),DN=$G(^PS(52.7,+ND,0)) ;,SOINAME=$$OIDF^PSJLMUT1(+$P(DN,U,11)) I SOINAME["NOTFOUND" S SOINAME=""
 . ;S SOIDF=$$GET1^DIQ(50.7,+$P(DN,U,11),.02) I SOINAME="" S SOIDF=""
 . S CNT=CNT+1,^TMP("PSJ",$J,PSJINX,950,CNT,0)=+ND_U_$P(DN,U)_U_$P(ND,U,2)_U_$P(DN,U,4) ;_U_U_$P(DN,U,11)_U_SOINAME_U_SOIDF
 S:CNT ^TMP("PSJ",$J,PSJINX,950,0)=CNT
 K PSJ
 S X1=0
 F  S X1=$O(^PS(55,DFN,"IVBCMA",X1)) Q:'X1  D
 . S XX=$G(^PS(55,DFN,"IVBCMA",X1,0)) Q:ON'=$P(XX,"^",2)  S PSJBCID=$P(XX,"^"),X2=0
 . F I=1:1 S X2=$O(^PS(55,DFN,"IVBCMA",X1,"AD",X2)) Q:'X2  S X=^(X2,0),^TMP("PSJ",$J,PSJINX,800,PSJBCID,I)=+X_"^"_$S($D(^PS(52.6,+X,0)):$P(^(0),"^"),1:"*****")_"^"_$P(X,"^",2,99)
 . I I>1 S ^TMP("PSJ",$J,PSJINX,800,PSJBCID,0)=I-1
 . S X2=0
 . F I=1:1 S X2=$O(^PS(55,DFN,"IVBCMA",X1,"SOL",X2)) Q:'X2  S X=^(X2,0),^TMP("PSJ",$J,PSJINX,900,PSJBCID,I)=$P(X,"^")_"^"_$S($D(^PS(52.7,$P(X,"^"),0)):$P(^(0),"^"),1:"*****")_"^"_$P(X,"^",2,99)
 . I I>1 S ^TMP("PSJ",$J,PSJINX,900,PSJBCID,0)=I-1
 Q
UDPEND ;
 S X=$G(@(F_ON_",0)"))
 S PSJ("MR")=$P(X,U,3),PSJ("SM")=$P(X,U,5),PSJ("HSM")=$P(X,U,6)
 S PSJ("ST")=$P(X,U,7),PSJ("STATUS")=$P(X,U,9)
 S PSJ("CPRS")=$P(X,U,21),PSJ("PREV")=$P(X,U,25),PSJ("FOLLOW")=$P(X,U,26),PSJ("RFO")=$P(X,U,27)
 S:FON["U" PSJ("NGIVEN")=$P(X,U,22)
 S X=$G(@(F_ON_",.2)"))
 S PSJ("DO")=$P(X,U,2)
 S PSJ("OI")=+X
 S X=$G(@(F_ON_",2)"))
 S PSJ("SCHD")=$P(X,U),PSJ("STARTDT")=$P(X,U,2)
 S PSJ("STOPDT")=$P(X,U,4),PSJ("ADM")=$P(X,U,5)
 S X=$G(@(F_ON_",4)"))
 S PSJ("AUTO")=$P(X,U,11)
 ;the naked reference on the line below refers to the full reference created by indirect reference to F_ON, where F may refer to ^PS(53.1 or the IV or UD multiple ^PS(55
 S PSJ("SIOPI")=$S($P($G(@(F_ON_",6)")),"^",2):"!",1:"")_$$ENSET($P($G(^(6)),"^"))
 D SIOPI
 S PSJ("STC")=PSJ("ST")
 I PSJ("ST")="R"!(PSJ("ST")="C") S PSJ("STC")=$S(PSJ("SCHD")["PRN":"P","^ONCALL^ON-CALL^ON CALL^"[("^"_PSJ("SCHD")_"^"):"OC",$$ONE(DFN,FON,PSJ("SCHD"))="O":"O",1:"C")
 Q 
TMP ;* Setup ^TMP that have common fields between IV and U/D
 S PSJINX=PSJINX+1
 S PSJ("OINAME")=$$OIDF^PSJLMUT1(+PSJ("OI")) I PSJ("OINAME")["NOT FOUND" S PSJ("OINAME")=""
 S PSJ("OIDF")=$$GET1^DIQ(50.7,+PSJ("OI"),.02)
 I PSJ("OINAME")="" S PSJ("OIDF")=""
 S PSJ("MRABB")=$P($G(^PS(51.2,+PSJ("MR"),0)),U,3)
 S ^TMP("PSJ",$J,PSJINX,0)=DFN_U_+ON_U_FON_U_PSJ("PREV")_U_PSJ("FOLLOW")_U_$G(PSJ("IVTYPE"))_U_$G(PSJ("INSYR"))_U_$G(PSJ("CHEMO"))_U_PSJ("CPRS")_U_$G(PSJ("RFO"))
 S ^TMP("PSJ",$J,PSJINX,1)=PSJ("MRABB")_U_PSJ("STC")_U_$G(PSJ("SCHD"))_U_PSJ("STARTDT")_U_PSJ("STOPDT")_U_PSJ("ADM")_U_PSJ("STATUS")_U_$G(PSJ("NGIVEN"))_U_$G(PSJ("ST"))_U_$G(PSJ("AUTO"))
 S ^TMP("PSJ",$J,PSJINX,2)=PSJ("DO")_U_$G(PSJ("INFRATE"))_U_$G(PSJ("SM"))_U_$G(PSJ("HSM"))
 S ^TMP("PSJ",$J,PSJINX,3)=PSJ("OI")_U_PSJ("OINAME")_U_PSJ("OIDF")
 S ^TMP("PSJ",$J,PSJINX,4)=PSJ("SIOPI")
 Q
SIOPI ; Use provider comments if order is pending and there is no SI
 NEW X,Y,Z
 I FON["P",(PSJ("SIOPI")=""),$O(^PS(53.1,+ON,12,0)) D
 . F X=0:0 S X=$O(^PS(53.1,+ON,12,X)) Q:'X  S Z=$G(^(X,0)) D
 .. S Y=$L(PSJ("SIOPI"))
 .. S:Y+$L(Z)'>179 PSJ("SIOPI")=PSJ("SIOPI")_Z_""
 . I Y+$L(Z)>179 S PSJ("SIOPI")="SEE PROVIDER COMMENTS"
 Q
ENSET(X) ; expands the SPECIAL INSTRUCTIONS field contained in X into Y
 N X1,X2,Y S Y=""
 F X1=1:1:$L(X," ") S X2=$P(X," ",X1) I X2]"" S Y=Y_$S($L(X2)>30:X2,'$D(^PS(51,+$O(^PS(51,"B",X2,0)),0)):X2,$P(^(0),"^",2)]""&$P(^(0),"^",4):$P(^(0),"^",2),1:X2)_" "
 S Y=$E(Y,1,$L(Y)-1)
 Q Y
ONE(DFN,ORD,SCH,START,STOP) ;determine if order is a one-time
 ; Input:  DFN - patient's internal entry number
 ;         ORD - order number to check (must contain U or V)
 ;         SCH - schedule text (required)
 ;         START - order start date (optional)
 ;         STOP - order stop date (optional)
 N X
 I $G(PSJ("PREV")),$G(PSJ("FOLLOW")) I +PSJ("PREV")=+PSJ("FOLLOW") S (PSJ("PREV"),PSJ("FOLLOW"))=""
 I $G(DFN)]"",$G(ORD)]"",ORD["U",$P(^PS(55,DFN,5,+ORD,0),"^",7)'="R" Q $P(^PS(55,DFN,5,+ORD,0),"^",7)
 I $G(SCH)="" Q ""
 I SCH="TODAY"!(SCH="ONCE")!(SCH="NOW")!(SCH="ONE TIME")!(SCH="ONETIME")!(SCH="ONE-TIME")!(SCH="1TIME")!(SCH="1 TIME")!(SCH="1-TIME")!(SCH="STAT") Q "O"
 I $D(^PS(51.1,"AC","PSJ",SCH)) S X=$O(^(SCH,"")) S X=$P(^PS(51.1,X,0),"^",5) Q $S(X="D":"C",1:X)
 I $G(START)]"",$G(STOP)]"",START=STOP Q "O"
 Q ""
