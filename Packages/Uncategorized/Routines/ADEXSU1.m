ADEXSU1 ; IHS/HQT/MJL  - DENTAL EXTRACT PART 3 ;  [ 05/12/1999  5:04 PM ]
 ;;6.0;ADE;**1**;MAY 12, 1999
START ;EP
 S ADERC=0
 U IO
 W !!!,?10,"D E N T A L  D A T A  E X T R A C T I O N   B E G U N",!
 ;K ^ADENDATA ;^ADENDATA is a transient working global
 D:$D(^ADENDATA)
 .S ADESUB=""
 .F  S ADESUB=$O(^ADENDATA(ADESUB)) Q:ADESUB=""  K ^ADENDATA(ADESUB)
 .K ADESUB
 I $D(ADERERUN) D
 . Q:'$D(ADEXDA)
 . S ADELETE="@"
 . S DIK="^ADELOG(",DA=ADEXDA
 . D ^DIK
 . K ADELETE,DR,DIE,DIDEL
 I '$D(ADEREX) D
 . N DIC,X,DR,ADELAST
 . S DIC="^ADELOG(",DIC(0)="L",X=ADEXDT
 . S DIC("DR")="1///"_ADEBDT_";2///"_ADEND_";3///0;4///D;5///ABORTED"
 . S ADELAST=1
 . K DD,DO
 . D FILE^DICN
 . S ADEXDA=+Y
 . K DIC,X,DR,ADELAST
 D CHKY1
 ;
 I ADERC S ^ADENDATA(0)=$P(^AUTTLOC($P(^AUTTSITE(1,0),U,1),0),U,10)_U_$P(^DIC(4,$P(^AUTTSITE(1,0),U,1),0),U,1)_U_(17000000+ADEXDT)_U_(17000000+ADEBDT)_U_(17000000+ADEND)_"^^"_ADERC
 ;
 ;If it's NOT a re-extract, update both RECORD COUNT and STATUS
 ;If it IS a re-extract, update record count ONLY
 D
 . N DIE,DR,DA,ADELAST
 . S DIE="^ADELOG(",DA=ADEXDA,ADELAST=1
 . S DR="3///"_ADERC_";5///COMPLETED NORMALLY"
 . I $D(ADEREX) S DR="3///"_ADERC
 . D ^DIE
 . K DIE,DR,DA,ADELAST
 G FIN^ADEXSU3
 ;
CHKY1 ;GET FIRST DATE FROM "AF" XREF
 W !,?15,"RECORD SCANNING "
 S ADEDT=ADEBDT-1
 F  S ADEDT=$O(^ADEPCD("AC",ADEDT)) Q:(ADEDT="")!(ADEDT>ADEND)  W "." D CHKY2
 W !,?15,"COMPLETED",!
 Q
CHKY2 S ADEA=0
 I $D(^%ZOSF("TRAP")) S X="ERR^ADEXSU3",@^%ZOSF("TRAP")
RESTART ;EP
 F  S ADEA=$O(^ADEPCD("AC",ADEDT,ADEA)) Q:'+ADEA  D CHKY3
 Q
CHKY3 Q:'$D(^ADEPCD(ADEA,0))
 S ADERROR=0,ADEVNODE=^ADEPCD(ADEA,0)
 G:'$D(ADEREX) CHKY3B
 Q:$P(^ADEPCD(ADEA,0),U,6)'=ADEXDT
 D EXT1 Q:ADERROR  D VIS1 Q
CHKY3B Q:$P(^ADEPCD(ADEA,0),U,6)
 I 'ADECHS,$P(^ADEPCD(ADEA,0),U,9)="c" Q
 D EXT1 Q:ADERROR  D VIS1 Q:ADERROR
 S $P(^ADEPCD(ADEA,0),U,6)=ADEXDT,^ADEPCD("AI",ADEXDT,ADEA)=""
 Q
