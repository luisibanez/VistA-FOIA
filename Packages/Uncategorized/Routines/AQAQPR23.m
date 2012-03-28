AQAQPR23 ;IHS/ANMC/LJF - PROCEDURES BY PROVIDER(PCC DATA); [ 05/27/92  11:15 AM ]
 ;;2.2;STAFF CREDENTIALS;;01 OCT 1992
 ;
GETGRP ;EP;***> SUBRTN to print name of icd grouping
 S AQAQG=$O(^AQACPCLS("B",+$P(AQAQICD,"."),0)) Q:AQAQG=""
 S AQAQGRP=$P($G(^AQACPCLS(AQAQG,0)),U,2)  ;group pointer
 S AQAQGN=$G(^AQACPICD(AQAQGRP,0)),AQAQRNG=$P(AQAQGN,U)
 S AQAQGRP=$P(AQAQGN,U,2)_" ("_AQAQRNG_")"  ;name/range
 I $Y>(IOSL-6) D NEWPG^AQAQPR22 Q:AQAQSTOP=U
 W !! W ?80-$L(AQAQGRP)/2,AQAQGRP,! Q   ;print name & range
 ;
 ;
SUBCNT ;EP;***> SUBRTN to print subcount of icd grouping for provider
 I AQAQGCT=0 Q     ;no procedures for grouping
 W !,AQAQLIN2,!?27,"SUBCOUNT FOR ICD GROUP:  ",AQAQGCT,!,AQAQLINE,!
 S AQAQGCT=0,AQAQICDF=0 D GETGRP:AQAQICD'="" Q
 ;
 ;
PROVCNT ;EP;***> SUBRTN to print subcount for provider
 I AQAQGCT>0 D SUBCNT
 I $Y>(IOSL-5) D NEWPG^AQAQPR22 Q:AQAQSTOP=U
 W !?20,"TOTAL PROCEDURES FOR PROVIDER:  ",AQAQPCT
 W !,AQAQLINE S AQAQTCT=AQAQTCT+AQAQPCT,AQAQPCT=0
 Q
