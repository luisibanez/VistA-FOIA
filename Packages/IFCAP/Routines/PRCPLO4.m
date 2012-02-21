PRCPLO4 ;WOIFO/DAP- Option to allow users to reset CLRS related parameters
V ;;5.1;IFCAP;**83**;Oct 20,2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
ENT ;This allows users to enter new values for the parameters associated 
 ;with PRC*5.1*83 (CLRS) by prompting them for a new value for each 
 ;parameter after presenting the current value.  Values are screened 
 ;for validity and errors in setting the parameters are returned to 
 ;the screen. IA #2263 can be referenced for further information on the
 ;^XPAR calls utilized here.
 ;  
 N PRCP1,PRCP2,PRCP3,PRCP4,PRCPV,PRCPX,PRCPY,PRCPZ,ERR
 D PRR
 D PGR
 D PIR
 D PED
 Q
 ;
PRR ;Provide current value of and then prompt to modify the PRCPLO REPORT RANGE parameter
 ;
 S ERR=0
 W ! D EN^DDIOL("Stock on Hand Report Range: "_$$GET^XPAR("SYS","PRCPLO REPORT RANGE",1,"Q")_"//")
 R PRCP1:60
 I PRCP1="^" Q
 I PRCP1="" Q
 I PRCP1'?1N.N S ERR=1
 I PRCP1>999 S ERR=1
 I PRCP1<0 S ERR=1
 I ERR=1 W ! D EN^DDIOL("Please enter a number between 0-999 with no decimal digits.") Q
 D EN^XPAR("SYS","PRCPLO REPORT RANGE",1,PRCP1,.PRCPX)
 I PRCPX=0 W ! D EN^DDIOL("Stock on Hand Report Range successfully set to "_PRCP1)
 I PRCPX'=0 W ! D EN^DDIOL("Error while trying to edit the Stock on Hand Report Range:") W ! D EN^DDIOL($P(PRCPX,"^",2))
 Q
 ;
PIR ;Provide current value of and then prompt to modify the PRCPLO INACTIVITY RANGE parameter
 ;
 S ERR=0
 W ! D EN^DDIOL("Stock Status Report Inactivity Range: "_$$GET^XPAR("SYS","PRCPLO INACTIVITY RANGE",1,"Q")_"//")
 R PRCP2:60
 I PRCP2="^" Q
 I PRCP2="" Q
 I PRCP2'?1N.N S ERR=1
 I PRCP2>999 S ERR=1
 I PRCP2<0 S ERR=1
 I ERR=1 W ! D EN^DDIOL("Please enter a number between 0-999 with no decimal digits.") Q
 D EN^XPAR("SYS","PRCPLO INACTIVITY RANGE",1,PRCP2,.PRCPY)
 I PRCPY=0 W ! D EN^DDIOL("Stock Status Report Inactivity Range successfully set to "_PRCP2)
 I PRCPY'=0 W ! D EN^DDIOL("Error while trying to edit the Stock Status Report Inactivity Range:") W ! D EN^DDIOL($P(PRCPY,"^",2))
 Q
 ;
PGR ;Provide current value of and then prompt to modify the PRCPLO GREATER THAN RANGE parameter
 ;
 S ERR=0
 W ! D EN^DDIOL("Stock on Hand Report Greater Than Range: "_$$GET^XPAR("SYS","PRCPLO GREATER THAN RANGE",1,"Q")_"//")
 R PRCP3:60
 I PRCP3="^" Q
 I PRCP3="" Q
 I PRCP3'?1N.N S ERR=1
 I PRCP3>999 S ERR=1
 I PRCP3<0 S ERR=1
 I ERR=1 W ! D EN^DDIOL("Please enter a number between 0-999 with no decimal digits.") Q
 D EN^XPAR("SYS","PRCPLO GREATER THAN RANGE",1,PRCP3,.PRCPZ)
 I PRCPZ=0 W ! D EN^DDIOL("Stock on Hand Report Greater Than Range successfully set to "_PRCP3)
 I PRCPZ'=0 W ! D EN^DDIOL("Error while trying to edit the Stock on Hand Report Greater Than Range:") W ! D EN^DDIOL($P(PRCPZ,"^",2))
 ;
 Q
 ;
PED ;Provide current value of and then prompt to modify the PRCPLO EXTRACT DIRECTORY parameter
 ;
 S ERR=0
 W ! D EN^DDIOL("CLRS Extract Directory: "_$$GET^XPAR("SYS","PRCPLO EXTRACT DIRECTORY",1,"Q")_"//")
 R PRCP4:60
 I PRCP4="^" Q
 I PRCP4="" Q
 I PRCP4="??" S ERR=1
 I $L(PRCP4)>245 S ERR=1
 I ERR=1 W ! D EN^DDIOL("Please enter a free text string between 1-245 characters.") Q
 D EN^XPAR("SYS","PRCPLO EXTRACT DIRECTORY",1,PRCP4,.PRCPV)
 I PRCPV=0 W ! D EN^DDIOL("CLRS Extract Directory successfully set to "_PRCP4)
 I PRCPV'=0 W ! D EN^DDIOL("Error while trying to edit the CLRS Extract Directory:") W ! D EN^DDIOL($P(PRCPV,"^",2))
 ;
 Q
