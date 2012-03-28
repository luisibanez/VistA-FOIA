BHSPL ;IHS/MSC/MGH  - Health Summary for Problem list ;19-Jun-2008 12:19;MGH
 ;;1.0;HEALTH SUMMARY COMPONENTS;**1,2**;Mar 17,2006
 ;===================================================================
 ; IHS/TUCSON/LAB - PART 4 OF APCHS -- SUMMARY PRODUCTION COMPONENTS ;  [ 06/24/97  2:42 PM ]
 ;;2.0;IHS RPMS/PCC Health Summary;;JUN 24, 1997
 ;Copied and changed to be used in VA health summary
 ;
PROB ; EP ******************** PROBLEM / NOTES * 9000011 *********
APROB S BHSTAT="A" G COMMON
IPROB S BHSTAT="I"
 ; <SETUP>
COMMON ;
 N BHSPAT
 S BHSPAT=DFN
 Q:'$D(^AUPNPROB("AC",BHSPAT))
 K BHSDFT S BHSNDF=0
 S BHSFAC="" F BHSQ=0:0 S BHSFAC=$O(^AUPNPROB("AA",BHSPAT,BHSFAC)) Q:'BHSFAC  D PROBSCH
 Q:BHSNDF=0
 D CKP^GMTSUP G:$D(GMTSQIT) PROBX
 ; <DISPLAY>
 D CKP^GMTSUP Q:$D(GMTSQIT)  W ?13,"ENT.    MODIFIED",!
 S BHSFPP="" F BHSQ=0:0 S BHSFPP=$O(BHSDFT(BHSFPP)) Q:BHSFPP=""  S BHSDFN=BHSDFT(BHSFPP) D PROBDSP
PROBX K BHSDFT,BHSNDF,BHSFPP,BHSFAC,BHSPLN,BHSPBN,BHSDTM,BHSDTN,BHSPRB,BHSTAT,BHSNFP,BHSNRQ,BHSPNM,BHSDFN,BHSFCN,BHSICD,BHSDOO
 K BHSICL,BHSILN,BHSN,BHSNAR,BHSNTE,BHSQ,BHSTXT
 K BHSNFL,BHSNSH,BHSNAB,BHSVSC,BHSITE,Y,X
 Q
PROBSCH ;
 S BHSPRB="" F BHSQ=0:0 S BHSPRB=$O(^AUPNPROB("AA",BHSPAT,BHSFAC,BHSPRB)) Q:BHSPRB=""  D
 .S BHSDFN=$O(^AUPNPROB("AA",BHSPAT,BHSFAC,BHSPRB,"")) Q:BHSDFN=""  D
 ..S:$P(^AUPNPROB(BHSDFN,0),U,12)=BHSTAT BHSNDF=BHSNDF+1,BHSDFT(BHSFAC_BHSPRB)=BHSDFN
 Q
PROBDSP ;
 ; <SETUP PROBLEM>
 S BHSN=^AUPNPROB(BHSDFN,0)
 S BHSICD=$P(BHSN,U,1) D GETICDDX^BHSUTL
 S BHSNRQ=$P(BHSN,U,5) D GETNARR^BHSUTL
 S BHSITE=$P(BHSN,U,6) D GETSITE^BHSUTL
 S BHSPNM=$P(BHSN,U,7) ;***** EDE *****
 S BHSPNM=BHSNAB_BHSPNM ;***** EDE *****
 S X=$P(BHSN,U,3) D REGDT4^GMTSU S BHSDTM=X
 S X=$P(BHSN,U,8) D REGDT4^GMTSU S BHSDTN=X
 S X=$P(BHSN,U,13)
 I X]"" D REGDT4^GMTSU S BHSDOO=X
 I X="" S BHSDOO=""
 S:BHSDOO]"" BHSNTE=" (onset "_BHSDOO_")"
 S BHSPLN=BHSPNM_$E("         ",1,12-$L(BHSPNM))_BHSDTN_" "_BHSDTM_" "
 D CKP^GMTSUP Q:$D(GMTSQIT)  W:GMTSNPG ?13,"ENT.    MODIFIED",!
 W BHSPLN S BHSICL=30,BHSILN=50 D PRTICD^BHSUTL
 D NOTEDSP
 Q
NOTEDSP ; DISPLAY NOTES UNDER BHSPRBLEM
 S BHSNFP=0 F BHSQ=0:0 S BHSNFP=$O(^AUPNPROB(BHSDFN,11,BHSNFP)) Q:'BHSNFP  D DSPFACN
 Q
DSPFACN ; DISPLAY NOTES FOR SELECTED APSHCFACILITY
 Q:$D(^AUPNPROB(BHSDFN,11,BHSNFP,11,0))'=1  Q:$O(^(0))=""
 S BHSITE=^AUPNPROB(BHSDFN,11,BHSNFP,0) D GETSITE^BHSUTL S BHSFCN=BHSNAB
 S BHSNDF=0 F BHSQ=0:0 S BHSNDF=$O(^AUPNPROB(BHSDFN,11,BHSNFP,11,BHSNDF)) Q:'BHSNDF  S BHSN=^(BHSNDF,0) D DSPN
 Q
DSPN ; DISPLAY SINGLE NOTE
 Q:$P(BHSN,U,4)="I"
 S BHSNAR=$P(BHSN,U,3) S X=$P(BHSN,U,5) ;S:Y="" Y="            "
 I X>0 D REGDT4^GMTSU S X=X_" -  "
 S BHSNAR=X_BHSNAR
 ;W ?22,BHSFCN,"#",$E(1000+$P(BHSN,U,1),2,4)_" ",$P(BHSN,U,3),!
 F BHSQ=0:0 Q:$E(BHSFCN)'=" "  S BHSFCN=$E(BHSFCN,2,99)
 D CKP^GMTSUP Q:$D(GMTSQIT)  W BHSPNM,BHSFCN,$P(BHSN,U)
 S BHSTXT=BHSNAR,BHSICL=31 D PRTTXT^BHSUTL
 Q
