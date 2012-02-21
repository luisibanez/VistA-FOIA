SROATCM2 ;BIR/MAM - CREATE MESSAGES ; [ 04/12/04  2:14 PM ] 
 ;;3.0; Surgery ;**27,38,90,93,125**;24 Jun 93
 S SHEMP=3,SRAMNUM=0 F I=0:0 S SRAMNUM=$O(^TMP("SRA",$J,SRAMNUM)) Q:'SRAMNUM  D MSG
STATUS ; update status
 S (SRAMNUM,SRASS)=0
 F I=0:0 S SRAMNUM=$O(^TMP("SRA",$J,SRAMNUM)) Q:'SRAMNUM  S SRACNT=0 F I=0:0 S SRACNT=$O(^TMP("SRA",$J,SRAMNUM,SRACNT)) Q:'SRACNT  S CURLEY=$E(^TMP("SRA",$J,SRAMNUM,SRACNT,0),13,14) I +CURLEY=1 D UPDATE
 I 'SRASS G END
 S XMSUB="CARDIAC ASSESSMENT TRANSMISSION COMPLETE",XMDUZ="RISK ASSESSMENT SCNR"
 S XMY("G.RISK ASSESSMENT@"_^XMB("NETNAME"))=""
 D NOW^%DTC S Y=% D D^DIQ S SRATIME=$E($P(Y,"@",2),1,5)
 S ^TMP("SRAMSG",$J,1,0)="The Cardiac Surgery Risk Assessment Transmission was completed at "_SRATIME_".",^TMP("SRAMSG",$J,2,0)="A total of "_SRASS_$S(SRASS=1:" assessment was sent.",1:" assessments were sent.")
 S ^TMP("SRAMSG",$J,3,0)="  "
 S XMTEXT="^TMP(""SRAMSG"",$J," N I D ^XMD
END K ^TMP("SRA",$J),^TMP("SRAMSG",$J) D ^SRSKILL
 Q
MSG ; send message to G.CARDIAC RISK ASSESSMENTS at Denver
 S ISC=0,NAME=$G(^XMB("NETNAME")) I NAME["FORUM"!(NAME["ISC-")!($E(NAME,1,3)="ISC")!(NAME["ISC.")!(NAME["TST")!(NAME["FO-") S ISC=1
 I ISC S XMY("G.RISK ASSESSMENT@"_^XMB("NETNAME"))=""
 I 'ISC S (XMY("G.CARDIAC RISK ASSESSMENTS@DENVER.VA.GOV"),XMY("G.SRCARDIAC@ISC-CHICAGO.VA.GOV"))=""
 S SRATDATE=$E(DT,4,5)_"/"_$E(DT,6,7)_"/"_$E(DT,2,3)
 S XMSUB=$P($$SITE^SROVAR,"^",2)_": ASSESSMENTS ("_SRAMNUM_" OF "_SRATOTM_")  "_SRATDATE,XMDUZ="RISK ASSESSMENT SCNR",XMTEXT="^TMP(""SRA"",$J,"_SRAMNUM_"," N I D ^XMD
 Q
UPDATE ; change status to 'T'
 S MM=$E(^TMP("SRA",$J,SRAMNUM,SRACNT,0),5,11) F X=1:1 S EMILY=$P(MM," ",X) Q:EMILY
 N I D NOW^%DTC S SRNOW=$E(%,1,7)
 K DR S DA=EMILY,DR="260////"_SRNOW_";235///T",DIE=130 N I D ^DIE
 S SRASS=SRASS+1
 S DFN=$P(^SRF(EMILY,0),"^") D DEM^VADPT S SRANAME=$P(VADM(1),"^") K VADM S X=$P(^SRF(EMILY,0),"^",9),SRADT=$E(X,4,5)_"/"_$E(X,6,7)_"/"_$E(X,2,3)
 S SHEMP=SHEMP+1,^TMP("SRAMSG",$J,SHEMP,0)="ASSESSMENT: "_EMILY_"   "_$J(SRANAME,20)_"        OPERATION DATE: "_SRADT
 Q
