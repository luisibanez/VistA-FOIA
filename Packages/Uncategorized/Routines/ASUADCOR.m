ASUADCOR ;DSD/DFM - DUE IN CORRECTION;  [ 04/15/98  2:31 PM ]
 ;;3.0;SAMS;**1**;AUG 20, 1993
 F  Q:$G(ASUREPLY("CORRECT"))="Y"  Q:$D(DTOUT)!($D(DUOUT))!($D(DIROUT))  D
 .Q:$D(DTOUT)!($D(DUOUT))!($D(DIROUT))  Q:ASUREPLY("CORRECT")="Y"
 .S DIR(0)="SB^Y:YES;N:NO;3:STATION;4:PURCHASE ORDER NUMBER;5:DATE DUE IN;6:ACCOUNT;7:SUB SUB ACTIVITY;8:INDEX;9:QUANTITY;10:VALUE"
 .D CORRECT^ASUAUYRN Q:ASUREPLY("CORRECT")="Y"  D
 ..D:ASUREPLY("CORRECT")="N"
 ...S DIR(0)="NOA^3:10:0"
 ...D GETFIELD^ASUAUYRN
 ..Q:$D(DTOUT)!($D(DUOUT))!($D(DIROUT))  Q:ASUREPLY("CORRECT")="Y"
 ..I ASUREPLY("CORRECT")="3" S DIR("B")=ASUTRNS(ASUTRNS,"STATION"),ASUTRNS(ASUTRNS,"STATION")="" D STAT^ASUAUAST
 ..I ASUREPLY("CORRECT")="4" D REQD^ASUAUPON
 ..I $E(ASUTRNS("TRANSACTION CODE"),2,2)'?1N I ASUREPLY("CORRECT")=5 S ASUV("ITEM #")=5 D ^ASUAUIDX
 ..I ASUREPLY("CORRECT")="5" D ^ASUADTDU
 ..I ASUREPLY("CORRECT")="6" S ASUV("ITEM #")=6 D ^ASUAUACC
 ..I ASUREPLY("CORRECT")="7" S ASUV("ITEM #")=7 D ^ASUAUSSA
 ..I ASUREPLY("CORRECT")="8" S ASUV("ITEM #")=8 D ^ASUAUIDX
 ..I ASUREPLY("CORRECT")="9" S ASUV("ITEM #")=9 D ^ASUAUQTY
 ..I ASUREPLY("CORRECT")="10" S ASUV("ITEM #")=10 D ^ASUAUVAL
 ..S ASUREPLY("CORRECT")="N" Q
 I ASUREPLY("CORRECT")="Y" D ^ASUADUPD
 K X,Y,ASUREPLY("CORRECT")
 Q
