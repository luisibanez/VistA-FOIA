BSDX22 ; IHS/OIT/HMW/MSC/SAT - WINDOWS SCHEDULING RPCS ;
 ;;3.0;IHS WINDOWS SCHEDULING;;DEC 09, 2010
 ;
 ;
DELAGID(BSDXY,BSDXIEN,BSDXIEN1) ;EP
 ;Entry point for debugging
 ;
 ;D DEBUG^%Serenji("DELAGI^BSDX22(.BSDXY,BSDXIEN,BSDXIEN1)")
 Q
 ;
DELAGI(BSDXY,BSDXIEN,BSDXIEN1) ;EP
 ;Deletes entry having Access Group BSDXIEN and Access Type BSDXIEN1 the ACCESS GROUP TYPE file
 ;Return recordset containing error message or "" if no error
 ;Called by BSDX DELETE ACCESS GROUP ITEM
 ;Test Line:
 ;D DELAGI^BSDX22(.RES,99)
 ;
 S X="ERROR^BSDX22",@^%ZOSF("TRAP")
 N BSDXI,DIK,DA,BSDXIEN2
 S BSDXI=0
 S BSDXY="^BSDXTMP("_$J_")"
 S ^BSDXTMP($J,0)="I00020ACCESSGROUPTYPEID^T00030ERRORTEXT"_$C(30)
 I '+BSDXIEN D ERR(0,"BSDX22: Invalid null Access Group ID") Q
 I '+BSDXIEN1 D ERR(0,"BSDX22: Invalid null Access Type ID") Q
 I '$D(^BSDXAGTP("AC",BSDXIEN,BSDXIEN1)) D  Q
 . D ERR(0,"BSDX22: Invalid null Access Group Type ID")
 . Q
 S BSDXIEN2=$O(^BSDXAGTP("AC",BSDXIEN,BSDXIEN1,0))
 I '+BSDXIEN2 D ERR(0,"BSDX22: Invalid null Access Group Type ID") Q
 ;
 ;Delete entry
 S DIK="^BSDXAGTP("
 S DA=BSDXIEN2
 D ^DIK
 ;
 S BSDXI=BSDXI+1
 S ^BSDXTMP($J,BSDXI)=BSDXIEN2_"^"_"-1"_$C(30)_$C(31)
 Q
 ;
ADDAGID(BSDXY,BSDXIEN,BSDXIEN1) ;EP
 ;Entry point for debugging
 ;
 ;D DEBUG^%Serenji("ADDAGI^BSDX22(.BSDXY,BSDXIEN,BSDXIEN1)")
 Q
 ;
ADDAGI(BSDXY,BSDXIEN,BSDXIEN1) ;EP
 ;Adds ACCESS GROUP TYPE file entry having access group BSDXIEN and access type BSDXIEN1
 ;Return recordset containing added entry number error message or "" if no error
 ;Called by BSDX ADD ACCESS GROUP ITEM
 ;Test Line:
 ;D ADDAGI^BSDX22(.RES,1,1)
 ;
 S X="ERROR^BSDX22",@^%ZOSF("TRAP")
 N BSDXI,BSDXIENS,BSDXMSG,BSDXFDA
 S BSDXI=0
 S BSDXY="^BSDXTMP("_$J_")"
 ;S ^BSDXTMP($J,0)="I00020ACCESSGROUPTYPEID^I00020ERRORID"_$C(30)
 S ^BSDXTMP($J,0)="I00020ACCESSGROUPTYPEID^T00030ERRORTEXT"_$C(30)
 I '+BSDXIEN D ERR(0,"BSDX22: Invalid null Access Group ID") Q
 I '+BSDXIEN1 D ERR(0,"BSDX22: Invalid null Access Type ID") Q
 I '$D(^BSDXAGP(BSDXIEN,0)) D ERR(0,"BSDX22: Invalid Access Group ID") Q
 I '$D(^BSDXTYPE(BSDXIEN1,0)) D ERR(0,"BSDX22: Invalid Access Type ID") Q
 I $D(^BSDXAGTP("AC",BSDXIEN,BSDXIEN1)) D  Q
 . S BSDXIENS=$O(^BSDXAGTP("AC",BSDXIEN,BSDXIEN1,0))
 . S ^BSDXTMP($J,BSDXI+1)=+BSDXIENS_"^"_$C(30)_$C(31)
 . Q
 ;
 S BSDXIENS="+1,"
 S BSDXFDA(9002018.39,BSDXIENS,.01)=BSDXIEN ;ACCESS GROUP ID
 S BSDXFDA(9002018.39,BSDXIENS,.02)=BSDXIEN1 ;ACCESS TYPE ID
 K BSDXIEN
 D UPDATE^DIE("","BSDXFDA","BSDXIEN","BSDXMSG")
 S BSDXI=BSDXI+1
 S ^BSDXTMP($J,BSDXI)=+$G(BSDXIEN(1))_"^"_$C(30)_$C(31)
 Q
 ;
ERR(BSDXERID,ERRTXT) ;Error processing
 S:'+$G(BSDXI) BSDXI=999999
 S BSDXI=BSDXI+1
 S ^BSDXTMP($J,BSDXI)=BSDXERID_"^"_ERRTXT_$C(30)
 S BSDXI=BSDXI+1
 S ^BSDXTMP($J,BSDXI)=$C(31)
 Q
 ;
ERROR ;
 D ^%ZTER
 I '+$G(BSDXI) N BSDXI S BSDXI=999999
 S BSDXI=BSDXI+1
 D ERR(0,"BSDX22 M Error: <"_$G(%ZTERROR)_">")
 Q
