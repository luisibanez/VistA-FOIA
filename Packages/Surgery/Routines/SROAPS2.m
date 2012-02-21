SROAPS2 ;B'HAM ISC/MAM - PREOP INFO (PAGE 2) ; [ 03/17/04 12:04 PM ]
 ;;3.0; Surgery ;**38,47,125**;24 Jun 93
 S SRPAGE="PAGE: 2 OF 2" D HDR^SROAUTL,PRE2
 W !! F I=1:1:80 W "-"
 Q
PRE2 N SRX,Y S SRA(200)=$G(^SRF(SRTN,200)),SRA(206)=$G(^SRF(SRTN,206))
 S Y=$P(SRA(200),"^",37),SRX=243,SRAO(1)=$$OUT(SRX,Y)_"^"_SRX
 S Y=$P(SRA(200),"^",38),SRX=328,SRAO("1A")=$$OUT(SRX,Y)_"^"_SRX
 S Y=$P(SRA(200),"^",39),SRX=211,SRAO("1B")=$$OUT(SRX,Y)_"^"_SRX
 S Y=$P(SRA(200),"^",18),SRX=210,SRAO(2)=$$OUT(SRX,Y)_"^"_SRX
 S Y=$P(SRA(200),"^",44),SRX=245,SRAO(3)=$$OUT(SRX,Y)_"^"_SRX
 S Y=$P(SRA(200),"^",19),SRX=332,SRAO("2A")=$$OUT(SRX,Y)_"^"_SRX
 S Y=$P(SRA(200),"^",21),SRX=333,SRAO("2B")=$$OUT(SRX,Y)_"^"_SRX
 S Y=$P(SRA(200),"^",22),SRX=398,SRAO("2I")=$$OUT(SRX,Y)_"^"_SRX
 S Y=$P(SRA(200),"^",23),SRX=399,SRAO("2H")=$$OUT(SRX,Y)_"^"_SRX
 S Y=$P(SRA(200),"^",24),SRX=400,SRAO("2C")=$$OUT(SRX,Y)_"^"_SRX
 S Y=$P(SRA(200),"^",25),SRX=334,SRAO("2D")=$$OUT(SRX,Y)_"^"_SRX
 S Y=$P(SRA(200),"^",26),SRX=335,SRAO("2E")=$$OUT(SRX,Y)_"^"_SRX
 S Y=$P(SRA(200),"^",27),SRX=336,SRAO("2F")=$$OUT(SRX,Y)_"^"_SRX
 S Y=$P(SRA(200),"^",29),SRX=401,SRAO("2G")=$$OUT(SRX,Y)_"^"_SRX
 S Y=$P(SRA(200),"^",45),SRX=338,SRAO("3A")=$$OUT(SRX,Y)_"^"_SRX
 S Y=$P(SRA(200),"^",46),SRX=218,SRAO("3B")=$$OUT(SRX,Y)_"^"_SRX
 S Y=$P(SRA(200),"^",47),SRX=339,SRAO("3C")=$$OUT(SRX,Y)_"^"_SRX
 S Y=$P(SRA(200),"^",48),SRX=215,SRAO("3D")=$$OUT(SRX,Y)_"^"_SRX
 S Y=$P(SRA(200),"^",49),SRX=216,SRAO("3E")=$$OUT(SRX,Y)_"^"_SRX
 S Y=$P(SRA(200),"^",50),SRX=217,SRAO("3F")=$$OUT(SRX,Y)_"^"_SRX
 S Y=$P(SRA(206),"^",3),SRX=338.1,SRAO("3G")=$$OUT(SRX,Y)_"^"_SRX
 S Y=$P(SRA(206),"^",4),SRX=338.2,SRAO("3H")=$$OUT(SRX,Y)_"^"_SRX
 S Y=$P(SRA(206),"^",8),SRX=218.1,SRAO("3I")=$$OUT(SRX,Y)_"^"_SRX K SRA
 W !,"1. RENAL:",?35,$P(SRAO(1),"^"),?40,"3. NUTRITIONAL/IMMUNE/OTHER:",?76,$P(SRAO(3),"^")
 W !,"  A. Acute Renal Failure:",?35,$P(SRAO("1A"),"^"),?40,"  A. Disseminated Cancer:",?76,$P(SRAO("3A"),"^")
 W !,"  B. Currently on Dialysis:",?35,$P(SRAO("1B"),"^"),?40,"  B. Open Wound:",?76,$P(SRAO("3B"),"^")
 W !,?40,"  C. Steroid Use for Chronic Cond.:",?76,$P(SRAO("3C"),"^")
 W !,"2. CENTRAL NERVOUS SYSTEM:",?35,$P(SRAO(2),"^"),?40,"  D. Weight Loss > 10%:",?76,$P(SRAO("3D"),"^")
 W !,"  A. Impaired Sensorium: ",?35,$P(SRAO("2A"),"^"),?40,"  E. Bleeding Disorders:",?76,$P(SRAO("3E"),"^")
 W !,"  B. Coma:",?35,$P(SRAO("2B"),"^"),?40,"  F. Transfusion > 4 RBC Units:",?76,$P(SRAO("3F"),"^")
 W !,"  C. Hemiplegia:",?35,$P(SRAO("2C"),"^"),?40,"  G. Chemotherapy W/I 30 Days:",?76,$P(SRAO("3G"),"^")
 W !,"  D. History of TIAs:",?35,$P(SRAO("2D"),"^"),?40,"  H. Radiotherapy W/I 90 Days:",?76,$P(SRAO("3H"),"^")
 W !,"  E. CVA/Stroke w. Neuro Deficit:",?35,$P(SRAO("2E"),"^"),?40,"  I. Preoperative Sepsis:",?(79-$L($P(SRAO("3I"),"^"))),$P(SRAO("3I"),"^")
 W !,"  F. CVA/Stroke w/o Neuro Deficit:",?35,$P(SRAO("2F"),"^")
 W !,"  G. Tumor Involving CNS:",?35,$P(SRAO("2G"),"^")
 W !,"  H. Paraplegia:",?35,$P(SRAO("2H"),"^")
 W !,"  I. Quadriplegia:",?35,$P(SRAO("2I"),"^")
 Q
OUT(SRFLD,SRY) ; get data in output form
 N C,Y
 S Y=SRY,C=$P(^DD(130,SRFLD,0),"^",2) D:Y'="" Y^DIQ
 I Y="NO STUDY" S Y="NS "
 Q Y
