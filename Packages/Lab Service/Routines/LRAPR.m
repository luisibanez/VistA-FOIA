LRAPR ;AVAMC/REG/WTY- ANAT RELEASE REPORTS ;10/30/01
 ;;5.2;LAB SERVICE;**72,248,259**;Sep 27, 1994
 ;
 N LRESSW
 D SWITCH
 I +LRESSW D  Q
 .D ^LRAPRES
 .D END
 W !!?27,"Release Pathology Reports",!!
 D A
 I '$D(LRSS) D END Q
 I LRCAPA D  G:'$D(X) END
 .S X=$S(LRSS="CY":"CYTOLOGY REPORTING",LRSS="SP":"SURGICAL PATH REPORTING",1:"")
 .D:X]"" X^LRUWK
 I LRSS="AU" D B Q
 S LRSOP="Z"
 S DR="S A=^LR(LRDFN,LRSS,LRI,0),LRZ=$P(A,U,3),LRZ(1)=$P(A,U,13),"
 S DR=DR_"LRZ(2)=$P(A,U,11),LRZ(3)=$P(A,U,2);"
 S DR=DR_"I 'LRZ W $C(7),!,""No date report completed.   "
 S DR=DR_"Cannot release."" S Y=0;"
 S DR=DR_"I 'LRZ(2) D NMPATH^LRAPR;"
 S DR=DR_"I LRZ(2) D RINFO^LRAPR S Y=0;"
 S DR=DR_"I 'LRZ(2) D SUPCHK^LRAPR;"
 S DR=DR_"S DIR(0)=""YA"",DIR(""A"")=""Release report? """
 S DR=DR_",DIR(""B"")=""NO"" D ^DIR K:Y Y S:$D(Y) Y=0;"
 S DR=DR_".11////^D NOW^%DTC S X=%;.13////^S X=DUZ;"
 S DR=DR_"W !!,""Report released..."""
 D ^LRAPDA
 D END
 Q
 ;
