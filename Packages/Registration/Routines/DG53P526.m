DG53P526 ;BAY/JAT - ADD RESOURCE DEVICE ; 6/3/03 3:26pm
 ;;5.3;Registration;**526**;AUG 13,1993 
EN ; pre-init
 N DIC,DGLOC,DGNAME,DGI,DGSLOTS,DGTYP,DGSUBTYP,X
 D BMES^XPDUTL(">>>Adding Resource Device")
 S DIC=3.5
 S DIC(0)="L"
 S DGLOC="DG field editing protocol"
 S (DGNAME,DGI)="DG FIELD MONITOR"
 S DGSLOTS=9
 S DGTYP="RESOURCES"
 S DGSUBTYP="P-OTHER"
 S DIC("DR")=".02///"_DGLOC_";1///"_DGNAME_";2///"_DGTYP_";3///"_DGSUBTYP_";35///"_DGSLOTS
 S X=DGNAME
 I +$O(^%ZIS(1,"B",X,0)) Q
 K DO D FILE^DICN
 I Y=-1 Q
 D BMES^XPDUTL(">>>DG FIELD MONITOR device added")
 Q