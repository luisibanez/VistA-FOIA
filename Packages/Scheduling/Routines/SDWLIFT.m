SDWLIFT ;IOFO BAY PINES/OG - INTER-FACILITY TRANSFER: CONTROL RESPONSES;Compiled March 29, 2005 15:36:25
 ;;5.3;Scheduling;**415**;AUG 13 1993
 ;
 ;******************************************************************
 ;                             CHANGE LOG
 ;
 ;   DATE                        PATCH                   DESCRIPTION
 ;   ----                        -----                   -----------
 ;
MSGSVR ;xfer message server
 ;variables provided by server XQ*
 ;XQSOP : server option name
 ;XQMSG : server request message number
 ;XQSND : DUZ of sender
 ;XQSUB : subject
 ;SDMSG : local array of message lines
 N SDWLMSG
 I $E(XQSUB,1,3)="RE:" Q  ;quit for messages that are replies to original
 I XQSUB="SDWL TRANSFER REQUEST" D MSGSVRRQ^SDWLIFT0 Q  ;transfer request
 I XQSUB="SDWL TRANSFER ACKNOWLEDGEMENT" D MSGSVRAR Q  ;acknowledge request from receiving facility
 I XQSUB="SDWL TRANSFER REMOVAL REQUEST" D MSGSVRRM^SDWLIFT0 Q  ;remove request
 I XQSUB="SDWL TRANSFER REMOVAL REQUEST ACKNOWLEDGEMENT" D MSGSVRRA Q  ;remove request acknowledgement
 I XQSUB="SDWL TRANSFER ACCEPTANCE" D MSGSVRAC Q  ;transaction accepted.
 I XQSUB="SDWL TRANSFER REJECTION" D MSGSVRRJ Q  ;transaction rejected.
 S SDWLMSG(1,0)="Message received by S.SDWL-XFER-SERVER option has an unrecognized message subject"
 D ERR(.SDWLMSG)
 Q
MSGSVRAR ;Acknowledge request
 N DIE,DA,DR,DIC,D,X,SDWLX,SDWLI,SDWLMSG,TMP
 D RMSG
 S SDWLI=$O(SDWLMSG(1),-1)  ;There's stuff between 0 and 1
 F  S SDWLI=$O(SDWLMSG(SDWLI)) Q:'SDWLI  S SDWLX($P(SDWLMSG(SDWLI,0),U))=$P(SDWLMSG(SDWLI,0),U,3)
 S DIC(0)="",DIC="^SDWL(409.35,",X="`"_SDWLX(.5) D ^DIC
 ;If the transfer entry still exists (and still belongs to this request), set to RECEIVED and quit
 I Y'=-1 I SDWLX(2)=$$GET1^DIQ(409.35,SDWLX(.5),2,"I") S DIE=DIC,DA=SDWLX(.5),DR="3///R;6///"_SDWLX(6) D ^DIE Q
 ;otherwise, send a removal request back
 D SEND^SDWLIFT4(SDWLX(6),$$GET1^DIQ(4,$$FIND1^DIC(4,"","X",SDWLX(1),"D"),60)) Q
 Q
