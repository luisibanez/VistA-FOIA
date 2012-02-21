ZISEDIT ;SFISC/AC - DEVICE EDIT ;11/9/92  17:00
 ;;8.0;KERNEL;;Jul 10, 1995
 ;
MT S ZISTYPE="MT",DIC("A")="Select Magtape Device: " D EDIT K ZISTYPE
 Q
 ;
SDP S ZISTYPE="SDP",DIC("A")="Select SDP Device: " D EDIT K ZISTYPE
 Q
 ;
SPL S ZISTYPE="SPL",DIC("A")="Select Spool Device: " D EDIT K ZISTYPE
 Q
 ;
HFS S ZISTYPE="HFS",DIC("A")="Select Host File Device: " D EDIT K ZISTYPE
 Q
 ;
CHAN S ZISTYPE="CHAN",DIC("A")="Select Network Channel: " D EDIT K ZISTYPE
 Q
 ;;7.1P0;Kernel;;
EDIT S DIC=3.5,DIC(0)="AEMQZL",DIC("S")="I $G(^(""TYPE""))="_""""_ZISTYPE_"""" D ^DIC
 I Y'>0 K DIC Q
 S DA=+Y I $P(Y,"^",3) S DIE=DIC,DR="2///"_ZISTYPE D ^DIE K DIE,DR
 S DR="[XUDEVICE "_ZISTYPE_"]",DDSFILE=3.5 D ^DDS
 K DA,DR,DDSFILE Q
