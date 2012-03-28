ACHSDF1 ; IHS/ITSC/PMF - UNMET NEEDS DATA ENTRY 2/2 ; [ 12/06/2002  10:36 AM ]
 ;;3.1;CONTRACT HEALTH MGMT SYSTEM;**18**;JUN 11, 2001
 ;IHS/SET/GTH ACHS*3.1*5 12/06/2002 - Remove non-standard error recording.
 ;ACHS*3.1*18 6/30/2010;IHS/OIT/ABK;Change every occurrance of Deferred to Unmet Need
 ;
NUMBER ;EP
 ;
 N ACHDDNUM,ACHDDOS,ACHDFY,ACHDMSG,ACHDQTR,ACHDSEQ
 ;
 S ACHDDOS=$$DF^ACHS(0,2)
 S ACHDFY=$$GETFY^ACHSDN(ACHDDOS)
 S ACHDQTR=+$E($P($$FY^ACHS(ACHDFY),U),4,5)
 ;
 ;
 S Y=0
 F X=ACHDQTR:1 S:X=13 X=1 S Y=Y+1 I X=+$E(ACHDDOS,4,5) Q
 S ACHDQTR=$S(Y<4:1,Y<7:2,Y<10:3,1:4)
 S ACHDFY=$S(ACHDFY>50:"19",1:"20")_ACHDFY
 ;
 ;SET THE ZERO NODE OF THE 'SEQUENCE NUMBER BY FISCAL YEAR' SUBFILE 
 I '$D(^ACHSDEF(DUZ(2),1,0)) S ^ACHSDEF(DUZ(2),1,0)=$$ZEROTH^ACHS(9002066,.02)
 I '$D(^ACHSDEF(DUZ(2),1,ACHDFY,0)) S DIC="^ACHSDEF("_DUZ(2)_",1,",DIC(0)="L",(DINUM,X)=ACHDFY K DD,DO D FILE^DICN Q:+Y<1
 S ACHDMSG=0
 I '$$LOCK^ACHS("^ACHSDEF(DUZ(2),1)","+") Q
 ;
SEQ ;
 S ACHDSEQ=+$P($G(^ACHSDEF(DUZ(2),1,ACHDFY,0)),U,2)+1
 S $P(^ACHSDEF(DUZ(2),1,ACHDFY,0),U,2)=ACHDSEQ
 S ACHDDNUM="D"_$E(ACHDFY,4)_ACHDQTR_"-"_ACHD("AREA")_ACHD("FAC")_"-"_ACHDSEQ
 I $D(^ACHSDEF(DUZ(2),"D","B",ACHDDNUM)) S ACHDMSG=ACHDMSG+1 W:ACHDMSG<2 !!,"*** one moment, please ***",!! G SEQ
 I '$$LOCK^ACHS("^ACHSDEF(DUZ(2),1)","-") Q
 ;
 ;ENTER DOCUMENT NUMBER
 I '$$DIE^ACHSDF(".01///"_ACHDDNUM) Q
 ;{ABK,6/30/10}W !!,"This DEFERRED SERVICE has been posted.  The DOCUMENT NUMBER is: ",ACHDDNUM,!!!!
 W !!,"This UNMET NEED has been posted.  The DOCUMENT NUMBER is: ",ACHDDNUM,!!!!
 D RTRN^ACHS
 Q
 ;