MSGSVRRA ;Removal acknowledgement
 N SDWLX,SDWLNM,SDWLIFTN,SDWLSTN,SDWLINST,DIE,DA,DR,XMY,XMSUB,XMTEXT,XMDUZ,XMMG
 D RMSG
 S DIE=409.35,DA=$P(SDWLMSG(1,0),U,3)
 D GETS^DIQ(DIE,DA_",",".01;6",,"TMP")
 Q:'$D(TMP(DIE,DA_",",.01))  ;Already removed
 S SDWLNM=TMP(DIE,DA_",",.01)  ;Patient name
 S SDWLIFTN=TMP(DIE,DA_",",6)  ;Receiving facility's request id
 S SDWLSTN=$$GET1^DIQ(DIE,DA,1)
 S SDWLINST=$$FIND1^DIC(4,"","X",SDWLSTN,"D")
 S DA=$P(SDWLMSG(1,0),U,3),DIK="^SDWL(409.35," D ^DIK
 S XMY("G.SDWL-TRANSFER-ADMIN")="",XMSUB="INTER-FACILITY XFER: Removal of cancelled request",XMTEXT="SDWLX(",XMDUZ="POSTMASTER"
 S SDWLX(0)=1,SDWLX(SDWLX(0),0)="The request to transfer "_SDWLNM_" to "_$$GET1^DIQ(4,SDWLINST,.01)_" ("_SDWLSTN_") has been recalled."
 D:$L(SDWLX(SDWLX(0),0))>80 COL80(.SDWLX)
 S SDWLX(0)=SDWLX(0)+1,SDWLX(SDWLX(0),0)="",SDWLX(0)=SDWLX(0)+1,SDWLX(SDWLX(0),0)="The details have been removed from the system."
 D ^XMD
 I $G(XMMG)["Error" S SDWLMSG(0)=1,SDWLMSG(1,0)="Message aborted with the following error: "_XMMG D ERR(.SDWLMSG)
 Q
MSGSVRAC ;Acceptance notification.
 N TMP,DIE,DA,DR,XMY,XMSUB,XMTEXT,XMDUZ,XMMG,SDWLDUZ,SDWLINST,SDWLNM,SDWLX,SDWLTXT,SDWLMSG
 D RMSG
 S DIE=409.35,DA=$P(SDWLMSG(1,0),U,3),DR="3///A;7///"_$P(SDWLMSG(2,0),U,3) D ^DIE
 S SDWLSTN=$$GET1^DIQ(409.35,DA,1),SDWLINST=$$FIND1^DIC(4,"","X",SDWLSTN,"D"),SDWLNM=$$GET1^DIQ(409.35,DA,.01)
 D GETS^DIQ(409.35,DA,".01;4","I","TMP")
 S SDWLDUZ=TMP(409.35,DA_",",4,"I"),DIE("NO^")="NO EDITING"  ;Disposition the EWL entry.
 S DIE="^SDWL(409.3,",DA=TMP(409.35,DA_",",.01,"I"),DR="19////^S X=DT;20////^S X=SDWLDUZ;21////^S X=""TR"";23////^S X=""C""" D ^DIE
 S XMY("G.SDWL-TRANSFER-ADMIN")="",XMSUB="INTER-FACILITY XFER: Request accepted",XMTEXT="SDWLX(",XMDUZ="POSTMASTER"
 S SDWLX(0)=1,SDWLX(SDWLX(0),0)="The request to transfer "_SDWLNM_" to "_$$GET1^DIQ(4,SDWLINST,.01)_" ("_SDWLSTN_") has been accepted by the receiving facility."
 D:$L(SDWLX(SDWLX(0),0))>80 COL80(.SDWLX)
 S SDWLX(0)=SDWLX(0)+1,SDWLX(SDWLX(0),0)="",SDWLX(0)=SDWLX(0)+1,SDWLX(SDWLX(0),0)="The status has been updated and can be viewed in SDWL TRANSFER REQUEST"
 D ^XMD
 I $G(XMMG)["Error" S SDWLMSG(0)=1,SDWLMSG(1,0)="Message aborted with the following error: "_XMMG D ERR(.SDWLMSG)
 Q
MSGSVRRJ ;Rejection notification.
 N DIE,DA,DR,SDWLX,SDWLINST,SDWLNM,SDWLTXT,SDWLMSG,XMY,XMSUB,XMTEXT,XMDUZ,XMMG
 D RMSG
 S DIE=409.35,DA=$P(SDWLMSG(1,0),U,3),SDWLSTN=$$GET1^DIQ(DIE,DA,1),SDWLINST=$$FIND1^DIC(4,"","X",SDWLSTN,"D"),SDWLNM=$$GET1^DIQ(DIE,DA,.01)
 S DR="3///X" D ^DIE
 S XMY("G.SDWL-TRANSFER-ADMIN")=""
 S XMSUB="INTER-FACILITY XFER: Request declined",XMTEXT="SDWLX(",XMDUZ="POSTMASTER"
 S SDWLX(0)=1,SDWLX(SDWLX(0),0)="The request to transfer "_SDWLNM_" to "_$$GET1^DIQ(4,SDWLINST,.01)_" ("_SDWLSTN_") has been rejected by the receiving facility."
 D:$L(SDWLX(SDWLX(0),0))>80 COL80(.SDWLX)
 S SDWLX(0)=SDWLX(0)+1,SDWLX(SDWLX(0),0)="",SDWLX(0)=SDWLX(0)+1,SDWLX(SDWLX(0),0)="The status has been updated and can be viewed in, SDWL TRANSFER REQUEST"
 D ^XMD
 I $G(XMMG)["Error" S SDWLMSG(0)=1,SDWLMSG(1,0)="Message aborted with the following error: "_XMMG D ERR(.SDWLMSG)
 Q
COL80(SDWLX) ;Stop lines going over 80 columns.
 N SDWLF
 S SDWLF(1)=0
 F  S SDWLF(1)=$F(SDWLX(SDWLX(0),0)," ",SDWLF(1)) Q:SDWLF(1)>81!'SDWLF(1)  S SDWLF(0)=SDWLF(1)
 S SDWLX(SDWLX(0)+1,0)=$E(SDWLX(SDWLX(0),0),SDWLF(0),$L(SDWLX(SDWLX(0),0)))
 S SDWLX(SDWLX(0),0)=$E(SDWLX(SDWLX(0),0),1,SDWLF(0)-2),SDWLX(0)=SDWLX(0)+1
 Q
RMSG ;load message into local array
 M SDWLMSG=^XMB(3.9,XQMSG,2)
 Q
ERR(SDWLX) ;send error message to developer
 N XMSUB,XMY,XMTEXT,XMDUZ,SDWLMSG,SDWLI
 S XMY("G.SDWL-TRANSFER-ADMIN")="",XMSUB="Error from S.SDWL-XFER Server",XMTEXT="SDWLMSG(",XMDUZ="POSTMASTER"
 S SDWLMSG(1,0)="      Forum Message #: "_XQMSG
 S SDWLMSG(2,0)="Sender's Mail Address: "_XQSND
 S SDWLMSG(3,0)="              Subject: "_XQSUB
 S SDWLMSG(4,0)="",SDWLMSG(0)=4
 F SDWLI=1:1:SDWLX(0) S SDWLMSG(0)=SDWLMSG(0)+1,SDWLMSG(SDWLMSG(0),0)=SDWLX(SDWLI,0)
 D ^XMD
 Q
GETTN(SDWLINFO) ;Get transfer id.
 N LAST,DIR,Y
 S LAST=$O(SDWLINFO(":"),-1)
 I 'LAST S DIR(0)="Y",DIR("A")="No entries. OK",DIR("B")="YES" D ^DIR Q 0
 I LAST=1 S Y=1  ;If there is only one, don't ask.
 E  S DIR(0)="L^1:"_LAST,DIR("A")="Which entry?" D ^DIR
 Q $G(SDWLINFO(+Y,1),0)
EXMNU Q
ENMNU Q
