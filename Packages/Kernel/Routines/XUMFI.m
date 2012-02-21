XUMFI ;CIOFO-SF/RAM - Master File Interface ;06/28/00
 ;;8.0;KERNEL;**206,217,218,335,261**;Jul 10, 1995
 ;
 ; This routine is the Master File Server HL7 message builder API.
 ; The routine will generate messages for both trigger events and
 ; queries.
 ;
 ; Use the routine XUMFP to initialize the PARAM array.
 ; See XUMFP for a full description of the parameters.
 ;
 ; use of $O(^HLCS(870,"C",institution_ptr)) supported by IA# 3550
 ;
MAIN(IFN,IEN,TYPE,PARAM,ERROR) ;  -- entry point
 ;
 ;
 N HLFS,HLCS,HLRESLT,QUERY,UPDATE,ALL,CNT,ROOT,PROTOCOL,MFR,MFQ,MTYP,I
 N ARRAY,GROUP,MFK,CDSYS,J,HLSCS
 ;
 M ^TMP("XUMF MFS",$J,"PARAM")=PARAM K PARAM
 ;
 D INIT,BUILD,LLNK,SEND,EXIT
 ;
 ;
 Q
 ;
INIT ; -- initialize
 ;
 K ^TMP("DILIST",$J),^TMP("DIERR",$J)
 K ^TMP("HLS",$J),^TMP("HLA",$J)
 ;
 S IEN=$G(IEN),IFN=$G(IFN)
 S TYPE=$G(TYPE),ERROR=$G(ERROR),CNT=1
 S UPDATE=$S(TYPE#2:0,1:1)
 S QUERY='UPDATE
 S GROUP=$S(UPDATE:0,TYPE[5:1,TYPE[7:1,1:0)
 S ARRAY=$S(UPDATE:0,TYPE[3:1,TYPE[7:1,1:0)
 S ALL=$S(IEN["ALL":1,1:0)
 S PROTOCOL=$G(^TMP("XUMF MFS",$J,"PARAM","PROTOCOL"))
 S MFR=$S(UPDATE:0,TYPE>10:1,1:0)
 S MFQ=$S(UPDATE:0,'MFR:1,1:0)
 S MFK=$S(TYPE=10:1,1:0)
 S MTYP=$S(MFR:"HLA",MFK:"HLA",1:"HLS")
 ;
 ; -- get variables from HL7 package
 I $O(HL(""))="" D INIT^HLFNC2(PROTOCOL,.HL)
 I $O(HL(""))="" S ERROR="1^"_$P(HL,"^",2) Q
 S HLFS=HL("FS"),HLCS=$E(HL("ECH")),HLSCS=$E(HL("ECH"),4)
 ;
 Q:ERROR
 ;
 ; -- check parameters
 I 'QUERY,'UPDATE S ERROR="1^invalid message type" Q
 I 'IFN S ERROR="1^invalid file number" Q
 I 'IEN,'ALL,'MFK S ERROR="1^invalid IEN" Q
 I '$$VFILE^DILFD(IFN) S ERROR="1^invalid file number" Q
 I UPDATE,'IEN S ERROR="1^update message requires an IEN" Q
 ;
 ; -- get root of file
 S ROOT=$$ROOT^DILFD(IFN,,1)
 ;
 ; -- if IEN array input, merge with param
 I 'ALL,'IEN,$O(IEN(0)) M ^TMP("XUMF MFS",$J,"PARAM","IEN")=IEN
 ;
 ; -- if CDSYS and ALL get entries
 S CDSYS=$G(^TMP("XUMF MFS",$J,"PARAM","CDSYS"))
 I ALL,CDSYS'="" D
 .S I=0 F  S I=$O(@ROOT@("XUMFIDX",CDSYS,I)) Q:'I  D
 ..S J=$O(@ROOT@("XUMFIDX",CDSYS,I,0))
 ..S ^TMP("XUMF MFS",$J,"PARAM","IEN",J)=""
 ;
 ; -- get ALL file 'national' entries
 I ALL,'$D(^TMP("XUMF MFS",$J,"PARAM","IEN")) D
 .S I=0 F  S I=$O(@ROOT@("XUMF","N",I)) Q:'I  D
 ..S ^TMP("XUMF MFS",$J,"PARAM","IEN",I)=""
 ;
 Q
 ;
BUILD ; -- build message
 ;
 I MFK D MFK Q
 ;
 Q:ERROR
 ;
 N ID,APP,EVENT,ENDT,EFFDT,RESP,MFI,MFN,EDT,CODE,MFE
 ;
 I QUERY D QRD Q:MFQ
 ;
 D MFI
 ;
 I GROUP D GROUP Q
 ;
 D MFE,ZZZ
 ;
 Q
 ;
MFK ; -- master file acknowledgement
 ;
 N X
 S X="MSA"_HLFS_$S(ERROR:"AE",1:"AA")_HLFS_HL("MID")_HLFS_$P(ERROR,U,2)
 S ^TMP(MTYP,$J,CNT)=X
 S CNT=CNT+1
 ;
 Q
 ;
QRD ; -- query definition segment
 ;
 I TYPE>10 D
 .S ^TMP(MTYP,$J,CNT)="MSA"_HLFS_$S(ERROR:"AE",1:"AA")_HLFS_HL("MID")
 .S CNT=CNT+1
 ;
 Q:ERROR
 ;
 N QDT,QFC,QP,QID,ZDRT,ZDRDT,QLR,WHO,WHAT,WDDC,WDCVQ,QRL,QRD
 ;
 S QDT=$G(^TMP("XUMF MFS",$J,"PARAM","QDT"))
 S QFC=$G(^TMP("XUMF MFS",$J,"PARAM","QFC"))
 S QP=$G(^TMP("XUMF MFS",$J,"PARAM","QP"))
 S QID=$G(^TMP("XUMF MFS",$J,"PARAM","QID"))
 S ZDRT=$G(^TMP("XUMF MFS",$J,"PARAM","DRT"))
 S ZDRDT=$G(^TMP("XUMF MFS",$J,"PARAM","DRDT"))
 S QLR=$G(^TMP("XUMF MFS",$J,"PARAM","QLR"))
 S WHO=$G(^TMP("XUMF MFS",$J,"PARAM","WHO"))
 S WHAT=$G(^TMP("XUMF MFS",$J,"PARAM","WHAT"))
 S WDDC=$G(^TMP("XUMF MFS",$J,"PARAM","WDDC"))
 S WDCVQ=$G(^TMP("XUMF MFS",$J,"PARAM","WDCVQ"))
 S QRL=$G(^TMP("XUMF MFS",$J,"PARAM","QRL"))
 S QRD="QRD"_HLFS_QDT_HLFS_QFC_HLFS_QP_HLFS_QID_HLFS_ZDRT_HLFS_ZDRDT
 S QRD=QRD_HLFS_QLR_HLFS_WHO_HLFS_WHAT_HLFS_WDDC_HLFS_WDCVQ_HLFS_QRL
 S ^TMP(MTYP,$J,CNT)=QRD
 S CNT=CNT+1
 ;
 Q
 ;
MFI ; master file identifier segment
 ;
 Q:ERROR
 ;
 N ID,APP,EVENT,ENDT,EFFDT,RESP,MFI
 ;
 S ID=$G(^TMP("XUMF MFS",$J,"PARAM","MFI"))
 S APP=$G(^TMP("XUMF MFS",$J,"PARAM","MFAI"))
 S EVENT=$G(^TMP("XUMF MFS",$J,"PARAM","FLEV"))
 S ENDT=$G(^TMP("XUMF MFS",$J,"PARAM","ENDT"))
 S EFFDT=$G(^TMP("XUMF MFS",$J,"PARAM","MFIEDT"))
 S RESP=$G(^TMP("XUMF MFS",$J,"PARAM","RLC"))
 S:APP="" APP="MFS" S:EVENT="" EVENT="REP" S:RESP="" RESP="NE"
 S:ENDT="" ENDT=$$NOW^XLFDT S:EFFDT="" EFFDT=$$NOW^XLFDT
 S MFI=$$MFI^XUMFMFI(ID,APP,EVENT,ENDT,EFFDT,RESP)
 I $E(MFI)="-" S ERROR=MFI Q
 S ^TMP(MTYP,$J,CNT)=MFI
 S CNT=CNT+1
 ;
 Q
 ;
MFE ; master file entry segment
 ;
 Q:ERROR
 ;
 N EVENT,MFN,EDT,CODE,MFE
 ;
 S EVENT=$G(^TMP("XUMF MFS",$J,"PARAM","RLEC"))
 S MFN=$G(^TMP("XUMF MFS",$J,"PARAM","MFNCID"))
 S EDT=$G(^TMP("XUMF MFS",$J,"PARAM","MFEEDT"))
 S CODE=$G(^TMP("XUMF MFS",$J,"PARAM","PKV"))
 S:EDT="" EDT=$$NOW^XLFDT S:EVENT="" EVENT="MAD"
 S MFE=$$MFE^XUMFMFE(EVENT,MFN,EDT,CODE)
 I $E(MFE)="-" S ERROR=MFE Q
 S ^TMP(MTYP,$J,CNT)=MFE
 S CNT=CNT+1
 ;
 Q
 ;
ZZZ ; [Z...] segment
 ;
 Q:ERROR
 ;
 N SEG,SEQ,ZZZ,FLD,FILE,IENS,VALUE,ERR,ZDTYP,FIELD,SEQ1,SEQ2,SEQ3
 N SEQ0,SEQ9,CNT1,CNT2,NODE,XXX
 ;
 S SEG="",SEQ=0
 F  S SEG=$O(^TMP("XUMF MFS",$J,"PARAM","SEG",SEG)) Q:SEG=""  D
 .S ZZZ=SEG
 .F  S SEQ=$O(^TMP("XUMF MFS",$J,"PARAM","SEG",SEG,"SEQ",SEQ)) Q:'SEQ  D
 ..;
 ..S SEQ1=$P(SEQ,"."),SEQ2=$P(SEQ,".",2)
 ..S SEQ3=$O(^TMP("XUMF MFS",$J,"PARAM","SEG",SEG,"SEQ",SEQ,"HLSCS",0))
 ..;
 ..I SEQ3 D SUBCOMP Q
 ..;
 ..S FLD=$O(^TMP("XUMF MFS",$J,"PARAM","SEG",SEG,"SEQ",SEQ,0))
 ..;
 ..I 'FLD D
 ...S FILE=^TMP("XUMF MFS",$J,"PARAM","SEG",SEG,"SEQ",SEQ,"FILE")
 ...S IENS=$G(^TMP("XUMF MFS",$J,"PARAM","IENS",SEG,SEQ))
 ...S FIELD=^TMP("XUMF MFS",$J,"PARAM","SEG",SEG,"SEQ",SEQ,"FIELD")
 ...S ZDTYP=^TMP("XUMF MFS",$J,"PARAM","SEG",SEG,"SEQ",SEQ,"DTYP")
 ...I $P(ZDTYP,U,3)[":" S FIELD=FIELD_$P(ZDTYP,U,3)
 ...S VALUE=$$GET1^DIQ(FILE,IENS,FIELD)
 ...S VALUE=$$DTYP^XUMFP(VALUE,ZDTYP,HLCS,1)
 ..I FLD D
 ...S ZDTYP=$G(^TMP("XUMF MFS",$J,"PARAM","SEG",SEG,"SEQ",SEQ,FLD))
 ...I $P(ZDTYP,U,3)[":" S FLD=FLD_$P(ZDTYP,U,3)
 ...S VALUE=$$GET1^DIQ(IFN,IEN_",",FLD)
 ...S VALUE=$$DTYP^XUMFP(VALUE,ZDTYP,HLCS,1)
 ..;
 ..S ZZZ(SEQ)=VALUE
 .;
 .S X=0
 .F  S X=$O(ZZZ(X)) Q:'X  D
 ..S SEQ1=$P(X,"."),SEQ2=+$P(X,".",2)
 ..S XXX(SEQ1,SEQ2)=ZZZ(X)
 .K ZZZ
 .M ZZZ=XXX
 .;
 .K NODE
 .S (SEQ,SEQ0,SEQ9,SEQ1,CNT1,CNT2)=0,NODE=""
 .F  S SEQ1=$O(ZZZ(SEQ1)) Q:'SEQ1  D
 ..S SEQ2=0,VALUE=$G(ZZZ(SEQ1,SEQ2))
 ..F  S SEQ2=$O(ZZZ(SEQ1,SEQ2)) Q:'SEQ2  D
 ...S $P(VALUE,HLCS,SEQ2)=ZZZ(SEQ1,SEQ2)
 ..S NODE(CNT1)=$G(NODE(CNT1))
 ..I NODE(CNT1)'="",$L(NODE(CNT1)_VALUE)>200 D
 ...S CNT1=CNT1+1,SEQ9=SEQ0+SEQ9
 ..S SEQ=$S('CNT1:SEQ1,1:SEQ1-SEQ9)
 ..S $P(NODE(CNT1),HLFS,SEQ)=VALUE
 ..S SEQ0=SEQ-1
 .;
 .S NODE=SEG_HLFS_$G(NODE(0)) K NODE(0)
 .;
 .M ^TMP(MTYP,$J,CNT)=NODE
 .S CNT=CNT+1
 ;
 Q
 ;
SUBCOMP ; -- subcomponents
 ;
 N A,YYY
 ;
 M A=^TMP("XUMF MFS",$J,"PARAM","SEG",SEG,"SEQ",SEQ,"HLSCS")
 S YYY=""
 ;
 S SEQ3=0
 F  S SEQ3=$O(A(SEQ3)) Q:'SEQ3  D
 .S FLD=$O(A(SEQ3,0))
 .S ZDTYP=$G(A(SEQ3,FLD))
 .I $P(ZDTYP,U,3)[":" S FLD=FLD_$P(ZDTYP,U,3)
 .S VALUE=$$GET1^DIQ(IFN,IEN_",",FLD)
 .S VALUE=$$DTYP^XUMFP(VALUE,ZDTYP,HLSCS,1)
 .S $P(YYY,HLSCS,SEQ3)=VALUE
 ;
 S ZZZ(SEQ)=YYY
 ;
 Q
 ;
GROUP ; -- query group records
 ;
 Q:ERROR
 ;
 S IEN=0
 F  S IEN=$O(^TMP("XUMF MFS",$J,"PARAM","IEN",IEN)) Q:'IEN  D
 .K ^TMP("XUMF MFS",$J,"PARAM","PKV")
 .K ^TMP("XUMF MFS",$J,"PARAM","IENS")
 .S ^TMP("XUMF MFS",$J,"PARAM","PKV")=^TMP("XUMF MFS",$J,"PARAM",IEN,"PKV")
 .M ^TMP("XUMF MFS",$J,"PARAM","IENS")=^TMP("XUMF MFS",$J,"PARAM",IEN,"IENS")
 .D MFE,ZZZ
 ;
 Q
 ;
SEND ; -- send HL7 message
 ;
 I 'MFK,ERROR Q
 ;
 S HLP("PRIORITY")="I"
 ;
 I 'TYPE D GENERATE^HLMA(PROTOCOL,"GM",1,.HLRESLT,"",.HLP)
 I TYPE,(TYPE<10) D DIRECT^HLMA(PROTOCOL,"GM",1,.HLRESLT,"",.HLP)
 I (TYPE>9),$G(HLMTIENS) D
 .D GENACK^HLMA1(HL("EID"),HLMTIENS,HL("EIDS"),"GM",1,.HLRESLT)
 ;
 ; check for error
 I ($P($G(HLRESLT),U,3)'="") D  Q
 .S ERROR=1_U_$P(HLRESLT,HLFS,3)_U_$P(HLRESLT,HLFS,2)_U_$P(HLRESLT,U)
 ;
 ; successful call, message ID returned
 S ERROR="0^"_$P($G(HLRESLT),U,1)
 ;
 Q
 ;
EXIT ; -- exit
 ;
 D CLEAN^DILF
 ;
 K ^TMP("HLS",$J),^TMP("HLA",$J)
 K ^TMP("XUMF MFS",$J)
 ;
 Q
 ;
LLNK ; -- dynamic addressing BROADCAST
 ;
 Q:TYPE>9
 ;
 I $G(^TMP("XUMF MFS",$J,"PARAM","LLNK"))'="" D  Q
 .S HLL("LINKS",1)=^TMP("XUMF MFS",$J,"PARAM","LLNK")
 ;
 Q:'$$SERVER()
 ;
 Q:TYPE
 Q:'$G(^TMP("XUMF MFS",$J,"PARAM","BROADCAST"))
 ;
 N I,J,LLNK
 ;
 S (I,J)=0
 F  S I=$O(^HLCS(870,"C",I)) Q:'I  D
 .S J=$O(^HLCS(870,"C",I,0)) Q:'J
 .S LLNK=$P($G(^HLCS(870,J,0)),U)
 .S HLL("LINKS",I)="XUMF MFK^"_LLNK
 ;
 Q
 ;
SERVER() ; -- servers
 ;
 N I
 ;
 S I=$$KSP^XUPARAM("INST") Q:'I 0
 ;
 Q:I=442 1  ;BP TEST
 Q:I=12000 1  ;FORUM
 Q:I=100002 1  ;HEC
 ;
 Q 0
 ;
