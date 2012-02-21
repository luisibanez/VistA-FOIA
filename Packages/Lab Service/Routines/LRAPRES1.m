LRAPRES1 ;DALOI/WTY/KLL - AP ESIG RELEASE REPORT/ALERT;11/13/01
 ;;5.2;LAB SERVICE;**259,336**;Sep 27, 1994
 ;
 ;Reference  to FILE^TIUSRVP supported by IA #3540
 ;Reference  to ^TIULQ supported by IA #2693 
 ;
MAIN(LRDFN,LRSS,LRI,LRSF,LRP,LRAC) ;Main subroutine
 Q:'$D(LRDFN)!('$D(LRSS))!('$D(LRP))!('$D(LRAC))
 N LRDOCS,LRMSG,XQA,LRC,LRDOCSN,LRNUM,LRADL,LRMORE,LRQUIT
 N DIR,DIRUT,DTOUT,DUOUT,X,Y,DIC,XQA,XQAMSG
 S LRQUIT=0
 D ASK
 Q:LRQUIT
 D MORE
 Q:LRQUIT
 D:LRMORE LOOKUP
 D ALERT
 Q
ASK ;Ask if alert is to be sent
 W !
 S DIR(0)="Y",DIR("B")="NO"
 S DIR("A")="Do you wish to send an alert"
 S DIR("??")="^D AHELP^LRAPRES1"
 D ^DIR
 I 'Y S LRQUIT=1 Q
 S:$G(LRSF)="" LRSF=63
 D GETDOCS^LRAPUTL(.LRDOCS,LRDFN,LRSS,$G(LRI),LRSF)
 S:LRDOCS(1)=LRDOCS(2) LRDOCS(2)=0
 S LRQUIT=1
 F LRC=1:1:2 D
 .I LRDOCS(LRC) D
 ..S LRQUIT=0
 ..S X=LRDOCS(LRC) D D^LRUA S LRDOCSN(LRC)=X
 ..I LRDOCSN(LRC)'="" S XQA(LRDOCS(LRC))=""
 ;Q:LRQUIT
 S LRNUM=1
 K LRMSG
 I 'LRQUIT D
 .S LRMSG(LRNUM)="Alert will be sent to:",LRMSG(LRNUM,"F")="!!"
 .I LRDOCS(1) D
 ..S LRNUM=LRNUM+1,LRMSG(LRNUM)=LRDOCSN(1),LRMSG(LRNUM,"F")="?24"
 .I LRDOCS(2) D
 ..S LRNUM=LRNUM+1,LRMSG(LRNUM)=LRDOCSN(2)
 ..S LRMSG(LRNUM,"F")=$S(LRDOCS(1):"!",1:"")_"?24"
 I LRQUIT D
 .S LRMSG(LRNUM)="No Physician or PCP selected for alert"
 .S LRMSG(LRNUM,"F")="!!"
 .S LRQUIT=0
 D EN^DDIOL(.LRMSG)
 Q
MORE ;Add names or mail groups to the lookup list?
 W !
 S LRMORE=1
 S DIR(0)="Y",DIR("B")="NO"
 S DIR("A")="Send the alert to additional names or mail groups"
 D ^DIR
 I Y=0 S LRMORE=0 Q
 I $D(DUOUT)!($D(DTOUT)) S LRQUIT=1
 Q
