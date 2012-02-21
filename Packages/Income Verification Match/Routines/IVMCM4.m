IVMCM4 ;ALB/SEK - ADD DCD NEW INDIVIDUAL ANNUAL INCOME FILE ENTRIES ; 02-MAY-95
 ;;2.0;INCOME VERIFICATION MATCH;**17**;21-OCT-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
EN ; this routine will add entries to INDIVIDUAL ANNUAL INCOME file
 ; (408.21)
 ;
 ; DFN    Patient file IEN
 ; DGPRI  Patient Relation IEN
 ; DGLY   Last Year
 ; DGINI  New Individual Annual Income IEN
 ; IVMSEG ZIC record for veteran or spouse or dependent
 ; IVM0   408.21 0 node pieces 8-20
 ; IVM1          1 node pieces 1-3
 ; IVM2          2 node pieces 1-5
 ;
 N IVM0,IVM1,IVM2,IVMC
 S DGINI=$$ADDIN^DGMTU2(DFN,DGPRI,DGLY)
 ;
 ; if can't create stub notify site & IVM Center
 I DGINI'>0 D  Q
 .S (IVMTEXT(6),HLERR)="Can't create stub for file 408.21"
 .D ERRBULL^IVMPREC7,MAIL^IVMUFNC("DGMT MT/CT UPLOAD ALERTS")
 .S IVMFERR=""
 ;
EN1 ; add 1 node for vet & child
 ; add 2 node for vet & spouse
 ;
 ; - zero node:pieces 8-20
 F IVMC=3:1:12 S:$P(IVMSEG,"^",IVMC)=HLQ $P(IVMSEG,"^",IVMC)=""
 S IVM0=$P(IVMSEG,"^",3,12)
 ;
 I IVMSPCHV'="S" F IVMC=13:1:15 S:$P(IVMSEG,"^",IVMC)=HLQ $P(IVMSEG,"^",IVMC)=""
 I IVMSPCHV'="S" S IVM1=$P(IVMSEG,"^",13,15)
 I IVMSPCHV'="C" F IVMC=16:1:20 S:$P(IVMSEG,"^",IVMC)=HLQ $P(IVMSEG,"^",IVMC)=""
 I IVMSPCHV'="C" S IVM2=$P(IVMSEG,"^",16,20)
 S DIK="^DGMT(408.21,"
 L +^DGMT(408.21,DGINI) S $P(^DGMT(408.21,DGINI,0),"^",8,20)=IVM0,DA=DGINI S:IVMSPCHV'="S" ^(1)=IVM1 S:IVMSPCHV'="C" ^(2)=IVM2
 D IX1^DIK L -^DGMT(408.21,DGINI)
 K DA,DIK
 Q
