ACHSTX66 ; IHS/ADC/GTH - EXPORT DATA (7/9) - RECORD 6(PAY FOR AO) ;  
 ;;3.1;CONTRACT HEALTH MGMT SYSTEM;;JUN 11, 2001
 ;
 I 'ACHSF212 S RET=13 Q
 I ACHSTY'="P" S RET=3 Q
 I DESTN'="I" S RET=15 Q
 ;
 S ACHSEIN=$E(VNDEIN_VNDEINSF_$J("",12),1,12)
 ;
 S ACHSPTYP="  "
 I +VNDTYPE,$D(^AUTTVTYP(VNDTYPE,0)) S ACHSPTYP=$P(^(0),U)
 ;
 S ACHSHRN=CHART I CHART<1,$P(ACHSTRAN,U,3) S ACHSHRN=$$HRN^ACHS($P(ACHSTRAN,U,3),DUZ(2))
 ;
 S ACHSHRN=$E(ACHSHRN+1000000,2,7),ACHSCN=$E(CNTRPTR_$J("",10),1,10)
 S ACHSDCR=$E(DCRACCT+100,2,3),ACHSRCT=ACHSRCT+1,ACHSRTYP(6)=ACHSRTYP(6)+1
 ;
 S ^ACHSTXPD(ACHSRCT)="6A"_$E(ACHSDOCN,2,99)_TYPSER2_ORDDAT_"6"_ACHSAFAC_ACHSHRN_ACHSEIN_ACHSPTYP_VNDFNFC_ACHSCN_CAN_OCC_ACHSDCR_$J("",10)
 ;
 S PMFF=^ACHSTXPD(ACHSRCT) D ^ACHSTX99
 ;
 S X=$P(ACHSDOCR,U,9),X=$P(X,".",1)_$E($P(X,".",2)_"00",1,2),ACHSOAMT=$E(X+100000000,2,9)
 D IPA^ACHSTX8
 S ACHSIPA=$E(ACHSIPA,5,12),ACHSFULP=$S($P(ACHSTRAN,U,5)="P":2,1:1),X=$P(ACHSTRAN,U,3)
 G A3:+X<1,A4:$D(^DPT(X))
A3 ;
 S ACHSLNAM=$J("",20),ACHSFNAM=$J("",10)
 G A5
 ;
A4 ;
 S ACHSLNAM=$E($P($P(^DPT(X,0),U),",")_$J("",20),1,20),ACHSFNAM=$E($P($P(^DPT(X,0),U),",",2)_$J("",10),1,10)
A5 ;
 ;S ACHSWKLD=$E(+$P(ACHSTRAN,U,9)+1000,2,4),ACHSDOS=$P(ACHSTRAN,U,10),ACHSDOS=$E(ACHSDOS,4,7)_$E(ACHSDOS,2,3),ACHSDOS=$E(ACHSDOS,1,6),ACHSDOS=$J(ACHSDOS,6) ;ACHS*3*9 IV&V DATE FIX
 S ACHSWKLD=$E(+$P(ACHSTRAN,U,9)+1000,2,4),ACHSDOS=$P(ACHSTRAN,U,10) S:ACHSDOS="" ACHSDOS="       " ;ACHS*3*9 IV&V DATE FIX
 S X=$P(ACHSTRAN,U,8),X=$P(X,".",1)_$E($P(X,".",2)_"00",1,2),ACHSTHRD=$E(X+100000000,2,9)
 S ACHSRCT=ACHSRCT+1
 S ^ACHSTXPD(ACHSRCT)="6B"_ACHSOAMT_ACHSIPA_ACHSFULP_ACHSLNAM_ACHSFNAM_ACHSDOS_ACHSWKLD_ACHSTHRD_$J("",14)
 ;
 S PMFF=^ACHSTXPD(ACHSRCT) D ^ACHSTX99
 ;
 S ACHSRTYP(6)=ACHSRTYP(6)+1
 S RET=0
 ;
 Q
