APSQCK2 ;IHS ASDS/ENM/POC - CONTINUE FROM APSQCK 
 ;;6.0;IHS PHARMACY MODIFICATIONS;**3**;FEB 20, 2001
 ;
 ;POST INIT FROM POST^APSQBEG
 ;DOUBT IF THIS ROUTINE IS NEEDED SINCE DOING A KIDS INSTALL
POST ;EP POST INIT TO DO
 S MENU="APSQ NF MENU"
 S X=$$ADD^XPDMENU("PSO MANAGER",MENU,"NON")
 I X W !,MENU_" ADDED TO MENU"
 E  W !,MENU_" MENU NOT ADDED"
 D FREST
 Q
FSAVE ;MY USE TO MAKE FILEGRAMS 
 D ^XBKSET
 S DIC(0)="XMQ"
 S DIC="^DIPT("
 S X="MAIL GROUP"
 D ^DIC
 I Y<1 W !,"YOU HAVE NO PRINT TEMPLATE NAMED "_X_".  MAKE IT!" G KKILL
 K DIC
 S SAVDIFGT=+Y
 ;S COM="APSQ NF "
 ;F I=COM_"APPROVING PROVIDER",COM_"PHARMACIST",COM_"PT REVIEW",COM_"REQUESTING PROVIDER" D
 ;F I=1:1 S TEXT=$P($T(STUFF+I),";;",2) Q:TEXT="END"  D  
 F II=1:1 S TEXT=$P($T(STUFF+II),";;",2) Q:TEXT="END"  D
 .S X=$P(TEXT,",",1)
 .S DIC(0)="MQX",DIC="^XMB(3.8,"
 .D ^DIC
 .I Y>0 D
 ..S DIFGT=SAVDIFGT
 ..S DIFG("FE")=+Y
 ..S DIFG("FUNC")="A"
 ..S DIFG("FGR")="^APSQ("""_$P(TEXT,",",1)_""","
 ..D EN^DIFGG
 ..K DIFG
 Q
KKILL ;KILL STUFF
 K DIC,X,II
 Q
FREST ;RESTORE FILEGRAMS
 I '$D(^APSQ) W !,"WHERE IS THE GLOBAL ^APSQ???" G KKILL
 D ^XBKSET
 ;S COM="^APSQ(""APSQ NF "
 ;F I=COM_"APPROVING PROVIDER"",",COM_"PHARMACIST"",",COM_"PT REVIEW"",",COM_"REQUESTING PROVIDER""," D
 F II=1:1 S TEXT=$P($T(STUFF+II),";;",2) Q:TEXT="END"  D
 .S DIFGLO="^APSQ("""_$P(TEXT,",",1)_""","
 .S DIADD=1
 .D ^DIFG
 .W !,"MAIL GROUP "_$P(TEXT,",",1)_" WAS "_$S($D(DIFGER):"NOT",1:"")_"ADDED."
 .K DIFGER
 .Q
 ;ADD THE RIGHT MAIL GROUPS TO BULLETINS 
 F II=1:1 S TEXT=$P($T(STUFF+II),";;",2) Q:TEXT="END"  D
 .S DIC="^XMB(3.6,",DIC(0)="XMQ",X=$P(TEXT,",",2)
 .D ^DIC
 .S IEN=+Y
 .S DIC(0)="LMQX"
 .S DA(1)=IEN
 .S DIC("P")=$P(^DD(3.6,4,0),"^",2)
 .S DIC=DIC_IEN_",2,",X=$P(TEXT,",",1)
 .D ^DIC
 .K DIC,DA
 .Q
 D KKILL
 Q
STUFF ;MAIL GROUP,BULLETIN   
 ;;APSQ NF APPROVING PROVIDER,APSQ NF APPROVING BULLETIN
 ;;APSQ NF PHARMACIST,APSQ NF PHARMACIST BULLETIN
 ;;APSQ NF PT REVIEW,APSQ NF PT BULLETIN
 ;;APSQ NF REQUESTING PROVIDER,APSQ NF REQUESTING BULLETIN
 ;;END