EXT1 ;
 S (ADEDOB,ADESEX,ADEZIP,ADENAT,ADEVDTE,ADEVDTP,ADETCOST,ADEASF,ADEHRN,ADESITE)=""
 S ADEDFN=$P(ADEVNODE,U)
 G:'$D(^DPT(ADEDFN,0)) ERR4^ADEXSU2
 S ADENODE=^DPT(ADEDFN,0)
 ;S ADEDOB=$E($P(ADENODE,U,3),2,7)
 S ADEDOB=$P(ADENODE,U,3)
 S ADESEX=$P(ADENODE,U,2)
 S:$D(^DPT(ADEDFN,.11)) ADEZIP=$P(^DPT(ADEDFN,.11),U,6)
 I '$D(^AUPNPAT(ADEDFN,11)) S ADENAT="I" Q
 S ADENAT=$P(^AUPNPAT(ADEDFN,11),U,11)
 I ADENAT="" S ADENAT="I" Q
 S ADENAT=$P(^AUTTBEN(ADENAT,0),U,2)
 S ADENAT=$S(ADENAT="01":"I",1:"O")
 Q
 ;
VIS1 ;S ADEVDTE=$E($P(ADEVNODE,U,2),2,7) ;MJL 4/26/99
 ;S ADEVDTE=$P(ADEVNODE,U,2) ;MJL 4/26/99 Need the entire internal FileMan formatted visit date to convert to the CCYYMMDD format
 S ADEVDTE=$P(ADEVNODE,U,2)\1 ;MJL 5/12/99 Performed integer divide by 1 to remove fractional part (time portion)
 I ADEVDTE="" G ERR5^ADEXSU2
 S ADEREPD=$P(ADEVNODE,U,4)
 I ADEREPD="" G ERR6^ADEXSU2
 S ADEVDTP=$S($D(^DIC(16,ADEREPD,0)):$P(^DIC(16,ADEREPD,0),U,9),1:"")
 I ADEVDTP="" G ERR12^ADEXSU2
 S ADETYPE=$S($P(ADEVNODE,U,9)="c":"K",1:"D")
 S ADESITE=$P(ADEVNODE,U,3)
 I ADESITE="" G ERR3^ADEXSU2
 I '$D(^AUTTLOC(ADESITE,0)) G ERR3^ADEXSU2
 S ADEASF=$P(^AUTTLOC(ADESITE,0),U,10) ;G:ADEASF'?6.6N ERR2^ADEXSU2
 S ADEHRN=$S($D(^AUPNPAT(ADEDFN,41,ADESITE,0)):$E(1000000+$P(^(0),U,2),2,7),1:"000000")
 S ADETCOST=$P(ADEVNODE,U,8)
 S:ADETCOST]"" ADETCOST=$E(1000000+(ADETCOST*100\1),2,7)
 S ADEASITE=$E(ADEASF,1,2),ADESUFAC=$E(ADEASF,3,6)
 I '$D(^ADEPCD(ADEA,"ADA","B")) G ERR10^ADEXSU2
 S ADESVCS=""
 S ADEADACP=0
 F ADEIDX=1:1:15 S ADEADACP=$O(^ADEPCD(ADEA,"ADA","B",ADEADACP)) Q:ADEADACP=""  D ADAQ
 S ADERC=ADERC+1,^ADENDATA(ADERC)="AD1"_U_ADENAT_U_ADETYPE_U_ADEASITE_U_ADEVDTP_U_ADESUFAC_U_(17000000+ADEVDTE)_U_U_(17000000+ADEDOB)_U_ADESEX_U_ADEASF_ADEHRN_U_ADEZIP_U_U_ADETCOST_U_ADESVCS
 Q
ADAQ Q:'$D(^AUTTADA(ADEADACP,0))
 S ADEC=0,ADEADAQ=0,ADEADAF=0
 ;
ADAQ1 S ADEC=$O(^ADEPCD(ADEA,"ADA","B",ADEADACP,ADEC))
 G:ADEC="" ADAQ2
 I '$D(^ADEPCD(ADEA,"ADA",ADEC,0)) G ADAQ1
 I $P(^ADEPCD(ADEA,"ADA",ADEC,0),U,5)]"" G ADAQ1
 S ADEADAQ=ADEADAQ+1
 S ADEADAF=ADEADAF+$P(^ADEPCD(ADEA,"ADA",ADEC,0),U,3)
 G ADAQ1
 ;
ADAQ2 S ADECOD=$P(^AUTTADA(ADEADACP,0),U)
 Q:"0191;0192;0193;0194;0195;0196;0197;0198;0199"[ADECOD
 S ADEADAQ=$E(100+ADEADAQ,2,3)
 S ADEADAF=$E(100000+$J(ADEADAF,0,0),2,6)
 S ADESVCS=ADESVCS_(ADECOD_ADEADAQ_ADEADAF)
 Q
