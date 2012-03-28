BHSUTL ;IHS/CIA/MGH - Health Summary Utilities ;22-Jun-2010 17:29;MGH
 ;;1.0;HEALTH SUMMARY COMPONENTS;**1,2,3,4**;March 17, 2006;Build 13
 ;===================================================================
 ;Taken from APCHSUTL
 ; IHS/TUCSON/LAB - UTILITIES FOR APCHS -- SUMMARY PRODUCTION COMPONENTS
 ;;2.0;IHS RPMS/PCC Health Summary;**3,8**;JUN 24, 1997
 ;IHS health summary utilities to use in VA health summaries
 ;Updated to patch 14
 ;Updated in patch2 for CPT codes
 ;Updated in patch3 for CSV
GETICDDX ;ENTRY POINT
 ;IHS/MSC/MGH Code set versioning changes entered
 ;S Y=$P(^ICD9(BHSICD,0),U,1)
 S Y=$$ICDDX^ICDCODE(BHSICD)  ;cmi/anch/maw 8/27/2007 code set version
 N APCHSDSC
 S APCHSDSC=$$ICDD^ICDCODE($P(Y,U,2),"APCHSDSC")
 ;S:GMPXICDF="L" BHSICD=Y_"-"_$S($D(^ICD9(BHSICD,1)):$P(^(1),U,1),1:"<DESCRIPTION field missing>")
 S:GMPXICDF="L" BHSICD=$P(Y,U,2)_"-"_$S($D(APCHSDSC(1)):$G(APCHSDSC(1)),1:"<DESCRIPTION field missing>")  ;cmi/anch/maw 8/27/20
 ;S:GMPXICDF="S" BHSICD=Y_"-"_$S($D(^ICD9(BHSICD,0)):$P(^(0),U,3),1:"<DIAGNOSIS field missing>")
 S:GMPXICDF="S" BHSICD=$P(Y,U,2)_"-"_$S($P(Y,U,4)]"":$P(Y,U,4),1:"<DIAGNOSIS field missing>")  ;cmi/anch/maw 8/27/2007 code
 ;S:GMPXICDF="C" BHSICD=Y
 S:GMPXICDF="C" BHSICD=$P(Y,U,2)
 Q
GETICDOP ;ENTRY POINT
 ;Patch 2 Code set versioning changed
 ;S Y=$P(^ICD0(BHSICD,0),U,1)
 S Y=$$ICDOP^ICDCODE(BHSICD)
 ;S:GMPXICDF="L" BHSICD=Y_"-"_$S($D(^ICD0(BHSICD,1)):$P(^(1),U,1),1:"<DESCRIPTION field missing>")
 S:GMPXICDF="L" BHSICD=$P(Y,U,2)_"-"_$S($D(^ICD0(BHSICD,1)):$P(^(1),U,1),1:"<DESCRIPTION field missing>")
 ;S:GMPXICDF="S" BHSICD=Y_"-"_$S($D(^ICD0(BHSICD,0)):$P(^(0),U,4),1:"<OPERATION/PROCEDURE field missing>")
 S:GMPXICDF="S" BHSICD=$P(Y,U,2)_"-"_$S($P(Y,U,5)]"":$P(Y,U,5),1:"<OPERATION/PROCEDURE field missing>")
 ;S:GMPXICDF="C" BHSICD=Y
 S:GMPXICDF="C" BHSICD=$P(Y,U,2)
 Q
GETCPT ;ENTRY POINT  PATCH 2
 ;Patch 2Code set versioning changes
 ;S Y=$P(^ICPT(BHSICD,0),U,1)
 S Y=$$CPT^ICPTCOD(BHSICD)
 ;S:GMPXICDF="L" BHSICD=Y_"-"_$S($D(^ICPT(BHSICD,0)):$P(^(0),U,2),1:"<DESCRIPTION field missing>")
 S:GMPXICDF="L" BHSICD=$P(Y,U,2)_"-"_$S($P(Y,U,3)]"":$P(Y,U,3),1:"<DESCRIPTION field missing>")
 ;S:GMPXICDF="S" BHSICD=Y_"-"_$S($D(^ICPT(BHSICD,0)):$P(^(0),U,2),1:"<DESCRIPTION field missing>")
 S:GMPXICDF="S" BHSICD=$P(Y,U,2)_"-"_$S($P(Y,U,3)]"":$P(Y,U,3),1:"<DESCRIPTION field missing>")
 ;S:GMPXICDF="C" BHSICD=Y
 S:GMPXICDF="C" BHSICD=$P(Y,U,2)
 Q
