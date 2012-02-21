PSOLLL2 ;BIR/JLC-LASER LABEL ;11/19/02
 ;;7.0;OUTPATIENT PHARMACY;**120,138,141,161**;DEC 1997
 ;
L1 I $G(PSOIO("PFDI"))]"" X PSOIO("PFDI")
 I '$G(PFF) D
 .N PGY
 .M PGY=SGY I $D(OSGY) K PGY M PGY=OSGY
 .D COUNTSGF^PSOLLLW
 S PFM=0,T=$S($D(REPRINT)&($G(PSOBLALL)):"(GROUP REPRINT)",$D(REPRINT):"(REPRINT)",1:"")
 S T=T_$S($G(RXP):"(PARTIAL)",1:"")_$S($D(REPRINT):" ",$G(RXP):" ",1:"")_$P(PS2,"^",2)_"  "_TECH_"  "_$P(PSONOWT,":",1,2) D PRINT(T)
 S T="Rx# "_RXN_"  "_DATE_"  "_$S('PFF:"Fill "_(RXF+1)_" of "_(1+$P(RXY,"^",9)),1:"(fill document continued)") D PRINT(T)
 S T=PNM_"  "_$G(SSNPN) D PRINT(T,1)
 S LENGTH=0,PTEXT="",PFF=0,XFONT=$E(PSOFONT,2,99)
 N DP,TEXTP,TEXTL,MORE
 S DR=PFF("DR")
 F I=1:1 Q:'$D(NPGY(DR,I))  S TEXT=NPGY(DR,I) D PRINT(TEXT)
 I I>4,$D(NPGY(DR,5)) S PFF=1,PFF("DR")=DR+1
 S OPSOY=PSOY
 I $G(PSOIO("PFDQ"))]"" X PSOIO("PFDQ")
 I PFF S PSOX=PSOCX,PSOY=OPSOY,T="(continued on next fill document)" S PFM=1 D PRINT(T) Q
 K NPGY,^TMP($J,"PSOSIGF")
 S XFONT=$E(PSOQFONT,2,99)
 S TEXT="Qty: " D STRT^PSOLLU1("SIG2",TEXT,.L) S Q(1)=L(XFONT)
 S TEXT=" "_PSDU D STRT^PSOLLU1("SIG2",TEXT,.L) S Q(2)=L(XFONT)
 S TEXT="       "_$G(PHYS) D STRT^PSOLLU1("SIG2",TEXT,.L) S Q(3)=L(XFONT)
 S PPHYS=$G(PHYS)
 S TEXT=$G(QTY) D STRT^PSOLLU1("SIG2",TEXT,.L) S LENGTH=Q(1)+Q(2)+Q(3)+L(XFONT+2),Q(4)=L(XFONT+2)
 I LENGTH>3.7 F I=$L(PHYS)-1:-1:1 S PPHYS=$E(PHYS,1,I),TEXT="       "_PPHYS D STRT^PSOLLU1("SIG2",TEXT,.L) I Q(1)+Q(2)+Q(4)+L(XFONT)<3.7 Q
 S OPSOX=PSOX,PSOX=Q(1)*300+OPSOX,T=$G(QTY) D PRINT(T) S PSOX=OPSOX
 S PSOFONT=PSOQFONT,PSOY=PSOY-PSOYI,T="Qty: " D PRINT(T)
 S PSOY=PSOY-PSOYI,PSOX=Q(1)+Q(4)*300+OPSOX,T=" "_$G(PSDU)_"       "_$G(PPHYS) D PRINT(T)
 I $G(PSOIO("PFDT"))]"" X PSOIO("PFDT")
 S T=DRUG D PRINT(T)
L11 S T="Mfr ___________________ Lot# _______________________" D PRINT(T)
L12 S T="Tech__________________ RPh _______________________" D PRINT(T)
 S PSOFONT=PSOTFONT
 S T="Routing: "_$S("W"[$E(MW):MW,PS55=2:"DO NOT MAIL",1:MW_" MAIL")_"    Days supply: "_$G(DAYS)_"     Cap: "_$S('PSCAP:"SAFETY",1:"") D PRINT(T)
 I PSCAP D
 .D STRT^PSOLLU1("SIG2",T,.L) S LENGTH=L(XFONT+1)
 .S OPSOX=PSOX,T="NON-SAFETY",PSOX=LENGTH*300+OPSOX,PSOY=PSOY-PSOYI D PRINT(T,1) S PSOX=OPSOX
 S T="Isd: "_ISD_"    Exp: "_EXPDT_"    Last Fill: "_$G(PSOFLAST) D PRINT(T)
 S PSOYI=PSOBYI,PSOY=PSOBY
 I $G(PSOIO("SBT"))]"" X PSOIO("SBT")
 S X2=PSOINST_"-"_RX
 W X2
 I $G(PSOIO("EBT"))]"" X PSOIO("EBT")
 I $G(PSOIO("PFDW"))]"" X PSOIO("PFDW")
 S XFONT=$E(PSOFONT,2,99)
 I $G(WARN)'="" S PTEXT="DRUG WARNING " D STRT^PSOLLU1("SIG2",PTEXT,.L) S LENGTH=L(XFONT) D
 . F I=1:1:$L(WARN,",") S TEXT=$P(WARN,",",I)_"," D
 .. D STRT^PSOLLU1("SIG2",TEXT,.L)
 .. I LENGTH+L(XFONT)<1.8 S PTEXT=PTEXT_TEXT,LENGTH=LENGTH+L(XFONT) Q
 .. S LENGTH=0,I=I-1
 .. S T=$P(PTEXT,",",1,$L(PTEXT,",")-1) D PRINT(T) S PTEXT=""
 .. I PSOY>PSOYM W "*"
 . I PTEXT]"" S T=$P(PTEXT,",",1,$L(PTEXT,",")-1) D PRINT(T)
 S PTEXT="Pat. Stat "_PATST_" Clinic: "_PSCLN D STRT^PSOLLU1("SIG2",PTEXT,.L) S T=PTEXT D PRINT(T)
 Q
 ;
PRINT(T,B) ;
 S BOLD=$G(B)
 I 'BOLD,$G(PSOIO(PSOFONT))]"" X PSOIO(PSOFONT)
 I BOLD,$G(PSOIO(PSOFONT_"B"))]"" X PSOIO(PSOFONT_"B")
 I $G(PSOIO("ST"))]"" X PSOIO("ST")
 W T,!
 I $G(PSOIO("ET"))]"" X PSOIO("ET")
 I BOLD,$G(PSOIO(PSOFONT))]"" X PSOIO(PSOFONT) ;TURN OFF BOLDING
 Q
