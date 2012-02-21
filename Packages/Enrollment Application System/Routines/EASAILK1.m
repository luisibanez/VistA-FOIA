EASAILK1 ;ALB/BRM - Patient Address Inquiry ; 3/10/03 3:42pm
 ;;1.0;ENROLLMENT APPLICATION SYSTEM;**13,29,39**;Mar 15, 2001
 ;
PATADDR ;view patient address
 ;
 N PATNAM,IENS,ZTSAVE
 N DTOUT,DUOUT,DIRUT,DIROUT,%ZIS,DIC,DA,DIQ,DLAYGO,Y,X
 ;
 ; prompt user for patient name and device
 S DIC="^DPT(",DIC(0)="AEMQ" D ^DIC
 Q:($D(DTOUT)!$D(DUOUT)!$D(DIRUT)!$D(DIROUT)!(Y=-1))
 S %ZIS="Q"
 S IENS=+Y_",",PATNAM=$P(Y,"^",2)
 S ZTSAVE("IENS")="",ZTSAVE("PATNAM")=""
 D EN^XUTMDEVQ("QUE^EASAILK1","PATIENT ADDRESS INQUIRY",.ZTSAVE,.%ZIS)
 Q
QUE ;
 N OK,FLD,ARY,PATADDR,ERR,ARRAY
 ;
 D GETS^DIQ(2,IENS,".111:.121","E","PATADDR","ERR")
 W !?11,"Patient Name: ",?26,PATNAM
 ;
 ; exit if error occurs during DIQ call
 I $D(ERR) W !!?11,"*** Address could not be determined ***",!! G END
 ;
 ; exit if there is no address for patient
 S FLD="",OK=0
 F  S FLD=$O(PATADDR(2,IENS,FLD)) Q:'FLD!(OK)  S:$G(PATADDR(2,IENS,FLD,"E"))]"" OK=1
 I 'OK W !!?11,"*** No Address On File For This Patient ***",!! G END
 ;
 ; display address information
 W !?8,"Patient Address: ",?26,$S($G(PATADDR(2,IENS,.111,"E"))]"":$G(PATADDR(2,IENS,.111,"E")),1:"UNKNOWN STREET ADDRESS")
 W:$G(PATADDR(2,IENS,.112,"E"))]"" !?26,$G(PATADDR(2,IENS,.112,"E"))
 W:$G(PATADDR(2,IENS,.113,"E"))]"" !?26,$G(PATADDR(2,IENS,.113,"E"))
 W !?26,$S($G(PATADDR(2,IENS,.114,"E"))]"":$G(PATADDR(2,IENS,.114,"E")),1:"UNKNOWN CITY")_", "
 W $S($G(PATADDR(2,IENS,.115,"E"))]"":$G(PATADDR(2,IENS,.115,"E")),1:"UNKNOWN STATE")_" "
 W:$G(PATADDR(2,IENS,.1112,"E"))]"" $G(PATADDR(2,IENS,.1112,"E"))
 W !?2,"Bad Address Indicator: ",?26,$G(PATADDR(2,IENS,.121,"E"))
 W !!?4,"Address Change Date: ",?26,$G(PATADDR(2,IENS,.118,"E"))
 W !?2,"Address Change Source: ",?26,$G(PATADDR(2,IENS,.119,"E"))
 W:$G(PATADDR(2,IENS,.119,"E"))="VAMC" !?4,"Address Change Site: ",?26,$G(PATADDR(2,IENS,.12,"E"))
 W !!
END ; common exit point - reset device and prompt user for another name
 K %ZIS D ^%ZISC,HOME^%ZIS
 G PATADDR
 Q
