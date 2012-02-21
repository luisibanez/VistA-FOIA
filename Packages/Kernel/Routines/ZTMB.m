ZTMB ;SEA/RDS-Taskman: Manager, Boot/ Option, ZTMRESTART ;28 May 2003 2:18 pm
 ;;8.0;KERNEL;**275**;Jul 10, 1995
 ;
 ;NOTE:  On DataTree systems:
 ;For automatic startup of TaskMan at boot, save as %ustart in SYS.
 ;In %ustart, remove ';' from the next two lines:
 ;I $P($ZVER,"/",2)>4.0,$P($ZVER,"/",2)<4.3 VIEW 1:296:$C(2) ;increase name table allocation
 ;I  ZZSWITCH 256 ;display current namespace
 ;
START ;Start Taskmanager
 D INIT S ZTMB="START"
 I ZTOS["M/SQL-PDP" J START^%ZTM0:ZTUCI Q
 I ZTOS["DTM" G DTM
 I ZTOS["GT.M" J START^%ZTM0 Q
 I ZTOS'["VAX DSM" J START^%ZTM0[ZTUCI] Q
 I ZTOS["VAX DSM" G VXD
 W !,"Taskman NOT Started"
 Q
VXD X "S %=($ZC(%GETJPI,$J,""CURPRIV"")[""SHARE"")" I % W !,"Don't start TaskMan with the SHARE privilege" Q
 S Z=0,%=$O(^%ZIS(14.7,"B",ZTPAIR,0)),ZTMODE=$P($G(^%ZIS(14.7,+%,0)),U,10)
VXD2 I Z,$$EC^%ZOSV["access not authorized"!($$EC^%ZOSV["no privilege") W !!,"You lack the system privilege to start TaskMan." H 2 Q
 I Z,$$EC^%ZOSV'["duplicate name" W !!,"The following error has prevented TaskMan from starting:",!,$$EC^%ZOSV H 2 Q
 S X="VXD2",@^%ZOSF("TRAP"),Z=Z+1
 I ZTMODE="" S %=ZTMB_"^%ZTM0:(OPTION=""/UCI=""_ZTUCI,NAME=""TaskMan ""_$E(^%ZOSF(""VOL""),1,3)_"" ""_Z)" J @% Q
 ;Remove the '/NOLOG' if you want a log file for trouble shouting
 I ZTMODE]"" S %SPAWN="SUBMIT/NOPRINT/NOLOG/USER=TASKMAN/QUEUE=TM$"_ZTNODE_" DHCP$TASKMAN:ZTMWDCL/PARAM=("_ZTMODE_","_(ZTMB["RE")_")" D ^%SPAWN
 Q
 ;
DTM I ZTMB="START" D NULLDEV F DEV=10:1:19 O DEV:("W":NULLDEV):0 C DEV
 S Z=0
DTM2 S X="DTM2",@^%ZOSF("TRAP"),Z=Z+1,%=ZTMB_"^%ZTM0:(NSPACE="""_ZTUCI_""":STRSTK=8000:LVMEM=12000:NAME=""TaskMan "_$E(^%ZOSF("VOL"),1,3)_" "_Z_""")" J @% Q
 ;
RESTART ;Restart Taskmanager
 D INIT
 I $D(^%ZOSF("SIGNOFF")) X ^("SIGNOFF") I  D  Q
 . W $C(7),!,"NOTE THAT THE SYSTEM IS IN A 'SIGNOFF' STATE,",!?4,"WHICH PROBABLY EXPLAINS WHY TASKS ARE NOT RUNNING!!",!
 S ZTMULT=0
 I $S($D(^%ZTSCH("RUN"))[0:0,^("RUN")-$H:0,1:$P($H,",",2)-150'>$P(^("RUN"),",",2)) W !,"TASKMAN IS ALREADY RUNNING" S ZTMULT=1
 I ZTOS["VAX DSM" I $ZC(%GETJPI,$J,"CURPRIV")["SHARE" D  Q
 . W !,"Don't start TaskMan with the SHARE privilege" Q
 F %ZTI=0:0 D  Q:"YESyes^NOno"[%Y
 . W !,"ARE YOU SURE YOU WANT TO RESTART ",$S(ZTMULT:"ANOTHER ",1:""),"TASKMAN? NO//"
 . R %Y:$S($D(DTIME)#2:DTIME,1:60) S:'$T %Y="^" Q:"YESyes^NOno"[%Y
 . W:'$T "*TIMEOUT*" W:%Y'["?" *7 D HELP1:%Y'["??",HELP2:%Y["??"
 I %Y=""!("YESyes"'[%Y) W "  (NO)",!,*7,"<NO ACTION TAKEN>",! Q
 W "  (YES)",!,"Restarting..."
 S ZTMB="RESTART"
 I ZTOS["M/SQL-PDP" J RESTART^%ZTM0:ZTUCI D DONE Q
 I ZTOS["DTM" G DTM
 I ZTOS["GT.M" J RESTART^%ZTM0 D DONE Q
 I ZTOS'["VAX DSM" J RESTART^%ZTM0[ZTUCI] D DONE Q
 I ZTOS["VAX DSM" G VXD
 W !!,$C(7),"Taskman NOT Restared",!
 Q
INIT S U="^",ZTOS=^%ZOSF("OS"),ZTUCI=$P(^%ZOSF("MGR"),",")
 D GETENV^%ZOSV S ZTVOL=$P(Y,U,2),ZTNODE=$P(Y,U,3),ZTPAIR=$P(Y,U,4)
 Q
 ;
NULLDEV ;SELECT NULL DEVICE (DTM OS Dependent)
 D HWTYPE S NULLDEV="NUL" I %HW'="PC" S NULLDEV="[NUL]"
 K %HW,%HW Q
 ;
HWTYPE ;HARDWARE TYPE(DTM OS Dependent)
 K %HW S %H=$S($P($ZVER,"/",2)<4:$V(4,3,-1),1:$V(1,3,-1)) ;get hardware type number
 S %HW=$S(%H<10:"WS",%H<20:"MF",%H<64:"?",%H<129:"PC",1:"?")
 Q
 ;
HELP1 ;RESTART--improved help for the confirmation prompt.
 W !!?5,"Answer must be YES or NO."
 W !?5,"Answer YES to restart ",$S(ZTMULT:"another ",1:""),"TaskMan.",!
 Q
 ;
HELP2 ;RESTART--??-help for confirmation prompt
 W !!?5,"TaskMan must be running in each library uci on the system for tasks to run."
 W !?5,"One TaskMan per library uci should be enough for all but the busiest sites."
 W !?5,"The System Status option and the Monitor TaskMan option can help determine"
 W !?5,"whether a TaskMan is running on this volume set."
 W !!?5,"If you are still uncertain how to respond, answer NO and consult your"
 W !?5,"documentation or your support ISC.",!
 Q
 ;
DONE ;RESTART--feedback after restarting TaskMan
 W "TaskMan restarted!",! Q
 ;