PRTICD ;ENTRY POINT
 ;I GMPXNARR="N" S:BHSNRQ="" BHSNRQ="<no narrative provided>" S BHSICD=""
 S BHSTXT=BHSICD
 ;I GMPXNARR="Y" S BHSTXT=BHSTXT_" "_BHSNRQ
 S:'$D(BHSNTE) BHSNTE=""
 I BHSNTE]"" S BHSNTE=" "_BHSNTE
 D PRTTXT
 Q
 ;
PRTTXT ;PEP - PUBLISHED ENTRY POINT
 ; GENERALIZED TEXT PRINTER
 N BHSQ
 S:'$D(BHSNTE) BHSNTE=""
 S BHSDLT=1,BHSILN=IOM-BHSICL-1
 F BHSQ=0:0 D PRTTXT1 Q:BHSTXT=""  D PRTTXT2
 K BHSNTE
 K BHSILN,BHSDLT,BHSF,BHSC,BHSTXT
 Q
PRTTXT1 ;
 I GMPXNARR'="N" D
 .S:BHSNRQ]""&(($L(BHSNRQ)+$L(BHSTXT)+2)<255) BHSTXT=$S(BHSTXT]"":BHSTXT_"; ",1:"")_BHSNRQ,BHSNRQ=""
 .S:BHSNTE]""&(BHSNRQ="")&(($L(BHSNTE)+$L(BHSTXT)+2)<255) BHSTXT=BHSTXT_BHSNTE,BHSNTE=""
 I GMPXNARR="N" D
 .S:($L(BHSTXT)+2)<255 BHSTXT=$S(BHSTXT]"":BHSTXT_"; ",1:""),BHSNRQ=""
 .S:BHSNTE]""&(($L(BHSTXT)+2)<255) BHSTXT=BHSTXT_BHSNTE,BHSNTE=""
 Q
PRTTXT2 D GETFRAG D CKP^GMTSUP Q:$D(GMTSQIT)  W ?BHSICL W BHSF,! S BHSICL=BHSICL+BHSDLT,BHSILN=BHSILN-BHSDLT,BHSDLT=0
 Q
GETFRAG I $L(BHSTXT)<BHSILN S BHSF=BHSTXT,BHSTXT="" Q
 F BHSC=BHSILN:-1:0 Q:$E(BHSTXT,BHSC)=" "
 S:BHSC=0 BHSC=BHSILN
 S BHSF=$E(BHSTXT,1,BHSC-1),BHSTXT=$E(BHSTXT,BHSC+1,255)
 Q
 ;
GETNARR ;ENTRY POINT
 I BHSNRQ]"",GMPXNARR="Y" S BHSNRQ=$S($D(^AUTNPOV(BHSNRQ)):$P(^AUTNPOV(BHSNRQ,0),U,1),1:"***** "_BHSNRQ_" *****")
 E  S BHSNRQ=""
 Q
 ;
GETSITEV ;ENTRY POINT
 S BHSP=^AUPNVSIT(BHSVDF,0),BHSVSC=$P(BHSP,U,7),BHSITE=$P(BHSP,U,6)
GETSITE ;ENTRY POINT
 S:BHSITE="" BHSITE="null"
 S BHSP=$G(^AUTTLOC(BHSITE,0))
 S:'$D(BHSVDF) BHSVDF=-1
 S BHSNFL=$P(BHSP,U,1) S:BHSNFL="" BHSNFL="null" S BHSNFL=$S($D(^DIC(4,BHSNFL,0)):$P(^(0),U,1),$P($G(^AUPNVSIT(BHSVDF,21)),U)]"":$P(^(21),U),1:"<"_BHSITE_">") ;IHS/CMI/LAB - fixed this line
 S BHSNSH=$P(BHSP,U,2) S:$P($G(^AUPNVSIT(BHSVDF,21)),U)]"" BHSNSH=$E($P(^(21),U),1,12) I BHSNSH="" S BHSNSH="<"_BHSITE_">" ;IHS/CMI/LAB - fixed this line to replace the one above
 K:BHSVDF=-1 BHSVDF
 S BHSNAB=$J($P(BHSP,U,7),4) I BHSNAB="" S BHSNAB="<"_BHSITE_">"
 Q
 ;
 ; THE FOLLOWING CODE SEGMENTS ARE CALLED FROM 'ROUTINE"-TYPE
 ;  MENU OPTIONS TO DISPLAY ITEMS IN A FILE
 ;