SETCK ;EP - Remove INCOMPLETE DEFERRED AND DENIAL  DOCUMENTS AND CHECK SITE PARAMETERS.
 S ACHD="#"
 F  S ACHD=$O(^ACHSDEF(DUZ(2),"D","B",ACHD)) Q:ACHD=""!(ACHD'["#")!($P(ACHD,"#",2)=$P($H,","))  D
 . S ACHDX=0
 . F  S ACHDX=$O(^ACHSDEF(DUZ(2),"D","B",ACHD,ACHDX)) Q:+ACHDX=0  S DIK="^ACHSDEF("_DUZ(2)_",""D"",",DA(1)=DUZ(2),DA=ACHDX D ^DIK W "."
 ;
 ;
 ;REMOVE INCOMPLETE DENIAL DOCUMENTS
 K DA,DIK
 S ACHD="#"
 F  S ACHD=$O(^ACHSDEN(DUZ(2),"D","B",ACHD)) Q:ACHD=""!(ACHD'["#")!($P(ACHD,"#",2)=$P($H,","))  D
 .;
 .;
 . S ACHDX=0
 . F  S ACHDX=$O(^ACHSDEN(DUZ(2),"D","B",ACHD,ACHDX)) Q:+ACHDX=0  S DIK="^ACHSDEN("_DUZ(2)_",""D"",",DA(1)=DUZ(2),DA=ACHDX D ^DIK W "."
 .Q
 ;
 ;CHECK SITE PARAMTERS
 K ACHDX,ACHD("NOTSET"),ACHDXQT,DA,DIK
 ;
 I '$D(^ACHSDENR(DUZ(2),0)) D NOTSET("No 0 NODE IN 'CHS DENIAL FACILITY' file '$D(^ACHSDENR("_DUZ(2)_",0))") Q
 ;
 I '$L($P($G(^ACHSDENR(DUZ(2),0)),U,2)) D
 . N ACHSSTR
 . S ACHSSTR="'FACILITY ABBREVIATION' not entered in 'CHS DENIAL FACILITY' file "
 . S ACHSSTR=ACHSSTR_$P($G(^ACHSDENR(DUZ(2),0)),U,2)
 . ;{ABK,6/30/10}. S ACHSSTR=ACHSSTR_". Try editing this file via Fileman or use the 'Parameters' option in the CHS Denial/Deferred Services menu"
 . S ACHSSTR=ACHSSTR_". Try editing this file via Fileman or use the 'Parameters' option in the CHS Denial/Unmet Needs menu"
 . D NOTSET(ACHSSTR)
 . Q
 ;
 I '$P($G(^AUTTLOC(DUZ(2),0)),U,4) D NOTSET("'AREA' entry missing in 'LOCATION' file $P($G(^AUTTLOC("_DUZ(2)_",0)),U,4)") Q
 ;
 I '$D(^ACHSDENR(DUZ(2),100)) D NOTSET("No 'SERVICE UNIT DIRECTOR' info in 'CHS DENIAL FACILITY' File '$D(^ACHSDENR("_DUZ(2)_",100)) (Use 'Parameters' option).") Q
 ;
 I '$D(^ACHSDENR(DUZ(2),200)) D NOTSET("No 'AREA DIRECTOR' info in 'CHS DENIAL FACILITY' File '$D(^ACHSDENR("_DUZ(2)_",200)) (Use 'Parameters' option).") Q
 ;
 I '$D(^AUTTAREA($P($G(^AUTTLOC(DUZ(2),0)),U,4),0)) D NOTSET("No entry in 'AREA' file for '$D(^AUTTAREA($P($G(^AUTTLOC("_DUZ(2)_",0)),U,4),0)") Q
 ;
 ;
 I $P($G(^AUTTAREA($P($G(^AUTTLOC(DUZ(2),0)),U,4),0)),U,3)="" D NOTSET("No 'PREFIX/REGION' in 'AREA' file for $P($G(^AUTTAREA($P($G(^AUTTLOC("_DUZ(2)_",0)),U,4),0)),U,3)") Q
 ;
 S ACHD("AREA")=$P($G(^AUTTAREA($P($G(^AUTTLOC(DUZ(2),0)),U,4),0)),U,3)
 S ACHD("FAC")=$P($G(^ACHSDENR(DUZ(2),0)),U,2)
 Q
 ;
NOTSET(ACHSMSG) ;
 D VIDEO^ACHS
 W !!,*7,"The " W:$D(IORVON) IORVON W "DENIAL" W:$D(IORVOFF) IORVOFF W " parameters for this site have "
 W:$D(IORVON) IORVON W "not been properly set." W:$D(IORVOFF) IORVOFF
 W !!,$$C^ACHS(ACHSMSG)
 W !!,"Print this screen to a printer."
 W *7,!!,$G(IOBON),$G(IORVON),"Contact your site manager immediately!",$G(IOBOFF),$G(IORVOFF),!!
 ;S ^ACHSERR($H)=ACHSMSG;SET ERROR MESSAGE;IHS/SET/GTH ACHS*3.1*5 12/06/2002
 ;D CLEAN^ACHS("");CLEAN UP ^ACHSERR GLOBAL;IHS/SET/GTH ACHS*3.1*5 12/06/2002
 D RTRN^ACHS
 S ACHD("NOTSET")="",ACHDXQT=1
 Q
 ;
