DGREGAED ;ALB/DW/PHH - Address Edit API; 9/1/2005
 ;;5.3;Registration;**522,560,658**;Aug 13, 1993
EN(DFN,FLG) ;Entry point
 ;Input: 
 ;  DFN (required) - Interal Entry # of Patient File (#2)
 ;  FLG (optional) - Flags of 1 or 0; if null, 0 is assumed. Details:
 ;    FLG(1) - if 1, let user edit phone numbers (field #.131 and #.132)
 ;    FLG(2) - if 1, dispaly before & after address for user confirmation
 K EASZIPLK
 N DGINPUT
 N I,X,Y
 I $G(DFN)="" Q
 I ($G(DFN)'?.N) Q
 S FLG(1)=$G(FLG(1)),FLG(2)=$G(FLG(2))
 D INPUT(.DGINPUT,DFN)
 I $G(DGINPUT)=-1 Q
 I $G(FLG(2))=1 D COMPARE(.DGINPUT,DFN)
 I '$$CONFIRM() W !,"Change aborted." D EOP Q
 N DGPRIOR
 D GETPRIOR^DGADDUTL(DFN,.DGPRIOR)
 D SAVE(.DGINPUT,DFN)
 I +$G(DGNEW) Q
 Q:'$$FILEYN^DGADDUTL(.DGPRIOR,.DGINPUT)
 D GETUPDTS^DGADDUTL(DFN,.DGINPUT)
 D UPDADDLG^DGADDUTL(DFN,.DGPRIOR,.DGINPUT)
 Q
INPUT(DGINPUT,DFN) ;Let user input address changes
 ;Output: DGINPUT(field#)=external^internal(if any)
 N DIR,X,Y,DA,DGR,DTOUT,DUOUT,DIROUT,DGN,POP
 S POP=0
 F DGN=.111,.112,.113,.1112,.131,.132,.121 Q:POP  D
 . I ($G(DGINPUT(.111))="")&((DGN=.112)!(DGN=.113)) Q
 . I ($G(DGINPUT(.112))="")&(DGN=.113) Q
 . I ($G(FLG(1))'=1)&((DGN=.131)!(DGN=.132)) Q
 . I DGN=.1112 D  Q
 .. D EN^DGREGAZL(.DGR,DFN)
 .. I $G(DGR)=-1 S POP=1 Q
 .. N DGM F DGM=.1112,.114,.115,.117 S DGINPUT(DGM)=$G(DGR(DGM))
AGN . S DIR(0)=2_","_DGN
 . S DA=DFN
 . D ^DIR
 . I $D(DTOUT) S POP=1 Q
 . I $D(DUOUT)!$D(DIROUT) D UPCT G AGN
 . I DGN'=.121 S DGINPUT(DGN)=$G(Y)
 . I DGN=.121 D
 .. I $P($G(Y),U)=$$GET1^DIQ(2,DFN_",",DGN,"I") D
 ... S DGINPUT(DGN)=$$GET1^DIQ(2,DFN_",",DGN)_U_$P($G(Y),U)
 .. I $P($G(Y),U)'=$$GET1^DIQ(2,DFN_",",DGN,"I") D
 ... S DGINPUT(DGN)=$P($G(Y(0)),U)_U_$G(Y)
 I $G(POP)=1 S DGINPUT=-1
 Q
COMPARE(DGINPUT,DFN) ;Display before & after address fileds.
 N DGCURR,DGN,DGCMP,DGM,DGCNTY,DGCIEN,DGST
 D GETS^DIQ(2,DFN_",",".111;.112;.113;.114;.115;.117;.1112;.131;.132;.121","EI","DGCURR")
 F DGN=.111,.112,.113,.114,.115,.117,.1112,.131,.132,.121 D
 . S DGCMP("OLD",DGN)=$G(DGCURR(2,DFN_",",DGN,"E"))
 S DGCIEN=$G(DGCURR(2,DFN_",",.117,"I"))
 S DGST=$G(DGCURR(2,DFN_",",.115,"I"))
 S DGCNTY=$$CNTY^DGREGAZL(DGST,DGCIEN)
 I DGCNTY=-1 S DGCNTY=""
 S DGCMP("OLD",.117)=$P(DGCNTY,U)_" "_$P(DGCNTY,U,3)
 M DGCMP("NEW")=DGINPUT
 S DGCNTY=$P($G(DGCMP("NEW",.117)),U)_" "_$P($G(DGCMP("NEW",.117)),U,3)
 S DGCMP("NEW",.117)=DGCNTY
 I ($L(DGCMP("NEW",.1112))>5)&($P(DGCMP("NEW",.1112),"-",2)="") S DGCMP("NEW",.1112)=$E(DGCMP("NEW",.1112),1,5)_"-"_$E(DGCMP("NEW",.1112),6,9)
 F DGM="OLD","NEW" D
 . W !,?2,"[",DGM," ADDRESS]"
 . W ?16,$P($G(DGCMP(DGM,.111)),U)
 . I $P($G(DGCMP(DGM,.112)),U)'="" W !,?16,$P($G(DGCMP(DGM,.112)),U)
 . I $P($G(DGCMP(DGM,.113)),U)'="" W !,?16,$P($G(DGCMP(DGM,.113)),U)
 . W !,?16,$P($G(DGCMP(DGM,.114)),U)
 . W:($P($G(DGCMP(DGM,.114)),U)'="")!($P($G(DGCMP(DGM,.115)),U)'="") ","
 . W $P($G(DGCMP(DGM,.115)),U)
 . W " ",$G(DGCMP(DGM,.1112))
 . I $P($G(DGCMP(DGM,.117)),U)'="" W !,?6,"  County: ",$P($G(DGCMP(DGM,.117)),U)
 . I $G(FLG(1))=1 D
 .. W !,?6,"   Phone: ",?16,$P($G(DGCMP(DGM,.131)),U)
 .. W !,?6,"  Office: ",?16,$P($G(DGCMP(DGM,.132)),U)
 . W !,?6,"Bad Addr: ",?16,$P($G(DGCMP(DGM,.121)),U)
 . W !
 Q
CONFIRM() ;Confirm if user wants to save the change
 N DIR,X,Y,DTOUT,DUOUT,DIROUT
 S DIR(0)="Y"
 S DIR("A")="Are you sure that you want to save the above changes"
 S DIR("?")="Please answer Y for YES or N for NO."
 D ^DIR
 I $D(DTOUT)!($G(Y)=0) Q 0
 I $D(DUOUT)!$D(DIROUT) Q 0
 Q 1
SAVE(DGINPUT,DFN) ;Save changes
 N DGN,DGER,DGM
 S DGER=0
 F DGN=.111,.112,.113,.131,.132,.1112,.114,.115,.117,.121 D
 . I ($G(FLG(1))'=1)&((DGN=.131)!(DGN=.132)) Q
 . N DGCODE,DGNAME,FDA,MSG
 . S DGCODE=$P($G(DGINPUT(DGN)),U,2)
 . S DGNAME=$P($G(DGINPUT(DGN)),U)
 . S FDA(2,DFN_",",DGN)=$S(DGCODE:DGCODE,1:DGNAME)
 . D FILE^DIE($S(DGCODE:"",1:"E"),"FDA","MSG")
 . I $D(MSG) D
 .. S DGM="",DGER=1
 .. W !,"Please review the saved changes!!",!
 .. F  S DGM=$O(MSG("DIERR",1,"TEXT",DGM)) Q:DGM=""  D
 ... W $G(MSG("DIERR",1,"TEXT",DGM))
 I $G(DGER)=0 W !,"Change saved."
 D EOP
 Q
EOP ;End of page prompt
 N DIR,DTOUT,DUOUT,DIROUT,X,Y
 S DIR(0)="E"
 S DIR("A")="Press ENTER to continue"
 D ^DIR
 Q
UPCT ;Indicate "^" or "^^" are unacceptable inputs.
 W !,"EXIT NOT ALLOWED ??"
 Q
