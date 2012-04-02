ACHSRPF ; IHS/OIT/FCJ - PRINT CHS PO AND FORM ; 30 Jun 2011  10:08 AM
 ;;3.1;CONTRACT HEALTH MGMT SYSTEM;**18,20**;JUN 11, 2001
 ;;ACHS*3.1*18 NEW ROUTINE TO SET TEMP GLOBAL TO BE CALLED BY INTERFACE RTN
 ;TO PRINT COMPLETE FORM AND DATA
 ;
 ;
 ;IF $D(ACHSRPNT) THEN it is a REPRINT
ST ;
 K ^TMP("ACHSPO",$J)
 S (ACHSALL,ACHSREG,C)=0
 D ^ACHSVAR
 I $D(^ACHSESIG(DUZ(2))) S ACHSEFL=$P(^ACHSESIG(DUZ(2),0),U,2,3)
 ;INITIAL PRINT OR REPRINT
 D @$S('$D(ACHSRPNT):"I",1:"R")
 Q
I ;
 I '$D(^ACHSF("PQ",DUZ(2))) S ACHSERR=1 Q
I1 ;
 ;IF NOT A RE-PRINT SET UP NEW ENTRY IN 'CHS DOCUMENT PRINTED LIST'
 I '$$LOCK^ACHS("^ACHS(7)","+") W !,"LOCK FAILED AT B1+13^ACHSRP"
 ;GET 0 RECORD OF 'CHS DOCUMENT PRINTED LIST' FILE
 S X=$G(^ACHS(7,0))
 S ACHS7DA=$P(X,U,3)+1   ;MANUALLY INCREMENT # ENTRIES FIELD 
 S ^ACHS(7,0)=$P(X,U,1,2)_U_ACHS7DA_U_ACHS7DA
 S ^ACHS(7,ACHS7DA,0)=IO_U_DT,^ACHS(7,ACHS7DA,"D",0)="^9002067.01^^",^ACHS(7,"CZ",9999999-DT,ACHS7DA)="",^ACHS(7,"B",IO,ACHS7DA)=""
 I '$$LOCK^ACHS("^ACHS(7)","-")
 ;
 ;
I2 ;LOOP THROUGH THE PQ X-REF BASED ON THE TYPE OF SERVICE
 ;Index: ^ACHSF("PQ",FACILITY,TYPE OF SERVICE,DOC #,TRAN #
 S ACHSTYPV=0
 F  S ACHSTYPV=$O(^ACHSF("PQ",DUZ(2),ACHSTYPV)) Q:ACHSTYPV'?1N.N  D
 .S ACHSDIEN="" F  S ACHSDIEN=$O(^ACHSF("PQ",DUZ(2),ACHSTYPV,ACHSDIEN)) Q:ACHSDIEN'?1N.N  D  Q:$G(Y)="X"
 ..S ACHSTIEN="" F  S ACHSTIEN=$O(^ACHSF("PQ",DUZ(2),ACHSTYPV,ACHSDIEN,ACHSTIEN)) Q:ACHSTIEN'?1N.N  D  Q:$G(Y)="X"
 ...I $D(ACHSEFL) D  I ACHSEFLG S $P(ACHSEFL,U,3)=$P(ACHSEFL,U,3)+1,ACHSERR=2 Q
 ....S ACHSEFLG=0
 ....Q:$P(^ACHSF(DUZ(2),"D",ACHSDIEN,0),U,3)=2   ;DO NOT TST SPEC LOC
 ....Q:$P(^ACHSF(DUZ(2),"D",ACHSDIEN,0),U,12)>1  ;DO NOT TST CAN, PAR CAN OR PAID
 ....Q:$P(^ACHSF(DUZ(2),"D",ACHSDIEN,0),U,2)<$P(ACHSEFL,U,2)    ;TEST E-SIG DT
 ....I $P(^ACHSF(DUZ(2),"D",ACHSDIEN,0),U,28)'?1N.N S ACHSEFLG=1 Q   ;TEST E-SIG ORD OFC
 ....I $P(ACHSEFL,U)=1,$P(^ACHSF(DUZ(2),"D",ACHSDIEN,0),U,30)'?1N.N S ACHSEFLG=1  ;TEST E-SIG AUTH OFC
 ...D DOC
 Q
 ;
R ;RE-PRINT LOOP THROUGH LIST OF SELECTED DOCUMENTS OR REPRINT BATCH OPTION
 ;^TMP("ACHSRR",$J,FACILITY,TYPE OF SERVICE,DOC #,TRAN #
 S ACHSTYPV=0 F  S ACHSTYPV=$O(^TMP("ACHSRR",$J,DUZ(2),ACHSTYPV)) Q:ACHSTYPV'?1N.N  D
 .S ACHSDIEN=""
 .F  S ACHSDIEN=$O(^TMP("ACHSRR",$J,DUZ(2),ACHSTYPV,ACHSDIEN)) Q:ACHSDIEN'?1N.N  D  Q:$G(Y)="X"
 ..S ACHSTIEN=""
 ..F  S ACHSTIEN=$O(^TMP("ACHSRR",$J,DUZ(2),ACHSTYPV,ACHSDIEN,ACHSTIEN)) Q:ACHSTIEN'?1N.N  D  Q:$G(Y)="X"
 ...D DOC
 Q
 ;
DOC ;BEGIN PROCESSING DOCUMENTS
 S ACHSACF=$S(ACHSTYPV=1:"Hospital Service",ACHSTYPV=3:"Outpatient Service",ACHSTYPV=2:"Dental Service",1:"")
 S ACHSREG=1 D ^ACHSRPF1
 I $D(^TMP("ACHSRR",$J)) S ACHSERR=3
 D END
 Q
 ;
SB1 ;EP FROM ACHSRPFU
 ;GET FACILITY INFO
 K B
 D FAC^ACHSUDF   ; GET MAILING ADDRESS AND PLACE IN B ARRAY
 D FC^ACHSUF     ; GET FINANCE CODE
 Q
 ;
END ;
 K B,DFN
 I $G(ACHSDUZ2) S ^TMP("ACHSDUZ2",$J)=ACHSDUZ2
 K T,T1,T2,T3,T4 S T=ACHSTYPV,T1=ACHSDIEN,T2=ACHSTIEN S:$D(ACHS7DA) T3=ACHS7DA S:$D(ACHSRPNT) T4=ACHSRPNT
 D EN^XBVK("ACHS")   ;KILL VARS IN ACHS NAMESPACE
 D ^ACHSVAR         ;RESET ACHS VARIABLES
 I $G(^TMP("ACHSDUZ2",$J)) S ACHSDUZ2=$G(^TMP("ACHSDUZ2",$J)) K ^($J)
 S ACHSTYPV=T,ACHSDIEN=T1,ACHSTIEN=T2 S:$D(T3) ACHS7DA=T3 S:$D(T4) ACHSRPNT=T4 K T,T1,T2,T3,T4
 Q
 ;
 ;
 ;ACHSERR=1 ;NO QUEUED DOCUMENTS
 ;ACHSERR=2 ;DOCUMENTS WITHOUT SIGNATURE
 ;ACHSERR=3 ;DOCUMENTS QUED, BUT NO DATA SET
