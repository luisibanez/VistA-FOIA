ORIN1002 ;IHS/CIA/DKM - KIDS Inits for OR patch 1002 ;17-May-2007 15:20;DKM
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**1002**;Dec 17, 1997
 ;=================================================================
EC ;EP - Environment check
 Q
PRE ;EP - Preinit
 D RENPARAM^BEHUTIL("CIAOHSM HEALTH SUMMARY LIST","ORWRPBHS HEALTH SUMMARY LIST")
 Q
POST ;EP - Postinit
 D ADDPMT("OR GTX CLININD","LAB SERVICE","Indication:","clinical indicator",10,99)
 D ADDPMT("OR GTX CLININD2","LAB SERVICE","Indication ICD9:","clinical indicator ICD9",10.5,-1)
 D ADDPMT("OR GTX CMF","OUTPATIENT PHARMACY","Chronic Med:","chronic med",4.7,10)
 D ADDPMT("OR GTX CMF","PHARMACY DATA MANAGEMENT","Chronic Med:","chronic med",4.7,10)
 D REMPRG
 Q
 ; Add prompt to selected order and quick order dialogs
ADDPMT(PMT,PKG,LBL,DX,SEQ,OTS) ;
 N DLG,TYP,ITM,QO,X,Y
 S:PMT'=+PMT PMT=$$FIND1^DIC(101.41,,"XQ",PMT)
 S:PKG'=+PKG PKG=$$FIND1^DIC(9.4,,"XQ",PKG)
 Q:'PMT!'PKG
 S QO='OTS,TYP=$S(QO:"Q",1:"D"),ITM=0
 F DLG=0:0 S DLG=$O(^ORD(101.41,DLG)) Q:'DLG  S X=$G(^(DLG,0)) D
 .N FDA,IEN,NAM,SUB,SFN
 .Q:$P(X,U,4)'=TYP
 .S Y=$P(X,U,7)
 .I 'Y,QO D
 ..S Y=$P(X,U,5)
 ..S:Y Y=$P($G(^ORD(100.98,Y,0)),U,4)
 ..S:Y Y=$P($G(^ORD(101.41,Y,0)),U,7)
 .Q:Y'=PKG
 .S SUB=$S(QO:6,1:10),SFN=$S(QO:101.416,1:101.412)
 .Q:'$O(^ORD(101.41,DLG,SUB,"D",0))
 .S IEN=$O(^ORD(101.41,DLG,SUB,"D",PMT,0))
 .S NAM=$$GET1^DIQ(101.41,DLG,.01)
 .S FDA=$NA(FDA(SFN,$S(IEN:IEN,1:"+1")_","_DLG_","))
 .D ADDQO:QO,ADDDG:'QO
 .D UPDATE^DIE("","FDA","IEN")
 .S X=$S(IEN:IEN,1:+$G(IEN(1)))
 .S:'ITM ITM=X
 .D BMES^XPDUTL($S(IEN:"Updated ",X:"Added ",1:"Unable to add ")_DX_" prompt "_$S(IEN:"in ",1:"to ")_NAM_".")
 I 'QO,ITM D ADDPMT(PMT,PKG,LBL,DX,ITM,0)
 Q
ADDDG S @FDA@(.01)=SEQ
 S @FDA@(2)=PMT
 S @FDA@(6)=1
 S @FDA@(9)="*"
 S @FDA@(17)="S Y="""""
 S:OTS>0 @FDA@(21)=OTS
 S @FDA@(24)=LBL
 Q
ADDQO S @FDA@(.01)=SEQ
 S @FDA@(.02)=PMT
 S @FDA@(.03)=1
 Q
 ; Remove ORPF GRACE DAYS BEFORE PURGE parameter from
 ; ORP ORDER MISC parameter template
REMPRG N PAR,TPL,LP,FDA
 S PAR=$$FIND1^DIC(8989.51,,"XQ","ORPF GRACE DAYS BEFORE PURGE")
 S TPL=$$FIND1^DIC(8989.52,,"XQ","ORP ORDER MISC")
 Q:'PAR!'TPL
 F LP=0:0 S LP=$O(^XTV(8989.52,TPL,10,LP)) Q:'LP  D:$P($G(^(LP,0)),U,2)=PAR
 .S FDA(8989.521,LP_","_TPL_",",.01)="@"
 D:$D(FDA) FILE^DIE("","FDA")
 Q
