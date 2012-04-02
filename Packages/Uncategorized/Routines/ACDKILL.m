ACDKILL ;IHS/ADC/EDE/KML - KILL ALL ACD VARIABLES;
 ;;4.1;CHEMICAL DEPENDENCY MIS;;MAY 11, 1998
 ;
START ;
 ; Do not kill ACD6DIG,ACDPGM,ACDPNM,ACDSITE,ACDUSER.  Those
 ; variables are killed by the EXIT action of the entry ACD menu.
 ;
 D K
 K ACDVHIT
 K ACDDTLO,ACDF,ACDFILE,ACDJD,ACDPDT,ACDPIENT,ACDRCTR,ACDPDIEN,ACDMIEN
 K ACDTCTG
 K ACDMONTH,ACDSTART
 K ACDPSITE
 K ACDPCCL
 K ACDDTHI,ACDDTLOW
 K ACDTGSUB
 K ACDBYPAS,ACDHRS,ACDSLAVE
 K ACDCSDP
 K ACDAE,ACDBFLG,ACDCSDTE,ACDDEV,ACDLFLG,ACDLOC,ACDLPTYP,ACDOPT
 K ACDAGER,ACDAGE,ACDCC,ACDCEFLE,ACDCEGBL,ACDCEIEN,ACDCOMC,ACDCOMCL,ACDCOMM,ACDCOMT,ACDCOMTL,ACDCONT,ACDCONTL,ACDCS,ACDDDIFF,ACDDE,ACDDECSN,ACDDFN
 K ACDDFNP,ACDDL,ACDDOV,ACDDOV1,ACDDUZZ,ACDFLG,ACDIIEN,ACDINR,ACDIO,ACDLC,ACDLI,ACDLT,ACDMODE,ACDMODEE,ACDOPAT
 K ACDPDD,ACDPRD,ACDPROV,ACDPROVN,ACDQ,ACDRVOF,ACDRVON,ACDSEX,ACDSTA,ACDSTACD,ACDSTANM,ACDTC,ACDTDC,ACDTRB,ACDTRBCD,ACDTRBN,ACDVCNT,ACDVDTE,ACDVDTI,ACDVET,ACDVIEN
 K ACDVISP,ACDX,ACDY,ACDY2
 K ACDDAP,ACDDTA,ACDGA,ACDID,ACDPROBS,ACDSTAT,ACDTDCR
 K IO("Q")
 D ^XBFMK
 D KILL^AUPNPAT
 K ^TMP("ACD",$J)
 Q
 ;
K ; KILLS FOR CALLED ACD ROUTINES
 K ACD,ACD80,ACDA,ACDBWP,ACDCSORI,ACDDA,ACDDDL,ACDDL,ACDDUZ,ACDIIF,ACDLINE,ACDMLEV,ACDMULT,ACDN0,ACDNEWCS,ACDPNTR,ACDUPDT,ACDQUIT,ACDUZ,ACDVPGM,ACDXXX
 K ACDAAR,ACDAE,ACDAUF,ACDBS,ACDCIT,ACDCLIV,ACDDH,ACDDIF,ACDDTP,ACDDUA,ACDDUD,ACDES,ACDFOLL,ACDFOLMO,ACDLIST,ACDLP,ACDOTDIS,ACDOTHRS,ACDP,ACDP1,ACDPG,ACDPLAA
 K ACDPLAA1,ACDPLAR,ACDPLAR1,ACDPP,ACDPROBP,ACDPROVP,ACDPS,ACDPTA,ACDPTP,ACDSS,ACDSTATE,ACDSTATN,ACDSUS,ACDTRIB,ACDTRIBN
 K ACDOK,ACDIVIEN
 Q
 ;
MENUXIT ; EP-KILLS FOR MENU EXIT ACTION
 I $G(XQY0)'="",XQY0'=$G(ACDTOP) Q  ;   quit if not entry menu
 K IO("Q")
 D ^XBFMK
 D KILL^AUPNPAT
 K ^TMP("ACD",$J)
 D EN^XBVK("ACD")
 Q