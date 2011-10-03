EC725U47 ;ALB/GTS/JAP/GT - EC National Procedure Update; 06/05/2007
 ;;2.0; EVENT CAPTURE ;**93**;8 May 96;Build 1
 ;
 ;this routine is used as a post-init in KIDS build 
 ;to modify the the EC National Procedure file #725
 ;
INACT ;* inactivate national procedures
 ;
 ;  ECXX is in format:
 ;   NATIONAL NUMBER^INACTIVATION DATE^FIRST NATIONAL NUMBER SEQUENCE^
 ;   LAST NATIONAL NUMBER SEQUENCE
 ;
 N ECX,ECXX,ECEXDT,ECINDT,ECDA,DIC,DIE,DA,DR,X,Y,%DT,ECBEG,ECEND,ECADD
 N ECSEQ,CODE,CODX
 D MES^XPDUTL(" ")
 D BMES^XPDUTL("Inactivating procedures EC NATIONAL PROCEDURE File (#725)...")
 D MES^XPDUTL(" ")
 F ECX=1:1 K DD,DO,DA S ECXX=$P($T(OLD+ECX),";;",2) Q:ECXX="QUIT"  D
 .S ECEXDT=$P(ECXX,U,2),X=ECEXDT,%DT="X" D ^%DT S ECINDT=$P(Y,".",1)
 .S CODE=$P(ECXX,U),ECBEG=$P(ECXX,U,3),ECEND=$P(ECXX,U,4),CODX=CODE
 .I ECBEG="" D UPINACT Q
 .F ECSEQ=ECBEG:1:ECEND D
 ..S ECADD="000"_ECSEQ,ECADD=$E(ECADD,$L(ECADD)-2,$L(ECADD))
 ..S CODE=CODX_ECADD
 ..D UPINACT
 Q
UPINACT ;Update codes as inactive
 ;
 S ECDA=+$O(^EC(725,"D",CODE,0))
 I $D(^EC(725,ECDA,0)) D
 .S DA=ECDA,DR="2////^S X=ECINDT",DIE="^EC(725," D ^DIE
 .D MES^XPDUTL(" ")
 .D BMES^XPDUTL("   "_CODE_" inactivated as of "_ECEXDT_".")
 Q
 ;
OLD ;national procedures to be inactivated - national code #^inact. date
 ;;CH001^10/01/07
 ;;CH002^10/01/07
 ;;CH003^10/01/07
 ;;CH004^10/01/07
 ;;CH005^10/01/07
 ;;CH006^10/01/07
 ;;CH007^10/01/07
 ;;CH008^10/01/07
 ;;CH009^10/01/07
 ;;CH010^10/01/07
 ;;CH011^10/01/07
 ;;CH012^10/01/07
 ;;CH013^10/01/07
 ;;CH014^10/01/07
 ;;CH015^10/01/07
 ;;CH017^10/01/07
 ;;CH018^10/01/07
 ;;CH019^10/01/07
 ;;CH020^10/01/07
 ;;CH021^10/01/07
 ;;CH022^10/01/07
 ;;CH023^10/01/07
 ;;CH024^10/01/07
 ;;CH025^10/01/07
 ;;CH026^10/01/07
 ;;CH027^10/01/07
 ;;CH028^10/01/07
 ;;CH029^10/01/07
 ;;CH030^10/01/07
 ;;CH031^10/01/07
 ;;CH032^10/01/07
 ;;CH033^10/01/07
 ;;CH034^10/01/07
 ;;CH035^10/01/07
 ;;CH036^10/01/07
 ;;CH037^10/01/07
 ;;CH038^10/01/07
 ;;CH039^10/01/07
 ;;CH040^10/01/07
 ;;CH041^10/01/07
 ;;CH042^10/01/07
 ;;CH043^10/01/07
 ;;CH044^10/01/07
 ;;CH045^10/01/07
 ;;CH046^10/01/07
 ;;CH047^10/01/07
 ;;CH048^10/01/07
 ;;CH049^10/01/07
 ;;CH050^10/01/07
 ;;CH051^10/01/07
 ;;CH052^10/01/07
 ;;CH053^10/01/07
 ;;CH054^10/01/07
 ;;CH055^10/01/07
 ;;CH056^10/01/07
 ;;CH057^10/01/07
 ;;CH058^10/01/07
 ;;CH059^10/01/07
 ;;CH060^10/01/07
 ;;CH061^10/01/07
 ;;CH062^10/01/07
 ;;CH063^10/01/07
 ;;CH064^10/01/07
 ;;CH065^10/01/07
 ;;CH066^10/01/07
 ;;CH067^10/01/07
 ;;CH068^10/01/07
 ;;CH069^10/01/07
 ;;CH070^10/01/07
 ;;CH071^10/01/07
 ;;CH073^10/01/07
 ;;CH074^10/01/07
 ;;CH075^10/01/07
 ;;CH076^10/01/07
 ;;CH077^10/01/07
 ;;CH078^10/01/07
 ;;CH079^10/01/07
 ;;CH080^10/01/07
 ;;CH081^10/01/07
 ;;CH082^10/01/07
 ;;CH083^10/01/07
 ;;CH084^10/01/07
 ;;CH088^10/01/07
 ;;CH089^10/01/07
 ;;CH090^10/01/07
 ;;CH091^10/01/07
 ;;CH092^10/01/07
 ;;CH093^10/01/07
 ;;CH094^10/01/07
 ;;CH095^10/01/07
 ;;QUIT
 ;
