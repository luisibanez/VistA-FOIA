ABPVDATE ;DATE PROMPT UTILITY READER [ 06/02/91  9:18 AM ]
 ;;2.0;FACILITY PVT-INS TRACKING;*0*;IHS-OKC/KJR;AUGUST 7, 1991
INIT D DT^DICRW S U="^" K BDT,EDT
 ;
BDT S %DT("A")="Enter the BEGINNING DATE for this request: ",%DT="AEPX"
 S %DT(0)=DT*-1 W ! D ^%DT G:+Y<0 END S BDT=+Y
 ;
EDT S %DT("A")="Enter the ENDING DATE for this request: ",%DT="AEPX"
 S %DT(0)=DT*-1 W ! D ^%DT G:+Y<0 END S EDT=+Y
 I BDT>EDT D  G INIT
 .W *7,!!?10,"<<< INVALID DATES - THE END IS BEFORE THE BEGINNING >>>"
 ;
END K %DT,X,Y
 Q
