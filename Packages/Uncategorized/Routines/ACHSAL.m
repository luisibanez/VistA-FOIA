ACHSAL ; IHS/ITSC/PMF - SPECIAL LOCAL OBLIGATION HEADER/DRIVER ;  [ 10/16/2001   8:16 AM ]
 ;;3.1;CONTRACT HEALTH MGMT SYSTEM;;JUN 11, 2001
 ;
 ;
 ;this program is the kickoff point for the creation of
 ;special obligation documents
A1 ;
 S ACHSSLOC="",ACHSACWK=ACHSFYWK(DUZ(2),ACHSCFY)
 I $D(^ACHS(9,DUZ(2),"FY",ACHSCFY,"W",ACHSACWK,0)),$P($G(^ACHS(9,DUZ(2),"FY",ACHSCFY,"W",ACHSACWK,0)),U,2)=DT W !!,*7,"  The Register Has Been CLOSED." S %=$$DIR^XBDIR("E") G END
 ;
 ;INIT VARS
 S (ACHSBLT,ACHSCAN,ACHSCONP,ACHSCOPT,ACHSDCR,ACHSDES,ACHSDEST)=""
 S (ACHSESDA,ACHSESDO,ACHSFDT,ACHSHON,ACHSHONN,ACHSORND)=""
 S (ACHSPROV,ACHSRMPC,ACHSSCC,ACHSSVDT,ACHSTDT,ACHSTYP,ACHSWKLD)=""
 ;
 K DFN
 S ACHSBLT="SPECIAL TRANSACTION"
 D ^ACHSA
 I '$D(DUOUT),'$D(DTOUT) G A1
END ;
 K DUOUT,B
 D EN^XBVK("ACHS"),^ACHSVAR
 Q
 ;
