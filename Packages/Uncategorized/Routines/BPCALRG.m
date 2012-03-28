BPCALRG ; IHS/OIT/MJL - ALLERGY TRACKING RPC ROUTINE - FHL ;
 ;;1.5;BPC;;MAY 26, 2005
GETALRG(BPCRES,BPCIEN) ;EP REMOTE PROC: BPC GETALLERG
 ;
 S U="^",XWBWRAP=1,BPCCTR=0,BPCSUB=$J,BPCIEN=$G(BPCIEN),BPCRES="^BPCRES("_BPCSUB_")"
 K ^BPCRES($J)
 I BPCIEN="" S ^BPCRES($J,0)=-1,^BPCRES($J,1)="NO PATIENT IEN SENT. UNABLE TO GET ALLERGIES!" D KILL Q
 D GETAL,KILL
 Q
GETAL ;
 I '$D(^GMR(120.8,"B",BPCIEN)) S ^BPCRES($J,0)=1,^BPCRES($J,1)="No Allergies Noted" Q
 S BPCX="",BPCSTOP=0 F  S BPCX=$O(^GMR(120.8,"B",BPCIEN,BPCX)) Q:BPCX=""  D  Q:BPCSTOP
 .S BPCDTA=^GMR(120.8,BPCX,0),BPCAGENT=$P(BPCDTA,U,2)
 .I BPCAGENT="" S BPCKAL=$P(BPCDTA,U,22) D  Q
 ..I BPCKAL="n" S BPCSTOP=1,^BPCRES($J,0)=1,^BPCRES($J,1)="No Known Allergies"
 .S BPCTYPE="",BPCTYP=$P(BPCDTA,U,20) I BPCTYP'="" D
 ..F BPCY=1:1:$L(BPCTYP) S BPCTYPE=$S(BPCY=1:"",1:BPCTYPE_",")_$S($E(BPCTYP,BPCY)="D":"DRUG",$E(BPCTYP,BPCY)="F":"FOOD",1:"OTHER")
 .S BPCOH=$P(BPCDTA,U,6),BPCOHD="" I BPCOH'="" D
 ..I BPCOH="h" S BPCOHD="HISTORICAL" Q
 ..I BPCOH="o" S BPCOHD="OBSERVED"
 .S BPCDATE=$P(BPCDTA,U,4),BPCDATE=$P(BPCDATE,".",1)
 .S BPCCTR=BPCCTR+1,^BPCRES($J,BPCCTR)=BPCAGENT_"`"_BPCTYPE_"`"_BPCOHD_"`"_BPCDATE_"`"_BPCX
 S ^BPCRES($J,0)=BPCCTR
 Q
KILL ;
 K BPCCTR,BPCSUB,BPCX,BPCSTOP,BPCKAL,BPCTYP,BPCTYPE,BPCY
 Q
