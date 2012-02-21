BPSOSSG ;BHAM ISC/SD/lwj/FLS - Special gets for formats ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 Q
COLSTATE()          ;EP  entry point frm clm frmt for Colorado State Lic
 N BPSST,BPSFND,BPSLIC,BPSPRO  ;state IEN, fnd ind, state lic 
 S (BPSST,BPSFND,BPSLIC,BPSPRO)=""
 S BPSPRO=$G(BPS("RX",BPS(9002313.0201),"Prescriber IEN")) ;for 200
 I BPSPRO S BPSPRO=$$GET1^DIQ(200,BPSPRO,16,"I")  ;get prov
 I BPSPRO'="" D
 . F  S BPSST=$O(^DIC(6,BPSPRO,999999921,BPSST)) Q:BPSST=""  D
 .. I $P($G(^DIC(5,BPSST,0)),U)["COLORADO" D
 ... S BPSLIC=$P($G(^DIC(6,BPSPRO,999999921,BPSST,0)),U,2)
 ... S BPSFND=1
 ... S BPSST=99999999
 I 'BPSFND S BPSLIC=BPS("Site","Default CAID #")
 Q BPSLIC
 ;*******************************************************************
STATE(STATE) ;EP IHS/SD/lwj 10/28/02 retrieve the state license number
 N STPOINT,DRPOINT,LIPOINT,LICENSE
 S (STPOINT,DRPOINT,LIPOINT,LICENSE)=""
 S STPOINT=$O(^DIC(5,"C",STATE,0))   ;state pointer
 S DRPOINT=$G(BPS("RX",BPS(9002313.02),"Prescriber IEN")) ;prsc pntr
 ;
 ; get the license number
 S LICENSE=$$GET1^DIQ(200.541,STPOINT_","_DRPOINT_",",1)
 ;
 S:LICENSE="" LICENSE=$G(BPS("Site","Default CAID #"))
 ;
 Q LICENSE
 ;
NEW416() ; IHS/SD/lwj 8/30/02   NCPDP 5.1
 N PATYPE,PANUM,PA
 ;
 S PATYPE=$E($G(BPS("X")),1,1)
 S PANUM=$E($G(BPS("X")),2,12)
 S PA="DG"_$G(PATYPE)_$$NFF^BPSECFM($G(PANUM),11)
 ;
 Q PA
FMT416() ;----------------------------------------------------------------
 N BPSPA,BPSCD,BPSPC
 S BPSCD=$S(BPS("X")=2:2,BPS("X")=4:4,BPS("X")=5:5,1:$S(BPS("X"):"1",1:"0"))
 I (BPS("X")=5)!(BPS("X")=2)!(BPS("X")=4) D   ;prs lmt/med cert/cpy
 . S BPSPA=$$NFF^BPSECFM("",11)
 I (BPS("X")'=5)&(BPS("X")'=2)&(BPS("X")'=4) D  ;prior authorization
 . S BPSPA=$$NFF^BPSECFM($G(BPS("X")),11)
 ;
 S BPSPC="DG"_BPSCD_BPSPA
 ;
 Q BPSPC
FLD308 ;Other Coverage Code 
 S $P(^BPSC(BPS(9002313.02),300),U,8)=BPS("X")
 I $D(BPS(9002313.0201)) D
 . S $P(^BPSC(BPS(9002313.02),400,BPS(9002313.0201),300),U,8)=BPS("X")
 ;
 Q
 ;
FLD315 ;Employer Name  
 S $P(^BPSC(BPS(9002313.02),300),U,15)=BPS("X")
 I $D(BPS(9002313.0201)) D
 . S $P(^BPSC(BPS(9002313.02),400,BPS(9002313.0201),310),U,5)=BPS("X")
 ;
 Q
 ;
FLD316 ;Employer Street Address
 ; 3.2/5.1 Set Code - called by set command in BPS NCPDP Field DEfs
 ;
 ;3.2 Set
 S $P(^BPSC(BPS(9002313.02),300),U,16)=BPS("X")
 ;
 ;5.1 Set
 I $D(BPS(9002313.0201)) D
 . S $P(^BPSC(BPS(9002313.02),400,BPS(9002313.0201),310),U,6)=BPS("X")
 ;
 Q
 ;
FLD317 ;Employer City Address  
 ;3.2/5.1 Set Code - called by set command in BPS NCPDP Field Defs
 ;
 ;3.2 Set
 S $P(^BPSC(BPS(9002313.02),300),U,17)=BPS("X")
 ;
 ;5.1 Set
 I $D(BPS(9002313.0201)) D
 . S $P(^BPSC(BPS(9002313.02),400,BPS(9002313.0201),310),U,7)=BPS("X")
 ;
 Q
 ;
FLD318 ;Employer State/Prov Address
 ;3.2/5.1 Set Code - called by set command in BPS NCPDP Field Defs
 ;
 ;3.2 Set
 S $P(^BPSC(BPS(9002313.02),300),U,18)=BPS("X")
 ;
 ;5.1 Set
 I $D(BPS(9002313.0201)) D
 . S $P(^BPSC(BPS(9002313.02),400,BPS(9002313.0201),310),U,8)=BPS("X")
 ;
 Q
 ;
FLD319 ;Employer Zip/Postal Zip
 ;3.2/5.1 Set Code - called by set command in BPS NCPDP Field Defs
 ;
 ;3.2 Set
 S $P(^BPSC(BPS(9002313.02),300),U,19)=BPS("X")
 ;
 ;5.1 Set
 I $D(BPS(9002313.0201)) D
 . S $P(^BPSC(BPS(9002313.02),400,BPS(9002313.0201),310),U,9)=BPS("X")
 ;
 Q
 ;
FLD320 ;Employer Phone Number
 ;3.2/5.1 Set Code - called by set command in BPS NCPDP Field Defs
 ;
 ;3.2 Set
 S $P(^BPSC(BPS(9002313.02),320),U,20)=BPS("X")
 ;
 ;5.1 Set
 I $D(BPS(9002313.0201)) D
 . S $P(^BPSC(BPS(9002313.02),400,BPS(9002313.0201),310),U,10)=BPS("X")
 ;
 Q
 ;
FLD327 ;Carrier ID
 ;3.2/5.1 Set Code - called by set command in BPS NCPDP Field Defs
 ;
 ;3.2 Set
 S $P(^BPSC(BPS(9002313.02),320),U,27)=BPS("X")
 ;
 ;5.1 Set
 I $D(BPS(9002313.0201)) D
 . S $P(^BPSC(BPS(9002313.02),400,BPS(9002313.0201),320),U,7)=BPS("X")
 ;
 Q
FLD439 ;Reason for service code
 ;
 ;3.2 Set
 I '$G(BPS51) S $P(^BPSC(BPS(9002313.02),400,BPS(9002313.0201),430),U,9)=BPS("X")
 ;
 ;5.1 Set
 I ^BPS(9002313.99,1,"CERTIFIER")=DUZ S DUR=1,BPS51=1
 I $G(BPS51) S $P(^BPSC(BPS(9002313.02),400,BPS(9002313.0201),473.01,DUR,0),U,2)=BPS("X")
 ;
 Q
 ;
FLD440 ;Professional Service Code
 ;
 ;3.2 Set
 I '$G(BPS51) S $P(^BPSC(BPS(9002313.02),400,BPS(9002313.0201),430),U,10)=BPS("X")
 ;
 ;5.1 Set
 I ^BPS(9002313.99,1,"CERTIFIER")=DUZ S DUR=1,BPS51=1
 I $G(BPS51) S $P(^BPSC(BPS(9002313.02),400,BPS(9002313.0201),473.01,DUR,0),U,3)=BPS("X")
 ;
 Q
 ;
FLD441 ;Result of Service Code
 ;
 ;3.2 Set
 I '$G(BPS51) S $P(^BPSC(BPS(9002313.02),400,BPS(9002313.0201),440),U,1)=BPS("X")
 ;
 ;5.1 Set
 I ^BPS(9002313.99,1,"CERTIFIER")=DUZ S DUR=1,BPS51=1
 I $G(BPS51) S $P(^BPSC(BPS(9002313.02),400,BPS(9002313.0201),473.01,DUR,0),U,4)=BPS("X")
 ;
 Q
 ;
FLD473 ;DUR/PPS code counter - called from set logic in BPS NCPDP Field Defs
 I ^BPS(9002313.99,1,"CERTIFIER")=DUZ S DUR=1,BPS51=1
 S $P(^BPSC(BPS(9002313.02),400,BPS(9002313.0201),473.01,DUR,0),U,1)=BPS("X")
 S ^BPSC(BPS(9002313.02),400,BPS(9002313.0201),473.01,"B",BPS("X"),DUR)=""
 ;
 Q
 ;
FLD480 ;lje;7/23/03;VA - Other Amount Claimed Submitted field
 Q:BPS("X")=""!(BPS("X")=0)!($TR(BPS("X"),"{}0.H7H8H9")="")
 S FDA(9002313.0601,"+1,"_BPS(9002313.0201)_","_BPS(9002313.02)_",",.01)="H7"_1
 S FDA(9002313.0601,"+1,"_BPS(9002313.0201)_","_BPS(9002313.02)_",",480)=BPS("X")
 S FDA(9002313.0601,"+1,"_BPS(9002313.0201)_","_BPS(9002313.02)_",",479)="H8"_$G(BPS("Insurer","Other Amt Claim Sub Qual"))
 D UPDATE^DIE("","FDA","BPS(9002313.0601)","MSG")
 I $D(MSG) D LOG^BPSOSL("Failed to update NCPDP field 480 and/or 479")
 I $D(MSG) D LOGARRAY^BPSOSL("MSG")
 Q
 ;
EMPL ;lje;7/18/03; get employer info for VA
 Q:'$G(BPS("Patient","IEN"))
 D GETS^DIQ(2,BPS("Patient","IEN"),".3111;.3112;.3113;.3115;.3116;.3117;.3118;.3119","","EMPL")
 S BPS("Employer","Name")=EMPL(2,BPS("Patient","IEN")_",",.3111)
 S:EMPL(2,BPS("Patient","IEN")_",",.3111)=""&(EMPL(2,BPS("Patient","IEN")_",",.3112)'="") BPS("Employer","Name")=EMPL(2,BPS("Patient","IEN")_",",.3112)
 S BPS("Employer","Address")=EMPL(2,BPS("Patient","IEN")_",",.3113)
 S BPS("Employer","City")=EMPL(2,BPS("Patient","IEN")_",",.3116)
 S BPS("Employer","State")=EMPL(2,BPS("Patient","IEN")_",",.3117)
 I BPS("Employer","State")'="" D
 . S STATEIEN="",STATEIEN=$O(^DIC(5,"B",BPS("Employer","State"),STATEIEN)),BPS("Employer","State")=$P($G(^DIC(5,STATEIEN,0)),"^",2)
 S BPS("Employer","Zip Code")=EMPL(2,BPS("Patient","IEN")_",",.3118)
 S BPS("Employer","Phone")=EMPL(2,BPS("Patient","IEN")_",",.3119)
 K EMPL,STATEIEN
 Q
FLD474 ;DUR/PPS level of effort - called from set logic in BPS NCPDP Field
 I ^BPS(9002313.99,1,"CERTIFIER")=DUZ S DUR=1
 S $P(^BPSC(BPS(9002313.02),400,BPS(9002313.0201),473.01,DUR,0),U,5)=BPS("X")
 ;
 Q
 ;
FLD475 ;DUR Co-agent ID Qualifier - called from set logic in BPS NCPDP Field
 I ^BPS(9002313.99,1,"CERTIFIER")=DUZ S DUR=1
 S $P(^BPSC(BPS(9002313.02),400,BPS(9002313.0201),473.01,DUR,0),U,6)=BPS("X")
 ;
 Q
 ;
FLD476 ;DUR Co-agent ID - called from set logic in BPS NCPDP Field
 I ^BPS(9002313.99,1,"CERTIFIER")=DUZ S DUR=1
 S $P(^BPSC(BPS(9002313.02),400,BPS(9002313.0201),473.01,DUR,0),U,7)=BPS("X")
 ;
 Q
 ;
FLD402 ;
 I '$D(TYPE) Q
 I $G(TMP("9002313.0201",RX,"402","I")) I TYPE="CLAIM" D
 .I TMP("9002313.0201",RX,"402","I")[401944 S BPS("X")=7
 .I TMP("9002313.0201",RX,"402","I")[401959 S BPS("X")=1
 .I TMP("9002313.0201",RX,"402","I")[401974 S BPS("X")=2
 .I TMP("9002313.0201",RX,"402","I")[401976 S BPS("X")=3
 .I TMP("9002313.0201",RX,"402","I")[401958 S BPS("X")=4
 .I BPS("X")="" S BPS("X")=TMP("9002313.0201",RX,"402","I")
 .I BPS("RX",BPS(9002313.0201),"RX IEN")=401944 S BPS("X")=401944
 I TYPE="UNCLAIM" S BPS("X")=$S(RXI=401944:7,1:RXI)
 Q
