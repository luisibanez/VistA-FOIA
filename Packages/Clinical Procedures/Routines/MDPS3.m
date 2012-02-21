MDPS3 ; HOIFO/NCA - Remote Data View Data Retriever for CP ;4/29/04  10:50
 ;;1.0;CLINICAL PROCEDURES;**2**;Apr 01, 2004
 ; Integration Agreements:
 ; Reference IA# 2693 [Subscription] TIU Extractions.
 ;               3067 [Private] Read fields in Consult file (#123) w/FM
 ;               10104 [Supported] Routine XLFSTR calls.
 ;
GET702(MDGLO,MDDFN,MDC,MDSDT,MDEDT,MDMAX) ; Gather the new 702 entries
 N MDARR,MDCON,MDDTE,MDLP,MDCODE,MDPROC,MDSTAT,MDX
 S MDLP="" F  S MDLP=$O(^MDD(702,"B",MDDFN,MDLP)) Q:MDLP<1  D
 .S MDX=$G(^MDD(702,MDLP,0)) Q:$P(MDX,"^",9)'=3
 .S MDPROC=$$GET1^DIQ(702,MDLP_",",.04,"E") Q:MDPROC=""
 .Q:'$P(MDX,U,6)
 .K ^TMP("MDTIUST",$J) S MDTIUER=""
 .D EXTRACT^TIULQ($P(MDX,U,6),"^TMP(""MDTIUST"",$J)",MDTIUER,".01;.05;70201;70202") Q:+MDTIUER
 .S MDCODE=$G(^TMP("MDTIUST",$J,$P(MDX,U,6),70201,"E"))
 .S:MDCODE'="" MDCODE=$$UP^XLFSTR(MDCODE)
 .I $G(MDC)'="" Q:MDCODE'=$G(MDC)
 .S MDDTE=$G(^TMP("MDTIUST",$J,$P(MDX,U,6),70202,"I"))
 .S MDSTAT=$G(^TMP("MDTIUST",$J,$P(MDX,U,6),.05,"E"))
 .S:'MDDTE MDDTE=$$GET1^DIQ(702,MDLP_",",.02,"I")
 .K ^TMP("MDTIUST",$J)
 .S MDCON=$P(MDX,U,5) Q:'MDCON
 .I +$G(MDSDT) Q:MDDTE<+$G(MDSDT)
 .I +$G(MDEDT) Q:MDDTE>+$G(MDEDT)
 .I MDCON D  Q:MDSTAT'="COMPLETE"
 ..S MDSTAT=$$GET1^DIQ(123,MDCON_",",8,"E")
 ..I MDSTAT="" S MDSTAT=$$GET1^DIQ(123,MDCON_",",8,"I") S:+MDSTAT MDSTAT=$$GET1^DIQ(100.01,MDSTAT_",",.01,"E")
 ..Q
 .S Y=MDDTE X ^DD("DD") N MDREV S MDREV=(9999999.9999-MDDTE)
 .I MDCON Q:$G(MDARR(MDCON))'=""  S MDARR(MDCON)=MDCON
 .S:$G(^TMP("MDPLST",$J,MDPROC,MDREV_"^"_MDLP))="" ^(MDREV_"^"_MDLP)=MDPROC_"^"_MDLP_"^"_"PR702"_"^"_"MDPS1"_"^^"_Y_"^"_MDCODE_"^^^^"_MDPROC_"^^"_MDCON
 .Q
 K MDARR
 Q
PRO(RESULT) ;  Function to return info on single proceedure.
 ;
 ; RESULT = variable pointer to a medicine file
 ;          (e.g. "12;MCAR(691.5,") (required)
 N MDVAL,LL,S3,S4,S5
 S S3=+RESULT,S4=$P(RESULT,";",2),S4=$P(S4,",")
 I S4="MCAR(702.7" Q ""
 I S4="MCAR(699" S LL=$P($G(^MCAR(699,+S3,0)),U,12),MDVAL=$P($G(^MCAR(697.2,+LL,0)),U) Q MDVAL
 I S4="MCAR(699.5" S LL=$P($G(^MCAR(699.5,+S3,0)),U,6),MDVAL=$P($G(^MCAR(697.2,+LL,0)),U) Q MDVAL
 I S4="MCAR(694" S LL=$P($G(^MCAR(699.5,+S3,0)),U,6),MDVAL=$P($G(^MCAR(697.2,+LL,0)),U) Q MDVAL
 S LL=$O(^MCAR(697.2,"C",S4,0)),MDVAL=$P(^MCAR(697.2,LL,0),U)
 Q MDVAL
HDR ; Print Header for Report Form Feed
 N FFL,MDNM,MDNAME,MDTITL S $P(FFL,"-",80)=""
 S MDNM=$QS(MDREC,4),MDNAME=$O(^MCAR(697.2,"B",MDNM,0))
 I MDNAME S MDTITL=$P($G(^MCAR(697.2,+MDNAME,0)),"^",8)
 I $G(MDTITL)="" S MDNAME=$O(^MDS(702.01,"B",MDNM,0)) S:MDNAME MDTITL=$P($G(^MDS(702.01,+MDNAME,0)),U)
 W !!
 S MDRPG=MDRPG+1 W !,"Pg. "_MDRPG_$J(" ",25)_$$HOSP^MDPS2(DFN)
 I $G(MDTITL)'="" W !,$J(" ",25)_MDTITL
 W !,$$DEMO^MDPS2(DFN)
 W !,FFL
 Q
