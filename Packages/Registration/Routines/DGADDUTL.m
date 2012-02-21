DGADDUTL ;ALB/PHH,EG-PATIENT ADDRESS; 12/06/2005
 ;;5.3;Registration;**658,695**;Aug 13, 1993
 Q
ADDR ; validate/edit Patient address (entry for DG ADDRESS UPDATE option)
 N %,QUIT,DIC,Y,DFN,USERSEL
ADDRLOOP ;
 W !!
 K DIC,Y,DFN,USERSEL
 S DIC="^DPT(",DIC(0)="AEMZQ",DIC("A")="Veteran Name/SSN: " D ^DIC
 I $D(DTOUT)!($D(DUOUT)) Q
 Q:Y'>0
 ;
 S DFN=+Y,QUIT=0
 F  D  Q:QUIT
 .W !!,"Do you want to update the (P)ermanent Address, (T)emporary Address, or (B)oth? "
 .R USERSEL:300
 .I '$T S USERSEL="^"
 .I USERSEL["^"!(USERSEL="") S QUIT=1 Q
 .S USERSEL=$TR(USERSEL,"ptb","PTB")
 .I USERSEL'="P",USERSEL'="T",USERSEL'="B" D  Q
 ..W !,"Invalid selection!"
 .I USERSEL="P"!(USERSEL="B") W ! D UPDATE(DFN,"PERM")
 .I USERSEL="T"!(USERSEL="B") D UPDATE(DFN,"TEMP")
 .S QUIT=1
 G ADDRLOOP
ADD(DFN) ; validate/edit Patient address (entry point for routine DGREG)
 ;         Input  -- DFN
 ;
 N RETVAL,ADDYN
 S (RETVAL,ADDYN)=0
 F  D  Q:ADDYN
 .S ADDYN=$$ADDYN("Do you want to validate/edit the Patient's Address")
 .S RETVAL=ADDYN
 .I ADDYN'=1,ADDYN'=2 S (ADDYN,RETVAL)=0
 .I 'ADDYN W !?5,"Enter 'YES' to validate/edit Patient's Address or 'NO' to continue."
 I ADDYN=1,$G(DFN)'="",$D(^DPT(DFN,0)) D
 .D UPDATE(DFN,"PERM")
 .S RETVAL=1
 Q RETVAL
ADDYN(PROMPT) ; Yes/No Prompt to Edit/Validate Address
 ;         Input  -- None
 ;         Output --  1 = YES
 ;                    2 = NO
 ;                   -1 = Aborted
 ;
 N %
 W !,PROMPT
 D YN^DICN
 Q %
UPDATE(DFN,TYPE) ; Update the Address
 ;         Input  -- TYPE = "PERM" for Permanent Address
 ;                        = "TEMP" for Temporary Address
 ;         Output -- None
 ;         
 I TYPE'="PERM",TYPE'="TEMP" Q
 I TYPE="PERM" D
 .W !
 .N FLG S (FLG(1),FLG(2))=1
 .D ADDRED(DFN,.FLG)
 ;
 I TYPE="TEMP" D
 .D EDITTADR(DFN)
 Q
UPDDTTM(DFN,TYPE) ; Update the PATIENT file #2 with the current date and time
 ;
 N %H,%,X,%Y,%D,%M,%I,ADDDTTM,DIE,DA,DR
 D NOW^%DTC
 S ADDDTTM=%,DIE="^DPT(",DA=DFN
 ;
 ; If it's the Temporary Address, the field is .12113
 ; If not, it should be the Permanent Address and the default field is .118
 S DR=$S(TYPE="TEMP":".12113///^S X=ADDDTTM",1:".118///^S X=ADDDTTM")
 D ^DIE
 Q
ADDRED(DFN,FLG) ; Address Edit (Code copied from DGREGAED and modified)
 ;Input:
 ;  DFN (required) - Interal Entry # of Patient File (#2)
 ;  FLG (optional) - Flags of 1 or 0; if null, 0 is assumed. Details:
 ;    FLG(1) - if 1, let user edit phone numbers (field #.131 and #.132)
 ;    FLG(2) - if 1, display before & after address for user confirmation
 K EASZIPLK
 N DGINPUT,I,X,Y,%
 I $G(DFN)="" Q
 I ($G(DFN)'?.N) Q
 S FLG(1)=$G(FLG(1)),FLG(2)=$G(FLG(2))
 D INPUT^DGREGAED(.DGINPUT,DFN)
 I $G(DGINPUT)=-1 Q
 I $G(FLG(2))=1 D COMPARE^DGREGAED(.DGINPUT,DFN)
 I '$$CONFIRM^DGREGAED() W !,"Change aborted." D EOP^DGREGAED Q
 N DGPRIOR
 D GETPRIOR(DFN,.DGPRIOR)
 D SAVE^DGREGAED(.DGINPUT,DFN)
 Q:'$$FILEYN(.DGPRIOR,.DGINPUT)
 D GETUPDTS(DFN,.DGINPUT)
 D UPDADDLG(DFN,.DGPRIOR,.DGINPUT)
 ; Update the Date/Time Stamp
 D UPDDTTM(DFN,TYPE)
 Q
GETPRIOR(DFN,DGPRIOR) ; Get prior address fields.
 N DGCURR,DGN,DGARRY,DGCIEN,DGST,DGCNTY
 D GETS^DIQ(2,DFN_",",".111;.112;.113;.114;.115;.117;.1112;.131;.132;.121;.118;.119;.12;.122","I","DGCURR")
 F DGN=.111,.112,.113,.114,.115,.117,.1112,.131,.132,.121,.118,.119,.12,.122 D
 . S DGARRY("OLD",DGN)=$G(DGCURR(2,DFN_",",DGN,"I"))
 M DGPRIOR=DGARRY("OLD")
 Q
GETUPDTS(DFN,DGINPUT) ; Get current address fields.
 N DGCURR,DGN,DGARRY
 D GETS^DIQ(2,DFN_",",".118;.119;.12;.122","I","DGCURR")
 F DGN=.118,.119,.12,.122 D
 . S DGARRY("NEW",DGN)=$G(DGCURR(2,DFN_",",DGN,"I"))
 M DGINPUT=DGARRY("NEW")
 Q
FILEYN(DGOLD,DGNEW) ; Determine whether or not to file to #301.7
 N RETVAL
 S RETVAL=0
 D
 .I DGOLD(.111)'=$G(DGNEW(.111)) S RETVAL=1 Q
 .I DGOLD(.112)'=$G(DGNEW(.112)) S RETVAL=1 Q
 .I DGOLD(.114)'=$G(DGNEW(.114)) S RETVAL=1 Q
 .I DGOLD(.115)'=$P($G(DGNEW(.115)),"^",2) S RETVAL=1 Q
 .I DGOLD(.1112)'=$G(DGNEW(.1112)) S RETVAL=1 Q
 .I DGOLD(.117)'=$P($G(DGNEW(.117)),"^",2) S RETVAL=1 Q
 .I DGOLD(.131)'=$G(DGNEW(.131)) S RETVAL=1 Q
 Q RETVAL
UPDADDLG(DFN,DGPRIOR,DGINPUT) ; Update the IVM ADDRESS CHANGE LOG file #301.7
 ;
 N DGDATA
 ; Zero node:
 S DGDATA(.01)=DGINPUT(.118)
 S DGDATA(1)=DFN
 S DGDATA(2)=DGINPUT(.122)
 S DGDATA(3)=DGINPUT(.119)
 S DGDATA(3.5)=DGINPUT(.12)
 ;
 ; One node:
 S DGDATA(4)=DGPRIOR(.118)
 S DGDATA(5)=DGPRIOR(.122)
 S DGDATA(6)=DGPRIOR(.12)
 S DGDATA(7)=DGPRIOR(.119)
 S DGDATA(8)=DGPRIOR(.131)
 S DGDATA(9)=DGPRIOR(.111)
 S DGDATA(10)=DGPRIOR(.112)
 S DGDATA(11)=DGPRIOR(.114)
 S DGDATA(12)=DGPRIOR(.117)
 S DGDATA(13)=DGPRIOR(.115)
 S DGDATA(14)=DGPRIOR(.1112)
 ;
 I $$ADD^DGENDBS(301.7,,.DGDATA) ;
 Q
EDITTADR(DFN) ; Edit Temporary Address
 N DGPRIOR,DGCH,DGRPAN,DGDR,DGRPS
 I $G(DFN)="" Q
 I ($G(DFN)'?.N) Q
 ;
 ; Get the current Temporary Address and display it
 D GETTADR(DFN,.DGPRIOR)
 D DISPTADR(DFN,.DGPRIOR)
 W !!
 ;
 S DGCH=5,DGRPAN="1,2,3,4,5,",DGDR="",DGRPS=1
 D CHOICE^DGRPP
 D ^DGRPE
 ; Update the Date/Time Stamp
 D UPDDTTM(DFN,TYPE)
 Q
GETTADR(DFN,DGPRIOR) ; Get prior temporary address fields.
 N DGCURR,DGN,DGARRY,DGCIEN,DGST,DGCNTY
 D GETS^DIQ(2,DFN_",",".1211;.1212;.1213;.1214;.1215;.1216;.1217;.1218;.12105;.1219;.12111;.12112;.12113;.12114","I","DGCURR")
 F DGN=.1211,.1212,.1213,.1214,.1215,.1216,.1217,.1218,.12105,.1219,.12111,.12112,.12113,.12114 D
 .S DGARRY("OLD",DGN)=$G(DGCURR(2,DFN_",",DGN,"I"))
 M DGPRIOR=DGARRY("OLD")
 Q
DISPTADR(DFN,DGARRY) ; Display Temporary Address
 N DGADRACT,DGADR1,DGADR2,DGADR3,DGCITY,DGSTATE,DGZIP
 N DGCOUNTY,DGPHONE,DGFROMDT,DGTODT
 ;
 S DGADRACT=$G(DGARRY(.12105))
 S DGADR1=$G(DGARRY(.1211))
 S DGADR2=$G(DGARRY(.1212))
 S DGADR3=$G(DGARRY(.1213))
 S DGCITY=$G(DGARRY(.1214))
 S DGSTATE=$G(DGARRY(.1215))
 S DGZIP=$G(DGARRY(.1216))
 S DGCOUNTY=$G(DGARRY(.12111))
 I DGCOUNTY'="",DGSTATE'="",$D(^DIC(5,DGSTATE,1,DGCOUNTY,0)) D
 .S DGCOUNTY=$P(^DIC(5,DGSTATE,1,DGCOUNTY,0),"^")_" ("_$P(^DIC(5,DGSTATE,1,DGCOUNTY,0),"^",4)_")"
 I DGADRACT'="Y" S DGCOUNTY="NOT APPLICABLE"
 I DGSTATE'="",$D(^DIC(5,DGSTATE,0)) S DGSTATE=$P(^DIC(5,DGSTATE,0),"^",2)
 S DGPHONE=$G(DGARRY(.1219))
 S DGFROMDT=$$FMTE^XLFDT($G(DGARRY(.1217)))
 S DGTODT=$$FMTE^XLFDT($G(DGARRY(.1218)))
 ;
 W !!,"Temporary Address: "
 I DGADRACT="Y" D
 .W:DGADR1'="" !?9,DGADR1
 .W:DGADR2'="" !?9,DGADR2
 .W:DGADR3'="" !?9,DGADR3
 .W !?9,$S(DGCITY'="":DGCITY,1:"")_","_$S(DGSTATE'="":DGSTATE,1:"")_" "_$S(DGZIP'="":DGZIP,1:"")
 .W !," County: "_DGCOUNTY
 .W !,"  Phone: "_DGPHONE
 .W !,"From/To: "_$P(DGFROMDT,",")_","_$P(DGFROMDT,", ",2)_"-"_$P(DGTODT,",")_","_$P(DGTODT,", ",2)
 ;
 I $G(DGARRY(.12105))="N" D
 .W:$G(DGARRY(.1211))="" !?9,"NO TEMPORARY ADDRESS"
 .W:$G(DGARRY(.1212))="" !?9,""
 .W !," County: NOT APPLICABLE"
 .W !,"  Phone: NOT APPLICABLE"
 .W !,"From/To: NOT APPLICABLE"
 Q
