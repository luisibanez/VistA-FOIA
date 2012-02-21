ONCODXD ;Hines OIFO/RTK,GWB - INPUT TRANSFORM FOR DATE DX FIELD ;4/9/97
 ;;2.11;ONCOLOGY;**11,13,15,16,18,36**;Mar 07,1995
 ;
DTDXIT ;Check that date entered is BEFORE or EQUAL to all other DATE fields
 S DTXFLAG=1,C=0,MULT="" K LIST,SBCT,SUBR,RADT D CHKDTS
 I DTXFLAG=1 D KLL Q
 K X W !?4,"The DATE DX must be BEFORE or EQUAL TO certain date fields.  The date"
 W !?4,"you have entered is unacceptable because it is AFTER the"
 W !?4,"following date field(s):",!
 F RTK=0:0 S RTK=$O(LIST(RTK)) Q:RTK'>""  D
 .S INDT=$P(LIST(RTK),U,2) D DT
 .W !?4,EXDT," - ",$P(LIST(RTK),U,1) Q
 F RTK=0:0 S RTK=$O(SBCT(RTK)) Q:RTK'>""  D
 .S INDT=$P(SBCT(RTK),U,2) D DT
 .W !?4,EXDT," - SUBSEQUENT COURSE TREATMENT ",$P(SBCT(RTK),U,3)
 .W " - ",$P(SBCT(RTK),U,1) Q
 F RTK=0:0 S RTK=$O(SUBR(RTK)) Q:RTK'>""  D
 .S INDT=$P(SUBR(RTK),U,2) D DT
 .W !?4,EXDT," - SUBSEQUENT RECURRENCE ",$P(SUBR(RTK),U,3)
 .W " - ",$P(SUBR(RTK),U,1) Q
 F RTK=0:0 S RTK=$O(RADT(RTK)) Q:RTK'>""  D
 .S INDT=$P(RADT(RTK),U,2) D DT
 .W !?4,EXDT," - RADIATION TREATMENT ",$P(RADT(RTK),U,3)
 .W " - ",$P(RADT(RTK),U,1) Q
 W !
KLL K C,DTXFLAG,EXDT,FLD,FLDNM,INDT,LIST,MULT,NODE0,NODE1,NODE22
 K NODE3,NODE31,NODE5,NODE7,NODEBL1,NODEBL2,NODENH2,NODEST2,NODETH1
 K RADT,RADTZND,RDZ,RTK,SBCT,SBCTZND,SRZ,SUBR,SUBRZND,SZ Q
