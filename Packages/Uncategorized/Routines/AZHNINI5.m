AZHNINI5 ; ; 05-AUG-1998
 ;;4.1T4;AZHN DALE'S WORK PACKAGE;;AUG 05, 1998
 K ^UTILITY("DIF",$J) S DIFRDIFI=1 F I=1:1:0 S ^UTILITY("DIF",$J,DIFRDIFI)=$T(IXF+I),DIFRDIFI=DIFRDIFI+1
 Q
IXF ;;AZHN DALE'S WORK PACKAGE^AZHN
