XUOAAUTL ;SFISC/SO- UTILITIES FOR OAA ;11:04 AM  8 Sep 2005
 ;;8.0;KERNEL;**344,398**;Jul 10, 1995
 ;
SCRN4(IEN) ; Screen for INSITUTION(#4) file
 N DIERR,IENS,FIELDS,Z,ZERR
 S IENS=+IEN_","
 S FIELDS="11;13;101"
 D GETS^DIQ(4,IENS,FIELDS,"IE","Z","ZERR")
 I $D(DIERR) Q 0
 ;Check to see if National
 I Z(4,IENS,11,"I")'="N" Q 0
 ;Check to see if Inactive
 I Z(4,IENS,101,"I") Q 0
 ;Check to see if VAMC or M&ROC or RO-OC
 I Z(4,IENS,13,"E")'="VAMC",Z(4,IENS,13,"E")'="M&ROC",Z(4,IENS,13,"E")'="RO-OC" Q 0  ;8*398
 Q 1
 ;
HLP1 ; VHA TRAINING FACILITY HELP
 W !,"Please choose the AFFILIATED VA facility responsible for administering"
 W !,"this Registered trainee's clinical training program, even though the trainee's"
 W !,"rotation may physically occur a secondary VA site (i.e., OPC, CBOC, etc.)."
 Q
