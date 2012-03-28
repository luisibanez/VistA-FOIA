XDRZKALK ;IHS/PHXAO/AEF - KILL "ALK" XREF ON FILE 15 FOR DUPLICATE RECORD MERGE
 ;;1.0;ANNE'S SPECIAL ROUTINES;;AUG 18, 2004
 ;
DESC ;----- ROUTINE DESCRIPTION
 ;;
 ;;THIS ROUTINE ENSURES THAT ALL "ALK" CROSSREFERENCES ARE KILLED FOR A
 ;;MERGED PAIR OF RECORDS CONTAINED IN THE DUPLICATE RECORD FILE #15
 ;;WHEN THE MERGE IS COMPLETED.  THE "AIHSKALK" CROSSREFERENCE CALLS
 ;;THIS ROUTINE TO KILL THE "ALK" CROSSREFERENCES WHEN THE MERGE STATUS
 ;;FIELD IS SET TO 2 'MERGED'.  FOR SOME REASON THIS CROSSREFERENCE WAS
 ;;NOT GETTING KILLED WHEN THE ENTRIES WERE MERGED AND THIS INTERFERES
 ;;WITH THE ^AUPNLK LOOKUP ROUTINE ON THE PATIENT FILE.  IF THERE IS AN
 ;;"ALK" CROSSREFERENCE THEN THE LOOKUP ROUTINE DISPLAYS 'DUPLICATE
 ;;PATIENT' INFORMATION WHICH IS INAPPROPRIATE IF THE PATIENT BEING
 ;;SELECTED HAS ALREADY COMPLETED THE MERGE
 ;;
 ;;$$END
 N I,X
 F I=1:1 S X=$T(DESC+I) Q:X["$$END"  W !,$P(X,";;",2)
 Q
EN(ST,DA) ;EP
 ;----- KILL "ALK" CROSSREFERENCES IN FILE 15 FOR ENTRY DA
 ;
 ;      ST  =  MERGE STATUS FROM RECORD DA IN FILE 15
 ;      DA  =  RECORD IEN IN FILE 15
 ;
 N FL,R1,R2,X
 ;
 Q:ST'=2   ;QUIT IF STATUS NOT EQUAL 'MERGED'
 ;
 S X=^VA(15,DA,0)
 S FL=$P($P(X,U),";",2)
 Q:FL']""
 S R1=+$P(X,U)
 S R2=+$P(X,U,2)
 K ^VA(15,"ALK",""_FL_"",R1,2,R2,DA)
 K ^VA(15,"ALK",""_FL_"",R2,2,R1,DA)
 Q