LOOKUP ;Add additional names or mail groups to alert list.
 F  D  Q:LRQUIT
 .W !
 .K DIR
 .;S DIR(0)="F^3:30^I X'?1""U."".E&(X'?1""G."".E) K X"
 .S DIR(0)="F^3:30^I X["".""&(X'?1""G."".E) K X"
 .S DIR("A")="Enter name or mail group"
 .S DIR("?")="Enter lastname,firstname OR G.mailgroup OR ^ to exit"
 .D ^DIR
 .I $D(DUOUT)!($D(DTOUT)) S LRQUIT=1 Q
 .S X=Y,LRADL=""
 .I Y["." S LRADL=$P(Y,"."),X=$P(Y,".",2)
 .K DIC
 .S DIC(0)="QEZ"
 .S DIC=$S(LRADL="G":3.8,1:200)
 .D ^DIC
 .Q:Y=-1
 .S:LRADL="" XQA($P(Y,"^"))=""
 .S:LRADL="G" XQA("G."_$P(Y,"^",2))=""
 .K LRMSG
 .S LRMSG=$S(LRADL="G":"Mail group ",1:"User ")_$P(Y,"^",2)
 .S LRMSG=LRMSG_" added to alert list."
 .D EN^DDIOL(LRMSG,"","!!")
 Q
ALERT ;Send the alert
 S XQAMSG="Pathology report signed for "_LRAC_" - "_$E(LRP,1,30)
 D SETUP^XQALERT
 S LRMSG="Alerts have been sent."
 D EN^DDIOL(LRMSG,"","!!")
 K LRMSG
 Q
AHELP ;Help Frame
 K LRMSG
 S LRMSG(1)="If answered 'Yes', the alert will notify the primary care"
 S LRMSG(1,"F")="!"
 S LRMSG(2)="provider  and  the surgeon/physician that this report has"
 S LRMSG(3)="been  electronically  signed  and  is  now  available for"
 S LRMSG(4)="viewing.   You will also have the opportunity to send the"
 S LRMSG(5)="alert to additional names or mail groups."
 D EN^DDIOL(.LRMSG)
 Q
RETRACT(LRDFN,LRSS,LRI,LRTIUPTR) ;
 ;Change prior TIU versions of report to RETRACTED status
 N LRROOT,LRIENS,LRFILE,LRTIUP,LRTIUAR,LRERR,LRSTAT,LRTIUX,LREXRR
 I LRSS=""!("AUSPEMCY"'[LRSS) S LRPTR=0 Q
 I LRSS="AU" D
 .S LRROOT="^LR(LRDFN,101,""C""",LRIENS=LRDFN_","
 .S LRFILE=63.101
 I LRSS'="AU" D
 .S LRROOT="^LR(LRDFN,LRSS,LRI,.05,""C"""
 .S LRIENS=LRI_","_LRDFN_","
 .S LRFILE=$S(LRSS="SP":63.19,LRSS="CY":63.47,LRSS="EM":63.49,1:"")
 Q:'$D(@(LRROOT_")"))
 S LRTIUP=0,LRTIUX(.05)=15
 F  S LRTIUP=$O(@(LRROOT_",LRTIUP)"))  Q:LRTIUP'>0!(LRTIUP=LRTIUPTR)  D
 .K LRTIUAR S (LRSTAT,LRERR)=0
 .D EXTRACT^TIULQ(LRTIUP,"LRTIUAR",.LRERR,".05",,,"I")
 .Q:+LRERR
 .M LRSTAT=LRTIUAR(LRTIUP,.05,"I")
 .Q:LRSTAT'=7  ;Quit if current status is not COMPLETED
 .D FILE^TIUSRVP(.LREXRR,LRTIUP,.LRTIUX)
 .;Update new TIU version of report with previous TIU pointer value
 .N LREXRR,LRTIUX
 .S LRTIUX(1406)=LRTIUP
 .D FILE^TIUSRVP(.LREXRR,LRTIUPTR,.LRTIUX)
 Q
CLSSCHK(DUZ,LREND) ;Determine if user has the proper class settings and
 ;PROVIDER key
 N LRMSG,LRPRCLSS,LRPCEXP,LRVCDE,LRPCSTR,LRMTCH
 ;First, check for PROVIDER key
 I '$D(^XUSEC("PROVIDER",DUZ)) D  Q
 .K LRMSG S LRMSG=$C(7)_"Electronic signature not authorized.  Missing "
 .S LRMSG=LRMSG_"PROVIDER key."
 .D EN^DDIOL(LRMSG,"","!!")
 .K LRMSG S LREND=1
 ;Next, check the provider class
 S LRPRCLSS=$$GET1^DIQ(200,DUZ_",",53.5)
 ;PROVIDER CL MUST CONTAIN PHYSICIAN, OR CYTOTECH ONLY FOR CY SECTION
 S LRMTCH=0
 I LRPRCLSS'["PHYSICIAN" D
 .I LRPRCLSS'["CYTOTECH" S LRMTCH=1
 .I LRSS'="CY" S LRMTCH=1
 I LRMTCH=1 D  Q
 .K LRMSG
 .S LRMSG(1)=$C(7)_"You are not authorized to electronically sign "
 .S LRMSG(1)=LRMSG(1)_"reports."
 .S LRMSG(1,"F")="!!"
 .S LRMSG(2)="PROVIDER CLASS must include PHYSICIAN,"
 .S LRMSG(2,"F")="!"
 .S LRMSG(3)="  OR CYTOTECHNOLOGIST FOR CY SECTIONS ONLY."
 .S LRMSG(3,"F")="!"
 .D EN^DDIOL(.LRMSG) K LRMSG
 .S LREND=1
 ;Finally, check the person class
 S LRPCSTR=$$GET^XUA4A72(DUZ)   ;Supported reference #1625
 I LRPCSTR<0 D  Q
 .K LRMSG
 .S LRMSG="PERSON CLASS is inactive or undefined.  Electronic signature"
 .S LRMSG=LRMSG_" is not authorized."
 .D EN^DDIOL(LRMSG,"","!!")
 .K LRMSG
 .S LREND=1
 S LRPCEXP=+$P(LRPCSTR,"^",6)
 I LRPCEXP D  Q
 .K LRMSG
 .S LRMSG="PERSON CLASS has expired.  Electronic signature"
 .S LRMSG=LRMSG_" is not authorized."
 .D EN^DDIOL(LRMSG,"","!!") K LRMSG
 .S LREND=1
 S LRVCDE=$P(LRPCSTR,"^",7),LRMTCH=0
 ;CORRECT PERSON CLASS SHOULD MATCH PROVIDER CLASS
 I LRPRCLSS["PHYSICIAN" D
 .I $E(LRVCDE,1,6)="V11370","123568"[+$E(LRVCDE,7) S LRMTCH=1
 .I $E(LRVCDE,1,6)="V11371","03"[+$E(LRVCDE,7) S LRMTCH=1
 .I $E(LRVCDE,1,6)="V18240","124579"[+$E(LRVCDE,7) S LRMTCH=1
 .I LRVCDE="V182413" S LRMTCH=1
 I LRPRCLSS["CYTOTECH" D
 .I LRVCDE="V150113" S LRMTCH=1
 I 'LRMTCH D
 .K LRMSG
 .S LRMSG="Invalid PERSON CLASS.  Electronic Signature is not "
 .S LRMSG=LRMSG_"authorized."
 .D EN^DDIOL(LRMSG,"","!!")
 .K LRMSG
 .S LREND=1
 Q
