MCEPROC ;WISC/DCB-Printer driver ;12/13/93
 ;;2.3;Medicine;;09/13/1996
 N TEMP,MCTYPE
 S TEMP=$G(^MCAR(697.2,MCARP,0)) Q:MCARP=0
 S MCARP="",MCARP=+$O(^MCAR(697.2,"B",MCPRO,MCARP)),MCTYPE=$E($P(XQY0,U,1),2,2),MCROUT=$P(TEMP,U,8),MCFILE=+$P($P(TEMP,U,2),"MCAR(",2),MCESON=+$P(TEMP,U,14),MCESSEC=0,MCESKEY=$P(TEMP,U,15)
 I MCESKEY,MCESON S:$D(^XUSEC(MCESKEY,DUZ)) MCESSEC=1
 I MCFILE=699 S MCARCODE=$S($P(XQY0,U,1)["GI":"G",1:"P")
 S MCBS=$S(MCTYPE["B":1,1:0)
 I MCTYPE["P"!(MCTYPE["MFD") D PRINT Q
 D EDIT Q
EDIT ;
 S MCEBRIEF=$P(TEMP,U,11),MCEFULL=$P(TEMP,U,10) Q
PRINT ;
 S MCPRTRTN=$P(TEMP,U,5)_"^"_$P(TEMP,U,6) Q
KILLVAR ; Kill off the variables that was set by EDIT and PRINT.
 K MCARP,MCFILE,MCESON,MCESKEY,MCROUT,MCARCODE,MCTYPE
 K MCEBRIEF,MCEFULL,MCPBRIEF,MCPFULL,MCPRTRTN,MCBS
 Q