ORWDAL33 ;SLC/DAN - Allergy calls to support windows ;5/4/05  14:10
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**215**;Dec 17, 1997
 ;
CLINUSER(ORY)   ;can user mark allergy as entered in error
 N DIC,X,PRM,Y,ORLST,ORX
 S DIC=8989.51,DIC(0)="MX",X="OR ALLERGY ENTERED IN ERROR" D ^DIC
 I Y=-1 S ORY=0 Q  ;Parameter not found so quit
 S PRM=+Y
 ;Check USER level
 S ORY=$$GET^XPAR("USR",PRM) I ORY'="" Q
 ;Check USER CLASS
 D ENVAL^XPAR(.ORLST,PRM)
 I ORLST>0 D
 . S ORX="" F  S ORX=$O(ORLST(ORX)) Q:ORX=""!(ORY'="")  D
 . . Q:'ORX["USR(8930"
 . . I $$ISA^USRLM(DUZ,+ORX) S ORY=$G(ORLST(ORX,1),1) Q
 I ORY'="" Q
 ;Check division and system
 S ORY=$$GET^XPAR("DIV^SYS",PRM) I ORY'="" Q
 S ORY=0 Q
