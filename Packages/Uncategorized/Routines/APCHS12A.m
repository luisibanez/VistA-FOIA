APCHS12A ; IHS/CMI/LAB - PART 12A OF APCHS -- SUMMARY PRODUCTION COMPONENTS ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;
 ; ********** FLOWSHEET PRODUCTION **********
FLOWD ;ENTRY POINT
 S Y=-APCHSIVD\1+9999999 X APCHSCVD S APCHSDAT=Y
 S APCHSP="",$P(APCHSP,"-",APCHSMXL+9)="" X APCHSCKP Q:$D(APCHSQIT)  W:'APCHSNPG ?2,APCHSP,! D:APCHSNPG FLOWHD^APCHS12
 D FLOWCKP^APCHS12 Q:$D(APCHSQIT)
 W ?2,APCHSDAT
 F APCHSI=0:0 S APCHSI=$O(APCHSDB(APCHSI)) Q:'APCHSI  D FLOWCKP^APCHS12 Q:$D(APCHSQIT)  D FLOWD2 W !
 Q
FLOWD2 F APCHSJ=0:0 S APCHSJ=$O(APCHSTB(APCHSJ)) Q:'APCHSJ  W ?11+APCHSTB(APCHSJ),":",$G(APCHSDB(APCHSI,APCHSJ))
 Q
