BGOVPED ; IHS/BAO/TMD - Patient Education ;28-Apr-2011 10:02;DU
 ;;1.1;BGO COMPONENTS;**1,2,3,5,6,8**;Mar 20, 2007
 ;---------------------------------------------
 ;  Get patient ed records for a patient
 ;  INP = Patient IEN ^ Visit IEN (optional)
 ; .RET returned as list of records in format:
 ;   Topic Name [1] ^ Visit Date [2] ^ Level [3] ^ Provider Name [4] ^ Group/Individual [5] ^ Length [6] ^
 ;   CPT [7] ^ Comment [8] ^ Topic Category [9] ^ Behavior [10] ^ Objective Met [11] ^ Visit Locked [12] ^
 ;   Location Name [13] ^ VFile IEN [14] ^ Visit IEN [15] ^ Topic IEN [16] ^ Location IEN [17] ^ Provider IEN [18] ^
 ;   Visit Category [19] ^ ICD9 text [20] ^ Comments [21] ^ ICD9 IEN [22] ^ CPT IEN [23] ^ Readiness to learn [24] ^ ICD code [25]
GET(RET,INP) ;EP
 N BGO,CNT,REC,TOPIC,VIEN,PRV,GRP,LNGTH,ICD,ICDIEN,CPTIEN,ICDCD
 N CPT,COMMENT,CAT,BEHAV,OBJMET,NARR,EDTIEN,LVL,VPED,DFN,VIENX
 N LOCNAME,LOCIEN,VDT,VDATE,VCAT,PRVIEN,COMMENTS,MAJTOPIC,NAMEP,READY
 N XREF,ICDFIELD
 S RET=$$TMPGBL^BGOUTL
 S DFN=+INP
 S VIENX=$P(INP,U,2)
 S XREF=$$VFPTXREF^BGOUTL2
 S (CNT,VPED)=0
 F  S VPED=$O(^AUPNVPED(XREF,DFN,VPED)) Q:'VPED  D
 .S REC=$G(^AUPNVPED(VPED,0))
 .Q:REC=""
 .S EDTIEN=$P(REC,U)
 .S NAMEP=$$NEWVPED+1
 .S TOPIC=$P($G(^AUTTEDT(EDTIEN,0)),U,NAMEP)
 .Q:TOPIC=""
 .S MAJTOPIC=$P($G(^AUTTEDT(EDTIEN,0)),U,6)
 .I MAJTOPIC'="" D
 ..S MAJTOPIC=$O(^AUTTEDMT("B",MAJTOPIC,0))
 ..S MAJTOPIC=$P($G(^AUTTEDMT(+MAJTOPIC,0)),U)
 .S:$L(MAJTOPIC) TOPIC=MAJTOPIC_"-"_$S($P(TOPIC,"-",2)'="":$P(TOPIC,"-",2,4),1:TOPIC)
 .S VIEN=$P(REC,U,3)
 .I VIENX,VIEN'=VIENX Q
 .S PRVIEN=$P(REC,U,5)
 .S PRV=$P($G(^VA(200,+PRVIEN,0)),U)
 .S LVL=$$EXTERNAL^DILFD($$FNUM,.06,,$P(REC,U,6))
 .S GRP=$P(REC,U,7)
 .S GRP=$S(GRP="I":"Individual",GRP="G":"Group",1:"")
 .S LNGTH=$P(REC,U,8)
 .S CPTIEN=$P(REC,U,9)
 .S:'CPTIEN CPTIEN=$P($G(^AUTTEDT(EDTIEN,0)),U,11)
 .S CPT=$S(CPTIEN:$P($G(^ICPT(+CPTIEN,0)),U,2),1:"")
 .S:$L(CPT) TOPIC=CPT_"-"_$P(TOPIC,"-",2)
 .;Changes made to support RPMS and VistA databases
 .S ICDFIELD=$$ICDF^BGOVPED    ;P6
 .S ICDIEN=$P(REC,U,ICDFIELD)  ;P6
 .S:'ICDIEN ICDIEN=$P($G(^AUTTEDT(EDTIEN,0)),U,ICDFIELD)  ;P6
 .S ICD=$S(ICDIEN:$P($G(^ICD9(+ICDIEN,0)),U,3),1:"")
 .;IHS/MSC/MGH patch 8
 .S ICDCD=$S(ICDIEN:$P($G(^ICD9(+ICDIEN,0)),U,1),1:"")
 .S:$L(ICD) TOPIC=ICD_"-"_$P(TOPIC,"-",2)
 .S COMMENT=$P(REC,U,11)
 .S CAT=$P(REC,U,12)
 .S:CAT CAT=$P($G(^APCDEDCV(CAT,0)),U)
 .S BEHAV=$P(REC,U,13)
 .S OBJMET=$P(REC,U,14)
 .S NARR=$P($G(^AUPNVPED(VPED,11)),U)
 .;IHS/MSC/MGH Added for patch 6
 .S READY=$P($G(^AUPNVPED(VPED,11)),U,2)
 .S:READY READY=$P($G(^AUTTRTL(READY,0)),U)
 .S COMMENTS=$P($G(^AUPNVPED(VPED,811)),U)
 .I $L(COMMENTS) D
 ..N P,X
 ..S P=$S(BEHAV="GM":2,BEHAV="GNM":3,1:1)
 ..S X=$P(COMMENTS,"|",P)
 ..S:$L(X) OBJMET=X
 .S BEHAV=$$EXTERNAL^DILFD($$FNUM,.13,,BEHAV)
 .S LOCIEN=$P($G(^AUPNVSIT(VIEN,0)),U,6)
 .S LOCNAME=$P($G(^DIC(4,+LOCIEN,0)),U)
 .S:$P($G(^AUPNVSIT(VIEN,21)),U)'="" LOCNAME=$P(^(21),U)
 .S VCAT=$P($G(^AUPNVSIT(VIEN,0)),U,7),VDT=+$G(^(0))
 .S VDATE=$$FMTDATE^BGOUTL(VDT)
 .S CNT=CNT+1
 .S @RET@(CNT)=TOPIC_U_VDATE_U_LVL_U_PRV_U_GRP_U_LNGTH_U_CPT_U_COMMENT_U_CAT_U_BEHAV_U_OBJMET_U_$$ISLOCKED^BEHOENCX(VIEN)_U_LOCNAME_U_VPED_U_VIEN_U_EDTIEN_U_LOCIEN_U_PRVIEN_U_VCAT_U_ICD_U_COMMENTS_U_ICDIEN_U_CPTIEN_U_READY_U_ICDCD
 Q
 ; Delete a patient ed entry
DEL(RET,VPED) ;EP
 N X
 S X=$G(^AUPNVPED(+VPED,0))
 I $P(X,U,6)=5,$$REFDEL2^BGOUTL2(+$P(X,U,3),+X,"EDUCATION TOPICS")
 D VFDEL^BGOUTL2(.RET,$$FNUM,VPED)
 Q
 ; Get primary provider for patient ed entry
PRIPRV(RET,VPED) ;EP
 S RET=$$PRIPRV^BGOUTL($P(^AUPNVPED(VPED,0),U,3))
 Q
 ; Get education topics
 ; MODE = 0:category, 1:diagnosis, 2:non-diagnosis
 ; Returned as a list of records in the format:
 ;  Name ^ Category Name ^ ICD IEN ^ ICD Name ^ Education Topic IEN ^ Type
GETTYPES(RET,MODE) ;EP
 N BGO,NAME,CATNAME,ICD,ICDNAME,CATP,EDT,CNT,REC,TYPE,CAT,XX,NAMEP
 N MNEXREF,ICDFIELD
 S RET=$$TMPGBL^BGOUTL
 S (CNT,EDT)=0
 S NAMEP=$$NEWVPED+1
 S MNEXREF=$E("CB",NAMEP)
 S ICDFIELD=$$ICDF^BGOVPED  ;P6
 S XX=""
 F  S XX=$O(^AUTTEDT(MNEXREF,XX)),EDT=0 Q:XX=""  D
 .F  S EDT=$O(^AUTTEDT(MNEXREF,XX,EDT)) Q:'EDT  D
 ..S REC=$G(^AUTTEDT(EDT,0))
 ..Q:'$L(REC)
 ..Q:$P(REC,U,3)
 ..S CATNAME="",ICDNAME="",TYPE="E"
 ..S NAME=$P(REC,U,NAMEP)
 ..S ICD=$P(REC,U,ICDFIELD)
 ..I ICD S ICDNAME=$P($G(^ICD9(ICD,0)),U,3)
 ..S CATP=$P(REC,U,6)
 ..I CATP'="" D
 ...I $L(CATP)>4 S CATP=$E(CATP,1,4)
 ...S CATP=$O(^AUTTEDMT("B",CATP,0))
 ...S:CATP CATNAME=$P($G(^AUTTEDMT(CATP,0)),U)
 ..Q:CATNAME=""
 ..I 'MODE,CATNAME'="" D
 ...Q:$D(CAT(CATNAME))
 ...S CAT(CATNAME)=""
 ...S CNT=CNT+1,@RET@(CNT)=CATNAME_U_CATNAME_"^^^^C"
 ..E  I MODE=1 D
 ...S CATNAME=ICDNAME
 ...Q:ICDNAME=""
 ...Q:$D(CAT(ICDNAME))
 ...S CAT(ICDNAME)=""
 ...S CNT=CNT+1,@RET@(CNT)=ICDNAME_U_ICDNAME_"^^^^C"
 ..S:'$L(ICD) CNT=CNT+1,@RET@(CNT)=NAME_U_CATNAME_U_ICD_U_ICDNAME_U_EDT_U_TYPE
 Q
 ; Returns category for an education topic
 ;  EDT = Education topic IEN
GETNAME(RET,EDT) ;EP
 N X,X0
 S RET=""
 Q:'$G(EDT)
 S X0=$G(^AUTTEDT(EDT,0))
 S X=$P(X0,U,6)
 I $L(X) D
 .S X=$O(^AUTTEDMT("B",X,0))
 .S:X RET=$P($G(^AUTTEDMT(X,0)),U)
 I '$L(RET) D
 .S X=$P(X0,U,4)
 .S:X RET=$P($G(^ICD9(X,0)),U,3)
 I '$L(RET) D
 .S X=$P(X0,U,11)
 .S:X RET=$P($G(^ICPT(X,0)),U,2)
 Q
 ; Returns a list of education topics for PCC data entry
GETTOPIC(RET,DUMMY) ;EP
 N X,CNT
 S (X,CNT)=0,RET=$$TMPGBL^BGOUTL
 F  S X=$O(^APCDEDCV(X)) Q:'X  D
 .S CNT=CNT+1,@RET@(CNT)=X_U_$P(^APCDEDCV(X,0),U)
 Q
 ; Return outcome and standard counts for an education topic
GETOS(RET,EDT) ;EP
 N X,CNT,NAMEP,TOPIC,MAJTOPIC
 K RET
 I '$G(EDT) S RET(1)=$$ERR^BGOUTL(1008) Q
 I '$D(^AUTTEDT(EDT,0)) S RET(1)=$$ERR^BGOUTL(1088) Q
 S NAMEP=$$NEWVPED+1
 S TOPIC=$P(^AUTTEDT(EDT,0),U,NAMEP),MAJTOPIC=$P(^(0),U,6)
 S:$L(MAJTOPIC) MAJTOPIC=$O(^AUTTEDMT("B",MAJTOPIC,0)),MAJTOPIC=$P($G(^AUTTEDMT(+MAJTOPIC,0)),U)
 S:$L(MAJTOPIC) TOPIC=MAJTOPIC_"-"_$S($P(TOPIC,"-",2)'="":$P(TOPIC,"-",2,4),1:TOPIC)
 S CNT=0
 D GO1(TOPIC),GO2(1),GO2(2)
 Q
 ; Add to output array
GO1(X) S CNT=CNT+1,RET(CNT)=X
 Q
 ; Add outcome/standard text to output array
GO2(N) N X,Y,L
 S X=0,L=$P("OUTCOME^STANDARD",U,N)
 F  S X=$O(^AUTTEDT(EDT,N,X)) Q:'X  S Y=$G(^(X,0)) D
 .I $L(L) D
 ..D GO1("")
 ..D:$E(Y,1,$L(L))'=L GO1(L_":")
 ..S L=""
 .D GO1(Y)
 Q
 ; Sets/returns diagnostic-based topic/education
 ;  INP = ICD9 IEN ^ EDC IEN
SETDXTOP(RET,INP) ;EP
 S RET=$$SETTOP($P(INP,U),$P(INP,U,2),1)
 Q
 ; Sets/returns procedure-based topic/education
 ;  INP = CPT4 IEN ^ EDC IEN
SETPXTOP(RET,INP) ;EP
 S RET=$$SETTOP($P(INP,U),$P(INP,U,2),0)
 Q
 ; Sets/Returns DX/PX-topic education
SETTOP(CODEIEN,EDCVIEN,ICDFLG) ;
 N CODE,CODENM,TOPIC,TOP,NAME,MNEM,F01,RET,ICDFLD
 Q:'EDCVIEN ""
 S TOPIC=$P($G(^APCDEDCV(EDCVIEN,0)),U),TOP=$P($G(^(0)),U,2)
 Q:'$L(TOPIC)!'$L(TOP) ""
 I ICDFLG S CODE=$P($G(^ICD9(CODEIEN,0)),U),CODENM=$P($G(^(0)),U,3)
 E  S CODE=$P($G(^ICPT(CODEIEN,0)),U),CODENM=$P($G(^(0)),U,2)
 ;IHS/MSC/MGH changed to store code
 S:'$L(CODENM) CODENM=CODEIEN,CODEIEN=""  ; Uncoded entry
 S NAME=CODE_"-"_TOPIC,MNEM=CODE_"-"_TOP
 S F01=$S($$NEWVPED:MNEM,1:NAME)
 S ICDFLD=$$ICDFNUM^BGOVPED          ;Patch 8
 S RET=$O(^AUTTEDT("B",F01,0))_U_F01
 I 'RET D
 .N FDA,IEN
 .S FDA=$NA(FDA(9999999.09,"+1,"))
 .S @FDA@(.01)=F01
 .S @FDA@(1)=$S($$NEWVPED:NAME,1:MNEM)
 .;MSC/MGH patch 8 change
 .I ICDFLG D
 ..S @FDA@(ICDFLD)=CODEIEN
 .E  S @FDA@(.11)=CODEIEN
 .S RET=$$UPDATE^BGOUTL(.FDA,,.IEN)
 .S:'RET RET=IEN(1)_U_F01
 Q RET
 ; Set patient ed entry
 ;  INP = VFile IEN [1] ^ Topic [2] ^ Patient IEN [3] ^ Visit IEN [4] ^ Provider IEN [5] ^
 ;        Level Understanding [6] ^ Individual/Group [7] ^ Length [8] ^ CPT [9] ^ Comment [10] ^
 ;        Behavior Code [11] ^ Objectives [12] ^ Event Date [13] ^ Location IEN [14] ^
 ;        Other Location [15] ^ Historical [16] ^ Readiness [17] ^ Allow Dups [18]
SET(RET,INP) ;EP
 N VIEN,FDA,VCAT,APCDALVR,DFN,CPT,VFIEN,TYPE,LVL,PRV,GRP,LEN,COMMENT,BEHAV,OBJMET
 N EVNTDT,LOCIEN,OUTLOC,HIST,DX,OLDLVL,READY,FNUM,VFNEW,DUPS,ICDFIELD,READY
 S RET="",FNUM=$$FNUM
 S ICDFIELD=$$ICDF^BGOVPED  ;P6
 S VFIEN=+INP
 S VFNEW='VFIEN
 S TYPE=+$P(INP,U,2)
 I '$D(^AUTTEDT(TYPE,0)) S RET=$$ERR^BGOUTL(1088) Q
 S DFN=+$P(INP,U,3)
 I '$D(^AUPNPAT(DFN,0)) S RET=$$ERR^BGOUTL(1001) Q
 S VIEN=+$P(INP,U,4)
 S PRV=$P(INP,U,5)
 S LVL=$P(INP,U,6)
 S GRP=$P(INP,U,7)
 S LEN=$P(INP,U,8)
 S CPT=$P(INP,U,9)
 S COMMENT=$P(INP,U,10)
 S BEHAV=$P(INP,U,11)
 S OBJMET=$P(INP,U,12)
 S EVNTDT=$$CVTDATE^BGOUTL($P(INP,U,13))
 S LOCIEN=$P(INP,U,14)
 S OUTLOC=$P(INP,U,15)
 S HIST=$P(INP,U,16)
 S READY=$P(INP,U,17)
 S DUPS=$P(INP,U,18)
 S:'$L(DUPS) DUPS=1
 S VCAT=$P($G(^AUPNVSIT(VIEN,0)),U,7)
 S:VCAT="E" HIST=1
 I 'VIEN,'HIST S RET=$$ERR^BGOUTL(1002) Q
 I HIST D  Q:RET<0
 .S RET=$$MAKEHIST^BGOUTL(DFN,EVNTDT,$S($L(OUTLOC):OUTLOC,1:LOCIEN),VIEN)
 .S:RET>0 VIEN=RET
 S RET=$$CHKVISIT^BGOUTL(VIEN,DFN)
 Q:RET
 S DX=$P(^AUTTEDT(TYPE,0),U,ICDFIELD)  ;P6
 I 'VFIEN D  Q:'VFIEN
 .D VFNEW^BGOUTL2(.RET,FNUM,TYPE,VIEN,$S('DUPS:"Education",1:""))
 .S:RET>0 VFIEN=RET,RET=""
 .S OLDLVL=""
 E  S OLDLVL=$P($G(^AUPNVPED(VFIEN,0)),U,6)
 S FDA=$NA(FDA(FNUM,VFIEN_","))
 S @FDA@(.01)="`"_TYPE
 S ICDFNUM=$$ICDFNUM^BGOVPED
 S @FDA@(.04)=$S(DX:"`"_DX,1:"")   ;Patch 8 change
 S @FDA@(.05)=$S(PRV:"`"_PRV,1:"")
 S @FDA@(.06)=LVL
 S @FDA@(.07)=GRP
 S @FDA@(.08)=LEN
 S @FDA@(.09)=$S(CPT:"`"_CPT,1:"")
 S @FDA@(.11)=COMMENT
 S @FDA@(.13)=BEHAV
 S @FDA@(1204)="`"_DUZ
 S @FDA@(1201)="N"
 S @FDA@(1102)=READY  ;IHS/MSC/MGH patch 6
 I $L(OBJMET) D
 .N P,COMMENTS
 .S COMMENTS=$P($G(^AUPNVPED(VFIEN,811)),U)
 .S P=$S(BEHAV="GM":2,BEHAV="GNM":3,1:1)
 .S:P>1 $P(COMMENTS,"|",5-P)=""
 .S $P(COMMENTS,"|",P)=$TR(OBJMET,"|")
 .S @FDA@(81101)=COMMENTS
 S RET=$$UPDATE^BGOUTL(.FDA,"E")
 I RET,VFNEW,$$DELETE^BGOUTL(FNUM,VFIEN)
 I 'RET,LVL=5,OLDLVL'=LVL S RET=$$REFSET^BGOUTL2(VIEN,TYPE,"EDUCATION TOPICS","R",COMMENT)
 I 'RET,OLDLVL=5,OLDLVL'=LVL S RET=$$REFDEL2^BGOUTL2(VIEN,TYPE,"EDUCATION TOPICS")
 D:'RET VFEVT^BGOUTL2(FNUM,VFIEN,'VFNEW)
 S:'RET RET=VFIEN
 Q
 ; Returns true if new V Patient Ed format
NEWVPED() Q $$FLDNUM^DILFD(9999999.09,"NAME")'=.01
 ; Return V File #
FNUM() Q 9000010.16
ICDF() Q $S($G(DUZ("AG"))="I":"4",1:"10")
ICDFNUM() Q $S($G(DUZ("AG"))="I":".04",1:".1")
