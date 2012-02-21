MAGGTU9 ;WOIFO/LB/GEK - Imaging utilities assign key
 ;;3.0;IMAGING;**8**;Sep 15, 2004
 ;; +---------------------------------------------------------------+
 ;; | Property of the US Government.                                |
 ;; | No permission to copy or redistribute this software is given. |
 ;; | Use of unreleased versions of this software requires the user |
 ;; | to execute a written test agreement with the VistA Imaging    |
 ;; | Development Office of the Department of Veterans Affairs,     |
 ;; | telephone (301) 734-0100.                                     |
 ;; |                                                               |
 ;; | The Food and Drug Administration classifies this software as  |
 ;; | a medical device.  As such, it may not be changed in any way. |
 ;; | Modifications to this software may result in an adulterated   |
 ;; | medical device under 21CFR820, the use of which is considered |
 ;; | to be a violation of US Federal Statutes.                     |
 ;; +---------------------------------------------------------------+
 ;;
 Q
EN ;Give MAGDISP CLIN key to all MAG WINDOWS option holders.
 ;   Find the menu option's IEN
 N MKEY,ERR,OPT,MAGUSER,I,KEYNM,KEYCT,KEYECT,XCT,KEYHAS
 N UCT,UTOT,OPTACC,MDOT
 S KEYNM="MAGDISP CLIN"
 S KEYCT=0 ; count of number of users that were assigned the key.
 S KEYECT=0 ; count of number of errors during the assignment.
 S KEYHAS=0 ; count of number of users that already have key.
 S OPTACC=0 ; count of users with access to MAG WINDOWS.
 S MDOT=10000 ; print '.' to screen to show progress.
 S UCT=0 ; user count. for progress
 S UTOT=$P(^VA(200,0),"^",4)
 ; 
 D MES^XPDUTL("Assigning "_KEYNM_" to all users with access to Option : "_"MAG WINDOWS")
 S OPT=$$FIND1^DIC(19,"","X","MAG WINDOWS","","","ERR")
 I OPT="" D MES^XPDUTL("ERROR ",$G(ERR("DIERR",1,"TEXT",1))) Q
 I OPT=0 D MES^XPDUTL("MAG WINDOWS wasn't found in Option File") Q
 ;   Lookup the security key
 S MKEY=$$LKUP^XPDKEY(KEYNM)
 I 'MKEY D MES^XPDUTL("ERROR "_KEYNM_" Key wasn't found") Q
 ;   Give users the Key, if they don't have it already
 D MES^XPDUTL("Checking users...")
 S I=0 F  S I=$O(^VA(200,I)) Q:'I  D
 . S UCT=UCT+1 I UCT>MDOT S MDOT=MDOT+10000 D MES^XPDUTL(UCT_" of "_UTOT_" users checked...")
 . I (($$ACCESS^XQCHK(I,OPT))>0) S OPTACC=OPTACC+1 D GIVEKEY(MKEY,KEYNM,I)
 . Q
 D MES^XPDUTL(OPTACC_" of "_UTOT_" Users have access to option MAG WINDOWS.")
 D MES^XPDUTL(KEYHAS_" Users already have Key "_KEYNM)
 D MES^XPDUTL(KEYCT_" Users were assigned key: "_KEYNM)
 D MES^XPDUTL("Assignment Complete.")
 I KEYECT>0 D MES^XPDUTL(KEYECT_" Errors during Key Assignment. See install log for details")
 Q
GIVEKEY(KEY,KEYNM,USER) ;
 ; Give KEY to USER
 N DO,D1,MFDA,Z,MIEN
 ; Quit if they already have the key
 S Z=$$FIND1^DIC(200.051,","_USER_",","",KEYNM)
 I +Z S KEYHAS=KEYHAS+1
 Q:Z  ; Already have key
 I Z="" D  Q
 . D MES^XPDUTL("ERROR Validating that user ("_USER_") has key ("_KEYNM_")")
 . S KEYECT=KEYECT+1
 ;
 S MFDA(200.051,"+1,"_USER_",",.01)=KEY
 S MFDA(200.051,"+1,"_USER_",",1)=DUZ
 S MFDA(200.051,"+1,"_USER_",",2)=DT
 S MIEN(1)=KEY_","
 D UPDATE^DIE("","MFDA","MIEN")
 I $D(DIERR) D  Q
 . D MES^XPDUTL("ERROR Assigning key ("_KEYNM_") to user ("_USER_")")
 . S KEYECT=KEYECT+1
 . D CLEAN^DILF
 . Q
 S KEYCT=KEYCT+1
 D CLEAN^DILF
 Q
FLT ;  Create a Few Public Filters as a default for sites.
 ;  Only create new public filters if file is empty.
 N DIK
 I +$P(^MAG(2005.87,0),"^",3) D  Q
 . D MES^XPDUTL("The IMAGE LIST FILTERS File is not empty,")
 . D MES^XPDUTL("  Default Public Filters were not installed.")
 . Q
 S ^MAG(2005.87,1,0)="Rad All^RAD^CLIN^^^^^^0"
 S ^MAG(2005.87,1,1)="^1^.05"
 S ^MAG(2005.87,2,0)="Clin All^^CLIN^^^^^^0"
 S ^MAG(2005.87,2,1)="^1^.05"
 S ^MAG(2005.87,3,0)="Admin All^^ADMIN^^^^^^0"
 S ^MAG(2005.87,3,1)="^1^.05"
 S ^MAG(2005.87,4,0)="Clin 2 yr^^CLIN^^^^^^-24"
 S ^MAG(2005.87,4,1)="^1^.05"
 S ^MAG(2005.87,5,0)="Admin 10-10EZ All^^ADMIN^46,^^^^^0"
 S ^MAG(2005.87,5,1)="^1^.05"
 S ^MAG(2005.87,6,0)="Adv Directives^^CLIN^67^^^^^0"
 S ^MAG(2005.87,6,1)="^1^.05"
 S ^MAG(2005.87,7,0)="All^^^^^^^^0"
 S ^MAG(2005.87,7,1)="^1^.05"
 S ^MAG(2005.87,8,0)="All 2 yr^^^^^^^^-24"
 S ^MAG(2005.87,8,1)="^1^.05"
 S ^MAG(2005.87,9,0)="All 6 mth^^^^^^^^-6"
 S ^MAG(2005.87,9,1)="^1^.05"
 ;All Advance Directives^^CLIN^67^^^^^0
 S DIK="^MAG(2005.87," D IXALL^DIK
 D MES^XPDUTL("Default Public Filters added to IMAGE LIST FILTERS File.")
 Q
