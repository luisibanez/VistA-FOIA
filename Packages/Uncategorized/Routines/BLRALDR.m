BLRALDR ;DAOU/ALA-Lab Review Delinquent Report 
 ;;5.2T9;LR;**1013,1015,1018**;Nov 17, 2004
 ;;5.2;LR;**1013,1015**;Nov 18, 2002
 ;
 ;**Program Description**
 ;  This routine builds a ListMan screen of all delinquent lab
 ;  results based upon a supervisor's subordinates and the
 ;  supervisor's normal and abnormal review days defined
 ;
CSUP ;  Check for all subordinates of a Clinician Supervisor
 K ^TMP("BLRADELQ",$J)
 ;
 ;  Get the Normal and Abnormal review days
 S BLRANRN=$$GET1^DIQ(9009027.1,DUZ,.04,"E")
 S BLRAARN=$$GET1^DIQ(9009027.1,DUZ,.05,"E")
 S BLRACRN=$$GET1^DIQ(9009027.1,DUZ,.06,"E")
 ;
 S BLRADUZ=""
 F  S BLRADUZ=$O(^BLRALAB(9009027.1,"C",DUZ,BLRADUZ)) Q:BLRADUZ=""  D FND
 ;
 D EN^BLRAL3
 ;
 K BLRA0,BLRAAB,BLRAARN,BLRACCN,BLRADATA,BLRADLT,BLRADTT,BLRADUZ,BLRADT
 K BLRANRN,BLRAOPH,BLRAP,BLRAPD,BLRAPFL,BLRAPIEN,BLRAPNM,BLRAS,BLRACRT
 K BLRASTAT,BLRIDT,BLRSS,BLRVD,^TMP("BLRADELQ",$J),BLRACRN,BLRADAYS
 K BLRALINE,BLRALVAR,BLRAOPNM,BLRAPHY,BLRARPHY,BLRARPNM,BLRASTA,BLRAVD
 K BLRAVT,DATE
 Q
 ;
FND ;  Find results
 S BLRAS=""
 F  S BLRAS=$O(^LR("BLRA",BLRADUZ,BLRAS)) Q:BLRAS=2!(BLRAS="")  D
 . S BLRVD=""
 . F  S BLRVD=$O(^LR("BLRA",BLRADUZ,BLRAS,BLRVD)) Q:BLRVD=""  D
 .. S BLRAP=""
 .. F  S BLRAP=$O(^LR("BLRA",BLRADUZ,BLRAS,BLRVD,BLRAP)) Q:BLRAP=""  D
 ... ;S BLRIDT=$P(BLRVD,"-",2),BLRSS=$G(^LR("BLRA",BLRADUZ,BLRAS,BLRVD,BLRAP))
 ... ;----- BEGIN IHS MODIFICATIONS LR*5.2*1018
 ... ;ADDED BLRSS AS SUBSCRIPT
 ... S BLRSS=""
 ... F  S BLRSS=$O(^LR("BLRA",BLRADUZ,BLRAS,BLRVD,BLRAP,BLRSS)) Q:BLRSS=""  D
 .... S BLRIDT=$P(BLRVD,"-",2)
 .... ;----- END IHS MODIFICATIONS
 .... S BLRA0=$G(^LR(BLRAP,BLRSS,BLRIDT,0))
 .... S BLRADATA=$G(^LR(BLRAP,BLRSS,BLRIDT,9009027))
 .... Q:$G(BLRADATA)=""  ;IF NOT THERE ITS BEEN DELETED
 .... ;
 .... S BLRAAB=$P(BLRADATA,U,6),BLRAPD=$P(BLRADATA,U,7),BLRACRT=+$P(BLRADATA,U,8)
 .... ;
 .... ;  If any pending results, don't put on the delinquent report
 .... I BLRAPD Q
 .... S BLRARPHY=$P(BLRADATA,U,2)
 .... S BLRARPNM=$P($G(^VA(200,BLRARPHY,0)),U)
 .... ;
 .... S BLRADTT=$P(BLRA0,U,1),BLRAOPH=$P(BLRA0,U,$S(BLRSS="MI":7,1:10))
 .... S BLRACCN=$P(BLRA0,U,6),BLRAOPNM=$P($G(^VA(200,BLRAOPH,0)),U)
 .... S BLRAPFL=$P($G(^LR(BLRAP,0)),U,2),BLRAPIEN=$P($G(^(0)),U,3)
 .... S BLRAPNM=$$GET1^DIQ(BLRAPFL,BLRAPIEN,.01,"E")
 .... ;
 .... S BLRASTAT=$S(BLRACRT'=0:"CRIT",BLRAAB'=0:"ABN",1:"NOR")
 .... S BLRASTA=$S(BLRASTAT="CRIT":"AAC",1:BLRASTAT)
 .... ;
 .... S BLRADLT=$$FMADD^XLFDT(BLRADTT\1,$S(BLRASTAT="ABN":BLRAARN,BLRASTAT="CRIT":BLRACRN,1:BLRANRN))
 .... I DT'>BLRADLT Q
 .... ;
 .... S BLRADAYS=$$FMDIFF^XLFDT(DT,BLRADLT,1)
 .... ;
 .... S BLRAVT=$P(BLRADTT,".",2),BLRAVT=BLRAVT_$E("000000",$L(BLRAVT),7)
 .... S BLRAVD=$P(BLRADTT,".",1)_"."_BLRAVT
 .... ;S ^TMP("BLRADELQ",$J,BLRARPNM,BLRASTA,BLRAVD,BLRAP)=BLRACCN_U_BLRAPNM_U_(BLRADTT\1)_U_BLRAOPNM_U_BLRASTAT_U_BLRADAYS
 .... ;----- BEGIN IHS MODIFICATIONS LR*5.2*1018
 .... S ^TMP("BLRADELQ",$J,BLRARPNM,BLRASTA,BLRAVD,BLRAP,BLRSS)=BLRACCN_U_BLRAPNM_U_(BLRADTT\1)_U_BLRAOPNM_U_BLRASTAT_U_BLRADAYS
 .... ;----- END IHS MODIFICATIONS
 .... ;S ^TMP("BLRADELQ",$J,BLRARPNM,BLRASTA,BLRAVD,BLRAP,"ZNODE")=BLRAP_U_BLRSS_U_BLRIDT
 Q
