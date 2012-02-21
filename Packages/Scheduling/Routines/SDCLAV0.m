SDCLAV0 ;ALB/LDB - OUTPUT PATTERNS (cont.) ; 05 Mar 99 11:31 AM
 ;;5.3;Scheduling;**184,439**;Aug 13, 1993
 I 'VAUTC F SDC=0:0 S SDC=$O(VAUTC(SDC)) Q:SDC'>0  S SDV=VAUTC(SDC) D:VAUTD!($D(VAUTD(+$P(^SC(SDC,0),"^",15))))!('$P(^(0),"^",15)&$D(VAUTD($P(^DG(43,1,"GL"),"^",3)))) S1
 I VAUTC F SDC=0:0 S SDC=$O(^SC(SDC)) Q:'SDC  I $P(^(SDC,0),"^",3)="C" D:VAUTD!($D(VAUTD(+$P(^(0),"^",15))))!('$P(^(0),"^",15)&$D(VAUTD($P(^DG(43,1,"GL"),"^",3)))) S1
 I $D(^UTILITY($J,"SDNMS")) D S2^SDCLAV1
 S DGTCH="CLINIC AVAILABILITY REPORT^CLINIC^PAGE#" D:$E(IOST,1,2)="P-" TP^DGUTL K SDBD,SDCI,SDED D END^SDCLAV Q
S1 S SD=^SC(SDC,0),D=$S($P(SD,"^",15):$P(SD,"^",15),1:$P(^DG(43,1,"GL"),"^",3)),SD5=0,SDNM=$P(SD,"^")
 S $P(^UTILITY($J,"SDNMS",D,SDNM),"^",3)=SDC
 Q
NM ;called by SDCLAV1
 F SDAP1=0:0 S SDAP1=$O(^SC(SDC,"S",SDAP,1,SDAP1)) Q:SDAP1'>0  D NM1
 K M1,SDN1,SDN2,SDN3,SDC3,SDAP1  ; SD*5.3*439 added Kill of local vars
 Q
NM1 S SDN1=+^SC(SDC,"S",SDAP,1,SDAP1,0),M1=$P(^(0),"^",2),SDC3=$P(^(0),"^",9),SDN2=$P(^DPT(+SDN1,0),"^"),SDN3=$P(^(0),"^",9),SDN3=$S(SDN3="":"UNKNOWN",1:SDN3) I $D(SDCI) D NM2 Q
 ; SD*5.3*439 added quit if clinic in "S" node not = to selected clinic
 I '$D(SDCI),$D(^DPT(SDN1,"S",SDAP,0)),$P(^(0),"^",2)'["C",$P(^(0),"^",2)'="N",$P(^(0),"^",2)'="NA" Q:$P(^(0),U,1)'=SDC  D NM2 Q
 Q
NM2 S:$D(^DPT(SDN1,"S",SDAP,0)) ^UTILITY($J,"SDNMS",D,SDV,SDAP,SDN2,SDN3)=M1_$S(($P(^DPT(SDN1,"S",SDAP,0),"^",2)["C"):"^*",SDC3="C":"^*",($P(^(0),"^",2)="N"):"^**",($P(^(0),"^",2)="NA"):"^**",1:"")
 S:$D(^DPT(SDN1,"S",SDAP,0)) $P(^UTILITY($J,"SDNMS",D,SDV,SDAP,SDN2,SDN3),"^",3)=$S($P(^DPT(SDN1,"S",SDAP,0),"^",7)=4:"***",1:"")
 Q
