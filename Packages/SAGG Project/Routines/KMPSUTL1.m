KMPSUTL1        ;OAK/KAK - SAGG Utilities ;01 SEP 97 11:15 am
 ;;1.8;SAGG PROJECT;**1,2,3**;Jul 26, 2004
 ;
 ; *** This code will be moved into a future CM Tools (KMPD) patch ***
 ;        
CONT(EXT)  ;-- function displays 'return to continue' message at bottom of page
 ;--------------------------------------------------------------------
 ; input:  0 = do not show 'to exit' text
 ;         1 = show 'to exit' text
 ; return: 0 = continue
 ;         1 = quit
 ;--------------------------------------------------------------------
 ;
 N X
 ;
 S EXT=+$G(EXT)
 F  Q:$Y>(IOSL-2)  W !
 W "Press RETURN to continue" W $S(EXT:" or '^' to exit: ",1:": ")
 R X:DTIME
 I X["^"!('$T) Q 1
 Q 0
 ;
MPLTF() ;-- returns the type of M platform
 ;---------------------------------------------------------------------
 ; Returns:  DSM    for DSM platform
 ;           CVMS   for Cache for OpenVMS platform
 ;           CWINNT for Cache for Windows NT platform
 ;---------------------------------------------------------------------
 ;
 N MPLTF,ZV
 ;
 S ZV=$ZV
 S MPLTF=$S(ZV["DSM":"DSM",ZV["VMS":"CVMS",ZV["Windows":"CWINNT",1:"UNK")
 Q MPLTF
 ;
TSKSTAT(OPT)       ;-- status of scheduled task option
 ;---------------------------------------------------------------------
 ; input  OPT = option name
 ; output RTN = status code^literal condition
 ;              ...^scheduled date@time (day)^numeric day-of-week
 ;              ...^expanded scheduled frequency^short form frequency
 ;              ...^task id^queued by^user status
 ;
 ; where status code^condition:
 ;            = 0^SCHEDULED
 ;            = 1^NOT SCHEDULED and 'scheduled date@time' will
 ;                   be UNKNOWN and 'numeric day of week' will be -1
 ;            = 2^NOT RESCHEDULED
 ;            = 3^MISSING when OPT does not exist
 ;            = 9^UNKNOWN
 ;
 ; where user status = ACTIVE or NOT ACTIVE
 ;---------------------------------------------------------------------
 ;
 N ACTV,DA,DAY,DOW,FREQ,RTN,TSK,TSKINFO,USER,Y
 ;
 S (DOW,FREQ)=-1
 S RTN="9^UNKNOWN^NO DATE^-1^UNKNOWN^^^UNKNOWN^NOT ACTIVE"
 ;
 I '$D(^DIC(19,"B",OPT)) S $P(RTN,U,1,2)="3^MISSING" Q RTN
 S DA=$O(^DIC(19,"B",OPT,0)),DA=+$O(^DIC(19.2,"B",DA,0))
 S TSKINFO=$G(^DIC(19.2,DA,0)),(DOW,Y)=$P(TSKINFO,U,2),FREQ=$P(TSKINFO,U,6)
 D:+Y DD^%DT S $P(TSKINFO,U,2)=Y
 I DOW'="" S DAY=$$DOW^XLFDT(DOW),DOW=$$DOW^XLFDT(DOW,1)
 S TSK=+$G(^DIC(19.2,+DA,1))
 I (DOW="")!(TSK="") S $P(RTN,U,1,2)="1^NOT SCHEDULED"
 E  D
 .S $P(RTN,U,1,2)="0^SCHEDULED"
 .I FREQ="" S $P(RTN,U,1,2)="2^NOT RESCHEDULED"
 .; queued to run at
 .S $P(RTN,U,3,4)=$S($P(TSKINFO,U,2)="":"NO DATE",1:$P(TSKINFO,U,2))_$S($D(DAY):" ("_DAY_")",1:"")_U_DOW
 ; rescheduling frequency
 I FREQ?1.3N1A D
 .S $P(RTN,U,5,6)=+FREQ_" "_$S(FREQ["D":"day",FREQ["M":"month",1:FREQ)_$S(+FREQ>1:"s",1:"")_U_FREQ
 E  S $P(RTN,U,5,6)=$S(FREQ="":"UNKNOWN",1:FREQ)_U_FREQ
 ; task id
 S $P(RTN,U,7)=TSK
 ; find if the user is active
 I TSK D
 .S TSKINFO=$G(^%ZTSK(TSK,0))
 .S USER=+$P(TSKINFO,U,3)
 .S ACTV=+$$ACTIVE^XUSER(USER)
 .; queued by
 .S $P(RTN,U,8)=$P($G(^VA(200,USER,0)),U)
 I $G(ACTV) S $P(RTN,U,9)="ACTIVE"
 Q RTN
 ;
VERPTCH(PKG,RTNARRY)    ;-- returns current version and patch status of specified CM package
 ;---------------------------------------------------------------------
 ; input PKG = 'D' for CM TOOLS
 ;             'R' for RUM
 ;             'S' for SAGG
 ; Return array (passed by reference) in format:
 ; output RTNARRY = -1 for error
 ;        RTNARRY(0) = number of routines^total rtns ok^total rtns bad^total rtns missing
 ;        RTNARRY(rtn name) = {0=good 1=bad 2=missing routine}^released version^released patch(es)
 ;                            ... ^site version^site patch(es)^package namespace^missing patch(es)
 ;
 ; This code will reference line tag PTCHINFO^KMP_pkg_UTL for the
 ; following patch information text starting at PTCHINFO+1:
 ;
 ;        ;;routine name ^ current version ^ current patch(es) ^ package namespace
 ;
 ; Example:    
 ;           PATCHINFO  ;-- patch information
 ;                      ;;KMPSGE^1.8^**1,2**^KMPS
 ;                      ;;KMPSUTL^1.8^**1,2**^KMPS
 ;  last line >         ;;
 ;---------------------------------------------------------------------
 ;
 K RTNARRY
 ;
 N BAD,I,INFO,INFOSITE,NEED,OK,OUT,PATREL,PATSITE,PKGNMSPC,PTCH,PTCHSITE,RTN
 N TAG,TOTBAD,TOTMISS,TOTOK,TOTRTN,X,VER,VERSITE
 ;
 I $G(PKG)=""!("DRS"'[$G(PKG))!($L(PKG)'=1) S RTNARRY=-1 Q
 S X="KMP"_PKG_"UTL"
 X ^%ZOSF("TEST") I '$T S RTNARRY=-1 Q
 ;
 S (OUT,TOTBAD,TOTMISS,TOTOK,TOTRTN)=0
 F I=1:1 D  Q:OUT
 .S TAG="PTCHINFO+"_I_"^KMP"_PKG_"UTL"
 .S INFO=$P($T(@TAG),";;",2)
 .I INFO="" S OUT=1 Q
 .S RTN=$P(INFO,U),VER=$P(INFO,U,2),PTCH=$P(INFO,U,3),PKGNMSPC=$P(INFO,U,4)
 .; if routine is missing
 .I $T(@(RTN_"^"_RTN))="" D  Q
 ..S TOTMISS=TOTMISS+1,TOTRTN=TOTRTN+1
 ..S RTNARRY(RTN)="2^"_VER_U_PTCH_"^^"
 .X "ZL @RTN S INFOSITE=$T(+2)"
 .S VERSITE=$P(INFOSITE,";",3),PTCHSITE=$P(INFOSITE,";",5)
 .I VERSITE'=VER!(PTCHSITE'=PTCH) D
 ..S BAD=1,OK=0
 ..S PATSITE=$E(PTCHSITE,3,$L(PTCHSITE)-2)
 ..S PATREL=$E(PTCH,3,$L(PTCH)-2)
 ..S NEED=$P($P(PATREL,PATSITE,2),",",2,9999)
 .E  S BAD=0,OK=1,NEED=""
 .S TOTBAD=TOTBAD+BAD,TOTOK=TOTOK+OK,TOTRTN=TOTRTN+1
 .S RTNARRY(RTN)=BAD_U_VER_U_PTCH_U_VERSITE_U_PTCHSITE_U_PKGNMSPC_U_NEED
 S RTNARRY(0)=TOTRTN_U_TOTOK_U_TOTBAD_U_TOTMISS
 Q
 ;
 