CHKDTS ; Check it against all other DATE fields
 S NODE0=$G(^ONCO(165.5,D0,0)),NODE1=$G(^ONCO(165.5,D0,1))
 S NODE3=$G(^ONCO(165.5,D0,3)),NODE31=$G(^ONCO(165.5,D0,3.1))
 S NODE5=$G(^ONCO(165.5,D0,5)),NODE7=$G(^ONCO(165.5,D0,7))
 S NODENH2=$G(^ONCO(165.5,D0,"NHL2")),NODE22=$G(^ONCO(165.5,D0,2.2))
 S NODEBL1=$G(^ONCO(165.5,D0,"BLA1")),NODEBL2=$G(^ONCO(165.5,D0,"BLA2"))
 S NODETH1=$G(^ONCO(165.5,D0,"THY1")),NODEST2=$G(^ONCO(165.5,D0,"STS2"))
 ;
 S FLD=$P(NODE1,U,10),FLDNM=$P($G(^DD(165.5,17,0)),U,1) D EDCHK
 S FLD=$P(NODE3,U,1),FLDNM=$P($G(^DD(165.5,50,0)),U,1) D EDCHK
 S FLD=$P(NODE3,U,4),FLDNM=$P($G(^DD(165.5,51,0)),U,1) D EDCHK
 S FLD=$P(NODE3,U,11),FLDNM=$P($G(^DD(165.5,53,0)),U,1) D EDCHK
 S FLD=$P(NODE3,U,14),FLDNM=$P($G(^DD(165.5,54,0)),U,1) D EDCHK
 S FLD=$P(NODE3,U,17),FLDNM=$P($G(^DD(165.5,55,0)),U,1) D EDCHK
 S FLD=$P(NODE3,U,23),FLDNM=$P($G(^DD(165.5,57,0)),U,1) D EDCHK
 S FLD=$P(NODE7,U,9),FLDNM=$P($G(^DD(165.5,64,0)),U,1) D EDCHK
 S FLD=$P(NODE5,U,1),FLDNM=$P($G(^DD(165.5,70,0)),U,1) D EDCHK
 S FLD=$P(NODE7,U,1),FLDNM=$P($G(^DD(165.5,90,0)),U,1) D EDCHK
 S FLD=$P(NODEBL1,U,24),FLDNM=$P($G(^DD(165.5,323,0)),U,1) D EDCHK
 S FLD=$P(NODEBL2,U,16),FLDNM=$P($G(^DD(165.5,361,0)),U,1) D EDCHK
 S FLD=$P(NODEBL2,U,22),FLDNM=$P($G(^DD(165.5,367,0)),U,1) D EDCHK
 S FLD=$P(NODETH1,U,36),FLDNM=$P($G(^DD(165.5,435,0)),U,1) D EDCHK
 S FLD=$P(NODEST2,U,12),FLDNM=$P($G(^DD(165.5,541,0)),U,1) D EDCHK
 S FLD=$P(NODEST2,U,38),FLDNM=$P($G(^DD(165.5,567,0)),U,1) D EDCHK
 S FLD=$P(NODENH2,U,20),FLDNM=$P($G(^DD(165.5,865,0)),U,1) D EDCHK
 F SBCT=0:0 S SBCT=$O(^ONCO(165.5,D0,4,SBCT)) Q:SBCT'>0  D
 .S SBCTZND=$G(^ONCO(165.5,D0,4,SBCT,0)),SZ=SBCTZND,MULT="SCT"
 .S FLD=$P(SZ,U,1),FLDNM=$P($G(^DD(165.51,.01,0)),U,1) D EDCHK
 .S FLD=$P(SZ,U,11),FLDNM=$P($G(^DD(165.51,.041,0)),U,1) D EDCHK
 .S FLD=$P(SZ,U,12),FLDNM=$P($G(^DD(165.51,.051,0)),U,1) D EDCHK
 .S FLD=$P(SZ,U,13),FLDNM=$P($G(^DD(165.51,.061,0)),U,1) D EDCHK
 .S FLD=$P(SZ,U,14),FLDNM=$P($G(^DD(165.51,.071,0)),U,1) D EDCHK
 .S FLD=$P(SZ,U,15),FLDNM=$P($G(^DD(165.51,.081,0)),U,1) D EDCHK
 .S FLD=$P(SZ,U,16),FLDNM=$P($G(^DD(165.51,.091,0)),U,1) D EDCHK
 F SUBR=0:0 S SUBR=$O(^ONCO(165.5,D0,23,SUBR)) Q:SUBR'>0  D
 .S SUBRZND=$G(^ONCO(165.5,D0,23,SUBR,0)),SRZ=SUBRZND,MULT="SR"
 .S FLD=$P(SRZ,U,1),FLDNM=$P($G(^DD(165.572,.01,0)),U,1) D EDCHK
 Q
 ;
EDCHK ; If its a legitimate date check it against the date entered for DT DX
 ; If its a partial date (no month or no day) just check year or year/mo
 I FLD=""!(FLD="0000000")!(FLD=9999999) Q
 I $E(FLD,4,7)="0000" D  Q  ;no DAY or MONTH
 .I $E(X,1,3)>$E(FLD,1,3) D ERRDATE Q
 I $E(FLD,6,7)="00" D  Q  ;MONTH but no DAY
 .I $E(X,1,5)>$E(FLD,1,5) D ERRDATE Q
 I X>FLD D ERRDATE Q
 Q
 ;
ERRDATE ; Set DTXFLAG=0 and add FLDNM to the LIST of fields it must be before
 S DTXFLAG=0,C=C+1
 I MULT="SCT" S SBCT(C)=FLDNM_U_FLD_U_SBCT Q
 I MULT="SR" S SUBR(C)=FLDNM_U_FLD_U_SUBR Q
 I MULT="RDT" S RADT(C)=FLDNM_U_FLD_U_RADT Q
 S LIST(C)=FLDNM_U_FLD
 Q
 ;
DT ; CHANGE INTERNAL DATE TO EXTERNAL DATE FORMAT
 S EXDT=$E(INDT,4,5)_"/"_$E(INDT,6,7)_"/"_($E(INDT,1,3)+1700)
 Q