REACT ;* reactivate national procedures
 ;
 ;  ECXX is in format:
 ;   NATIONAL NUMBER^DATE (FUTURE)^FIRST NATIONAL NUMBER SEQUENCE^
 ;   LAST NATIONAL NUMBER SEQUENCE
 ;
 N ECX,ECXX,ECEXDT,ECINDT,ECDA,DIC,DIE,DA,DR,X,Y,%DT,ECBEG,ECEND,ECADD
 N ECSEQ,CODE,CODX,ECDES
 D MES^XPDUTL(" ")
 D BMES^XPDUTL("Reactivating procedures EC NATIONAL PROCEDURE File (#725)...")
 D MES^XPDUTL(" ")
 F ECX=1:1 K DD,DO,DA S ECXX=$P($T(ACT+ECX),";;",2) Q:ECXX="QUIT"  D
 .S ECDES=$P(ECXX,U,5)
 .S CODE=$P(ECXX,U),ECBEG=$P(ECXX,U,3),ECEND=$P(ECXX,U,4),CODX=CODE
 .I ECBEG="" D UPREACT Q
 .F ECSEQ=ECBEG:1:ECEND D
 ..S ECADD="000"_ECSEQ,ECADD=$E(ECADD,$L(ECADD)-2,$L(ECADD))
 ..S CODE=CODX_ECADD
 ..D UPREACT
 Q
UPREACT ;Update codes as reactive
 ;
 S ECDA=+$O(^EC(725,"D",CODE,0))
 I $D(^EC(725,ECDA,0)) D
 .S DA=ECDA,DR="2///@",DIE="^EC(725," D ^DIE
 .D BMES^XPDUTL("   "_CODE_" "_ECDES_" reactivated.")
 Q
 ;
ACT ;national procedures to be reactivated - national number^date
 ;;QUIT
 ;
CPTCHG ;* change cpt codes
 ;
 ;  ECXX is in format:
 ;  NATIONAL NUMBER^NEW CPT^FIRST NATIONAL NUMBER SEQUENCE^LAST NATIONAL
 ;  NUMBER SEQUENCE
 ;
 N ECX,ECXX,CPT,DIC,DIE,DA,DR,X,Y,ECBEG,ECEND,ECADD,NAME,ECSEQ,STR,CPTIEN
 D MES^XPDUTL(" ")
 D BMES^XPDUTL("Changing CPT Codes in EC NATIONAL PROCEDURE file (#725)")
 D MES^XPDUTL(" ")
 F ECX=1:1 S ECXX=$P($T(CPT+ECX),";;",2) Q:ECXX="QUIT"  D
 .S ECBEG=$P(ECXX,U,3),ECEND=$P(ECXX,U,4),CPTIEN=$P(ECXX,U,2)
 .S CPTIEN=$S(CPTIEN="":"@",1:$$FIND1^DIC(81,"","X",CPTIEN))
 .I CPTIEN'="@",+CPTIEN<1 D  Q
 ..S STR=$P(ECXX,U)_":  CPT code "_$P(ECXX,U,2)_" is invalid."
 ..D MES^XPDUTL(" ")
 ..D BMES^XPDUTL("   "_STR)
 .I ECBEG="" S CPT($P(ECXX,U))=CPTIEN_U_$P(ECXX,U,2) Q
 .F ECSEQ=ECBEG:1:ECEND D
 ..S ECADD="000"_ECSEQ,ECADD=$E(ECADD,$L(ECADD)-2,$L(ECADD))
 ..S CPT($P(ECXX,U)_ECADD)=CPTIEN_U_$P(ECXX,U,2)
 S ECXX=""
 F  S ECXX=$O(CPT(ECXX)) Q:ECXX=""  D
 .S ECX=$O(^EC(725,"D",ECXX,0))
 .Q:+ECX=0
 .I '$D(^EC(725,ECX,0))!(+ECX=0) D  Q
 ..D MES^XPDUTL(" ")
 ..D BMES^XPDUTL("   Can't find entry for "_ECXX_",CPT cde not updated.")
 .S CPT=$P(CPT(ECXX),U),DA=ECX,DR="4////"_CPT,DIE="^EC(725," D ^DIE
 .D MES^XPDUTL(" ")
 .S STR="   Entry #"_ECX_" for "_ECXX
 .D BMES^XPDUTL(STR_" updated to use CPT code "_$P(CPT(ECXX),U,2))
 Q
 ;
CPT ;cpt codes to be changed - national #^new CPT code
 ;;QUIT