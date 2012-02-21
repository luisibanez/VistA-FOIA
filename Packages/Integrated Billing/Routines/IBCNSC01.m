IBCNSC01 ;ALB/NLR - INSURANCE COMPANY EDIT ;21-OCT-1993
 ;;2.0;INTEGRATED BILLING;**52,137,191,184,232**;21-MAR-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
PARAM ; -- Insurance company parameters region
 N OFFSET,START,IBCNS0,IBCNS03,IBCNS06,IBCNS08,IBCNS13,IBCNS3
 S IBCNS0=$G(^DIC(36,+IBCNS,0)),IBCNS3=$G(^(3))
 S IBCNS03=$P(IBCNS0,"^",3),IBCNS06=$P(IBCNS0,"^",6),IBCNS08=$P(IBCNS0,"^",8)
 S IBCNS13=$G(^DIC(36,+IBCNS,.13))
 S START=1,OFFSET=2
 D SET^IBCNSP(START,OFFSET+25," Billing Parameters ",IORVON,IORVOFF)
 D SET^IBCNSP(START+1,OFFSET," Signature Required?: "_$S(+IBCNS03:"YES",1:"NO"))
 D SET^IBCNSP(START+2,OFFSET,"          Reimburse?: "_$E($$EXPAND^IBTRE(36,1,$P(IBCNS0,"^",2)),1,21))
 D SET^IBCNSP(START+3,OFFSET,"   Mult. Bedsections: "_$S(+IBCNS06:"YES",IBCNS06=0:"NO",1:""))
 D SET^IBCNSP(START+4,OFFSET,"    Diff. Rev. Codes: "_$P(IBCNS0,"^",7))
 D SET^IBCNSP(START+5,OFFSET,"      One Opt. Visit: "_$S(+IBCNS08:"YES",1:"NO"))
 D SET^IBCNSP(START+6,OFFSET," Amb. Sur. Rev. Code: "_$P(IBCNS0,"^",9))
 D SET^IBCNSP(START+7,OFFSET," Rx Refill Rev. Code: "_$P(IBCNS0,"^",15))
 D SET^IBCNSP(START+8,OFFSET,"   Filing Time Frame: "_$P(IBCNS0,"^",12))
 D SET^IBCNSP(START+9,OFFSET,"    Type Of Coverage: "_$$EXPAND^IBTRE(36,.13,+$P(IBCNS0,U,13)))
 K ^TMP($J,"IBBF_ID")
 D GETBPNUM^IBCEP2B(+IBCNS)
 D SET^IBCNSP(START+10,OFFSET," Def. Div UB92 Prov #: "_$E($G(^TMP($J,"IBBF_ID",0,1)),1,15))
 D SET^IBCNSP(START+11,OFFSET," Def. Div HCFA Prov #: "_$E($G(^TMP($J,"IBBF_ID",0,2)),1,15))
 K ^TMP($J,"IBBF_ID")
 N START,OFFSET
 S START=1,OFFSET=45
 D SET^IBCNSP(START+1,OFFSET,"   Primary Form Type: "_$$EXPAND^IBTRE(36,.14,$P(IBCNS0,"^",14)))
 D SET^IBCNSP(START+2,OFFSET+7,"Billing Phone: "_$P(IBCNS13,"^",2))
 D SET^IBCNSP(START+3,OFFSET+2,"Verification Phone: "_$P(IBCNS13,"^",4))
 D SET^IBCNSP(START+4,OFFSET+2,"Precert Comp. Name: "_$P($G(^DIC(36,+$P(IBCNS13,"^",9),0)),"^",1))
 D SET^IBCNSP(START+5,OFFSET+7,"Precert Phone: "_$$PHONE(IBCNS13))
 D SET^IBCNSP(START+6,OFFSET+10,"Bin Number: "_$P($G(^DIC(36,+IBCNS,3)),"^",3))
 I +IBCNS3=2 D SET^IBCNSP(START+7,OFFSET,"Max # Test Bills/Day: "_$P(IBCNS3,U,6))
 D SET^IBCNSP(START+8,OFFSET+5,"Electronic Type: "_$$EXPAND^IBTRE(36,3.09,+$P(IBCNS3,U,9)))
 D SET^IBCNSP(START+9,OFFSET,"Electronic Transmit?: "_$S(+IBCNS3=1:"YES-LIVE",+IBCNS3=2:"TEST ONLY",1:"NO"))
 D SET^IBCNSP(START+10,OFFSET-3,"Inst Electronic Bill ID: "_$P(IBCNS3,U,4))
 D SET^IBCNSP(START+11,OFFSET-3,"Prof Electronic Bill ID: "_$P(IBCNS3,U,2))
 Q
 ;
