PSOTALK ;BIR/EJW - SCRIPTALK INTERFACE FROM VISTA ;04/18/2003
 ;;7.0;OUTPATIENT PHARMACY;**135,182,211**;DEC 1997
 ;External reference ^PS(55 supported by DBIA 2228
 ;External reference to ^PSDRUG supported by DBIA 221
 ;ROB SILVERMAN-HINES DEVELOPED ORIGINAL VISTA CUSTOM SOFTWARE FOR SCRIPTALK
EN Q:'$$PAT55  ; QUIT IF NOT A SCRIPTALK ELIGIBLE PATIENT
 S PSOSTALK=1
 N PHONE,RXNUM,RXALPHA,DATE,EDATE,RFILLS,PTNAME,SIG,SIGX,PROV,DRUG,WARN,LINE
 D GATHER,TRANS,CLEAN
 Q
 ;
CLEAN K PHONE,RXNUM,RXALPHA,DATE,EDATE,RFILLS,PTNAME,SIG,SIGX,PROV,DRUG,WARN,VADM
 K PSOCTP,PSOCTV,XMIT,PSORCT,PSOTSSN,PSOEXPDT
 K PSOLNE,PSOLEN,PSOLINE,PSOWORD,PSOWDS,LINE
 K PSOSIG1,PSOLSIG,PSOSIG,PSOSTOP
 Q
BARE N RX
 D CLEAN
 W ! S DIC="^PSRX(",DIC(0)="AEQM" D ^DIC K DIC Q:Y<0  S RX=+Y
 D:'$D(PSOPAR) ^PSOLSET
 I '$$PAT55 W !,"Patient not enrolled in ScripTalk program." G BAREO
 I $P(^PSRX(RX,"STA"),"^")'=0 W !,"Prescription not ACTIVE" G BAREO
 D GATHER
 W !!,"  Queuing ScripTalk label"
 D TRANS
BAREO D CLEAN
 W !!
 G BARE
 Q
BARI N RX
 D CLEAN
 S RX=$$READER^PSOTALK1("FO^1:12","Enter Barcode Rx#")
 Q:RX']""
 G:RX'["-" BARIO
 S RX=$P(RX,"-",2)
 I '$D(^PSRX(RX,0)) W !,"Prescription not on file" G BARIO
 I '$$PAT55 W !,"Patient not enrolled in ScripTalk program." G BARIO
 I $P(^PSRX(RX,"STA"),"^")'=0 W !,"Prescription not ACTIVE" G BARIO
 D:'$D(PSOPAR) ^PSOLSET
 D GATHER
 W !!,"  Queuing ScripTalk label"
 D TRANS
BARIO D CLEAN
 W !!
 G BARI
 Q
GATHER ;
 N DFN
 S DFN=$P(^PSRX(RX,0),"^",2)
 D DEM^VADPT
 S PHONE=$$PHONE
 S RXNUM=+$$RXNUM
 S RXALPHA=$$RXALPHA
 S DATE=$$DATE
 S FILLS=$$RFILLS I $L(RFILLS)=1 S FILLS="0"_FILLS
 S PTNAME=VADM(1) D
 .N FNAM,MI
 .S FNAM=$P(PTNAME,",",2) I FNAM[" " D
 ..S MI=$P(FNAM," ",2,99) I MI[" " S MI=$P(MI," ")
 ..S FNAM=$P(FNAM," ")
 .S PTNAME=FNAM_$S($G(MI)'="":" "_MI,1:"")_" "_$P(PTNAME,",")
 .S PTNAME=$$UP^XLFSTR(PTNAME)
 .S PTNAME=$TR(PTNAME,"-"," ")
 .S PTNAME=$TR(PTNAME,".","")
 .S PTNAME=$TR(PTNAME,"'"," ")
 S SIG=$TR($$UP^XLFSTR($$SIGPOE),"[\]^_`{|}~","(/) -'( ) ")
 S SIGX=$TR($$UP^XLFSTR($$SIGPOEX),"[\]^_`{|}~","(/) -'( ) ")
 S PROV=$E($$UP^XLFSTR($$PROV),1,30)
 S DRUG=$TR($$UP^XLFSTR($$DRUG),"[\]^_`{|}~","(/) -'( ) ")
 S WARN=$$WARN
 D PSOEXP
 S LINE(1)="VAMC "_$$CITY_", "_$$STATE_"  "_$$ZIP
 S LINE(2)=$$SITE_" ("_$$CLERK_"/"_$$VRPH_") "_$$ACODE_"-"_$$EPHON_" Exp: "_PSOEXPDT
 S LINE(3)="Rx# "_$$RXNUM_"  "_$$EDATE_"  Fill "_$$FILNO_" of "_$$TFILLS
 S LINE(4)=$$EPAT_"  "_$$LAST6
 D INST^PSOTALK1 S LINE(5)=$G(PSOLNE(1)),LINE(6)=$G(PSOLNE(2)),LINE(7)=$G(PSOLNE(3))
 S LINE(8)=$$EPROV,LINE(10)=$$DRUG
 S LINE(9)="Qty: "_$$QTY_"  "_$$DF
 Q
TRANS S ZTIO="`"_$P($G(^PS(59,PSOSITE,"STALK")),U),ZTDTH=$$NOW^XLFDT,ZTDESC="Scriptalk Interface Transmission"  ; CHANGE DEVICE TO BE DIVISIONAL BY FILE 59 RMS/HINES 6-5-01
 Q:ZTIO="`"
 S ZTRTN="GO^PSOTALK",ZTSAVE("*")=""
 D ^%ZTLOAD
 Q
 ;
GO W !,"^XA",!,"^FO250,700^XGE:RX.GRF^FS"  ;;1.2e 4-17-02 TO MOVE GRAPHIC
 D OVERLAY,PICOTAG  ;;FOR LARGER LABELS
 W !,"^PQ1,0,1,Y",!,"^XZ"  ;;FOR LARGER LABELS
 S:$D(ZTQUEUED) ZTREQ="@"
 Q
 ;
OVERLAY F PSOLINE=1:1:7 D DEFLINE((9+((20-PSOLINE)*28)),50,LINE(PSOLINE),PSOLINE,0)
 F PSOLINE=8:1:10 D DEFLINE((9+((19-PSOLINE)*28)),50,LINE(PSOLINE),PSOLINE,0)
 Q
 ;
DEFLINE(XCORD,YCORD,PRTOUT,FIELDNO,OFFSET) ;
 W !,"^AFR,20,10^FO"_XCORD_","_YCORD_"^FR^CI0^FD"_PRTOUT_"^FS"
 Q
 ;
PICOTAG S PSOCTP=1
 S DRUG=$E(DRUG,1,39)  ;1.2c*1 TEMPORARY FIX FOR DRUG TRUNCATE AT 39
 F XMIT=PTNAME,DRUG,SIGX,DATE,FILLS,WARN,PROV,PHONE,RXNUM,RXALPHA D XMITP
 Q
 ;
XMITP W !,"^RX"_$S(PSOCTP<10:"0",1:"")_PSOCTP_","_XMIT_"^FS"
 S PSOCTP=PSOCTP+1
 Q
ID() I $$PAT55 Q "+SCRIPTALK"
 E  Q ""
AUTO ;;v1.2c - LABEL REPRINTING FUNCTIONS 3-12-02
 Q:$G(PSOTREP)  ;NO AUTO-PRINT DURING REGULAR NON-VOIDED LABEL REPRINT
 I $P($G(^PS(59,+PSOSITE,"STALK")),U,2)="A" D EN
 Q
 ;
PAT55() Q +$G(^PS(55,"ASTALK",$P(^PSRX(RX,0),"^",2)))  ;IS PATIENT ENROLLED (NEW FIELD POSITION 2-12-02 RMS UPDATE v1.2b)
PHONE() ;changes below 1.2c*1 to swap to site signed-on vs. site from Rx
 Q $E($P(^PS(59,+PSOSITE,0),"^",3),1,3)_$E($TR($P(^PS(59,+PSOSITE,0),"^",4),"-,",""),1,7) ; RX DIVISION PHONE NUMBER
CITY() Q $P(^PS(59,+PSOSITE,0),"^",7)
STATE() Q $P(^DIC(5,$P(^PS(59,+PSOSITE,0),"^",8),0),"^",2)
ZIP() Q $P(^PS(59,+PSOSITE,0),"^",5)
SITE() Q $P(^PS(59,+PSOSITE,0),"^",6)
ACODE() Q $P(^PS(59,+PSOSITE,0),"^",3)
EPHON() Q $P(^PS(59,+PSOSITE,0),"^",4)
CLERK() Q $P($G(^PSRX(RX,"OR1")),"^",5)
PSOEXP ;
 N X1,X2,X S X1=DT,X2=365 D C^%DTC S PSOEXPDT=X
 S PSOEXPDT=$E(PSOEXPDT,4,5)_"/"_$E(PSOEXPDT,6,7)_"/"_$E(PSOEXPDT,2,3)
 Q
VRPH() Q $P($G(^PSRX(RX,2)),"^",10)
RXNUM() Q $P(^PSRX(RX,0),"^",1) ;RETURN RX EXTERNAL NUMBER
RXALPHA() ;RETURN RENEWAL LETTER OR SPACE CHARACTER
 N RXALPHA
 S RXALPHA=$E($P(^PSRX(RX,0),"^",1),$L($P(^PSRX(RX,0),"^",1)))
 Q $S(RXALPHA?1A:RXALPHA,1:" ")
DATE() ;CHANGED 7-30-01 TO USE EDATE FORMAT ALSO WHEN SPEAKING
 S EDATE=$P(^PSRX(RX,3),"^")
 Q $E(EDATE,4,5)_$E(EDATE,6,7)_$E(EDATE,2,3)
EDATE() Q $$FMTE^XLFDT($P(^PSRX(RX,3),"^"))  ; EXTERNAL DATE / LAST DISPENSED
FILLS() Q $G(RXF)+1 ; FILL COUNT
TFILLS() Q $P(^PSRX(RX,0),"^",9)+1 ; TOTAL FILLS
RFILLS() ;NEW REFILLS REMAINING METHOD 9-21-00, BASED ON PTST+5^PSORXVW
 S RFILLS=$P(^PSRX(RX,0),"^",9),PSORCT=0 F  S PSORCT=$O(^PSRX(RX,1,PSORCT)) Q:'PSORCT  S RFILLS=RFILLS-1
 Q RFILLS
FILNO() Q $$TFILLS-$$RFILLS
EPAT() Q $P(^DPT($P(^PSRX(RX,0),"^",2),0),"^") ; EXTERNAL PATIENT NAME
LAST6() S PSOTSSN=$P(^DPT($P(^PSRX(RX,0),"^",2),0),"^",9)  ; LAST 6 OF SSN
 Q $E(PSOTSSN,4,5)_"-"_$E(PSOTSSN,6,9)
SIG() ;THIS SUBROUTINE WILL BE ABANDONED IF SIGPOE WORKS v1.2c 3-13-02
 I $L($P(^PSRX(RX,"SIG"),"^",1))=0 Q $E($$LSIG^PSOTALK1($P(^PSRX(RX,"SIG1",1,0),"^",1)),1,196)
 E  Q $E($$LSIG^PSOTALK1($P(^PSRX(RX,"SIG"),"^",1)),1,196) ; SIG -- NEEDS TO BE EXPANDED
SIGPOE() ;v1.2c - NEW SUBROUTINE TO GIVE MESSAGE FOR LONG SIGS FOR THE HUMAN READABLE PORTION
 S PSOSIG=""
 I $P($G(^PS(55,DFN,"LAN")),"^",1) D  G SIGPOEE
 .S PSOSIG=" " ; PUT SPACE ON FRONT OF SIG (GETS STRIPPED OFF LATER)
 .D OTHL1^PSOLBL3(RX) I $O(SIG2(0))="" Q
 .N XX,X
 .;PSO*7*211;MODIFIED TO REPLACE SIG IF >138 INSTEAD OF 196
 .S XX=0 F  S XX=$O(SIG2(XX)) Q:'XX  S X=SIG2(XX) I X'="" S PSOSIG=PSOSIG_X_" " I $L(PSOSIG)>138 D  Q
 ..S PSOSIG=" INDICACIONES MUY LARGAS. IMPRIMA UNA ETIQUETA DE VISTA VALIDA Y APLIQUELA SOBRE ESTA ETIQUETA DE SCRIPTALK EN LA BOTELLA."
 E  D  ;
 . N PSOSEQ
 . S PSOSTOP=0,PSOSIG=""
 . S PSOLSIG=" SIG IS TOO LONG. REPRINT A NON-VOIDED VISTA LABEL AND PLACE OVER THIS SCRIPTALK LABEL"
 . S PSOSEQ=0 F  S PSOSEQ=$O(^PSRX(RX,"SIG1",PSOSEQ)) Q:PSOSEQ'=+PSOSEQ!($G(PSOSTOP))  D  ;
 .. S PSOSIG1=$G(^PSRX(RX,"SIG1",PSOSEQ,0))
 ..;PSO*7*211;MODIFIED TO REPLACE SIG IF >138 INSTEAD OF 196
 .. I $L(PSOSIG)+$L($G(^PSRX(RX,"SIG1",PSOSEQ,0)))>138 S PSOSIG=PSOLSIG,PSOSTOP=1 Q  ;
 .. S PSOSIG=$G(PSOSIG)_" "_PSOSIG1
SIGPOEE Q $E(PSOSIG,2,197)
 ;
SIGPOEX() ;v1.2c - NEW SUBROUTINE TO GIVE MESSAGE FOR LONG SIGS FOR THE READ ALOUD PORTION
 S PSOSIG=""
 I $P($G(^PS(55,DFN,"LAN")),"^",1) D  G SIGPOEEX
 .S PSOSIG=" " ; PUT SPACE ON FRONT OF SIG (GETS STRIPPED OFF LATER)
 .D OTHL1^PSOLBL3(RX) I $O(SIG2(0))="" Q
 .N XX,X
 .S XX=0 F  S XX=$O(SIG2(XX)) Q:'XX  S X=SIG2(XX) I X'="" S PSOSIG=PSOSIG_X_" " I $L(PSOSIG)>196 D  Q
 ..S PSOSIG=" LAS INSTRUCCIONES DE ESTA RECETA SON MUY LARGAS.  POR FAVOR SOLICITE A SU CUIDADOR QUE LE LEA LAS INSTRUCCIONES IMPRESAS EN EL ROTULO O COMUNIQUESE CON SU MEDICO PARA INSTRUCCIONES COMPLETAS."
 I $L($P(^PSRX(RX,"SIG"),"^",1))'=0 Q $E($$LSIG^PSOTALK1($P(^PSRX(RX,"SIG"),"^",1)),1,196)
 E  D  ;
 . N PSOSEQ
 . S PSOSTOP=0,PSOSIG=""
 . S PSOLSIG=" THE INSTRUCTIONS FOR THIS PRESCRIPTION ARE TOO LONG. PLEASE HAVE A CAREGIVER READ THE PRINTED LABEL OR CONTACT YOUR PHYSICIAN FOR COMPLETE INSTRUCTIONS."
 . S PSOSEQ=0 F  S PSOSEQ=$O(^PSRX(RX,"SIG1",PSOSEQ)) Q:PSOSEQ'=+PSOSEQ!($G(PSOSTOP))  D  ;
 .. S PSOSIG1=$G(^PSRX(RX,"SIG1",PSOSEQ,0))
 .. I $L(PSOSIG)+$L($G(^PSRX(RX,"SIG1",PSOSEQ,0)))>196 S PSOSIG=PSOLSIG,PSOSTOP=1 Q  ;
 .. S PSOSIG=$G(PSOSIG)_" "_PSOSIG1
SIGPOEEX Q $E(PSOSIG,2,197)
PROV() ;PROVIDER NAME
 K DIC,X,Y S DIC="^VA(200,",DIC(0)="M",X="`"_+$P(^PSRX(RX,0),"^",4) D ^DIC S PSOPHYS=$S(+Y:$P(Y,"^",2),1:"UNKNOWN") K DIC,X,Y
 Q $P($$NAMEFMT^XLFNAME(PSOPHYS)," MD")
EPROV() ;
 K DIC,X,Y S DIC="^VA(200,",DIC(0)="M",X="`"_+$P(^PSRX(RX,0),"^",4) D ^DIC S PSOPHYS=$S(+Y:$P(Y,"^",2),1:"UNKNOWN") K DIC,X,Y
 Q PSOPHYS
QTY() Q $S($G(RXP):$P(RXP,"^",4),1:$P(^PSRX(RX,0),"^",7))
DF() Q $P(^PSDRUG($P(^PSRX(RX,0),"^",6),660),"^",8)
DRUG() Q $P(^PSDRUG($P(^PSRX(RX,0),"^",6),0),"^",1) ; DRUG NAME
WARN() N WARN,NWARN,IWARN,XWARN ; 1-28-02 UPDATE v1.2a TO ELIMINATE LOCAL CODES
 S WARN=$P(^PSDRUG($P(^PSRX(RX,0),"^",6),0),"^",8) ; WARNING LABEL CODES
 F NWARN=1:1:3 S IWARN=$P(WARN,",",NWARN) S:IWARN>20 IWARN="" S:$L(IWARN)=1 IWARN="0"_IWARN S:$L(IWARN)=0 IWARN="00" S XWARN=$G(XWARN)_IWARN
 Q XWARN
