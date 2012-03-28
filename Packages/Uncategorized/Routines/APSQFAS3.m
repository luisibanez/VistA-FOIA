APSQFAS3 ;IHS/ASDS/ENM/POC - ASKS REST OF QUESTIONS FOR FAST RX ORDER ENTRY  
 ;;6.0;IHS PHARMACY MODIFICATIONS;**3**;FEB 20, 2001
START ;EP
 M PSONEW=APSQSAVE ;FOR LOOP FROM APSQFAS1
 S (PSONEW("DFLG"),PSONEW("FIELD"),PSONEW1)=0
 ;
 ;IHS/OKCAO/POC FAST OPTION
3 S PSONEW("FLD")=3 D ^APSQFAS4 ; Get drug and related information
 G:PSONEW("DFLG") END G:PSONEW("FIELD") @PSONEW("FIELD")
 ;
4 ;S PSONEW("FLD")=4 D SIG^PSODIR1(.PSONEW) ; Get Rx directions
 S PSONEW("SIG")=$G(APSQF(3,"I")) ;IHS/OKCAO/POC FAST OPTION
 G:PSONEW("DFLG") END G:PSONEW("FIELD") @PSONEW("FIELD")
 ;
5 ;S PSONEW("FLD")=5 D QTY^PSODIR1(.PSONEW) ; Get quantity
 S PSONEW("QTY")=$G(APSQF(4,"I"))
 G:PSONEW("DFLG") END G:PSONEW("FIELD") @PSONEW("FIELD")
 ;
 ;I $P($G(PSOPAR),"^",15) S PSONEW("FLD")=6 D COPIES^PSODIR1(.PSONEW) ; Get label copies
6 I $P($G(PSOPAR),"^",15) S PSONEW("COPIES")=$G(APSQF(5,"I")) ;Get label copies
 G:PSONEW("DFLG") END G:PSONEW("FIELD") @PSONEW("FIELD")
 ;
7 ;S PSONEW("FLD")=7 D DAYS^PSODIR1(.PSONEW) ; Get days supply
 S PSONEW("DAYS SUPPLY")=$G(APSQF(6,"I"))
 G:PSONEW("DFLG") END G:PSONEW("FIELD") @PSONEW("FIELD")
 ;
8 ;S PSONEW("FLD")=8 D REFILL^PSODIR1(.PSONEW) ; Get # of refills
 S PSONEW("# OF REFILLS")=$G(APSQF(7,"I"))
 G:PSONEW("DFLG") END G:PSONEW("FIELD") @PSONEW("FIELD")
 ;
 ;IHS/DSD/ENM Chronic Med Lookup ; 10/04/94
09 ;S PSONEW("FLD")=09 D CM^PSODIR1(.PSONEW) ;Ask Chronic Med Data
 S PSONEW("CM")=$G(APSQF(8,"I"))
 G:PSONEW("DFLG") END G:PSONEW("FIELD") @PSONEW("FIELD")
 ;
13 ;S PSONEW("FLD")=13 D RMK^PSODIR2(.PSONEW) ; Get Remarks
 S PSONEW("REMARKS")=$G(APSQF(9,"I"))
 G:PSONEW("DFLG") END G:PSONEW("FIELD") @PSONEW("FIELD")
 ;
END ;
 K PSONEW1
 Q
 ;
JUMP ;
 ;IHS/DSD/ENM 10/05/94 9999999.02:09=CHRONIC MED FIELD ADDED TO NEXT LINE
 S PSONEW("FIELD")=$S(+Y=.01:1,+Y=3:2,+Y=6:3,+Y=10:4,+Y=7:5,+Y=10.6:6,+Y=8:7,+Y=9:8,+Y=4:9,+Y=29:10,+Y=5:11,+Y=11:12,+Y=12:13,+Y=1:14,+Y=22:15,+Y=16:16,+Y=9999999.02:"09",1:PSONEW("FLD"))
 I PSONEW("FIELD")>PSONEW("FLD") W !,*7,"Cannot jump ahead ..",! S PSONEW("FIELD")=PSONEW("FLD")
 Q