PHONE(IBCNS13) ; -- Compute precert company phone
 N IBX,IBSAVE,IBCNT S IBX=""
 I '$P(IBCNS13,"^",9) S IBX=$P(IBCNS13,"^",3) G PHONEQ
REDOX S IBSAVE=+$P(IBCNS13,"^",9)
 S IBCNT=$G(IBCNT)+1
 ; -- if you process the same co. more than once you are in an infinite loop
 I $D(IBCNT(IBCNS)) G PHONEQ
 S IBCNT(IBCNS)=""
 S IBCNS13=$G(^DIC(36,+$P(IBCNS13,"^",9),.13))
 S IBX=$P(IBCNS13,"^") S:$L($P(IBCNS13,"^",3)) IBX=$P(IBCNS13,"^",3)
 ; -- if process the same co. more than once you are in an infinite loop
 I $P(IBCNS13,"^",9),$P(IBCNS13,"^",9)'=IBSAVE G REDOX
PHONEQ Q IBX
 ;
MAIN ; -- Insurance company main address
 N OFFSET,START,IBCNS11,IBCNS13,IBADD
 S IBCNS11=$G(^DIC(36,+IBCNS,.11))
 S IBCNS13=$G(^DIC(36,+IBCNS,.13))
 S START=15,OFFSET=25
 D SET^IBCNSP(START,OFFSET," Main Mailing Address ",IORVON,IORVOFF)
 N OFFSET S OFFSET=2
 D SET^IBCNSP(START+1,OFFSET,"       Street: "_$P(IBCNS11,"^",1)) S IBADD=1
 D SET^IBCNSP(START+2,OFFSET,"     Street 2: "_$P(IBCNS11,"^",2)) S IBADD=2
 D SET^IBCNSP(START+3,OFFSET,"     Street 3: "_$P(IBCNS11,"^",3)) S IBADD=3
 ; D SET^IBCNSP(START+4,OFFSET,"Claim Off. ID: "_$P(IBCNS11,U,11))
 N OFFSET S OFFSET=45
 D SET^IBCNSP(START+1,OFFSET,"   City/State: "_$E($P(IBCNS11,"^",4),1,15)_$S($P(IBCNS11,"^",4)="":"",1:", ")_$P($G(^DIC(5,+$P(IBCNS11,"^",5),0)),"^",2)_" "_$E($P(IBCNS11,"^",6),1,5))
 D SET^IBCNSP(START+2,OFFSET,"        Phone: "_$P(IBCNS13,"^",1))
 D SET^IBCNSP(START+3,OFFSET,"          Fax: "_$P(IBCNS11,"^",9))
 Q
 ;
 ;