LM ;ENTRY POINT - FOR BHSLST MEASUREMENT PANEL TYPES
 S BHSLST="^APCHSMPN(" G DSPLST
 ;
LI ;ENTRY POINT - FOR BHSLST HLTH SUM FLOWSHEET ITEMS
 S BHSLST="^APCHSFLI(" G DSPLST
 ;
LF ;ENTRY POINT - FOR BHSLST HLTH SUM FLOWSHEETS
 S BHSLST="^APCHSFLC(" G DSPLST
 ;
DSPLST ; COMMON CODE FOR BUILD HLTH SUM & HLTH SUM MNX LISTS
 K DIR
 I '$D(@(BHSLST_"""B"")")) W !,"NO ",$P(@(BHSLST_"0)"),U),"S DEFINED.",! Q
 W @IOF,!!,"Existing ",$P(@(BHSLST_"0)"),U),"S:",! S BHSCNT=""
CONT F  S BHSCNT=$O(@(BHSLST_"""B"",BHSCNT)")) Q:BHSCNT=""  W !,?5,BHSCNT I (IOSL-3)<$Y S DIR(0)="E" D ^DIR W @IOF G:1'[Y QUIT
 K DIR S DIR(0)="E" D ^DIR W !
 Q
 ;
GENFG ;generate filegrams for export
MEASPAN ;
 N DIFG,DIFGT,DILC,DIFGER
 W !,"REMEMBER TO KILL APCHTMP BEFORE DOING THIS",!
 S APCHT="MEASPAN",APCHC=0 F APCHX="ADULT STD","ADULT STD METRIC","PEDIATRIC STD","PEDIATRIC STD METRIC" S DIFGT=$O(^DIPT("B","APCH MP TYPE",0)) D
 .I 'DIFGT W !,"measurement panel fg missing" Q
 .S DIFG("FE")=$O(^BHS(90470,"B",APCHX,0))
 .I 'DIFG("FE") W !,"panel ",APCHX," missing.",! Q
 .S APCHC=APCHC+1
 .D GEN1
 .Q
FLOW ;
 G TYPE
 S APCHT="FLOW",APCHC=0 F APCHX="DIABETIC FLOWSHEET" S DIFGT=$O(^DIPT("B","APCH FS TYPE",0)) D
 .I 'DIFGT W !,"flowsheet fg missing" Q
 .S DIFG("FE")=$O(^APCHSFLC("B",APCHX,0))
 .I 'DIFG("FE") W !,"flowsheet ",APCHX," missing.",! Q
 .S APCHC=APCHC+1
 .D GEN1
 .Q
TYPE ;
 S APCHT="TYPE",APCHC=0 F APCHX="ADULT REGULAR","CHR","DENTAL","DIABETES STANDARD","IMMUNIZATION","MENTAL HEALTH/SOCIAL SERVICES","PEDIATRIC","PATIENT MERGE (COMPLETE)","PROBLEM LIST" S DIFGT=$O(^DIPT("B","APCH HS TYPE",0)) D
 .I 'DIFGT W !,"health summary type fg missing" Q
 .S DIFG("FE")=$O(^GMT(142,"B",APCHX,0))
 .I 'DIFG("FE") W !,"type ",APCHX," missing.",! Q
 .S APCHC=APCHC+1
 .D GEN1
 .Q
 K APCHC,APCHT W !,"all done"
 Q
GEN1 ;
 S DIFG("FUNC")="A"
 S DIFG("FGR")="^APCHTMP("""_APCHT_""",APCHC,"
 S DILC=0
 D EN^DIFGG
 I $D(DIFGER) W !,"error on ",APCHT," item ",APCHX,!
 Q
QUIT K DIR,X,Y,BHSLST,BHSCNT
 Q