B ;Autopsy
 S LRSOP="Z"
 S DR="S A=$G(^LR(LRDFN,""AU"")) I A="""" S Y=0;"
 S DR=DR_"S LRZ=$P(A,U,3),LRZ(1)=$P(A,U,16),LRZ(2)=$P(A,U,15),"
 ;KLL-LRZ(3)=SR PATHOLOGIST,LRZ(4)=PROVISIONAL DATE
 S DR=DR_"LRZ(3)=$P(A,U,10),LRZ(4)=$P(A,U,17);"
 ;KLL-PROVISIONAL OR DATE REPORT COMPLETED IS REQUIRED
 S DR=DR_"I 'LRZ(4),'LRZ W $C(7),!,""Provisional date or date report completed required.   "
 S DR=DR_"Cannot release."" S Y=0;"
 S DR=DR_"I 'LRZ(2) D NMPATH^LRAPR;"
 S DR=DR_"I LRZ(2) D RINFO^LRAPR;"
 S DR=DR_"I 'LRZ(2) D SUPCHK^LRAPR;"
 S DR=DR_"D RELEASE^LRAPR;"
 S DR=DR_"D NOW^%DTC S LRDTE=%;"
 S DR=DR_"14.7////^S X=$S(LRZ(2):""@"",1:LRDTE);"
 S DR=DR_"14.8////^S X=$S(LRZ(2):""@"",1:DUZ);"
 S DR=DR_"W !!,""Report "" W:LRZ(2) ""un"" W ""released..."";K LRDTE"
 D ^LRAPDA
 D END
 Q
EN ;Supplementary Report Entry Point
 N LRESSW
 D SWITCH
 W !!?20,"Release Supplementary Pathology Reports",!
 D A
 I '$D(LRSS) D END Q
 W !!,"Data entry for ",LRH(0)," "
 S %=1 D YN^LRU G:%<1 END
 I %=2 D  G:Y<1 END
 .S %DT="AE",%DT(0)="-N",%DT("A")="Enter YEAR: " D ^%DT K %DT
 .Q:Y<1  S LRAD=$E(Y,1,3)_"0000",LRH(0)=$E(Y,1,3)+1700
 I '$D(^LRO(68,LRAA,1,LRAD,0)) D  Q
 .W $C(7),!!,"NO ",LRAA(1)," ACCESIONS IN FILE FOR ",LRH(0),!!
W K X,Y,LR("CK") R !!,"Select Accession Number/Pt name: ",LRAN:DTIME
 G:LRAN=""!(LRAN[U) END
 I LRAN'?1N.N D  G:LRAN<1 END  G W
 .D PNAME^LRAPDA
 .Q:LRAN<1
 .D DIE
 D REST
 G W
REST W "  for ",LRH(0)
 I '$D(^LRO(68,LRAA,1,LRAD,1,LRAN,0)) D  Q
 .W $C(7),!!,"Accession # ",LRAN," for ",LRH(0)
 .W " not in ACCESSION file",!!
 S X=^LRO(68,LRAA,1,LRAD,1,LRAN,0),LRLLOC=$P(X,"^",7),LRDFN=+X
 Q:'$D(^LR(LRDFN,0))  S X=^(0) D ^LRUP
 W !,LRP,"  ID: ",SSN
 I LRSS'="AU" D
 .S LRI=$P(^LRO(68,LRAA,1,LRAD,1,LRAN,3),"^",5)
 .W !,"Specimen(s):"
 .S X=0 F  S X=$O(^LR(LRDFN,LRSS,LRI,.1,X)) Q:'X  D
 ..I $D(^LR(LRDFN,LRSS,LRI,.1,X,0)),$L(^(0)) W !,^(0)
DIE ;Define default supplementary report
 N LRFILE,LRIENS,LRIENS1,LRX,LRRLS,LRFDA,LRLKFL,LRDA,LRQUIT,LRNOSP
 N LRMSG,LRSRFL
 S DIC("B")="",LRNOSP=0
 I LRSS'="AU" D
 .S LRFILE=+$$GET1^DID(LRSF,1.2,"","SPECIFIER")
 .S LRIENS1=LRI_","_LRDFN_","
 .I '+$P($G(^LR(LRDFN,LRSS,LRI,1.2,0)),"^",4) S LRNOSP=1 Q
 .S LRX=0 F  S LRX=$O(^LR(LRDFN,LRSS,LRI,1.2,LRX)) Q:'LRX  D
 ..S LRIENS=LRX_","_LRIENS1
 ..S LRSRFL=$$GET1^DIQ(LRFILE,LRIENS,.02,"I")
 ..Q:LRSRFL
 ..S DIC("B")=$$GET1^DIQ(LRFILE,LRIENS,.01,"I")
 I LRSS="AU" D
 .S LRFILE=63.324,LRIENS1=LRDFN_","
 .I '+$P($G(^LR(LRDFN,84,0)),"^",4) S LRNOSP=1 Q
 .S LRX=0 F  S LRX=$O(^LR(LRDFN,84,LRX)) Q:'LRX  D
 ..S LRIENS=LRX_","_LRIENS1
 ..S LRSRFL=$$GET1^DIQ(LRFILE,LRIENS,.02,"I")
 ..Q:LRSRFL
 ..S DIC("B")=$$GET1^DIQ(LRFILE,LRIENS,.01,"I")
 I LRNOSP D  Q
 .K LRMSG
 .S LRMSG=$C(7)_"No supplementary reports exist for this accession."
 .D EN^DDIOL(LRMSG,"","!!")
 I 'DIC("B") D  Q
 .K LRMSG
 .S LRMSG=$C(7)_"All supplementary reports have been released."
 .D EN^DDIOL(LRMSG,"","!!")
DIE1 ;
 S LRQUIT=0
 F  D  Q:LRQUIT
 .W !
 .S:LRSS="AU" (LRLKFL,DIC)="^LR(LRDFN,84,"
 .S:LRSS'="AU" (LRLKFL,DIC)="^LR(LRDFN,LRSS,LRI,1.2,"
 .S DIC("A")="Select SUPPLEMENTARY REPORT DATE: "
 .S DIC(0)="AEQM"
 .D ^DIC K DIC
 .I Y<1 S LRQUIT=1 Q
 .S LRDA=+Y
 .S LRIENS=LRDA_","_LRIENS1
 .S LRRLS=+$$GET1^DIQ(LRFILE,LRIENS,.02,"I")
 .I LRRLS D  Q
 ..W !!,"This supplementary report has already been released.",!
 .W !
 .I LRESSW D  Q
 ..D ESIG Q:LRQUIT
 ..D UPDATE
 .S DIR("A")="Release supplementary report",DIR(0)="Y",DIR("B")="NO"
 .D ^DIR K DIR
 .Q:'Y
 .D UPDATE
 Q
 ;
A D ^LRAP G:'$D(Y) END
 Q
C ;
 S LRDICS="SPCYEM" D ^LRAP
 G:'$D(Y) END
 Q
S ;from LRAPDA
 S LRK=$P(^LR(LRDFN,LRSS,LRI,0),"^",11) Q:'LRK  S:'$D(^LRO(68,LRAA,1,LRAD,1,LRAN,4,0)) ^(0)="^68.04PA^^"
 Q:$D(^LRO(68,LRAA,1,LRAD,1,LRAN,4,LRT,0))  S ^(0)=LRT_"^50^^"_DUZ_"^"_LRK,X=^LRO(68,LRAA,1,LRAD,1,LRAN,4,0),^(0)=$P(X,"^",1,2)_"^"_LRT_"^"_($P(X,"^",4)+1)
 S:'$D(^LRO(68,LRAA,1,LRAD,1,LRAN,4,LRT,1,0)) ^(0)="^68.14P^^"
 S C=0 F  S C=$O(LRT(C)) Q:'C  D CAP
 S ^LRO(68,"AA",LRAA_"|"_LRAD_"|"_LRAN_"|"_LRT)=""
 Q
 ;
CAP S ^LRO(68,LRAA,1,LRAD,1,LRAN,4,LRT,1,C,0)=C_"^1^0^0^^"_LRK_"^"_DUZ_"^"_DUZ(2)_"^"_LRAA_"^"_LRAA_"^"_LRAA
 S X=^LRO(68,LRAA,1,LRAD,1,LRAN,4,LRT,1,0),^(0)=$P(X,"^",1,2)_"^"_C_"^"_($P(X,"^",4)+1)
 Q
 ;
SWITCH ;Check to see if electronic signature is enabled
 D GETDATA^LRAPESON(.LRESSW)
 Q
ESIG ;Prompt for electronic signature
 S LRQUIT=0
 D SIG^XUSESIG
 I X1="" D
 .W "  SIGNATURE NOT VERIFIED"
 .S LRQUIT=1
 Q
UPDATE ;
 S LRLKFL=LRLKFL_LRDA_",0)"
 L +@(LRLKFL):5 I '$T D  Q
 .S LRMSG="This record is locked by another user.  "
 .S LRMSG=LRMSG_"Please wait and try again."
 .D EN^DDIOL(LRMSG,"","!!")
 S LRFDA(LRFILE,LRIENS,.02)=1
 ;File signer ID and Date/time of released supp report
 D CKSIGNR
 D FILE^DIE("","LRFDA")
 W "...Released"
 L -@(LRLKFL)
 ;If all supp reports released, and signer is same person for both
 ;  supp and main reports, allow release of main report at this point
 I LRESSW D RELMN
 Q
SUPCHK ;Check for unreleased supplementary reports
 N LRSR,LRSR1,LRSR2
 S LRSR=0,LRSR1=1
 I LRSS'="AU" D
 .Q:'+$P($G(^LR(LRDFN,LRSS,LRI,1.2,0)),U,4)
 .F  S LRSR=$O(^LR(LRDFN,LRSS,LRI,1.2,LRSR)) Q:LRSR'>0!('LRSR1)  D
 ..S LRSR1=+$P(^LR(LRDFN,LRSS,LRI,1.2,LRSR,0),U,2)
 ..I 'LRSR1 D
 ...S Y=+$P(^LR(LRDFN,LRSS,LRI,1.2,LRSR,0),U)
 ...D DD^%DT S LRSR2=Y
 I LRSS="AU" D
 .Q:'+$P($G(^LR(LRDFN,84,0)),U,4)
 .F  S LRSR=$O(^LR(LRDFN,84,LRSR)) Q:LRSR'>0!('LRSR1)  D
 ..S LRSR1=+$P(^LR(LRDFN,84,LRSR,0),U,2)
 ..I 'LRSR1 D
 ...S Y=+$P(^LR(LRDFN,84,LRSR,0),U)
 ...D DD^%DT S LRSR2=Y
 I 'LRSR1 D
 .W $C(7),!,"Supplementary report "_LRSR2_" has not been released.  "
 .W "Cannot release."
 .S Y=0
 Q
RINFO ;Display release information
 W $C(7),!,"Report "
 W:LRZ(2)=1 "has already been "
 W "released "
 S Y=LRZ(2)
 D DD^%DT
 W:LRZ(2)>1 Y
 W:LRZ(1)'="" " by "_$P($G(^VA(200,LRZ(1),0)),U)
 K Y
 Q
NMPATH ;Check for missing pathologist name
 I 'LRZ(3) D
 .W $C(7),!,"Pathologist name missing.  Cannot release."
 .S Y=0
 Q
RELEASE ;Prompt for release/unrelease
 W ! S DIR(0)="YA",DIR("B")="NO"
 S:LRZ(2) DIR("A")="Unrelease report? "
 S:'LRZ(2) DIR("A")="Release report? "
 D ^DIR
 K:Y Y
 I $D(Y) S Y=0
 Q
RELMN ;Allow release of main report as long as all supp reports are
 ;  released, and signer is same person for main and supp report(s)
 ;Make sure all supp reports signed out
 S LRQT=0
 D RELCHK
 Q:LRQT
 ;Prompt for release of main report
 S DIR(0)="YA",DIR("B")="YES"
 S DIR("A")="Release main report?  "
 D ^DIR K DIR
 Q:'Y
 ;User signing out the main report must equal the Path on the report
 N LRPAT
 ;S LRSIGNR=$$GET1^DIQ(200,DUZ_",",.01)
 I LRSS'="AU" D 
 . S LRIENS=LRI_","_LRDFN_","
 . S LRPAT=+$$GET1^DIQ(LRSF,LRIENS,.02,"I")
 I LRSS="AU" S LRPAT=+$$GET1^DIQ(63,LRDFN_",",13.6,"I")
 I 'LRPAT D  Q
 .S LRMSG(1)="Pathologist or Cytotechnologist entry is missing.",LRMSG(1,"F")="!!"
 .S LRMSG(2)="  Cannot release the main report.",LRMSG(2,"F")="!"
 .D EN^DDIOL(.LRMSG) K LRMSG
 I LRPAT'=DUZ D  Q:LRQUIT
 .S DIR(0)="Y",DIR("B")="YES",DIR("A")="CONTINUE  "
 .S DIR("A",1)=""
 .S DIR("A",2)="Supplemental release User ID does not match the."
 .S DIR("A",3)="  Pathologist/Cytotechnologist User ID on the main report."
 .S DIR("A",4)="Do you want to proceed with release of the main report?"
 .S DIR("A",5)=""
 .D ^DIR K DIR
 .I Y=0 S LRQUIT=1
 ;Release main report
 D ^LRAPRES
 S LRQUIT=1
 Q
RELCHK ;Check to make sure all supp reports are released
 N LRFILE,LRIENS,LRIENS1,LRX,LRRLS,LRFDA,LRLKFL,LRDA,LRNOSP
 N LRMSG,LRSRFL
 S DIC("B")=""
 I LRSS'="AU" D
 .S LRFILE=+$$GET1^DID(LRSF,1.2,"","SPECIFIER")
 .S LRIENS1=LRI_","_LRDFN_","
 .S LRX=0 F  S LRX=$O(^LR(LRDFN,LRSS,LRI,1.2,LRX)) Q:'LRX  D
 ..S LRIENS=LRX_","_LRIENS1
 ..S LRSRFL=$$GET1^DIQ(LRFILE,LRIENS,.02,"I")
 ..Q:LRSRFL
 ..S DIC("B")=$$GET1^DIQ(LRFILE,LRIENS,.01,"I")
 I LRSS="AU" D
 .S LRFILE=63.324
 .S LRX=0 F  S LRX=$O(^LR(LRDFN,84,LRX)) Q:'LRX  D
 ..S LRIENS=LRX_","_LRDFN_","
 ..S LRSRFL=$$GET1^DIQ(LRFILE,LRIENS,.02,"I")
 ..Q:LRSRFL
 ..S DIC("B")=$$GET1^DIQ(LRFILE,LRIENS,.01,"I")
 I $G(DIC("B")) S LRQT=1
 Q
CKSIGNR ;Update supp report with Releaser ID and Date/time
 N LRIEN2,LRFLE
 S LRQUIT=0
 I LRSS'="AU" D
 .S (A,B)=0 F  S A=$O(^LR(LRDFN,LRSS,LRI,1.2,LRDA,2,A)) Q:'A  D
 ..S B=A
 .I '$D(^LR(LRDFN,LRSS,LRI,1.2,LRDA,2,B,0)) S LRQUIT=1 Q
 .S LRIEN2=B_","_LRDA_","_LRI_","_LRDFN_","
 .S LRFLE=$S(LRSS="SP":63.8172,LRSS="CY":63.9072,LRSS="EM":63.2072,1:"")
 I LRSS="AU" D
 .S (A,B)=0 F  S A=$O(^LR(LRDFN,84,LRDA,2,A)) Q:'A  D
 ..S B=A
 .I '$D(^LR(LRDFN,84,LRDA,2,B,0)) S LRQUIT=1 Q
 .S LRIEN2=B_","_LRDA_","_LRDFN_","
 .S LRFLE=$S(LRSS="AU":63.3242,1:"")
 Q:LRQUIT
 S LRFDA(LRFLE,LRIEN2,.03)=DUZ
 D NOW^%DTC
 S LRFDA(LRFLE,LRIEN2,.04)=%
 Q
END ;
 D V^LRU
 Q