PAYER ; This procedure builds the display for the payer associated with
 ; this insurance company.
 ; ESG - 7/29/02 - IIV project
 ;
 NEW PAYERIEN,PAYR,APPDATA,APP,DATA,APPNAME,A1,A2,A3,A4,A5,A6,A7,A8
 NEW START,TITLE,OFFSET,IBLINE
 S PAYERIEN=$P($G(^DIC(36,+IBCNS,3)),U,10),PAYR="",APPDATA=0
 I PAYERIEN D
 . S PAYR=$G(^IBE(365.12,PAYERIEN,0))
 . S APP=0
 . F  S APP=$O(^IBE(365.12,PAYERIEN,1,APP)) Q:'APP  D
 .. S DATA=$G(^IBE(365.12,PAYERIEN,1,APP,0))
 .. S APPNAME=$$EXTERNAL^DILFD(365.121,.01,"",$P(DATA,U,1))
 .. I APPNAME="" Q
 .. I $D(APPDATA(APPNAME)) Q
 .. S (A1,A2,A3,A4,A5,A6,A7)="NO",A8=""
 .. I $P(DATA,U,2) S A1="YES"      ; national active
 .. I $P(DATA,U,3) S A2="YES"      ; local active
 .. I $P(DATA,U,7) S A3="YES"      ; auto-accept
 .. I $P(DATA,U,8) S A4="YES"      ; ident inquiries require subscr ID
 .. I $P(DATA,U,9) S A5="YES"      ; use SSN for subscriber ID
 .. I $P(DATA,U,10) S A6="YES"     ; transmit SSN
 .. I $P(DATA,U,11) S A7="YES"     ; deactivated?
 .. ; A8 = deactivation date
 .. I $P(DATA,U,12) S A8=$P($$FMTE^XLFDT($P(DATA,U,12),"5Z"),"@",1)
 .. S APPDATA(APPNAME)=A1_U_A2_U_A3_U_A4_U_A5_U_A6_U_A7_U_A8
 .. S APPDATA=APPDATA+1
 .. Q
 . Q
 ;
 ; Start the display of Payer data on line 69
 S START=69
 S TITLE=" Payer Information/Electronic Insurance Verification "
 S OFFSET=(40-($L(TITLE)/2))\1+1
 D SET^IBCNSP(START,OFFSET,TITLE,IORVON,IORVOFF)
 D SET^IBCNSP(START+1,9,"Payer Name: "_$P(PAYR,U,1))
 D SET^IBCNSP(START+2,5,"VA National ID: "_$P(PAYR,U,2))
 D SET^IBCNSP(START+2,51,"CMS National ID: "_$P(PAYR,U,3))
 S IBLINE=START+2
 ;
 ; Handle the case where no application data is defined
 I 'APPDATA D  G PAYERX
 . S IBLINE=IBLINE+1
 . D SET^IBCNSP(IBLINE,2," ")    ; blank line
 . S IBLINE=IBLINE+1
 . D SET^IBCNSP(IBLINE,16,"Payer Application data is not defined!")
 . Q
 ;
 ; Display all the applications
 S APPNAME=""
 F  S APPNAME=$O(APPDATA(APPNAME)) Q:APPNAME=""  D
 . S IBLINE=IBLINE+1
 . D SET^IBCNSP(IBLINE,2," ")    ; blank line
 . ;
 . S IBLINE=IBLINE+1
 . D SET^IBCNSP(IBLINE,2,"Payer Application: "_APPNAME)
 . D SET^IBCNSP(IBLINE,50,"Auto-Accept Info: "_$P(APPDATA(APPNAME),U,3))
 . ;
 . S IBLINE=IBLINE+1
 . D SET^IBCNSP(IBLINE,4,"National Active: "_$P(APPDATA(APPNAME),U,1))
 . D SET^IBCNSP(IBLINE,47,"Ident Req Subscr ID: "_$P(APPDATA(APPNAME),U,4))
 . ;
 . S IBLINE=IBLINE+1
 . D SET^IBCNSP(IBLINE,7,"Local Active: "_$P(APPDATA(APPNAME),U,2))
 . D SET^IBCNSP(IBLINE,51,"SSN = Subscr ID: "_$P(APPDATA(APPNAME),U,5))
 . ;
 . S IBLINE=IBLINE+1
 . D SET^IBCNSP(IBLINE,8,"Deactivated: "_$P(APPDATA(APPNAME),U,7))
 . D SET^IBCNSP(IBLINE,54,"Transmit SSN: "_$P(APPDATA(APPNAME),U,6))
 . ;
 . ; If no deactivated date, then exit
 . I $P(APPDATA(APPNAME),U,8)="" Q
 . ;
 . S IBLINE=IBLINE+1
 . D SET^IBCNSP(IBLINE,13,"D-Date: "_$P(APPDATA(APPNAME),U,8))
 . ;
 . Q
PAYERX ;
 ; Two trailing blank lines after payer information display
 S IBLINE=IBLINE+1
 D SET^IBCNSP(IBLINE,2," ")    ; blank line
 S IBLINE=IBLINE+1
 D SET^IBCNSP(IBLINE,2," ")    ; blank line
 Q
 ;
 ;
REMARKS ;
 ;
 N OFFSET,START,IBLCNT,IBI
 S START=$O(^TMP("IBCNSC",$J,""),-1)+1,OFFSET=2
 S IB1ST("REM")=START
 ;
 D SET^IBCNSP(START,OFFSET," Remarks ",IORVON,IORVOFF)
 S (IBLCNT,IBI)=0 F  S IBI=$O(^DIC(36,+IBCNS,11,IBI)) Q:IBI<1  D
 . S IBLCNT=IBLCNT+1
 . D SET^IBCNSP(START+IBLCNT,OFFSET,"  "_$E($G(^DIC(36,+IBCNS,11,IBI,0)),1,80))
 . Q
 D SET^IBCNSP(START+IBLCNT+1,OFFSET," ")   ; blank line after remarks
 Q
 ;
SYN ;
 N OFFSET,START,SYN,SYNOI
 S START=$O(^TMP("IBCNSC",$J,""),-1)+1,OFFSET=2
 S IB1ST("SYN")=START
 D SET^IBCNSP(START,OFFSET," Synonyms ",IORVON,IORVOFF)
 S SYN="" F SYNOI=1:1:8 S SYN=$O(^DIC(36,+IBCNS,10,"B",SYN)) Q:SYN=""  D SET^IBCNSP(START+SYNOI,OFFSET,$S(SYNOI>7:"  ...edit to see more...",1:"  "_SYN))
 Q
 ;
