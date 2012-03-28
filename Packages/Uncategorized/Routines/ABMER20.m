ABMER20 ; IHS/ASDST/DMJ - UB92 EMC RECORD 20 (Patient) ;   
 ;;2.6;IHS 3P BILLING SYSTEM;;NOV 12, 2009
 ;Original;DMJ;02/26/96 5:11 PM
 ;
 ; IHS/ASDS/DMJ - 04/20/00 - V2.4 Patch 1 - NOIS HQW-0500-100040
 ;     Modified location code to check for satellite first.  If no
 ;     satellite, use parent.
 ; IHS/ASDS/LSL - 08/02/00 - V2.4 Patch 3 - NOIS NDA-0700-180015
 ;     In order to get bill number on RA from Consultec, bill number
 ;     must be in field 3 and 25.
 ;
 ; IHS/ASDS/DMJ - v2.4 p7 - 9/7/01 NOIS HQW-0701-100066
 ;     Modifications made related to Medicare Part B
 ;
START ;START HERE
 K ABMREC(20),ABMR(20)
 S ABME("RTYPE")=20
 S ABMRT(95,60)=+$G(ABMRT(95,60))+1
 K ABMP("SET")
 D SET^ABMERUTL,LOOP
 D S90^ABMERUTL
 K ABME,ABM
 Q
 ;
LOOP ;LOOP HERE
 D ^ABMER20A
 F I=120:10:260 D
 .D @I
 .I $D(^ABMEXLM("AA",+$G(ABMP("INS")),+$G(ABMP("EXP")),20,I)) D @(^(I))
 .I '$G(ABMP("NOFMT")) S ABMREC(20)=$G(ABMREC(20))_ABMR(20,I)
 Q
 ;
30 ;EP -Patient Control Number
 ; form locator #3
 D PCN^ABMERUTL
 S ABMR(20,30)=ABMP("PCN")
 Q
 ;
120 ;EP - Patient Address - Line 1 (SOURCE: FILE=2, FIELD=.111)
 ; form locator #13
 D:'$D(ABME("AD1")) ADR
 S ABMR(20,120)=ABME("AD1")
 S ABMR(20,120)=$$FMT^ABMERUTL(ABMR(20,120),18)
 Q
 ;
130 ;EP - Patient Address - Line 2 (SOURCE: FILE=2, FIELD=.112)
 ; form locator #13
 D:'$D(ABME("AD2")) ADR
 S ABMR(20,130)=ABME("AD2")
 S ABMR(20,130)=$$FMT^ABMERUTL(ABMR(20,130),18)
 Q
 ;
140 ;EP - Patient's City (SOURCE: FILE=2, FIELD=.114)
 ; form locator #13
 D:'$D(ABME("AD4")) ADR
 S ABMR(20,140)=ABME("AD4")
 S ABMR(20,140)=$$FMT^ABMERUTL(ABMR(20,140),15)
 Q
 ;
150 ;EP - Patient's State (SOURCE: FILE=2, FIELD=.115)
 ; form locator #13
 D:'$D(ABME("AD5")) ADR
 S ABMR(20,150)=ABME("AD5")
 S:ABMR(20,150)="" ABMR(20,150)="  "
 Q
 ;
160 ;EP - Patient's Zip (SOURCE: FILE=2, FIELD=.116)
 ; form locator #13
 D:'$D(ABME("AD6")) ADR
 S ABMR(20,160)=ABME("AD6")
 I '$G(ABMP("NOFMT")) D
 .S:ABME("AD6")="" ABME("AD6")="00000"
 S ABMR(20,160)=$E(ABME("AD6"),1,5)_"0000"
 S ABMR(20,160)=$$FMT^ABMERUTL(ABMR(20,160),9)
 Q
 ;
ADR ;GET PATIENT ADDRESS FROM FILE 2
 ; I = 1 - Mailing Address - Street
 ;     2 - Street Address [line 2]
 ;     3 - Street Address [line 3]
 ;     4 - Mailing Address - City
 ;     5 - Mailing Address - State
 ;     6 - Mailing Address - Zip
 N I
 F I=1:1:6 S ABME("AD"_I)=$P($G(^DPT(+ABMP("PDFN"),.11)),"^",I)
 S ABME("AD5")=$P($G(^DIC(5,+ABME("AD5"),0)),"^",2)
 Q
 ;
170 ;EP - Admission/Start of Care Date (SOURCE: FILE=9002274.4, FIELD=.71)
 ; form locator #17
 S ABME("FLD")=.71
 D DIQ1
 S ABMR(20,170)=ABM(9002274.4,ABMP("BDFN"),.71,"I")
 S ABMR(20,170)=$$MDY^ABMDUTL(ABMR(20,170))
 S ABMR(20,170)=$$FMT^ABMERUTL(ABMR(20,170),"6NR")
 Q
 ;
