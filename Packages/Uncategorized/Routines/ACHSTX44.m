ACHSTX44 ; IHS/ADC/GTH - EXPORT DATA (5/9) - RECORD 4(VENDOR FOR AO/FI) ;  
 ;;3.1;CONTRACT HEALTH MGMT SYSTEM;;JUN 11, 2001
 ;
 I 'ACHSF211,'ACHSF12 S REASON=11 Q
 ;
 I VNDTXDT>VNDLUPD S RET=12 Q
 ;
B1A ;
 S ACHSEIN=$E(VNDEIN_$J("",10),1,10)_$E(VNDEINSF_$J("",1,2))
 S ACHSNAME=$E(VNDNAM_$J("",30),1,30)
 S ACHSPTYP=$E(VNDTYPE_"  ",1,2)
 ;
 S ACHSFAC=$E(ACHSAFAC_$J("",6),1,6)
 S X=$P(^AUTTVNDR(VNDPTR,11),U,7),X=$P(X,".")_$E($P(X,".",2)_"00",1,2),ACHSDAP=$E(X+10000000000,2,11)
 ;
 S ACHSUPDT=$E(VNDLUPD,4,7)_$E(VNDLUPD,2,3),ACHSUPDT("CC")=$E(VNDLUPD+17000000,1,2)
 I $L(ACHSUPDT)'=6 S ACHSUPDT=$J("",6),ACHSUPDT("CC")=$J("",2)
 ;
 S X=""
 F I=0:0 S I=$O(^AUTTVNDR(VNDPTR,"CN",I)) Q:'I  I $P(^(I,0),U,2)'>DT,$P(^(0),U,3)>DT S X=$P(^(0),U)
 S ACHSCN=$E(X_$J("",10),1,10)
 ;
 S ACHSRCT=ACHSRCT+1,ACHSRTYP(4)=ACHSRTYP(4)+1,^ACHSTXVN(ACHSRCT)="4A"_ACHSEIN_ACHSNAME_ACHSPTYP_VNDFNFC_ACHSFAC_ACHSDAP_ACHSUPDT_ACHSCN_ACHSDEST
 ;
 S PMFF=^ACHSTXVN(ACHSRCT) D ^ACHSTX99
 ;
 I VNDSTATE'="" S ACHSST=$P(^DIC(5,VNDSTATE,0),U,2)
 I VNDSTATE="" S ACHSST="  "
 S ACHS1099=$S($P(^AUTTVNDR(VNDPTR,11),U,6)]"":$P(^(11),U,6),1:" ")
 S X=$P(^AUTTVNDR(VNDPTR,11),U,9)
 F ACHS=1:1:$L(X) Q:ACHS>$L(X)  I $E(X,ACHS)'?1N S X=$E(X,1,ACHS-1)_$E(X,ACHS+1,99),ACHS=ACHS-1
 S X=$E(X,1,10),X=$J(X,10),ACHSFONE=X,X=$P(^AUTTSITE(1,0),U,2),ACHSAPN=$S($L(X)<1!($L(X)>2):"  ",$L(X)=1:" "_X,1:X)
 S ACHSRCT=ACHSRCT+1
 ;
 S ^ACHSTXVN(ACHSRCT)="4B"_$S($D(^AUTTVNDR(VNDPTR,13)):$E($P(^AUTTVNDR(VNDPTR,13),U)_$J("",30),1,30),1:"")
 S ^ACHSTXVN(ACHSRCT)=^ACHSTXVN(ACHSRCT)_$S($D(^AUTTVNDR(VNDPTR,13)):$E($P(^AUTTVNDR(VNDPTR,13),U,2)_$J("",20),1,20),1:"")
 S ^ACHSTXVN(ACHSRCT)=^ACHSTXVN(ACHSRCT)_ACHSST_$S($D(^AUTTVNDR(VNDPTR,13)):$E($P(^AUTTVNDR(VNDPTR,13),U,4)_$J("",9),1,9),1:"")_ACHS1099_ACHSFONE_ACHSAPN_ACHSUPDT("CC")_" "_ACHSDEST
 ;
 S PMFF=^ACHSTXVN(ACHSRCT) D ^ACHSTX99
 ;
 S ACHSRTYP(4)=ACHSRTYP(4)+1
 ; Update CHS TX DATE in VENDOR.
 D EDITVNDR^ACHSVDVA(VNDPTR,"1112///"_DT)
 S RET=0
 Q
 ;