180 ;EP - Admission Hour (SOURCE: FILE=9002274.4, FIELD=.62)
 ; form locator #18
 S ABME("FLD")=.62
 D DIQ1
 S ABMR(20,180)=ABM(9002274.4,ABMP("BDFN"),.62,"I")
 S ABMR(20,180)=$$FMT^ABMERUTL(ABMR(20,180),"2NR")
 Q
 ;
190 ;EP - Statement Covers Period From (SOURCE: FILE=9002274.4, FIELD=.71)
 ; form locator #6
 S ABME("FLD")=.71
 D DIQ1
 S ABMR(20,190)=ABM(9002274.4,ABMP("BDFN"),.71,"I")
 S ABMR(20,190)=$$MDY^ABMDUTL(ABMR(20,190))
 S ABMR(20,190)=$$FMT^ABMERUTL(ABMR(20,190),"6NR")
 Q
 ;
200 ;EP - Statement Covers Period Through (SOURCE: FILE=9002274.4, FIELD=.72)
 ; form locator #6
 S ABME("FLD")=.72
 D DIQ1
 S ABMR(20,200)=ABM(9002274.4,ABMP("BDFN"),.72,"I")
 S ABMR(20,200)=$$MDY^ABMDUTL(ABMR(20,200))
 S ABMR(20,200)=$$FMT^ABMERUTL(ABMR(20,200),"6NR")
 Q
 ;
210 ;EP - Patient Status (SOURCE: FILE=9002274.4, FIELD=.53)
 ; form locator #22
 S ABME("FLD")=.53
 D DIQ1
 S ABMR(20,210)=ABM(9002274.4,ABMP("BDFN"),.53,"E")
 ; If status is "" and visit is outpatient and insurance type is 
 ; Medicare FI, set status to 1
 I ABMR(20,210)="",ABMP("VTYP")=131,ABMP("ITYPE")="R" S ABMR(20,210)=1
 S ABMR(20,210)=$$FMT^ABMERUTL(ABMR(20,210),"2NR")
 Q
 ;
220 ;EP - Discharge Hour (SOURCE: FILE=9002274.4, FIELD=.64)
 ; form locator #21
 S ABME("FLD")=.64
 D DIQ1
 S ABMR(20,220)=ABM(9002274.4,ABMP("BDFN"),.64,"I")
 S ABMR(20,220)=$$FMT^ABMERUTL(ABMR(20,220),"2NR")
 Q
 ;
230 ;EP - Patient Has Paid (SOURCE: FILE=9002274.4, FIELD=.99)
 S ABME("FLD")=.99
 D DIQ1
 S ABMR(20,230)=ABM(9002274.4,ABMP("BDFN"),.99,"E")
 S ABMR(20,230)=$$FMT^ABMERUTL(ABMR(20,230),"10NRJ2")
 Q
 ;
240 ;EP - Estimated Amount Due (SOURCE: FILE=, FIELD=)
 S ABME("FLD")=.21
 D DIQ1
 S ABMR(20,240)=ABM(9002274.4,ABMP("BDFN"),.21,"E")
 S ABMR(20,240)=$$FMT^ABMERUTL(ABMR(20,240),"10NRJ2")
 Q
 ;
250 ;EP - Medical Record Number (SOURCE: FILE=9000001.41, FIELD=.02)
 ; form locator #23
 S ABMR(20,250)=$P($G(^AUPNPAT(+ABMP("PDFN"),41,+ABMP("LDFN"),0)),"^",2)
 S ABMR(20,250)=$$FMT^ABMERUTL(ABMR(20,250),17)
 ; if Export is UB-92-E V4 and New Mexico Medicaid, use bill number
 I ABMP("EXP"),$G(ABMRCID)="00MAD" S ABMR(20,250)=$$FMT^ABMERUTL(ABMR(20,30),17)
 Q
 ;
260 ;EP - Filler
 S ABMR(20,260)=""
 S ABMR(20,260)=$$FMT^ABMERUTL(ABMR(20,260),3)
 Q
 ;
DIQ1 ;PULL BILL DATA VIA DIQ1
 Q:$D(ABM(9002274.4,ABMP("BDFN"),ABME("FLD")))
 N I
 S DIQ="ABM("
 S DIQ(0)="EI"
 S DIC="^ABMDBILL(DUZ(2),"
 S DA=ABMP("BDFN")
 S DR=".01;.21;.51;.52;.53;.61;.62;.63;.64;.71;.72;.99"
 D EN^DIQ1
 K DIQ
 Q
 ;
EX(ABMX,ABMY) ;EP - EXTRINSIC FUNCTION HERE
 ;
 ;  INPUT:  ABMX = data element
 ;             Y = bill internal entry number
 ;
 ; OUTPUT:     Y = bill internal entry number
 ;
 S ABMP("BDFN")=ABMY
 D SET^ABMERUTL
 I '$G(ABMP("NOFMT")) S ABMP("FMT")=0
 D @ABMX
 S Y=ABMR(20,ABMX)
 K ABMR(20,ABMX),ABMX,ABMY
 I $D(ABMP("FMT")) S ABMP("FMT")=1
 Q Y
